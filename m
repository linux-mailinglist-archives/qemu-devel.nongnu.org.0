Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA0437AB87
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 18:11:05 +0200 (CEST)
Received: from localhost ([::1]:34498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgUyO-0001kB-9g
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 12:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgUmR-0003JU-Gy
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:58:43 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:40927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgUmO-0003V6-Td
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:58:43 -0400
Received: by mail-ed1-x536.google.com with SMTP id c22so23481314edn.7
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m6Bl5/tCat11GY67rSTxhzoWDxtPd1qovms4W2Fq9Dg=;
 b=fVAl6+nwotzd/A1Y6etjaW/OSowRGP1JJ+fbNIG3KxRW8HxDrHzeZnt0nVJPFspbBb
 OHPLqbOVsHv/xSj+jwNJmzVuhZgnVqIRLwGBArdyI6WKmHJeN+r8KZ9Q20cMkgS/hQBT
 g4frAfxZie2pAo4Dn60uRcbr69rxqfuThdVWhh0uqgCI62TPJbOc39c4XIaZ8KucbfTY
 c4uk598ZkhYSke4+1MhRkOlOPUwLazSdhdnrdYyWUYsBZUEYFPdu/+5yPbiq9Uq2usMw
 +PNpVRs9O3QfhxjJNE3jPXOAfw4UWm7WX6wEFU6DzVNhg8KykNZceHYzkNIcfaejHE/s
 KfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m6Bl5/tCat11GY67rSTxhzoWDxtPd1qovms4W2Fq9Dg=;
 b=s4j19k8FL/wRtkgEYocV8QVIv+U3Gg0EYnJmZG7W4Y4AAQ1BxqlsDnIcPhZRXrI4mc
 n1gSFXikzc9DaIcOY4YxolNGc0hojKceygUOIKh9ulEOajj22mZbIdp3eEfjgWF17AwJ
 t/BebiV0HojcAgsmWE/Cd9bsBIDqMENY5wEQNyYLhfMBPh60CUs4d9UVUHsnsRjnXaSN
 2MOGFX1GAJeN7j++P0ov1bda3h4akTS3pQDqx8yiX9XEvN24dz63X3MDv893RGsWxUff
 pf4bxUTuVBJYVGqHHNg84JNyhsBnLnYxmUAEc1LAJTA1gX39aAryQ9vnwR/DXAuFg8hA
 G7BQ==
X-Gm-Message-State: AOAM532dBO7igC/cFkg81rDZju5NM6AyCmcVWnHoWLzCvHeZKY7QaFwP
 y5N7+5tjr39nJUTcBBUDo/WJrVEy3zKxVOnyzB3xcA==
X-Google-Smtp-Source: ABdhPJxgiE6DPPGs91rXoZQiEZBwC0i+KAkf6xRssN+4TnckDCzHvrf6IZuxdYOLjlu826jtZeX6rvfkhITPOUWy9fQ=
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr36814015edd.251.1620748718521; 
 Tue, 11 May 2021 08:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-22-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 16:57:26 +0100
Message-ID: <CAFEAcA9wT3hJh4PGO3BRHbSf+kST71DWT4_2g0Y_UTLHoe-EYQ@mail.gmail.com>
Subject: Re: [PATCH v6 21/82] target/arm: Implement SVE2 bitwise shift right
 and accumulate
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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

On Fri, 30 Apr 2021 at 21:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve.decode      |  8 ++++++++
>  target/arm/translate-sve.c | 34 ++++++++++++++++++++++++++++++++++
>  2 files changed, 42 insertions(+)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

