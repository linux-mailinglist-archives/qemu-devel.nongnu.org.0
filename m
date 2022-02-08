Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 656014AD829
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 13:09:36 +0100 (CET)
Received: from localhost ([::1]:48948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHPJO-0004Gi-P5
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 07:09:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHODi-0005Qo-8p
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:59:38 -0500
Received: from [2a00:1450:4864:20::430] (port=45011
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHODf-0003Z5-Ne
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:59:36 -0500
Received: by mail-wr1-x430.google.com with SMTP id k18so29964179wrg.11
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 02:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z3vyJrlhPBgOoYrRDXiEx+ljZIL8I+mXS/pYSsaSCGk=;
 b=hhFZ+PsjBDIB9Av4RNNs0zJriwKEM0ed/qvklqwyTzfUCHmXt5OuV8hPXrZCtCbGOJ
 8fKGn4jrGhiWzQPPRY6UrM6mzl2a0d9QD9ygPWRcdySa0kQkccPBI/TXJ3IeSR3C8uab
 m22En24+1/GluU/ljtcXHeVyRPsKt4opguzoLUVjIhDxwX32QnOX9y3h31D3icGyee++
 UAonTwnBoit43Ax1m55IlD9pui1bBu5HA6A8q5SoEWrZ3fm55LBXkvbYrPk8nP22nFdw
 qcOF72AJ29mZiG49+Z5S3bi/09xaPCmIDo29Ydep4/FahjbAupNpkvheqLdFeP5fW5gW
 m1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z3vyJrlhPBgOoYrRDXiEx+ljZIL8I+mXS/pYSsaSCGk=;
 b=Ht6xEuOyaT4rMMs0xKjZ8TJtTXVDERNQ9VN2OzyHQmGhlc77tu5g1W6JTiipNR+LWz
 MCYiItG17bP7crjpUHG/i5dnx3vkXmKp6LNV3X+3fvSTrDjEOm2x6eQ6bCkBWe82GLeZ
 VmnJgf+NYyjva9i31TP4Mm1NRH/XkMWHnPl7F0XPPeS1d1qMAgNLYYQS1iqTiT0/lfjw
 mdVl0mQB50kcbaBtjQ0sgFDQfCRnihxTrhg2kKZXVfWbVe4S2ufK4alTIK07qd2a9aJy
 f0AZsFSp/yZTyocqkqeYxHeodoIBtsMYMoIN4ya8pg74LEsQCQ8v9VvYHNTps4pnbNUQ
 UVuQ==
X-Gm-Message-State: AOAM530wFiCq/f8W7a7VZ5JhVAyuQ5h1H/1uhPMNkXpgZrlHzt7uyhDV
 Zz8oNwJ+3VifDEcCFFcmoqAcNWB4U0Ys+qeypKBApQ==
X-Google-Smtp-Source: ABdhPJwhmqHdaodp+JqJZoc9SEsQIB3exhNIW1fIuUydX9jOPwonNVHFeDT+58tAmEfwILRA8ZDAwds69Snm3odk3VM=
X-Received: by 2002:a5d:6d8d:: with SMTP id l13mr2984474wrs.295.1644317973832; 
 Tue, 08 Feb 2022 02:59:33 -0800 (PST)
MIME-Version: 1.0
References: <20220208071237.319844-1-richard.henderson@linaro.org>
 <20220208071237.319844-3-richard.henderson@linaro.org>
In-Reply-To: <20220208071237.319844-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Feb 2022 10:59:22 +0000
Message-ID: <CAFEAcA-Sy8wvO2h1tjNwPcK6j2Tfz-gGY2YTCeQZQEB_1jd=qg@mail.gmail.com>
Subject: Re: [PATCH 2/5] linux-user: Introduce host_signal_mask
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Feb 2022 at 08:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Do not directly access the uc_sigmask member.
> This is preparation for a sparc64 fix.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/include/host/aarch64/host-signal.h  |  5 +++++
>  linux-user/include/host/alpha/host-signal.h    |  5 +++++
>  linux-user/include/host/arm/host-signal.h      |  5 +++++
>  linux-user/include/host/i386/host-signal.h     |  5 +++++
>  .../include/host/loongarch64/host-signal.h     |  5 +++++
>  linux-user/include/host/mips/host-signal.h     |  5 +++++
>  linux-user/include/host/ppc/host-signal.h      |  5 +++++
>  linux-user/include/host/riscv/host-signal.h    |  5 +++++
>  linux-user/include/host/s390/host-signal.h     |  5 +++++
>  linux-user/include/host/sparc/host-signal.h    |  5 +++++
>  linux-user/include/host/x86_64/host-signal.h   |  5 +++++
>  linux-user/signal.c                            | 18 ++++++++----------
>  12 files changed, 63 insertions(+), 10 deletions(-)
>
> diff --git a/linux-user/include/host/aarch64/host-signal.h b/linux-user/include/host/aarch64/host-signal.h
> index 9770b36dc1..76ab078069 100644
> --- a/linux-user/include/host/aarch64/host-signal.h
> +++ b/linux-user/include/host/aarch64/host-signal.h
> @@ -40,6 +40,11 @@ static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
>      uc->uc_mcontext.pc = pc;
>  }
>
> +static inline void *host_signal_mask(ucontext_t *uc)
> +{
> +    return &uc->uc_sigmask;
> +}

Why void* rather than sigset_t* ?

thanks
-- PMM

