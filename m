Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 247C4314329
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:47:45 +0100 (CET)
Received: from localhost ([::1]:58094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FJo-0003Ko-3C
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:47:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9B9s-0008Nl-RO
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:21:13 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:42113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9B9q-0004vy-II
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:21:12 -0500
Received: by mail-ej1-x632.google.com with SMTP id l25so9258772eja.9
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=juPSfYC7ErdTABCj4Vj+y+siuc2HCFkuqzcYST9OClQ=;
 b=Z4vY5BrtiATmQeK/YWarPwjzOHNIdp51ojkwveg6fY/A+fJsMu5Xzgyk4fvXKagwEC
 8egKqonhx8y10K0JC4pWEzhheD3WQ4TeSyNX/FL3rsQqwygbju9xzoQR0sv8Yb1Tr8xL
 PCBIsL7Npo1lW6cMp0SkCJfGDMlUFRLk97oR1GYCGjfns6Y4OjKk49GHCUTD2BVsERso
 HlV5rlv+l+tGxO27JpEbPwXl/+uF7YHZCP8X0vdRuZoX4762j16x79lntvRmt8emXUMp
 b2BjFhoog5xDpgOmaGZv5YQCqtF5WAV5NKhFjWkEHZ5NxtbOyYn1XTNetwxIeI+Uh2vT
 b2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=juPSfYC7ErdTABCj4Vj+y+siuc2HCFkuqzcYST9OClQ=;
 b=C/3UAF1ylQj50EoCOdpF4Wdg1srd8R2qyF6g8cWOFvPBT2FfZP2lY2ZbLaXx0T95XP
 Wjag9Sv26mQJGqhUcid133QIi4cKn97NsTEug6DzlzST1j+ywiWHHbroyA+b1VfHxK28
 Im9q/nqOPwnFMDPn1RpmNPXSP2GxM55RlZhnEfHwqxnA04Z05X0IRbmDYu7JvUIF/rJt
 FgP+G6fPs/rudEx6XiA+JE3aXAeeZYpCLQScwCnu9J6RPrjedMx63ZjlKQQZStpHg9Ix
 FMqnhxBXSeTVYVK/wf7jYENx+xv6Bpk3vPOVnKiBOBjsdPRwLOPNqxQEjdRxraOk+tqO
 Lakg==
X-Gm-Message-State: AOAM532wwXyyAOL6cWVJPYnMOdl/P/X5BGoLLx3rXRDXjInl1WXs7TOb
 2TeIXXbLOyeKwR+kLFSAeFTS1ZxPVjEryxqvddngVw==
X-Google-Smtp-Source: ABdhPJxJA9MziIzae5MohNueXwY6nC3nfCaSw8q+0fO8bzGZITUxdM6YAB5a4mX7GeNyqQI5DAt94A9uvFJNXRn9yRk=
X-Received: by 2002:a17:907:98c3:: with SMTP id
 kd3mr18324244ejc.482.1612808468165; 
 Mon, 08 Feb 2021 10:21:08 -0800 (PST)
MIME-Version: 1.0
References: <20210208024625.271018-1-richard.henderson@linaro.org>
 <20210208024625.271018-7-richard.henderson@linaro.org>
In-Reply-To: <20210208024625.271018-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 18:20:57 +0000
Message-ID: <CAFEAcA8iPZCOQ3u5iJk08eyzLgMKBeyzS4p8aBUgs6n1uxf7dA@mail.gmail.com>
Subject: Re: [PATCH v2 06/15] tcg/arm: Implement minimal vector operations
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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

On Mon, 8 Feb 2021 at 03:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Implementing dup2, add, sub, and, or, xor as the minimal set.
> This allows us to actually enable neon in the header file.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/arm/tcg-target-con-set.h |   3 +
>  tcg/arm/tcg-target-con-str.h |   2 +
>  tcg/arm/tcg-target.h         |   6 +-
>  tcg/arm/tcg-target.c.inc     | 203 +++++++++++++++++++++++++++++++++--
>  4 files changed, 206 insertions(+), 8 deletions(-)
> +    case INDEX_op_or_vec:
> +        if (const_args[2]) {
> +            is_shimm1632(a2, &cmode, &imm8);
> +            if (a0 == a1) {
> +                tcg_out_vmovi(s, a0, q, 0, cmode | 1, imm8); /* VORI */

Two 'R's in ORR.

> +                return;
> +            }

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

