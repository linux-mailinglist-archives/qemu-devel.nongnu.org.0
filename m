Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A784DA207
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 19:08:02 +0100 (CET)
Received: from localhost ([::1]:54068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUBaT-0003Zq-Dx
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 14:08:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUBXI-0001fF-2g
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 14:04:44 -0400
Received: from [2607:f8b0:4864:20::b2c] (port=40795
 helo=mail-yb1-xb2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUBXF-00084S-E9
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 14:04:43 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id z8so66414ybh.7
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 11:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AOMr+XdYiP5/I68wcT4SaN1Qr9IFxn1qG8JehcCtBN0=;
 b=vt4yU6OvwR+fbnbLwYTcpgOaJqle9xKGpYke075A3R/SG2jTMPadpGRnVzUSupsd5L
 IyAhzJNrVwYirC8SU/qj7v9nuaRlaDcneu7PkKvYI0Num2hZKEIkEquyPZFyhTi5f2Dn
 PLCMbrEZ+5YhYUSP+b+3dyVtWaUfFPgKEbGgM3KB1BxUOeOoIScPJ5OFLvYEEy4LQVSf
 XlZVoY2/LqUUlSJ4EOHs2d8YlWFqGHWMqvKmR7OxG4ly5mejP6UoPeYrjX0sGBF7nJIi
 DgJpLvUop9YCCPA0yImMvmgthDLNgB5HKrQGfhBVWMGEBN2wtrExkGRC5fOjL97F0WeA
 jX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AOMr+XdYiP5/I68wcT4SaN1Qr9IFxn1qG8JehcCtBN0=;
 b=isA0O8bq70M8jDMz4IvD62jtuxr0xzWezRboW+U1ql5ManM/GuMm91PmeThPuwUg89
 MBUTaSijlWmGgRN+Xug2PP8LFDM2O+74NB0CwkNP34wtk1n7WesQtRPV+c0etVAYmPW/
 MYTW4xJkAQSmmTCSwH27KMLsre57DVMFLB12oRvpQcAL9N0gNVp57vM8wEZqeNDDM/S4
 hWaLtpoZjgG2E78JhnvCIsQFoYdO8iCKf8r+vOZ+BR7NIBfAACsUyvKKndqZM8mAPiLe
 K008IuRXSjrB5WJnkVbTfNbEGTYXBXm9SNztDOZP5ApFQ8VedDhv601YhZO0VZQIhuGm
 lunA==
X-Gm-Message-State: AOAM530NGwSHBENrklHnQ7zo2emB7VoAcZXjQ599JECMVTduZnjDwsUw
 +JJj2LnYFMj1IQplvVvvimqCdM6nR/mYqa/pn5By1A==
X-Google-Smtp-Source: ABdhPJxrezIFftCieGJ0PswZbUInjzt50cHpsZwKZ0PdFN5SQOucEP5yDMdpv/DVEn+LZGx8QDei7vC6SJG/VrXUF8A=
X-Received: by 2002:a5b:745:0:b0:622:1c46:3c19 with SMTP id
 s5-20020a5b0745000000b006221c463c19mr24875421ybq.479.1647367479921; Tue, 15
 Mar 2022 11:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220315021205.342768-1-richard.henderson@linaro.org>
In-Reply-To: <20220315021205.342768-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 18:04:28 +0000
Message-ID: <CAFEAcA8dbf7PwgH0Wg=HR6DU5jpUOBeMneNGNdMwaWG893sfOw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix pauth_check_trap vs SEL2
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Tue, 15 Mar 2022 at 02:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> When arm_is_el2_enabled was introduced, we missed
> updating pauth_check_trap.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/788
> Fixes: e6ef0169264b ("target/arm: use arm_is_el2_enabled() where applicable")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/pauth_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM

