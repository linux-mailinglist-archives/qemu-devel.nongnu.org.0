Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3893F62CE
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:38:21 +0200 (CEST)
Received: from localhost ([::1]:48354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZRM-0008DY-Cf
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:38:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIZMl-0004G7-R9
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:33:35 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:45868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIZMk-0001XQ-6m
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:33:35 -0400
Received: by mail-ed1-x533.google.com with SMTP id g22so2168971edy.12
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 09:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lnxIy5t0e/L9/ZOWdqIM0TQ6TSgPw7HWu8AqiHGieLg=;
 b=FwAYcFzzLUNyVKo8vEltWuP8neikFbpJJj08/5Un4qM69p6wDKheRreDu7bSDRMKSw
 RZWgwZGcI1TTk7P1n1T/yDgIVyNQO6ETQxYTwdL2CIIduh8VzbNWfKUag8hMtVgcZ97J
 o+7O4M8K1hxpL1BDBFEZ1vwf30BarFj9xz7ZYcvl3t/uQXRptvES1E3NN4kcFFLl5lSZ
 FKeqk4tykWldkXfyQX55kJRAQeHOIcO9wT9rzV6gUQQ8zc+gJ/dou7W1Z6uTPMiW0wRU
 DfIMdjgxHzpbplLbRoqYIOYxV/c9Zawr+lAMSeO/7cMUBu6383GgoUf8Y6JbJt1Npztz
 k1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lnxIy5t0e/L9/ZOWdqIM0TQ6TSgPw7HWu8AqiHGieLg=;
 b=HkQGjFacrM36SNfyw+NXpyNpMT+3KQvUZW+9CQhTL7bnzlIiusJEFFX7jBbxlFzLlP
 sVKhPU52VN9RuFmuWQ8k13Gbjmsi3LottSh4R3/H8aIQuOcYdEcDNMtWVEMAZyL3kgnF
 RGm33+kx0K6CZsr5nPzcVfhW6/rCReruOgcT1jqyu/5oobeMU2IaajzHNizTochK5HNl
 X/geuubGWTeeAxFiDuUVzK3KDyAU6YcQg7EndKTscPzW7GxlvYke6I2HZLAPF/CEOwqJ
 mgYF713rZZl5vI8wMS2tuddTUNVUPn7g6drk8AMd67fXmOCqXIPl17Hoh75ioeT+X/Q1
 AA4Q==
X-Gm-Message-State: AOAM532Sd2UFlJntS14cxtOVIdf5IEN3AG0kZjNSAZVtsa/R0FaqBQ8f
 LJZT+bHBLg/qEI58tGDyjGzeEKJjKEACU3utJpbkPg==
X-Google-Smtp-Source: ABdhPJx6EMyecQbUoL4uOuzudhfmM6ST04pSGq/W2jMXrQN+wuBATacMQSNZvZmHoWGGx+ams3ZvfYSIwkmR4ElMhTw=
X-Received: by 2002:a05:6402:220e:: with SMTP id
 cq14mr43692728edb.52.1629822812645; 
 Tue, 24 Aug 2021 09:33:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210822035537.283193-1-richard.henderson@linaro.org>
 <20210822035537.283193-15-richard.henderson@linaro.org>
In-Reply-To: <20210822035537.283193-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 17:32:45 +0100
Message-ID: <CAFEAcA9jPPo3dSqS0L7VNhYxOa-+1BuKwm_Htb-f4k5V4h=kmw@mail.gmail.com>
Subject: Re: [PATCH v2 14/30] linux-user/hppa: Use force_sig_fault,
 force_sigsegv_for_addr
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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

Where this is changing behaviour to fix bugs you should mention
it in the commit message:
 * address field for breakpoint trap
 * si_code for alignment traps

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

