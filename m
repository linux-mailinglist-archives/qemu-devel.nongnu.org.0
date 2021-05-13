Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1637B37F836
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 14:50:42 +0200 (CEST)
Received: from localhost ([::1]:43734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhAnZ-0002fW-3w
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 08:50:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhAly-000182-2q
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:49:02 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:33450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhAlw-0000Wl-GU
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:49:01 -0400
Received: by mail-ej1-x630.google.com with SMTP id t4so39757877ejo.0
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 05:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Apevnu8jvdVEb+0EmtIqoZ5Mjd89LFHnS//xI4S+a5I=;
 b=hv57car65VJ8RWL+sQOTWEi2ebqYCYz+4EnSnSPgWa8kvH5vDy5QqIkFrQVa/DboMJ
 boNCFNhvyRioiE+UGC6tkUv7JtuaZleMml6VbZUzIudSlPqD7iyNb9XzPYEbPEAZy9uP
 h0MtUzdqGvlkVJlVCD/jeEAWh4M+of2Yx20I29rcIimvs6AxtTxHu+2Shd0A5MMWU6qM
 eFq00svEyF7y0VyOPaaEHL/DPt+7bwnqbZiUy4Ccr4sjEiQZQ9oFLJY8DSqey61b/XE8
 BKRtAx90xGwWMwdARhYWFq4yfJXhcH/P+GoQyD4iMKORjSODs8xAM/ruDbUYodCJ4/32
 MK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Apevnu8jvdVEb+0EmtIqoZ5Mjd89LFHnS//xI4S+a5I=;
 b=L7WIoW5PQMRyt+xGOVuQvMR75M45JqbmAecJ48T/DwEa7mZ6uUS0BBTLHZI98lEzpk
 P71CP+HQ0e9u65oZG3tbD3FRtAxOApjWUqezIlFkbdE5bJf8J+P90MBUHFJopjNv8uOc
 E5WpEK8u6ZtBjjImSOT5hJqR/uAhbpv3tLlrXc74ZBhoS8fHPxYyI5xXvtxwqp7vQATq
 iqBICX9pxr+AsAWj7CWqOIzYE3Pc1T5kjPyx/gOr8Pd/JEBarvXWnKSawBOF3aXll27W
 UACs1CS3aKgbrpumr6j5gaIoAPSvconrW3GfMSz8d/UHLVrbNShAFkQg3gml44+ODb1i
 ZO6w==
X-Gm-Message-State: AOAM530MyHHQxJNrlUgyZ5I3eKhIv00dvxw4BHfRe1KL69EA4ja3AL+S
 oGaynukmB4Hvdh8gOL98D8KU7WHeXTmlzcYK8fcGBA==
X-Google-Smtp-Source: ABdhPJwq36JNC9sqL4xy0dZix/sSpI9W18Bb5uQImS/7Z7LJCYtBU64SXgqYzBE3vK2/3Ne6In6psq0n6krtyiXAb5E=
X-Received: by 2002:a17:906:eced:: with SMTP id
 qt13mr43013204ejb.382.1620910138829; 
 Thu, 13 May 2021 05:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-58-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-58-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 13:48:47 +0100
Message-ID: <CAFEAcA98vdxXAmXJz9gjG6u1FCLqUacCwR4dRXX+UmcZWmwNRg@mail.gmail.com>
Subject: Re: [PATCH v6 57/82] target/arm: Implement SVE2 signed saturating
 doubling multiply high
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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

On Fri, 30 Apr 2021 at 22:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h        | 10 +++++
>  target/arm/sve.decode      |  4 ++
>  target/arm/translate-sve.c | 18 ++++++++
>  target/arm/vec_helper.c    | 84 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 116 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

