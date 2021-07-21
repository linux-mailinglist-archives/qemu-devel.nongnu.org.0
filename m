Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542D33D0B92
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 11:47:40 +0200 (CEST)
Received: from localhost ([::1]:41770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m68pH-0003ot-De
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 05:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m68nU-0001cB-4g
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:45:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m68nS-0005U3-ED
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:45:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626860745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WtmiPaFJUQtbFBolgncdB+ipyY9FuSd9yZPcZfJNbv4=;
 b=PNIlRyZe0Ij6GBvp+Ga1ApgkizFPLhpp8FhEQ3Y1J9o0DzA7sOCbiq1dj7ICu/p96D6nOw
 Eqf0RkNsyau55IOw0KnmKstNGQERv+E0NymEsM4xVg1sIPOL+4x6fI2Edh+UpBP4RvZn58
 WpcErvyTgLNKnu8ZQsEiorJSYZvdzNc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-SDJrmXCdNBOgxSobFH9UvA-1; Wed, 21 Jul 2021 05:45:44 -0400
X-MC-Unique: SDJrmXCdNBOgxSobFH9UvA-1
Received: by mail-wm1-f72.google.com with SMTP id
 n11-20020a05600c294bb029022095f349f3so381055wmd.0
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 02:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WtmiPaFJUQtbFBolgncdB+ipyY9FuSd9yZPcZfJNbv4=;
 b=qbpCYPQYtVAA3UIwR47ijJ9STDbRh7f0z3x3IqNOz/lf/1vAJYdgfy2mjHSG2vF2M+
 I+EHNP0+ATYRv7IFXH/T5D+plaljL4Sl2fZZe8fO24NpJ7pVbouktxMmfZJiQs6krkGb
 /7QjYw7NVX76UQmWWvQgZoqgqxjqsmyqzUpvlNDIMX5eW0n7HuQ7fuIcWaNZ//T5Jt5K
 FI5XCQjuHKoiLnt4PwhvVjCxsyd6QNZmpqblSpo2GzOIe3mLNXrSN6ZM6/Fo+CgdLjz7
 ZFpBUeFTaKEy0DWxdEuokosDKHuKttxXnrV5iiGQQBx0Gpz/ZDyeUnQ/C/Oq0C1wws+1
 GFZw==
X-Gm-Message-State: AOAM5316ARVux9/8oOx4nPCE+dHB9oL5Q+Dz0S9ukKUaXeEVr1Gjn0hp
 6wkrQho6yM1l6uxMst36s7/WNyTUZqR1EGNrTlK9p5otVJVtRdw/ilGy2V4nzqUudAcr98GpoXV
 BZhxtksVIuS1uI00=
X-Received: by 2002:a1c:f40a:: with SMTP id z10mr37698770wma.119.1626860743229; 
 Wed, 21 Jul 2021 02:45:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoslbbM/C7rugHU+eCbOqHRN5rhWtnmrle/I+wSKAn5QdQ9fcOQq1SkdcSFig/BfLv2TQFLQ==
X-Received: by 2002:a1c:f40a:: with SMTP id z10mr37698752wma.119.1626860742995; 
 Wed, 21 Jul 2021 02:45:42 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id b16sm27817541wrs.51.2021.07.21.02.45.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 02:45:42 -0700 (PDT)
Subject: Re: [PATCH] usb: fix usb-host dependency check
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Programmingkid <programmingkidx@gmail.com>
References: <20210721081718.301343-1-kraxel@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <92f5c379-3188-919f-015f-62ed189da119@redhat.com>
Date: Wed, 21 Jul 2021 11:45:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721081718.301343-1-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.474, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/07/21 10:17, Gerd Hoffmann wrote:
> Fixes: 627302afb2f8 ("usb: build usb-host as module")
> Reported-by: Programmingkid <programmingkidx@gmail.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   hw/usb/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/usb/meson.build b/hw/usb/meson.build
> index 3ca61279374d..de853d780dd8 100644
> --- a/hw/usb/meson.build
> +++ b/hw/usb/meson.build
> @@ -72,7 +72,7 @@ if usbredir.found()
>   endif
>   
>   # usb pass-through
> -if config_host.has_key('CONFIG_USB_LIBUSB')
> +if libusb.found()
>     usbhost_ss = ss.source_set()
>     usbhost_ss.add(when: ['CONFIG_USB', libusb],
>                    if_true: files('host-libusb.c'))
> 

Actually

Fixes: 90540f3289 ("configure, meson: convert libusb detection to 
meson", 2021-06-25)

Sorry about that.

Paolo


