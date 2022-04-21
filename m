Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1055B50A8D5
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 21:13:02 +0200 (CEST)
Received: from localhost ([::1]:54852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhcEf-0000Cw-5B
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 15:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhc8E-0007dB-41
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:06:22 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:45765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhc8C-0001ob-Lq
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:06:21 -0400
Received: by mail-yb1-xb35.google.com with SMTP id g14so7099458ybj.12
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 12:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fI+MEI8RP2BGe18s3DgNtdGctOAQdnz4U334nef1bfw=;
 b=OqdJMYeW1yPUs2RIi1dozoq2QfYdxR9/rdF/gn7Nj5jkkrakJd6H/sZHhpLHPSA23g
 j/64BXOSmXHInAvBNuu/+SB2a9BZgDBln1mVOEHeM6tKWxZRKNUG18Lh9U4cVvGk9GPX
 yds7OUTob7ANx8+6K+PpZwhdoK3Za3E1TPW9EREzW8a79sVjm37msek/atpBxNR0slBH
 mS8QOJp31Ja4ZWed6utOaNe2fwBeXPPSUospmdhkeDGAHT5JRdBbbmoQWVqVnR2f/t06
 IRwmdvswrRaa5aPYO4Z+zNH7G1naqiX9FOPiGuVVg1FnhaWQD7rGdiv9dX/rWl+nDawg
 WiFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fI+MEI8RP2BGe18s3DgNtdGctOAQdnz4U334nef1bfw=;
 b=sc7ljgKlF5kCZ+0veJKpQU73ENgmZglNoWagbju4gKpb+tktxSoG01Cp2yIol+d8dW
 qjFkvhJ0JwzqWbL9chgMB1T7rWwFVPvEEw8tc1Vh7M/H7jNugYlrcRwDKZqWxidRETAC
 /W9Tvy+rbNCBwAQtOZ46i41I0WwJD5DURguMUOoM0K026W+tmGDnEQIGpNnyF7s7zcpY
 oiTNqIs1xI2VRmcGBlOPsLD0VptQFJ4XC3c00Kib0/LyCTwpOcpkOUr9wcPOg2Cc+r2h
 2+P8nkIvAE8CpL2xJAkEj5/mNK6dbaN4qsLC6Jq5NAgdDnf2+1SUdphlVf5GhY+khR2C
 O/RQ==
X-Gm-Message-State: AOAM533fbby/6XG1IQ9mtfs7HN2x4wxrUbDTtTe5zNigFjopN7i937AQ
 EtwwXxKIPIWoBl1X3hV7OK/V1pbWwuOS928JQzF4Dw==
X-Google-Smtp-Source: ABdhPJwydmeIut1SEQQk4QO5TX9dQ0xWR7hqsP1pS8vybaZXDmI8Ay1xJ1HxKoEEgW7DPadj9FGF2FHYnGV937lW1/A=
X-Received: by 2002:a25:a287:0:b0:645:3c4f:7dec with SMTP id
 c7-20020a25a287000000b006453c4f7decmr1161891ybi.479.1650567979875; Thu, 21
 Apr 2022 12:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-20-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 20:06:08 +0100
Message-ID: <CAFEAcA85PQnOrYeo+eLQ2t80YVRt+WwcQqV0TL=fJt-0f7ynWQ@mail.gmail.com>
Subject: Re: [PATCH v3 19/60] target/arm: Use tcg_constant in translate-neon.c
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 17 Apr 2022 at 19:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use tcg_constant_{i32,i64} as appropriate throughout.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-neon.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

