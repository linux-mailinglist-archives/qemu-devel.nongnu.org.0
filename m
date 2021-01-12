Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ADA2F2AD9
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 10:13:01 +0100 (CET)
Received: from localhost ([::1]:43686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzFjY-00087M-GM
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 04:13:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzFiB-0007cu-Bw
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:11:35 -0500
Received: from indium.canonical.com ([91.189.90.7]:33102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzFi8-0005c0-5H
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:11:35 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kzFi3-0003GM-Q8
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 09:11:28 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B40492E8168
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 09:11:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 Jan 2021 08:59:19 -0000
From: Thomas Huth <1911075@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided;
 assignee=jsnow@redhat.com; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: a1xndr
X-Launchpad-Bug-Reporter: Alexander Bulekov (a1xndr)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161041171173.17462.15833722387991998017.malonedeb@gac.canonical.com>
Message-Id: <161044195995.3097.5024578668760313577.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1911075] Re: [OSS-Fuzz] ahci: stack overflow in
 ahci_cond_start_engines
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe617ea08df036edd5c842aded2b315e1c090677"; Instance="production"
X-Launchpad-Hash: ca280deeaa1594ff9435808a453d1ac6833b6856
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
Reply-To: Bug 1911075 <1911075@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
     Assignee: (unassigned) =3D> John Snow (jnsnow)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1911075

Title:
  [OSS-Fuzz] ahci: stack overflow in ahci_cond_start_engines

Status in QEMU:
  New

Bug description:
  =3D=3D=3D Reproducer =3D=3D=3D
  while true; do cat << EOF; done | ./qemu-system-i386 -machine q35 -nodefa=
ults -nographic -qtest stdio -accel qtest
  outl 0xcf8 0x8000fa27
  outl 0xcfc 0x37414537
  outl 0xcf8 0x8000fa01
  outl 0xcfc 0x4606ce74
  writew 0x37000f01 0x215a
  writeq 0x37000100 0xfffaf
  writeq 0x37000115 0xffff373d27004037
  outl 0xcf8 0x8000fa01
  outl 0xcfc 0x4606ce74
  writeq 0x370000ff 0x3700011500
  writeq 0x37000115 0xc41ffffff035a5a
  outl 0xcf8 0x8000ea04
  outb 0xcfc 0x15
  outl 0xcf8 0x8000ea00
  outw 0xcfc 0x5a1f
  writeq 0x37000115 0x100007765746972
  writeq 0x37000115 0xbf00000000000000
  outl 0xcf8 0x8000ea04
  outb 0xcfc 0x15
  outl 0xcf8 0x8000fa46
  outb 0xcfc 0xff
  clock_step
  writeq 0x37000115 0xaf
  writeq 0x37000115 0x6301275541af7415
  writeq 0x37000115 0xafaf5a5a743715
  outb 0x64 0xfe
  EOF

  =3D=3D=3D Stack Trace =3D=3D=3D
  =3D=3D887446=3D=3DERROR: UndefinedBehaviorSanitizer: stack-overflow on ad=
dress 0x7ffe567cae0c (pc 0x7fdd9100819e bp 0x7ffe567cb2b0 sp 0x7ffe567cad40=
 T887446)

  #0 vfprintf
  #1 fprintf
  #2 ahci_mem_write /src/qemu/hw/ide/ahci.c:468:9
  #3 memory_region_write_accessor /src/qemu/softmmu/memory.c:491:5
  #4 access_with_adjusted_size /src/qemu/softmmu/memory.c:552:18
  #5 memory_region_dispatch_write /src/qemu/softmmu/memory.c:0:13
  #6 flatview_write_continue /src/qemu/softmmu/physmem.c:2759:23
  #7 flatview_write /src/qemu/softmmu/physmem.c:2799:14
  #8 address_space_write /src/qemu/softmmu/physmem.c:2891:18
  #9 address_space_unmap /src/qemu/softmmu/physmem.c:3217:9
  #10 dma_memory_unmap /src/qemu/include/sysemu/dma.h:226:5
  #11 map_page /src/qemu/hw/ide/ahci.c:249:9
  #12 ahci_map_clb_address /src/qemu/hw/ide/ahci.c:748:5
  #13 ahci_cond_start_engines /src/qemu/hw/ide/ahci.c:276:14
  #14 ahci_port_write /src/qemu/hw/ide/ahci.c:339:9
  #15 ahci_mem_write /src/qemu/hw/ide/ahci.c:513:9
  #16 memory_region_write_accessor /src/qemu/softmmu/memory.c:491:5
  #17 access_with_adjusted_size /src/qemu/softmmu/memory.c:552:18
  #18 memory_region_dispatch_write /src/qemu/softmmu/memory.c:0:13
  #19 flatview_write_continue /src/qemu/softmmu/physmem.c:2759:23
  #20 flatview_write /src/qemu/softmmu/physmem.c:2799:14
  #21 address_space_write /src/qemu/softmmu/physmem.c:2891:18
  #22 address_space_unmap /src/qemu/softmmu/physmem.c:3217:9
  #23 dma_memory_unmap /src/qemu/include/sysemu/dma.h:226:5
  #24 map_page /src/qemu/hw/ide/ahci.c:249:9
  #25 ahci_map_clb_address /src/qemu/hw/ide/ahci.c:748:5
  #26 ahci_cond_start_engines /src/qemu/hw/ide/ahci.c:276:14
  #27 ahci_port_write /src/qemu/hw/ide/ahci.c:339:9
  #28 ahci_mem_write /src/qemu/hw/ide/ahci.c:513:9
  ... Repeat until we run out of stack

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1911075/+subscriptions

