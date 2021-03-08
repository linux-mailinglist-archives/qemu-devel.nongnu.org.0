Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7818433145E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:18:15 +0100 (CET)
Received: from localhost ([::1]:52260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJWI-0002zv-Bq
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:18:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJBR-0004Nl-5P
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:56:41 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:36141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJBO-0008Sk-SD
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:56:40 -0500
Received: by mail-ej1-x633.google.com with SMTP id e19so21788160ejt.3
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 08:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jU5KAwICWSXyosyYi6jcxOIm/tqKDkJhcUYvpnVwKDw=;
 b=OhuuEvLhaC+Pc5Fc2HVjJ3QLzH8iLRf35NyGM4oj2ARQ+lRnlvEEvedlIe4XNCNf2O
 szpUXQOc0+XMgtOfjQRUCGIoE8IqMHaurjN7mfcD5veeGrCFH/s66yXbXyHumR0U8BzC
 JKA4+mKx9cTDQ2mIEP173o5tuOgiAlG36PDClE4jFtpTb1kCRvjA78+/Ty4+jYPdcq9K
 vQTynUP5iJ9o4l7OpitYG13IptiO3hJ+E4uEWuBUW4a2f1w3ay49UY33JI26JF66Ze+z
 nhjtZZaWmSiAYGZnyrucbUeiCCN+zv2E3w8d28LaNrCOpkPPallodoaFumAv0vQA05ie
 epXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jU5KAwICWSXyosyYi6jcxOIm/tqKDkJhcUYvpnVwKDw=;
 b=R/QqyFubga0hFnmMrqkmsfVHfbmWHywSQpyH4XibpQlVhhpEfPBmkxMvgyiljnt2zW
 GD2LVtXxyhc0TEExW6lcVcYBYgD9RIb2fJU+fiTTWiSmy4//TN4n9E9Lbk8ZtyJESh8A
 6Z37tD+8CcMi0SQKUSvVkA42HRogo+/AoHWtVG1XF73DT57aaotIxQqly/5VEGM+VD4m
 jvoT/oDHGlVZ5RvE8j8F/j7phu+aMb0zHCYfqNpN+DpC9gG0EDyllD2vgDFOwPwok0yL
 r82sBDoNdU4cIZAQAHzrb6Y4JyqZN36lB/X0mkDkkpG5X+rL10UuBGZuo/wrZ7L2S+Xg
 QT7g==
X-Gm-Message-State: AOAM533+47d6khiYh4ZEy3fg3+yBzGohmCfNnL0WKFks8UhQlUNBD3Jl
 22gh3anYjxmniwinds9aBvHlButZtPKbiG/wh8pfdw==
X-Google-Smtp-Source: ABdhPJzTk1uxUU/uVWla9ZhsbFEGVJ79YJ0wCKL9DchYCUzGAkwIBGsdS2va/xPJdqYg+vf2i4e0NDGhftgvS8uIgxg=
X-Received: by 2002:a17:906:66cc:: with SMTP id
 k12mr15525092ejp.382.1615222597011; 
 Mon, 08 Mar 2021 08:56:37 -0800 (PST)
MIME-Version: 1.0
References: <20210306151801.2388182-1-f4bug@amsat.org>
In-Reply-To: <20210306151801.2388182-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Mar 2021 16:56:20 +0000
Message-ID: <CAFEAcA8i4W-SjYXYb3zH6rHQ8rFQuQUa0PaaO5TpB=qb43YfaQ@mail.gmail.com>
Subject: Re: [PATCH v3] target/arm: Restrict v7A TCG cpus to TCG accel
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 6 Mar 2021 at 15:18, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> KVM requires the target cpu to be at least ARMv8 architecture
> (support on ARMv7 has been dropped in commit 82bf7ae84ce:
> "target/arm: Remove KVM support for 32-bit Arm hosts").
>
> A KVM-only build won't be able to run TCG cpus, move the
> v7A CPU definitions to cpu_tcg.c.
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> v3: Rebased on ed84a60ca80 ("target/arm: Set ID_PFR2.SSBS
>     to 1 for "max" 32-bit CPU")

Applied to target-arm.next, thanks.

(I forgot to edit the commit message of patch 2 in the arm pullreq,
but it's not a big deal.)

-- PMM

