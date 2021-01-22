Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D514300515
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 15:16:10 +0100 (CET)
Received: from localhost ([::1]:53914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2xEP-0001t1-28
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 09:16:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2xCW-0000Y5-Nk
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:14:12 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:41792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2xCU-0007Ya-Dr
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:14:12 -0500
Received: by mail-ej1-x62f.google.com with SMTP id g12so7851681ejf.8
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 06:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yts383Q/+RypgJ2WWaN857rGSO/qQt0rWIi4lgSBZXY=;
 b=DB9ULNZ+HUVPxQvyhe3q2qQaGg7hfa7Q2Tz2BGvoMeVpAj65WvalyOKyhphh9Uc++c
 agfLNWrATeDwJxAIgqmVu2XtJDSMSHXGuxz6fqEXR7TcMpVnyouPo7aMC2F835mgHIkm
 w3UoyIecwJouRHzZyNfEuwKvgVcuyN/m4X85YdFR9+3wc4cK+GSPDk5XTQQvb+TL84R6
 M+gaaW4zaJVd/3wjVZpwUOfmuhTMaGMDHd0B68kxMdwmqsolUJJUpOk5Q87VXMgJpj+F
 NagPbUITw+E2M4ryRHUmzdmQCTPRrLHrNSZDZh2hUxJh1fpMwjRshMX8oWUPd0mTQKbc
 mJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yts383Q/+RypgJ2WWaN857rGSO/qQt0rWIi4lgSBZXY=;
 b=VPyLUu6h6uFIxDkRPYvkbJVW3BcgjUiVHzG1ySAdFYWEj8SPTr8/0GkGYpS+7ItXqR
 lwIsC3Vp1Y0eGd7IDLk6oyd1ZDQMEp3ZvgBoWB2qHpUR58x/j05LEz1HrLVf3zgwzeVE
 ddiHJ+W8TGpqh4pITlu/+RXxvwCqlT9muXF7p8ailSJ0MAfDWJJQiKeVDTOpvM7Mm8ck
 PnR/E5D5HBRIi8PgMzaV8vJ8ABiiG6M2p7BHMYzTaJZns1JUd6j40W+Llaoc16ZeWVHH
 9APseVt3qObnY9puWqdegtcldnX/yKTMJZlY/q2hIYgefGJpKS0E2bjIBCKsZbsL21Bm
 bX5w==
X-Gm-Message-State: AOAM5309VMXBt3xXIRExI5yAkvVFnkC2tzryLAWeJ0vnSvtd+3GwffWH
 +31SuZ5OLQx9xOPS+di0+OL5m3Vvb8IbGQa1eE6aYw==
X-Google-Smtp-Source: ABdhPJxEhc0+RGdI1nhSbo7eQrEtTx3tIYuOE9j879neeIrpgkeuxeoqn5/sG+YdzsjOuDg9P3RxLDbmCWTRXSFZKHA=
X-Received: by 2002:a17:906:3603:: with SMTP id
 q3mr2989396ejb.382.1611324848796; 
 Fri, 22 Jan 2021 06:14:08 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-12-richard.henderson@linaro.org>
In-Reply-To: <20210115224645.1196742-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 14:13:57 +0000
Message-ID: <CAFEAcA_ALYdVn5YLBTN57D8a2ut3C5kt0bVb9faZEQe_-rxmPQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/21] exec: Add support for TARGET_TAGGED_ADDRESSES
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 15 Jan 2021 at 22:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The AArch64 Linux ABI has always enabled TBI, but has historically
> required that pointer tags be removed before a syscall.  This has
> changed in the lead-up to ARMv8.5-MTE, in a way that affects the
> ABI generically and not specifically to MTE.
>
> This patch allows the target to indicate that (1) there are tags
> and (2) whether or not they should be taken into account at the
> syscall level.
>
> Adjust g2h, guest_addr_valid, and guest_range_valid to ignore
> pointer tags, similar to how TIF_TAGGED_ADDR alters __range_ok
> in the arm64 kernel source.
>
> The prctl syscall is not not yet updated, so this change by itself
> has no visible effect.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/cpu_ldst.h | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
> index e62f4fba00..1df9b93e59 100644
> --- a/include/exec/cpu_ldst.h
> +++ b/include/exec/cpu_ldst.h
> @@ -69,17 +69,31 @@ typedef uint64_t abi_ptr;
>  #define TARGET_ABI_FMT_ptr "%"PRIx64
>  #endif
>
> +static inline abi_ptr untagged_addr(abi_ptr x)
> +{
> +#ifdef TARGET_TAGGED_ADDRESSES
> +    if (current_cpu) {
> +        return cpu_untagged_addr(current_cpu, x);
> +    }
> +#endif
> +    return x;
> +}

The current_cpu global is a nasty hack and I don't like seeing
new usages of it. In particular, it's very difficult to
analyse in what places this will get called when current_cpu is
NULL and whether it's always OK to not clean the tag in that
situation.

thanks
-- PMM

