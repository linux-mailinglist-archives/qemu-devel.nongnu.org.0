Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F3C2D9809
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 13:34:30 +0100 (CET)
Received: from localhost ([::1]:43200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kon3d-00056u-7R
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 07:34:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kon0N-0002nS-C1
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 07:31:07 -0500
Received: from indium.canonical.com ([91.189.90.7]:50788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kon0F-0000ui-93
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 07:31:07 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kon0D-0002T6-BK
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 12:30:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 538182E8042
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 12:30:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Dec 2020 12:23:18 -0000
From: Qiuhao Li <1908062@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: qiuhao
X-Launchpad-Bug-Reporter: Qiuhao Li (qiuhao)
X-Launchpad-Bug-Modifier: Qiuhao Li (qiuhao)
References: <160794824793.5567.9855788232054277622.malonedeb@gac.canonical.com>
Message-Id: <160794859886.5723.647269673551845882.malone@gac.canonical.com>
Subject: [Bug 1908062] Re: qemu-system-i386 virtio-vga: Assertion in
 address_space_stw_le_cached failed again
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: c8a19a901552760de40940e39dc5e722d0641937
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1908062 <1908062@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--[ Original Fuzzing output

./build/qemu-fuzz-i386 --fuzz-target=3Dgeneric-fuzz-virtio-vga
../fuzz/20201208/crash-da778083c63d2b24d8f7780383b2602a7a156352

qemu-fuzz-i386: /home/qiuhao/hack/qemu/include/exec/memory_ldst_cached.h.in=
c:88: void address_space_stw_le_cached(MemoryRegionCache *, hwaddr, uint32_=
t, MemTxAttrs, MemTxResult *): Assertion `addr < cache->len && 2 <=3D cache=
->len - addr' failed.
=3D=3D37260=3D=3D ERROR: libFuzzer: deadly signal
    #0 0x56336c2ebc81 in __sanitizer_print_stack_trace (/home/qiuhao/hack/q=
emu/build/qemu-fuzz-i386+0x305dc81)
    #1 0x56336c236dd8 in fuzzer::PrintStackTrace() (/home/qiuhao/hack/qemu/=
build/qemu-fuzz-i386+0x2fa8dd8)
    #2 0x56336c21bf23 in fuzzer::Fuzzer::CrashCallback() (/home/qiuhao/hack=
/qemu/build/qemu-fuzz-i386+0x2f8df23)
    #3 0x7f3122f7b3bf  (/lib/x86_64-linux-gnu/libpthread.so.0+0x153bf)
    #4 0x7f3122d8c18a in __libc_signal_restore_set /build/glibc-ZN95T4/glib=
c-2.31/signal/../sysdeps/unix/sysv/linux/internal-signals.h:86:3
    #5 0x7f3122d8c18a in raise /build/glibc-ZN95T4/glibc-2.31/signal/../sys=
deps/unix/sysv/linux/raise.c:48:3
    #6 0x7f3122d6b858 in abort /build/glibc-ZN95T4/glibc-2.31/stdlib/abort.=
c:79:7
    #7 0x7f3122d6b728 in __assert_fail_base /build/glibc-ZN95T4/glibc-2.31/=
assert/assert.c:92:3
    #8 0x7f3122d7cf35 in __assert_fail /build/glibc-ZN95T4/glibc-2.31/asser=
t/assert.c:101:3
    #9 0x56336ec7c8ab in address_space_stw_le_cached /home/qiuhao/hack/qemu=
/include/exec/memory_ldst_cached.h.inc:88:5
    #10 0x56336ec7b746 in stw_le_phys_cached /home/qiuhao/hack/qemu/include=
/exec/memory_ldst_phys.h.inc:121:5
    #11 0x56336ec7acf8 in virtio_stw_phys_cached /home/qiuhao/hack/qemu/inc=
lude/hw/virtio/virtio-access.h:196:9
    #12 0x56336ec79f7b in vring_set_avail_event /home/qiuhao/hack/qemu/buil=
d/../hw/virtio/virtio.c:429:5
    #13 0x56336ec376f5 in virtqueue_split_pop /home/qiuhao/hack/qemu/build/=
../hw/virtio/virtio.c:1452:9
    #14 0x56336ec3131c in virtqueue_pop /home/qiuhao/hack/qemu/build/../hw/=
virtio/virtio.c:1695:16
    #15 0x56336c57fa43 in virtio_gpu_handle_ctrl /home/qiuhao/hack/qemu/bui=
ld/../hw/display/virtio-gpu.c:877:11
    #16 0x56336c57f6d9 in virtio_gpu_ctrl_bh /home/qiuhao/hack/qemu/build/.=
./hw/display/virtio-gpu.c:898:5
    #17 0x563370ad4952 in aio_bh_call /home/qiuhao/hack/qemu/build/../util/=
async.c:136:5
    #18 0x563370ad6352 in aio_bh_poll /home/qiuhao/hack/qemu/build/../util/=
async.c:164:13
    #19 0x563370a2773b in aio_dispatch /home/qiuhao/hack/qemu/build/../util=
/aio-posix.c:381:5
    #20 0x563370adfd5e in aio_ctx_dispatch /home/qiuhao/hack/qemu/build/../=
util/async.c:306:5
    #21 0x7f312319afbc in g_main_context_dispatch (/lib/x86_64-linux-gnu/li=
bglib-2.0.so.0+0x51fbc)
    #22 0x563370942137 in glib_pollfds_poll /home/qiuhao/hack/qemu/build/..=
/util/main-loop.c:221:9
    #23 0x56337093fa37 in os_host_main_loop_wait /home/qiuhao/hack/qemu/bui=
ld/../util/main-loop.c:244:5
    #24 0x56337093f387 in main_loop_wait /home/qiuhao/hack/qemu/build/../ut=
il/main-loop.c:520:11
    #25 0x56336c33ec22 in flush_events /home/qiuhao/hack/qemu/build/../test=
s/qtest/fuzz/fuzz.c:49:9
    #26 0x56336c33311b in generic_fuzz /home/qiuhao/hack/qemu/build/../test=
s/qtest/fuzz/generic_fuzz.c:683:17
    #27 0x56336c340699 in LLVMFuzzerTestOneInput /home/qiuhao/hack/qemu/bui=
ld/../tests/qtest/fuzz/fuzz.c:151:5
    #28 0x56336c21d5e1 in fuzzer::Fuzzer::ExecuteCallback(unsigned char con=
st*, unsigned long) (/home/qiuhao/hack/qemu/build/qemu-fuzz-i386+0x2f8f5e1)
    #29 0x56336c208d52 in fuzzer::RunOneTest(fuzzer::Fuzzer*, char const*, =
unsigned long) (/home/qiuhao/hack/qemu/build/qemu-fuzz-i386+0x2f7ad52)
    #30 0x56336c20e806 in fuzzer::FuzzerDriver(int*, char***, int (*)(unsig=
ned char const*, unsigned long)) (/home/qiuhao/hack/qemu/build/qemu-fuzz-i3=
86+0x2f80806)
    #31 0x56336c2374c2 in main (/home/qiuhao/hack/qemu/build/qemu-fuzz-i386=
+0x2fa94c2)
    #32 0x7f3122d6d0b2 in __libc_start_main /build/glibc-ZN95T4/glibc-2.31/=
csu/../csu/libc-start.c:308:16
    #33 0x56336c1e341d in _start (/home/qiuhao/hack/qemu/build/qemu-fuzz-i3=
86+0x2f5541d)

NOTE: libFuzzer has rudimentary signal handlers.
      Combine libFuzzer with AddressSanitizer or similar for better crash r=
eports.
SUMMARY: libFuzzer: deadly signal


** Attachment added: "crash-da778083c63d2b24d8f7780383b2602a7a156352"
   https://bugs.launchpad.net/qemu/+bug/1908062/+attachment/5443422/+files/=
crash-da778083c63d2b24d8f7780383b2602a7a156352

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1908062

Title:
  qemu-system-i386 virtio-vga: Assertion in address_space_stw_le_cached
  failed again

Status in QEMU:
  New

Bug description:
  When I was fuzzing virtio-vga device of the latest QEMU (1758428, Dec
  12, built with --enable-sanitizers --enable-fuzzing), an assertion
  failed in include/exec/memory_ldst_cached.h.inc.

  --[ Reproducer

  cat << EOF | ./build/i386-softmmu/qemu-system-i386 -machine accel=3Dqtest=
 \
  -machine q35 -display none -nodefaults -device virtio-vga -qtest stdio
  outl 0xcf8 0x8000081c
  outb 0xcfc 0xc3
  outl 0xcf8 0x80000804
  outb 0xcfc 0x06
  write 0xc300001024 0x2 0x0040
  write 0xc300001028 0x1 0x5a
  write 0xc30000101c 0x1 0x01
  writel 0xc30000100c 0x20000000
  write 0xc300001016 0x3 0x80a080
  write 0xc300003002 0x1 0x80
  write 0x5c 0x1 0x10
  EOF

  --[ Output

  =3D=3D35337=3D=3DWARNING: ASan doesn't fully support makecontext/swapcont=
ext functions and may produce false positives in some cases!
  [I 1607946348.442865] OPENED
  [R +0.059305] outl 0xcf8 0x8000081c
  OK
  [S +0.059326] OK
  [R +0.059338] outb 0xcfc 0xc3
  OK
  [S +0.059355] OK
  [R +0.059363] outl 0xcf8 0x80000804
  OK
  [S +0.059369] OK
  [R +0.059381] outb 0xcfc 0x06
  OK
  [S +0.061094] OK
  [R +0.061107] write 0xc300001024 0x2 0x0040
  OK
  [S +0.061120] OK
  [R +0.061127] write 0xc300001028 0x1 0x5a
  OK
  [S +0.061135] OK
  [R +0.061142] write 0xc30000101c 0x1 0x01
  OK
  [S +0.061158] OK
  [R +0.061167] writel 0xc30000100c 0x20000000
  OK
  [S +0.061212] OK
  [R +0.061222] write 0xc300001016 0x3 0x80a080
  OK
  [S +0.061231] OK
  [R +0.061238] write 0xc300003002 0x1 0x80
  OK
  [S +0.061247] OK
  [R +0.061253] write 0x5c 0x1 0x10
  OK
  [S +0.061403] OK
  qemu-system-i386: /home/qiuhao/hack/qemu/include/exec/memory_ldst_cached.=
h.inc:88: void address_space_stw_le_cached(MemoryRegionCache *, hwaddr, uin=
t32_t, MemTxAttrs, MemTxResult *): Assertion `addr < cache->len && 2 <=3D c=
ache->len - addr' failed.

  --[ Environment

  Ubuntu 20.04.1 5.4.0-58-generic x86_64
  clang: 10.0.0-4ubuntu1
  glibc: 2.31-0ubuntu9.1
  libglib2.0-dev: 2.64.3-1~ubuntu20.04.1

  --[ Note

  Alexander Bulekov found the same assertion failure on 2020-08-04,
  https://bugs.launchpad.net/qemu/+bug/1890333, and it had been fixed in
  commit 2d69eba5fe52045b2c8b0d04fd3806414352afc1.

  Fam Zheng found the same assertion failure on 2018-09-29,
  https://bugs.launchpad.net/qemu/+bug/1795148, and it had been fixed in
  commit db812c4073c77c8a64db8d6663b3416a587c7b4a.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1908062/+subscriptions

