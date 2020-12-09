Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA622D4C28
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 21:48:03 +0100 (CET)
Received: from localhost ([::1]:58876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn6NW-0006O4-Fc
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 15:48:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kn6Gg-0006yS-CG
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 15:40:58 -0500
Received: from indium.canonical.com ([91.189.90.7]:46372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kn6Gc-0007oz-0o
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 15:40:58 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kn6GY-0003ix-Rs
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 20:40:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D00C62E8019
 for <qemu-devel@nongnu.org>; Wed,  9 Dec 2020 20:40:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Dec 2020 20:30:24 -0000
From: Alexander Bulekov <1907497@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Alexander Bulekov (a1xndr)
Message-Id: <20201209203024.mvdoyhe3qqg6frgg@mozz.bu.edu>
Subject: [Bug 1907497] [NEW] [OSS-Fuzz] Issue 28435
 qemu:qemu-fuzz-i386-target-generic-fuzz-intel-hda: Stack-overflow in
 ldl_le_dma
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: dd9db6e38a69b429e800e5a725ffdd84617604d2
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
Reply-To: Bug 1907497 <1907497@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

 affects qemu

=3D=3D=3D Reproducer (build with --enable-sanitizers) =3D=3D=3D

cat << EOF | ./qemu-system-i386 -machine q35 -nodefaults \
-device intel-hda,id=3Dhda0 -device hda-output,bus=3Dhda0.0 \
-device hda-micro,bus=3Dhda0.0 -device hda-duplex,bus=3Dhda0.0 \
-qtest stdio
outl 0xcf8 0x80000804
outw 0xcfc 0xffff
write 0x0 0x1 0x12
write 0x2 0x1 0x2f
outl 0xcf8 0x80000811
outl 0xcfc 0x5a6a4406
write 0x6a44005a 0x1 0x11
write 0x6a44005c 0x1 0x3f
write 0x6a442050 0x4 0x0000446a
write 0x6a44204a 0x1 0xf3
write 0x6a44204c 0x1 0xff
writeq 0x6a44005a 0x17b3f0011
write 0x6a442050 0x4 0x0000446a
write 0x6a44204a 0x1 0xf3
write 0x6a44204c 0x1 0xff
EOF

=3D=3D=3D Stack Trace =3D=3D=3D
=3D=3D411958=3D=3DERROR: AddressSanitizer: stack-overflow on address 0x7ffc=
aeb8bc88 (pc 0x55c7c9dc1159 bp 0x7ffcaeb8c4d0 sp 0x7ffcaeb8bc90 T0)
    #0 0x55c7c9dc1159 in __asan_memcpy (u-system-i386+0x2a13159)
    #1 0x55c7cb2a457e in flatview_do_translate softmmu/physmem.c:513:12
    #2 0x55c7cb2bdab0 in flatview_translate softmmu/physmem.c:563:15
    #3 0x55c7cb2bdab0 in flatview_read softmmu/physmem.c:2861:10
    #4 0x55c7cb2bdab0 in address_space_read_full softmmu/physmem.c:2875:18
    #5 0x55c7caaec937 in dma_memory_rw_relaxed include/sysemu/dma.h:87:18
    #6 0x55c7caaec937 in dma_memory_rw include/sysemu/dma.h:110:12
    #7 0x55c7caaec937 in dma_memory_read include/sysemu/dma.h:116:12
    #8 0x55c7caaec937 in ldl_le_dma include/sysemu/dma.h:179:1
    #9 0x55c7caaec937 in ldl_le_pci_dma include/hw/pci/pci.h:816:1
    #10 0x55c7caaec937 in intel_hda_corb_run hw/audio/intel-hda.c:338:16
    #11 0x55c7cb2e7198 in memory_region_write_accessor softmmu/memory.c:491=
:5
    #12 0x55c7cb2e6bd3 in access_with_adjusted_size softmmu/memory.c:552:18
    #13 0x55c7cb2e646c in memory_region_dispatch_write softmmu/memory.c
    #14 0x55c7cb2c8445 in flatview_write_continue softmmu/physmem.c:2759:23
    #15 0x55c7cb2bdfb8 in flatview_write softmmu/physmem.c:2799:14
    #16 0x55c7cb2bdfb8 in address_space_write softmmu/physmem.c:2891:18
    #17 0x55c7caae2c54 in dma_memory_rw_relaxed include/sysemu/dma.h:87:18
    #18 0x55c7caae2c54 in dma_memory_rw include/sysemu/dma.h:110:12
    #19 0x55c7caae2c54 in dma_memory_write include/sysemu/dma.h:122:12
    #20 0x55c7caae2c54 in stl_le_dma include/sysemu/dma.h:179:1
    #21 0x55c7caae2c54 in stl_le_pci_dma include/hw/pci/pci.h:816:1
    #22 0x55c7caae2c54 in intel_hda_response hw/audio/intel-hda.c:370:5
    #23 0x55c7caaeca00 in intel_hda_corb_run hw/audio/intel-hda.c:342:9
    #24 0x55c7cb2e7198 in memory_region_write_accessor softmmu/memory.c:491=
:5
...

OSS-Fuzz Report: https://bugs.chromium.org/p/oss-
fuzz/issues/detail?id=3D28435

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1907497

Title:
  [OSS-Fuzz] Issue 28435 qemu:qemu-fuzz-i386-target-generic-fuzz-intel-
  hda: Stack-overflow in ldl_le_dma

Status in QEMU:
  New

Bug description:
   affects qemu

  =3D=3D=3D Reproducer (build with --enable-sanitizers) =3D=3D=3D

  cat << EOF | ./qemu-system-i386 -machine q35 -nodefaults \
  -device intel-hda,id=3Dhda0 -device hda-output,bus=3Dhda0.0 \
  -device hda-micro,bus=3Dhda0.0 -device hda-duplex,bus=3Dhda0.0 \
  -qtest stdio
  outl 0xcf8 0x80000804
  outw 0xcfc 0xffff
  write 0x0 0x1 0x12
  write 0x2 0x1 0x2f
  outl 0xcf8 0x80000811
  outl 0xcfc 0x5a6a4406
  write 0x6a44005a 0x1 0x11
  write 0x6a44005c 0x1 0x3f
  write 0x6a442050 0x4 0x0000446a
  write 0x6a44204a 0x1 0xf3
  write 0x6a44204c 0x1 0xff
  writeq 0x6a44005a 0x17b3f0011
  write 0x6a442050 0x4 0x0000446a
  write 0x6a44204a 0x1 0xf3
  write 0x6a44204c 0x1 0xff
  EOF

  =3D=3D=3D Stack Trace =3D=3D=3D
  =3D=3D411958=3D=3DERROR: AddressSanitizer: stack-overflow on address 0x7f=
fcaeb8bc88 (pc 0x55c7c9dc1159 bp 0x7ffcaeb8c4d0 sp 0x7ffcaeb8bc90 T0)
      #0 0x55c7c9dc1159 in __asan_memcpy (u-system-i386+0x2a13159)
      #1 0x55c7cb2a457e in flatview_do_translate softmmu/physmem.c:513:12
      #2 0x55c7cb2bdab0 in flatview_translate softmmu/physmem.c:563:15
      #3 0x55c7cb2bdab0 in flatview_read softmmu/physmem.c:2861:10
      #4 0x55c7cb2bdab0 in address_space_read_full softmmu/physmem.c:2875:18
      #5 0x55c7caaec937 in dma_memory_rw_relaxed include/sysemu/dma.h:87:18
      #6 0x55c7caaec937 in dma_memory_rw include/sysemu/dma.h:110:12
      #7 0x55c7caaec937 in dma_memory_read include/sysemu/dma.h:116:12
      #8 0x55c7caaec937 in ldl_le_dma include/sysemu/dma.h:179:1
      #9 0x55c7caaec937 in ldl_le_pci_dma include/hw/pci/pci.h:816:1
      #10 0x55c7caaec937 in intel_hda_corb_run hw/audio/intel-hda.c:338:16
      #11 0x55c7cb2e7198 in memory_region_write_accessor softmmu/memory.c:4=
91:5
      #12 0x55c7cb2e6bd3 in access_with_adjusted_size softmmu/memory.c:552:=
18
      #13 0x55c7cb2e646c in memory_region_dispatch_write softmmu/memory.c
      #14 0x55c7cb2c8445 in flatview_write_continue softmmu/physmem.c:2759:=
23
      #15 0x55c7cb2bdfb8 in flatview_write softmmu/physmem.c:2799:14
      #16 0x55c7cb2bdfb8 in address_space_write softmmu/physmem.c:2891:18
      #17 0x55c7caae2c54 in dma_memory_rw_relaxed include/sysemu/dma.h:87:18
      #18 0x55c7caae2c54 in dma_memory_rw include/sysemu/dma.h:110:12
      #19 0x55c7caae2c54 in dma_memory_write include/sysemu/dma.h:122:12
      #20 0x55c7caae2c54 in stl_le_dma include/sysemu/dma.h:179:1
      #21 0x55c7caae2c54 in stl_le_pci_dma include/hw/pci/pci.h:816:1
      #22 0x55c7caae2c54 in intel_hda_response hw/audio/intel-hda.c:370:5
      #23 0x55c7caaeca00 in intel_hda_corb_run hw/audio/intel-hda.c:342:9
      #24 0x55c7cb2e7198 in memory_region_write_accessor softmmu/memory.c:4=
91:5
  ...

  OSS-Fuzz Report: https://bugs.chromium.org/p/oss-
  fuzz/issues/detail?id=3D28435

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1907497/+subscriptions

