Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 665843B6506
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 17:18:11 +0200 (CEST)
Received: from localhost ([::1]:45708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxt1W-0004t6-Df
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 11:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxt06-0002ur-UD
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:16:42 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:38459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxt04-0001aI-U8
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:16:42 -0400
Received: by mail-ed1-x533.google.com with SMTP id q14so26456411eds.5
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 08:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A8XQndkbxP/3FQvTJ8sM7J/1ermLt9VAHQUL/F2bsi8=;
 b=wcJdY3nXhAfsPM9jWm90yAd3rm+hBp6HoNaJyz/goPrGhrYEqUR5m5CSq/yKcaFb/N
 iE9SiGpben4XezYl5sbhOyiF9dZzTeC9JxembToQLbcD4vYjb1qjvMjVlz8WMy7cQEI6
 0cD2qlJI5p5V+kngHXKf0PwKW6f5mQNa3Q0KXCIfmF27xQXywQGhblBL/Qx5Bj46DZ2u
 mYmDcxzpr/wKxuKhHcLNxBpz17a/1QYjTPhROATUidd3LBf1pDnBpdYFIMvGdgEMTIEB
 a37VyH/FFtIY3UCaVz7ewdTay69OGnSsQIhJ6Pbngbid3dGi/j38nNERP5AVhtQKNzl9
 R7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A8XQndkbxP/3FQvTJ8sM7J/1ermLt9VAHQUL/F2bsi8=;
 b=Yl25KXRzdbxSiW0DU7e6Rv9z5K5wqzqZK01E7XY+4dKsOB50D/ze4McZZroswJqFPp
 UOdB8AliD7l3L4SB/LvrGOTGlxocbesVJgVx2ufkEWUmDVb+fuRvQ1jQThHalHfgQbvi
 3ii9aZMYiL4UbJ5A7jVeG4RrmaxqHBbnwYckKOjFpdX2hcXYecktQDqhmK5uaGB84eBS
 OBKZH49L8Gv3MMtUh9y5Y9h7+5RVEdf/i2oRZExwHPjKBBUmz4yXiZNESLGm2Yemfqf+
 Vi3mewlLYRC/78uwxFNB0Ew2QaOr7LpxbZgySQEkU8rAiZoIQwGfNoP8ifnRXfvd4zA9
 +93A==
X-Gm-Message-State: AOAM533bNzO01DhnRjAhkK0D5Zjtm3yCirk2+Xw0rDu1eMntICei5S6Z
 8iePS88N1oK/HlwwUORLF1B0dvApVGmQSnXXAPlF0g==
X-Google-Smtp-Source: ABdhPJzADbNiR9P8xR2Y+S7HKpr0dKtPX3UN9K23ra/sEOX+NowpfLqViIaBKwVKUl5q1ljxXt83UQSMoMlBNUkfxMU=
X-Received: by 2002:a05:6402:5204:: with SMTP id
 s4mr33447046edd.52.1624893399407; 
 Mon, 28 Jun 2021 08:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210620221046.1526418-1-richard.henderson@linaro.org>
 <20210620221046.1526418-4-richard.henderson@linaro.org>
In-Reply-To: <20210620221046.1526418-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jun 2021 16:16:02 +0100
Message-ID: <CAFEAcA_ANJaA1teMuuWJd25JZJNXNz96NgDAMZu=kC6obFONZg@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] target/nios2: Use global cpu_R
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 20 Jun 2021 at 23:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We do not need to copy this into DisasContext.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

