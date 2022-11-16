Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF79D62C45F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 17:27:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovLFO-0007dt-9c; Wed, 16 Nov 2022 11:26:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ovLFM-0007Zu-4w
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 11:26:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ovLFK-0005wK-KV
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 11:26:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668616001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pHgffWFeQ2hYcIQZEALFqlCTRfJH5smhKpA4UG5v6ow=;
 b=dPEsxPUgZmpInEGTym19vmE0riQQKjyCmCnqAhqcnOiOaNv/5iWIvssi2XOCU5wB1DdC4/
 1inUkY2lNEf61D3dJfuAc4qUg7yvEo+AspWKrubQ6G0NvSKyy4iOMvsEng0fdjDWHChIf+
 xTLzT0SFTTun0/vW8xpEPGpW7MrDbe8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-28-QnXerWLHNv-5a0qjphDpIA-1; Wed, 16 Nov 2022 11:26:39 -0500
X-MC-Unique: QnXerWLHNv-5a0qjphDpIA-1
Received: by mail-wm1-f70.google.com with SMTP id
 f1-20020a1cc901000000b003cf703a4f08so679675wmb.2
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 08:26:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pHgffWFeQ2hYcIQZEALFqlCTRfJH5smhKpA4UG5v6ow=;
 b=XxugY0AHWWqAbTzGb2fFVxI7wqP+MUcKxO9HpZvqCEklnUIl43kDT+2IWbBQ7PyKEI
 gPtMKtO0jP7jr5ugnkHfA2byoWrAKHkKdimuGfY1fqQaJ7bEqeiRnThrMv904A799df9
 lwdVO/UNEKaI8Ohv7kqFbRJj9qESTIesqgz/DQuCi5iJ9zhSMW76GZUm+9hRgfAGhRis
 CJR6YJoZj9mYwBiAKiRWue+m1DrGdMBw2xYQaAq8NsiRAaQxNG1yRSMJ5Tc9zSVCzy8Y
 2p0A5llia9WE1MiBy06aCwXyWSUEG0Z716OFVSyHV2zPZbiAf6JErGaPfjbYKp2Baq3v
 18vw==
X-Gm-Message-State: ANoB5pl6oEejo9IwIunJYDFHP/W8m/RN/++FrljVG7QjQ3qWM3a0G+Ph
 KM9qzj7hn9GjcltioaRINb8v641+QjqFJ+PDyIMw5KJ+/IHR5mbzx5kxbaPWq0ybhXuH2y5njCa
 u+tpG3Y1mRmLs/5E=
X-Received: by 2002:a05:600c:4aa9:b0:3cf:68bb:f5b8 with SMTP id
 b41-20020a05600c4aa900b003cf68bbf5b8mr2681944wmp.67.1668615998566; 
 Wed, 16 Nov 2022 08:26:38 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6dV2YX05fToyUtIjFFXikgQTWBkWtQc6ijCoou6mss0sFp90FsfRCsto/aV/D9v3CQ9pTXeA==
X-Received: by 2002:a05:600c:4aa9:b0:3cf:68bb:f5b8 with SMTP id
 b41-20020a05600c4aa900b003cf68bbf5b8mr2681924wmp.67.1668615998366; 
 Wed, 16 Nov 2022 08:26:38 -0800 (PST)
Received: from redhat.com ([2.52.131.207]) by smtp.gmail.com with ESMTPSA id
 c2-20020a05600c0a4200b003cfd4cf0761sm3126340wmq.1.2022.11.16.08.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 08:26:38 -0800 (PST)
Date: Wed, 16 Nov 2022 11:26:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, eduardo@habkost.net, berrange@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, eblake@redhat.com,
 marcel.apfelbaum@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 den-plotnikov@yandex-team.ru
Subject: Re: [PATCH 2/2] qapi: introduce DEVICE_POWER_ON for SHPC hotplug
Message-ID: <20221116112313-mutt-send-email-mst@kernel.org>
References: <20221116161234.44206-1-vsementsov@yandex-team.ru>
 <20221116161234.44206-3-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116161234.44206-3-vsementsov@yandex-team.ru>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Nov 16, 2022 at 07:12:34PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Hi all! That's an RFC patch.
