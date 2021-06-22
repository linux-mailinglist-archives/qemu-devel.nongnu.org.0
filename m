Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 570CE3AFD20
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 08:38:17 +0200 (CEST)
Received: from localhost ([::1]:43592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lva36-0006YN-Eo
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 02:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lva1g-0005ms-0h
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 02:36:48 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:42927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lva1e-0003nQ-6N
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 02:36:47 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 l7-20020a05600c1d07b02901b0e2ebd6deso1471946wms.1
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 23:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Yoa4HRlamVxOGf7RW51aHUV8VH3pAb9VpunMB8QG21U=;
 b=WpcbeM96+TgmYXGevLpBtZFmKI668+9U17hUdz1pYA+fZpL2LhcYcNrgvajPkczp/h
 zmBZuJgiH1/TLJ0w0DpZIFbZMHVL6xVN5HdFIBjXM7P4YlYyaNCFCYvNE0o33efH+UGo
 +idQ0IaAhDmM/bKBAQ6qeG8cuhfOKxBRcBqb+boagUUwewWFa38ws0FKgpNcntxp4Gsi
 deGtuhMt4LxOgRW2DlgiZ0FPBRLF99SEhmOdVW+bYImZ9zbbo8e0FsWB/wW+m6jmwLIn
 eQY28khVmiPWrwLOO2EwHnmVM6tkspYLM7/6aW0QJoL4DKiz2KDAxrg74NMVCuX7xE5b
 WKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Yoa4HRlamVxOGf7RW51aHUV8VH3pAb9VpunMB8QG21U=;
 b=ekOoYoju3aVUmijEbhDnUah0wdaS6z/eWdfHMF2+FQiZGIaIx8Q27rgEN1gXXZ0ZiT
 64iQHBbKsmcX4wWUHrX48gB3LFBcta9N5Yeyz9Jd7SWl7YrAHIPI4D3axEkj+miaM6si
 8InzJAQCpilan2PTCW6hyRH5W4OCjd5i3T4BdXFVQRp3e42IVt59xRi2lD+hrmY3SFYl
 ynRIkX+ZqFuhKNx0ny3v/b5yT68DbgWor6ksqtvk1in8StZwWfgisQDh/+Pvl6B3WIG/
 8bRoNUXSkW4Qq5dQK41H/BFlDPyAdRmgmg4Te+8XlyBMrd197FyhMW+oeeDVdc9rFMQ+
 S0dA==
X-Gm-Message-State: AOAM532iAJHUOb2WeMsThM4lemLyG6iCUqUt3Hiq7RN2xpsFg9rSqKX1
 Yb1oHwfYMo7ajRX86MlWtSig3ia9c3lZDQ==
X-Google-Smtp-Source: ABdhPJwBmYyiEUGkrG4lWFtcSgQu8mzoL4fE74982scmoQfAcAq0tIvp0nWJFiZ4L2hAHDPkRv8EDA==
X-Received: by 2002:a05:600c:3581:: with SMTP id
 p1mr2612658wmq.109.1624343804121; 
 Mon, 21 Jun 2021 23:36:44 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id v18sm11050813wrv.24.2021.06.21.23.36.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 23:36:43 -0700 (PDT)
Subject: Re: [PATCH 13/28] tcg/mips: Support bswap flags in tcg_out_bswap16
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a6a30b81-6ff5-fbab-46ef-961054f8d667@amsat.org>
Date: Tue, 22 Jun 2021 08:36:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614083800.1166166-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 6/14/21 10:37 AM, Richard Henderson wrote:
> Merge tcg_out_bswap16 and tcg_out_bswap16s.  Use the flags
> in the internal uses for loads and stores.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/mips/tcg-target.c.inc | 60 ++++++++++++++++++---------------------
>  1 file changed, 28 insertions(+), 32 deletions(-)
> 
> diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
> index 5944448b2a..7a5634419c 100644
> --- a/tcg/mips/tcg-target.c.inc
> +++ b/tcg/mips/tcg-target.c.inc
> @@ -540,39 +540,36 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
>      }
>  }
>  
> -static inline void tcg_out_bswap16(TCGContext *s, TCGReg ret, TCGReg arg)
> +static void tcg_out_bswap16(TCGContext *s, TCGReg ret, TCGReg arg, int flags)
>  {
> +    /* ret and arg can't be register tmp0 */
> +    tcg_debug_assert(ret != TCG_TMP0);
> +    tcg_debug_assert(arg != TCG_TMP0);
> +
>      if (use_mips32r2_instructions) {
>          tcg_out_opc_reg(s, OPC_WSBH, ret, 0, arg);
> -    } else {
> -        /* ret and arg can't be register at */
> -        if (ret == TCG_TMP0 || arg == TCG_TMP0) {
> -            tcg_abort();
> +        if (flags & TCG_BSWAP_OS) {
> +            tcg_out_opc_reg(s, OPC_SEH, ret, 0, ret);
> +        } else if ((flags & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
> +            tcg_out_opc_imm(s, OPC_ANDI, ret, ret, 0xffff);
>          }
> -
> -        tcg_out_opc_sa(s, OPC_SRL, TCG_TMP0, arg, 8);
> -        tcg_out_opc_sa(s, OPC_SLL, ret, arg, 8);
> -        tcg_out_opc_imm(s, OPC_ANDI, ret, ret, 0xff00);
> -        tcg_out_opc_reg(s, OPC_OR, ret, ret, TCG_TMP0);
> +        return;
>      }
> -}
>  
> -static inline void tcg_out_bswap16s(TCGContext *s, TCGReg ret, TCGReg arg)
> -{
> -    if (use_mips32r2_instructions) {
> -        tcg_out_opc_reg(s, OPC_WSBH, ret, 0, arg);
> -        tcg_out_opc_reg(s, OPC_SEH, ret, 0, ret);
> -    } else {
> -        /* ret and arg can't be register at */
> -        if (ret == TCG_TMP0 || arg == TCG_TMP0) {
> -            tcg_abort();
> -        }
> -
> -        tcg_out_opc_sa(s, OPC_SRL, TCG_TMP0, arg, 8);
> +    tcg_out_opc_sa(s, OPC_SRL, TCG_TMP0, arg, 8);
> +    if (!(flags & TCG_BSWAP_IZ)) {
> +        tcg_out_opc_imm(s, OPC_ANDI, TCG_TMP0, TCG_TMP0, 0x00ff);
> +    }
> +    if (flags & TCG_BSWAP_OS) {
>          tcg_out_opc_sa(s, OPC_SLL, ret, arg, 24);
>          tcg_out_opc_sa(s, OPC_SRA, ret, ret, 16);
> -        tcg_out_opc_reg(s, OPC_OR, ret, ret, TCG_TMP0);
> +    } else {
> +        tcg_out_opc_sa(s, OPC_SLL, ret, arg, 8);
> +        if (flags & TCG_BSWAP_OZ) {
> +            tcg_out_opc_imm(s, OPC_ANDI, ret, ret, 0xff00);
> +        }
>      }
> +    tcg_out_opc_reg(s, OPC_OR, ret, ret, TCG_TMP0);
>  }

Do you mind including the comments (after reviewing them ;) )?

static void tcg_out_bswap16(TCGContext *s, TCGReg ret, TCGReg arg, int
flags)
{
    /* ret and arg can't be register tmp0 */
    tcg_debug_assert(ret != TCG_TMP0);
    tcg_debug_assert(arg != TCG_TMP0);

                                                        /* src = abcd
efgh */
    if (use_mips32r2_instructions) {
        tcg_out_opc_reg(s, OPC_WSBH, ret, 0, arg);      /* ret = cdab
ghef */
        if (flags & TCG_BSWAP_OS) {
            tcg_out_opc_reg(s, OPC_SEH, ret, 0, ret);   /* ret = ssss
ghef */
        } else if ((flags & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) ==
TCG_BSWAP_OZ) {
            tcg_out_opc_imm(s, OPC_ANDI, ret, ret, 0xffff);
                                                        /* ret = 0000
ghef */
        }
        return;
    }

    tcg_out_opc_sa(s, OPC_SRL, TCG_TMP0, arg, 8);       /* t0  = ssab
cdef */
    if (!(flags & TCG_BSWAP_IZ)) {                      /* t0  = 0000
00ef */
        tcg_out_opc_imm(s, OPC_ANDI, TCG_TMP0, TCG_TMP0, 0x00ff);
    }
    if (flags & TCG_BSWAP_OS) {
        tcg_out_opc_sa(s, OPC_SLL, ret, arg, 24);       /* ret = gh..
.... */
        tcg_out_opc_sa(s, OPC_SRA, ret, ret, 16);       /* ret = ssss
gh.. */
    } else {
        tcg_out_opc_sa(s, OPC_SLL, ret, arg, 8);        /* ret = cdef
gh.. */
        if (flags & TCG_BSWAP_OZ) {                     /* ret = 0000
gh.. */
            tcg_out_opc_imm(s, OPC_ANDI, ret, ret, 0xff00);
        }
    }
    tcg_out_opc_reg(s, OPC_OR, ret, ret, TCG_TMP0); /* OZ: ret = 0000
ghef */
                                                    /* OS: ret = ssss
ghef */
}

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

