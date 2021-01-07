Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 065672ED5CE
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 18:40:38 +0100 (CET)
Received: from localhost ([::1]:57664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxZH3-0003t9-1w
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 12:40:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZCn-0001bD-TB
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:36:13 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:38291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxZCj-0001ub-QC
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:36:13 -0500
Received: by mail-ej1-x632.google.com with SMTP id 6so10829119ejz.5
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 09:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yuOB9tqQjb61ZPMnnWLNy4JELHe6K52csDplIZjXnCE=;
 b=R1b7J6ni4WQoh/8iEOLNJrfmEygVtqIdBzurjHHscwtL/q0hbunA4dezsDzTNA++zJ
 pucQ+jEpil84zvhdZbV0P9uuJk0T1aKCS3cMve2LexBF4NOEwv3NQCiHZiqNuFl1DX2U
 5IRXu01CvuI4fA+kb374FKwCDfp8qoD1MNV7IduJLReBuqp2s1OFmCMNxdcB3ZlAVZAT
 CctJPWbeIbQwJP9a0c9B4xaiJa8SCJubqZafShH2uJrJyu4EIr6lVMFiicWvsxxkmWeN
 RHSbtEf8EqqTCBLEhA5JvB4RYcU2X5MrtkIIwtqSVj7Ul/AsRrt1jHEqTHUtfJPUkPmT
 FT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yuOB9tqQjb61ZPMnnWLNy4JELHe6K52csDplIZjXnCE=;
 b=GqZ4OnhTjvngfZPfdcpkGY6KzmRYdF2JyRXdp4ISi5+0burro6lgsNdv9ijt773nOQ
 Osyn6sLt4xGEYhPtvYhRXi8b/Xrwo06S7hTSBIIMwqBK1ymrVt+4uDVro+cGa//TjS/C
 a6DLvnAiEDx6sGljxiFerkwSHRqD5TJHbj+jfFYix3/WijneImV5HSuSN7ur6TYKwqxW
 ui2PGDQFpktReerJtK3n71Et9lYuRBLONHYp11euYZqtlYpeAJJicET+ajbxVcVcs0iL
 8e6NxaqqOl+HS5f9sbr59MraBRXIYZ27GYNtdaH9bZs+XW49tBe4b9np8iqUN9EFw27z
 RMlQ==
X-Gm-Message-State: AOAM531mPZbv3gJaubHly0+dm6M5lsBkn/gZbzrPu9IAKW+dj1GXhyzo
 GC0JOHU7ZsHlAxd0SpUE6ay3hBfh1HG8U+vy3YSrbw==
X-Google-Smtp-Source: ABdhPJzkCz4GCt0mMsCKO//3l0vXXv2GPMhCi0DisDsgOnoNbntA/xz2w7bSpJbixaCyb2YvsrdUYsb6GXGsBXZVzkY=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr6994606ejf.407.1610040968058; 
 Thu, 07 Jan 2021 09:36:08 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-22-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 17:35:56 +0000
Message-ID: <CAFEAcA8j-SHEA00ev9P5spUEz=gKB=bxxj_M+gsPR+RzisZm1Q@mail.gmail.com>
Subject: Re: [PATCH v2 21/24] target/arm: Enforce alignment for aa64 vector
 LDn/STn (multiple)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

