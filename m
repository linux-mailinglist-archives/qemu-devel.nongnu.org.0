Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA332D7844
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 15:54:48 +0100 (CET)
Received: from localhost ([::1]:36244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knjol-0002hA-Vo
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 09:54:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knjn7-0001SS-ME
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:53:05 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:44518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knjn3-0002y2-81
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:53:05 -0500
Received: by mail-ej1-x644.google.com with SMTP id w1so8049114ejf.11
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 06:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4xwWBnVV1bFk4F8QzHyWz6r0Hlne0TDXOnKuH6aZAkA=;
 b=qom7LPPpFE6Zf7J9AypPvxnvpvEic4/dfItpgqDuKZWaNcQeyQdc5G/HNDe/3IyT+L
 vnnvJdlNxDmVqTsF5ln1WWYsWQWSZsP/6yK6aJCzUbjdUU1NVqudK9O9MvcLbSkzkTS5
 XZTmk27q5cww1Tq45HIQtp+Z8gitAoDRjSaKOBVQS5LsT4Pb5IaWP4jCxBsgqwYRo1Sg
 zD2UFIqZHR8L5Euwi2RKWVh9fHTzX2aZOqjIoTgMQREl1Os1NZzr9yrLQT1y0IZbj5Jb
 AAmuxO23LRKOhgzK9n1MU0EMZH6Qb3AuIW7u4e1W9JE6Ts6ATcR3p0DJcQ3C1G8sMqp8
 Abjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4xwWBnVV1bFk4F8QzHyWz6r0Hlne0TDXOnKuH6aZAkA=;
 b=UwN1BlLx0l5MEioCqK0ST8BoFCJi38WwLPpN8mRGI/VVeAXWbDwp4ISQdM9OMTwPYb
 epJSw4om98DpeFtLtUCFX/rZg5HFFu7OmFud+VHzuN0bzgrsC/fUEDk90LfsXCBxla5N
 if/rDPvkB4VjfO3twR35R4SXAv7l50ULnil7AyucQW+n/gFQGuWt/sFrfdJO4CN+jgWn
 L6YJ1v3Uf/OZvpd3ptv6cqcEUQXSIOyMcCkpAazcIm0h+9PLC5WJ6Ge8gUTqwED32eHw
 4E/pMq8Zb4SwX1folYfxVH9I7qhXVc0GgL818P8UwddxGCflXLmGeX9oirObt6Ta53Mh
 Pq+A==
X-Gm-Message-State: AOAM530maXEP60O9467+dfhFSaWsyy4wznmT6+Q4k9GDLnkrrklBhlh3
 D1JzsityDywacRQRwaG65i+WssqzC+QAQfjpPgLZmg==
X-Google-Smtp-Source: ABdhPJxXNeHLvq1jthrgnSiMGdLSi/q1RSJuLmYH6X8CEHarjex4lcuICVkv4bT5602dkNRgGK3YDDAIvZcT72K0BYM=
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr11355221ejr.482.1607698379281; 
 Fri, 11 Dec 2020 06:52:59 -0800 (PST)
MIME-Version: 1.0
References: <20201208122306.8933-1-leif@nuviainc.com>
 <20201208122306.8933-3-leif@nuviainc.com>
In-Reply-To: <20201208122306.8933-3-leif@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 14:52:47 +0000
Message-ID: <CAFEAcA97VzikoPsr-mqPWbeRVLMS=a51hzS8sDNjQOZYJymo4Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] target/arm: make ARMCPU.clidr 64-bit
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
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

On Tue, 8 Dec 2020 at 12:23, Leif Lindholm <leif@nuviainc.com> wrote:
>
> The AArch64 view of CLIDR_EL1 extends the ICB field to include also bit
> 32, as well as adding a Ttype<n> field when FEAT_MTE is implemented.
> Extend the clidr field to be able to hold this context.
>
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(checked that none of the uses of this field are implicitly
assuming it's 32-bits.)

thanks
-- PMM

