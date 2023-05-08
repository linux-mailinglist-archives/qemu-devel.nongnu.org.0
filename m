Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E31F6FB044
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 14:39:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw096-0008Ov-Be; Mon, 08 May 2023 08:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pw093-0008Nq-Ku
 for qemu-devel@nongnu.org; Mon, 08 May 2023 08:39:13 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pw092-0007OV-0u
 for qemu-devel@nongnu.org; Mon, 08 May 2023 08:39:13 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6aaf9092c52so514712a34.1
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 05:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1683549550; x=1686141550;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q9TzmsN3M4QgGfCIHSaHGZ5mFRq9DicVe3QIds5PYa4=;
 b=WPhdm6z+mRdzZ7L6hfsBUnwi1JyGFc38Lq5NcJLDGMbfS8b543mRAXQWeyE8hBNBq5
 vIyGIrr15g5ynigJXfLvt1OEXd2R9u61u+M79RJ8/XUs53Ya/6qkSY2Ye2CUm1/fLRXQ
 Z36DstgsKUTazvMoSHyQPaMWZtcjeuQW4TWt5N5V5XdC/0q4QPf38UJKhv+hzFmTI3MN
 QzyjQvnGGgRAaMPjMGrrDjoaejdp2q6CRpV7XljdfTS1p95yQOGAwpIdVEXbjNlLEMI3
 ZvinGDVwg1dNt/qGIT1WdgjFbVjHJu6DVh8Wtf8MJp9QjZ07E8avlvSo8XcQpQWbqIf7
 bM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683549550; x=1686141550;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q9TzmsN3M4QgGfCIHSaHGZ5mFRq9DicVe3QIds5PYa4=;
 b=cAoeJFzs6UyxlVoKhOrlOzO5E8wEUnI3qCJa1qh9F+lzzgDzUBzakv+V7nAHiChyTB
 I7DeamyGNq34IZjYsaRCcDflb+iD6t2fDHcrApn3u324aKZUtyKcYlbfAwi/8Zto12Ft
 jCt7R/Vn7PTKkHGyRl3B7gmW3hKxQuAWO5193ILsvNerlrYtXUSxmyCpgBTEND13bqnm
 MtWl1IOumFRcXI9bYJclXWKdnrBgt08Z+7juJGwqYeppaQJP+IxIU2M/JtTEO3B3KYV9
 AdQdYmQLnasUe4kjgNNeJsFX679WU1ZxSQmXTetqjeO0Rb4+vnTyatkT2k+NuGDn3WP1
 maHw==
X-Gm-Message-State: AC+VfDxDRkZzvjvXgUGBMbWyKwk+0tzcupQBJqttiHfAbMgx/LWdc5CE
 9+Yv2EKh/YmIufjrI13XRYrvMhkXR22E2vXAuzc=
X-Google-Smtp-Source: ACHHUZ5kWl9y/1TK4J9j/yNOImxFxikjIVNH3vuBFCjB5pj02Pq7Z2Ov8qgTq53HHnKMQhN+YmWIiA==
X-Received: by 2002:a05:6808:7c6:b0:38e:5f7:daa3 with SMTP id
 f6-20020a05680807c600b0038e05f7daa3mr4697435oij.36.1683549550546; 
 Mon, 08 May 2023 05:39:10 -0700 (PDT)
Received: from [192.168.68.107] (189-46-207-53.dsl.telesp.net.br.
 [189.46.207.53]) by smtp.gmail.com with ESMTPSA id
 k17-20020a544711000000b0038ebd84ce2bsm5435355oik.19.2023.05.08.05.39.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 05:39:10 -0700 (PDT)
Message-ID: <84f27dd2-da25-c5f7-e9f4-b8c5852e5b2e@ventanamicro.com>
Date: Mon, 8 May 2023 09:39:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 04/11] tcg/riscv: Support ADD.UW, SEXT.B, SEXT.H, ZEXT.H
 from Zba+Zbb
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230503085657.1814850-1-richard.henderson@linaro.org>
 <20230503085657.1814850-5-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230503085657.1814850-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.802,
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



On 5/3/23 05:56, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   tcg/riscv/tcg-target.c.inc | 32 ++++++++++++++++++++++++--------
>   1 file changed, 24 insertions(+), 8 deletions(-)
> 
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index c5b060023f..53a7f97b29 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -593,26 +593,42 @@ static void tcg_out_ext8u(TCGContext *s, TCGReg ret, TCGReg arg)
>   
>   static void tcg_out_ext16u(TCGContext *s, TCGReg ret, TCGReg arg)
>   {
> -    tcg_out_opc_imm(s, OPC_SLLIW, ret, arg, 16);
> -    tcg_out_opc_imm(s, OPC_SRLIW, ret, ret, 16);
> +    if (have_zbb) {
> +        tcg_out_opc_reg(s, OPC_ZEXT_H, ret, arg, TCG_REG_ZERO);
> +    } else {
> +        tcg_out_opc_imm(s, OPC_SLLIW, ret, arg, 16);
> +        tcg_out_opc_imm(s, OPC_SRLIW, ret, ret, 16);
> +    }
>   }
>   
>   static void tcg_out_ext32u(TCGContext *s, TCGReg ret, TCGReg arg)
>   {
> -    tcg_out_opc_imm(s, OPC_SLLI, ret, arg, 32);
> -    tcg_out_opc_imm(s, OPC_SRLI, ret, ret, 32);
> +    if (have_zba) {
> +        tcg_out_opc_reg(s, OPC_ADD_UW, ret, arg, TCG_REG_ZERO);
> +    } else {
> +        tcg_out_opc_imm(s, OPC_SLLI, ret, arg, 32);
> +        tcg_out_opc_imm(s, OPC_SRLI, ret, ret, 32);
> +    }
>   }
>   
>   static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
>   {
> -    tcg_out_opc_imm(s, OPC_SLLIW, ret, arg, 24);
> -    tcg_out_opc_imm(s, OPC_SRAIW, ret, ret, 24);
> +    if (have_zbb) {
> +        tcg_out_opc_imm(s, OPC_SEXT_B, ret, arg, 0);
> +    } else {
> +        tcg_out_opc_imm(s, OPC_SLLIW, ret, arg, 24);
> +        tcg_out_opc_imm(s, OPC_SRAIW, ret, ret, 24);
> +    }
>   }
>   
>   static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
>   {
> -    tcg_out_opc_imm(s, OPC_SLLIW, ret, arg, 16);
> -    tcg_out_opc_imm(s, OPC_SRAIW, ret, ret, 16);
> +    if (have_zbb) {
> +        tcg_out_opc_imm(s, OPC_SEXT_H, ret, arg, 0);
> +    } else {
> +        tcg_out_opc_imm(s, OPC_SLLIW, ret, arg, 16);
> +        tcg_out_opc_imm(s, OPC_SRAIW, ret, ret, 16);
> +    }
>   }
>   
>   static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg)

