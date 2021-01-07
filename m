Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6592ED5C2
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 18:38:37 +0100 (CET)
Received: from localhost ([::1]:53712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxZF6-0002AY-MD
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 12:38:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZ9o-0006cC-Bu
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:33:08 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:40006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZ9k-0000XC-9d
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:33:08 -0500
Received: by mail-ej1-x633.google.com with SMTP id x16so10787605ejj.7
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 09:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xxA0RceEX7B6Y0wkp7hOU2XVUKZhAf9ydhuV9MK9370=;
 b=HNs4AKl3r+8mqJKrrSjQzNhwscPz+K5oNgcXCUVM9eBJeif0IzNN3aqVbO6ieGbJDe
 zkaOm3DhOoj8gmbyHb0dqAEViEuS3JNBT9lx0MYRMQF7yOYS5g318hLHIJtz/ONHBLR6
 zZVx53GG91BQCyNOM7Edm6c/F0UKne7MYX5s2x4xIE3CP0z9dDDY0BUtlYgW6x2AmbVD
 weFEFwjpLRxt9sdA91Lv1F53MMmAVbu5Y0UeJCXYkbDohQ/icVU3vIgBhyXuudEYB83s
 U61M/9/+LPV0wHWT0ir8nmo3EnpsnFt7UjgaGGypMqnoBBmCV2gYdNT1qKdyIfSLEjMI
 diOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xxA0RceEX7B6Y0wkp7hOU2XVUKZhAf9ydhuV9MK9370=;
 b=t+mFI4MW67t217smmmrW6RMpR/yG0bgZkmOyxcYu57ZYGuswfMEulu8/hfJ+YE0FQ6
 1B/kou9ydIFfnxNjmOkWiK80J4Egb5zmOTg5464963dRDhHbSrCrPCto2fvugs/93L2Y
 5n3QmLE6+iM5635gipkH8nusk6GFloo6j6inb+/Dzl3S+HJIyuopBzgVMxyVemVw3EIK
 /kaqRygsYRzDyshOhzZ1IUHnpVmLEN2qmqyMBV+eR4duBSqeJC9gyX1P2K6XyxyNpFcf
 nPU1ORTiEQ60VDKCR0VKhnZ9GyokUo9lRkY+iwmSLOJfuLN6aI1WTv2tGtMcPnr9622C
 vZhw==
X-Gm-Message-State: AOAM531p/GZtnTa/v3e1wrPzEtOlTZnGmt3Jt0eVj/GGgjH90jZ+fBeS
 WIgSP8dvFMmVNQWpJpxmODon/hhis+Iu7CbjhMev50aVooA=
X-Google-Smtp-Source: ABdhPJyJtvXkEAHZpySUx6SQ4lbfHc4JRDiV9tvPrs+Ytt6k0T4zyD/zdiDaeSf6PW4+cX2kypcga8YUsalF5FGrYvk=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr6985796ejf.407.1610040783111; 
 Thu, 07 Jan 2021 09:33:03 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-21-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 17:32:51 +0000
Message-ID: <CAFEAcA_r6=vF+mvEdCS=w+3hoheoDOeSwio7cbHQ12LHuz9DKA@mail.gmail.com>
Subject: Re: [PATCH v2 20/24] target/arm: Use MemOp for size + endian in aa64
 vector ld/st
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

