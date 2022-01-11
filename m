Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEBD48A809
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 07:59:46 +0100 (CET)
Received: from localhost ([::1]:54788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7B8C-0007Yy-UG
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 01:59:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1n7Aka-000431-4n
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 01:35:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1n7AkW-0002tT-SX
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 01:35:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641882915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Iuk0eX2NrIgx+S4v6VTPN3i1rtPABTyhfcBu7xZsFnY=;
 b=FVSYFIGqHLfOvODEvdXzAerJUE8QYt59e+Rbhjjp4l5GbjecoA/1SnoJKrXFAU6Gk/KROY
 Nupn4Rikd0zY7PNHkNNiaWZW7/C7+sAoEyygBgeG6UjUj130Gl1dOsthWLhBTCeSiTFNe4
 ZTMyOR0eYDG9YpquvP53KpKESRWn/9Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-ltQGLUUYO5m7HFz59UNv5g-1; Tue, 11 Jan 2022 01:34:06 -0500
X-MC-Unique: ltQGLUUYO5m7HFz59UNv5g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BC4D10066FE;
 Tue, 11 Jan 2022 06:34:05 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-60.bne.redhat.com [10.64.54.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 022A97B034;
 Tue, 11 Jan 2022 06:33:35 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v4 0/2] hw/arm/virt: Support for virtio-mem-pci
Date: Tue, 11 Jan 2022 14:33:27 +0800
Message-Id: <20220111063329.74447-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 shan.gavin@gmail.com, Jonathan.Cameron@huawei.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series supports virtio-mem-pci device, by simply following the
implementation on x86. The exception is the block size is 512MB on
ARM64 instead of 128MB on x86, compatible with the memory section
size in linux guest.

The work was done by David Hildenbrand and then Jonathan Cameron. I'm
taking the patch and putting more efforts, which is all about testing
to me at current stage.

Testing
=======
The upstream linux kernel (v5.16.rc3) is used on host/guest during
the testing. The guest kernel includes changes to enable virtio-mem
driver, which is simply to enable CONFIG_VIRTIO_MEM on ARM64.

Mutiple combinations like page sizes on host/guest, memory backend
device etc are covered in the testing. Besides, migration is also
tested. The following command lines are used for VM or virtio-mem-pci
device hot-add. It's notable that virtio-mem-pci device hot-remove
isn't supported, similar to what we have on x86.

  host.pgsize  guest.pgsize  backend    hot-add  hot-remove  migration
  ---------------------------------------------------------------------
   4KB         4KB           normal     ok       ok          ok
                             THP        ok       ok          ok
                             hugeTLB    ok       ok          ok
   4KB         64KB          normal     ok       ok          ok
                             THP        ok       ok          ok
                             hugeTLB    ok       ok          ok
  64KB         4KB           normal     ok       ok          ok
                             THP        ok       ok          ok
                             hugeTLB    ok       ok          ok
  64KB         64KB          normal     ok       ok          ok
                             THP        ok       ok          ok
                             hugeTLB    ok       ok          ok

The command lines are used for VM. When hugeTLBfs is used, all memory
backend objects are popuated on /dev/hugepages-2048kB or
/dev/hugepages-524288kB, depending on the host page sizes.

  /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64                       \
  -accel kvm -machine virt,gic-version=host                                     \
  -cpu host -smp 4,sockets=2,cores=2,threads=1                                  \
  -m 1024M,slots=16,maxmem=64G                                                  \
  -object memory-backend-ram,id=mem0,size=512M                                  \
  -object memory-backend-ram,id=mem1,size=512M                                  \
  -numa node,nodeid=0,cpus=0-1,memdev=mem0                                      \
  -numa node,nodeid=1,cpus=2-3,memdev=mem1                                      \
     :
  -kernel /home/gavin/sandbox/linux.guest/arch/arm64/boot/Image                 \
  -initrd /home/gavin/sandbox/images/rootfs.cpio.xz                             \
  -append earlycon=pl011,mmio,0x9000000                                         \
  -device pcie-root-port,bus=pcie.0,chassis=1,id=pcie.1                         \
  -device pcie-root-port,bus=pcie.0,chassis=2,id=pcie.2                         \
  -device pcie-root-port,bus=pcie.0,chassis=3,id=pcie.3                         \
  -object memory-backend-ram,id=vmem0,size=512M                                 \
  -device virtio-mem-pci,id=vm0,bus=pcie.1,memdev=vmem0,node=0,requested-size=0 \
  -object memory-backend-ram,id=vmem1,size=512M                                 \
  -device virtio-mem-pci,id=vm1,bus=pcie.2,memdev=vmem1,node=1,requested-size=0

Command lines used for memory hot-add and hot-remove:

  (qemu) qom-set vm1 requested-size 512M
  (qemu) qom-set vm1 requested-size 0
  (qemu) qom-set vm1 requested-size 512M

Command lines used for virtio-mem-pci device hot-add:

  (qemu) object_add memory-backend-ram,id=hp-mem1,size=512M
  (qemu) device_add virtio-mem-pci,id=hp-vm1,bus=pcie.3,memdev=hp-mem1,node=1
  (qemu) qom-set hp-vm1 requested-size 512M
  (qemu) qom-set hp-vm1 requested-size 0
  (qemu) qom-set hp-vm1 requested-size 512M

Changelog
=========
v4:
  * Improved comments in virt_virtio_md_pci_pre_plug()                  (Peter)
v3:
  * Reshuffle patches                                                   (David)
  * Suggested code refactoring for virtio_mem_default_thp_size()        (David)
  * Pick r-b from Jonathan and David                                    (Gavin)
v2:
  * Include David/Jonathan as co-developers in the commit log           (David)
  * Decrease VIRTIO_MEM_USABLE_EXTENT to 512MB on ARM64 in PATCH[1/2]   (David)
  * PATCH[2/2] is added to correct the THP sizes on ARM64               (David)

Gavin Shan (2):
  virtio-mem: Correct default THP size for ARM64
  hw/arm/virt: Support for virtio-mem-pci

 hw/arm/Kconfig         |  1 +
 hw/arm/virt.c          | 70 ++++++++++++++++++++++++++++++++++++++++++
 hw/virtio/virtio-mem.c | 36 ++++++++++++++--------
 3 files changed, 94 insertions(+), 13 deletions(-)

-- 
2.23.0


