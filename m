Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E0D33A4DB
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 13:47:09 +0100 (CET)
Received: from localhost ([::1]:47076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLQ9E-0005C8-00
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 08:47:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lLQ7P-0004KL-5I
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 08:45:18 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:52621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lLQ7I-0000kg-4f
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 08:45:13 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9715A7456E3;
 Sun, 14 Mar 2021 13:45:04 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 24D3D7456B8; Sun, 14 Mar 2021 13:45:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 233FD7456B7;
 Sun, 14 Mar 2021 13:45:04 +0100 (CET)
Date: Sun, 14 Mar 2021 13:45:04 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Vitaly Chipounov <vitaly@cyberhaven.com>
Subject: Re: [PATCH] hw/display/virtio-vga: made vga memory size configurable
In-Reply-To: <20210314122314.3201195-1-vitaly@cyberhaven.com>
Message-ID: <21f7c376-931-b050-3d4a-aaedff26e78c@eik.bme.hu>
References: <20210314122314.3201195-1-vitaly@cyberhaven.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 14 Mar 2021, vitaly@cyberhaven.com wrote:
> From: Vitaly Chipounov <vitaly@cyberhaven.com>
>
> This enables higher resolutions. The default is still 8MB for
> backwards compatibility with existing snapshots.
>
> The property name "vgamem_fb" is similar to that of the other

Isn't that vgamem_mb? Code has that so it's just a typo in commit message.

Regards,
BALATON Zoltan

> graphic adapters.
>
> seabios/vgasrc/svgamodes.c needs to be updated as well.
> For example, adding the following line would expose
> a 3840x2160 resolution to the guest.
>
> { 0x199, { MM_DIRECT, 3840, 2160, 32, 8, 16, SEG_GRAPH } },
>
> Signed-off-by: Vitaly Chipounov <vitaly@cyberhaven.com>
> ---
> hw/display/virtio-vga.c | 3 ++-
> hw/virtio/virtio-pci.h  | 2 ++
> 2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
> index d3c6404061..657fafc48f 100644
> --- a/hw/display/virtio-vga.c
> +++ b/hw/display/virtio-vga.c
> @@ -118,7 +118,7 @@ static void virtio_vga_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>     int i;
>
>     /* init vga compat bits */
> -    vga->vram_size_mb = 8;
> +    vga->vram_size_mb = vpci_dev->vgamem_size_mb;
>     vga_common_init(vga, OBJECT(vpci_dev));
>     vga_init(vga, OBJECT(vpci_dev), pci_address_space(&vpci_dev->pci_dev),
>              pci_address_space_io(&vpci_dev->pci_dev), true);
> @@ -204,6 +204,7 @@ static void virtio_vga_set_big_endian_fb(Object *obj, bool value, Error **errp)
>
> static Property virtio_vga_base_properties[] = {
>     DEFINE_VIRTIO_GPU_PCI_PROPERTIES(VirtIOPCIProxy),
> +    DEFINE_PROP_UINT32("vgamem_mb", VirtIOPCIProxy, vgamem_size_mb, 8),
>     DEFINE_PROP_END_OF_LIST(),
> };
>
> diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
> index d7d5d403a9..8684311a8d 100644
> --- a/hw/virtio/virtio-pci.h
> +++ b/hw/virtio/virtio-pci.h
> @@ -151,6 +151,8 @@ struct VirtIOPCIProxy {
>     VirtIOIRQFD *vector_irqfd;
>     int nvqs_with_notifiers;
>     VirtioBusState bus;
> +
> +    uint32_t vgamem_size_mb;
> };
>
> static inline bool virtio_pci_modern(VirtIOPCIProxy *proxy)
>

