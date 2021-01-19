Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2891D2FC336
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 23:21:07 +0100 (CET)
Received: from localhost ([::1]:33658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1zN4-0000cQ-6r
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 17:21:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1zLk-0008BQ-Ip
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 17:19:44 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:35990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1zLj-00063b-3t
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 17:19:44 -0500
Received: by mail-ej1-x62c.google.com with SMTP id l9so25054043ejx.3
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 14:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jY734/+NrpsuZxFOKyP/VoCwZW0SsYEDZ9mEJHgvHgk=;
 b=NHIyrMT1L2Tm/5jTWqGePh+wIA++vyI8IOg6pBeFkuFHJSnYN+LL/jTd/Z9FrLoZ3r
 wpCmfi86qfMCwEuVEUxJIBkGxL9BjMkQkZwHTEoKV0yyYXaqIII3grf3++Lr6n5ZHPpp
 ZSO248DWS4XDKtSC69qgERY8+wz+Sffx0E3XSpfcHW+v/apn7ldRqdEBCKHxjMTHFyH+
 oNy8Rz8ewhSDuyjaaYBOKsuHnAB5W6FuU342XK9BNVPkDVO163WIKCQj8uDMBq911N7C
 erToj5alKYZSAGBFFbWHrR+JaL6BbXSoc51xhP8cCEuly8y84COvSq2jG5l7ySJBz8KN
 9lJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jY734/+NrpsuZxFOKyP/VoCwZW0SsYEDZ9mEJHgvHgk=;
 b=fCAtoqg9eRX9YWP2M4dbTSY82yczenPLAISrt/kkGTreNQx642Xfy+w7aaZOCmZBgd
 YTVu2pRv5DCXC09IursajywgW3YHef332etVCbSglL+24HEsXu9q+aJIDi2THquAxIac
 U6nKfn+5iUDadGA1/L4bOdrHgYjJPFyPMJGaB6NqnSTfwiobp+6/i/rB13E4l+St3Tze
 MkaDnAq6X5Rx7nLYOFuThmo5QvCheTSLxdFH1dUqe784e40tcg/DJ+xeNMftZHX6wSHm
 M0sSp36YG84Ppq8jquqOl++EVgjw9hACT7ibf6u8okzWdNjEVSyHPmZqvHQQbn+YqjQb
 x0ig==
X-Gm-Message-State: AOAM530HQS4Y2HTBaYxYOnEHE9ffb6ydALVAGUJCBHyEDf3QUJgefhsJ
 ea0GgSsgQn9EmwHqj81OUSASxL6YYxM=
X-Google-Smtp-Source: ABdhPJy+AtvP0iiedOYUeJrQ3yFR8jt0NL43GEyMaDCK+9TVdAtuhJxq0s7h5eclZ8Wuci2VYg29tQ==
X-Received: by 2002:a17:906:178d:: with SMTP id
 t13mr4210347eje.455.1611094780660; 
 Tue, 19 Jan 2021 14:19:40 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id u17sm100965edr.0.2021.01.19.14.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 14:19:39 -0800 (PST)
Subject: Re: [PATCH v2 07/22] tcg/tci: Split out target constraints to
 tcg-target-con-str.h
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <81da352b-3e72-7aef-81fd-343d10e850fe@amsat.org>
Date: Tue, 19 Jan 2021 23:19:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210115210456.1053477-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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

On 1/15/21 10:04 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci/tcg-target-con-str.h | 11 +++++++++++
>  tcg/tci/tcg-target.h         |  2 ++
>  tcg/tci/tcg-target.c.inc     | 14 --------------
>  3 files changed, 13 insertions(+), 14 deletions(-)
>  create mode 100644 tcg/tci/tcg-target-con-str.h
> 
> diff --git a/tcg/tci/tcg-target-con-str.h b/tcg/tci/tcg-target-con-str.h
> new file mode 100644
> index 0000000000..87c0f19e9c
> --- /dev/null
> +++ b/tcg/tci/tcg-target-con-str.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Define TCI target-specific operand constraints.
> + * Copyright (c) 2021 Linaro
> + */
> +
> +/*
> + * Define constraint letters for register sets:
> + * REGS(letter, register_mask)
> + */
> +REGS('r', MAKE_64BIT_MASK(0, TCG_TARGET_NB_REGS))
> diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
> index bb784e018e..ab832aecc3 100644
> --- a/tcg/tci/tcg-target.h
> +++ b/tcg/tci/tcg-target.h
> @@ -207,4 +207,6 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
>      /* no need to flush icache explicitly */
>  }
>  
> +#define TCG_TARGET_CON_STR_H
> +
>  #endif /* TCG_TARGET_H */
> diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
> index 9c45f5f88f..c913d85c37 100644
> --- a/tcg/tci/tcg-target.c.inc
> +++ b/tcg/tci/tcg-target.c.inc
> @@ -384,20 +384,6 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
>      return true;
>  }
>  
> -/* Parse target specific constraints. */
> -static const char *target_parse_constraint(TCGArgConstraint *ct,
> -                                           const char *ct_str, TCGType type)
> -{
> -    switch (*ct_str++) {
> -    case 'r':
> -        ct->regs = BIT(TCG_TARGET_NB_REGS) - 1;
> -        break;

Easy one :)
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> -    default:
> -        return NULL;
> -    }
> -    return ct_str;
> -}

