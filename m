Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 773C347D784
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 20:14:08 +0100 (CET)
Received: from localhost ([::1]:46546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n073v-0004tA-Kj
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 14:14:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n071Q-0003o7-T0
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:11:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n071N-0007IW-TF
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:11:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640200287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c+cH3tlUsQ+1SvzdH5//07C05cu4iO9h/sJEQdsX2Vk=;
 b=XyEPF8pMTEMRB2ctllluDpGLBr9ODPqoJe4EuwJNDRf/sc6v/QZguARIoH1iXaGQfV6PP8
 NzUQvXpb1bU83zk4oF8i3cUwmZd1bkDJsTriGNKOOztdthvoo8tV1dGXtplkicj+KE03kk
 A0S3fJQPzYUw1Of9J7KXzIiW5HNBnDw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-fIO-jUvoO-2gEiShHDH1Fw-1; Wed, 22 Dec 2021 14:11:26 -0500
X-MC-Unique: fIO-jUvoO-2gEiShHDH1Fw-1
Received: by mail-wm1-f69.google.com with SMTP id
 r10-20020a1c440a000000b003456b2594e0so1024492wma.8
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 11:11:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=c+cH3tlUsQ+1SvzdH5//07C05cu4iO9h/sJEQdsX2Vk=;
 b=V843Jk0IDlWXE38+WA6nbhi98iRqJz/fuMfxaNJgs3VP6yu8n8XPstNRp32K1BHd5E
 g6G02MOIiO7jY8/nbmiA4RNrbJ/yT3KFa1gJA9kBcIevbaqvqBpy8pUX68GaVkc+b7GX
 6V0/m/d1gYq9x2+BbLuJ4/PcOlMDHjdOtBnOEnYMJLtxv+SL1KLl9DmIVny30BTjyIeY
 HcsxMhogWKHIvmZRsK6xLYSNA8axSpx4Ry3XjafBSDZSyC8A5RISnm71qCE3ojtJ/AZ5
 H41Q1wM2pPkV1vwbR3yK7O/gIKtqA8LcWLKAO/QrBKlHfekDcrXTlhRzvZAAGyozGcvM
 eNog==
X-Gm-Message-State: AOAM533w+igeWYbEyjbtcoH88Ae9CgDfMN0kH3e4i8B0GB4+ajUCHWYJ
 38r8qUpPBkSfKRNq/PLfNI8LwSE1m9zQeo1cT7aDomPM+D0FuH+f8Zh0m9gxc2Tv78S8Ko3UiTZ
 JS7JfUOdpnM/hlL8=
X-Received: by 2002:a5d:5352:: with SMTP id t18mr2926427wrv.472.1640200285587; 
 Wed, 22 Dec 2021 11:11:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyt2mZ07UbTJ4ONedk78sGv0Jfr/8pI8yDjWRDpQY9noIULsFHuFBvBT2NwJ20eogVDU0cH/g==
X-Received: by 2002:a5d:5352:: with SMTP id t18mr2926416wrv.472.1640200285375; 
 Wed, 22 Dec 2021 11:11:25 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id e5sm3155555wrq.116.2021.12.22.11.11.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 11:11:24 -0800 (PST)
Message-ID: <f2e46e6d-8878-e970-86a0-3572f11eb398@redhat.com>
Date: Wed, 22 Dec 2021 20:11:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] ui/dbus: fix buffer-overflow detected by ASAN
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20211222144032.443424-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211222144032.443424-1-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.694, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/22/21 15:40, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> On the last added dbus patch, I left a tiny BO:
> 
> ==441487==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x611000025a70 at pc 0x7f0817bb764c bp 0x7ffde672ae60 sp 0x7ffde672ae58
> WRITE of size 8 at 0x611000025a70 thread T0
>     #0 0x7f0817bb764b in dbus_vc_class_init ../ui/dbus.c:401
> 
> A cookie for ASAN! not you C :)
> 

Fixes: 7f767ca35e5 ("ui/dbus: register D-Bus VC handler")
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  ui/dbus.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/ui/dbus.c b/ui/dbus.c
> index b2c1c9fb522c..0074424c1fed 100644
> --- a/ui/dbus.c
> +++ b/ui/dbus.c
> @@ -405,6 +405,7 @@ dbus_vc_class_init(ObjectClass *oc, void *data)
>  static const TypeInfo dbus_vc_type_info = {
>      .name = TYPE_CHARDEV_VC,
>      .parent = TYPE_CHARDEV_DBUS,
> +    .class_size = sizeof(DBusVCClass),
>      .class_init = dbus_vc_class_init,
>  };
>  


