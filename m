Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B42D41955C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 15:47:43 +0200 (CEST)
Received: from localhost ([::1]:46162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUqys-0002pn-3V
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 09:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUqh7-00042p-C9
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:29:22 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:42947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUqh5-0001E5-TJ
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:29:21 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 q127-20020a1ca785000000b0030cb71ea4d1so461232wme.1
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 06:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5ZbQOrNC/HD3OXRL5DZTul7F8vCypQqlOdA7uIxqVTg=;
 b=HqjUlJHPgwirGCNyCuKB5V27i3z3/fud1tXidsTkFTR9a4NtvEMQQQj1dDsWzFGHuI
 frrkGAzsU4SuDnt3i+bIiOnLWtyLmKZDcgi0fhsQqs/64A4lCvzXwj1Ijorhxh+LcoaE
 cbJQj8kZcsLi9iaNTE2VBV+8Sc8fmwPp5+/8oDwtJY6+Rpu9F2RWqrnHwTqpsQYw07+x
 +Ez3voN6ADnlntSIeU9ee5UR36ypK+kM/qMfutNwN5fG5fxbYpIAw72Vn1R5vcrfqrPN
 O4NFUjbrO68IpPl2YKuvgNLVi9rdyqWEcZdTgj0E1eSHoYanyGcHIAUBBg+wK/OEs0vE
 HjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5ZbQOrNC/HD3OXRL5DZTul7F8vCypQqlOdA7uIxqVTg=;
 b=4piHXg7w/8CynNKoPtVdOFj/rhE8cm+b8H4coYCR4u3X8R6gZUy/ZGvfERAK3B0qnq
 gLhmxcnYWqRRaGM21pMniWb9M+P2t4gGflPJbK1tsEFwrtnb7pTWomErEScmN6WM7ld9
 qOsbTlfPNwE1uKi4DnzcywyPAs54TUuntwQKXzg9e/XLPW0wReUM9imNEUU5/Oi8xuIM
 ocdplO0jNS6lWRa1UBRsMGoPDdkwKgC5SJqFrk//8+qhpsL9Dnfkk5Fn9TCM2+mB8cQT
 AppsJ/xOIADIdo08Iwm8vxLSer6xew7uYv56rJ+TbAHJghdzve1x1525Ebf/Lxgr3BbZ
 0e2A==
X-Gm-Message-State: AOAM530x8MyHreKcwgHesoIJtBM4nVaInhjLyrMUpkxAQHOHvhdAegym
 tOsz15qfHoTeSGuvZajf2XcjQOSostf+qoI4fIX02w==
X-Google-Smtp-Source: ABdhPJybJJ9M8jCR1Dw24FMBQruSAEH56YLOydHxvCAlZmLqGEoVBcywRPwERCJMgJqGvbkpo+oehrHRip/7TFxhYH8=
X-Received: by 2002:a1c:a54e:: with SMTP id o75mr72636wme.32.1632749357409;
 Mon, 27 Sep 2021 06:29:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210924165926.752809-1-richard.henderson@linaro.org>
 <20210924165926.752809-19-richard.henderson@linaro.org>
In-Reply-To: <20210924165926.752809-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Sep 2021 14:28:24 +0100
Message-ID: <CAFEAcA_W-gcQTscQkmQnJP0rcLAY_-8dvN=GHV9Cg7+p1P46MQ@mail.gmail.com>
Subject: Re: [PATCH v3 18/27] linux-user/nios2: Fixes for signal frame setup
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 24 Sept 2021 at 17:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Do not confuse host and guest addresses.  Lock and unlock
> the target_rt_sigframe structure in setup_rt_sigframe.
>
> Since rt_setup_ucontext always returns 0, drop the return
> value entirely.  This eliminates the only write to the err
> variable in setup_rt_sigframe.
>
> Always copy the siginfo structure.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

