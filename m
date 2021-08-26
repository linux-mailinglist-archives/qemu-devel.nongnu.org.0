Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 477963F8954
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 15:47:36 +0200 (CEST)
Received: from localhost ([::1]:44318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJFj3-0000rd-CK
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 09:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFQY-00026A-Rj
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:28:18 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:44986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFQX-0003tZ-6R
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:28:18 -0400
Received: by mail-ej1-x62e.google.com with SMTP id me10so6232912ejb.11
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 06:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y0KkHSYVl7C+vp43dReA4vH8iDsv0muUrccBs6r/A8Y=;
 b=vItRLIbiqyyQlwfgmdEC8jBzCoqPahxwIF1bG7wNLre219Igj1TAxb9uXYQ7dvs+x0
 BrIXIqOoVqYy0wpF7AJS237zyb1VLmJnY85dJf1qeNGqPe78yt5w+H2jnPb6c9lIwmlB
 cXznzarsih0w3H7VOSUBc/JI8TG9wvF21pKgriJg1QL+uwzXJWLkZXvJ3UZ5ksOAlbth
 fVsKPU2kI9cEcCFXkmZi2DH/QUgswRsirLG/da8gytxPXe+qeA3nmHwUc3nUtm3mEjsA
 9z5vFtSkCj8wji0cUi1s0KZsYbrM5gzBuyGVXyM1anmtEQjXfHBKgKKuGjs5ufvFMgnl
 10jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y0KkHSYVl7C+vp43dReA4vH8iDsv0muUrccBs6r/A8Y=;
 b=J5mvl7eqUyCYmJeotFqsrS+LxMkTbOrlSh+s8gv312h5aNi9whjJ4kiHUT6KtpTfaw
 HxDEbJMiUPtrXkZMTX0HMMS4pN2MjoYaE8xlF5j+RCF8lGYtfW/wikZDiur1zs6wwDL8
 MOSvaY8wCE2slzMx8dyn3PCwUP4U/YEVCOqxO6Oe74N39HXY+8dTXB6KbhqGScExwPLR
 Km3X1A5YwZhq+XdHGPEVpNCU7sf4km1Mnmqc6+uyws/whD1UohhOEVjZ9oydFsu/OttI
 47/zS3iG+qXybuqq39qYqnySd+RaIZiag9QgKec3COpOLGjH60KiUd4jp2hV2AuGTBw+
 RYQQ==
X-Gm-Message-State: AOAM533zy0KI/EECO2ixEsvtUwDKpE3MacZ5SOpJbR4Bm9gsiFuQtU0i
 KJC3ugea5hrHxBB/omUYsY5H25KgQamd4Q8LQ7hz5A==
X-Google-Smtp-Source: ABdhPJxtjyViLF/qfI3b56kC8Y7QiOQZv6Z462kQ1sGl0GYLs7xFmZr+sYetKozAjh2rntlCHl6imGLGGeinnlF7zcI=
X-Received: by 2002:a17:907:1048:: with SMTP id
 oy8mr4215635ejb.382.1629984495354; 
 Thu, 26 Aug 2021 06:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210821195958.41312-1-richard.henderson@linaro.org>
 <20210821195958.41312-4-richard.henderson@linaro.org>
In-Reply-To: <20210821195958.41312-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 14:27:28 +0100
Message-ID: <CAFEAcA_YbTp58qNouq1xaa6uk_K+Hy9xzE=QXjs6YESrw2uEgg@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] linux-user/aarch64: Handle EC_PCALIGNMENT
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

On Sat, 21 Aug 2021 at 21:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This will shortly be raised for execution with a misaligned pc.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/cpu_loop.c | 44 +++++++++++++++++++++--------------
>  1 file changed, 27 insertions(+), 17 deletions(-)

I wasn't expecting PC misalignment to set the FAR (after all you can
get the bogus PC out of the exception link register), but conveniently
for us it does.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

