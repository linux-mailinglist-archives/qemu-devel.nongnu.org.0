Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9DA36980E
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 19:13:50 +0200 (CEST)
Received: from localhost ([::1]:49302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZzNF-0008P8-KR
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 13:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZzLV-0007co-Lm
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:12:01 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:36697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZzLU-0003VQ-4l
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:12:01 -0400
Received: by mail-ej1-x631.google.com with SMTP id r9so74925331ejj.3
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 10:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V1/Z7NzxToULFyFZY8mmaKqjlH2kxwusr4i8iKPtwfM=;
 b=W9hIDfxuMx+9VAS5pFtwRcSLhVEn/u0CecopZo+xFs/QeaQhFwHBLljfH1XcLMwhCr
 30YqgCA+4jGmFT51dFyGm2N4b9G0lrLeb1UFnnVFbXFQV3NNjXLvoBI0x5yiYtmkfsQx
 TOFzd+WMaeMOjTfZ2lzgNorEPC5hDPego8SEC+Mvbru4blkZ40ASR6jY31a5qmjC8TVu
 SHC/dHhapnw4ncSYseMi8U6tDWh/rX0zijqZP8OBtW6B4WZg/N6dvLdYh3kqaitDYYqO
 TQjp/HeaJVTSjfBblwpJhvMDBi7CQr59ZTUSYWpEtf7ifKwqY7eUbqExAVVDtDVrsCWg
 hHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V1/Z7NzxToULFyFZY8mmaKqjlH2kxwusr4i8iKPtwfM=;
 b=nLe7Gb0r2z2icJU5173sTZep67ptKmoYojXcsknkQoZtczwgV7KRMemouvi1vzJYXA
 ew5W360ta2QrB0nHoaCmuh6ll+tARflGnAJrs2irSXhznaYAgyHfj/U0yLs5bNxJ8Ruu
 9dt6dS6cUvXnZfqK+gsAH4ixMp3+cb41msQ/Cw/xTTdFb5J9v7nODasN3mCcut3SGc0/
 VV3YJUJgGbHcgsrgoPm8d1bw1+1JqoYihYaLOK27y9Wqpv7RGZFOp53TUBwk8LaN6EPf
 NCHqEt3mWAIIY7/5AOM708aKIXdMv3Xlx2OYL1PD7qkdHmVbv21wSX31/12+PzvYOsFH
 WF2w==
X-Gm-Message-State: AOAM5325uelPpyYb/8qGkXE+SKExfDWvTJvAkwoI4n+REdAKBw2QMCrU
 ppMKBxi/bx4EZ/EF9GkUKyeeybW6a9HTzD5gEnKPJQ==
X-Google-Smtp-Source: ABdhPJwEkU6AUaxQv1URw1IXqadPp6qLf2ukfXP7DjLzkPPH8lcjvTUy5i2OyGIUfk0wS2PXVYvzvK3Q/6SFOEtVO70=
X-Received: by 2002:a17:906:29ca:: with SMTP id
 y10mr5478471eje.250.1619197918339; 
 Fri, 23 Apr 2021 10:11:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165413.338259-1-richard.henderson@linaro.org>
 <20210423165413.338259-4-richard.henderson@linaro.org>
In-Reply-To: <20210423165413.338259-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Apr 2021 18:11:02 +0100
Message-ID: <CAFEAcA9orFRnGEvmT-VJgRUMPVLesOkVpAdByfMK=mwecCGUyw@mail.gmail.com>
Subject: Re: [PATCH 3/4] linux-user/arm: Do not fill in si_code for fpa11
 exceptions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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

On Fri, 23 Apr 2021 at 17:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There is no such decoding in linux/arch/arm/nwfpe/fpmodule.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/arm/cpu_loop.c | 26 ++++++--------------------
>  1 file changed, 6 insertions(+), 20 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I wonder why we put that code in to start with...

thanks
-- PMM