> 
> The problem is that SHPC protocol says that power-led is blinking for 5
> seconds before actual turning-on the device. If we call device-del
> during this time the attention button press is ignored and we never get
> DEVICE_DELETED event, which is unexpected for the user.
> 
> I suggest add a pair for DEVICE_DELETED: DEVICE_POWER_ON. So user
> should wait for DEVICE_POWER_ON after device-add before making any
> other operations with the device (incluing device-del).
> 
> What I'm unsure is what about other types of hotplug - PCIE and
> ACPI.. Do they suffer from similar problems?

I didn't yet look at this patchset deeply (we are in freeze anyway)
but PCIE is substancially same as SHPC.

Take a look at Gerd's "improve native hotplug for pcie root ports"
same kind of approach probably works for SHPC.

> Seems not.. Should we sent
> for them this event at some moment of should the user be aware of which
> kind of hotplug is in use to determine to wait for the DEVICE_POWER_ON
> or not to wait.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>  hw/pci/shpc.c  | 16 ++++++++++++++++
>  qapi/qdev.json | 23 +++++++++++++++++++++++
>  2 files changed, 39 insertions(+)
> 
> diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
> index ba241e2818..7c53971c1c 100644
> --- a/hw/pci/shpc.c
> +++ b/hw/pci/shpc.c
> @@ -1,5 +1,6 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> +#include "qapi/qapi-events-qdev.h"
>  #include "qemu/host-utils.h"
>  #include "qemu/range.h"
>  #include "qemu/error-report.h"
> @@ -273,6 +274,18 @@ static void shpc_free_devices_in_slot(SHPCDevice *shpc, int slot)
>      }
>  }
>  
> +static void shpc_devices_power_on_in_slot(SHPCDevice *shpc, int slot)
> +{
> +    int devfn;
> +    PCIDevice *dev;
> +
> +    FOR_EACH_DEVICE_IN_SLOT(shpc, slot, dev, devfn) {
> +        DeviceState *ds = DEVICE(dev);
> +
> +        qapi_event_send_device_power_on(!!ds->id, ds->id, ds->canonical_path);
> +    }
> +}
> +
>  static void shpc_slot_command(SHPCDevice *shpc, uint8_t target,
>                                uint8_t state, uint8_t power, uint8_t attn)
>  {
> @@ -291,6 +304,9 @@ static void shpc_slot_command(SHPCDevice *shpc, uint8_t target,
>      switch (power) {
>      case SHPC_LED_NO:
>          break;
> +    case SHPC_LED_ON:
> +        shpc_devices_power_on_in_slot(shpc, slot);
> +        __attribute__ ((fallthrough));
>      default:
>          /* TODO: send event to monitor */
>          shpc_set_status(shpc, slot, power, SHPC_SLOT_PWR_LED_MASK);
> diff --git a/qapi/qdev.json b/qapi/qdev.json
> index 2708fb4e99..360dcf8ba6 100644
> --- a/qapi/qdev.json
> +++ b/qapi/qdev.json
> @@ -158,3 +158,26 @@
>  ##
>  { 'event': 'DEVICE_UNPLUG_GUEST_ERROR',
>    'data': { '*device': 'str', 'path': 'str' } }
> +
> +##
> +# @DEVICE_POWER_ON:
> +#
> +# Emitted whenever power is on for the devices plugged into pci slot.
> +# At this point it's safe to remove the device.
> +#
> +# @device: the device's ID if it has one
> +#
> +# @path: the device's QOM path
> +#
> +# Since: 7.2
> +#
> +# Example:
> +#
> +# <- { "event": "DEVICE_POWER_ON",
> +#      "data": { "device": "virtio-disk-0",
> +#                "path": "/machine/peripheral/virtio-disk-0" },
> +#      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
> +#
> +##
> +{ 'event': 'DEVICE_POWER_ON',
> +  'data': { '*device': 'str', 'path': 'str' } }
> -- 
> 2.34.1


