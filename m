Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C05347B39
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:57:08 +0100 (CET)
Received: from localhost ([::1]:35436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4wW-0004Cu-0G
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:57:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lP4qN-0005bJ-Gv
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:50:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:37494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lP4qH-0001Ke-7V
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:50:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lP4qF-0000rJ-6G
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 14:50:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 257BA2E8164
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 14:50:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Mar 2021 14:40:33 -0000
From: Marco Elver <1920934@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: melver pmaydell rth
X-Launchpad-Bug-Reporter: Marco Elver (melver)
X-Launchpad-Bug-Modifier: Marco Elver (melver)
References: <161651058412.28703.12241728434736646690.malonedeb@gac.canonical.com>
Message-Id: <161659683364.20185.1983519966953842389.malone@wampee.canonical.com>
Subject: [Bug 1920934] Re: Heap-use-after-free in io_writex / cputlb.c results
 in Linux kernel crashes
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4446feb642ca86be4f6eceb855b408397dad6a50"; Instance="production"
X-Launchpad-Hash: 74a4ee4307ded847a4ed33b1006d373ff1932ccf
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
Reply-To: Bug 1920934 <1920934@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The config is from 5.12-rc4, and the earliest kernel version that should
reproduce this is 5.12-rc1.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1920934

Title:
  Heap-use-after-free in io_writex / cputlb.c results in Linux kernel
  crashes

Status in QEMU:
  New

Bug description:
  qemu version: git 5ca634afcf83215a9a54ca6e66032325b5ffb5f6; 5.2.0

  We've encountered that booting the Linux kernel in TCG mode, results
  in a racy heap-use-after-free. The bug can be detected by ASan [A],
  but in the majority of runs results in a crashing kernel [B].

  To reproduce, the following command line was used:

  $> while ./qemu-system-x86_64 -no-reboot -smp 10 -m 2G -kernel
  arch/x86/boot/bzImage -nographic -append "oops=3Dpanic panic_on_warn=3D1
  panic=3D1 kfence.sample_interval=3D1 nokaslr"; do sleep 0.5s; done

  The crashes in the kernel [B] appear to receive an interrupt in a code
  location where the instructions are periodically patched (via the
  jump_label infrastructure).

  [A]:
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D                           =
                                                                           =
                                                                           =
             =

  =3D=3D3552508=3D=3DERROR: AddressSanitizer: heap-use-after-free on addres=
s 0x6190007fef50 at pc 0x55885b0b4d1b bp 0x7f83baffb800 sp 0x7f83baffb7f8  =
                                                                           =
                                        =

  READ of size 8 at 0x6190007fef50 thread T4                               =
                                                                           =
                                                                           =
                                =

  [    4.616506][    T1] pci 0000:00:02.0: reg 0x18: [mem 0xfebf0000-0xfebf=
0fff]                                                                      =
                                                                           =
                                =

  [    4.670567][    T1] pci 0000:00:02.0: reg 0x30: [mem 0xfebe0000-0xfebe=
ffff pref]                                                                 =
                                                                           =
                                =

  [    4.691345][    T1] pci 0000:00:03.0: [8086:100e] type 00 class 0x0200=
00                                                                         =
                                                                           =
                                =

  [    4.701540][    T1] pci 0000:00:03.0: reg 0x10: [mem 0xfebc0000-0xfebd=
ffff]                                                                      =
                                                                           =
                                =

  [    4.711076][    T1] pci 0000:00:03.0: reg 0x14: [io  0xc000-0xc03f]   =
                                                                           =
                                                                           =
                                =

  [    4.746869][    T1] pci 0000:00:03.0: reg 0x30: [mem 0xfeb80000-0xfebb=
ffff pref]                                                                 =
                                                                           =
                                =

  [    4.813612][    T1] ACPI: PCI Interrupt Link [LNKA] (IRQs 5 *10 11)   =
                                                                           =
                                                                           =
                                =

      #0 0x55885b0b4d1a in io_writex ../accel/tcg/cputlb.c:1408            =
                                                                           =
                                                                           =
                                =

      #1 0x55885b0d3b9f in store_helper ../accel/tcg/cputlb.c:2444         =
                                                                           =
                                                                           =
                                =

      #2 0x55885b0d3b9f in helper_le_stl_mmu ../accel/tcg/cputlb.c:2510    =
                                                                           =
                                                                           =
                                =

  [    4.820927][    T1] ACPI: PCI Interrupt Link [LNKB] (IRQs 5 *10 11)   =
                                                                           =
                                                                           =
                                =

      #3 0x7f843cedf8dc  (<unknown module>)                                =
                                                                           =
                                                                           =
                                =

                                                                           =
                                                                           =
                                                                           =
                                =

  0x6190007fef50 is located 208 bytes inside of 1024-byte region [0x6190007=
fee80,0x6190007ff280)                                                      =
                                                                           =
                                =

  freed by thread T11 here:                                                =
                                                                           =
                                                                           =
                                =

      #0 0x7f8483f431f8 in __interceptor_realloc ../../../../src/libsanitiz=
er/asan/asan_malloc_linux.cpp:164                                          =
                                                                           =
                                =

      #1 0x7f8483586de7 in g_realloc (/lib/x86_64-linux-gnu/libglib-2.0.so.=
0+0x57de7)                                                                 =
                                                                           =
                                =

                                                                           =
                                                                           =
                                                                           =
                                =

  previously allocated by thread T11 here:                                 =
                                                                           =
                                                                           =
                                =

      #0 0x7f8483f431f8 in __interceptor_realloc ../../../../src/libsanitiz=
