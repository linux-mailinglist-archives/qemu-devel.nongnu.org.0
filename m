Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E19D13CC6D6
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 01:35:36 +0200 (CEST)
Received: from localhost ([::1]:56542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4tqK-0005Ko-0V
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 19:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tp9-0003x2-OH
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:34:23 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:33560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tp8-0000sj-1d
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:34:23 -0400
Received: by mail-ej1-x633.google.com with SMTP id bu12so21370178ejb.0
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 16:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MwEZcvo1YHErfCktPiK48permkXui5JsPfVASyyAXIA=;
 b=nYHDBKjpaek9Axb7NU5ij0Da5S+Y+XSsor6qf62nvGvUTg2en3j/FICGzmoZJwqWR4
 qGaKc+6yJWAoc/hV40KnlWHLRfeyTnu8K0QiXVE6xcRObhzpvziVeKnJzjk3mqRFrmze
 n1dAEZs0gIr/n0EasjwZscJC0PdMQvgq+AQ+dBwkLgr4m2QaEL3zdG6uHt4tLTsTNgeV
 CKLw+Nv6gqWNDZ39dn60BbWAQvA4sZBykqSsRjHOVw3sm/3zlVJDd4db3Wwac6nfahPw
 benQBpAaEzdapsixs4pQdINWKyhmbUWuF4h0Urjzars9pmsEkRTL/ZUBza4NHvRMBD6m
 NEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MwEZcvo1YHErfCktPiK48permkXui5JsPfVASyyAXIA=;
 b=oA3noS2/60w65dWLGEv71W7WhyE2SKzDw9CEoia64MlkdqR6sUYQQUkVfYpyKlQcNi
 7nM5iTnh6Ph5C7XVkDKtk/1INhQbD0+C5RK7+hMigsSd7m8pxhoI2lS1f+VMlAjYY2qd
 ivA/3ENOUPiAA4ouSrQy1p7o3BJN8AOK8l+p4J18PP6QHYOyjCUe3uDEGZgAIo7MH8AI
 cWpZ9hJu0iqLdD/u35JF60rZdJ+p7vSgBmZRts/K9CJHZHLqwkKOdldU/rgjb4ACjLsp
 VN2y5e/jAsl8zRHD1DORgTBweOwshMpiIyKHgGmvr19PDUafViV1qYUzallGFq80RtfW
 SzZA==
X-Gm-Message-State: AOAM530kwLeDh2eYwwdPoHw7M5QuCREZB9EuKx+DmU0gUbnXuGvAHQAs
 b/m+i1G9kY4Nq7NMH4uIU+Lm/+16/8hI0JnWpKWgSQ==
X-Google-Smtp-Source: ABdhPJwIxlWRAjXE3gzTi64ek4M7eYk4Gvp8Rr/1mBUY9biF1pR/bWQBq7+dqsuxi1TxwEdzAJ9rVs9s6mlc2zJFrYw=
X-Received: by 2002:a17:906:f9c5:: with SMTP id
 lj5mr19840401ejb.482.1626564860757; 
 Sat, 17 Jul 2021 16:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210717221851.2124573-1-richard.henderson@linaro.org>
 <20210717221851.2124573-9-richard.henderson@linaro.org>
In-Reply-To: <20210717221851.2124573-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 18 Jul 2021 00:33:40 +0100
Message-ID: <CAFEAcA-XAWWBGYLDfiZA5nGNrUZO7ZXkrw0MG2BLAXsyUFgvXQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/13] target/avr: Advance pc in avr_tr_breakpoint_check
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 17 Jul 2021 at 23:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Since 0b00b0c1e05b, tb->size must not be zero.
> Advance pc so that the breakpoint covers the insn at the bp.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/avr/translate.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/avr/translate.c b/target/avr/translate.c
> index 8237a03c23..d768063d65 100644
> --- a/target/avr/translate.c
> +++ b/target/avr/translate.c
> @@ -2950,6 +2950,7 @@ static bool avr_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
>      DisasContext *ctx = container_of(dcbase, DisasContext, base);
>
>      gen_breakpoint(ctx);
> +    ctx->base.pc_next += 2; /* advance by minimum insn len so tb->size != 0 */
>      return true;
>  }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

