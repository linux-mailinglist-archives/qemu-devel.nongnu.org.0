Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DAA3BA755
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 07:15:47 +0200 (CEST)
Received: from localhost ([::1]:58074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzY0H-0002Ll-Rl
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 01:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lzXzA-0001gt-Nk
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 01:14:36 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40626
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lzXz9-0003hz-2h
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 01:14:36 -0400
Received: from host86-179-59-238.range86-179.btcentralplus.com
 ([86.179.59.238] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lzXyq-0004ub-4n; Sat, 03 Jul 2021 06:14:16 +0100
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210701071837.738897-1-marcandre.lureau@redhat.com>
 <20210701071837.738897-2-marcandre.lureau@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <5e843cd1-baf8-f457-f9cf-a314bc8dbfff@ilande.co.uk>
Date: Sat, 3 Jul 2021 06:14:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701071837.738897-2-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.59.238
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 2/2] hw/display: fail early when multiple virgl devices
 are requested
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
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
Cc: kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/07/2021 08:18, marcandre.lureau@redhat.com wrote:

> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> This avoids failing to initialize virgl and crashing later on, and clear
> the user expectations.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/display/virtio-gpu-gl.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
> index d971b48080..c973d4824b 100644
> --- a/hw/display/virtio-gpu-gl.c
> +++ b/hw/display/virtio-gpu-gl.c
> @@ -25,6 +25,8 @@
>   
>   #include <virglrenderer.h>
>   
> +static int virgl_count = 0;
> +
>   static void virtio_gpu_gl_update_cursor_data(VirtIOGPU *g,
>                                                struct virtio_gpu_scanout *s,
>                                                uint32_t resource_id)
> @@ -113,6 +115,11 @@ static void virtio_gpu_gl_device_realize(DeviceState *qdev, Error **errp)
>       return;
>   #endif
>   
> +    if (virgl_count++ > 0) {
> +        error_setg(errp, "multiple virgl devices aren't supported yet");
> +        return;
> +    }
> +
>       if (!display_opengl) {
>           error_setg(errp, "opengl is not available");
>           return;
> @@ -124,6 +131,10 @@ static void virtio_gpu_gl_device_realize(DeviceState *qdev, Error **errp)
>   
>       virtio_gpu_device_realize(qdev, errp);
>   }
> +static void virtio_gpu_gl_device_unrealize(DeviceState *dev)
> +{
> +    virgl_count--;
> +}
>   
>   static Property virtio_gpu_gl_properties[] = {
>       DEFINE_PROP_BIT("stats", VirtIOGPU, parent_obj.conf.flags,
> @@ -144,6 +155,7 @@ static void virtio_gpu_gl_class_init(ObjectClass *klass, void *data)
>       vgc->update_cursor_data = virtio_gpu_gl_update_cursor_data;
>   
>       vdc->realize = virtio_gpu_gl_device_realize;
> +    vdc->unrealize = virtio_gpu_gl_device_unrealize;
>       vdc->reset = virtio_gpu_gl_reset;
>       device_class_set_props(dc, virtio_gpu_gl_properties);
>   }

FWIW I think the best way to prevent instantiation of multiple devices is to use the 
QOM API to detect if more than one instance of a class exists within the QOM tree.

Have a look at fw_cfg_find() and its usage from fw_cfg_common_realize() in 
hw/nvram/fw_cfg.c for an example of this.


ATB,

Mark.

