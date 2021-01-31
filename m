Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A933B3099FB
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 03:21:53 +0100 (CET)
Received: from localhost ([::1]:54890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l62N6-0005aE-7c
	for lists+qemu-devel@lfdr.de; Sat, 30 Jan 2021 21:21:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l62Ly-00059p-F0
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 21:20:42 -0500
Received: from indium.canonical.com ([91.189.90.7]:60192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l62Lv-0006aq-Po
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 21:20:42 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l62Lt-0003Rk-HT
 for <qemu-devel@nongnu.org>; Sun, 31 Jan 2021 02:20:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 806862E805B
 for <qemu-devel@nongnu.org>; Sun, 31 Jan 2021 02:20:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 31 Jan 2021 02:14:57 -0000
From: Alexander Bulekov <1913914@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: arm fuzzer
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Alexander Bulekov (a1xndr)
Message-Id: <161205929718.32217.11100602487224249758.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1913914] [NEW] arm_gic: Abort in  gic_clear_pending_sgi
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e00fb96b2e64b75333d0178ec15cb78e5aadb64d"; Instance="production"
X-Launchpad-Hash: e4ab28c8971c2af41c6d32b5eaa4c894e42cd5d6
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1913914 <1913914@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Reproducer:
cat << EOF | ./qemu-system-aarch64 \
-machine virt,accel=3Dqtest -qtest stdio
write 0x8000000 0x1 0x02
write 0x8010000 0x1 0x03
write 0x8010004 0x1 0x10
write 0x8000f2f 0x1 0x0
writel 0x8000f00 0x2065559
write 0x8000d56 0x1 0x0
readl 0x801000b
EOF

Stacktrace:
SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../qemu/hw/intc/arm=
_gic.c:173:28 in
../qemu/hw/intc/arm_gic.c:173:28: runtime error: load of misaligned address=
 0x6290000215c1 for type 'uint32_t' (aka 'unsigned int'), which requires 16=
 byte alignment
0x6290000215c1: note: pointer points here
 00 00 00  01 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  20 1c 00 00 80=
 60 00 00  00 00 00 00 00
              ^
SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../qemu/hw/intc/arm=
_gic.c:173:28 in
[R +0.117623] readl 0x8010015
[R +0.117718] readl 0x801000b
qemu-fuzz-aarch64: ../qemu/hw/intc/arm_gic.c:580: uint32_t gic_clear_pendin=
g_sgi(GICState *, int, int): Assertion `s->sgi_pending[irq][cpu] !=3D 0' fa=
iled.
=3D=3D762=3D=3D ERROR: libFuzzer: deadly signal
    #0 0x563d4e2371f1 in __sanitizer_print_stack_trace (/home/alxndr/build-=
asan/qemu-fuzz-aarch64+0x350d1f1)
    #1 0x563d4e182348 in fuzzer::PrintStackTrace() (/home/alxndr/build-asan=
/qemu-fuzz-aarch64+0x3458348)
    #2 0x563d4e167493 in fuzzer::Fuzzer::CrashCallback() (/home/alxndr/buil=
d-asan/qemu-fuzz-aarch64+0x343d493)
    #3 0x7feabe05350f  (/lib/x86_64-linux-gnu/libpthread.so.0+0x1350f)
    #4 0x7feabde8e080 in __libc_signal_restore_set /build/glibc-suXNNi/glib=
c-2.29/signal/../sysdeps/unix/sysv/linux/internal-signals.h:84:10
    #5 0x7feabde8e080 in raise /build/glibc-suXNNi/glibc-2.29/signal/../sys=
deps/unix/sysv/linux/raise.c:48:3
    #6 0x7feabde79534 in abort /build/glibc-suXNNi/glibc-2.29/stdlib/abort.=
c:79:7
    #7 0x7feabde7940e in __assert_fail_base /build/glibc-suXNNi/glibc-2.29/=
assert/assert.c:92:3
    #8 0x7feabde86b91 in __assert_fail /build/glibc-suXNNi/glibc-2.29/asser=
t/assert.c:101:3
    #9 0x563d4eba2a3c in gic_clear_pending_sgi /home/alxndr/build-asan/../q=
emu/hw/intc/arm_gic.c:580:9
    #10 0x563d4eba2a3c in gic_acknowledge_irq /home/alxndr/build-asan/../qe=
mu/hw/intc/arm_gic.c:630:19
    #11 0x563d4ebb4ca4 in gic_cpu_read /home/alxndr/build-asan/../qemu/hw/i=
ntc/arm_gic.c:1615:17
    #12 0x563d4ebab538 in gic_thiscpu_read /home/alxndr/build-asan/../qemu/=
hw/intc/arm_gic.c:1771:12
    #13 0x563d5029ec2d in memory_region_read_with_attrs_accessor /home/alxn=
dr/build-asan/../qemu/softmmu/memory.c:464:9
    #14 0x563d502705f3 in access_with_adjusted_size /home/alxndr/build-asan=
/../qemu/softmmu/memory.c:552:18
    #15 0x563d5026eb44 in memory_region_dispatch_read1 /home/alxndr/build-a=
san/../qemu/softmmu/memory.c
    #16 0x563d5026eb44 in memory_region_dispatch_read /home/alxndr/build-as=
an/../qemu/softmmu/memory.c:1449:9
    #17 0x563d5048c5bf in flatview_read_continue /home/alxndr/build-asan/..=
/qemu/softmmu/physmem.c:2822:23
    #18 0x563d504a9a9b in address_space_read /home/alxndr/qemu/include/exec=
/memory.h:2484:26
    #19 0x563d504a9a9b in qtest_process_command /home/alxndr/build-asan/../=
qemu/softmmu/qtest.c:568:13
    #20 0x563d504a497f in qtest_process_inbuf /home/alxndr/build-asan/../qe=
mu/softmmu/qtest.c:797:9
    #21 0x563d504a46d5 in qtest_server_inproc_recv /home/alxndr/build-asan/=
../qemu/softmmu/qtest.c:904:9
    #22 0x563d50ce5cc8 in qtest_sendf /home/alxndr/build-asan/../qemu/tests=
/qtest/libqtest.c:438:5
    #23 0x563d50ce73a3 in qtest_read /home/alxndr/build-asan/../qemu/tests/=
qtest/libqtest.c:1032:5
    #24 0x563d4e264499 in __wrap_qtest_readl /home/alxndr/build-asan/../qem=
u/tests/qtest/fuzz/qtest_wrappers.c:138:16
    #25 0x563d4e26ee5b in op_read /home/alxndr/build-asan/../qemu/tests/qte=
st/fuzz/generic_fuzz.c:432:13
    #26 0x563d4e26dc46 in generic_fuzz /home/alxndr/build-asan/../qemu/test=
s/qtest/fuzz/generic_fuzz.c:681:17
    #27 0x563d4e261283 in LLVMFuzzerTestOneInput /home/alxndr/build-asan/..=
/qemu/tests/qtest/fuzz/fuzz.c:151:5
    #28 0x563d4e168b51 in fuzzer::Fuzzer::ExecuteCallback(unsigned char con=
st*, unsigned long) (/home/alxndr/build-asan/qemu-fuzz-aarch64+0x343eb51)
    #29 0x563d4e1542c2 in fuzzer::RunOneTest(fuzzer::Fuzzer*, char const*, =
unsigned long) (/home/alxndr/build-asan/qemu-fuzz-aarch64+0x342a2c2)
    #30 0x563d4e159d76 in fuzzer::FuzzerDriver(int*, char***, int (*)(unsig=
ned char const*, unsigned long)) (/home/alxndr/build-asan/qemu-fuzz-aarch64=
+0x342fd76)
    #31 0x563d4e182a32 in main (/home/alxndr/build-asan/qemu-fuzz-aarch64+0=
x3458a32)
    #32 0x7feabde7abba in __libc_start_main /build/glibc-suXNNi/glibc-2.29/=
csu/../csu/libc-start.c:308:16
    #33 0x563d4e12e989 in _start (/home/alxndr/build-asan/qemu-fuzz-aarch64=
+0x3404989)

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: arm fuzzer

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1913914

Title:
  arm_gic: Abort in  gic_clear_pending_sgi

Status in QEMU:
  New

Bug description:
  Reproducer:
  cat << EOF | ./qemu-system-aarch64 \
  -machine virt,accel=3Dqtest -qtest stdio
  write 0x8000000 0x1 0x02
  write 0x8010000 0x1 0x03
  write 0x8010004 0x1 0x10
  write 0x8000f2f 0x1 0x0
  writel 0x8000f00 0x2065559
  write 0x8000d56 0x1 0x0
  readl 0x801000b
  EOF

  Stacktrace:
  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../qemu/hw/intc/a=
rm_gic.c:173:28 in
  ../qemu/hw/intc/arm_gic.c:173:28: runtime error: load of misaligned addre=
ss 0x6290000215c1 for type 'uint32_t' (aka 'unsigned int'), which requires =
16 byte alignment
  0x6290000215c1: note: pointer points here
   00 00 00  01 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  20 1c 00 00 =
80 60 00 00  00 00 00 00 00
                ^
  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../qemu/hw/intc/a=
rm_gic.c:173:28 in
  [R +0.117623] readl 0x8010015
  [R +0.117718] readl 0x801000b
  qemu-fuzz-aarch64: ../qemu/hw/intc/arm_gic.c:580: uint32_t gic_clear_pend=
ing_sgi(GICState *, int, int): Assertion `s->sgi_pending[irq][cpu] !=3D 0' =
failed.
  =3D=3D762=3D=3D ERROR: libFuzzer: deadly signal
      #0 0x563d4e2371f1 in __sanitizer_print_stack_trace (/home/alxndr/buil=
d-asan/qemu-fuzz-aarch64+0x350d1f1)
      #1 0x563d4e182348 in fuzzer::PrintStackTrace() (/home/alxndr/build-as=
