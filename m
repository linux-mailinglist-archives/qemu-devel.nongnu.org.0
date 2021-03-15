Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5338D33B2B3
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 13:27:26 +0100 (CET)
Received: from localhost ([::1]:33356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLmJh-00039i-DU
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 08:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lLmDI-0007Qm-J6
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 08:20:49 -0400
Received: from indium.canonical.com ([91.189.90.7]:50810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lLmDG-00086l-C6
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 08:20:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lLmDC-00033z-Jl
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 12:20:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3DBC72E815F
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 12:20:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Mar 2021 12:11:47 -0000
From: Mauro Matteo Cascella <1909247@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: cve fuzzer qemu security
X-Launchpad-Bug-Information-Type: Public Security
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: yes
X-Launchpad-Bug-Commenters: a1xndr mauro-cascella
X-Launchpad-Bug-Reporter: Mauro Matteo Cascella (mauro-cascella)
X-Launchpad-Bug-Modifier: Mauro Matteo Cascella (mauro-cascella)
References: <160882932286.4370.15587232403500958955.malonedeb@wampee.canonical.com>
Message-Id: <161581030746.15952.7579843362299873456.malone@gac.canonical.com>
Subject: [Bug 1909247] Re: QEMU: use after free vulnerability in esp_do_dma()
 in hw/scsi/esp.c
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d4fcb062545ed29d3cd7773e52e43615e042623f"; Instance="production"
X-Launchpad-Hash: 39ebcfe29cf495df2f270a445069e005db723bb2
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
Reply-To: Bug 1909247 <1909247@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Technically, the first one is a heap use-after-free, while the second a
stack buffer overflow. They could be two different manifestations of the
same issue; they both originate from handle_ti() and the root cause may
be the same.

Heap uaf:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D             =

=3D=3D129653=3D=3DERROR: AddressSanitizer: heap-use-after-free on address 0=
x6290000b5000 at pc 0x7f0c3d947dd3 bp 0x7f0c13bfdac0 sp 0x7f0c13bfd270
READ of size 27 at 0x6290000b5000 thread T7  =

    #0 0x7f0c3d947dd2 in __interceptor_memcpy (/lib64/libasan.so.6+0x39dd2)=
     =

    #1 0x562c1c7292b2 in flatview_write_continue softmmu/physmem.c:2781
    #2 0x562c1c729589 in flatview_write softmmu/physmem.c:2816
    #3 0x562c1c729ef7 in address_space_write softmmu/physmem.c:2908
    #4 0x562c1c729faf in address_space_rw softmmu/physmem.c:2918
    #5 0x562c1c217754 in dma_memory_rw_relaxed include/sysemu/dma.h:8
    #6 0x562c1c2177a1 in dma_memory_rw include/sysemu/dma.h:127
    #7 0x562c1c21791b in pci_dma_rw include/hw/pci/pci.h:803
    #8 0x562c1c21b6e3 in esp_pci_dma_memory_rw hw/scsi/esp-pci.c:283
    #9 0x562c1c21ba6e in esp_pci_dma_memory_write hw/scsi/esp-pci.c:302
    #10 0x562c1c428685 in esp_do_dma hw/scsi/esp.c:526
    #11 0x562c1c429cb5 in handle_ti hw/scsi/esp.c:629
    ...

Stack bof:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D                              =
                                                                           =
                                         =

=3D=3D138588=3D=3DERROR: AddressSanitizer: stack-buffer-overflow on address=
 0x7ffc8a90c300 at pc 0x559b1de0780e bp 0x7ffc8a90bd10 sp 0x7ffc8a90bd08   =
                =

WRITE of size 4 at 0x7ffc8a90c300 thread T0                                =
                                                                           =
      =

    #0 0x559b1de0780d in stl_he_p include/qemu/bswap.h:353                 =
                                                          =

    #1 0x559b1de07dec in stn_he_p include/qemu/bswap.h:486
    #2 0x559b1de23e47 in flatview_read_continue softmmu/physmem.c:2841
    #3 0x559b1de24215 in flatview_read softmmu/physmem.c:2879
    #4 0x559b1de243b5 in address_space_read_full softmmu/physmem.c:2892
    #5 0x559b1de2462c in address_space_rw softmmu/physmem.c:2920
    #6 0x559b1d1ec514 in dma_memory_rw_relaxed include/sysemu/dma.h:88
    #7 0x559b1d1ec561 in dma_memory_rw include/sysemu/dma.h:127
    #8 0x559b1d1ec6db in pci_dma_rw include/hw/pci/pci.h:803
    #9 0x559b1d1f04a3 in esp_pci_dma_memory_rw hw/scsi/esp-pci.c:283
    #10 0x559b1d1f07f8 in esp_pci_dma_memory_read hw/scsi/esp-pci.c:296
    #11 0x559b1d66fab1 in esp_do_dma hw/scsi/esp.c:576
    #12 0x559b1d6746e1 in handle_ti hw/scsi/esp.c:845
    ...

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1909247

Title:
  QEMU: use after free vulnerability in esp_do_dma() in hw/scsi/esp.c

Status in QEMU:
  New

Bug description:
  A use-after-free vulnerability was found in the am53c974 SCSI host bus
  adapter emulation of QEMU. It could occur in the esp_do_dma() function
  in hw/scsi/esp.c while handling the 'Information Transfer' command
  (CMD_TI). A privileged guest user may abuse this flaw to crash the
  QEMU process on the host, resulting in a denial of service or
  potential code execution with the privileges of the QEMU process.

  This issue was reported by Cheolwoo Myung (Seoul National University).

  Original report:
  Using hypervisor fuzzer, hyfuzz, I found a use-after-free issue in
  am53c974 emulator of QEMU enabled ASan.

  It occurs while transferring information, as it does not check the
  buffer to be transferred.

  A malicious guest user/process could use this flaw to crash the QEMU
  process resulting in DoS scenario.

  To reproduce this issue, please run the QEMU with the following command
  line.

  # To enable ASan option, please set configuration with the following
  $ ./configure --target-list=3Di386-softmmu --disable-werror --enable-sani=
tizers
  $ make

  # To reproduce this issue, please run the QEMU process with the following=
 command line
  $ ./qemu-system-i386 -m 512 -drive file=3D./hyfuzz.img,index=3D0,media=3D=
disk,format=3Draw \
  -device am53c974,id=3Dscsi -device scsi-hd,drive=3DSysDisk \
  -drive id=3DSysDisk,if=3Dnone,file=3D./disk.img

  Please find attached the disk images to reproduce this issue.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1909247/+subscriptions

