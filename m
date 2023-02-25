Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 977AD6A2886
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:35:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqxC-0007hk-Oh; Sat, 25 Feb 2023 04:34:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVqxB-0007hY-4l
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:34:53 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVqx9-0003Yz-F1
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:34:52 -0500
Received: by mail-oi1-x234.google.com with SMTP id bh20so1377874oib.9
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MgsPWw6U8ynongLvd0xde+ewh7OsxyZtl0tTEyP6Jug=;
 b=ZinREAVwS1Ir2a2aNsRWQCsz+H6gid7kdbd5lQj1H9IWlFLGc8XD44jWyAP+sUUV7D
 I3lh0YbVKbUNPID0bmACi7nUo3xCtPtdJdqNPpkhSKPDK6soGBXm2s/9DdOTDmFJSfxq
 mMDpSpdapaVLfg5Q2pem+m4/2h1OFaeBk0y/Wv+ZSP6btEfH1emetYA4im0K6U7nnhU5
 LMN6EFuqTHE21w29VKH2cTL8PGb0N6z3xF/5VgcAheef7sgODDBvSlBruK5ESX9qv9ZY
 ukBiMMfXX9Z0OJNfhlZWu0lOYf1GFq2n3ABA2gJ0uaRIlNpyTvfYSvTiUNUn+7mMFqC6
 i+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MgsPWw6U8ynongLvd0xde+ewh7OsxyZtl0tTEyP6Jug=;
 b=cgvMIyXnzOV9qNeVYOXAoCMBPbvCuRCKQ4uGMZlR6bnygQZXtTG174VJ7ZWt28/Nvb
 3vPH4cDTPx20vP7rOrKtpzrm7GSf2hrpt10RUTbTr0ntou/Kj3pqDYDLhJhOFc3qlFyB
 B0yVO1tnPgC2Ng5yd90ktyLELJfwemMqv/w3fofOKGze1aR321f4nP9hDrvz6JzWUgXo
 AIROMAVrxDmo8lxVixmI3FwUnx9Tk0sAURQ7eoAtOU2OOlD9Os9LKrf5rpDUY0txkIaQ
 iSSGLy0pbftWEOaXOpn0wHKFOr5FYu2Aw6D5XTTlWkjfbRPP//WXhLCGCLxoSmBAGIFI
 6KFg==
X-Gm-Message-State: AO0yUKXYOFeo/+RrbcZrQEzAkTBZ8XF3ng4RtoBPg+Z5ZCKrzpQ6/6d5
 JE1MbdY6TdF24wDNiKN05UIYBQ==
X-Google-Smtp-Source: AK7set+8kqZoU1zLtc9ofXhyoq4LFDZWCYmqaxbrVx/lo893sbcg+0PBnq4xSG3pR7ZKWNsDbT5x/w==
X-Received: by 2002:a05:6808:170f:b0:37f:ac0a:f4d5 with SMTP id
 bc15-20020a056808170f00b0037fac0af4d5mr1707880oib.3.1677317689844; 
 Sat, 25 Feb 2023 01:34:49 -0800 (PST)
Received: from [192.168.68.107] ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 m124-20020acabc82000000b00383e12e20c5sm719624oif.24.2023.02.25.01.34.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 01:34:49 -0800 (PST)
Message-ID: <af92ecd7-491d-ea41-6e34-83f6e8bcb355@ventanamicro.com>
Date: Sat, 25 Feb 2023 06:34:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 10/30] tcg: Use tcg_constant_i32 in tcg_gen_io_start
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
 <20230225085945.1798188-11-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230225085945.1798188-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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



On 2/25/23 05:59, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   include/exec/gen-icount.h | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
> index c57204ddad..4d8b1f9ae5 100644
> --- a/include/exec/gen-icount.h
> +++ b/include/exec/gen-icount.h
> @@ -10,11 +10,9 @@ static TCGOp *icount_start_insn;
>   
>   static inline void gen_io_start(void)
>   {
> -    TCGv_i32 tmp = tcg_const_i32(1);
> -    tcg_gen_st_i32(tmp, cpu_env,
> +    tcg_gen_st_i32(tcg_constant_i32(1), cpu_env,
>                      offsetof(ArchCPU, parent_obj.can_do_io) -
>                      offsetof(ArchCPU, env));
> -    tcg_temp_free_i32(tmp);
>   }
>   
>   static inline void gen_tb_start(const TranslationBlock *tb)

