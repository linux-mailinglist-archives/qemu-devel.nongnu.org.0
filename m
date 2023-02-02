Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D5468850A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 18:04:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNcyu-0002O6-67; Thu, 02 Feb 2023 12:02:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNcyr-0002LI-RC
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 12:02:37 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNcyp-0003ud-Jt
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 12:02:37 -0500
Received: by mail-pl1-x632.google.com with SMTP id m2so2481954plg.4
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 09:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=25OMBhvzobX9Htf6nIvHkxSG+HgBD1Jh2RP3Tr+fZ4o=;
 b=YncBkj0gS+3gbyhm5/4AVS33n9ot8c9hNuRXQ/EBsgK54CnYPFHr/GAdPlcCMdqM7I
 uzyJFAD3CxXsVPehA5TNpyuo6PZVkuzFxXzosPitBMZmMNbhpPINTXlaxfPrtDx2bY/R
 BcwVwXwPJpAukMAZlED6owzYiw8ccV8Xf7fHAMBhooR2eHwRhpwP/3x0gWxR6Pdkj822
 iiIKnCeiAzoH5dicRKusP/B9Hi0xhFfUMPp0NjTNSgLjVJfN9TwhcwP7wB04wM9wKOC/
 zLbSyGSweg9ckKgNkPYS5t9NwXFUGyUnDAC6eFv+b0LS2lOK44Qwi3r/XHXh1e8dFq/9
 JPIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=25OMBhvzobX9Htf6nIvHkxSG+HgBD1Jh2RP3Tr+fZ4o=;
 b=MPdqPOLZbrhLvKyhBRJYpgbSwW3iQV3P5Sz9u7n//OLKCgqjqc2tDbqXgYkdY07Elw
 iBAo2iDr9HUfmiAKSWiiTVW8Imv1ihQlea8gvVjzq/Dukish1HChTt+tDhCng3NgZTsj
 clwXKz8WEQgB7CGiO70ZZUum71LW0UJ/ioWcowkpvVyDVZzES9agqplXdht4LJk608Ud
 u/2WEqZgCWoqy8y5PETjjGLFRrSM/dcGW/p+BLxKoVkTvpQMXMc/JM23tsUNEpeJFwdx
 QZUd2sBTyF9WRI06R6NM/M4xUuOb0c0h1ApL0Sl7smigrAtPLN1E4zWZgFOOciVV995t
 oL0g==
X-Gm-Message-State: AO0yUKWVycU14Zvpdd8H4GQfz8SGyNNxJu4EbBBJ9yJjzd9kUYkwF3UD
 iFMIpZwjKcYyuqu5RSHRA3+67g==
X-Google-Smtp-Source: AK7set/Ar8BgH5wCFNPhuwHL1+zq75+MnYHSpfu5sU+1sq8PoFfaJkgo0oJz0YJ7vLrjBV6hDUWDtg==
X-Received: by 2002:a17:902:c611:b0:196:35cf:3b08 with SMTP id
 r17-20020a170902c61100b0019635cf3b08mr6060969plr.36.1675357353725; 
 Thu, 02 Feb 2023 09:02:33 -0800 (PST)
Received: from [192.168.50.194] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 g13-20020a170902d5cd00b00186b7443082sm1053090plh.195.2023.02.02.09.02.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 09:02:33 -0800 (PST)
Message-ID: <7da5cc9a-bf7d-a045-f253-bed4d7f2bf12@linaro.org>
Date: Thu, 2 Feb 2023 07:02:29 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 35/39] crypto: Move SM4_SBOXWORD from target/riscv
Content-Language: en-US
To: Lawrence Hunter <lawrence.hunter@codethink.co.uk>, qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, pbonzini@redhat.com,
 philipp.tomsich@vrull.eu, kvm@vger.kernel.org, Max Chou <max.chou@sifive.com>
References: <20230202124230.295997-1-lawrence.hunter@codethink.co.uk>
 <20230202124230.295997-36-lawrence.hunter@codethink.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230202124230.295997-36-lawrence.hunter@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 2/2/23 02:42, Lawrence Hunter wrote:
> From: Max Chou <max.chou@sifive.com>
> 
>      - Share SM4_SBOXWORD between target/riscv and target/arm.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   include/crypto/sm4.h       |  7 +++++++
>   target/arm/crypto_helper.c | 10 ++--------
>   2 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/include/crypto/sm4.h b/include/crypto/sm4.h
> index 9bd3ebc62e..33478562a4 100644
> --- a/include/crypto/sm4.h
> +++ b/include/crypto/sm4.h
> @@ -1,6 +1,13 @@
>   #ifndef QEMU_SM4_H
>   #define QEMU_SM4_H
>   
> +#define SM4_SBOXWORD(WORD) ( \
> +    sm4_sbox[((WORD) >> 24) & 0xff] << 24 | \
> +    sm4_sbox[((WORD) >> 16) & 0xff] << 16 | \
> +    sm4_sbox[((WORD) >>  8) & 0xff] <<  8 | \
> +    sm4_sbox[((WORD) >>  0) & 0xff] <<  0   \
> +)
> +
>   extern const uint8_t sm4_sbox[256];

I think this would be better as an inline function, so that the types are clear.


r~


