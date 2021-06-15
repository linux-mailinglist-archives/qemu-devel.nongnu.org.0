Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA213A7612
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 06:45:40 +0200 (CEST)
Received: from localhost ([::1]:37160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt0xH-0001RS-5U
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 00:45:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lt0vy-0000eU-Hg
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 00:44:18 -0400
Received: from mail.ispras.ru ([83.149.199.84]:56780)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lt0vw-0002Iw-5j
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 00:44:18 -0400
Received: from [192.168.0.92] (unknown [62.118.138.151])
 by mail.ispras.ru (Postfix) with ESMTPSA id 910E140D4004;
 Tue, 15 Jun 2021 04:44:08 +0000 (UTC)
Subject: Re: [PATCH] virtio: disable ioeventfd for record/replay
To: qemu-devel@nongnu.org
References: <162125678869.1252810.4317416444097392406.stgit@pasha-ThinkPad-X280>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <2bc04210-3b4e-4a03-2429-f3a229b3f764@ispras.ru>
Date: Tue, 15 Jun 2021 07:44:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <162125678869.1252810.4317416444097392406.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.489,
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

On 17.05.2021 16:06, Pavel Dovgalyuk wrote:
> virtio devices support separate iothreads waiting for
> events from file descriptors. These are asynchronous
> events that can't be recorded and replayed, therefore
> this patch disables ioeventfd for all devices when
> record or replay is enabled.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>   hw/s390x/virtio-ccw.c   |    6 ++++++
>   hw/virtio/virtio-mmio.c |    6 ++++++
>   hw/virtio/virtio-pci.c  |    6 ++++++
>   3 files changed, 18 insertions(+)
> 
> diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
> index 92b950e09a..bd8b9c5755 100644
> --- a/hw/s390x/virtio-ccw.c
> +++ b/hw/s390x/virtio-ccw.c
> @@ -31,6 +31,7 @@
>   #include "trace.h"
>   #include "hw/s390x/css-bridge.h"
>   #include "hw/s390x/s390-virtio-ccw.h"
> +#include "sysemu/replay.h"
>   
>   #define NR_CLASSIC_INDICATOR_BITS 64
>   
> @@ -769,6 +770,11 @@ static void virtio_ccw_device_realize(VirtioCcwDevice *dev, Error **errp)
>           dev->flags &= ~VIRTIO_CCW_FLAG_USE_IOEVENTFD;
>       }
>   
> +    /* fd-based ioevents can't be synchronized in record/replay */
> +    if (replay_mode != REPLAY_MODE_NONE) {
> +        dev->flags &= ~VIRTIO_CCW_FLAG_USE_IOEVENTFD;
> +    }
> +
>       if (k->realize) {
>           k->realize(dev, &err);
>           if (err) {
> diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> index 5952471b38..1af48a1b04 100644
> --- a/hw/virtio/virtio-mmio.c
> +++ b/hw/virtio/virtio-mmio.c
> @@ -29,6 +29,7 @@
>   #include "qemu/host-utils.h"
>   #include "qemu/module.h"
>   #include "sysemu/kvm.h"
> +#include "sysemu/replay.h"
>   #include "hw/virtio/virtio-mmio.h"
>   #include "qemu/error-report.h"
>   #include "qemu/log.h"
> @@ -740,6 +741,11 @@ static void virtio_mmio_realizefn(DeviceState *d, Error **errp)
>           proxy->flags &= ~VIRTIO_IOMMIO_FLAG_USE_IOEVENTFD;
>       }
>   
> +    /* fd-based ioevents can't be synchronized in record/replay */
> +    if (replay_mode != REPLAY_MODE_NONE) {
> +        proxy->flags &= ~VIRTIO_IOMMIO_FLAG_USE_IOEVENTFD;
> +    }
> +
>       if (proxy->legacy) {
>           memory_region_init_io(&proxy->iomem, OBJECT(d),
>                                 &virtio_legacy_mem_ops, proxy,
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index b321604d9b..f1e105fa52 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -37,6 +37,7 @@
>   #include "qemu/range.h"
>   #include "hw/virtio/virtio-bus.h"
>   #include "qapi/visitor.h"
> +#include "sysemu/replay.h"
>   
>   #define VIRTIO_PCI_REGION_SIZE(dev)     VIRTIO_PCI_CONFIG_OFF(msix_present(dev))
>   
> @@ -1760,6 +1761,11 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
>           proxy->flags &= ~VIRTIO_PCI_FLAG_USE_IOEVENTFD;
>       }
>   
> +    /* fd-based ioevents can't be synchronized in record/replay */
> +    if (replay_mode != REPLAY_MODE_NONE) {
> +        proxy->flags &= ~VIRTIO_PCI_FLAG_USE_IOEVENTFD;
> +    }
> +
>       /*
>        * virtio pci bar layout used by default.
>        * subclasses can re-arrange things if needed.
> 


