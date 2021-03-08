Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD65330681
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 04:45:14 +0100 (CET)
Received: from localhost ([::1]:48740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ6pV-0004rZ-Am
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 22:45:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lJ6nk-00046f-HU
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 22:43:24 -0500
Received: from relay64.bu.edu ([128.197.228.104]:35800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lJ6nh-0002bD-SO
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 22:43:24 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 1283grSL032360
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 7 Mar 2021 22:42:56 -0500
Date: Sun, 7 Mar 2021 22:42:53 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Yan Zhiqiang <yanz3q@gmail.com>
Subject: Re: About libfuzzer in qemu
Message-ID: <20210308034253.m6rjohwqcuynsaip@mozz.bu.edu>
References: <CAB7jVHGXcAdYg+z=Dgwb5LBhTxjWG_BALdwh+0CvUUucTzFehg@mail.gmail.com>
 <20210304152326.6fqgrncqgsvlrxhc@mozz.bu.edu>
 <CAB7jVHECxxStzzV+5=7w_4QPwMxLRG5HE1Un97fCoxi72_MUBA@mail.gmail.com>
 <20210306051010.rfg3ox2yo3hwmn2c@mozz.bu.edu>
 <CAB7jVHHFc9FsnZmgGGwBLTON_8u2f8o5M6XJ1s9bZxShT+_ksQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAB7jVHHFc9FsnZmgGGwBLTON_8u2f8o5M6XJ1s9bZxShT+_ksQ@mail.gmail.com>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I see the problem. You only hit the breakpoint in the first forked
process? I was able to sort-of work around this, using detach-on-fork.


gdb -q --args ./qemu-fuzz-i386
(gef) set follow-fork-mode child
(gef) set detach-on-fork off
(gef) b generic_fuzz.c:667
(gef) r --fuzz-target=generic-fuzz-virtio-vga -runs=1000
...
Thread 3.1 "qemu-fuzz-i386" hit Breakpoint 1, generic_fuzz
(gef) c
Continuing.
[Thread 0x7ffff32defc0 (LWP 806) exited]
(gef) info inferiors
  Num  Description       Executable
  1    process 31866     /home/alxndr/Downloads/qemu/build-fuzz/qemu-fuzz-i386
  2    process 802       /home/alxndr/Downloads/qemu/build-fuzz/qemu-fuzz-i386
* 3    <null>            /home/alxndr/Downloads/qemu/build-fuzz/qemu-fuzz-i386

# I make a guess that the parent is 802.

(gef) inferior 2 
[Switching to inferior 2 [process 802] (/home/alxndr/Downloads/qemu/build-fuzz/qemu-fuzz-i386)]
(gef) c
...
[New Thread 0x7fffca9fe700 (LWP 4538)]
[Switching to Thread 0x7ffff32defc0 (LWP 4537)]
Thread 3.1 "qemu-fuzz-i386" hit Breakpoint 1, generic_fuzz
(gef) c
Continuing.
[Thread 0x7ffff32defc0 (LWP 4537) exited]
(gef) inferior 2
[Switching to inferior 2 [process 802] (/home/alxndr/Downloads/qemu/build-fuzz/qemu-fuzz-i386)]
(gef) c
...

There's probably ways to automate most of this with gdb breakpoint
commands.


I usually don't need to debug more than one child, so this is a new
problem for me :) . Are you simply trying to reproduce a bug/crash?
My basic workflow for that is:
QEMU_FUZZ_TIMEOUT=0 QTEST_LOG=1 FUZZ_SERIALIZE_QTEST=1 \
./qemu-fuzz-target \
       --fuzz-target=generic-fuzz-virtio-vga ./crash-... > /tmp/out
./scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py /tmp/out > /tmp/repro

# In /tmp/out find the line "Starting qemu with Arguments:" and copy the
# args ( without -qtest /dev/null)
less /tmp/out 

export QEMU_ARGS="-display none -machine accel=qtest, -m 512M -machine q35 -nodefaults -device virtio-vga"

# Reproduce the crash on a non-fuzz binary
./qemu-system-i386 $QEMU_ARGS -qtest stdio < /tmp/repro

For most cases, this should work. Let me know if there's any problem
-Alex



On 210308 1058, Yan Zhiqiang wrote:
> It hasn't changed.
> Can you show me the specific details of the entire debugging process?
> This is my debugging process as follows.(It will not hit the breakpoint as
> you can see)
> 
> ☁  build_qemu  printenv
> > XDG_RUNTIME_DIR=/run/user/500
> > XDG_SESSION_ID=2
> > ZSH=/home/ubuntu/.oh-my-zsh
> > _=/usr/bin/printenv
> > *QEMU_FUZZ_TIMEOUT=0*
> 
> 
> 
> ☁  build_qemu  gdb -q --args ./qemu-fuzz-i386
> > --fuzz-target=generic-fuzz-virtio-vga fuzz-output/
> > pwndbg: loaded 189 commands. Type pwndbg [filter] for a list.
> > pwndbg: created $rebase, $ida gdb functions (can be used with print/break)
> > Reading symbols from ./qemu-fuzz-i386...done.
> > warning: File "/home/ubuntu/qemu-lastest-fuzz-test/qemu/.gdbinit"
> > auto-loading has been declined by your `auto-load safe-path' set to
> > "$debugdir:$datadir/auto-load".
> > To enable execution of this file add
> >         add-auto-load-safe-path
> > /home/ubuntu/qemu-lastest-fuzz-test/qemu/.gdbinit
> > line to your configuration file "/home/ubuntu/.gdbinit".
> > To completely disable this security protection add
> >         set auto-load safe-path /
> > line to your configuration file "/home/ubuntu/.gdbinit".
> > For more information about this security protection see the
> > "Auto-loading safe path" section in the GDB manual.  E.g., run from the
> > shell:
> >         info "(gdb)Auto-loading safe path"
> > pwndbg> b generic_fuzz.c:655
> > Breakpoint 1 at 0x2ca5938: file ../qemu/tests/qtest/fuzz/generic_fuzz.c,
> > line 655.
> > pwndbg> set follow-fork-mode child
> > pwndbg> r
> > Starting program:
> > /home/ubuntu/qemu-lastest-fuzz-test/build_qemu/qemu-fuzz-i386
> > --fuzz-target=generic-fuzz-virtio-vga fuzz-output/
> > [Thread debugging using libthread_db enabled]
> > Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
> > [New Thread 0x7ffff0fff700 (LWP 36468)]
> > ==36456==WARNING: ASan doesn't fully support makecontext/swapcontext
> > functions and may produce false positives in some cases!
> > [New Thread 0x7fffd05ff700 (LWP 36469)]
> > INFO: libFuzzer ignores flags that start with '--'
> > INFO: Seed: 1537774383
> > INFO: Loaded 1 modules   (791403 inline 8-bit counters): 791403
> > [0x55555f076000, 0x55555f13736b),
> > INFO: Loaded 1 PC tables (791403 PCs): 791403
> > [0x55555e461b00,0x55555f0751b0),
> > [New Thread 0x7fffcd179700 (LWP 36471)]
> > INFO:     7892 files found in fuzz-output/
> > INFO: -max_len is not provided; libFuzzer will not generate inputs larger
> > than 4096 bytes
> > Matching objects by name virtio*
> > This process will try to fuzz the following MemoryRegions:
> >   * vga ioports remapped[0] (size 20)
> >   * qemu extended regs[0] (size 8)
> >   * virtio-pci-device[0] (size 1000)
> >   * vga[4] (size 1)
> >   * msix-pba[0] (size 8)
> >   * vga[2] (size 10)
> >   * bochs dispi interface[0] (size 16)
> >   * virtio-pci-notify[0] (size 1000)
> >   * vga[0] (size 2)
> >   * bus master[0] (size 0)
> >   * msix-table[0] (size 30)
> >   * vga-lowmem[0] (size 20000)
> >   * virtio-pci-common[0] (size 800)
> >   * virtio-pci-notify-pio[0] (size 4)
> >   * vbe[0] (size 4)
> >   * bus master container[0] (size 0)
> >   * virtio-vga-msix[0] (size 1000)
> >   * vga[3] (size 2)
> >   * virtio-pci-isr[0] (size 800)
> >   * virtio-pci[0] (size 4000)
> >   * vga[1] (size 1)
> > [New process 36472]
> > [Thread debugging using libthread_db enabled]
> > Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
> > [New Thread 0x7fffcd179700 (LWP 36473)]
> > [Switching to Thread 0x7ffff7fdfcc0 (LWP 36472)]
> > ERROR: Could not find ELF base!
> > Thread 2.1 "qemu-fuzz-i386" hit Breakpoint 1, generic_fuzz
> > (s=0x6120000001c0, Data=0x60200008ba30 "\276", Size=0) at
> > ../qemu/tests/qtest/fuzz/generic_fuzz.c:655
> > 655             if (timeout) {
> > ERROR: Could not find ELF base!
> > LEGEND: STACK | HEAP | CODE | DATA | RWX | RODATA
> > ────────────────────────────────────────────────────────────────[
> > REGISTERS ]────────────────────────────────────────────────────────────────
> >  RAX  0x0
> >  RBX  0x7fffffffc680 —▸ 0x55555f076000 (__start___sancov_cntrs) ◂— 0x0
> >  RCX  0x2aaaac0fcc93c0
> >  RDX  0x2aaaac0fcc9380
> >  RDI  0x0
> >  RSI  0x1
> >  R8   0x555560337400 (fuzzer::TPC) ◂— 0x0
> >  R9   0x0
> >  R10  0x1
> >  R11  0x201
> >  R12  0x60200008ba30 ◂— 0xbe
> >  R13  0x555560337400 (fuzzer::TPC) ◂— 0x0
> >  R14  0x0
> >  R15  0x7fffffffca67 ◂— 0x80000
> >  RBP  0x7fffffffc8d0 —▸ 0x7fffffffc9d0 —▸ 0x7fffffffca10 —▸ 0x7fffffffca90
> > —▸ 0x7fffffffcad0 ◂— ...
> >  RSP  0x7fffffffc4c0 ◂— 0x41b58ab3
> >  RIP  0x5555581f9938 (generic_fuzz+616) ◂— mov    eax, dword ptr [rip +
> > 0x5300b82]
> > ─────────────────────────────────────────────────────────────────[ DISASM
> > ]──────────────────────────────────────────────────────────────────
> >  ► 0x5555581f9938 <generic_fuzz+616>    mov    eax, dword ptr [rip +
> > 0x5300b82] <0x55555d4fa4c0>
> >    0x5555581f993e <generic_fuzz+622>    mov    esi, eax
> >    0x5555581f9940 <generic_fuzz+624>    mov    dword ptr [rbx + 0x170], eax
> >    0x5555581f9946 <generic_fuzz+630>    call
> > __sanitizer_cov_trace_const_cmp4 <__sanitizer_cov_trace_const_cmp4>
> >    0x5555581f994b <generic_fuzz+635>    mov    eax, dword ptr [rbx + 0x170]
> >    0x5555581f9951 <generic_fuzz+641>    cmp    eax, 0
> >    0x5555581f9954 <generic_fuzz+644>    jne    generic_fuzz+669
> > <generic_fuzz+669>
> >    0x5555581f995a <generic_fuzz+650>    mov    al, byte ptr [rip +
> > 0x6e7c911] <0x55555f076271>
> >    0x5555581f9960 <generic_fuzz+656>    add    al, 1
> >    0x5555581f9962 <generic_fuzz+658>    mov    byte ptr [rip + 0x6e7c909],
> > al <0x55555f076271>
> >    0x5555581f9968 <generic_fuzz+664>    jmp    generic_fuzz+2134
> > <generic_fuzz+2134>
> > ──────────────────────────────────────────────────────────────[ SOURCE
> > (CODE) ]──────────────────────────────────────────────────────────────
> > In file:
> > /home/ubuntu/qemu-lastest-fuzz-test/qemu/tests/qtest/fuzz/generic_fuzz.c
> >    650          * Sometimes the fuzzer will find inputs that take quite a
> > long time to
> >    651          * process. Often times, these inputs do not result in new
> > coverage.
> >    652          * Even if these inputs might be interesting, they can slow
> > down the
> >    653          * fuzzer, overall. Set a timeout to avoid hurting
> > performance, too much
> >    654          */
> >  ► 655         if (timeout) {
> >    656             struct sigaction sact;
> >    657             struct itimerval timer;
> >    658
> >    659             sigemptyset(&sact.sa_mask);
> >    660             sact.sa_flags   = SA_NODEFER;
> > ──────────────────────────────────────────────────────────────────[ STACK
> > ]──────────────────────────────────────────────────────────────────
> > 00:0000│ rsp  0x7fffffffc4c0 ◂— 0x41b58ab3
> > 01:0008│      0x7fffffffc4c8 —▸ 0x55555c611c33 ◂— xor    esp, dword ptr
> > [rax] /* '3 32 80 7 ops:631 144 152 8 sact:656 368 32 9 timer:657' */
> > 02:0010│      0x7fffffffc4d0 —▸ 0x5555581f96d0 (generic_fuzz) ◂— push   rbp
> > 03:0018│      0x7fffffffc4d8 —▸ 0x5555581fbeb6 (pci_enum+1654) ◂— mov
> >  rdi, qword ptr [rbx + 0xb8]
> > 04:0020│      0x7fffffffc4e0 —▸ 0x5555581fc510 (op_in) ◂— push   rbp
> > 05:0028│      0x7fffffffc4e8 —▸ 0x5555581fce80 (op_out) ◂— push   rbp
> > 06:0030│      0x7fffffffc4f0 —▸ 0x5555581fda30 (op_read) ◂— push   rbp
> > 07:0038│      0x7fffffffc4f8 —▸ 0x5555581fe4d0 (op_write) ◂— push   rbp
> > ────────────────────────────────────────────────────────────────[
> > BACKTRACE ]────────────────────────────────────────────────────────────────
> >  ► f 0     5555581f9938 generic_fuzz+616
> >    f 1     55555820802f LLVMFuzzerTestOneInput+1247
> >    f 2     5555580ecb5b
> >    f 3     5555580eecdb
> >    f 4     5555580ef3b6
> >    f 5     5555580e1e71
> >    f 6     555558108d93 main+35
> >    f 7     7ffff5668bf7 __libc_start_main+231
> >
> > ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
> > pwndbg> c
> > Continuing.
> > [Thread 0x7fffcd179700 (LWP 36473) exited]
> > [Inferior 2 (process 36472) exited normally]
> > INFO: seed corpus: files: 7892 min: 1b max: 4096b total: 3532937b rss:
> > 225Mb
> > pwndbg> #2      pulse  ft: 216 lim: 4 exec/s: 1 rss: 226Mb
> > #4      pulse  cov: 218 ft: 220 corp: 2/2b lim: 4 exec/s: 2 rss: 226Mb
> > #8      pulse  cov: 225 ft: 1268 corp: 6/6b lim: 4 exec/s: 4 rss: 226Mb
> > #16     pulse  cov: 1571 ft: 1803 corp: 12/22b lim: 4 exec/s: 8 rss: 226Mb
> > #32     pulse  cov: 1759 ft: 2257 corp: 26/90b lim: 4 exec/s: 16 rss: 226Mb
> > #64     pulse  cov: 1798 ft: 3062 corp: 50/220b lim: 4 exec/s: 32 rss:
> > 227Mb
> > #128    pulse  cov: 3678 ft: 8040 corp: 105/703b lim: 4 exec/s: 42 rss:
> > 229Mb
> > #256    pulse  cov: 3921 ft: 9791 corp: 204/1716b lim: 4 exec/s: 64 rss:
> > 232Mb
> > i386: wrong value for queue_enable 1818
> > i386: wrong value for queue_enable ffa17a18
> > i386: wrong value for queue_enable 185a55be
> > i386: wrong value for queue_enable 35b5a01
> > i386: wrong value for queue_enable 5a55be00
> > #512    pulse  cov: 5089 ft: 13954 corp: 386/5363b lim: 4 exec/s: 73 rss:
> > 241Mb
> > i386: wrong value for queue_enable 67666369
> > i386: wrong value for queue_enable 20ffff13
> > #1024   pulse  cov: 5236 ft: 18351 corp: 679/16Kb lim: 4 exec/s: 85 rss:
> > 264Mb
> > i386: wrong value for queue_enable 13400200
> > i386: wrong value for queue_enable 943b
> > i386: wrong value for queue_enable 555a
> > i386: wrong value for queue_enable 13400200
> > .........
> 
> 
> 
> Regards,
> Zhiqiang Yan
> 
> Alexander Bulekov <alxndr@bu.edu> 于2021年3月6日周六 下午1:11写道：
> 
> >
> >
> > On 210305 1049, Yan Zhiqiang wrote:
> > >  * Yes, I tried "set follow-fork-mode child" as well, but it's also the
> > > same situation. It will never hit the breakpoint twice(it's strange).
> >
> > Strange - I just tried this and I could set and hit a breakpoint in
> > virtio-gpu code. Maybe the problem is the timeout. Can you try setting
> > the environment variable QEMU_FUZZ_TIMEOUT=0 ?
> >
> > -Alex
> >
> > >
> > >  * Thank you for the method to debug crash, I learned a lot from it.
> > >
> > > Regards,
> > > Zhiqiang Yan
> > >
> > > Alexander Bulekov <alxndr@bu.edu> 于2021年3月4日周四 下午11:24写道：
> > >
> > > > On 210304 1843, Yan Zhiqiang wrote:
> > > > > Hello Alex,
> > > > > I'm learning the fuzz in QEMU recently, I review the fuzz code under
> > > > > /tests/qtest/fuzz which is written by you.
> > > > > I learn a lot from it, but I stuck when I want to debug the fuzz
> > code.
> > > > > I use the gdb with command as follows:
> > > > >
> > > > > >  gdb -q --args ./qemu-fuzz-i386
> > --fuzz-target=generic-fuzz-virtio-vga
> > > > > > ./fuzz-output
> > > > >
> > > > > and set breakpoint at generic_fuzz.c:generic_fuzz.
> > > > > It acctually stop when hit the breakpoint. But the function argument
> > Size
> > > > > is zero and then goto _Exit(0). (try many times but always the same)
> > > >
> > > > Hi Zhiqiang,
> > > > Happy to have more people look at the fuzzing code.
> > > > We run each input in a forked process. Maybe you need to run
> > > > "set follow-fork-mode child" in gdb?
> > > >
> > > > > Then input `c` to continue.
> > > > > However, it never hit the breakpoint after that. Just as the picture
> > > > showed.
> > > > > [image: 1614854239086.jpg]
> > > > > I tried the qtest debug method, but failed.
> > > > > I want to know the real process state to learn the QEMU fuzz and add
> > a
> > > > new
> > > > > fuzzer for QEMU.
> > > > > Could you tell me what's the right method to debug the fuzz code?
> > Thank
> > > > you!
> > > >
> > > > For debugging crash, I usually build QEMU with --enable-sanitizers
> > > > (ASAN), and I convert the crash to a "QTest" reproducer, so it can be
> > > > debugged in a normal build of qemu. There's an RFC that has
> > instructions
> > > > for how to do this:
> > > > https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg06035.html
> > > >
> > > > Let me know if I can provide any more info.
> > > > -Alex
> > > >
> > > > >
> > > > > Regards,
> > > > > Zhiqiang Yan
> > > >
> > > >
> > > >
> >

