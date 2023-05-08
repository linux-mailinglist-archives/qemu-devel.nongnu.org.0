Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D916FB03F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 14:38:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw07Y-0005r2-Pn; Mon, 08 May 2023 08:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pw07U-0005m8-Sg
 for qemu-devel@nongnu.org; Mon, 08 May 2023 08:37:36 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pw07S-000732-KM
 for qemu-devel@nongnu.org; Mon, 08 May 2023 08:37:36 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6a981550a6fso3364518a34.1
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 05:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1683549453; x=1686141453;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2lN3lrXIL+FXeYnqrXum+UDz3v133SsIE6mMBX1V6jw=;
 b=MZRztSHLoNlZ2cVfXUrO2oZUh3xHvWwhUJuEQKj4U/L+5ysvS9TcGVbvWJCTr9mah5
 DPUnb89fSsMX6a8Mv4BhO0t26qyQkOBQ05tPZIZ7N7rMVc/JA9GmGJvgJ021nosN+Q0e
 7siMruSrXgiGDdtBzq3wfOXdo5s3bCcq8IBX2hnyZn6pqanQBdFlUz5yUqH9DiCPm6KD
 ccbhlNGPEo36gx7BdptsJsLlH0YTPOHAClAh6gSgPXetPinOSI7IUP0jCS0Gs49Qcc1q
 nmuzJedT8V3KlWzLUDgQ3pFBZ88BkCyX72Khi55xqG+WmV4geZXGNPcqdZBccXKjMtoq
 cnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683549453; x=1686141453;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2lN3lrXIL+FXeYnqrXum+UDz3v133SsIE6mMBX1V6jw=;
 b=ZVqwhRzxxppJSQgLuCkYkI6uZevqRZ7jKJhrwwwW+5oHjrLcUE0rG/k9ohqdNrxHOB
 SjrRwhO737S64CMJFo9gBmn9fWX5fyWb2waak/y73s+22nxPLgezhAXEgBGTLZKsB5if
 GWvvQp9g2TeIpQ4Si/mseZKLJP2L91jpkZxKDf8RhwVf9I2mNOB1y82mZg86tN/yxYAf
 mOxcnzaT8AjIRTXDps9hj6EcELUX5bCrQni85zkXQ/N/YnEzdHW11bE7kAaI/L3p+m+K
 eVdtagn1teCxdf11N6Fz8qpNLjw59Pw5sYaxyUrwrQZrK3yITcNIZUlnzc56WtwhK5bO
 4/tA==
X-Gm-Message-State: AC+VfDwiu9+QuCh/W2Ez+KQpmiYqzWM+vP1UAXfbjWkR9c0oS4OcD4y0
 E5bd8x5/U0iA+7VXwtNosn/HXs1xaZv/mBbGHDw=
X-Google-Smtp-Source: ACHHUZ5NxwMuhwAuC7/49qYrYkbwZYZa11NakWXZgpUnXqkR86ie1j6bX/LSjGnRhuaISPr24eSSig==
X-Received: by 2002:a9d:61d3:0:b0:6a6:399d:60b6 with SMTP id
 h19-20020a9d61d3000000b006a6399d60b6mr4169208otk.19.1683549453325; 
 Mon, 08 May 2023 05:37:33 -0700 (PDT)
Received: from [192.168.68.107] (189-46-207-53.dsl.telesp.net.br.
 [189.46.207.53]) by smtp.gmail.com with ESMTPSA id
 l14-20020a9d6a8e000000b006a17bbe32f8sm4019332otq.51.2023.05.08.05.37.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 05:37:32 -0700 (PDT)
Message-ID: <bfbf733e-e4e2-0cfe-5026-3cd978eedc95@ventanamicro.com>
Date: Mon, 8 May 2023 09:37:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 01/11] disas/riscv: Decode czero.{eqz,nez}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230503085657.1814850-1-richard.henderson@linaro.org>
 <20230503085657.1814850-2-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230503085657.1814850-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32f.google.com
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

>   disas/riscv.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/disas/riscv.c b/disas/riscv.c
> index d6b0fbe5e8..c0a8b1006a 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -935,6 +935,8 @@ typedef enum {
>       rv_op_vsetvli = 766,
>       rv_op_vsetivli = 767,
>       rv_op_vsetvl = 768,
> +    rv_op_czero_eqz = 769,
> +    rv_op_czero_nez = 770,
>   } rv_op;
>   
>   /* structures */
> @@ -2066,7 +2068,9 @@ const rv_opcode_data opcode_data[] = {
>       { "vsext.vf8", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vsext_vf8, rv_op_vsext_vf8, 0 },
>       { "vsetvli", rv_codec_vsetvli, rv_fmt_vsetvli, NULL, rv_op_vsetvli, rv_op_vsetvli, 0 },
>       { "vsetivli", rv_codec_vsetivli, rv_fmt_vsetivli, NULL, rv_op_vsetivli, rv_op_vsetivli, 0 },
> -    { "vsetvl", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, rv_op_vsetvl, rv_op_vsetvl, 0 }
> +    { "vsetvl", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, rv_op_vsetvl, rv_op_vsetvl, 0 },
> +    { "czero.eqz", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "czero.nez", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>   };
>   
>   /* CSR names */
> @@ -2792,6 +2796,8 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>               case 45: op = rv_op_minu; break;
>               case 46: op = rv_op_max; break;
>               case 47: op = rv_op_maxu; break;
> +            case 075: op = rv_op_czero_eqz; break;
> +            case 077: op = rv_op_czero_nez; break;
>               case 130: op = rv_op_sh1add; break;
>               case 132: op = rv_op_sh2add; break;
>               case 134: op = rv_op_sh3add; break;

