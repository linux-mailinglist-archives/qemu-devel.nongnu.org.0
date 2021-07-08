Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1D73BF9E6
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 14:12:45 +0200 (CEST)
Received: from localhost ([::1]:39218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1StX-0004RO-VI
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 08:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1Sq2-0001HD-0S
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:09:06 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:35681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1Spx-0005Cp-AN
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:09:05 -0400
Received: by mail-ed1-x531.google.com with SMTP id t10so2090065eds.2
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 05:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/scE4EpJkwA9DY5VIkr2TVt/pVpYQKawARHhF1AxUkU=;
 b=tlsnQbfzPqB0c5tkD39hwDlVX5pnMIhZ4qAz+M5nRAA4TXSTgElBZV9LnjB2SBemgU
 WV6kbUG5xGCTn/Rt+dVLDYHWyeMIPz4m0OG46msE+1uwwLQMhzJcJwCKGWQRJRcouZVa
 Wa50ZatGuy6f8ssl3LcOVFZ6cJ2BDvRW3jUhX07BPpbdX/CKZLOk8Qv0lyIxoWIk0VLB
 ACxUgTGps3mGb3DSTULBLvm0Wz33XW7yCT0ozg281PCCSgWVQAQMFNsD9VQzdZbkPmyQ
 3ggdjCxGYYNnrhz7Y2QUiWfpC3kfoQ1Z8tOae3hDlTxx5DfdEH/RUvbO62AlMC8tzf5Z
 PQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/scE4EpJkwA9DY5VIkr2TVt/pVpYQKawARHhF1AxUkU=;
 b=XOPRK6s1sgYNyWQzTp9fqczIKHrXVy47gJP7p4+WtHLrsg+Onvo08f7G370HtsBoPD
 UbDY9jmhsqp34lR8jIJA1cLSSMvpODnhw0ln45F7ml9n2uuRMEXEjoiUgcB6f4uuKgxt
 rbftyonoKSPzVZGlJXEZKNfVuKjzWaA+evcmpGJNgeoWQ5R1EB+eKxHcwViFzHavzHCO
 F8rw/CuaSDsgNmpNwBJGaXWFqT8pd2pqp4yMwiL/vvYgGH/WPb/APIUJkyZPDfGki9Es
 XowLEV4iDWFLUAmmPXv0YPAc+Pc1+dokodQzcf5Mv/Qi9hJotvL7ztnY1beBSs7J5WqY
 xScA==
X-Gm-Message-State: AOAM532He9580uZMmk7ekNfGoW83bb+21Pe4N4gVf2nT/hLbYYOycr5p
 DJRFp/wBwe9w8Gb0u7eLtZqFXoClbX+TUAh7fbUNeg==
X-Google-Smtp-Source: ABdhPJzsy5YMpFzWTDUQRd/HPadLFJ/IpKQ+Dir229bZ5PYezknB4xqRvml0mWKYmJl4O+c4NNruxyMp7bxJOw1l92k=
X-Received: by 2002:aa7:c6d4:: with SMTP id b20mr13836735eds.204.1625746139959; 
 Thu, 08 Jul 2021 05:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
 <20210630183226.3290849-7-richard.henderson@linaro.org>
In-Reply-To: <20210630183226.3290849-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 13:08:21 +0100
Message-ID: <CAFEAcA8v7dg3YVF+mN0f8znyFa2nNMcCM9TYLOU7TVR66-rB2w@mail.gmail.com>
Subject: Re: [PATCH v2 06/28] target/arm: Use translator_use_goto_tb for
 aarch64
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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

On Wed, 30 Jun 2021 at 19:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We have not needed to end a TB for I/O since ba3e7926691
> ("icount: clean up cpu_can_io at the entry to the block"),
> and gdbstub singlestep is handled by the generic function.
>
> Drop the unused 'n' argument to use_goto_tb.
>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

