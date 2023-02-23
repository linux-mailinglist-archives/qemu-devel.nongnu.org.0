Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 845026A0CD5
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 16:25:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDRO-0000Kd-1o; Thu, 23 Feb 2023 10:23:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVDRJ-0000KA-OJ
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:23:21 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVDRH-0000c8-I1
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:23:21 -0500
Received: by mail-pf1-x430.google.com with SMTP id a7so6291540pfx.10
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 07:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=flvNreU1ZmeFjUF6wIHapxkgykr+7+DFu64SIfPhOgc=;
 b=K9cv1vfMsKUaL1omJ3Jv+d/NtD6hidmPfmF1fm0jozoyStKMI2oFZPXbFWGlkll0Bn
 3Y0VijtVXFPfs6I6vAW6b6CKyj5YJpbzZSs3HY96fEHb5KKN52T9g+i76XQwmlS0nvrE
 8Wbrvw2jCWLVIEvnU3Oyz4HmWNxyIbviHDCL8PbMEz7RP5RnI5w6YeoqF/FYWsS+dWJI
 5slE26pwmY8M/3ydy9/ojKNgLFrmtdM1npNw8juel0riE5R89i95njhJU5enEsZqRSnN
 LTaAh6bPg7Wao5agt4jv9knwTYrCbzKWGMbuCSGcYE1+NZ2S7oIJMt924/aB6k+b0B8K
 jhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=flvNreU1ZmeFjUF6wIHapxkgykr+7+DFu64SIfPhOgc=;
 b=0ejmiHkOynfh8hhN8uJaHDW2agS4XpyVaWmTVvg3jd0+8WZd8tDnymxdJRnmFHjjnc
 XFg/NS8Z+8ZXmXmcGvlUu7dfSZB/lzedDzfbe23G6vvMRUKgn2f3ig4WjB2ns0AsYNXm
 Om5iB8f6UvxtqgGV8Titr18Qwhr53Hv+h/g5Mt4wRNNoZJ3x9dpXoCke5aujlrPQU91C
 K7OJsw7dCCaAsZ56wZFdCxue7cMbrWYBdE0s9lmPj1zZCQO3DLPgvpD0QrYzjvXtaD9j
 mbw9TMAGHk1eUfVsBnPNZNY8UFa3zTqXtgaMuebr7k2+VBE7uulOJLiPGHir4ZEBTizQ
 VNVQ==
X-Gm-Message-State: AO0yUKWc09MORU5zhfjIqCMUkcJugBGO+jEXlMH+9YM4tRFv2QCPHq2F
 NGzJfeXHLJOF1fOOpOsTWWgy8EL/k8wS8fWXJYBk3g==
X-Google-Smtp-Source: AK7set9DKjoOKVExWKzfaj/Rxaf9zwA00zMKDeL7bjna04aDblOyfl2JNjFR8mLOMO7YiroYscgfQqCpCK1NYy217bs=
X-Received: by 2002:a62:e401:0:b0:592:453c:320a with SMTP id
 r1-20020a62e401000000b00592453c320amr1794009pfh.5.1677165796457; Thu, 23 Feb
 2023 07:23:16 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-4-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 15:23:05 +0000
Message-ID: <CAFEAcA-CJFWSbcvH08szYWQ8R3qxgcsV_DO33VXM9T2ZK6mP2Q@mail.gmail.com>
Subject: Re: [PATCH v1 03/19] target/arm: Use tcg_gen_qemu_{st, ld}_i128 for
 do_fp_{st, ld}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 16 Feb 2023 at 03:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> While we don't require 16-byte atomicity here, using a single
> larger operation simplifies the code.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 38 ++++++++++++++------------------------
>  1 file changed, 14 insertions(+), 24 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

