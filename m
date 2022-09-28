Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5365EE24D
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 18:51:58 +0200 (CEST)
Received: from localhost ([::1]:50796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odaHq-0006eN-Sq
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 12:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odZf3-0005HP-48
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:11:49 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:41794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odZez-0001mT-Lx
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:11:48 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 q15-20020a17090a304f00b002002ac83485so2135266pjl.0
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 09:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=xtntBUSgQjQ646Z34bLdN/xnmaFnrin1HP5o7X5RtMU=;
 b=OFNHFjZtatAYEghO65Sdb45ki5sobsfBz4NoA9GOTdsYLv44JvoJiV1ev9xvuWT9q/
 yxHb06WdnEB1cbqWjJkUpIdykMl21n85FgJc67CrLVS3zcbf8ajuMomPqs9m3ZMH7u6u
 TvbS+A2kP6ymGR7ZOKUcSFdpKOQcitwDFF889IHUcS1lM1gs7Ojy12Wppx0yhP9USKUD
 p1uWOcwf87bYwokMFCbV78plH0iqQ49xUep+nMGSzXAgQqnL4XRLjP+UZIuToD3q0tWK
 4HaHcafkWgNsgx0aRdqmo2mlvUo9H/PvEKfkatX8WgR1qoS6QqvURt+bJ/n5XyWoIAx6
 OckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=xtntBUSgQjQ646Z34bLdN/xnmaFnrin1HP5o7X5RtMU=;
 b=jvC9vhFaFjgbtnN6UgrK+JONaTbMvZgjc3nxz1RzyQaPaWcqLwT/FnjdEMaJDxp4aK
 RgyUbuiF5B0AR34Zg/D/9Sl+Y2md7f138AV1tFMtmjzY6gtXr97lRliJH3IGMYBm9tNg
 Qh/0rjO68XMsOKgqPWvnb+iDf7ywYclj8QVzgckH+sc+jMf3KdEz97opPzi2MV2UKFAn
 vw+SlAvXgrkmUuHTwXYIsH3TjMnhi/zP+JIX/mtsdBFiOfbLZHZGiUWeCDWP8mBYiiPa
 yxa1ytrbPHkbbnJ5dzVax3E4Q/uhwrQldKIoMhR+PgYvlPRiN5wBdA/xSfnJaNvxfo7y
 6Guw==
X-Gm-Message-State: ACrzQf1Q0p2ejviWTFN5kb6KReyuWBZAIruiQ/WITqAXQ8+0Cuxtzscj
 ZRx5ejsUFHtZ0bJdzQzGWyo6pg==
X-Google-Smtp-Source: AMsMyM7mup7me/uhw+ksKbpy28O6jQ4nje/rpi9R93S7ctZHrqruECgr2TGf8jM/sizd/V4qB6FAtw==
X-Received: by 2002:a17:90a:e7d2:b0:202:c6c9:4731 with SMTP id
 kb18-20020a17090ae7d200b00202c6c94731mr11527018pjb.114.1664381504061; 
 Wed, 28 Sep 2022 09:11:44 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a154300b00200b2894648sm1700610pja.52.2022.09.28.09.11.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 09:11:43 -0700 (PDT)
Message-ID: <bf55456b-195b-6dcb-68dd-593a2f2d9474@linaro.org>
Date: Wed, 28 Sep 2022 09:11:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] Hexagon (target/hexagon) Change decision to set
 pkt_has_store_s[01]
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: f4bug@amsat.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 mlambert@quicinc.com
References: <20220920080746.26791-1-tsimpson@quicinc.com>
 <20220920080746.26791-4-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220920080746.26791-4-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/22 01:07, Taylor Simpson wrote:
