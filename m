Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC37557A06
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 14:09:41 +0200 (CEST)
Received: from localhost ([::1]:59850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4LeW-0000Br-H4
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 08:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4La3-00071N-M7
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 08:05:03 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:36814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4La2-0006ir-09
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 08:05:03 -0400
Received: by mail-yb1-xb34.google.com with SMTP id u9so25298544ybq.3
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 05:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DkXZyf4XVgxvMEzuQ9pmvMILwh5omCXHYCnRpLuh43U=;
 b=Yf4KrP9l7oU0cAsCbaRi82g6eDqGVx5j1PfKfg5WAEav8h8zuudHPdffUdTvUHun9l
 yMgQ3l8Z/xJcgaQPuyS4kUnCYxkV+a5sa9vajGy0C+W7s1EySVWTLszxnQx5i6boyL3p
 Rt9lkkLhJwpukmt9zaRGtv29dORJYoNF5jalhTHB26kO6asl5vN2cqgA40W4aotYLlxQ
 2M4rfFEVvDZ2Yovp5yYnX8lwphxTMyALlnSOZhZVYNLye+TSkkM4Qro+5CIFV9BujezC
 JctyvNWXfg2DB/XV8Rs/nxkoaK/nzWVB8lXGkdvqmshPEV5Pkt6dCosi0k2qPnL6bRIW
 aY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DkXZyf4XVgxvMEzuQ9pmvMILwh5omCXHYCnRpLuh43U=;
 b=aoDfNvpSObpf2qdIJ0aNC99j7CHJDkPNpYucmxG76MP9zfBq9R+wA1igV9FDrjiHbV
 O5xD63C48RNOEuEfAfXu1GPg4MfqiRbLIG3ibfbB304VwiFc+QNXbB/x5dsLJWRFhzdO
 kjA4OPayoHY1svTJXB+u94bgCryDFDsGusXnvaeaCTj78XqIRwVeOESy4D+UTINXLmMh
 lC6/G9+/ytowSiM7LrZqpiA+8nLWfqDbmrWj3YK9htDgeTltA3oEm8stqu5eiUhBRdU0
 QPgIxXVqQUhJaHC/AtoA4n0AxGhc2qx4HPslr7i4bY4kXl3ElDMB9m5jPNuN+ceElJKi
 tS8A==
X-Gm-Message-State: AJIora/bUbvjk4wauo+qaa4XAkg29NlFfcyA320Hn0RXiC+Dib/iQyV4
 VcvB9bL1+/zu1/inGQ9rB2NNaXT8MVRdDF5LUjDUUw==
X-Google-Smtp-Source: AGRyM1utJYi8AKzLMmHYAQ8uNZUb/0CdRbQIX1dXKsnFWogd7DEWpkJ/df4P4iSUkWGoYKwQ003JwwMGtUf6boJ9ECQ=
X-Received: by 2002:a25:d9c3:0:b0:668:cd48:e56 with SMTP id
 q186-20020a25d9c3000000b00668cd480e56mr8968323ybg.288.1655985900592; Thu, 23
 Jun 2022 05:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-30-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-30-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2022 13:04:49 +0100
Message-ID: <CAFEAcA__Rfb27dDmbOzRvDep7dxe9kj6LPFeT7B0PPws+CxiGw@mail.gmail.com>
Subject: Re: [PATCH v3 29/51] target/arm: Implement SME ADDHA, ADDVA
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 20 Jun 2022 at 19:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sme.h    |  5 +++
>  target/arm/sme.decode      | 11 +++++
>  target/arm/sme_helper.c    | 90 ++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sme.c | 30 +++++++++++++
>  4 files changed, 136 insertions(+)


>  #undef DO_ST
> +
> +void HELPER(sme_addha_s)(void *vzda, void *vzn, void *vpn,
> +                         void *vpm, uint32_t desc)
> +{
> +    intptr_t row, col, oprsz = simd_oprsz(desc) / 4;
> +    uint64_t *pn = vpn, *pm = vpm;
> +    uint32_t * restrict zda = vzda, * restrict zn = vzn;

We use 'restrict' pointers nowhere else in the codebase, and
I would prefer not to introduce them purely for that reason...

-- PMM

