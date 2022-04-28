Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D29513081
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 11:59:16 +0200 (CEST)
Received: from localhost ([::1]:57644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk0va-0006ur-Oi
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 05:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0gk-0008Ie-Po
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:43:54 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:44017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0gj-0007aA-07
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:43:54 -0400
Received: by mail-yb1-xb35.google.com with SMTP id g28so7966732ybj.10
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 02:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=43uBsnYCpbjcbMwE09rCNL8zmAsCXKgkbMVo3buZ3xs=;
 b=vBON4e8tqh7o3GmT0FRmMCEQyOkiULPB7qetL3mNPc5SUMowjXlo666FDarDz6HCKr
 TJKGJrGGECQtHyTjwL83D6PF02xcxqoxPmbEQca2Xt/zgZ0tcvGtu2U2XW6HMRZLVPMt
 Bsmvu/4PYazsfsStT5y4Ypo9qZMMem1ROghdOt0Q4iagVNqOK0jmxqjfW9bAbC1yfobA
 u2J/euV2K4B2rGh56GiaMsEYdAubRVaveRFSkEMK5+Jt6kbKMNo+zxFIPxErifjKKG8z
 o7NakYAPbdYphMDmPat4WwyQa0uJtt8lVo7TTsHbPQB7agUz2utDFyBCzD/qJzs4nrdY
 M4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=43uBsnYCpbjcbMwE09rCNL8zmAsCXKgkbMVo3buZ3xs=;
 b=SOawscN4ThlkmblQS5Ww8tjI+CPvNoFZWB6EEm7FeVw2/9Nezs5eUrFwrdkq2mdhzp
 Kn3K8IUVfOFoE2k/Z3a1m4dmGZRlIhpGRL0cimgsZEfkw6o6gISCCIOqKu2/CzhNNi+V
 v6aYM+aCN8SYudN0K+JK9v96CjZ/NcoprtLkQ4GryGHKWoDi/VhsLimhZvQqPG8fY5sz
 jcuBGbqBmb19st4cwY1EdiS7zjNHxseYsXsgaGltpzlqEFAfPq//mQPh9xPGW5w5jBKn
 Xvzc6vsxpfuEMiu5EKqqeNv2t7VeV4oaexpBikOyFP/vRdwa7fLUydXQaWzkJMDqyLys
 04dg==
X-Gm-Message-State: AOAM5329adnafidqv+vbvo5MGAuJeDsoKotCSmEueVgCNq0Culj8NwwP
 /Tqma7D4DjAQuT9oKETx+i4kiQe7ODTeGKmVMeMq/Q==
X-Google-Smtp-Source: ABdhPJykLf3/KcuMcKdCtLEihyX+NzbU5Lp62YQ1BUOrOgTm18Ij5IgW9VIoMijNnZcfGOIuKJdV34s9j9u2YOjCFDw=
X-Received: by 2002:a05:6902:34f:b0:645:463a:b824 with SMTP id
 e15-20020a056902034f00b00645463ab824mr29495552ybs.39.1651139031665; Thu, 28
 Apr 2022 02:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-9-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 10:43:40 +0100
Message-ID: <CAFEAcA-kO=nNPpZuqCkAqO3fUHLjom6vyxDd8WzhNRV29C8izA@mail.gmail.com>
Subject: Re: [PATCH 08/47] target/arm: Use tcg_constant in
 gen_compare_and_swap_pair
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 at 17:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

