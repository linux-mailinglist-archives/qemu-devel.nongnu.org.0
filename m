Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4A066E3B0
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 17:35:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHovz-0001LQ-6F; Tue, 17 Jan 2023 11:35:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHovd-0001Gs-Ax
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:35:17 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHovY-0007UI-Mg
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:35:17 -0500
Received: by mail-pg1-x534.google.com with SMTP id 7so22394904pga.1
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 08:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RclzfAiU1ZpvxReTClc/CHw/DlW2osGciWtv8v+2tSU=;
 b=V+O3W5C+dkfJSp6pAe74BCFPMnK+bhyjqIZu7l7fp4v/sM7Y5rXUi4mq74Hp2jEaoI
 +GOghMtZspXlvzCTVEiP7SEpSNWRYPLJbiPhuZtQKqCPYR1OzkPSNTS7qECCGFUbpVEk
 WTLPXZ7gEX4msoNAxhjYaT4L7izGDL38Ov3x66gfDXrBapSfnWg79OwJUK6QhdXzWAax
 dGjSOLrwSTRtN0P3loUsQq0S8PlUyS2JVmB4K83xieM4UA5sx2zJF7XvfcslWmUhAlXI
 GJzctbpSCDA73/tc6QpEXAj4tWObLrMy3a267N9rfHpN9x48DqhWPm7wj4BiYW9gP4IO
 sz/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RclzfAiU1ZpvxReTClc/CHw/DlW2osGciWtv8v+2tSU=;
 b=W+SSQX7fWgjs3DaCrBItkKVW5XizQ5o3YKRsHNaV0ah7awJ+DWbEUMj/jFGZhymtLe
 vfKgERugqtrAlZem73l8Dx7zoamwAQf9Z+BC0T5kghZN29rud8voEEjcQ0brYH2wyNrQ
 klhWDovA0T4u/4km+XV7jVUvsLOP2mBUtEq8LIDcBgYzF4JvU1IOWUdTDJEupnwnJoCp
 yzoF6OkmU0ARl1CUEpZ+IKvtlrlW1yD7gbWOKiGgs52WB3zkEspxYqrkvpZzAT7dwO1M
 EzjLt2Epf7m4xgfmZkFt19mbHnXag+S12C36JZeuW4L8IqTw2MbVB1VLEY1PBftDztZj
 PL4g==
X-Gm-Message-State: AFqh2kpFfvEmK2pKI+iAWYpOpFdRNA9Ie0ul+tmfgqW0qS6Er6o5bnsy
 O0Wx6XFnuSZhwvGzqtPZq7sKDcvR5UFVcpJBAcMswoD+ieb1Gw==
X-Google-Smtp-Source: AMrXdXu7s41NmhwsUUQRF4NSpLzKlRhwnZ/En1k+bkP6jTLeTjqdAhhLgVkncviP11TriyuMgxlsgnOp9CBAVKC7I3Q=
X-Received: by 2002:a63:510f:0:b0:477:86c1:640f with SMTP id
 f15-20020a63510f000000b0047786c1640fmr300492pgb.231.1673973311424; Tue, 17
 Jan 2023 08:35:11 -0800 (PST)
MIME-Version: 1.0
References: <20230114031213.2970349-1-richard.henderson@linaro.org>
In-Reply-To: <20230114031213.2970349-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 16:35:00 +0000
Message-ID: <CAFEAcA_qZQoN6hMzA_eLo0Cz=Mu_NP1_f2p31N_7mzLLg-TezA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix physical address resolution for MTE
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, idan.horowitz@gmail.com, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, 14 Jan 2023 at 03:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Conversion to probe_access_full missed applying the page offset.
>
> Fixes: b8967ddf ("target/arm: Use probe_access_full for MTE")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1416
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/mte_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>



Applied to target-arm.next, thanks.

-- PMM

