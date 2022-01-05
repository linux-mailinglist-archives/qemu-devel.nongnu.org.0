Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 933D7485240
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 13:05:30 +0100 (CET)
Received: from localhost ([::1]:53284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n552n-00077B-ED
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 07:05:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n54zq-0005dC-4q
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 07:02:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n54zn-0002k2-9E
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 07:02:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641384142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Py9B8/1HYVcSMc5+b1ZPgfN+YXDV2tpUtShM5iqoP7I=;
 b=awhzCg/SHgauP/8LFZSBGBC37vNPJbQH1xAIMPSJr2bQK8KCzDUI/u/a6YbyRhnO2bFfGP
 5cWfiJ1eHmg0pme0T+K+5uVTyMOmdP4gQRRanR44wOOcKK0W60E0gJBXiueZf/w2NBiEDq
 TR7ZZ9mmNVX3pkcMU2QQpPHC6DkeYbg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-MJFKh_fuNsKa9dihbPlmOw-1; Wed, 05 Jan 2022 07:02:21 -0500
X-MC-Unique: MJFKh_fuNsKa9dihbPlmOw-1
Received: by mail-wr1-f71.google.com with SMTP id
 d6-20020adfa346000000b001a262748c6fso12455556wrb.12
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 04:02:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Py9B8/1HYVcSMc5+b1ZPgfN+YXDV2tpUtShM5iqoP7I=;
 b=hygCpY4HqTcIxFNzlk23QYFoj0HmUZ64T9e+picjCuAj1rxIpu6nWZpN+kkx/WQANR
 YdbaSrZRg+9Os7mM8002MFUVIyzYSnKtQybWTgxZHbn4FGN/0GK3+oCYqcn4Gc2Uu+4G
 z4lI+UUT9vQzRXi/YUxHJSwlLcPUcJAORaSeoWnfkTQ7h+/B3aTLcjUEpDMzA7nXTciQ
 VDDa5ZdJMUlEE7iGv0s3HQysJFtyupbTsq16h1SatBdOpYE6cmQGU5AOoAtEFQHYHWGF
 Mx9fBmRBdNL/raUe3wk9201JhaP7vwR2fnoaFndTFzzfwxyHxteorkXtB3BhmSO/2uLh
 AgOg==
X-Gm-Message-State: AOAM53132Zn+A7VEet0oBkCOGmWOBH4eCfxrMha280PH+JegUdSz5jU2
 aPa258r/+A0UXLh+9wXoXx/8GIx7ql7s/KBPr5hPRjtEOsc+Bw/yuSJ1VkWB44L97uYd6AWomqi
 e6pY7xqt7kS3h/K0=
X-Received: by 2002:a05:6000:15c2:: with SMTP id
 y2mr47292536wry.202.1641384140382; 
 Wed, 05 Jan 2022 04:02:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvvEryrqT/j1zc9ZmK+fejayV5WCqzlLhhfnwY5KyoMJRrwQyte+94QcnWHvEmt0qAUl/2Zg==
X-Received: by 2002:a05:6000:15c2:: with SMTP id
 y2mr47292496wry.202.1641384139850; 
 Wed, 05 Jan 2022 04:02:19 -0800 (PST)
Received: from [10.33.192.229] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id c7sm46051980wri.21.2022.01.05.04.02.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 04:02:19 -0800 (PST)
Message-ID: <08880339-e513-034e-18d1-651d9f36a8f2@redhat.com>
Date: Wed, 5 Jan 2022 13:02:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 5/6] docs/qdev-device-use: Add CanoKey to QDEV devices
 examples
To: "Hongren (Zenithal) Zheng" <i@zenithal.me>, qemu-devel@nongnu.org
References: <YcSt+qozrl+J8ool@Sun> <YcSvRf+YjukL8Mlp@Sun>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YcSvRf+YjukL8Mlp@Sun>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.057, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, contact@canokeys.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/12/2021 18.17, Hongren (Zenithal) Zheng wrote:
> Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
> ---
>   docs/qdev-device-use.txt | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/docs/qdev-device-use.txt b/docs/qdev-device-use.txt
> index 2408889334..278fb66c0a 100644
> --- a/docs/qdev-device-use.txt
> +++ b/docs/qdev-device-use.txt
> @@ -342,6 +342,7 @@ The new way is -device DEVNAME,DEV-OPTS...  Details depend on DRIVER:
>   * tablet          -device usb-tablet
>   * wacom-tablet    -device usb-wacom-tablet
>   * u2f             -device u2f-{emulated,passthru}
> +* canokey         -device canokey
>   * braille         See "Character Devices"

Please drop this patch. The list here is only about legacy USB device usage 
with the "-usbdevice" parameter, but since there never was and never will be 
a "-usbdevice canokey", there is no need to add an entry here.

  Thomas