> We have found cases where pkt_has_store_s[01] is set incorrectly.
> This leads to generating an unnecessary store that is left over
> from a previous packet.
> 
> Add an attribute to determine if an instruction is a scalar store
> The attribute is attached to the fSTORE macro (hex_common.py)
> Simplify the logic in decode.c that sets pkt_has_store_s[01]
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   target/hexagon/attribs_def.h.inc |  1 +
>   target/hexagon/decode.c          | 17 ++++++++++++-----
>   target/hexagon/translate.c       | 10 ++++++----
>   target/hexagon/hex_common.py     |  3 ++-
>   4 files changed, 21 insertions(+), 10 deletions(-)
> 
> diff --git a/target/hexagon/attribs_def.h.inc b/target/hexagon/attribs_def.h.inc
> index 222ad95fb0..5d2a102c18 100644
> --- a/target/hexagon/attribs_def.h.inc
> +++ b/target/hexagon/attribs_def.h.inc
> @@ -44,6 +44,7 @@ DEF_ATTRIB(MEMSIZE_1B, "Memory width is 1 byte", "", "")
>   DEF_ATTRIB(MEMSIZE_2B, "Memory width is 2 bytes", "", "")
>   DEF_ATTRIB(MEMSIZE_4B, "Memory width is 4 bytes", "", "")
>   DEF_ATTRIB(MEMSIZE_8B, "Memory width is 8 bytes", "", "")
> +DEF_ATTRIB(SCALAR_STORE, "Store is scalar", "", "")
>   DEF_ATTRIB(REGWRSIZE_1B, "Memory width is 1 byte", "", "")
>   DEF_ATTRIB(REGWRSIZE_2B, "Memory width is 2 bytes", "", "")
>   DEF_ATTRIB(REGWRSIZE_4B, "Memory width is 4 bytes", "", "")
> diff --git a/target/hexagon/decode.c b/target/hexagon/decode.c
> index 6f0f27b4ba..2ba94a77de 100644
> --- a/target/hexagon/decode.c
> +++ b/target/hexagon/decode.c
> @@ -1,5 +1,5 @@
>   /*
> - *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
> + *  Copyright(c) 2019-2022 Qualcomm Innovation Center, Inc. All Rights Reserved.
>    *
>    *  This program is free software; you can redistribute it and/or modify
>    *  it under the terms of the GNU General Public License as published by
> @@ -402,10 +402,17 @@ static void decode_set_insn_attr_fields(Packet *pkt)
>           }
>   
>           if (GET_ATTRIB(opcode, A_STORE)) {
> -            if (pkt->insn[i].slot == 0) {
> -                pkt->pkt_has_store_s0 = true;
> -            } else {
> -                pkt->pkt_has_store_s1 = true;
> +            if (GET_ATTRIB(opcode, A_SCALAR_STORE) &&
> +                !GET_ATTRIB(opcode, A_MEMSIZE_0B)) {
> +                g_assert(GET_ATTRIB(opcode, A_MEMSIZE_1B) ||
> +                         GET_ATTRIB(opcode, A_MEMSIZE_2B) ||
> +                         GET_ATTRIB(opcode, A_MEMSIZE_4B) ||
> +                         GET_ATTRIB(opcode, A_MEMSIZE_8B));

Would this assert be redundant with the one I suggested vs patch 2?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> +                if (pkt->insn[i].slot == 0) {
> +                    pkt->pkt_has_store_s0 = true;
> +                } else {
> +                    pkt->pkt_has_store_s1 = true;
> +                }
>               }
>           }
>   
> diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
> index bc02870b9f..efe7d2264e 100644
> --- a/target/hexagon/translate.c
> +++ b/target/hexagon/translate.c
> @@ -1,5 +1,5 @@
>   /*
> - *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
> + *  Copyright(c) 2019-2022 Qualcomm Innovation Center, Inc. All Rights Reserved.
>    *
>    *  This program is free software; you can redistribute it and/or modify
>    *  it under the terms of the GNU General Public License as published by
> @@ -525,10 +525,12 @@ static void process_store_log(DisasContext *ctx, Packet *pkt)
>        *  slot 1 and then slot 0.  This will be important when
>        *  the memory accesses overlap.
>        */
> -    if (pkt->pkt_has_store_s1 && !pkt->pkt_has_dczeroa) {
> +    if (pkt->pkt_has_store_s1) {
> +        g_assert(!pkt->pkt_has_dczeroa);
>           process_store(ctx, pkt, 1);
>       }
> -    if (pkt->pkt_has_store_s0 && !pkt->pkt_has_dczeroa) {
> +    if (pkt->pkt_has_store_s0) {
> +        g_assert(!pkt->pkt_has_dczeroa);
>           process_store(ctx, pkt, 0);
>       }
>   }
> @@ -691,7 +693,7 @@ static void gen_commit_packet(CPUHexagonState *env, DisasContext *ctx,
>            * The dczeroa will be the store in slot 0, check that we don't have
>            * a store in slot 1 or an HVX store.
>            */
> -        g_assert(has_store_s0 && !has_store_s1 && !has_hvx_store);
> +        g_assert(!has_store_s1 && !has_hvx_store);
>           process_dczeroa(ctx, pkt);
>       } else if (has_hvx_store) {
>           TCGv mem_idx = tcg_constant_tl(ctx->mem_idx);
> diff --git a/target/hexagon/hex_common.py b/target/hexagon/hex_common.py
> index c81aca8d2a..d9ba7df786 100755
> --- a/target/hexagon/hex_common.py
> +++ b/target/hexagon/hex_common.py
> @@ -1,7 +1,7 @@
>   #!/usr/bin/env python3
>   
>   ##
> -##  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
> +##  Copyright(c) 2019-2022 Qualcomm Innovation Center, Inc. All Rights Reserved.
>   ##
>   ##  This program is free software; you can redistribute it and/or modify
>   ##  it under the terms of the GNU General Public License as published by
> @@ -75,6 +75,7 @@ def calculate_attribs():
>       add_qemu_macro_attrib('fWRITE_P3', 'A_WRITES_PRED_REG')
>       add_qemu_macro_attrib('fSET_OVERFLOW', 'A_IMPLICIT_WRITES_USR')
>       add_qemu_macro_attrib('fSET_LPCFG', 'A_IMPLICIT_WRITES_USR')
> +    add_qemu_macro_attrib('fSTORE', 'A_SCALAR_STORE')
>   
>       # Recurse down macros, find attributes from sub-macros
>       macroValues = list(macros.values())


