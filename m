Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E1D681C0F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:01:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMbH5-00025i-Q6; Mon, 30 Jan 2023 16:01:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbGh-0001Sn-OA
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:00:54 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbGf-0005e1-TD
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:00:47 -0500
Received: by mail-pj1-x1033.google.com with SMTP id mi9so3133450pjb.4
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o6XK3wgJtTUIBhonrPnk1dQpAlt+sLIs/xAyriNJLT4=;
 b=A4S+1IVQu/cm06W/5WhaQK6XwFsHPPK2m3fE+mSLfKe/tfiKNWO73Z09CdfULNSnqM
 2priEhM835wjkUenl0r1YpdwVHu4ePY2/eO0Tbwvsw/3cOhDb3UWsQ4g4K0DNEvt7oEU
 SYT532Pix5WuW/fdycK+cUYpUZ9xDucrSb/jWAv5oYiwZVPFotUt3vNFpwPUZf2A8xj1
 4I6b8Hoqynw8njZkjxe5LOMU2QDk0nHoQCtB5dj8kGMKtA/GieqCJSCfKjPpgIbtqi6J
 B8KL7My4A5ApDAGET7GZh+x7col8EGzIIvqv8RVL9klQtafyD7mpK31nGlsbOYI2+OoJ
 KBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o6XK3wgJtTUIBhonrPnk1dQpAlt+sLIs/xAyriNJLT4=;
 b=XIXPYY4XOWGq/fTLtpGRc4n5ag0NoQ5yBd18Vq7nbK4s1uQwPo9LvHZ/oVAwXF/fGx
 lceJWzEX3EtQK43Lt+fbuyL5xDkcEmLY5yLblIl9cagVb/HuCVelXFBo+Ed5QCI7ZYd0
 DGpvawHZDvzKM/MHylun8Bc89+vUfdJD9f+DgEr1h/ueLd+HD7J3hZHOQBcQn6weGEZb
 ployMhE0MdzK9axfQAHG+giu1QttiN4GDL7/H/ZYQZ7sxWEwPryRdA55obv2+/033wnu
 rRyHJA68Mk2vZksc+9iELfbG0dnOaFTIGzhl6iVvNdaGCfook4E0YYhn5/0g0TRmvuRE
 yAkQ==
X-Gm-Message-State: AO0yUKUkmVIGAGsapElsqLrLfnE4M20xEqBPe8HS+SDaAaXE4Tu9ZuLm
 eJS5OEBYViMHtMBYyr4wOZECEDi5UZqJxRdt
X-Google-Smtp-Source: AK7set+SK/dBcav9gclCz+iXdd4leNsJuRUBjy9ta8XrRgIxbvQ44gEWImXz3+SEolzFs9BHYqB9jA==
X-Received: by 2002:a17:902:e752:b0:196:44d4:2453 with SMTP id
 p18-20020a170902e75200b0019644d42453mr18552929plf.7.1675112444263; 
 Mon, 30 Jan 2023 13:00:44 -0800 (PST)
Received: from [192.168.50.50] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 jg3-20020a17090326c300b0019615a0d083sm2773134plb.210.2023.01.30.13.00.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 13:00:43 -0800 (PST)
Message-ID: <a90b953e-a725-aebf-cc5e-b73e4497539e@linaro.org>
Date: Mon, 30 Jan 2023 11:00:40 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] target/arm: Fix physical address resolution for Stage2
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, cota@braap.org, qemu-stable@nongnu.org,
 Sid Manning <sidneym@quicinc.com>
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
 <20230130205935.1157347-2-richard.henderson@linaro.org>
In-Reply-To: <20230130205935.1157347-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 1/30/23 10:59, Richard Henderson wrote:
> Conversion to probe_access_full missed applying the page offset.
> 
> Cc: qemu-stable@nongnu.org
> Reported-by: Sid Manning <sidneym@quicinc.com>
> Fixes: f3639a64f602 ("target/arm: Use softmmu tlbs for page table walking")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 57f3615a66..2b125fff44 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -266,7 +266,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
>           if (unlikely(flags & TLB_INVALID_MASK)) {
>               goto fail;
>           }
> -        ptw->out_phys = full->phys_addr;
> +        ptw->out_phys = full->phys_addr | (addr & ~TARGET_PAGE_MASK);
>           ptw->out_rw = full->prot & PAGE_WRITE;
>           pte_attrs = full->pte_attrs;
>           pte_secure = full->attrs.secure;

Bah.  Of course this shouldn't have been resent as part of another patch set.


r~

