Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A87122D442C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 15:25:55 +0100 (CET)
Received: from localhost ([::1]:33206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn0Pa-0004d6-CL
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 09:25:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn0Lo-00039I-1M
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:21:52 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:45594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn0Ll-00019K-9F
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:21:50 -0500
Received: by mail-oi1-x243.google.com with SMTP id f132so1832971oib.12
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 06:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=d7Bj2NQlUHTKY2x3yWMeSoQmyQhISghjSrG0dVa6TLw=;
 b=VuWLFeLSnykt33bd+kS0I/Jg48WOvtb0EjkTBr+IyW2maETfZkEUEXVOZUlb1dDDVU
 Chh53kqWHY3nzrrVa6/Cr7qKC7TPQDBLNdGn7T1NebKtr3NP9zdscDs160zFf2rkQ5DI
 W9SGiq0IB8yvfq2Vl3t/c07S5XJ5joFxtCwaqcCs/xv/YCpN1kPRbPXEFsqLhR06i7pN
 JwnHMIAtobZfIPmdpQmsP5BmQNIWq96F+9Y7P0zkm3GYnM+umZUz2wbDNLYU2rWAnGF6
 K/WOwXUuuZ14/gu+FadAJ+NEM6fwOQh/x234a/efl2L9QaUiSjHxKX/+cM4d3lUqXmYT
 NW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d7Bj2NQlUHTKY2x3yWMeSoQmyQhISghjSrG0dVa6TLw=;
 b=RVlbdj7gGSk4SbVPwmeC79RAAv76dENpsJ1woU/V4uDr18owC/xU9V9WHVU9qt14+d
 /WZ0ROKsnbmNuWAuk3ycKoJ2pveAGZyz4Xc5l4/OUq9LMBv0xcAwe+/QQpQ3Pw5WgoFH
 FYGGQk2Ml62pgNttEjbIDLYa5Hs7rSWS/ByNnDZiM6LgRpIrbtvRB588GjtOOkf7Wcm4
 hMm/CR0fb7uDne4hyZ5pHOuPq6p8Bwz2GCxZst/C4hLp7ZW2JS317SSzaftIM44/uX6A
 l28C6mnG+Dh/Ofa5LX6SWJKb81yYlwcFAjhQbBWalmgaHE+LLaF4vj+FjnRgBHMUo0Uj
 ocRg==
X-Gm-Message-State: AOAM53145V676wysKRhSOGIPkbR3rQcsYi6Uyqftaa0rwRfT4O5Mcc7l
 DXQj8ubz98xbuI5d4GBCirEcUA==
X-Google-Smtp-Source: ABdhPJw4+YGxKI4HHuM/03eQk1ElESQlnvmICoyeQV505APvmqKsjSF/Nqya0AJSvcjbAVlxKmjkfA==
X-Received: by 2002:aca:5889:: with SMTP id m131mr1867858oib.41.1607523708082; 
 Wed, 09 Dec 2020 06:21:48 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id s189sm334352oia.7.2020.12.09.06.21.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 06:21:47 -0800 (PST)
Subject: Re: [PATCH 04/13] target/mips: Introduce decodetree helpers for
 Release6 LSA/DLSA opcodes
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201208203704.243704-1-f4bug@amsat.org>
 <20201208203704.243704-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6073e7ff-3fd6-d1f2-23a2-0ef8b9ab1467@linaro.org>
Date: Wed, 9 Dec 2020 08:21:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201208203704.243704-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x243.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 2:36 PM, Philippe Mathieu-Daudé wrote:
> +++ b/target/mips/isa-mips_rel6_translate.c
> @@ -0,0 +1,33 @@
> +/*
> + *  MIPS emulation for QEMU - # Release 6 translation routines
> + *
> + *  Copyright (c) 2004-2005 Jocelyn Mayer
> + *  Copyright (c) 2006 Marius Groeger (FPU operations)
> + *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
> + *  Copyright (c) 2020 Philippe Mathieu-Daudé
> + *
> + * This code is licensed under the GNU GPLv2 and later.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "tcg/tcg-op.h"
> +#include "exec/helper-gen.h"
> +#include "translate.h"
> +
> +/* Include the auto-generated decoder.  */
> +#include "decode-isa-mips32r6.c.inc"
> +#if defined(TARGET_MIPS64)
> +#include "decode-isa-mips64r6.c.inc"
> +#endif /* TARGET_MIPS64 */
> +
> +static bool trans_LSA(DisasContext *ctx, arg_LSA *a)
> +{
> +    return gen_LSA(ctx, a->rd, a->rt, a->rs, a->sa);
> +}
> +
> +#if defined(TARGET_MIPS64)
> +static bool trans_DLSA(DisasContext *ctx, arg_LSA *a)
> +{
> +    return gen_DLSA(ctx, a->rd, a->rt, a->rs, a->sa);
> +}

You should be able to share these trans_* functions, and then with or after the
next patch, fold the gen_* functions into their single caller, the trans_*
functions.

Note that decodetree --translate=trans will drop the static, without otherwise
adjusting the function naming.


r~

