Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA0137FE2E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 21:34:44 +0200 (CEST)
Received: from localhost ([::1]:51514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhH6Z-0007fd-SZ
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 15:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhH5e-0006O7-Lw
 for qemu-devel@nongnu.org; Thu, 13 May 2021 15:33:46 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:42970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhH5d-0003c5-7o
 for qemu-devel@nongnu.org; Thu, 13 May 2021 15:33:46 -0400
Received: by mail-ed1-x533.google.com with SMTP id i13so2276686edb.9
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 12:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=42iItySau6MSPOAIBGtD7QOJ0jV0uP84/eMt9gv/qsw=;
 b=tmImfZl2bKPvr8GRPX4XrU/0ohShP5o4DPdQKArHviq1Gc7eC6lcgwRJXksXf63+e3
 IELE8q0FfbLpwL6tfY4nq+Kvtnpqp3M6lLSkOhxFQEpnN4Rl3KGbkBoZZ0oNeJi9cG51
 9+JlLDRtrXxYYTlEeGxzYjVciHzwR8WViqutAaIZPTFQ6hLOJVvRDHnXuABhV5xPeBh2
 lBTnskcBIxtmksguqGUk01BOhMjiAuWk8wTAMM4JCs5Vp6D8ytJ2TiqipiVQzyYuvLnC
 N7lsDaqS1KaLnQiK8hjyYw3ISjXFJSn193r6tbn69MdfdWeIRsyG810Ci843F8L6+bRd
 NtAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=42iItySau6MSPOAIBGtD7QOJ0jV0uP84/eMt9gv/qsw=;
 b=XxruNAu1U9Lc02TlaSe8DL9eyX1nCHN0fdkiJwGRrQiage8cUq5i1Wv9RAtpmDrYSS
 SLeyCY9w/li9A+IMcfbK/KNh8wgyHoEE2KTBCK7fcZyx1dyQlabIlHBKl0cpx/cqCrHJ
 Mmmuwf5OWXaTjvomitgxkVgtlLG9qKl+zRHs8B7ZJRX5ia2V+Z7dAikKOmayjWZ4SH+H
 28V1pqlK/JJMP5jn94wpiE+Pr0rfPSNhnd8Q5H88jPiB5JMsT0e05IEOavwkDc3izX1N
 h4rBzNqvX+DHzL7b7j+WUQwdSAuobfOIXfqO2GgEHYOrWmaC8RXRDhi1anelrFSv0wGy
 sdeA==
X-Gm-Message-State: AOAM53166EXkyHhitZDOzSeW2QpIqCNakpoU1cxl9Q7v0gBW5P4owpoz
 pYeK1seAQ46kJwEVSPCVFWDHDLoyt4VvhvrC82/qlL8zsMg=
X-Google-Smtp-Source: ABdhPJzvbsvdOuZ0x6dycCS/+8GIi4QdX2/f4zKbjiCBqRL2KWsDORbwO6v3M8KDupikmGuqXpT8UtpEmKeix3YyVPk=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr51359550edv.44.1620934422947; 
 Thu, 13 May 2021 12:33:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-82-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-82-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 20:33:31 +0100
Message-ID: <CAFEAcA8S47Vh55p57f2hpMMwnf=GK1-SZeZ4gBVX6uvNzPg9-g@mail.gmail.com>
Subject: Re: [PATCH v6 81/82] linux-user/aarch64: Enable hwcap bits for sve2
 and related extensions
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 22:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/elfload.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

