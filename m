Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B783C2ED3C8
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 16:52:58 +0100 (CET)
Received: from localhost ([::1]:38122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxXar-0000k8-Qd
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 10:52:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXZb-0008EB-J7
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 10:51:39 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:42643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXZZ-00035t-RR
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 10:51:39 -0500
Received: by mail-ej1-x634.google.com with SMTP id d17so10292364ejy.9
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 07:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I/vDupz7Rxchh5Jd54TDGf5kcRCoouR9LesX9aPCKP4=;
 b=ZjRc8GELmEbuwFVc7lK7tsx6sPOdGHoKNiMrT73sb+rMY5yqwoMYqC/8h17/gXkJsY
 5Ss8+qV9CkvXEYVM21d1nqowyyg4QOu5ya3taRudPbECehBifmndJD3u0It+KlzpbFHj
 yBObo9LwO9ZgxQ6scvi1tgKDLXdnn/k/E6TpNJF9OZcgN9rRIXTL4qDixZ1N/2rO6ufT
 9vitrgUNc89A/5bVNhpkr989OQjCykr4t7zo54279PyRK1rWWPuSnUQLx9rBRNzwBtnq
 P4fMYUZrDRomUTAZBCDX9f1yCqtsMYGQFO1mxQ3l0jfgf+7NtkmRjt04k+PI8gTr687s
 shxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I/vDupz7Rxchh5Jd54TDGf5kcRCoouR9LesX9aPCKP4=;
 b=IC3gwQXRM0VE8U7aU1tuwxiLuMbxy7A18DMHK0mSwIfrjauofQRLXNFpV8U1msUj8l
 f6V/GeawEQGHnXPasdxI6kCwAnKhcOlDyxsjKlyDXvUGBYTEhqlDVpVgMbcarVfAVMZg
 0cRd7Gj8de+0U5B1k82z2pMJitgMI4BT6YFYywRV4nKBxGivmHsgT4ybjvD6nX2culwK
 IZTslgy0lqwa40C+0kGIDSJTu1ipN4Cmsea+ONGIjj9L268fZ0OxKM6LWQe75vHWZSJb
 /iMuHlriVWh0opDN1EDt5T7WBkbCvpNXTddO+NXlVoMCQMqBWh8IL151/Bb7TxRNAMEI
 wSDw==
X-Gm-Message-State: AOAM533yutx3c7AcpOZywVmTYd5hg0FW9Tz0BkSGnk1hJRNsQKQnu53m
 /2TfSUIDHm4/ATtReZZIgQ8AeA1FVga9m3jJ5khIxQ==
X-Google-Smtp-Source: ABdhPJyO5OGvxGpPvw2wU2Wpvr44sZKL3rm7EkXoipEpaPSdzKD1aoan7m6GwpssqlzIHqBwl1tHQmNOtmr9I5SjViA=
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr6821597ejr.482.1610034696057; 
 Thu, 07 Jan 2021 07:51:36 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-4-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 15:51:24 +0000
Message-ID: <CAFEAcA99WEhBTsEy+N=NxW_J5Daa_mycJOrSNnRjOqLM-HULEA@mail.gmail.com>
Subject: Re: [PATCH v2 03/24] target/arm: Adjust gen_aa32_{ld,
 st}_i32 for align+endianness
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create a finalize_memop function that computes alignment and
> endianness and returns the final MemOp for the operation.
>
> Split out gen_aa32_{ld,st}_internal_i32 which bypasses any special
> handling of endianness or alignment.  Adjust gen_aa32_{ld,st}_i32
> so that s->be_data is not added by the callers.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.h          |  24 ++++++++
>  target/arm/translate.c          | 100 +++++++++++++++++---------------
>  target/arm/translate-neon.c.inc |   9 +--
>  3 files changed, 79 insertions(+), 54 deletions(-)
>
> diff --git a/target/arm/translate.h b/target/arm/translate.h
> index fb66b4d8a0..22a4b15d45 100644
> --- a/target/arm/translate.h
> +++ b/target/arm/translate.h
> @@ -448,4 +448,28 @@ static inline TCGv_ptr fpstatus_ptr(ARMFPStatusFlavour flavour)
>      return statusptr;
>  }
>
> +/**
> + * finalize_memop:
> + * @s: DisasContext
> + * @opc: size+sign+align of the memory operation
> + *
> + * Build the complete MemOp for a memory operation, including alignment
> + * and endianness.
> + *
> + * If (op & MO_AMASK) then the operation already contains the required
> + * alignment, e.g. for AccType_ATOMIC.  Otherwise, this an optionally
> + * unaligned operation, e.g. for AccType_NORMAL.
> + *
> + * In the later case, there are configuration bits that require alignment,

"latter case".

> + * and this is applied here.  Note that there is no way to indicate that
> + * no alignment should ever be enforced; this must be handled manually.
> + */
> +static inline MemOp finalize_memop(DisasContext *s, MemOp opc)
> +{
> +    if (s->align_mem && !(opc & MO_AMASK)) {
> +        opc |= MO_ALIGN;
> +    }
> +    return opc | s->be_data;
> +}
> +

> +#define DO_GEN_LD(SUFF, OPC)                                            \
> +    static inline void gen_aa32_ld##SUFF(DisasContext *s, TCGv_i32 val, \
> +                                         TCGv_i32 a32, int index)       \
> +    {                                                                   \
> +        gen_aa32_ld_i32(s, val, a32, index, OPC);                       \
>      }

> +#define DO_GEN_ST(SUFF, OPC)                                            \
> +    static inline void gen_aa32_st##SUFF(DisasContext *s, TCGv_i32 val, \
> +                                         TCGv_i32 a32, int index)       \
> +    {                                                                   \
> +        gen_aa32_st_i32(s, val, a32, index, OPC);                       \
> +    }

Since these generated functions no longer do anything extra
that the gen_aa32_{ld,st}_i32() that the call don't do,
we could reasonably have a follow-on patch that makes all
the callsites directly call those functions and remove
the extra layer of indirection, I think. The main reason
we had them before was so that we had somewhere to add
the handling of s->be_data.

For this patch, other than the typo above,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

