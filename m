Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD5D2FBC45
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 17:22:19 +0100 (CET)
Received: from localhost ([::1]:42240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1tlq-0005A7-LN
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 11:22:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1tZl-0003Yl-U0
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:09:49 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:40011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1tZk-0002s7-53
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:09:49 -0500
Received: by mail-ed1-x52b.google.com with SMTP id h16so22162499edt.7
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 08:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dyJT/GHlsl7IWvdpSMTxx/yM2ZCFgY2SbRHr/oKxuC0=;
 b=Cj0BWDtwandipoXg35Q3anw/vq0ZqQqANIqc/k6fOVh/Qe724tZAi4EBdxhrWKWVOu
 3U1j+q7cMLyvnfrVTVmBD5TBmGPz/Oj8prdH5oyUs9rzxFIBFTBk7MuIgHYf2RBl3m3Y
 XRO7qZ9wY2jwQ/xHnBAN9GEIZKH9i5bt99l7BwaCq+AErJM8kIdOUH/E/OOx6nUB88kg
 z/tzqNgv/IwMXyzGzZORYglSIuKFI3Z39IlKrbp1rYprn3yFGlVcxuvXtxry98C3tMC4
 2FGu1xHK7F9ZkrXzRThjHJs+JCQ56kP+pfucCAcPdqAoOmeuzUeN5c8FMXvVEelPRI6Y
 9DNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dyJT/GHlsl7IWvdpSMTxx/yM2ZCFgY2SbRHr/oKxuC0=;
 b=YtuY185fQ4Udtx8Q0GA2969mebqzrVDt1PNHJFvBzlh4bu0oGdS+eo2zvqOUvrjdH/
 pbrRKi495ABOi9MM/ziwspniY6Ckq5ZegrDhEA204UibIpz/swEJdIf2ldFBVhgEgWFu
 /dV2MmIkee14oKWO1dtl6/g/uUjZJaoCq08QjRKdVTcKD5GFhkxRsGTHJkM/j4Ds1PWm
 2h+2Cn8LkmH1lEg4j1QmVCDY2VCgiOwekMuc2R7GQLTGM5W1nf64R1vkVOte7l63Yf06
 P0iwAhwqpffPcK1CF5+mnjDQ0T+NBlsssMGGvcpRGrFP3BeLucb0E43NksokRxX56knj
 Sqmg==
X-Gm-Message-State: AOAM530dFu9Mk/RtMEc9X7bRzhu94WhCDMKU7azNLvaS6bFGKMuLKVFu
 z7vM6LVLZPemL7F+Umd7w+iAs2ZJvMqKgaaeya7YQw==
X-Google-Smtp-Source: ABdhPJyafJuX5lJtRlOt/uWiS59zFB9jQR1+ZILKDiY1E05mZgAHzxzT1aubWFw/zVQDtIcWKLn8y7lM3sF8Yvk+Fwk=
X-Received: by 2002:a50:9ee3:: with SMTP id a90mr4002468edf.44.1611072586153; 
 Tue, 19 Jan 2021 08:09:46 -0800 (PST)
MIME-Version: 1.0
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-22-richard.henderson@linaro.org>
In-Reply-To: <20210115210456.1053477-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 16:09:35 +0000
Message-ID: <CAFEAcA9hWjUERcefn=R-Gj29+qKJnTz7SkXPKsYcstWpGzAduA@mail.gmail.com>
Subject: Re: [PATCH v2 21/22] tcg/tci: Split out constraint sets to
 tcg-target-con-set.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 21:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This requires finishing the conversion to tcg_target_op_def.
> Remove quite a lot of ifdefs, since we can reference opcodes
> even if they are not implemented.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

This one's a lot more painful to review than the native targets :-(

> ---

> -/* TODO: documentation. */
> -static const TCGTargetOpDef tcg_target_op_defs[] = {
> -    { INDEX_op_exit_tb, { NULL } },
> -    { INDEX_op_goto_tb, { NULL } },
> -    { INDEX_op_br, { NULL } },

I don't see any cases in the new code for these ops,
or for INDEX_op_mb which has {}. Is the function in fact
never called for those ops ?

> +    case INDEX_op_div_i32:
> +    case INDEX_op_div_i64:
> +    case INDEX_op_divu_i32:
> +    case INDEX_op_divu_i64:
> +    case INDEX_op_rem_i32:
> +    case INDEX_op_rem_i64:
> +    case INDEX_op_remu_i32:
> +    case INDEX_op_remu_i64:
> +        return C_O1_I2(r, r, r);
>
> -    { INDEX_op_add_i32, { R, RI, RI } },
> -    { INDEX_op_sub_i32, { R, RI, RI } },
> -    { INDEX_op_mul_i32, { R, RI, RI } },
> -#if TCG_TARGET_HAS_div_i32
> -    { INDEX_op_div_i32, { R, R, R } },
> -    { INDEX_op_divu_i32, { R, R, R } },
> -    { INDEX_op_rem_i32, { R, R, R } },
> -    { INDEX_op_remu_i32, { R, R, R } },
> -#elif TCG_TARGET_HAS_div2_i32
> -    { INDEX_op_div2_i32, { R, R, "0", "1", R } },
> -    { INDEX_op_divu2_i32, { R, R, "0", "1", R } },
> -#endif

Why don't we need all the ifdeffery the old code has ? Is
it because we know the ifdefs are always true (or always false) ?
If so, can we do the "drop ifdefs" in a separate patch beforehand?
I think that might help make the patch a bit easier to review.

thanks
-- PMM

