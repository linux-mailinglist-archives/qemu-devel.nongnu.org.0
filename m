Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8018C33F275
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:20:45 +0100 (CET)
Received: from localhost ([::1]:42558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMX2S-0003WQ-IO
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lMX0U-0002aI-2H
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 10:18:42 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:40467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lMX0Q-0004iB-V2
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 10:18:41 -0400
Received: from [192.168.100.1] ([82.142.20.38]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M9WmQ-1lJFDJ2Feu-005cfv; Wed, 17 Mar 2021 15:18:33 +0100
To: qemu-devel@nongnu.org
References: <20210314200300.3259170-1-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] virtio: Fix virtio_mmio_read()/virtio_mmio_write()
Message-ID: <42d9ab9f-d645-99f2-63b5-459d7a97d029@vivier.eu>
Date: Wed, 17 Mar 2021 15:18:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210314200300.3259170-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:I8AcXOtAB+phxVVfoETUwI8U/ZqLI6cA2woFMfUR2LohLsy/Q+v
 6t2ro/IuvAWjKI1KawbZKF6mJwnIYmSbmrnw1XSezu1HUMqf51aMB7LHQQ87sJvuSlaFG98
 Z1WQNFmORxznL4lE6F2shFYcNmvkLKkWfgyRVlLYm8xnGiJurtGpk2qni+Qh5Vqbivw0ZC2
 sXX7riD0QvA1in4RGuMpA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yzUxlSXnFeQ=:xuq+5MhrxfhZQYma6FsSGS
 cuEORkijc+x5RLZn744552aL2euNi+Y63sXjVUfW3szQQAyDkbdnRDrX6t5iXb2zpZOXt7NT3
 1kgTAeDy0NgHJKkPS6ZL54HCiNFHNtZk9oo10/FV1KzM7BpWFR9fLaO+8ryyIY9pBEYNFveFe
 0CEgEKlAs5Y3h7HHrmEgqCufTxQdbKs1Re2eSrWU8RxG6GUmNPKPoxB1Wp10pBc4z3soYY7FJ
 0qEvJOyU7HEejuGimB3RDQJvpvsyfdVMGcAcBe3DnDCGprXgh4UCfmPgK6QPQJiW+0tgNVa1M
 U6uutaV7W4yrd9cZU/qfoOfplI1TyAuIbzjovQfPOGYxZIUccVscCo1+Vrj3HXuOEPJ6DwcDi
 gkpa08C8u6Yff7USvTVu9wFSXoDZh2SrPn7PxcIlAonX8cNjHF870pPNtwG+n
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

could this fix be merged in QEMU 6.0?

Thanks,
Laurent

Le 14/03/2021 à 21:03, Laurent Vivier a écrit :
> Both functions don't check the personality of the interface (legacy or
> modern) before accessing the configuration memory and always use
> virtio_config_readX()/virtio_config_writeX().
> 
> With this patch, they now check the personality and in legacy mode
> call virtio_config_readX()/virtio_config_writeX(), otherwise call
> virtio_config_modern_readX()/virtio_config_modern_writeX().
> 
> This change has been tested with virtio-mmio guests (virt stretch/armhf and
> virt sid/m68k) and virtio-pci guests (pseries RHEL-7.3/ppc64 and /ppc64le).
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  hw/virtio/virtio-mmio.c | 74 +++++++++++++++++++++++++++++------------
>  1 file changed, 52 insertions(+), 22 deletions(-)
> 
> diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> index 6990b9879cf0..342c918ea7b7 100644
> --- a/hw/virtio/virtio-mmio.c
> +++ b/hw/virtio/virtio-mmio.c
> @@ -112,15 +112,28 @@ static uint64_t virtio_mmio_read(void *opaque, hwaddr offset, unsigned size)
>  
>      if (offset >= VIRTIO_MMIO_CONFIG) {
>          offset -= VIRTIO_MMIO_CONFIG;
> -        switch (size) {
> -        case 1:
> -            return virtio_config_readb(vdev, offset);
> -        case 2:
> -            return virtio_config_readw(vdev, offset);
> -        case 4:
> -            return virtio_config_readl(vdev, offset);
> -        default:
> -            abort();
> +        if (proxy->legacy) {
> +            switch (size) {
> +            case 1:
> +                return virtio_config_readb(vdev, offset);
> +            case 2:
> +                return virtio_config_readw(vdev, offset);
> +            case 4:
> +                return virtio_config_readl(vdev, offset);
> +            default:
> +                abort();
> +            }
> +        } else {
> +            switch (size) {
> +            case 1:
> +                return virtio_config_modern_readb(vdev, offset);
> +            case 2:
> +                return virtio_config_modern_readw(vdev, offset);
> +            case 4:
> +                return virtio_config_modern_readl(vdev, offset);
> +            default:
> +                abort();
> +            }
>          }
>      }
>      if (size != 4) {
> @@ -245,20 +258,37 @@ static void virtio_mmio_write(void *opaque, hwaddr offset, uint64_t value,
>  
>      if (offset >= VIRTIO_MMIO_CONFIG) {
>          offset -= VIRTIO_MMIO_CONFIG;
> -        switch (size) {
> -        case 1:
> -            virtio_config_writeb(vdev, offset, value);
> -            break;
> -        case 2:
> -            virtio_config_writew(vdev, offset, value);
> -            break;
> -        case 4:
> -            virtio_config_writel(vdev, offset, value);
> -            break;
> -        default:
> -            abort();
> +        if (proxy->legacy) {
> +            switch (size) {
> +            case 1:
> +                virtio_config_writeb(vdev, offset, value);
> +                break;
> +            case 2:
> +                virtio_config_writew(vdev, offset, value);
> +                break;
> +            case 4:
> +                virtio_config_writel(vdev, offset, value);
> +                break;
> +            default:
> +                abort();
> +            }
> +            return;
> +        } else {
> +            switch (size) {
> +            case 1:
> +                virtio_config_modern_writeb(vdev, offset, value);
> +                break;
> +            case 2:
> +                virtio_config_modern_writew(vdev, offset, value);
> +                break;
> +            case 4:
> +                virtio_config_modern_writel(vdev, offset, value);
> +                break;
> +            default:
> +                abort();
> +            }
> +            return;
>          }
> -        return;
>      }
>      if (size != 4) {
>          qemu_log_mask(LOG_GUEST_ERROR,
> 


