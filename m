Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E46C37F863
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 15:06:25 +0200 (CEST)
Received: from localhost ([::1]:40994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhB2m-0003nC-6U
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 09:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhAzS-0001Cw-D2
 for qemu-devel@nongnu.org; Thu, 13 May 2021 09:02:58 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:41750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhAzQ-0000QD-E2
 for qemu-devel@nongnu.org; Thu, 13 May 2021 09:02:58 -0400
Received: by mail-ej1-x62e.google.com with SMTP id k10so8516755ejj.8
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 06:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E83A2qNX6XXhlLueYZ2ZRoVq9t9NRgT7ngBkXJ0lkPQ=;
 b=LeII5JKmWNjy5kv37j/hTyrvWvyWx59fRYVoaH06eKcZ7PTzea4pymJ2zD+i5jraEs
 ti/lUHREyJrkL28vlZoyObmn5gWPI/+MuTKO1LO5y9djpKrWIf1GSBvWp97UWE3ZNXJO
 ApAxXIcUeYz9Oon9duH405kmPM+WZ4Og5l1R6lM+WGwiRR8qfrZsEanAZKsGJ4S8c3yu
 3UTeys+59nUKdDo9IsqYVkyeCmj039Ja2IlG2EJbENf49weS9qz9YZPr00WMdKxfY7X1
 4OeJeWnPNhNOzIgabS+5csP76DjlE+1ihwYURaLpPBMn1MfrV20tL3Fmp++Ri+qhKqIH
 lmaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E83A2qNX6XXhlLueYZ2ZRoVq9t9NRgT7ngBkXJ0lkPQ=;
 b=jbeFFMnt17c2vtegNVANAI1cIyRSjnWb/GLIpFKgSizA41/ilB32T6H2GOUWg6WxJc
 gklrFdj/5Y73jo/qBaqxoRH/GPt3j5obNClMHznziqtq0iX3KwpGTJT+cjfdvpi1HS30
 4w+57QO90VVcJIwvjzocwDkQBVOYOsoGJz7qxOg0/GwsnTmvFdDu9Ytt5rR0vHeewPUN
 CF/+4FTkpOO8xpavdpA7+PKAliMU8CyVZoh3CwGF3gN4Hz9vvhrFG3QSkY0bMj5TKq+e
 HI6VJGTkoJk1jQ5ziybLjFjtnBKFR+5DZoR9OG6Kkpz81C1tGeyAmP0hfMGJA/DpbMF7
 HH7Q==
X-Gm-Message-State: AOAM530/57XEaRVZkUAIgUudju+cBa89EUEHHvyEr3c9sdg0WGVzKs8d
 wetnIz1MzANSLhxK7j124OfCm9OopM7mbWr9iJ7zhg==
X-Google-Smtp-Source: ABdhPJyNGTwlrfe267izw20PZIUzIwN6T6B31l0H2Y5f3TDzcDokbsSv30xRqvzVocyOfi6EEOFDzHdE8G2kaoRgboY=
X-Received: by 2002:a17:906:b74f:: with SMTP id
 fx15mr4680823ejb.85.1620910974802; 
 Thu, 13 May 2021 06:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-62-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-62-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 14:02:43 +0100
Message-ID: <CAFEAcA_iAUr0kFxySpAnM2an=o7e4q4XmGbddHRbgFPiKaT=Bw@mail.gmail.com>
Subject: Re: [PATCH v6 61/82] target/arm: Implement SVE2 crypto unary
 operations
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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

On Fri, 30 Apr 2021 at 22:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve.decode      |  6 ++++++
>  target/arm/translate-sve.c | 11 +++++++++++
>  2 files changed, 17 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

