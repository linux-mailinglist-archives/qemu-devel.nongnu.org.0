Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0C3251A46
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 15:55:54 +0200 (CEST)
Received: from localhost ([::1]:52384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAZQX-00017x-6S
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 09:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAZPm-0000cg-IM
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 09:55:06 -0400
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:40600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAZPl-00008P-2G
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 09:55:06 -0400
Received: by mail-ej1-x644.google.com with SMTP id o18so16652678eje.7
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 06:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XldCZ5MGjdzXmIEzDGEN+objotw701ryX43+R8pmGy8=;
 b=qpH49AJKtyXcMdTaPXMeWKSNcc6Ml15TaZ9EeZz/jzZzzoE7CFEDIBP2dLUApH1EIx
 7pO3DJOLQB84q4b6h4QjFrH1PYPwISWEOX1OWWE40qTAtJ8uRFqB60bhTDSZqLD7qRt3
 ul09/I4nTqSWlTJYaAI/7XbhO5hjvYx2GcryCiVdojiaRy3VtygmN0nhe0Goen11DEeL
 xFE0yNnY6hOHm6HLKTUPQd2qmMqzyVh7jT4PiGWq3xWeP16vMGG04V0+JqNeMJUtyuCV
 62NTUAcpk598dFlbs5BYDEnNXUSBiHAvPnrzqrP111bE+YiwYsmCAqN1B8DbTDIL6vPb
 X6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XldCZ5MGjdzXmIEzDGEN+objotw701ryX43+R8pmGy8=;
 b=Nl7AddYomYnOJDJXeX+U8SsAHyL576tDa9k+OCikP+oFx63MQa3vwZ2vq1t8kgcFAn
 n80Tds0jpjvvqcy1wA8ZPXmv+1gkNglnJDMG60W9augkNz15WVAHkoPmZHGp1T8igk8T
 rPT2lOhTj9zWSAQhZ1YzTiUDAHOOU93d5Zpw/UNZSErTrxwKlVKB31aMPUU0O/hL4qbz
 zPvXV4PckgaRLeb3pl9t9a2fgL8ibmgmMqmnicHDpeKS5ZKP7G7R8PllNNA1Q68ewdCm
 f2FsIz32pC/1QoCdvtEokcIVm26brJ6/D5RlGUdKTJsrmhVJQCwAktM0++J/mF4FNa3k
 JoMA==
X-Gm-Message-State: AOAM530veR10UiUzrXWtE23fRzSHRQla0YH7EXEL3v1e/Zud7h+W83b4
 D4JzcM3+byXrcKa6grBZKlBef5DwH2WlfgawuMVfHg==
X-Google-Smtp-Source: ABdhPJyYWTMxVz4Kh5P9BisMZcyyCOXKkrCkdy+n4BNzEF9XUgU8HFeYpYKNenFuj9gDkvynZq+W+xMBeqzrntex0KQ=
X-Received: by 2002:a17:907:2066:: with SMTP id
 qp6mr1599107ejb.85.1598363703602; 
 Tue, 25 Aug 2020 06:55:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200815013145.539409-1-richard.henderson@linaro.org>
 <20200815013145.539409-19-richard.henderson@linaro.org>
In-Reply-To: <20200815013145.539409-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Aug 2020 14:54:52 +0100
Message-ID: <CAFEAcA93_jsGh=jzmaE2P8r-Kra0ajDShCqkH_f5XVgL5_9sEA@mail.gmail.com>
Subject: Re: [PATCH 18/20] target/arm: Convert integer multiply (indexed) to
 gvec for aa64 advsimd
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 15 Aug 2020 at 02:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h        |  4 ++++
>  target/arm/translate-a64.c | 16 ++++++++++++++++
>  target/arm/vec_helper.c    | 29 +++++++++++++++++++++++++----
>  3 files changed, 45 insertions(+), 4 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

