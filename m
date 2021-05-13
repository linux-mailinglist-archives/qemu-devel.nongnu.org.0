Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEA437FC64
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:19:14 +0200 (CEST)
Received: from localhost ([::1]:48994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhEzR-0004fZ-Pv
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:19:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhElB-0002Pe-TI
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:04:29 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:40918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhElA-0006gk-57
 for qemu-devel@nongnu.org; Thu, 13 May 2021 13:04:29 -0400
Received: by mail-ed1-x535.google.com with SMTP id c22so31751889edn.7
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 10:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4oG5dssItg+yuqJEfO5NPJLYL8/gogEdOuPEAFZQFco=;
 b=rC3UC95MLHSKEtcsjLR9cIbQFBCeeNy8fZWE9xlaar1WBytqyYT5RQ87eif8Yg49Ac
 +lS9pG4ePiRvQIzIWtbAXN6s0nJ6A4eqZbsIvr7+OlaWOv1h0+kZZN/T3JC99sajPqFJ
 2H6OuAmGG6Jsg0few19VwdE2Bb/MqN6Bj8mZVIuc2xb0cEyC34HRQcdz+gbcDHsF3Dol
 FLbb0f5cG+U1+rIYem5goz+8BEhkZ2HwM0rOwCOybTBkSdR1PhxWb6bkmjYAWNnPhvWE
 ViVhL0rTMESy2iK8a1Eeidqf+pId2c4RGJPM870InpaYR7FODxYlc9qyafgnDokW7tEA
 m0oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4oG5dssItg+yuqJEfO5NPJLYL8/gogEdOuPEAFZQFco=;
 b=YJMHHIHtCJtTH2DaFXYJZP1y7IVp+W2S4Y5LvJ0e9Tguo66IiTJgohZfwyZGRiv+BS
 94QDZfyOBH23LkIa6b8dKmvBVcvJ2r+VQUlDj6HPBWD0FH2MNO/bCz5pLipt/j5KZZUg
 EvQGIEml2PThSg1DGH1ZNm3PBmzDLXQ91Fcote3YXfz5ZjQcE3C1Rjg8QL1fiE9rLgTm
 FBAKvQz/mjxFgotF9epj8ktiDpe+2H9VQbZHcj+QcF57YX2kO9ywmXKqoD9ep0LvwEQ0
 uZdzJpiEuDm0QLMWlgPcGy8OAsDk35qUY1A+vzcAHBG0FOh/RVUAlDTw8D/0bZWyj2fi
 A2Mw==
X-Gm-Message-State: AOAM530+ygRLAzICEgOSnYWfvBIxRmqIMKtNkl99WLITk0dBgfZ5aW5m
 G53fD6NF4+WJ7fX1zPcGZny4RC1w7zU8oM2eAxq3Zg==
X-Google-Smtp-Source: ABdhPJy0Gql4Cn2bJ94/mb+G5sSZ9DeZyzP7fQMA9hfBa9a5N8PGyAQvNkcuLoExwegxjaOV9B/5sTuuzIW+bGECs34=
X-Received: by 2002:a50:ab06:: with SMTP id s6mr42647067edc.100.1620925466210; 
 Thu, 13 May 2021 10:04:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-74-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-74-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 18:04:14 +0100
Message-ID: <CAFEAcA9Oc+SiCcECG8pLaHSib87B7+ScSw-yk90pL0193jBCDQ@mail.gmail.com>
Subject: Re: [PATCH v6 73/82] target/arm: Implement SVE2 fp multiply-add long
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 22:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Stephen Long <steplong@quicinc.com>
>
> Implements both vectored and indexed FMLALB, FMLALT, FMLSLB, FMLSLT
>
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> Message-Id: <20200504171240.11220-1-steplong@quicinc.com>
> [rth: Rearrange to use float16_to_float32_by_bits.]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h        |  5 +++
>  target/arm/sve.decode      | 14 +++++++
>  target/arm/translate-sve.c | 75 ++++++++++++++++++++++++++++++++++++++
>  target/arm/vec_helper.c    | 51 ++++++++++++++++++++++++++
>  4 files changed, 145 insertions(+)
>

> diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
> index 9b2a4d5b7e..ea08b15c55 100644
> --- a/target/arm/vec_helper.c
> +++ b/target/arm/vec_helper.c
> @@ -29,10 +29,14 @@
>     so addressing units smaller than that needs a host-endian fixup.  */
>  #ifdef HOST_WORDS_BIGENDIAN
>  #define H1(x)  ((x) ^ 7)
> +#define H1_2(x) ((x) ^ 6)
> +#define H1_4(x) ((x) ^ 4)
>  #define H2(x)  ((x) ^ 3)
>  #define H4(x)  ((x) ^ 1)
>  #else
>  #define H1(x)  (x)
> +#define H1_2(x) (x)
> +#define H1_4(x) (x)
>  #define H2(x)  (x)
>  #define H4(x)  (x)
>  #endif

We now have a full set of these macros in vec_helper.c and sve_helper.c,
and I'm going to need them in the MVE mve_helper.c too. This seems like
a good point to pull them out into a suitable header file and add a
documentation comment that makes it clear what they're for (cf comment
on previous patch).

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

