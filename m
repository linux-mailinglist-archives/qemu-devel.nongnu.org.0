Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 971586F04C8
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 13:11:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1przX5-000787-LL; Thu, 27 Apr 2023 07:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1przX2-00077i-VO
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 07:11:24 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1przX0-0008CI-D0
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 07:11:24 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-957dbae98b4so1011194966b.1
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 04:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682593881; x=1685185881;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bJIBr8lVieZYEQX3CdM5qqoGf62t09+SIRJ9FkckOYg=;
 b=HLXiSX5Iii4ZLMfWoisGDyIA+mlo/I6LxhVoK+VEnDA7LuvrH9NXc3/96PUN3zT+Gj
 +tvfiWdCll2+PRJRts9YH3RsDkdaDTfaJ+eD3Vnrae8MDps+V5hlfvts2sr3UhrsLi0l
 Ej9IpEv32saFRmMNkoi8vGTyh+Me4AEIk7olP9/xsFLcyNabQHFhOr3cVXSGNqX++7Ul
 87rScwIySfGg2d+1T7XB1lwkhhiL0Jqbyd9bVTJUq2otjMbPGjywt9pWwxiUgJpRBeJw
 /PYv/nACle8pOS2M5ns0buv0tRyC2xM/JUzmyeT7r5Ey5YapFLjohQiRMpISO6ea93yy
 I4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682593881; x=1685185881;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bJIBr8lVieZYEQX3CdM5qqoGf62t09+SIRJ9FkckOYg=;
 b=XHA1oqOlN7lVSNzH44IKeNTcJfa/M4pYMageD61uLnmz9CD/b3R8C7bLGgTwvlzutv
 lt5ZoD+35DlSPHk6k/RAGcnncN9Bgh4pYTV50gN9ARj/5k8F0YfgnhPR0Vkl0G/bvT0g
 CSu+gE/4pnEoSvd/7Q7ga+aj2cA1nRrjuTWmVOjm7hI4rcRHhBHr16XUvHacDOUk4ez+
 +EzzF9r89FOR2UbbsEWwBnu6zJKUeg7rzG0cuUkqkcKtIjYRJUva7jGe10luejs32KLl
 1xETdUDm2hStLhknMh3c+lb2cFKeaemjQuKbrBesd7WJ1zxixW0s1cLuHeFitsg3/bwr
 DV/A==
X-Gm-Message-State: AC+VfDxh74gg3rRdLQYbpfrHjJbgbrYVYbCozpPuj294tVvytichSLJW
 DxIy/AXgVAS7LfzT4GHuFT7mbg==
X-Google-Smtp-Source: ACHHUZ5KBrgu/9BN4JaWm3ribscAIEZsVioLgOQwVoFURmIAXHGay3MNtgMNg+ACMb/Y36cScFubbQ==
X-Received: by 2002:a17:907:7245:b0:94f:8605:3f31 with SMTP id
 ds5-20020a170907724500b0094f86053f31mr1051077ejc.42.1682593880704; 
 Thu, 27 Apr 2023 04:11:20 -0700 (PDT)
Received: from [172.23.3.19] ([31.221.30.162])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a170906bc4c00b00947ed087a2csm9511377ejv.154.2023.04.27.04.11.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 04:11:20 -0700 (PDT)
Message-ID: <d271ca60-6ed2-4b9b-920b-50598c5c0da7@linaro.org>
Date: Thu, 27 Apr 2023 12:11:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 20/21] Hexagon (target/hexagon) Move pkt_has_store_s1 to
 DisasContext
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20230426004240.1319494-1-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426004240.1319494-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/26/23 01:42, Taylor Simpson wrote:
> +static TCGv gen_slotval(DisasContext *ctx)
> +{
> +    TCGv slotval = tcg_temp_new();
> +    tcg_gen_movi_tl(slotval, ctx->pkt->pkt_has_store_s1 & 1);
> +    tcg_gen_ori_tl(slotval, slotval, ctx->insn->slot << 1);
> +    return slotval;
> +}

This can be entirely constant:

     int slotval = (ctx->pkt->pkt_has_store_s1 & 1)
                 | (ctx->insn->slot << 1);
     return tcg_constant_tl(slotval);


Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



