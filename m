Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B955C2503C6
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Aug 2020 18:50:58 +0200 (CEST)
Received: from localhost ([::1]:40504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAFgP-0001WS-RI
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 12:50:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAFct-0005gh-Ps
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 12:47:20 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:41226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAFcr-0000bd-Fq
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 12:47:19 -0400
Received: by mail-ej1-x642.google.com with SMTP id b17so4487091ejq.8
 for <qemu-devel@nongnu.org>; Mon, 24 Aug 2020 09:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=we7DWTsKaJs7xxQL4V3SZR8A6LK1d7yE7UlOoARrjjM=;
 b=yUcIXtQQt0K5HWmnRknpyi/ibzcmi0m4DcsouOriTS7bpF0Vt75afCtomLAHYrB0bO
 /BtyQVEZVKp4pC1oN5i0V8v1pD0eqeB5g2KE5a4AIdYgv2SVnC9A/SqXKD4c52CJtZl0
 X9s5yfYvSLKu/YC/k7osVJTVbEldFSyGCvhHN/tIhUUYVdYcX8phws/bq2stzXfsPd01
 0pXvEONER+WIQEswRqQ4fL0u5CQWyPTRq2qV8h2frA5YChd+zXJsDdXjcPvbDcgFpuKg
 IvdGonuxOOzXupQClSS51rQcn0cWW8QjEstCir/zGSnWpF2I6zqsj+OZD+EkqafJVfOD
 kM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=we7DWTsKaJs7xxQL4V3SZR8A6LK1d7yE7UlOoARrjjM=;
 b=lO8ZgANa9Es9IvKB1nKoXjr6eM/Q+umHBXE5KaXc4/asXrsM9qp4dezBzgQFVrTMwH
 CVUh18FJ9KCRqIZBgiVEYA5R+C+LotZCD1tKBzPa+YqzkroY+Ub7Fhj/by74zrig5GSQ
 xImmmy+i99dxVHIazOpxilg19wemhodNj6UiszdZ/h/uty0IWqJWUy9RcDfT2+cueGHD
 SRSUkggDJXkEfVCQwYOpFIyILrAXBNP0yC8oIsTahfd3lCX4F19b1nIVYwznXAuHm4nJ
 sbTTHiPX1HlRHkZk1hU+VoT7gCDXpRM5gdUH4NTn1Gwd1HLy0/MuYzBpm5DwcW8t3edU
 PU8A==
X-Gm-Message-State: AOAM530Du8DMcU0Qu8SYSppqsOaYkpUhXBiyxRw9jIG4Rl01MFrT/lkq
 Llw6O0iiS2Ga9rRHD60eziE2TOQY7+SVMtfbt5OgpQ==
X-Google-Smtp-Source: ABdhPJy6QNT7jSpHoDcZD+asateZ+41gd1kQO0WeWWWBvpyELOHT1gNxBK8HPepXb7Zaajf/qKA/QSulQXwJUp1GZrA=
X-Received: by 2002:a17:906:b248:: with SMTP id
 ce8mr6203960ejb.85.1598287636074; 
 Mon, 24 Aug 2020 09:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200815013145.539409-1-richard.henderson@linaro.org>
 <20200815013145.539409-12-richard.henderson@linaro.org>
In-Reply-To: <20200815013145.539409-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Aug 2020 17:47:05 +0100
Message-ID: <CAFEAcA8zaJdadCqOZY_3Bdf_vvEykpgakTHnx6q58NhJVT0crg@mail.gmail.com>
Subject: Re: [PATCH 11/20] target/arm: Split out gen_gvec_ool_zzz
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
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
>  target/arm/translate-sve.c | 53 +++++++++++++-------------------------
>  1 file changed, 18 insertions(+), 35 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

