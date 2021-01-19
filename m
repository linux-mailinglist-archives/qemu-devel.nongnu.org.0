Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A90C02FBBE7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 17:04:56 +0100 (CET)
Received: from localhost ([::1]:39260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1tV1-0007OL-Jc
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 11:04:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1svB-0004Pk-La
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:27:54 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:36970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sv9-0003gD-OO
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:27:53 -0500
Received: by mail-ed1-x530.google.com with SMTP id g1so21333871edu.4
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9DYCgNI8ytcHRHDVp9sNbhZPYpHwNLHWaNT0FwtwF3E=;
 b=BHg3r7kmfJ8Fx1b8t+oEr0VD1jSR7iSSxwJqksmmOsvyH8HfUGg5aJjzvQF2Chwqlo
 xW5pVYvm5RNhmfL+Zsaky8OttllgPTpINgFPm8e2CKirCZpTQf26vT2Bz7BtBI+bl/Vk
 6o67VLI0XrJ5YtjM50U7DFOx/TQWJcfnDAk4As6rL2XCSN/G54BZxEKmtbIJdNu/FHhd
 WxX+fI6l4KvQBE/feQmSzFQ56YZ3VtaKgnxO7y84ksuNXqJXUrL24+3TssOsdFZIAGk0
 IaIgl6v2Kj7tITs0nnVQJ7mHAQJedeTE8kf1nXO6VyJlZF4apbAQ1QykkJ8oygeuV0sa
 5u2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9DYCgNI8ytcHRHDVp9sNbhZPYpHwNLHWaNT0FwtwF3E=;
 b=PONxkyQf178tS+T06z3YZoNnkPrA3/953QRGPF0rk5cZIZPHaw+ecgyK9Nfpo4Yw3M
 y+rr5drQomvQBWJTAsEnNhvXZBCUVASO8UNWsz2+A2ZnsO/PS4YzCEkY1dWy5LZKw64K
 j/+Ys3GvsLIuBIJidXDhHrgmzoO9rc0YfiTnxLaAQnfUEag7Mvtw+vJjlTS+Uphmm2p3
 j4yUE+6vDjhuWuOdfQiNU6o5UsN4ePqQbbqPjk6Arxy27iq9rq4Vdl+1/tfg+HFIXiEH
 aLTEyPzlw+YliRW/FbscRbl3UmDp1bpg5mtzBJwt8FnqAHiuMsqxESkawNyOgvoHToPF
 VoZQ==
X-Gm-Message-State: AOAM530Wyx3rD5WJvlwMmc9R1s3UTbgHEwFgs/DbecH/NSgtV0ll1UeZ
 t+3EAI5oTXz4ulSm1UyYMQUIuWyJo7VwiudEOGcsxg==
X-Google-Smtp-Source: ABdhPJz4iPqiytHOFsfsdJRboZOdZry0T4ykCIS2b9uUZEa1709yn59uog0uRlN1E56nsHoS8Uh1Lbvav8yrDKfuyGE=
X-Received: by 2002:a05:6402:1701:: with SMTP id
 y1mr3769277edu.251.1611070068341; 
 Tue, 19 Jan 2021 07:27:48 -0800 (PST)
MIME-Version: 1.0
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-14-richard.henderson@linaro.org>
In-Reply-To: <20210115210456.1053477-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 15:27:37 +0000
Message-ID: <CAFEAcA8MsWyA7Aam3VzfV=r_scaD0J3zEBR0bNE-Re7OdL+ezg@mail.gmail.com>
Subject: Re: [PATCH v2 13/22] tcg/i386: Split out constraint sets to
 tcg-target-con-set.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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

On Fri, 15 Jan 2021 at 21:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This exports the constraint sets from tcg_target_op_def to
> a place we will be able to manipulate more in future.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/i386/tcg-target-con-set.h |  54 ++++++++++
>  tcg/i386/tcg-target.h         |   1 +
>  tcg/tcg.c                     | 122 +++++++++++++++++++++
>  tcg/i386/tcg-target.c.inc     | 194 ++++++++++++----------------------
>  4 files changed, 244 insertions(+), 127 deletions(-)
>  create mode 100644 tcg/i386/tcg-target-con-set.h

> +#define C_O2_I1(O1, O2, I1)             C_PFX3(c_o2_i1_, O1, O2, I1),
> +#define C_O2_I2(O1, O2, I1, I2)         C_PFX4(c_o2_i2_, O1, O2, I1, I2),
> +#define C_O2_I3(O1, O2, I1, I2, I3)     C_PFX5(c_o2_i3_, O1, O2, I1, I2, I3),
> +#define C_O2_I4(O1, O2, I1, I2, I3, I4) \
> +    C_PFX6(c_o2_i4_, O1, O2, I1, I2, I3, I4),

Personally this is the kind of code where I would follow
CODING_STYLE.rst's suggestion of "If wrapping the line at 80
columns is obviously less readable and more awkward, prefer not
to wrap it; better to have an 85 character line than one which
is awkwardly wrapped.". The parallelism between the lines
is much easier to see without the linebreak.

> @@ -2418,9 +2536,13 @@ static void process_op_defs(TCGContext *s)
>              continue;
>          }
>
> +#ifdef TCG_TARGET_CON_SET_H
> +        tdefs = &constraint_sets[tcg_target_op_def(op)];

I know the macro magic should make it impossible, but maybe
we should have an assert that we definitely have a valid
array index here ?


>      case INDEX_op_andc_i32:
>      case INDEX_op_andc_i64:
> -        {
> -            static const TCGTargetOpDef andc
> -                = { .args_ct_str = { "r", "r", "rI" } };
> -            return &andc;
> -        }
> -        break;
> +        return C_O1_I2(r, 0, rI);

Old constraint was r r rI; new one is r 0 rI  ?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

