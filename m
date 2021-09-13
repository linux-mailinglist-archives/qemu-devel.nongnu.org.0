Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D874090A9
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 15:55:07 +0200 (CEST)
Received: from localhost ([::1]:45676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPmQM-0005bX-74
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 09:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPm2W-0008JL-Tk
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:30:28 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:45695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPm2Q-0003cg-2V
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:30:28 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so6627916wms.4
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 06:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o/fPEhv/7ieZL4ufgl3V41xfzGd3JnW6xF0RVYUQjv0=;
 b=ACKxQcBl4dpEVjkOfM/w+2TUI3Ghvbe+4CZmQQ1s+C35vAJwWEDKh+D9ztM2tNLQsh
 +zU/8GHQDd+Po4kEGVeposRF4+P0RsxzWccuwRV324dwPAjU4pTmXiZTZ4w1VgOLBNki
 VTz6MukFA1uiJpiZxArF5X86iradcnOqv6288VLJm0BUn+eq1or3r6zps9dPvS3lORPx
 o63Wss0KYXJnn/FFBND+bhBAm1DlQwB6EYQ4F//6S0ii1RMir5YifNmqNwA7HzTxaiDH
 XUYNuasbUV/2jvdoEuqC//NrT+gfgZMQzb8LFhZR2suvVA/WVT3fbWBc11tT6exf3eki
 c6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o/fPEhv/7ieZL4ufgl3V41xfzGd3JnW6xF0RVYUQjv0=;
 b=nN4tvyVpp+YR0slIax4L8AA4Y20MsMlMnOP9iN4E5H/qswLAR1Zsgc8w1kClMM2OKY
 BZ4LMamf5JxqGuemcKjph3bPE2zYN1+6qpS4ed1t9gC4QBB47gJGNGN5D04p2sjjgs4/
 mU0fEXqeYy8qli5hDRAdHO4AgLsnIkGAo3NP4QaMmxa9afXr2QxOCUgT/aA48cZeVoPl
 DVoro3gBOWcpFc9g/nMMtTQzEktHSdzlnCgkB4LM3F+f9V6KiYGYyK6sbu6U562Ypsno
 xiMOkypfsuvY+RQ0Ph/Mm7mmVoYp5jUEBvf2ESd2nUiIasCn7A5N7ZLo28oWTdW8nPEv
 pjXw==
X-Gm-Message-State: AOAM532fXk8Yd4WWZ6KmwapDz/UxXMFOgHk+ARmtX7DnMbXYOTn4oDd3
 +buOWEZDR+JKa4twNfAqqYvqFstwpwuMS8xsybN66w==
X-Google-Smtp-Source: ABdhPJwgaUHiotBqq2rPNV4V9lpGjoF+Vc++6W2HtXKN+KZljbh+khyGorU5LKYyQMuBPDZ592nH1N7y1dfiqh2LoAY=
X-Received: by 2002:a7b:c246:: with SMTP id b6mr11266364wmj.37.1631539820282; 
 Mon, 13 Sep 2021 06:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210821195958.41312-1-richard.henderson@linaro.org>
In-Reply-To: <20210821195958.41312-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 14:29:29 +0100
Message-ID: <CAFEAcA8S+JUoyiOmYePSZm=2KURDOKeT0Ppm4bEDihssx7owUQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] target/arm: Fix insn exception priorities
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sat, 21 Aug 2021 at 21:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Raise pc alignment faults.
> Fix single-step and pc-align priority over breakpoints.
> Not yet fixing insn abort priority over breakpoints.
>
> Based-on: 20210813131809.28655-1-peter.maydell@linaro.org
> ("linux-user: Clean up siginfo_t handling for arm, aarch64")
>
> Changes for v2:
>   * Handle the exceptions in cpu_loop.
>   * Fix how the instruction is raised for aa32 el1.
>   * Add pc alignment test cases.

I'm going to take patches 1 and 2 from this series into
target-arm.next.

thanks
-- PMM

