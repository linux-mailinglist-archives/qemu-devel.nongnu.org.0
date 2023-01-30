Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E2E681DFE
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 23:24:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMcZN-00087Z-Gz; Mon, 30 Jan 2023 17:24:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMcZL-00087K-V5
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 17:24:08 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMcZK-0004YZ-9I
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 17:24:07 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 cl23-20020a17090af69700b0022c745bfdc3so5970694pjb.3
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 14:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IUftfZMt3dBDnwYSMz/ddIiCN+ujmWOxtrK+JS4a8wg=;
 b=xU77C07hkLhEhxPwZBUAbvEiamQv+xvW63MrAP4K/xsDGkQFTgPeYM7YJPHNSRGPjw
 1+pW7VVglvCutNQmJiqZV+f9nK5JTclGkQLHq3O5XAtpKWv/IyP+ZQjAtBBm8RB/rovt
 1M+BoJnteDPjNBNhQG7StwvIvzFdOiaSFCeiAs8wmjvM2qjLaA5bXwhHHJaunHkLr8TG
 ElBZsfySB8yymB4q0tswxWvZij30pMoqhfkWY1fAqGkHbNzbL49QQ/dQQu6bMdlbzqrD
 Lg4Phs+IrZctXeuatiJMKqOrrKfuW8aTpOp7fhqaSisyvdyKphKODl8trkyPnDdl/eto
 AjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IUftfZMt3dBDnwYSMz/ddIiCN+ujmWOxtrK+JS4a8wg=;
 b=uaYQ2j/p0WyoX/7HQ3qoI61H98hg5x9bxIC432nPM9Xb8Q73FSR9IMA5xWqWL8Yr4P
 +24Eg7VNMSyAD5oUbsUDPlWwsPY8I/jPfO2XeR1ol4Zrv8Yv4hjXXByp4LwFFZv2KvoC
 HxcO0sP9G3F3ZAcNCAZlI9/jvAJInXoPucUe24ocRnwOJh66fo1Aq+0u8OONS4MfSAie
 WWMbHdjPyP5qGoCDHMcWrQl65pEX6gBu0QRaDuHVUPOfHrJng7dV9qkQqRaCm0VAtzc6
 QGwbYedmpvHlPH/15ju8rgpu+TwtBfQhcjODJBoTFrWH2vB8XIDWNN6kcDpXubyvyn7D
 IabQ==
X-Gm-Message-State: AO0yUKX4KMBXLWrruMX6ssBOX3m2gmQMc/TAoJ2qAnJ3Ie02lown4Qsr
 +d2G4eC3bNT5YiwURJJH2Qnbmg==
X-Google-Smtp-Source: AK7set+kLLNAzmVzlJ30rKek+0B5mQXPb/PBRnVE56XfqYLEW99/UjsffHefmdTskByP4qthJH8PlQ==
X-Received: by 2002:a17:90a:354:b0:22b:fcaf:3955 with SMTP id
 20-20020a17090a035400b0022bfcaf3955mr24774620pjf.26.1675117444389; 
 Mon, 30 Jan 2023 14:24:04 -0800 (PST)
Received: from [192.168.50.50] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 p12-20020a17090a348c00b002192db1f8e8sm7433616pjb.23.2023.01.30.14.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 14:24:03 -0800 (PST)
Message-ID: <095e87c0-baad-87bf-56c6-bd20229d00e0@linaro.org>
Date: Mon, 30 Jan 2023 12:23:59 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] target/ppc/translate: Add dummy implementation for dcblc
 instruction
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20230130184950.5241-1-shentey@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230130184950.5241-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

On 1/30/23 08:49, Bernhard Beschow wrote:
> The dcblc instruction is used by u-boot in mpc85xx/start.S. Without it,
> an illegal istruction exception is generated very early in the boot
> process where the processor is not yet able to handle exceptions. See:
> 
> https://github.com/u-boot/u-boot/blob/v2023.01/arch/powerpc/cpu/mpc85xx/start.S#L1840
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   target/ppc/translate.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index edb3daa9b5..8c32e697d9 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -5261,6 +5261,14 @@ static void gen_dcbtls(DisasContext *ctx)
>       tcg_temp_free(t0);
>   }
>   
> +/* dcblc */
> +static void gen_dcblc(DisasContext *ctx)
> +{
> +    /*
> +     * interpreted as no-op
> +     */

Missing

If MSR[UCLE] (user-mode cache lock enable) is set, dcblc[e] may be performed while in
user mode (MSR[PR] = 1). If MSR[UCLE] is clear, an attempt to perform this instructions
in user mode causes a DSI. ESR[DLK] is set for this DSI.

but that's also true for the current implementation of dcbtls.  So,

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

