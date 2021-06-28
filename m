Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB24F3B65CC
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 17:36:03 +0200 (CEST)
Received: from localhost ([::1]:49050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxtIo-0001K2-Gy
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 11:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxtHK-0008Mr-6U
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:34:30 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:35784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxtHI-0004rk-GR
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:34:29 -0400
Received: by mail-ej1-x631.google.com with SMTP id gn32so30734546ejc.2
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 08:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kux0d1wTMHYXRUxomYRGZP/KTkhV4tKoCw8MTjQiMqY=;
 b=SycLbKTYHBh+RKCqjiyEDLk7obwXHG9fWMtDS6K3/Nc8CM2EomtttOeXZOyu4qt0Wx
 ILzXn2OjSmSgbrsUdeVCSUftSDYU9KaWPH7BVOczoAIBovE1uYY68htiXMXTRv/zgCqE
 qHOkhD/QsYhYI0AjJdp9OqYgh1csRJR78vbbToNi0fy/1nrgQUWfQCsoTU8onmMzBq77
 rlUxgIeg2RIN6Z4uBy06K+1ZncPeWV8jWKpEg0P169nemUGy6jM53aSSasgB1dJts9EQ
 19GHf9iXntzuuraxdCe3skF0gclf1sHvc57WpYC56YALD4e4u2WCJ3LDDMPfz2txmJ0Z
 KkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kux0d1wTMHYXRUxomYRGZP/KTkhV4tKoCw8MTjQiMqY=;
 b=aEwLDLFYTa0drO3aSoG0+9V7eyxsK7hr6qLz7qN578qZ61Zu8AQtFGtPZRi5dVlSxL
 XVD4cVKLzmaqR9T8XfF5jzHDRv4J/O7lUWUoKZkfLcigfpnThj8hTWwBtHL8kI1AJfyn
 TCNVu27XKSCm7eSiCSHG1Ei2iKEtP4BbG33yAcD4LnqqfPQJzrg+e/nzEQkvImog8zaK
 poTkZtjzqmgkKX+RSkAeqGtfkOB4a7PaioHznhuUmoBoQJa+2qtTeb/gnmntKDSONc1j
 /si9dWkeQMB3scFILpmLBkKj+qpJtWaYPKLHzoOtJD48JmHOr2aNtZU6ZdA3bxE8XKHR
 Du5w==
X-Gm-Message-State: AOAM532tWMNngip6NkDRcKYfuIhGqYBLUQJSLu3FLYD3Vw8dr6VSeV/a
 MDIQwivyUVRYLikCWHvnuHjW/ViXRCItk9+bCT5Lug==
X-Google-Smtp-Source: ABdhPJySGFfS6nyUQE04qGIWA5++s86efru1TBF2IYaYcVjt0k89CIxrLX3VIq/9N9QVuYQZhvHzvp8sGe19SU0h+5U=
X-Received: by 2002:a17:906:4759:: with SMTP id
 j25mr24632454ejs.4.1624894467045; 
 Mon, 28 Jun 2021 08:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210620221046.1526418-1-richard.henderson@linaro.org>
 <20210620221046.1526418-8-richard.henderson@linaro.org>
In-Reply-To: <20210620221046.1526418-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jun 2021 16:33:50 +0100
Message-ID: <CAFEAcA-1K-49LXG34LyagJaw=qk2o317uxiovGTRMyTwn4zG+g@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] target/nios2: Clean up goto in handle_instruction
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 20 Jun 2021 at 23:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/translate.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/target/nios2/translate.c b/target/nios2/translate.c
> index 31f63d9faa..276643cee0 100644
> --- a/target/nios2/translate.c
> +++ b/target/nios2/translate.c
> @@ -753,7 +753,8 @@ static void handle_instruction(DisasContext *dc, CPUNios2State *env)
>      op = get_opcode(code);
>
>      if (unlikely(op >= ARRAY_SIZE(i_type_instructions))) {
> -        goto illegal_op;
> +        t_gen_helper_raise_exception(dc, EXCP_ILLEGAL);
> +        return;
>      }
>
>      dc->zero = NULL;
> @@ -764,11 +765,6 @@ static void handle_instruction(DisasContext *dc, CPUNios2State *env)
>      if (dc->zero) {
>          tcg_temp_free(dc->zero);
>      }
> -
> -    return;
> -
> -illegal_op:
> -    t_gen_helper_raise_exception(dc, EXCP_ILLEGAL);
>  }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

For consistency, we should do the same for the identical code pattern
in handle_r_type_instr().

thanks
-- PMM

