Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA4537B8BF
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 10:58:35 +0200 (CEST)
Received: from localhost ([::1]:57722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgkhO-00089k-8V
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 04:58:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgkgN-0006p6-Pn
 for qemu-devel@nongnu.org; Wed, 12 May 2021 04:57:31 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:35535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgkgM-00046I-8o
 for qemu-devel@nongnu.org; Wed, 12 May 2021 04:57:31 -0400
Received: by mail-ej1-x632.google.com with SMTP id m12so33883775eja.2
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 01:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sRcP/Vr7jiBZEYSlpBcsH05hcZkV9UAvG+ayAT2oX2Y=;
 b=bC2lXGY7RI7L59gz8HHGCwLvGEc14UW7+59vIPskJXMMQs8NWY15cPwJVjFW0Ws0/g
 XPuwlogmuceoYjzDC264uWbczMEYWPq9QlOWM+V5WagtytnYkAKljwQPwcdFQoB9vjZH
 akO6BJHT5k65IBAGycArhJ2XBM50u3R3nM0d7k/M7AiiyKUQ1vwEaKFhv8qnbo6rElkG
 Uz4BTdGgcXjlASwA/8VNXESmH7KclYnokM+nJvrKacVtUbQ4XKuYLclOD45b/lTHE+JL
 NFpT9lUhr31O/rksp+O9fyz3fF+g8HvNvAXvN8dpltXY0B7/mDTJxsMqPVII70wOBx1w
 H+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sRcP/Vr7jiBZEYSlpBcsH05hcZkV9UAvG+ayAT2oX2Y=;
 b=MdLyb2jmQRyp9o1FenOYWF1KpMQLcS4z3jf1DCTIEgF80MSo0pEx4i22J3Fr+k9NcY
 NYSrPwMnxx28pr5yog+yb7SwOlAzwAOgoSkIqW3v5pJq7dlypO6o/iO1UOpJaT65d77S
 h3aMCti9rwJGuKX623e5PlxKeOgQMBMHD0dWdUz9YXm43ptuaIChBKYqZ1N5SE1QIGCx
 +dBnzrNZ1PNN5T+9+S1L+axteCDtHrsXi3EICt+65lrrR+AB5dUEIChSmikhXSoLjAwO
 QT8gCrQb00xjWVGcfautPUcTP0UCvaksMsLza5RleG+n17iVScCESV3XRbwAkkNqOnqD
 qerQ==
X-Gm-Message-State: AOAM530+9Pja6tvsALD1CvtPuHMiceEoxIbq6g/S9YgFvEvz5920eTMP
 KcDaE5cVro5uq5bGveF4QB4HnefMqeoZ+Ka76Ppvqw==
X-Google-Smtp-Source: ABdhPJwLGiSU08OGMRD6rfDmh4IJvgoHA4jB89qKWVIrqZ6CaDmr/r7twRmAXicDucovJrsStPeuiN9fXT4yORFB8rU=
X-Received: by 2002:a17:906:11cc:: with SMTP id
 o12mr36820263eja.85.1620809848739; 
 Wed, 12 May 2021 01:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-29-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-29-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 09:56:15 +0100
Message-ID: <CAFEAcA9ktK+i61m_XsMOfdxtOicRbGexY21Pqurx4K=hkCAB2A@mail.gmail.com>
Subject: Re: [PATCH v6 28/82] target/arm: Implement SVE2 UQSHRN, UQRSHRN
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 21:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 16 +++++++
>  target/arm/sve.decode      |  4 ++
>  target/arm/sve_helper.c    | 24 ++++++++++
>  target/arm/translate-sve.c | 93 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 137 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

