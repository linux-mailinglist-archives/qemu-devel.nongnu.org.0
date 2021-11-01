Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6756A441F28
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 18:22:22 +0100 (CET)
Received: from localhost ([::1]:53542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhb0n-00084r-CO
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 13:22:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhayZ-00057R-M4
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:20:03 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:55968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhayW-0007ak-PY
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:20:03 -0400
Received: by mail-wm1-x32a.google.com with SMTP id v127so13767977wme.5
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qcBKO9HdxHHDrpfeXDshGvujiWbyFgmdB6ErXgNZARE=;
 b=H/V/3IxHXo82ceFLsHVz+eAs8KR35J2hIqdSoWf+D7nE30Qm3SlDL4PJR0wMkWZtoa
 pFGfu7MM/aRWTxWLi6P76CHScIWyNKCtFsU03A+Y+soP9/Jbkjv8RcEZOLNxpNSLRw5g
 /KZQw5FK5X/xTUvVTVhjY5Fy1oRXCqUULf4RvMA6EHdVfqDNlSDlOiLRmhuRTG9JyJcy
 sXtrEqq64xLDaiypuxtY1YtjrwPQMfJNSDxBEW68dL5Izwh1CLqalrlqW6JnPPFjQLGr
 Ckt+YODV12OGYwFrbJ0ilZyYeF+dfkkH08hQnOgslLUjUAzwSfuPolnFrYORILiunwdx
 OTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qcBKO9HdxHHDrpfeXDshGvujiWbyFgmdB6ErXgNZARE=;
 b=SHiQdLuOAYtSqYFVrtlJdE+bQ2L0Vdy9QGB7ozZ0O32jzegXk3/heKHDkPgI8AOMPW
 KVui+N5GE9hGJ9fWtbk5gV+WPNGwWV/woNvJVw/xOLd0xDFClx3oLNaIB7+s6FK6tvpV
 GKIOJMCqLiXXodbVziqQ+qVP85320wGugEwhbCvf5AofB5XB1SKcfYZHJ31rD4jgZa/H
 WGa8NPKOtqZLYWNBV9J9jJZqnkeRQ97+BCDqCl1A16EVXzOJj1v3T9zPqvAkx5Rnjzxr
 nrUvQ1nwrL6/xcAmU0GB7t6cDqESK61guWy2hSnLtWUcYLUANXBlaZ68n24T43PU35iF
 fetw==
X-Gm-Message-State: AOAM530m9KkhcLiFUDlk9ywl1C5Y57jzD41pnPxzkhLDEq2bMJ+Vn9V3
 oyCsrJ0CfZ3ubsFT6FH13f/o6GZqTxJqtSOmfsBhsA==
X-Google-Smtp-Source: ABdhPJyRdHjZoQ/Xod+biwQhIhXx2lShWd8E8BDc4LUnpj3QRboNYpW1cDk1kaSB/k6spETXQWuBQ+FjhjalhVsmGG0=
X-Received: by 2002:a7b:c389:: with SMTP id s9mr210762wmj.133.1635787199108;
 Mon, 01 Nov 2021 10:19:59 -0700 (PDT)
MIME-Version: 1.0
References: <20211008002628.1958285-1-wuhaotsh@google.com>
 <20211008002628.1958285-5-wuhaotsh@google.com>
In-Reply-To: <20211008002628.1958285-5-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 17:19:48 +0000
Message-ID: <CAFEAcA-ELrChUt=-fZfFCiFnnu2B1q9ALHEwk9CAQFJ3Um_zdQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] tests/qtest/libqos: add SDHCI commands
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-block@nongnu.org, venture@google.com, bin.meng@windriver.com,
 hskinnemoen@google.com, qemu-devel@nongnu.org, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, maoshengtan2011@gmail.com,
 Chris Rauer <crauer@google.com>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 Oct 2021 at 01:26, Hao Wu <wuhaotsh@google.com> wrote:
>
> From: Shengtan Mao <stmao@google.com>
>
> Signed-off-by: Shengtan Mao <stmao@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Chris Rauer <crauer@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  tests/qtest/libqos/meson.build |   1 +
>  tests/qtest/libqos/sdhci-cmd.c | 116 +++++++++++++++++++++++++++++++++
>  tests/qtest/libqos/sdhci-cmd.h |  70 ++++++++++++++++++++
>  3 files changed, 187 insertions(+)
>  create mode 100644 tests/qtest/libqos/sdhci-cmd.c
>  create mode 100644 tests/qtest/libqos/sdhci-cmd.h

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

