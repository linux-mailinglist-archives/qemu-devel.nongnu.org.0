Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E853CD4B2
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 14:25:20 +0200 (CEST)
Received: from localhost ([::1]:36718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5SKl-0002fd-Tb
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 08:25:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5SIw-0001tq-Cd
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:23:27 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:38686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5SIt-0000k4-Kv
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:23:26 -0400
Received: by mail-ej1-x629.google.com with SMTP id gb6so28355608ejc.5
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 05:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yi3orZAx69VW8jjIDYA05iMKjd/cE5swwuxYNnPUgPQ=;
 b=NAuh6ISCX8NUdiEdu2xBAluftCEgMy4QD0nlXseHbqI8HyyqDnFaFxCuNJIgoDEsnr
 FcsQQ1HEqsIq22thcAo786hDWKaItm6jAzEOfuJb0VUiYN1mgytC8r0emw2Ruj574oDC
 7ANRoj85YlyPeYgVkf33xt5LmCVOkACtmnYyNCnQvXNmD0/BnZlgrv5w4tY799tPQclB
 JZKLtWJPdomyCFe0Yja9LZDNXHHxhrgTb01VRYi5ViCZ0RvGffnPSb0QsCB3gWl6Mbca
 QzA23fUr43J7Ni5qWnVV4kTeklCwlCa99BmevKn5/iodAELp4+ldo+pxEEMi12Iv2zCx
 Lofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yi3orZAx69VW8jjIDYA05iMKjd/cE5swwuxYNnPUgPQ=;
 b=Nv/Ggv+CLShv5vdSYkZGUZt3SiImHh2N4vnOe6m72MWYHocV+DtqreVOxVimSG/Z5l
 PAdVJ6yTTTBIQDsxadAQASqw3Ta4abNOcvCc6dMnftsn1z9sUcZUtIaFpco6davJ02xM
 TN/0oR13deYTkb59pAZdJbeUd9vTSCQFxrJHZa4QrlulOWIH3Rkoyvgwp9jpZAA92gby
 IShlvcbT/+glwAQzUvWToeXFugqD73Ck6KZ0oTutA6XZs91biwiQYAr8TGnw7RlScZSq
 QJI9Kcz0R+KLG8a/8RunipLmY661W2Fbg79dzXSeL74tMPYM10vZLa1VCS+6cd+Iz9rx
 //5A==
X-Gm-Message-State: AOAM530oDWlziPP9Yw/fFKB034o7n0p+S3fcxKoWUKPTIbTtDoyqapQe
 Jp6lOfxBLPQFKksT8Ytyt1M040d8+RdMvVvGvODwJg==
X-Google-Smtp-Source: ABdhPJwBo34fTREtdeNpBxu2Pejr5Ppx/VuQ/+sLqBA1zrZCoa0uXjt2SJNbagW+Y8zSrqTg90htIKCvvOPotP8q/zs=
X-Received: by 2002:a17:906:382:: with SMTP id
 b2mr20347932eja.85.1626697401826; 
 Mon, 19 Jul 2021 05:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210717192419.2066778-1-richard.henderson@linaro.org>
 <20210717192419.2066778-9-richard.henderson@linaro.org>
In-Reply-To: <20210717192419.2066778-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 13:22:41 +0100
Message-ID: <CAFEAcA_5QLj=0QrytzJpCg7L-z4_5+i6M1eGXiLbsBfdgYMrvw@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] accel/tcg: Expand ATOMIC_MMU_LOOKUP_*
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 17 Jul 2021 at 20:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Unify the parameters of atomic_mmu_lookup between cputlb.c and
> user-exec.c.  Call the function directly, and remove the macros.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

