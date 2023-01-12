Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3245C666C8B
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 09:39:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFt68-0001lc-2A; Thu, 12 Jan 2023 03:38:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFt60-0001ko-CY
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 03:38:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFt5y-0005VN-MO
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 03:38:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673512677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7embLn2Cl9KxGN9+kbnQOPXT2oZ/iLd9DqhronnvJrU=;
 b=FNljmB6tyr2LSU2npTR/HJa4TYtjIPyIPn3lc/sVjcQkBRaOCy5PEn2dSyguiOrsoQffnA
 OLq0bp3V4iZmgcrAhE8Dhnpxq3BvjCwX+hKMQJ/8NwHYQdXIyI74Kbxjc8CJdTsbNWN7+b
 qsCLkeaew9hiyWXAd2QcumpXwbot+Es=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-277-tm8i2VtJNDKu-HF2s0FIeA-1; Thu, 12 Jan 2023 03:37:56 -0500
X-MC-Unique: tm8i2VtJNDKu-HF2s0FIeA-1
Received: by mail-wm1-f70.google.com with SMTP id
 n9-20020a05600c3b8900b003d9f14e904eso6141676wms.9
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 00:37:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7embLn2Cl9KxGN9+kbnQOPXT2oZ/iLd9DqhronnvJrU=;
 b=RkRLiX7yh7Q4BLCoONF/hsvPNr73WCSe1TUO2SH7rrrTfIndAg4V5hMOwJWm7mAPFl
 9qUlih80GBNcQkSp0Eg8QLWZl0PJ1U0hGgSsNzv8NFiFsbZIH1jgTx2nHBRMQoT0UzJm
 tQR58XJnw4PXxccsm6k1LlCFw6f9+VSMXZCf+/R1XbDkxmkhk6Bw3axk36/wivyu/k5y
 8GeAoVjHzrJdMB6HaKgcKglxNcDiPHSStJpLciI3A/3Ic6pJsdbDca8xtPOkx/rNoFmb
 A6r4dB/a1jE3vZeTHa6742nqfBTwqEWRsYIQaQ+r+c8YWfoL4mXDjNjLr7kq84dtyxE4
 2Ytg==
X-Gm-Message-State: AFqh2kp2OZJjUwgaVJ5xIcuHLrrVQq05dtDV+zJqZ7u1LnOKsWFa9yn3
 crrLRqfYB4lnQqTZWflFBKhY1Vt5iSp2PQWZBS/R/1vvuXuQiTcmDTyFpxPCn3bDSCrr8tm7gCv
 QN6/Du6LY3XU83PI=
X-Received: by 2002:a05:6000:4004:b0:242:bef:80a1 with SMTP id
 cy4-20020a056000400400b002420bef80a1mr52390551wrb.2.1673512675244; 
 Thu, 12 Jan 2023 00:37:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtcZj97D5Xhasc+mQYa27iYhW/tBafaSvxYWJl/ENqksENh7ttStFtCU/dvt4BWpkBu8FeHrQ==
X-Received: by 2002:a05:6000:4004:b0:242:bef:80a1 with SMTP id
 cy4-20020a056000400400b002420bef80a1mr52390532wrb.2.1673512674946; 
 Thu, 12 Jan 2023 00:37:54 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-128.web.vodafone.de.
 [109.43.177.128]) by smtp.gmail.com with ESMTPSA id
 n6-20020adfe786000000b002bdbde1d3absm5558982wrm.78.2023.01.12.00.37.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 00:37:54 -0800 (PST)
Message-ID: <1b78cb0a-3d75-cdec-eb3a-bcd7fad04c51@redhat.com>
Date: Thu, 12 Jan 2023 09:37:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] hw/misc/sifive_u_otp: Remove the deprecated OTP config
 with '-drive if=none'
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org
References: <20230112082951.874492-1-thuth@redhat.com>
In-Reply-To: <20230112082951.874492-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 12/01/2023 09.29, Thomas Huth wrote:
> '-drive if=none' is meant for configuring back-end devices only, so this
> got marked as deprecated in QEMU 6.2. Users should now only use the new
> way with '-drive if=pflash' instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   docs/about/deprecated.rst       | 6 ------
>   docs/about/removed-features.rst | 7 +++++++
>   hw/misc/sifive_u_otp.c          | 7 -------
>   3 files changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 68d29642d7..bfe8148490 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -87,12 +87,6 @@ as short-form boolean values, and passed to plugins as ``arg_name=on``.
>   However, short-form booleans are deprecated and full explicit ``arg_name=on``
>   form is preferred.
>   
> -``-drive if=none`` for the sifive_u OTP device (since 6.2)
> -''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> -
> -Using ``-drive if=none`` to configure the OTP device of the sifive_u
> -RISC-V machine is deprecated. Use ``-drive if=pflash`` instead.
> -
>   ``-no-hpet`` (since 8.0)
>   ''''''''''''''''''''''''
>   
> diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
> index c918cabd1a..b1cb15f3d9 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -422,6 +422,13 @@ the value is hexadecimal.  That is, '0x20M' should be written either as
>   ``tty`` and ``parport`` used to be aliases for ``serial`` and ``parallel``
>   respectively. The actual backend names should be used instead.
>   
> +``-drive if=none`` for the sifive_u OTP device (removed in 8.0)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +Using ``-drive if=none`` to configure the OTP device of the sifive_u
> +RISC-V machine is deprecated. Use ``-drive if=pflash`` instead.

-ENOTENOUGHCOFFEEYET

I think I should adjust that description a little bit instead of blindly 
copy-n-pasting it... Sorry. I'll send a v2.

  Thomas