an/qemu-fuzz-aarch64+0x3458348)
      #2 0x563d4e167493 in fuzzer::Fuzzer::CrashCallback() (/home/alxndr/bu=
ild-asan/qemu-fuzz-aarch64+0x343d493)
      #3 0x7feabe05350f  (/lib/x86_64-linux-gnu/libpthread.so.0+0x1350f)
      #4 0x7feabde8e080 in __libc_signal_restore_set /build/glibc-suXNNi/gl=
ibc-2.29/signal/../sysdeps/unix/sysv/linux/internal-signals.h:84:10
      #5 0x7feabde8e080 in raise /build/glibc-suXNNi/glibc-2.29/signal/../s=
ysdeps/unix/sysv/linux/raise.c:48:3
      #6 0x7feabde79534 in abort /build/glibc-suXNNi/glibc-2.29/stdlib/abor=
t.c:79:7
      #7 0x7feabde7940e in __assert_fail_base /build/glibc-suXNNi/glibc-2.2=
9/assert/assert.c:92:3
      #8 0x7feabde86b91 in __assert_fail /build/glibc-suXNNi/glibc-2.29/ass=
ert/assert.c:101:3
      #9 0x563d4eba2a3c in gic_clear_pending_sgi /home/alxndr/build-asan/..=
/qemu/hw/intc/arm_gic.c:580:9
      #10 0x563d4eba2a3c in gic_acknowledge_irq /home/alxndr/build-asan/../=
