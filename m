Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE77736E963
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 13:09:04 +0200 (CEST)
Received: from localhost ([::1]:33842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc4XX-0007oj-R5
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 07:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lc4R3-0003Os-9C
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 07:02:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lc4R0-0006EI-EZ
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 07:02:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619694137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lfaxE5v0uCasa4QTlqcz0FsjEIGWk10KCe8ydlecpRM=;
 b=coMw5rwn4Y7qrZAg/MbFWzuGrMEZk13Vic1qJbmz5BcD9PKarfbkD1iLlfPVLqztAzRGlw
 NdztN+SvZBRHibExakTx0DlMeFPRy7J22oPHOR3eOK+zokT8vf7QwDiFhoiGF+VPKS2DT9
 p8nJJrCLbNiKEmj9MTxh53QiViR3T8s=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-TM49psBMOFKai25dSXRUUQ-1; Thu, 29 Apr 2021 07:02:15 -0400
X-MC-Unique: TM49psBMOFKai25dSXRUUQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 d13-20020a056402144db0290387e63c95d8so3889225edx.11
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 04:02:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lfaxE5v0uCasa4QTlqcz0FsjEIGWk10KCe8ydlecpRM=;
 b=AJW5WdUNpigFs5fyFx9XkT+O/akqXUmsYS/056OtzrEf5KGDg2zpASQwGAWVln5n0+
 FrqqhB8ZblbPrrNGo9o8hMjKv8YE96HnPVynUfq+8xlKi6YN9pZRJ/iHHHAxbV9QHCTP
 nlttJ7XNj8q2qA1Xs1f1xVMaQ5G/GYhLsPNrmYDdlQKHOsmpss2TaDrsfOZlFD0ZaJOy
 hgPbJW+kxVa9OXa3CiY2rudJGgbQnrbUDHi4iaNyE7lDHGIovXSdMOtIJj2NR265UrIi
 NQv1IfVrb75QIRl+LmRbVMrPivTA9NL7RfOgni/rY7rA4d+pGxdy8FNUiU93Z4+1mHM4
 +G5A==
X-Gm-Message-State: AOAM532DIpdSoltbJHMpdjA+6b56jhSvtoVxjZmx9TaZJ5NwKTFCg3Yf
 JfHYa0LGC+OpdI65QrsujW7W8zJl6TL5IF0Xgq6/mX6DNnL+LLdn3dcMaJ+lBQwalkNKjS1bRJ6
 kECFal/X7IHTdSF4torUI8CPsOfs+mt1ayqCr3gudNN84WeX3c9ew/Ky17fb8hN+NaFI=
X-Received: by 2002:a17:906:3952:: with SMTP id
 g18mr34242072eje.104.1619694133798; 
 Thu, 29 Apr 2021 04:02:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+eUuvHFutoNadqRy03KmW9VsMLhWQxY4wvknLWdJYyiDN39MxAas240sBV+gmQf3/2MqLHw==
X-Received: by 2002:a17:906:3952:: with SMTP id
 g18mr34242037eje.104.1619694133475; 
 Thu, 29 Apr 2021 04:02:13 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id 9sm1601107ejv.73.2021.04.29.04.02.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 04:02:12 -0700 (PDT)
Subject: Re: [PATCH] meson: change buildtype when debug_info=no
To: Joelle van Dyne <j@getutm.app>, qemu-devel@nongnu.org
References: <20210428195558.16960-1-j@getutm.app>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <97f986cf-12a9-560c-2d45-8c80305be481@redhat.com>
Date: Thu, 29 Apr 2021 13:02:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210428195558.16960-1-j@getutm.app>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 28/04/21 21:55, Joelle van Dyne wrote:
> Meson defaults builds to 'debugoptimized' which adds '-g -O2'
> to CFLAGS. If the user specifies '--disable-debug-info' we
> should instead build with 'release' which does not emit any
> debug info.
> 
> Signed-off-by: Joelle van Dyne <j@getutm.app>

This is not needed.  buildtype is a shortcut for the optimization and
debug options, we need not bother with it because configure sets the
individual options already:

         -Doptimization=$(if test "$debug" = yes; then echo 0; else echo 2; fi) \
         -Ddebug=$(if test "$debug_info" = yes; then echo true; else echo false; fi) \

Paolo

> ---
>   configure | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/configure b/configure
> index 4f374b4889..5c3568cbc3 100755
> --- a/configure
> +++ b/configure
> @@ -6398,6 +6398,7 @@ NINJA=$ninja $meson setup \
>           --sysconfdir "$sysconfdir" \
>           --localedir "$localedir" \
>           --localstatedir "$local_statedir" \
> +        --buildtype $(if test "$debug_info" = yes; then echo "debugoptimized"; else echo "release"; fi) \
>           -Ddocdir="$docdir" \
>           -Dqemu_firmwarepath="$firmwarepath" \
>           -Dqemu_suffix="$qemu_suffix" \
> 


