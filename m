Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 489E2719E8
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jul 2019 16:05:19 +0200 (CEST)
Received: from localhost ([::1]:42772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpvPp-0007II-Hh
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 10:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43368)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <sgarzare@redhat.com>) id 1hpvPX-0006og-Ca
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 10:05:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1hpvPW-0005Xf-EQ
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 10:04:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48962)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1hpvPW-0005Wr-9H
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 10:04:58 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F1D5581DE0;
 Tue, 23 Jul 2019 14:04:56 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-116-45.ams2.redhat.com
 [10.36.116.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C39BB5B687;
 Tue, 23 Jul 2019 14:04:46 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jul 2019 16:04:43 +0200
Message-Id: <20190723140445.12748-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Tue, 23 Jul 2019 14:04:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 0/2] pc: mmap kernel (ELF image) and initrd
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Julio Montes <julio.montes@intel.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In order to reduce the memory footprint when PVH kernel and initrd
are used, we map them into memory instead of reading them.
In this way we can share them between multiple instances of QEMU.

v2:
- Patch 1: used g_mapped_file_new_from_fd() with 'writeble' set to 'true'=
,
           since we can modify the mapped buffer. [Paolo, Peter]

These are the results using a PVH kernel and initrd (cpio):
- memory footprint (using smem) [MB]
        QEMU              before                   now
    # instances        USS      PSS            USS      PSS
         1           102.0M   105.8M         102.3M   106.2M
         2            94.6M   101.2M          72.3M    90.1M
         4            94.1M    98.0M          72.0M    81.5M
         8            94.0M    96.2M          71.8M    76.9M
        16            93.9M    95.1M          71.6M    74.3M

    Initrd size: 3.0M
    Kernel
        image size: 28M
        sections size [size -A -d vmlinux]:  18.9M

- boot time [ms]
                          before                   now
 qemu_init_end:           63.85                   55.91
 linux_start_kernel:      82.11 (+18.26)          74.51 (+18.60)
 linux_start_user:       169.94 (+87.83)         159.06 (+84.56)

QEMU command used:
./qemu-system-x86_64 -bios /path/to/seabios/out/bios.bin -no-hpet \
    -machine q35,accel=3Dkvm,kernel_irqchip,nvdimm,sata=3Doff,smbus=3Doff=
,vmport=3Doff \
    -cpu host -m 1G -smp 1 -vga none -display none -no-user-config -nodef=
aults \
    -kernel /path/to/vmlinux -initrd /path/to/rootfs.cpio \
    -append 'root=3D/dev/mem0 ro console=3Dhvc0 pci=3Dlastbus=3D0 nosmap'

Stefano Garzarella (2):
  elf-ops.h: Map into memory the ELF to load
  hw/i386/pc: Map into memory the initrd

 hw/i386/pc.c         | 15 ++++++++---
 include/hw/elf_ops.h | 64 ++++++++++++++++++++++++--------------------
 2 files changed, 46 insertions(+), 33 deletions(-)

--=20
2.20.1


