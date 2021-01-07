Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E27D2ED3FB
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 17:13:03 +0100 (CET)
Received: from localhost ([::1]:42910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxXuE-0000uY-Du
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 11:12:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXs2-0007le-Tv
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:10:42 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:37474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXry-0002M3-7J
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:10:42 -0500
Received: by mail-ej1-x634.google.com with SMTP id ga15so10461255ejb.4
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 08:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J9BIhQ4V0B4hPy/a9Bijy8OPcyHRD46mPkUYTVMYyNI=;
 b=xvUdUiMYEoOM3ANsOY0LRr8Fn47cdfqELN36Rpofo3Sao4sHVONwI0yMuRXArT62Gw
 StRK4HRS0RnOqSAWlwpJZz1ipbHUiouxLg4IUIX20g/guDOa6A1m5eeHO9HX++iZfDyd
 Dv1PYng8a6l7ouzbORSRZ1oi1MKZpoQCGedLa3tfnQCHObXbVeopR8LaG7pw1j777irD
 asXkagfGKtK+n9fkANF+NghZ33DOiUL0nkFgpdRKaDwuiovy8+TbDLLDvUTzJvGyGNbW
 8bPpbu9X0PZFJmErivCiiVB9QMRMvRtMeWG6mPOPSQPzLcHfxiFbyk93hELjBbVRtIvl
 Q3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J9BIhQ4V0B4hPy/a9Bijy8OPcyHRD46mPkUYTVMYyNI=;
 b=mkyLRav13wDSilUBfDdgYGFH8lmiv2TvRlRBY9fiHis00nF42N6i7coXoE5INCpgcV
 71F719+FlbV9BWHp1mzcSGsEhavCWgjIpyab2RSpyrv6/bzNORRsHZPtptvhiwv+yGF7
 RDneSscAXavjA8cvCQdaEA3m4R5Y+8vGj3MtJmSMIsQ/JSejMWIE6fkSNDtA8H0ItstI
 m1qpsPmBMZNp2q9QmV+t5v2pWP/gjSPjdblI7RnLkR6cE7+akHY5ZAEiWvyVo+KMiwAd
 fi3UoC0eBk+wPjrrkJpLUQUPLpWdMym3krY2LnwF5RAHfCathewK9K457lGvLHZO8zCD
 +c6A==
X-Gm-Message-State: AOAM533Rn+c6jW8jZwcuXaRpNwvxapCok7foB+Vi1OA7u3mrdhRo0iXv
 OSX95fG8V/r/dyxCS6vj8KWqwWRqfc7kD56kxbRvZA==
X-Google-Smtp-Source: ABdhPJwQQFmsP5wwepYugKEgK1GpsPtfkD1m1oSyCF0lnqN8UTAEpcWpiCAj5boB5gWbwI1dpnbrsdvO8kugRBBdDXU=
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr6884362ejr.482.1610035835776; 
 Thu, 07 Jan 2021 08:10:35 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-11-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 16:10:24 +0000
Message-ID: <CAFEAcA-SnPJ+LJLNm2+gHFBmKaF09Str7y3tjjafj3sir7u0dg@mail.gmail.com>
Subject: Re: [PATCH v2 10/24] target/arm: Enforce alignment for RFE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
>  target/arm/translate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

