Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4212A3EFE78
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 09:59:15 +0200 (CEST)
Received: from localhost ([::1]:36334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGGTc-0004sp-H3
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 03:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mGGSe-0004D8-Jd
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 03:58:08 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38494
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mGGSc-0000Kh-OT
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 03:58:08 -0400
Received: from host86-179-247-14.range86-179.btcentralplus.com
 ([86.179.247.14] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mGGSJ-000BvH-6Z; Wed, 18 Aug 2021 08:57:47 +0100
To: Jason Thorpe <thorpej@me.com>, qemu-devel@nongnu.org
References: <D2F8C14D-1B82-4BDF-A1AC-AF1BF6D4CDD7@me.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <4443ee9c-c63a-f259-5768-6d0dcbb6b938@ilande.co.uk>
Date: Wed, 18 Aug 2021 08:58:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <D2F8C14D-1B82-4BDF-A1AC-AF1BF6D4CDD7@me.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.247.14
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: Please help me understand VIRTIO_F_IOMMU_PLATFORM
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.961,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/07/2021 16:41, Jason Thorpe wrote:

(added Michael on CC)

> Hey folks —
> 
> I’d like to be able to use VirtIO with qemu-system-alpha but, at least on a NetBSD x86_64 host, it does not currently work.  This is because virtio_bus_device_plugged() in hw/virtio/virtio-bus.c ends up picking address_space_memory as the DMA address space for the VirtIODevice.  This does not work for alpha because the CPU and PCI have different views of system memory.  All that’s needed to fix it is for virtio_bus_device_plugged() to call klass->get_dma_as(qbus->parent), but the code only does that if:
> 
> 	bool has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> 
> So, obviously, VIRTIO_F_IOMMU_PLATFORM is not getting set for an emulated alpha system, despite the alpha platform having one[*].  But it’s not clear to me that it’s appropriate for alpha to use VIRTIO_F_IOMMU_PLATFORM, at least from my reading of how it’s used.
> 
> In any case, the following extremely simple change allows me to use VirtIO devices in qemu-system-alpha with a NetBSD/alpha guest (and I’m told this also fixes using VirtIO devices in qemu-system-sparc64 for a NetBSD/sparc64 guest):
> 
> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> index 859978d248..c083e8d737 100644
> --- a/hw/virtio/virtio-bus.c
> +++ b/hw/virtio/virtio-bus.c
> @@ -85,6 +85,8 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>       if (klass->get_dma_as != NULL && has_iommu) {
>           virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
>           vdev->dma_as = klass->get_dma_as(qbus->parent);
> +    } else if (klass->get_dma_as != NULL) {
> +        vdev->dma_as = klass->get_dma_as(qbus->parent);
>       } else {
>           vdev->dma_as = &address_space_memory;
>       }
> 
> So, VirtIO experts, please weigh in on the correctness of this change… if it is, I’ll post the patch formally.
> 
> [*] The way the alpha platform works is that the IOMMU is used if the PCI device performs a memory access to a DMA window where SGMAPs are enabled.  If SGMAPs are not enabled in the DMA window the PCI device is accessing, the translation is performed directly by subtracting the address from the window’s Window Base and appending the result to the window’s Translated Base.  A typical alpha PCI platform has a 1GB DMA window at 1GB from the PCI’s perspective, which maps to 0-1GB in the system address map, and an alpha system with 1GB or less of RAM would thus not need to use the IOMMU, but the translation take place regardless.
> 
> -- thorpej

Hi Jason,

Thanks for looking at this! I've had previous discussions with Martin trying to 
figure out why virtio-blk-pci doesn't work with Netbsd/sparc64 so glad that you've 
been able to find the underlying cause.

My read on VIRTIO_F_IOMMU_PLATFORM is that this is declaring host IOMMU support so 
the implementation on the guest should not be relevant here.

Testing Linux/sparc64 boot from a virtio-blk-pci device on current git master shows I 
can boot from a virtio-blk-pci device without any problem, even though the existing 
code fails the has_iommu check and vdev->dma_as gets set to address_space_memory 
which is why I haven't spotted this before.

Stepping through the code shows that klass->get_dma_as() is pointing to 
virtio_pci_get_dma_as() which in turn returns pci_get_address_space(dev) which looks 
correct to me. I think that the logic to set vdev->dma_as is incorrect here since 
qemu-system-sparc64 has an emulated IOMMU with its own address space independent of 
whether the host has an IOMMU.

I modified your patch slightly as below and confirmed that I can still boot 
Linux/sparc64 here:

diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
index 859978d248..ee178b8223 100644
--- a/hw/virtio/virtio-bus.c
+++ b/hw/virtio/virtio-bus.c
@@ -82,9 +82,11 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
          return;
      }

-    if (klass->get_dma_as != NULL && has_iommu) {
-        virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
+    if (klass->get_dma_as != NULL) {
          vdev->dma_as = klass->get_dma_as(qbus->parent);
+        if (has_iommu) {
+            virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
+        }
      } else {
          vdev->dma_as = &address_space_memory;
      }

Michael: can you comment further on whether the analysis and patch above are correct?


ATB,

Mark.

