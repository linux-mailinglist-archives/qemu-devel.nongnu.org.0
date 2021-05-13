Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A5F37FC86
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:29:20 +0200 (CEST)
Received: from localhost ([::1]:50890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhF9D-00086Z-JM
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhEuE-0007He-AO
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:13:50 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:45643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhEu8-0003U2-6h
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:13:50 -0400
Received: by mail-ej1-x62f.google.com with SMTP id c22so12781002ejd.12
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 10:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NZLuyzyNVeLIrVACX8HkhS4CZIGlSdTCecVtoaIhB5s=;
 b=YqLeDUCJXwshuxbulIyDdN7ASpc63oNRWd/YFcEGJ56jwP21GhHKrpkKhsE6w0uwPo
 N4s9/+aTiKQ/t93zxHTnWHDvp5273MS0cV4gVYqLbFTM13LAWM/d871F1JnboZ2A0/Kw
 /RB2jNdG+xJBrra/UzcNjyr42YYYogEFQ/m/HKCf+k66MkCStZPBWEwv1CyPhm0XuHZq
 xQ63zDqP+azeCaWSzvC6oKzh+sPNh4QpdC8+8X9Gxb6uzpUCDEevRCU5At4FDt2cP9un
 kZTtS3ZVgsVxQZHKghRSzk540gBNsJgZXWVCrHdtTzGLXhim+Uh39Bn1cE0gCgG+FF7v
 SmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NZLuyzyNVeLIrVACX8HkhS4CZIGlSdTCecVtoaIhB5s=;
 b=chVu2AJvKSg67JC50TT7sHzPu8i02YDbVQedfNlggMyKZ2QKO+hSbU8OMIjo+/sU9x
 A6E0qhCd9J9QnicYntt6b+PjzA0fOtk6/wENyAptE08lfxoX0XiJ5ckZwgE4JRvuwtf9
 fHy56Gqn5R1r6uSft+UTXTdb7n9Uc3pQfihrqARyqobca5I1KG1z0Iqf16z0KPz6Ygz+
 SzxfPOeA57gWLJyGSFK2LPBZaWDxA3kJa83DTp9M4Gtu4wS+qppEylhu9P0BA+fEz8uw
 oVTEWG5U2IpyeKB0CkOXyvMq7yTOFgY39FUs5d+ZfW08I3dPJ8El3khK9ElH+/FLhZv8
 Tdpg==
X-Gm-Message-State: AOAM532CpeIb6TzEBE07OJ3Pni8GSioVaAp7OEeN03yxKvTmu79/HQU1
 6W+CBz4+V9kFgPFygVSoLEBvsgkxTbH0fXksSkiODA==
X-Google-Smtp-Source: ABdhPJwFaAf4Dz9lcZV4A5vyu4TDBUttGw2ADkACEIjDLcM4bZ2H+qDIusIn5B0w4qGkh7RfhG1mW3v0pqZhiNdUiVc=
X-Received: by 2002:a17:906:bcd6:: with SMTP id
 lw22mr24677ejb.250.1620926021714; 
 Thu, 13 May 2021 10:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-76-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-76-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 18:13:30 +0100
Message-ID: <CAFEAcA8ro4Ya9rqgHG4DzxVQDo6p-j39UiSZ_ZE1HvzLpu2q5A@mail.gmail.com>
Subject: Re: [PATCH v6 75/82] target/arm: Split out do_neon_ddda_fpst
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

On Fri, 30 Apr 2021 at 22:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Split out a helper that can handle the 4-register
> format for helpers shared with SVE.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-neon.c | 98 ++++++++++++++++---------------------
>  1 file changed, 43 insertions(+), 55 deletions(-)
>
> diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
> index 45fa5166f3..41a7b2208e 100644
> --- a/target/arm/translate-neon.c
> +++ b/target/arm/translate-neon.c
> @@ -151,24 +151,21 @@ static void neon_store_element64(int reg, int ele, MemOp size, TCGv_i64 var)
>      }
>  }
>
> -static bool trans_VCMLA(DisasContext *s, arg_VCMLA *a)
> +static bool do_neon_ddda_fpst(DisasContext *s, int q, int vd, int vn, int vm,
> +                              int data, ARMFPStatusFlavour fp_flavor,

Can we keep the UK "flavour" spelling for the argument to match the
type name, please? :-)

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