qemu/hw/intc/arm_gic.c:630:19
      #11 0x563d4ebb4ca4 in gic_cpu_read /home/alxndr/build-asan/../qemu/hw=
/intc/arm_gic.c:1615:17
      #12 0x563d4ebab538 in gic_thiscpu_read /home/alxndr/build-asan/../qem=
u/hw/intc/arm_gic.c:1771:12
      #13 0x563d5029ec2d in memory_region_read_with_attrs_accessor /home/al=
xndr/build-asan/../qemu/softmmu/memory.c:464:9
      #14 0x563d502705f3 in access_with_adjusted_size /home/alxndr/build-as=
an/../qemu/softmmu/memory.c:552:18
      #15 0x563d5026eb44 in memory_region_dispatch_read1 /home/alxndr/build=
-asan/../qemu/softmmu/memory.c
      #16 0x563d5026eb44 in memory_region_dispatch_read /home/alxndr/build-=
asan/../qemu/softmmu/memory.c:1449:9
      #17 0x563d5048c5bf in flatview_read_continue /home/alxndr/build-asan/=
../qemu/softmmu/physmem.c:2822:23
      #18 0x563d504a9a9b in address_space_read /home/alxndr/qemu/include/ex=
ec/memory.h:2484:26
      #19 0x563d504a9a9b in qtest_process_command /home/alxndr/build-asan/.=
./qemu/softmmu/qtest.c:568:13
      #20 0x563d504a497f in qtest_process_inbuf /home/alxndr/build-asan/../=
qemu/softmmu/qtest.c:797:9
      #21 0x563d504a46d5 in qtest_server_inproc_recv /home/alxndr/build-asa=
n/../qemu/softmmu/qtest.c:904:9
      #22 0x563d50ce5cc8 in qtest_sendf /home/alxndr/build-asan/../qemu/tes=
ts/qtest/libqtest.c:438:5
      #23 0x563d50ce73a3 in qtest_read /home/alxndr/build-asan/../qemu/test=
s/qtest/libqtest.c:1032:5
      #24 0x563d4e264499 in __wrap_qtest_readl /home/alxndr/build-asan/../q=
emu/tests/qtest/fuzz/qtest_wrappers.c:138:16
      #25 0x563d4e26ee5b in op_read /home/alxndr/build-asan/../qemu/tests/q=
test/fuzz/generic_fuzz.c:432:13
      #26 0x563d4e26dc46 in generic_fuzz /home/alxndr/build-asan/../qemu/te=
sts/qtest/fuzz/generic_fuzz.c:681:17
      #27 0x563d4e261283 in LLVMFuzzerTestOneInput /home/alxndr/build-asan/=
../qemu/tests/qtest/fuzz/fuzz.c:151:5
      #28 0x563d4e168b51 in fuzzer::Fuzzer::ExecuteCallback(unsigned char c=
onst*, unsigned long) (/home/alxndr/build-asan/qemu-fuzz-aarch64+0x343eb51)
      #29 0x563d4e1542c2 in fuzzer::RunOneTest(fuzzer::Fuzzer*, char const*=
, unsigned long) (/home/alxndr/build-asan/qemu-fuzz-aarch64+0x342a2c2)
      #30 0x563d4e159d76 in fuzzer::FuzzerDriver(int*, char***, int (*)(uns=
igned char const*, unsigned long)) (/home/alxndr/build-asan/qemu-fuzz-aarch=
64+0x342fd76)
      #31 0x563d4e182a32 in main (/home/alxndr/build-asan/qemu-fuzz-aarch64=
+0x3458a32)
      #32 0x7feabde7abba in __libc_start_main /build/glibc-suXNNi/glibc-2.2=
9/csu/../csu/libc-start.c:308:16
      #33 0x563d4e12e989 in _start (/home/alxndr/build-asan/qemu-fuzz-aarch=
64+0x3404989)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1913914/+subscriptions

