Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D6B36E875
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 12:13:46 +0200 (CEST)
Received: from localhost ([::1]:58892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc3g1-0005Sz-A0
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 06:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lc3dc-00049R-1u
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 06:11:16 -0400
Received: from indium.canonical.com ([91.189.90.7]:59924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lc3dZ-0001QE-Gx
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 06:11:15 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lc3dW-0002hX-F3
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 10:11:10 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F29712E8160
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 10:11:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Apr 2021 09:57:23 -0000
From: Thomas Huth <1910723@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: cve fuzzer security
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr mark-cave-ayland mauro-cascella
X-Launchpad-Bug-Reporter: Mauro Matteo Cascella (mauro-cascella)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161010205447.5394.7992680653208743690.malonedeb@gac.canonical.com>
Message-Id: <161969024428.13717.9245779233695177790.launchpad@wampee.canonical.com>
Subject: [Bug 1910723] Re: NULL pointer dereference issues in am53c974 SCSI
 host bus adapter
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 4b2e31f0481feff3f131418b8b76cc814c18fe7d
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
Reply-To: Bug 1910723 <1910723@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Tags removed: qemu

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1910723

Title:
  NULL pointer dereference issues in am53c974 SCSI host bus adapter

Status in QEMU:
  Fix Committed

Bug description:
  Two NULL pointer dereference issues were found in the am53c974 SCSI
  host bus adapter emulation of QEMU. They could occur while handling
  the 'Information Transfer' command (CMD_TI) in function handle_ti() in
  hw/scsi/esp.c, and could be abused by a malicious guest to crash the
  QEMU process on the host resulting in a denial of service.

  Both issues were reported by Cheolwoo Myung (Seoul National
  University). To reproduce them, configure and run QEMU as follows.
  Please find attached the required disk images.

  $ ./configure --target-list=3Dx86_64-softmmu --enable-kvm --enable-saniti=
zers
  $ make
  $ ./qemu-system-x86_64 -m 512 -drive file=3D./hyfuzz.img,index=3D0,media=
=3Ddisk,format=3Draw \
  -device am53c974,id=3Dscsi -device scsi-hd,drive=3DSysDisk \
  -drive id=3DSysDisk,if=3Dnone,file=3D./disk.img

  Additional info:
  RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=3D1909766
  RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=3D1909769

  ASAN logs:
  =3D=3D672133=3D=3D         =

  hw/scsi/scsi-bus.c:1385:12: runtime error: member access within null poin=
ter of type 'struct SCSIRequest'
  AddressSanitizer:DEADLYSIGNAL                                            =
                                =

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D             =

  =3D=3D672133=3D=3DERROR: AddressSanitizer: SEGV on unknown address 0x0000=
00000171 (pc 0x55bd63e20b85 bp 0x7f4b6fffdfa0 sp 0x7f4b6fffdf70 T7)
  =3D=3D672133=3D=3DThe signal is caused by a READ memory access.         =

  =3D=3D672133=3D=3DHint: address points to the zero page.                 =
                                        =

      #0 0x55bd63e20b85 in scsi_req_continue hw/scsi/scsi-bus.c:1385
      #1 0x55bd63ab34fb in esp_do_dma hw/scsi/esp.c:453       =

      #2 0x55bd63ab4b3c in handle_ti hw/scsi/esp.c:549          =

      #3 0x55bd63ab72a9 in esp_reg_write hw/scsi/esp.c:691                 =

      #4 0x55bd63d7b5dd in esp_pci_io_write hw/scsi/esp-pci.c:206    =

      #5 0x55bd645d55a3 in memory_region_write_accessor softmmu/memory.c:491
      #6 0x55bd645d5a24 in access_with_adjusted_size softmmu/memory.c:552
      #7 0x55bd645e2baa in memory_region_dispatch_write softmmu/memory.c:15=
01
      #8 0x55bd646b75ff in flatview_write_continue softmmu/physmem.c:2759
      #9 0x55bd646b79d1 in flatview_write softmmu/physmem.c:2799
      #10 0x55bd646b8341 in address_space_write softmmu/physmem.c:2891   =

      #11 0x55bd646b83f9 in address_space_rw softmmu/physmem.c:2901
      #12 0x55bd648c4736 in kvm_handle_io accel/kvm/kvm-all.c:2285
      #13 0x55bd648c69c8 in kvm_cpu_exec accel/kvm/kvm-all.c:2531
      #14 0x55bd647b2413 in kvm_vcpu_thread_fn accel/kvm/kvm-cpus.c:49
      #15 0x55bd64f560de in qemu_thread_start util/qemu-thread-posix.c:521
      #16 0x7f4b981763f8 in start_thread (/lib64/libpthread.so.0+0x93f8)
      #17 0x7f4b980a3902 in __GI___clone (/lib64/libc.so.6+0x101902)

  ---

  =3D=3D672020=3D=3D
  hw/scsi/esp.c:196:62: runtime error: member access within null pointer of=
 type 'struct SCSIDevice'
  AddressSanitizer:DEADLYSIGNAL                                            =
                                =

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D             =

  =3D=3D672020=3D=3DERROR: AddressSanitizer: SEGV on unknown address 0x0000=
00000098 (pc 0x559bc99946fd bp 0x7f08bd737fb0 sp 0x7f08bd737f70 T7)
  =3D=3D672020=3D=3DThe signal is caused by a READ memory access.         =

  =3D=3D672020=3D=3DHint: address points to the zero page.                 =
                                        =

      #0 0x559bc99946fd in do_busid_cmd hw/scsi/esp.c:196        =

      #1 0x559bc9994e71 in do_cmd hw/scsi/esp.c:220           =

      #2 0x559bc999ae81 in handle_ti hw/scsi/esp.c:555          =

      #3 0x559bc999d2a9 in esp_reg_write hw/scsi/esp.c:691                 =

      #4 0x559bc9c615dd in esp_pci_io_write hw/scsi/esp-pci.c:206    =

      #5 0x559bca4bb5a3 in memory_region_write_accessor softmmu/memory.c:491
      #6 0x559bca4bba24 in access_with_adjusted_size softmmu/memory.c:552
      #7 0x559bca4c8baa in memory_region_dispatch_write softmmu/memory.c:15=
01
      #8 0x559bca59d5ff in flatview_write_continue softmmu/physmem.c:2759
      #9 0x559bca59d9d1 in flatview_write softmmu/physmem.c:2799
      #10 0x559bca59e341 in address_space_write softmmu/physmem.c:2891   =

      #11 0x559bca59e3f9 in address_space_rw softmmu/physmem.c:2901
      #12 0x559bca7aa736 in kvm_handle_io accel/kvm/kvm-all.c:2285
      #13 0x559bca7ac9c8 in kvm_cpu_exec accel/kvm/kvm-all.c:2531
      #14 0x559bca698413 in kvm_vcpu_thread_fn accel/kvm/kvm-cpus.c:49
      #15 0x559bcae3c0de in qemu_thread_start util/qemu-thread-posix.c:521
      #16 0x7f08e57ba3f8 in start_thread (/lib64/libpthread.so.0+0x93f8)
      #17 0x7f08e56e7902 in __GI___clone (/lib64/libc.so.6+0x101902)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1910723/+subscriptions

