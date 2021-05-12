Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7559F37C3C6
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 17:28:18 +0200 (CEST)
Received: from localhost ([::1]:49676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgqmX-0007MD-Id
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 11:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgqkJ-0005Bn-TL
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:26:01 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:42571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgqkG-00059R-60
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:25:59 -0400
Received: by mail-ed1-x530.google.com with SMTP id j26so23893668edf.9
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 08:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fEydPIxjqeA+pGs7wDJRkR/GjylpqXJipSVUdYmPzCw=;
 b=xqufCDJTQXgjoe0E68iPoVFfUKAXlJBcczBMnLgO092jaN9WbPtjAlfI+JvyOJ9VEq
 371MPSxWrjJSjKcsxaHRaEH1pjjBGvX3qmqzkjwyz+IaJkyHqMi1uT4VuLuwTB1Zo5Ss
 zru9Zz482R1xMGj1i5o+g2YkP3VuzFhPdVK29E8u0KiqsJFS0I/Cvz1szRUmFNaI99dZ
 Lw4tw0iGOAR4IJ6OyW8O2p3x518sgpD/j6sye/wt6PjYfVnf5OcDzkTJktI7hRajItYh
 pbJJK4sGgNdZEDwBE9DOQTJWq4iJPBVhfGklqJD3a8+sTdX36O+Bd9z0NXIUc/x4ix1W
 4iCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fEydPIxjqeA+pGs7wDJRkR/GjylpqXJipSVUdYmPzCw=;
 b=TyGIleajsWQJ1//BlDZDajhAW6wWeb8tx17Nts8LqJ2w42r0dZD/bMjpaiBpjYbqmV
 zoCW0bES8uKal91ZEXIcu+RHObnE6FPQfWk/IiZjq+Wt+a3AROt0uXGTu+LBJfe9SfUm
 naYSsRzbKi77jymYaYOB+ua3AdG3/vkRQCVTrvbKLONee/WVXE6iacDUqlqVZBUTHUaT
 UNui64/bbkZ+dM/cQ7U+IhZxFbkZnBvl38FNLqjWAEudiR2lQlFX73mbK1zIbmfCRl4x
 LIRohnKjFN571DHVUtlOVCnByYltkCmNUwCgm3uxX7XIp0pQkNWsBsUZg7Q8CWglZGg7
 xJUA==
X-Gm-Message-State: AOAM530VPIZsC8ISBlVUva794SVCti014ZkKRieS5X7iA8fuePxGyqDx
 j22upDpie8HdViW6ZuDtZy6sjJWaG/nECN1PPOyTQw==
X-Google-Smtp-Source: ABdhPJwvbHtbxtF7iTBFcK17NXHT2YS6z8JSYs/8o0RPdZRlWdJz5ihi0PLnEKLvTgEfeL1PQ3f3YtEVbUfDLo7L32g=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr43652708edt.36.1620833154934; 
 Wed, 12 May 2021 08:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-41-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-41-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 16:24:41 +0100
Message-ID: <CAFEAcA-s3kxcwwrVcOmHr7C03B5O9T9RxT0jfstrbBxE0LSbCA@mail.gmail.com>
Subject: Re: [PATCH v6 40/82] target/arm: Implement SVE2 SUBHNB, SUBHNT
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 22:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Stephen Long <steplong@quicinc.com>
>
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> Message-Id: <20200417162231.10374-4-steplong@quicinc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  8 ++++++++
>  target/arm/sve.decode      |  2 ++
>  target/arm/sve_helper.c    | 10 ++++++++++
>  target/arm/translate-sve.c |  3 +++
>  4 files changed, 23 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

