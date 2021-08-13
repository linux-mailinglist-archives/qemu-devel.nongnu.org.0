Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1723EB349
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 11:22:56 +0200 (CEST)
Received: from localhost ([::1]:40170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mETOx-0007Yw-Ve
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 05:22:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mETNt-0006SZ-2B
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 05:21:49 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:40746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mETNr-0000WD-FF
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 05:21:48 -0400
Received: by mail-ed1-x534.google.com with SMTP id d6so14465412edt.7
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 02:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i2bxIBP7xfWx7Hk0SUJjBy2I2l7siMNluF4JxdUNqFM=;
 b=Pwh4Rxw3zFO5R+jXL0v4X/nvDT9QRvlFTluH1SsdNYikh/QkoolIlS4l00IevGhvMF
 lmNtolzhA8ZQ1AGS5sj1cyNZcfeKQ26kdYQSJsPLKHYNOYpTwZTBEl6mM6L25hni+2Q0
 DDIXFe1BR4ilK4nn77z/6cjfAk4MLd17Lo8IdJMlP+Qn0qxFXcOu3iGC7MxSXuo5CYfw
 sTnrLEPfKH6v8+dPK/5GhQ8WnXhcZNV4JR2a1Tc2iXU+jBrmMEgmkEFvZW1RonHqS4Nd
 CyrbB9Bh9M2Qto5ubw+Qqv5kzSSKIelSNyBH7SbbzfRBQQFN3Fn/bzT63nBVkdhLNt+j
 TlSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i2bxIBP7xfWx7Hk0SUJjBy2I2l7siMNluF4JxdUNqFM=;
 b=Xv6nZESCe+mKFZsfgg529m9AXDMC40MQneGNJETHO5p2UVXwfspOFCZLe1VDXMQHv/
 rLvNkwx6qVM6UtjrV2DCC34COD56LSgok0kUnUi6AlMqOJwCOmBL30RK8ClVx2qrzIjB
 gOGHyylpH6EMObq125oDAY8NlDWRQ0J2XyF3YOx4Tgsh60ZgJLU6a0AzpjXUH2QjPDqe
 Wp+OeiRnTaXXpE4bW13lfA9GCVPKWqBXusgNN+njJQFPEN727XPxfr3NY3zNOWPz6Pc+
 SoKrdymGY2YaZa0m4HAruseVEe3gecxsFi8Ad0R1S6DQFfk0Xa1qngCB/JubNRpNa/oE
 di4A==
X-Gm-Message-State: AOAM530A7U9Amjw1qLwYsvPtBp8MhS9V+s88qZv6r4YWuEdbzZvZzALs
 Vu+T0N8ydzjfrHvC2mcgl404OODenEzmxqES0Bj/gw==
X-Google-Smtp-Source: ABdhPJydPtqjDj4uEJ7bwPK/nZPtgI/X+baswr5bkn8SasmbyDeXgm+sZLDdMBuxJydMNu2Y48HOUIbKOZxUVxWK8kI=
X-Received: by 2002:a05:6402:4387:: with SMTP id
 o7mr1898980edc.204.1628846506099; 
 Fri, 13 Aug 2021 02:21:46 -0700 (PDT)
MIME-Version: 1.0
References: <1628824050-15249-1-git-send-email-tsimpson@quicinc.com>
In-Reply-To: <1628824050-15249-1-git-send-email-tsimpson@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Aug 2021 10:21:01 +0100
Message-ID: <CAFEAcA9s7FC13r8mZEdE+Y4X1ZofMd37x7m=7TDL-BK_HR_SqA@mail.gmail.com>
Subject: Re: [PULL 0/1] Hexagon (disas/hexagon) fix memory leak for early exit
To: Taylor Simpson <tsimpson@quicinc.com>
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 13 Aug 2021 at 04:07, Taylor Simpson <tsimpson@quicinc.com> wrote:
>
> The following changes since commit 703e8cd6189cf699c8d5c094bc68b5f3afa6ad71:
>
>   Update version for v6.1.0-rc3 release (2021-08-10 19:08:09 +0100)
>
> are available in the git repository at:
>
>   https://github.com/quic/qemu tags/pull-hex-20210812
>
> for you to fetch changes up to a7686d5d8528469b596e98eff098a5d3f8328fb3:
>
>   Hexagon (disas/hexagon.c) fix memory leak for early exit cases (2021-08-12 09:06:05 -0500)
>
> ----------------------------------------------------------------
>
> Don't allocate the string until error conditions have been checked
>
> Fixes: a00cfed0e ("Hexagon (disas) disassembler")
> Eliminate Coverity CID 1460121 (Resource leak)


I'll put this on my list to apply if we have an rc4, but I don't
think this bug is major enough to justify an rc4 if nothing
else means we need one.

thanks
-- PMM

