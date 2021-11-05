Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4673E4467A6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 18:17:33 +0100 (CET)
Received: from localhost ([::1]:54284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj2qJ-0000Vb-4X
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 13:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj2gS-00025S-6C
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 13:07:20 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:52954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mj2gQ-0007Ha-C8
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 13:07:19 -0400
Received: by mail-wm1-x331.google.com with SMTP id o29so3805175wms.2
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 10:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X1Np0AvnZZ5JMeT14wgEEsoZFkTxr8V8yUHNPb4ZyHc=;
 b=oOaENlKvIXMb2evWHMim4/aVLAotXdAxgnM4fpY8b4rokQffnxENqsdgyj2S3+vv3T
 LgcyVVXFEZyc9f+nP3Rvw9tORfNUGR2LBQTJ42GMa5ZNv7OUIY8GFf85xX6dQqalEH/p
 PaCFgRZCm/3NwKbvYfYF5Zq3wnZ3f7R3IyZs7B3w3YwvivR473m2XfhPYLmx1LXNQRDk
 m4pOfgIn+KRNkdCG5Klk0Njsws2REL81ppMCMZyhOG1TEGaDuhqJHWF47SkGINRSJW5S
 8BLcQxaEniUpQODpEd5vp1vbDvMM7/kQ8de8QoBF3EyzU8+BNY53TIfn/6RglJ1RVys/
 EG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X1Np0AvnZZ5JMeT14wgEEsoZFkTxr8V8yUHNPb4ZyHc=;
 b=I0VsVN6c0aazDciKArAW3onV9/OSvB2vzVScXvjOLkjJkEJQAxMoTypKf95j1p9ANe
 nYDobNKIlB7iC/l3POjoIfoyPA774L10uu3pZjCJpnXZqyg2YH4vWyUOtdkLIVcTZHkF
 G9UlL14uq7LeWq70xbtQxNVtqt6dTDROHrnH5tPAxsbj0Xu/alvUuHOfMsEWBd4knS3v
 3AuCn26yKFeUlrEVNtXAnWxAbS2SfQomIVqHnEimlHNZ2ZeMpxLXqgCOfw/bm2D+MvKV
 YycnUiSRmemQBY9GWQCvXTr1vVB+avHRkeAJstkg53/FYksEHbQXpgqtZFWtSUsMkouh
 o5OQ==
X-Gm-Message-State: AOAM533AQIE0fYLh+LDhF7+uPZ599F0tbbFYg6SBIGgximOA12SZIH24
 1J2cYjjLbkgzv77OCn814eS5sqkOixc+lDcdkD+v2Q==
X-Google-Smtp-Source: ABdhPJwoosys8B/ypxt2tmiN1V1lpSekhlVYbXosgjUs/0j66jH/9VQJoL5D/lwlWAUhE1xnuIoUqg899qFCZC6zUf0=
X-Received: by 2002:a1c:f712:: with SMTP id v18mr32157999wmh.37.1636132035029; 
 Fri, 05 Nov 2021 10:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211103040352.373688-1-richard.henderson@linaro.org>
 <20211103040352.373688-6-richard.henderson@linaro.org>
In-Reply-To: <20211103040352.373688-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Nov 2021 17:07:03 +0000
Message-ID: <CAFEAcA-f0t5RW=m1QnjUffrmt4dQUc+5RdW3NS+cp2gUa5a2sQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/10] target/arm: Advance pc for arch single-step
 exception
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Nov 2021 at 04:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The size of the code covered by a TranslationBlock cannot be 0;
> this is checked via assert in tb_gen_code.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

