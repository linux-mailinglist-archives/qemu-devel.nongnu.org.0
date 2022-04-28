Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED27513261
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:23:06 +0200 (CEST)
Received: from localhost ([::1]:58290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk2Ej-0006yP-3q
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1X2-0007TO-0U
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:37:56 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:41091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1X0-0000Lh-Fo
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:37:55 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2ebf4b91212so47910637b3.8
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kz+HdiI0QfviNhMY6kKXjpnlLpPvpgsn/wVsUMjvGEM=;
 b=cMZGanEigkbXh7cAmuEyG3OTwsJbdfx9/GG2/XTxmpfDiGPvCEL/8KaXCeGU86Kaax
 7bHrreWw22gfabbmZ8wPXQbEzqpqaSDIE30Vv+remOwDSnASjw7RdGdc5coV5YELEdxw
 O/kPS8kH/F9U57fki6xCNhZmbpdURgHwNAcJj4fQ6BSEwNalejZA8CZraDKdPkJmlIVy
 /9B1lsCApERPOyF/YwEUmbZcKn0kT40ZEqsSDXLibohMcfINsvJWLkoX6kJG5jTYRC1D
 u1yBYCbDk4wTr4iiTzBvi9+zLplZCrdM6hvMUJXwZrE/PPZsLPcQiTdqFbGI1l8RILaq
 jnHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kz+HdiI0QfviNhMY6kKXjpnlLpPvpgsn/wVsUMjvGEM=;
 b=XjmEbjyh44B+skZfepGmzWJS0zUqjL6lwXilV782ZL1VH9x+/d5b+qmEjj86Qu6ymK
 ggsRJMGlsvU66kMNFFlKqxbs9F79PZkeFnFCi+MqgigU5qoYtS9B/DKkWjWKDqCD+eck
 FFAE8ORYPVK51+kLwndxHPYelQU2y0QkEuHjiip0hANEnevQrJImKkQZulxmuwpRsomN
 wBG5sW+1DAGaIDwW3HDK55rtjRMB9m4SkVumviu53KnyDBjMI723iQCs/N7Tx5VMK6UK
 +MzoaMB2zXurR1mnYs/5M5sJFQShaCES1eFC5/LI11+GkEKpaUTokFqylDYxwJnK4y/A
 qb9w==
X-Gm-Message-State: AOAM533XbnVoiN96TKwi699+fPuPs+N9Y81b63OB+/zN87tIbQoMR/YA
 XGhe8ApvGxmgNCy4fyGJMcqYkop7dLI2MIVcDxSDAA==
X-Google-Smtp-Source: ABdhPJye7pYsc0ebf8qnZovpvXyOvJxmHCvz51071r2y1u0g73ULAQQc605iMHkxQ7+6gJtN8LT8LEI/Faf5XJtKH0g=
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr31817056ywj.329.1651142273676; Thu, 28
 Apr 2022 03:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-33-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-33-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:37:41 +0100
Message-ID: <CAFEAcA9tRcXCUMvBaxLKB5L9J2wE0aQyuLMFjQngO2jraK__qg@mail.gmail.com>
Subject: Re: [PATCH 32/47] target/arm: Use tcg_constant in LDM, STM
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Tue, 26 Apr 2022 at 17:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