er/asan/asan_malloc_linux.cpp:164                                          =
                                                                           =
                                =

      #1 0x7f8483586de7 in g_realloc (/lib/x86_64-linux-gnu/libglib-2.0.so.=
0+0x57de7)                                                                 =
                                                                           =
                                =

                                                                           =
                                                                           =
                                                                           =
                                =

  Thread T4 created by T0 here:                                            =
                                                                           =
                                                                           =
                                =

  [    4.827679][    T1] ACPI: PCI Interrupt Link [LNKC] (IRQs 5 10 *11)   =
                                                                           =
                                                                           =
                                =

  [    4.835143][    T1] ACPI: PCI Interrupt Link [LNKD] (IRQs 5 10 *11)   =
                                                                           =
                                                                           =
                                =

  [    4.838441][    T1] ACPI: PCI Interrupt Link [LNKS] (IRQs *9)         =
                                                                           =
                                                                           =
                                =

      #0 0x7f8483eee2a2 in __interceptor_pthread_create ../../../../src/lib=
sanitizer/asan/asan_interceptors.cpp:214                                   =
                                                                           =
                                =

      #1 0x55885b7cf0de in qemu_thread_create ../util/qemu-thread-posix.c:5=
58                                                                         =
                                                                           =
                                =

                                                                           =
                                                                           =
                                                                           =
                                =

  Thread T11 created by T0 here:                                           =
                                                                           =
                                                                           =
                                =

      #0 0x7f8483eee2a2 in __interceptor_pthread_create ../../../../src/lib=
sanitizer/asan/asan_interceptors.cpp:214                                   =
                                                                           =
                                =

      #1 0x55885b7cf0de in qemu_thread_create ../util/qemu-thread-posix.c:5=
