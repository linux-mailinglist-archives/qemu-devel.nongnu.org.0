Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 723E51F4F00
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 09:35:55 +0200 (CEST)
Received: from localhost ([::1]:42632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jivH8-0007SS-Gj
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 03:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jivGC-0006rx-1E; Wed, 10 Jun 2020 03:34:56 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:37751)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jivGA-0001pP-Hk; Wed, 10 Jun 2020 03:34:55 -0400
Received: by mail-wm1-x344.google.com with SMTP id y20so825980wmi.2;
 Wed, 10 Jun 2020 00:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dcRIs1CHwGioZTibo8sJvnFHbc926IVBpeMkqzH+5/s=;
 b=H+QdMBPbsfP42rQBaCLrEwF37qx5q5v8mHpv3Bswr3NwYeK3DNjyAJ53KxMvWJmonA
 GLwYgtN65vMxeSCjA7Ajj1ocB6Fj/2eIW27AMqNXlTB4WqEicXuP0WR7Y4UaLc7Dp625
 CwikqVUwgMy7ENYCSc3uE1DL6K1x6xdY66UuYG6XwCZllpBGDQQlc13oewqR5VxFaEXA
 4U/t/o67VHs7XKQb0bNSpa6VUV8sLf5lZ+7jcC6JnRrI2yhDq7HVbyoNWIcPj3uRsXXs
 lwcZXeUBxVT525dPVEhWRgQm0QiI+l+V7N5XayCIujw5MfagcgOZ+zt6UQKRCFeFBiai
 r0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dcRIs1CHwGioZTibo8sJvnFHbc926IVBpeMkqzH+5/s=;
 b=mRr5aeDA1Ldbj4xiw1LZPSgf0GMEEWJ4nQeCoxcLgqY3QhjMLoaP4EcIsD/je4AykI
 6OEYU5/c4C+mLPvChoT9mPwVH4XYPA6UH5GWNCaZWhCg+hkUgpSuh2P9FyUvUN5uVwCr
 MthoGS7Jg0HV2OByC1VY2OmJ3ceefS5Q6m+HHo+4NnG5juq2aRKgG8tlT0YipMD3CQ36
 8GbH13+M+2D7+R6BEgPSMldVK9e0UbjMW07nWGby3o+YbHH11nSm1R1fieqLy/lgmf+W
 p0SZJ0G2R2hW35f602ny4PmuNRXOKGHfyXMDBq5XeSFizoVI1PA128OovRHV4njyJZNJ
 W9fQ==
X-Gm-Message-State: AOAM530UZ4VOBF2XBfIZXnKfV/eYLuvYDP+klkPBZEXKu4yBvPR/XJhd
 luMiP8TBSo3YuvWPihLoWJ11CjrS
X-Google-Smtp-Source: ABdhPJwfsL9TOfeFuTJnNBkv4Ew3P0tSJ38itvqvPW2+16mA1hHiqMlVlPqiGwgpINnuRJRUu4Legw==
X-Received: by 2002:a1c:bc0a:: with SMTP id m10mr1733113wmf.173.1591774481098; 
 Wed, 10 Jun 2020 00:34:41 -0700 (PDT)
Received: from [192.168.1.38] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id c6sm5732767wma.15.2020.06.10.00.34.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2020 00:34:40 -0700 (PDT)
Subject: Re: [PATCH 1/7] target/arm: Fix missing temp frees in do_vshll_2sh
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200609160209.29960-1-peter.maydell@linaro.org>
 <20200609160209.29960-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7f575d04-1294-cb2a-ea4b-2b8f20b15a93@amsat.org>
Date: Wed, 10 Jun 2020 09:34:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200609160209.29960-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/9/20 6:02 PM, Peter Maydell wrote:
> The widenfn() in do_vshll_2sh() does not free the input 32-bit
> TCGv, so we need to do this in the calling code.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.inc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
> index 664d3612607..299a61f067b 100644
> --- a/target/arm/translate-neon.inc.c
> +++ b/target/arm/translate-neon.inc.c
> @@ -1624,6 +1624,7 @@ static bool do_vshll_2sh(DisasContext *s, arg_2reg_shift *a,
>      tmp = tcg_temp_new_i64();
>  
>      widenfn(tmp, rm0);
> +    tcg_temp_free_i32(rm0);
>      if (a->shift != 0) {
>          tcg_gen_shli_i64(tmp, tmp, a->shift);
>          tcg_gen_andi_i64(tmp, tmp, ~widen_mask);
> @@ -1631,6 +1632,7 @@ static bool do_vshll_2sh(DisasContext *s, arg_2reg_shift *a,
>      neon_store_reg64(tmp, a->vd);
>  
>      widenfn(tmp, rm1);
> +    tcg_temp_free_i32(rm1);
>      if (a->shift != 0) {
>          tcg_gen_shli_i64(tmp, tmp, a->shift);
>          tcg_gen_andi_i64(tmp, tmp, ~widen_mask);
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


