Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52ADB3143D4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:34:48 +0100 (CET)
Received: from localhost ([::1]:34014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9G3K-0005bK-9o
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:34:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9DUX-00010x-IR
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:50:41 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:37564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9DUV-0007XM-Gw
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:50:41 -0500
Received: by mail-ed1-x52c.google.com with SMTP id q2so20609814edi.4
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 12:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wmV7qsO0/a3i9nGa029gPdslbQhVVYrndPVq4erxku4=;
 b=X0Vfndg9sAFq50pYQMZe37e8Ds9pBo9jwkIOXaiYEcKxmeKjgyXAXCCXDIBpPxtKvQ
 9w8Sl4GSPzhbPWps8H1d4HcBJfLXdfvSRJoQYdqnNW5kc49BOk3WdC1bOwPzwwyqdtXd
 j6waJaggLTifHnrOzMyrtIeP9HXvcknIw73QmuRRTBlFNH+YYST7Rbhw5tMK/OnIwLVS
 YDVEsWXLzfP8rgHx/FK90Y5Tq4ewG6P4snIlLG/E6nr06LweaZUUzFiLejIBXkOvHh1y
 y1DvHqI/Tb7eJ3LWbz5BiMCXcBPZtQpw3UbtaMILLZ8KisL/igvsG9JdPdDuJQBbTZUb
 hUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wmV7qsO0/a3i9nGa029gPdslbQhVVYrndPVq4erxku4=;
 b=f3Figcm8pvNuIzBC+3L8iz3YhVmW7IV2h17tz/B+HbEERd+YlNa8aDcrxgSJ5O0Nqe
 eTE9Goohxj3uaVd3mUCL2GYqvSZW5QJSmUM3qLJ6kDPtQyGO9ncs2mupzsB0Guihsd64
 1UUKkwiqHc+ypr3FyoKIFLq8fOWXRaP/E21cUGM9i0EEaEHdfSZseY9rgQG9d2yti5Ut
 Y/ICHjmod14bkRoGRXfrnC9/5p9obI1wPtxZCpDwMOg0CJNdM+vlM8o0qwuGtipaxSGr
 hwJLNbDDwBGneVwTjSI0O/3BFuBwYUTvoLwjLKeJLmbcOcuZ469w6Ga/CmVmNR80+Mho
 jjgA==
X-Gm-Message-State: AOAM533S53rHSju1UT3knxwitJUTbvTFitxZ7+fMAIcBZWWc69aAZ5L7
 auzdZaCG5glDKLKrGTtmmFlsFTRVb4+DjuovAEy8lw==
X-Google-Smtp-Source: ABdhPJwJCgiE6oEnxZlS456+DurvGz+KmOa7sAysgNBcaMZHpoeB4EeY0zZXZsv66yLxSIp1asYcbsIPVKrxRqUfCYM=
X-Received: by 2002:a05:6402:3494:: with SMTP id
 v20mr19612479edc.146.1612817437822; 
 Mon, 08 Feb 2021 12:50:37 -0800 (PST)
MIME-Version: 1.0
References: <20210208024625.271018-1-richard.henderson@linaro.org>
 <20210208024625.271018-14-richard.henderson@linaro.org>
In-Reply-To: <20210208024625.271018-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 20:50:26 +0000
Message-ID: <CAFEAcA-Yh-QB2m3y=OTyH+F7E1YkPBXvyiZYdj1=8pOJpjG9mw@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] tcg/arm: Implement TCG_TARGET_HAS_shv_vec
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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

On Mon, 8 Feb 2021 at 03:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The three vector shift by vector operations are all implemented via
> expansion.  Therefore do not actually set TCG_TARGET_HAS_shv_vec,
> as none of shlv_vec, shrv_vec, sarv_vec may actually appear in the
> instruction stream, and therefore also do not appear in tcg_target_op_def.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/arm/tcg-target.opc.h |  3 ++
>  tcg/arm/tcg-target.c.inc | 61 +++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 63 insertions(+), 1 deletion(-)

> +    switch (opc) {
> +    case INDEX_op_shlv_vec:
> +        /*
> +         * Merely propagate shlv_vec to arm_ushl_vec.
> +         * In this way we don't set TCG_TARGET_HAS_shv_vec
> +         * because everything is done via expansion.
> +         */
> +        v2 = temp_tcgv_vec(arg_temp(a2));
> +        vec_gen_3(INDEX_op_arm_ushl_vec, type, vece, tcgv_vec_arg(v0),
> +                  tcgv_vec_arg(v1), tcgv_vec_arg(v2));
> +        break;

tcg/aarch64 seems to set TCG_TARGET_HAS_shv_vec and
only do the right-shifts via expand_op. Is there a difference
between the two that means Neon has to do it this way, or is it
just a "works either way" thing?

> +

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

