Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A78230C2CA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:02:50 +0100 (CET)
Received: from localhost ([::1]:43938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xCa-0000zM-NQ
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:02:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ws9-0000zX-Ss
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:41:42 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:46688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ws7-0000wk-92
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:41:41 -0500
Received: by mail-ej1-x634.google.com with SMTP id rv9so30295670ejb.13
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 06:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yHnxhOqk/eWecdIgWfGTIuHn7pYl3vv+BgylfG2927A=;
 b=RvlV1FfjwB4zjHW0LIO92VhNb75JQImSQ/cPsJEJHWa7k9+i90JUFVprhCpiO5yE0B
 YIluFDeWoHGoTYnvbG56Y1kJCijgHnKw3yYQ7O9C2DIjAYx75XVyP0aMzMF3FpNjzdOn
 L7WpgNncg6zX67raQzxmuzjLnA+5wE/6jiM5O37r8Ni4RU0P0ngy/ERPkJJcDKEoSHBx
 Q8DFA9KMY8Kn0YjX66aM4B7ybqByLvmMXuh+8jNcoWMGiY1GBH/UvrB9xDADBEvwOzEE
 SIHxA1XoHIcfyGtVNUCzyg5WsFEHqk5Xlb7gdxn85QVSBmLZHDtW4U1n7ZA94SMdxZM9
 K8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yHnxhOqk/eWecdIgWfGTIuHn7pYl3vv+BgylfG2927A=;
 b=ql1J/gU5Aa0nzl1Ndrr8VXSe6YRTgvi8F0/Hsuq9soDdTOjACFWeM4XTsj/Bk4YPAQ
 rF6n+PpPtLFdEgvxnFDhTnAeyneAXtczRPDHinmc8cYcptP6XmPeGSqUwE+ryD40bTY/
 YP97suHpvwaD3vt/wSgtXBNVID14uDtBUvX2NQjjZJA8RcNu2pl8Hg7Jbv5k7kBnTnO9
 HGUH+BYo0c2y63Vm7zvvsqvwbkHnmbci+EbPLfAWyCLhdHB8plRadGY57DhvyMHQIC2e
 6xLALgvAnachVbK09hj0q1qErdICWpXxA+5UC2tAiap2RHifCcz0HuRouQpZfFEMIHY7
 V0fA==
X-Gm-Message-State: AOAM530ofc2ammBtsgsaBZbc7jT9XdBa5/SOQ1JrJOv3iJMr6k7rCzUi
 d1oZi03TQmCH+gjZePt+/unidPbjUmm+yrCoXgDG/UZsL6M=
X-Google-Smtp-Source: ABdhPJypkuZDB2wsj6XW+aqXIv5CE8RCJVqEnUtsGijLA8+Byy3Lm/1PwgLu7psefeINwT5In279D0bwsZH9wBKVqqY=
X-Received: by 2002:a17:906:3603:: with SMTP id
 q3mr21981811ejb.382.1612276897774; 
 Tue, 02 Feb 2021 06:41:37 -0800 (PST)
MIME-Version: 1.0
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-15-richard.henderson@linaro.org>
In-Reply-To: <20210128224141.638790-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 14:41:26 +0000
Message-ID: <CAFEAcA-Bo3F55iX_x4StXh=WUZAkKPq7K2zw0dRns1Lkpi5ouw@mail.gmail.com>
Subject: Re: [PATCH v4 14/23] target/arm: Use the proper TBI settings for
 linux-user
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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

On Thu, 28 Jan 2021 at 22:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We were fudging TBI1 enabled to speed up the generated code.
> Now that we've improved the code generation, remove this.
> Also, tidy the comment to reflect the current code.
>
> The pauth test was testing a kernel address (-1) and making
> incorrect assumptions about TBI1; stick to userland addresses.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h      |  4 ++--
>  target/arm/cpu.c            | 10 +++-------
>  tests/tcg/aarch64/pauth-2.c |  1 -
>  3 files changed, 5 insertions(+), 10 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

