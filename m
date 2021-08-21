Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB8A3F3C6F
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 22:48:08 +0200 (CEST)
Received: from localhost ([::1]:49572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHXuQ-0003Kx-M8
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 16:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mHXsz-0002UK-M4; Sat, 21 Aug 2021 16:46:41 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:46920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mHXsw-0001t6-Jq; Sat, 21 Aug 2021 16:46:37 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 l24-20020a05600c089800b002e71a10130eso4895641wmp.5; 
 Sat, 21 Aug 2021 13:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=h4uGQjs+Ka8euYwUU8a3RaHDpEGBMNcGwiViOnMWV1Q=;
 b=IAHO4n/Nxh8DpmPFDr2/+G84u5G2fjNMDdUlAZYnjM5RZOaztrXC1fDMTO9czrkjHE
 NTtWIp9+EL3Q3jC10yjkiyUFENVhfw4u/LmVhcS4Zsr/mtUcm9VkBBp7DRSwOXsgjGIx
 rMfl5U/d1DwXqo6VDcDld6FvLVqUupEJvM4lvGWxPtM/tPvk5YBgTaMgzXBKy99VUnlJ
 N0HtD2v80bnwR5eE651GSkIlVOWtstXkjwT5vi/CJ2HK4dTC0nybqw9Xue+Q+xiQ5+6y
 g/rNiu6g3HHiURKz2+8tuo3+T1hh0DtIKTdqQn6J7Dv7FTQwuv+zs8QNADymWd3TNKrQ
 LBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h4uGQjs+Ka8euYwUU8a3RaHDpEGBMNcGwiViOnMWV1Q=;
 b=omBFK6UoImyRMl5fzBLImDEiW8bA+ZQv+i5S5hR8FepuiNNvu0CtKAtgXyRc7uVnPs
 wfmmjWzqYAIweDv080KXst5AGagLHReplDmH54KY0l/EjWpzeZLVUik6gJMpt/TUub/y
 rFKjoJC92R0XDto/zDNd0nBrHcY6lCmejdWpNKVSiUiKtO+6q9OAvgNHMVgo/Uz/+2s6
 9dHMagQ+3FDFAd22K1wJX8bHtXYzNEKA05vD32knjikRgKCyoqDg6LEFIQC2XDBadGl/
 5xooOdpKZHU5kZtK8KMsr5VFNeXtQFfaGuLYFVQPGYY1S1b1h4gTwckU9mS+hI1zlCpb
 bl8Q==
X-Gm-Message-State: AOAM530j4Dk5rzpOCeVC33bkOp4uGsdsDqhXIFswShrbEdPhLog1tuWS
 KX+y7yumic61ldDEm0k3+/6ynCLJBHg=
X-Google-Smtp-Source: ABdhPJzEqO9+zDemcV0CtSF4ChRDXx//yEC3+0ylqtLarBq6y1qlEr8BrXkNrYBjcSo0pRfxVCBOcg==
X-Received: by 2002:a7b:ce0f:: with SMTP id m15mr53725wmc.62.1629578791171;
 Sat, 21 Aug 2021 13:46:31 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id g76sm2200847wme.16.2021.08.21.13.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Aug 2021 13:46:30 -0700 (PDT)
Subject: Re: [PATCH v2 6/8] target/arm: Assert thumb pc is aligned
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210821195958.41312-1-richard.henderson@linaro.org>
 <20210821195958.41312-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <feb3dea5-99d4-05c6-ca38-5f7dbc31d08e@amsat.org>
Date: Sat, 21 Aug 2021 22:46:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210821195958.41312-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.49,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/21/21 9:59 PM, Richard Henderson wrote:
> Misaligned thumb PC is architecturally impossible.
> Assert is better than proceeding, in case we've missed
> something somewhere.
> 
> Expand a comment about aligning the pc in gdbstub.
> Fail an incoming migrate if a thumb pc is misaligned.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/gdbstub.c   | 9 +++++++--
>  target/arm/machine.c   | 9 +++++++++
>  target/arm/translate.c | 3 +++
>  3 files changed, 19 insertions(+), 2 deletions(-)

> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index dfeaa2321d..a93ea3c47c 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -9595,6 +9595,9 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>      uint32_t insn;
>      bool is_16bit;
>  
> +    /* Misaligned thumb PC is architecturally impossible. */
> +    assert((dc->base.pc_next & 1) == 0);

What about using tcg_debug_assert() instead?

>      if (arm_check_ss_active(dc) || arm_check_kernelpage(dc)) {
>          dc->base.pc_next += 2;
>          return;
> 


