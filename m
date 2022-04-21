Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 516F250A8E2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 21:17:35 +0200 (CEST)
Received: from localhost ([::1]:39676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhcJ4-0001sP-6W
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 15:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhcCS-0006dz-Rv
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:10:46 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:44997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhcCR-0002S9-F4
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:10:44 -0400
Received: by mail-yb1-xb36.google.com with SMTP id x9so3350819ybe.11
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 12:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kirLd6colEHDS6fjE+FyeSeo9mW7W1OMzaxGY8ucuH8=;
 b=MYYYk6L4Ons2kKKmGI20RbnB2Rz64Yz7y5iYxideH+015nzE33u1sC8PyZzNZSyEfF
 Bx7ylA7I/y/tq/J4rwxGHzgnVGFXeSPcg3s6a0AqZmEWltaSMWhZuYQNm5boMZxmHJLW
 b30TEb2Gmc0zt1bTigb84A5tIeSAUnYXLeRn9cU3zGsStGdJrQdA0Bdd3jy8xsBZyFpm
 wKl4mU8anrS8hwRObSS5PqERkg3HHU6SPaIeCH8xohYi4PB6Pp5Mr6NRXz3JSsdYpeYy
 AL7MVVLB1L0qOEkRlTg7r3GZ4lCQ27TaEgNeRNySecuB1hB9AUgcKnvT96IXKynFyfLn
 btdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kirLd6colEHDS6fjE+FyeSeo9mW7W1OMzaxGY8ucuH8=;
 b=vQfiacXYQWLRkMVU3pFDA6Q2AYt/Rmd0SP/fRI0OhPVI7zzwZURJ87q8F96QwWC9xQ
 J/4kEyuuHSsXmE9LEl7q7yzZf24mFfJnPmS908Qg2qPRE1Hh7MmaD3S282VeZhDFq65K
 9sfprfwZeAZgMpoqiQI5uG4SkKHocKy1pa6UJRe7aTHbcx/09960r0agEGfBXdoFHOii
 vrJwC4Wh/CvnZ7QjVdOGeb3Kk8bhvLqPuYkI2dy8QSeLv1RmZCuWsTPbdS049CBp1ZRH
 lYTnRTgc/FQ7zgu1B0YQpPb3yaUqysbX0jwyiSmCHkUaTZkb3GBXqy0dOncP4NwEESOj
 gZOQ==
X-Gm-Message-State: AOAM532D1bEkxGWJ8+Zmy8kZimyINzk8EC/ul7GtrEDSz6AliS4u86Fo
 F9Jw+BR7FdLPPhBrsV0vlcydV5jMVhR1MyosaWdUAA==
X-Google-Smtp-Source: ABdhPJy1PaoksO8lYiGSmacH0KuaATyRXl37sCft2qLfawMs41CUafqMu45OJQrynfnsqDYX6KehEPjpUXd61fDkBFM=
X-Received: by 2002:a25:40c4:0:b0:645:88a3:eb8b with SMTP id
 n187-20020a2540c4000000b0064588a3eb8bmr18558yba.193.1650568242319; Thu, 21
 Apr 2022 12:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-23-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 20:10:31 +0100
Message-ID: <CAFEAcA9hmYHKLAXM7OuW1p-=9Pmhb26V-+27OuLsVHcurxaXVw@mail.gmail.com>
Subject: Re: [PATCH v3 22/60] target/arm: Use tcg_constant in translate-vfp.c
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 17 Apr 2022 at 19:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use tcg_constant_{i32,i64} as appropriate throughout.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-vfp.c | 76 ++++++++++++--------------------------
>  1 file changed, 23 insertions(+), 53 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

