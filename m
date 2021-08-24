Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B09E3F6495
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 19:05:57 +0200 (CEST)
Received: from localhost ([::1]:50928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZs2-0006ZM-2C
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 13:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIZrB-0005ln-AC
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 13:05:01 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:45676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIZr9-0005iD-IV
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 13:05:00 -0400
Received: by mail-ed1-x534.google.com with SMTP id g22so2306779edy.12
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 10:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=49XN8k/z8OFrV0pRGsjVOWiuJXB0U+Cy/Q+ylgRvYSU=;
 b=FxCQLLcDSYETwVMJ6+44hD+jBevhz6yfzmPX5HdMPOZxD6yXNKmuDePNwORtmDPFNH
 1Vp53zK2yd70+ZUjNzl9if4Gcks/DJHL0hnL53sfdPJLYaNvP0IL57IwxL01hFdGw9gn
 mzqC+qHps0VCLB0JMwXPc/mDXuh7/U43S5Kkn8WJNpETJ86/BupX0rvkj+cEJO9bocba
 Q5i4bcuYxia+zisYkMjq2cORxTtxyJ88sajI5FrsS1HBC8dRPq5wApkSsR0pkqmlN3Zv
 ZCLVP3qIoQbaFTVRK6P4jJhK0uuPtkjdy4BcsNVtGhJGumOmzX7hpeDzgH9LpeeN/IaS
 ruEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=49XN8k/z8OFrV0pRGsjVOWiuJXB0U+Cy/Q+ylgRvYSU=;
 b=uYWho3NF5YFxWwfs7MJTJUwMALyHVueOk3SRxbR1p7u5r5WhThqJ4RTTvy7Qbj5Ro9
 bkmsARw8+RbqjZhTmgv+X/21vlOZ6KXTwSBFyf0eQlW/fypqsnCQacoUiAFKcf0NxhLN
 LHJS6GuebPV+fbM+dLGp0rjqoWjQh6C4hsvdqaGPmDZKGXwY3srORjBIb5bto1dio57m
 SgcB2Ctbnb0+Bl32y6blrBHZKCNXOpDV7lZvbqivfwgDkFfh8iGK434ozLXHF0BjX5N5
 8w/NqbJtPkoO+x3203O0wkc6GSdxRAfFRlEsVOICTogH3P9u+3P50dX5/smGFDzfgv5n
 6Lig==
X-Gm-Message-State: AOAM531emdWLFmEO6RrVEvINeeKqjfMKWnr/EOBpi3WpXtAhG192oAEC
 L+HFbwaC7mh7yx6iwBjwleiOSHixnBC2KL+I4dWMBQ==
X-Google-Smtp-Source: ABdhPJzWq9+WpkVE4fyXPCYhJz+nS65Z/m1ehXd9htJz5Mr7fiYJ7uUpKOJppQu60rRDBmnOryXPOIdepHCaYtLblnQ=
X-Received: by 2002:a05:6402:4387:: with SMTP id
 o7mr43963243edc.204.1629824697926; 
 Tue, 24 Aug 2021 10:04:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210822035537.283193-1-richard.henderson@linaro.org>
 <20210822035537.283193-24-richard.henderson@linaro.org>
In-Reply-To: <20210822035537.283193-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 18:04:10 +0100
Message-ID: <CAFEAcA-HaToquNo4k6dVsqZwQf7hKNxWWzyrw91wtYvmpDxM7w@mail.gmail.com>
Subject: Re: [PATCH v2 23/30] linux-user/mips: Use force_sig_fault,
 force_sigsegv_for_addr
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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

On Sun, 22 Aug 2021 at 04:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the new functions instead of setting up a target_siginfo_t
> and calling queue_signal.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/mips/cpu_loop.c | 45 ++++++++++++--------------------------
>  1 file changed, 14 insertions(+), 31 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

with the usual caveat about documenting behaviour changes in
the commit message.

thanks
-- PMM

