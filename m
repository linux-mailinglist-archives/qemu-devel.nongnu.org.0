Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E35343B70A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 18:23:56 +0200 (CEST)
Received: from localhost ([::1]:33590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfPEx-0005eX-Ng
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 12:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfPCo-0003Kr-DF
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:21:42 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:33506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfPCl-0002qR-8Y
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:21:41 -0400
Received: by mail-lj1-x22d.google.com with SMTP id d13so16060286ljg.0
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 09:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=GILKpKBCJHK35C4UyClPHMpZTueebd2/NpjIwuNGmZs=;
 b=FJ/bnyDSMRKYE5rkcyOw4Ai5zPv5yzvCUx7KTwNkJVSxAzDIjGRzLEIc3JJ1Yuwa3J
 +fayChcWKrtoiXO9J+t3ZwwqjZtL4Ow5oCzYZA26O9941qO1e0IJa3ZY2FY/7ln82GuP
 D4suzoU3i4a5ugSzYC/UJjPGWEZPKXCvhXtgUGlbKZvxmugf2g5Be2htnbkIZSBzq9po
 EjlIZuaa+cNGMkPNpBFRNhweKHjo+XyA3hYD2j0vMc9GEmO1oBPTq6Fm3oZSGoHaPqXT
 AnKwWhqIzZ2DLIcfLf6RqBoUsRrH2iVexkiwTf2bD7FKrpsq/6nYyGssdYaHLNTCaspl
 H7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=GILKpKBCJHK35C4UyClPHMpZTueebd2/NpjIwuNGmZs=;
 b=Rhr78z+MuRJJaTqAwKIEH8Rx1q26KdnLtSxeUNbGj2FrqXOcA3JPsTahWaSYA6xSP3
 4negBEIJ8GfjeOPxwjE0KDec42g5a4xj2651QIWDj1H64Wjw2J0pNzYs3gmzJ/znAupJ
 nhCcAO+L6kC3BolIY5MMDPmTcHwP+S+v7pL5gS72o0UyhNSkB7v1gx8c1njkrGdQquoG
 ZG+fYeyNHvwDEQWudz+QBu+IXaqfFzpH/SS8M5dQbKD7w19kYkmom0tTYmXADsjJJxgu
 gRFTqikkLNWM4+CgLdiffpSZO5N+vMFiXJZUDVfbGW33YS8A0E1Iz6DgfCBP+bMF3kj/
 crbQ==
X-Gm-Message-State: AOAM5310dKPJWQEBzF6CQBvSidyaUY1cNLGEN/3GMxtukGnuDumR6g0o
 FIaSMUCsUx4AGdiCteXuwONm/Q==
X-Google-Smtp-Source: ABdhPJxLVLjXYTOVV76W59KVp2cIeYAPLqpdU1Cwca3IIm40tPIAKEQ8kZLnWqPeq02Lv7HbvC5kVw==
X-Received: by 2002:a2e:a451:: with SMTP id v17mr27699842ljn.407.1635265296274; 
 Tue, 26 Oct 2021 09:21:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u6sm1994236ljo.105.2021.10.26.09.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 09:21:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E4E711FF96;
 Tue, 26 Oct 2021 17:21:33 +0100 (BST)
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-41-richard.henderson@linaro.org>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 40/48] tcg/optimize: Expand fold_addsub2_i32 to
 64-bit ops
Date: Tue, 26 Oct 2021 17:21:08 +0100
In-reply-to: <20211021210539.825582-41-richard.henderson@linaro.org>
Message-ID: <87wnlzzrhu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=alex.bennee@linaro.org; helo=mail-lj1-x22d.google.com
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
Cc: luis.pires@eldorado.org.br, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Rename to fold_addsub2.
> Use Int128 to implement the wider operation.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 65 ++++++++++++++++++++++++++++++++++----------------
>  1 file changed, 44 insertions(+), 21 deletions(-)
>
> diff --git a/tcg/optimize.c b/tcg/optimize.c
> index efd5f58137..ba068e7d3e 100644
> --- a/tcg/optimize.c
> +++ b/tcg/optimize.c
> @@ -24,6 +24,7 @@
>   */
>=20=20
>  #include "qemu/osdep.h"
> +#include "qemu/int128.h"
>  #include "tcg/tcg-op.h"
>  #include "tcg-internal.h"
>=20=20
> @@ -838,37 +839,59 @@ static bool fold_add(OptContext *ctx, TCGOp *op)
>      return false;
>  }
>=20=20
> -static bool fold_addsub2_i32(OptContext *ctx, TCGOp *op, bool add)
> +static bool fold_addsub2(OptContext *ctx, TCGOp *op, bool add)

I see diff had an aneurysm...

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