58                                                                         =
                                                                           =
                                =

                                                                           =
                        =

  SUMMARY: AddressSanitizer: heap-use-after-free ../accel/tcg/cputlb.c:1408=
 in io_writex                                                              =
                                                                           =
                                =

  Shadow bytes around the buggy address:                                   =
                                                                           =
                                                                           =
                                =

    0x0c32800f7d90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00        =
                                                                           =
                                                                           =
                                =

    0x0c32800f7da0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00        =
                                                                           =
                                                                           =
                                =

    0x0c32800f7db0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa        =
                                                                           =
                                                                           =
                                =

    0x0c32800f7dc0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa        =
                                                                           =
                                                                           =
                                =

    0x0c32800f7dd0: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd        =
                                                                           =
                                                                           =
                                =

  =3D>0x0c32800f7de0: fd fd fd fd fd fd fd fd fd fd[fd]fd fd fd fd fd      =
                                                                           =
                                                                           =
                                  =

    0x0c32800f7df0: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd        =
                                                                           =
                                                                           =
                                =

    0x0c32800f7e00: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd        =
                                                                           =
                                                                           =
                                =

    0x0c32800f7e10: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd        =
                                                                           =
                                                                           =
                                =

    0x0c32800f7e20: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd        =
                                                                           =
                                                                           =
                                =

    0x0c32800f7e30: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd        =
                                                                           =
                                                                           =
                                =

  Shadow byte legend (one shadow byte represents 8 application bytes):     =
                                                                           =
                                                                           =
                                =

    Addressable:           00                                              =
                                                                           =
                                                                           =
                                =

    Partially addressable: 01 02 03 04 05 06 07                            =
                                                                           =
                                                                           =
                                =

    Heap left redzone:       fa                                            =
                                                                           =
                                                                           =
                                =

    Freed heap region:       fd                                            =
                                                                           =
                                                                           =
                                =

    Stack left redzone:      f1                                            =
                                                                           =
                                                                           =
                                =

    Stack mid redzone:       f2                                            =
                                                                           =
                                                                           =
                                =

    Stack right redzone:     f3                                            =
                                                                           =
                                                                           =
                                =

    Stack after return:      f5                                            =
                                                                           =
                                                                           =
                                =

    Stack use after scope:   f8                                            =
                                                                           =
                                                                           =
                                =

    Global redzone:          f9                                            =
                                                                           =
                                                                           =
                                =

    Global init order:       f6                                            =
                                                                           =
                                                                           =
                                =

    Poisoned by user:        f7                                            =
                                                                           =
                                                                           =
                                =

    Container overflow:      fc                                            =
                                                                           =
                                                                           =
                                =

    Array cookie:            ac                                            =
                                                                           =
                                                                           =
                                =

    Intra object redzone:    bb                                            =
                                                                           =
                                                                           =
                                =

    ASan internal:           fe                                            =
                                                                           =
                                                                           =
                                =

    Left alloca redzone:     ca                                            =
                                                                           =
                                                                           =
                                =

    Right alloca redzone:    cb                                            =
                                                                           =
                                                                           =
                                =

    Shadow gap:              cc                                            =
                                                                           =
                                                                           =
                                =

  =3D=3D3552508=3D=3DABORTING =


  =

  [B]:
  [    6.029269][    C4] int3: 0000 [#1] PREEMPT SMP                       =
                                                                           =
                                                                           =
                                =

  [    6.029269][    C4] CPU: 4 PID: 34 Comm: cpuhp/4 Not tainted 5.12.0-rc=
4 #2                                                                       =
                                                                           =
                                =

  [    6.029269][    C4] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014          =
                                                                           =
                                =

  [    6.029269][    C4] RIP: 0010:kmem_cache_alloc_trace+0xdd/0x2f0       =
                                                                           =
                                                                           =
                                =

  [    6.029269][    C4] Code: de e8 a7 2e 02 00 85 c0 74 0d 48 89 ef e8 bb=
 60 00 00 e9 e3 00 00 00 4d 85 f6 0f 84 da 00 00 00 4c 89 6c 24 08 48 8b 2c=
 24 cc <98> 01 00 00 45 31 ed 4c 89 6c 24 10 4d 85 ed 0f 85 99 00 00 00 49 =
                                =

  [    6.029269][    C4] RSP: 0018:ffffc90000483cc0 EFLAGS: 00000286       =
                                                                           =
                                                                           =
                                =

  [    6.029269][    C4] RAX: 0000000000000000 RBX: 0000000000000dc0 RCX: f=
fff888003b717c0                                                            =
                                                                           =
                                =

  [    6.029269][    C4] RDX: 0000000000000000 RSI: 0000000000000dc0 RDI: f=
fff888003842a00                                                            =
                                                                           =
                                =

  [    6.029269][    C4] RBP: 0000000000000110 R08: 0000000000000000 R09: 0=
000000000000000                                                            =
                                                                           =
                                =

  [    6.029269][    C4] R10: ffffffff81248e22 R11: 00000000fa83b201 R12: 0=
000000000000dc0                                                            =
                                                                           =
                                =

  [    6.029269][    C4] R13: 0000000000000000 R14: ffff888003842a00 R15: f=
fffffff8150e1c9                                                            =
                                                                           =
                                =

  [    6.029269][    C4] FS:  0000000000000000(0000) GS:ffff88803ea00000(00=
00) knlGS:0000000000000000                                                 =
                                                                           =
                                =

  [    6.029269][    C4] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033 =
                                                                           =
                                                                           =
                                =

  [    6.029269][    C4] CR2: 0000000000000000 CR3: 0000000002011000 CR4: 0=
0000000000006e0                                                            =
                                                                           =
                                =

  [    6.029269][    C4] Call Trace:                                       =
                                                                           =
                                                                           =
                                =

  [    6.029269][    C4]  device_add+0x59/0x7b0                            =
                                                                           =
                                                                           =
                                =

  [    6.029269][    C4]  device_create+0xea/0x130                         =
                                                                           =
                                                                           =
                                =

  [    6.029269][    C4]  ? cpu_report_death+0x40/0x40                     =
                                                                           =
                                                                           =
                                =

  [    6.029269][    C4]  ? cpu_report_death+0x40/0x40                     =
                                                                           =
                                                                           =
                                =

  [    6.029269][    C4]  ? msr_devnode+0x20/0x20                          =
                                                                           =
                                                                           =
                                =

  [    6.029269][    C4]  msr_device_create+0x28/0x40                      =
                                                                           =
                                                                           =
                                =

  [    6.029269][    C4]  cpuhp_invoke_callback+0x140/0x2f0                =
                                                                           =
                                                                           =
                                =

  [    6.029269][    C4]  ? finish_task_switch+0x8c/0x230                  =
                                                                           =
                                                                           =
                                =

  [    6.029269][    C4]  ? cpu_report_death+0x40/0x40                     =
                                                                           =
                                                                           =
                                =

  [    6.029269][    C4]  cpuhp_thread_fun+0x118/0x1a0                     =
                                                                           =
                                                                           =
                                =

  [    6.029269][    C4]  ? cpu_report_death+0x40/0x40                     =
                                                                           =
                                                                           =
                                =

  [    6.029269][    C4]  smpboot_thread_fn+0x1b9/0x270                    =
                                                                           =
                                                                           =
                                =

  [    6.029269][    C4]  kthread+0x14b/0x160                              =
                                                                           =
                                                                           =
                                =

  [    6.029269][    C4]  ? kthread_unuse_mm+0xf0/0xf0                     =
                                                                           =
                                                                           =
                                =

  [    6.029269][    C4]  ret_from_fork+0x1f/0x30                          =
                                                                           =
                                                                           =
                                =

  [    6.029269][    C4] ---[ end trace 1336f71544bb94e4 ]---

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1920934/+subscriptions

