Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 780213AEA45
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 15:43:00 +0200 (CEST)
Received: from localhost ([::1]:35320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvKCZ-0002SW-Iy
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 09:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvKBc-0001iK-N9
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 09:42:00 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:43786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvKBa-00050B-TI
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 09:42:00 -0400
Received: by mail-ej1-x635.google.com with SMTP id nb6so28769427ejc.10
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 06:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GM5Uv8E/zOlgYaajNvsvjJRvBhV5LPgRsy/cD+/0CHA=;
 b=xuMEEru+Z8kIWKTCSCmXa8/SIoLJsFqBX1DJEoZgacBe/WKCdwwrYGkYKfHaGsb+KY
 TggEn/jMfdi/P/G35A/4vb8RQssyvqADfuv/LqX0xKwyBoIZu5SuS53aNf5rRqOIZcEr
 wzzgBKUOVgc4LZkFFn0UeU7CU5nScQUf/aixrTw7Qm49zcJgBODT+HbZerdaL1atNOBA
 Uwy56Cyuwokuj9PncDdWVd02Ceb5JZlVnhOW6dymvL+kFgXXP834pRfPSJl/loGxcJ7w
 adm9kyicRENL7C7wAB7WQIft3gYyJHl5r3vZ8x8JoU+SIovSHASfKshtKcXpcWcZ7WOU
 VlYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GM5Uv8E/zOlgYaajNvsvjJRvBhV5LPgRsy/cD+/0CHA=;
 b=QhQyPLsLFcA312LycwOfdHe/Scsy0rLobigfS4Z0SyCTFxeRoGozC4jan7749bwtWI
 1SWasm7MVwrCVwYUjJIiUGIVwh8E1jiAnxT9VV2qLKXglsQERFegJhmn1t3Q3ZVP91lP
 sOQn3XLnAm7+sQhujS91aurxzuRPpiVD+VfUxB/TgRffwPvPsN/HQFdL7sKI6TDJxGIn
 CU/oQN2LQOt+vjGRNAh/L1PeOsGbBaogLsz5lmZhFMN4NRpJsxe/dcqDhFEtO9xAEjrZ
 G68Q1MWt62S6XT5wwmPmEWXAfNG3Pzf/0S0qMdyinxIw3rMvYh204Suw8GDnv1d3EQyQ
 8O0g==
X-Gm-Message-State: AOAM531+Jl7hipLZBtGhFL9oWcH38UwlcmOGZgUJ7WrjSulls75Sl+D/
 3lJ+jbHa2bWgm1OwnrXluXwB5+RjwbLBXtZmyeH8KQ==
X-Google-Smtp-Source: ABdhPJwNzXFLm0ZIDtccahdcW7IPCGqrkocAhSSUg2TDhcXTF/xwdwHcxDgQJgSBWhGQxqtLdh1bDgWtos+jYhsvLY0=
X-Received: by 2002:a17:906:a38d:: with SMTP id
 k13mr25503198ejz.250.1624282917384; 
 Mon, 21 Jun 2021 06:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-2-richard.henderson@linaro.org>
In-Reply-To: <20210614083800.1166166-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 14:41:21 +0100
Message-ID: <CAFEAcA9ktX0famPUabJ3J_nhBp7CHOzd7S_auHEML7kPi9Yysw@mail.gmail.com>
Subject: Re: [PATCH 01/28] tcg: Add flags argument to bswap opcodes
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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

On Mon, 14 Jun 2021 at 09:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This will eventually simplify front-end usage, and will allow
> backends to unset TCG_TARGET_HAS_MEMORY_BSWAP without loss of
> optimization.
>
> The argument is added during expansion, not currently exposed
> to the front end translators.  Non-zero values are not yet
> supported by any backends.

Here we say non-zero values are not yet supported by the backend...

> diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
> index dcc2ed0bbc..dc65577e2f 100644
> --- a/tcg/tcg-op.c
> +++ b/tcg/tcg-op.c
> @@ -1005,7 +1005,8 @@ void tcg_gen_ext16u_i32(TCGv_i32 ret, TCGv_i32 arg)
>  void tcg_gen_bswap16_i32(TCGv_i32 ret, TCGv_i32 arg)
>  {
>      if (TCG_TARGET_HAS_bswap16_i32) {
> -        tcg_gen_op2_i32(INDEX_op_bswap16_i32, ret, arg);
> +        tcg_gen_op3i_i32(INDEX_op_bswap16_i32, ret, arg,
> +                         TCG_BSWAP_IZ | TCG_BSWAP_OZ);
>      } else {
>          TCGv_i32 t0 = tcg_temp_new_i32();

...but here we pass a non-zero value...

> @@ -1661,7 +1662,8 @@ void tcg_gen_bswap16_i64(TCGv_i64 ret, TCGv_i64 arg)
>          tcg_gen_bswap16_i32(TCGV_LOW(ret), TCGV_LOW(arg));
>          tcg_gen_movi_i32(TCGV_HIGH(ret), 0);
>      } else if (TCG_TARGET_HAS_bswap16_i64) {
> -        tcg_gen_op2_i64(INDEX_op_bswap16_i64, ret, arg);
> +        tcg_gen_op3i_i64(INDEX_op_bswap16_i64, ret, arg,
> +                         TCG_BSWAP_IZ | TCG_BSWAP_OZ);
>      } else {
>          TCGv_i64 t0 = tcg_temp_new_i64();
>

...and again here...

> @@ -1680,7 +1682,8 @@ void tcg_gen_bswap32_i64(TCGv_i64 ret, TCGv_i64 arg)
>          tcg_gen_bswap32_i32(TCGV_LOW(ret), TCGV_LOW(arg));
>          tcg_gen_movi_i32(TCGV_HIGH(ret), 0);
>      } else if (TCG_TARGET_HAS_bswap32_i64) {
> -        tcg_gen_op2_i64(INDEX_op_bswap32_i64, ret, arg);
> +        tcg_gen_op3i_i64(INDEX_op_bswap32_i64, ret, arg,
> +                         TCG_BSWAP_IZ | TCG_BSWAP_OZ);
>      } else {
>          TCGv_i64 t0 = tcg_temp_new_i64();
>          TCGv_i64 t1 = tcg_temp_new_i64();

...and here.

thanks
-- PMM

