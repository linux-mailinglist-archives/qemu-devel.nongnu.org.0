Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F29E200ADE
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 16:02:53 +0200 (CEST)
Received: from localhost ([::1]:57950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmHbY-0000uX-5W
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 10:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmHaC-0008MG-Li
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 10:01:28 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:37895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmHaA-0002cW-2L
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 10:01:28 -0400
Received: by mail-ot1-x344.google.com with SMTP id n70so7337802ota.5
 for <qemu-devel@nongnu.org>; Fri, 19 Jun 2020 07:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wE8BfHfNAO+5nkJqhyMoLYpZJCH+W6T2oan6Gy3zaF4=;
 b=wp0bvtCX1DVjY8i53WSljTA9NgGSDtFpPRcoXCtBxJss64AJA/yrY+/Xx/7ulAAEU2
 /Y+HtOfIwSK6ldT6VVo5ku7TP2c3mFbPbwTqf3r9YMKkgMxi4BFO1It/dwOprDcAndQD
 S/Dw8BM9vw5MWI3qJABfVSZc4ApEUdiQYfSuUbYT4zAvpZWItNqjCLnXgOAUn/ZD/n39
 ryq+LHUBrMyAsR68uLHS6G1dMYGFuytcWvi82vMH5OEiyQDo+20dqpu4H6rTmMegvmhQ
 Ub7lp7qMf8trej4Q0hvde31S10OC3Sozx7+9+0Ea2eVnOAhkHnG3GyC+BCL6l4d0iRx9
 GZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wE8BfHfNAO+5nkJqhyMoLYpZJCH+W6T2oan6Gy3zaF4=;
 b=QDr35RrZA7ZX7HNZJGTgspxk81sDuysWdGrl4zKho20tc4Tig4uCCdyMA+Mf8M4HOJ
 XrmNV0L4vxjSxOn329BghZtAQD5kV6EpTUN7DGMG9dZ7r1iirtG3x+1OAyjjRfEuWBJE
 5wlE9YAMoI/DUEoBC+Y/+eKZgRd2jyQG0wJsZuov74WpAAF9gI1xGBy7F7743Yj/xSLR
 Ft2Mq2O4z6+paQgGqf8bHkKBkcj81TVWbU1QQFFICAT3OE3DhoRf8xzj7vhBwhjY896X
 5mIuRVsC1/mRwaJRpLWjUPYQg9gpmk3FlIW2Jn48dYVQm6qWIed+HSKitqZYpxSknvqk
 6Skw==
X-Gm-Message-State: AOAM5306jUy/DYjBhSByDRknt003CKcZTbkSlMy48qX5pOUqiEx9xyPr
 3BHPFl7W6zfa6taGEajfnDH86DBLPC/LtLPlbpixcw==
X-Google-Smtp-Source: ABdhPJxR5OPgQ67pTODxcOumm417puFBnHNtP+44nxxoh9fmVOwZhfcMWvw0wSbY6VyPgWUGWQFXX172H+hvVIZloV0=
X-Received: by 2002:a05:6830:18da:: with SMTP id
 v26mr3195825ote.135.1592575284528; 
 Fri, 19 Jun 2020 07:01:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-30-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-30-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2020 15:01:13 +0100
Message-ID: <CAFEAcA_Pi_WZ9JRir2y_MZmVH3ugCJuAd6PaenK6MTy05zuc7w@mail.gmail.com>
Subject: Re: [PATCH v7 29/42] target/arm: Use mte_checkN for sve unpredicated
 stores
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  1 +
>  target/arm/sve_helper.c    | 63 ++++++++++++++++++++++++++-
>  target/arm/translate-sve.c | 88 ++++++++++++++------------------------
>  3 files changed, 94 insertions(+), 58 deletions(-)

Same remarks as patch 28.

thanks
-- PMM

