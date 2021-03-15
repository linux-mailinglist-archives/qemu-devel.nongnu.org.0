Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C203633AB5C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 07:02:10 +0100 (CET)
Received: from localhost ([::1]:55332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLgIr-0007ra-RJ
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 02:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lLgHP-00071V-UH
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 02:00:39 -0400
Received: from mail.ispras.ru ([83.149.199.84]:58184)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lLgHN-0001Du-3a
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 02:00:39 -0400
Received: from [192.168.0.92] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 0FA2940D403D;
 Mon, 15 Mar 2021 06:00:33 +0000 (UTC)
Subject: Re: [PATCH] hw/virtio: enable ioeventfd configuring for mmio
To: qemu-devel@nongnu.org
References: <161417359262.2250859.14712052392728549075.stgit@pasha-ThinkPad-X280>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <b78e7d8f-7604-3967-cb2b-18d364fe42c8@ispras.ru>
Date: Mon, 15 Mar 2021 09:00:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <161417359262.2250859.14712052392728549075.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

On 24.02.2021 16:33, Pavel Dovgalyuk wrote:
> This patch adds ioeventfd flag for virtio-mmio configuration.
> It allows switching ioeventfd on and off.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>   hw/virtio/virtio-mmio.c         |   11 ++++++++++-
>   include/hw/virtio/virtio-mmio.h |    5 +++++
>   2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> index 610661d6a5..551f831562 100644
> --- a/hw/virtio/virtio-mmio.c
> +++ b/hw/virtio/virtio-mmio.c
> @@ -36,7 +36,9 @@
>   
>   static bool virtio_mmio_ioeventfd_enabled(DeviceState *d)
>   {
> -    return kvm_eventfds_enabled();
> +    VirtIOMMIOProxy *proxy = VIRTIO_MMIO(d);
> +
> +    return (proxy->flags & VIRTIO_IOMMIO_FLAG_USE_IOEVENTFD) != 0;
>   }
>   
>   static int virtio_mmio_ioeventfd_assign(DeviceState *d,
> @@ -690,6 +692,8 @@ static Property virtio_mmio_properties[] = {
>       DEFINE_PROP_BOOL("format_transport_address", VirtIOMMIOProxy,
>                        format_transport_address, true),
>       DEFINE_PROP_BOOL("force-legacy", VirtIOMMIOProxy, legacy, true),
> +    DEFINE_PROP_BIT("ioeventfd", VirtIOMMIOProxy, flags,
> +                    VIRTIO_IOMMIO_FLAG_USE_IOEVENTFD_BIT, true),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> @@ -701,6 +705,11 @@ static void virtio_mmio_realizefn(DeviceState *d, Error **errp)
>       qbus_create_inplace(&proxy->bus, sizeof(proxy->bus), TYPE_VIRTIO_MMIO_BUS,
>                           d, NULL);
>       sysbus_init_irq(sbd, &proxy->irq);
> +
> +    if (!kvm_eventfds_enabled()) {
> +        proxy->flags &= ~VIRTIO_IOMMIO_FLAG_USE_IOEVENTFD;
> +    }
> +
>       if (proxy->legacy) {
>           memory_region_init_io(&proxy->iomem, OBJECT(d),
>                                 &virtio_legacy_mem_ops, proxy,
> diff --git a/include/hw/virtio/virtio-mmio.h b/include/hw/virtio/virtio-mmio.h
> index d4c4c386ab..090f7730e7 100644
> --- a/include/hw/virtio/virtio-mmio.h
> +++ b/include/hw/virtio/virtio-mmio.h
> @@ -49,12 +49,17 @@ typedef struct VirtIOMMIOQueue {
>       uint32_t used[2];
>   } VirtIOMMIOQueue;
>   
> +#define VIRTIO_IOMMIO_FLAG_USE_IOEVENTFD_BIT 1
> +#define VIRTIO_IOMMIO_FLAG_USE_IOEVENTFD \
> +        (1 << VIRTIO_IOMMIO_FLAG_USE_IOEVENTFD_BIT)
> +
>   struct VirtIOMMIOProxy {
>       /* Generic */
>       SysBusDevice parent_obj;
>       MemoryRegion iomem;
>       qemu_irq irq;
>       bool legacy;
> +    uint32_t flags;
>       /* Guest accessible state needing migration and reset */
>       uint32_t host_features_sel;
>       uint32_t guest_features_sel;
> 


