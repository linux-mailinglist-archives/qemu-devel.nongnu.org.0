Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C61A693F60
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 09:13:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRTwW-0005OP-JA; Mon, 13 Feb 2023 03:12:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRTwS-0005Il-40
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 03:12:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRTwQ-0003bx-GH
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 03:12:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676275921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N99A9AHofnJ7qn7mwFTUUvwtDP+yDE1Qe21Mkxc+QuA=;
 b=L+BYShCfaVNI8WXLq6WCp69c3z6ngHuC/5R8XREnDlaJyviojBr+lih8Fabypyet5kg7lG
 Tir5s1hLDG5+KHDyKm+6cLnhZp/FamZVXBeMLRkSHsdo6qw5R+Yp0W7sU+LABAAKDMPmvV
 jS4TN74P3Arwy9VDwOHUjdKjyhATeBg=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-534-7z7Dkj-JPCiCFD3AVbt2pA-1; Mon, 13 Feb 2023 03:12:00 -0500
X-MC-Unique: 7z7Dkj-JPCiCFD3AVbt2pA-1
Received: by mail-qt1-f197.google.com with SMTP id
 cr22-20020a05622a429600b003b694a9f291so6987682qtb.1
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 00:12:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N99A9AHofnJ7qn7mwFTUUvwtDP+yDE1Qe21Mkxc+QuA=;
 b=7N9mSQfQEXhTWLPC1ML0YhpWrCrlSh/1gjd9YABGdzgX/V+W1xeXjvfj2UWfMg87SE
 Sh70FxdymeLtb6J0kpo8R72vL5yKXm+ZlRYx8ZHoDtEj6in7n+0N649CjeFvwPBfO6JB
 NMz4WbYRj7nUsrp+qboE+gZJZWpImgEpbP1iI1ATSd85HDCGZb+jRl9pktzR0SpHkAUa
 diZ23PQKzPaPq12untZn5u1YONeHZxThkuXly1SCZIAMG+yJ+czIgZ2hcqgawSfWzVnF
 AUwYklqNZldD8RdsJsF+59OwtNobrtMXapQSJXGO7liEpBW05i+YQdQP24PKEwH4sqNE
 Swmw==
X-Gm-Message-State: AO0yUKUNYyfglnfgJKXnnN/3ojOBSWnscXLoGostMFm5uq00/P2q6GRs
 nqnIxn88A/ycZBWBIR8TBlNlApcTbpGGbrFri7O3zBiuh1cDUIGrcue0nMDNBDp9d5aq0ildIOs
 0GMsk1m7Q+2Oi2dQ=
X-Received: by 2002:a05:622a:118d:b0:3b8:2ce4:3e9 with SMTP id
 m13-20020a05622a118d00b003b82ce403e9mr43784485qtk.32.1676275919785; 
 Mon, 13 Feb 2023 00:11:59 -0800 (PST)
X-Google-Smtp-Source: AK7set+83E8TJG8Rzk6aIUGt03FMl0v3RJYJ1MoTPi+sNL0JS60A6itbOay/9/9Xa29XygVBfDap7g==
X-Received: by 2002:a05:622a:118d:b0:3b8:2ce4:3e9 with SMTP id
 m13-20020a05622a118d00b003b82ce403e9mr43784469qtk.32.1676275919562; 
 Mon, 13 Feb 2023 00:11:59 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-185.web.vodafone.de.
 [109.43.177.185]) by smtp.gmail.com with ESMTPSA id
 s4-20020a372c04000000b006f9f3c0c63csm9224582qkh.32.2023.02.13.00.11.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 00:11:59 -0800 (PST)
Message-ID: <265f782c-d3c8-b7d5-d1ea-4d10edd2ad4f@redhat.com>
Date: Mon, 13 Feb 2023 09:11:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH v2 19/19] hw/usb: Inline usb_bus_from_device()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Li Qiang <liq3ea@163.com>, qemu-s390x@nongnu.org,
 Hu Tao <hutao@cn.fujitsu.com>, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20230213070820.76881-1-philmd@linaro.org>
 <20230213070820.76881-20-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230213070820.76881-20-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.348, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 13/02/2023 08.08, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> RFC Other devices don't use such helper. Maybe it should
>      be the other way around, introduce more bus_from_device()
>      helpers?
> ---
>   hw/usb/bus.c        | 10 +++++-----
>   hw/usb/core.c       |  6 +++---
>   hw/usb/dev-hub.c    |  4 ++--
>   hw/usb/dev-serial.c | 10 +++++-----
>   hw/usb/hcd-xhci.c   |  2 +-
>   include/hw/usb.h    |  5 -----
>   6 files changed, 16 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/usb/bus.c b/hw/usb/bus.c
> index d7c3c71435..4a1b67761c 100644
> --- a/hw/usb/bus.c
> +++ b/hw/usb/bus.c
> @@ -427,7 +427,7 @@ void usb_unregister_port(USBBus *bus, USBPort *port)
>   
>   void usb_claim_port(USBDevice *dev, Error **errp)
>   {
> -    USBBus *bus = usb_bus_from_device(dev);
> +    USBBus *bus = USB_BUS(qdev_get_parent_bus(DEVICE(dev)));

You're certainly missing a proper justification in the patch description 
here. The "other devices don't use such a helper" does not sound like a real 
justification to me, since the code lines rather get longer this way. Thus 
this rather looks like unnecessary code churn to me --> rather drop the patch?

  Thomas


