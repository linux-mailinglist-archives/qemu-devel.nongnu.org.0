Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1389244B192
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 17:54:23 +0100 (CET)
Received: from localhost ([::1]:53592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkUO6-0003kh-03
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 11:54:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mkUMa-0001zj-CQ
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 11:52:48 -0500
Received: from [2a00:1450:4864:20::42f] (port=38815
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mkUMX-0002ph-5L
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 11:52:47 -0500
Received: by mail-wr1-x42f.google.com with SMTP id u18so34099548wrg.5
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 08:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=B/6osNpmnZkM+TM6Ui8pOs6Pb/txtbraJYLs8gcx3WA=;
 b=fdmThTSnTnEhuv7OSE2YmJNoMllMLP3r5UMc2PrwVWyOQVn3/+jAxdgFHZYV7DTOxV
 836PRdaCE9aT9ePQ3zd87ZxYnc29oNCBZ8bw6IALgcQPLLJxwyjR/udAcHG4sZz6U5ll
 OJhXsW4rJgGTxbzu6WXBMHFAEl+Qu6CZydC0kCTA6DIWEABijHwysMvKWGhoH6LH7IAu
 C5VZMUEaLigjLP8sbv9s9AIhSoeDc8Kut0McRkIyogYaOxlM45nSSk3Af/dgrvS4YjuE
 zIJI6N1muEut+L53HcI0fB33t6lYkdmStrU8LQIpBuxBu0/Qy/+n6AjjRo3b5JEm7wN1
 epYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=B/6osNpmnZkM+TM6Ui8pOs6Pb/txtbraJYLs8gcx3WA=;
 b=PhYRSpwxSEjs4CZyEfPl+jRkwcuaGG8wk6E4/rzy34K+qS1ugXYazYHCndhn05Wqjg
 RIUhExx5e4dGf6n5iHcdg47mCf+uj7V7oUTn+7s52mkBSdk7gWEDCFINmdsbWRX7KNx8
 V9n59gXlmF6J5ii1bzlIJrupVQ7XmkobIOrMfNwBZWwmg2rKmod0ielHFVEIHy60B2en
 Oe/KHY995wlK1n4VsfRL7WA+dj6PYhM52kw2gw9nTOlVZph2RLy+64PQnSgtQuWmwoSr
 QgxFLQ+A6Dt4EQ4zRxo8pk7WKeMjiuRZICRfo86L1rw1hyc6a8Vnz20+gihxQBqLYJRT
 r4lg==
X-Gm-Message-State: AOAM531P+SKzyTqMXAuT1pc9sghARk8B3V47+d4aX2wNj8Neia/tvyfl
 6l2k6dHLm3f4YRF8lvfglpI+l5OG5Cz8g14V+GUA5w==
X-Google-Smtp-Source: ABdhPJx1iSvagvCrFL4/lnjUjEK8KJpGDlJM0fVeV5J2BrVCoXHBjr+XGm9ry/XM3pDLVfv7iUJv7pmh4jZbykJgODc=
X-Received: by 2002:a5d:6151:: with SMTP id y17mr11216278wrt.275.1636476762793; 
 Tue, 09 Nov 2021 08:52:42 -0800 (PST)
MIME-Version: 1.0
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
 <20211029043329.1518029-29-richard.henderson@linaro.org>
In-Reply-To: <20211029043329.1518029-29-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Nov 2021 16:52:31 +0000
Message-ID: <CAFEAcA9U3HqtyJBd-D22zzwVdr0tY3MP8xqemndyJd2JdN8cyg@mail.gmail.com>
Subject: Re: [PULL v2 28/60] tcg/optimize: Split out fold_extract2
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 Oct 2021 at 05:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 39 ++++++++++++++++++++++-----------------
>  1 file changed, 22 insertions(+), 17 deletions(-)
>
> diff --git a/tcg/optimize.c b/tcg/optimize.c
> index 110b3d1cc2..faedbdbfb8 100644
> --- a/tcg/optimize.c
> +++ b/tcg/optimize.c
> @@ -888,6 +888,25 @@ static bool fold_eqv(OptContext *ctx, TCGOp *op)
>      return fold_const2(ctx, op);
>  }

Hi; Coverity warns about a shift in here (CID 1465220):

>
> +static bool fold_extract2(OptContext *ctx, TCGOp *op)
> +{
> +    if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
> +        uint64_t v1 =3D arg_info(op->args[1])->val;
> +        uint64_t v2 =3D arg_info(op->args[2])->val;
> +        int shr =3D op->args[3];
> +
> +        if (op->opc =3D=3D INDEX_op_extract2_i64) {
> +            v1 >>=3D shr;
> +            v2 <<=3D 64 - shr;
> +        } else {
> +            v1 =3D (uint32_t)v1 >> shr;
> +            v2 =3D (int32_t)v2 << (32 - shr);

Here we do the shift at 32-bits and then assign it into a 64-bit
variable, which triggers Coverity's usual OVERFLOW_BEFORE_WIDEN
heuristic. Is the 32-bitness intentional?

> +        }
> +        return tcg_opt_gen_movi(ctx, op, op->args[0], v1 | v2);
> +    }
> +    return false;
> +}

-- PMM

