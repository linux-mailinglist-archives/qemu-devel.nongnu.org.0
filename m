Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D746C2FBD43
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 18:14:07 +0100 (CET)
Received: from localhost ([::1]:60800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1uZv-0002Ev-Jb
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 12:14:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1uTs-0004pm-6g
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:07:48 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:37631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1uTq-0004Mk-EV
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:07:47 -0500
Received: by mail-ej1-x633.google.com with SMTP id b5so13116224ejv.4
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 09:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5X5r7WJa+XVSX3DxTy0uivshgXFWba6je8SNSjwNWiA=;
 b=wjbV2mEUaOSKa2Iw+ywGM5gihj8z51nig4Q0DsaAzdGQJLLoayWKoxjoqkqZ/jB/eR
 1ugkhEJe9ccFu4jZV9/C4Bky+wQdkJ5rUjH1Dk2YWLMQcYVqPf2hKXLNkfV9DBaqzWiF
 plfLw0/5get/M0rFMBrhYWN2zcB5PFSnjc42GY6a1u391AawXHifpf3Aj9/VL8J02+ba
 fRMoxAlLKp5Z9hzm1ajqt9w3WglGKrXirSwo3t607TM9K1RLaR3oWxL3Gu0cEwsiKtL3
 7f9qjEtdin+7dQ8GCmT1aJIvLL9xdmV1qzC+dSLrDtV2PtsL0iatBMB0eWboXw/ABPe1
 EiWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5X5r7WJa+XVSX3DxTy0uivshgXFWba6je8SNSjwNWiA=;
 b=ZZ6xESphcCcMXasUX7kixLh7S9XaKZv8LHxt+mhNin4J9viWejlG7ad2FGLBbE8afh
 nmPRochBzHZxz58BgiA7HnSOTDNF+IaObTM7Kp5AE2ofnLzmbZbk+Hk+/tArAAIDgP9O
 CcenqFK3wzdxFecbMraLCP67g67xvhJzpFMWDOfKWEC7gJ/nPVvw9KhrCiryoiWXt+iA
 WiF2pd/GqvgNDJ47txcrFkw2CqtPpCEfZEiP6ZLaot1SGmUJeOAr0fxjMKqIJFMzQBCG
 rcDasMS5X+kPTLc0+ib1FFpUMwWzh9zTx/Flc0YaVGMTkB6cipc+QeE8p84i+VHzntUf
 F7Bg==
X-Gm-Message-State: AOAM532mjNKjeX6dcBsgntlD0siPUedLsmxHQndElfsnuF0fkIjRuujj
 oe+RgYdAupLMnBh4fk4XpWp63DGRh9VITkeIuGWmmw==
X-Google-Smtp-Source: ABdhPJxZT5iUOssayq/79M93qEurmVdgkpieRmcEgBNziDe7SLJeVFP0NFSMhB1gkciEpfKureNKRz03sVoamHPioUE=
X-Received: by 2002:a17:906:4bc2:: with SMTP id x2mr3551386ejv.4.1611076062944; 
 Tue, 19 Jan 2021 09:07:42 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-16-richard.henderson@linaro.org>
In-Reply-To: <20210115224645.1196742-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 17:07:31 +0000
Message-ID: <CAFEAcA8Nin7uEFHMT_zAgJU4bbAbHktj8mL+8WoA7cbX3j-yqA@mail.gmail.com>
Subject: Re: [PATCH v3 15/21] target/arm: Split out syndrome.h from internals.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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

On Fri, 15 Jan 2021 at 22:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move everything related to syndromes to a new file,
> which can be shared with linux-user.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h | 245 +-----------------------------------
>  target/arm/syndrome.h  | 273 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 274 insertions(+), 244 deletions(-)
>  create mode 100644 target/arm/syndrome.h

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

