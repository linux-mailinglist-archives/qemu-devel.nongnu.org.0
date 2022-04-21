Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C96D9509D62
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 12:19:17 +0200 (CEST)
Received: from localhost ([::1]:37174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhTu8-00030s-Uu
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 06:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhTpV-0000zn-Ef
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 06:14:29 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:34436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhTpT-0007vQ-OA
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 06:14:29 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id b95so7894649ybi.1
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 03:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mONqQveYVejkeAKioAdXpRUBuNa8L08ZZaRylVK2NMw=;
 b=dH03e1t5X9mkoZFkmFc8DqodyB63EkKAGQirSlHucCkw+lsuoJ+2NGHkQ+0Y897mrf
 FjTCOCUZfV/QZGnARRJ96daa5+hs9DJJP3LTpDdRu1waAzP9EPey53ViAMbrZLMd13iK
 JKkNEJMdZlV3aloYZNDF355VDJiSToKw/obVfwGunbebhkwdKfmI4H+0k9GfNX8me1Oi
 KSnmqGvDz0pfT15GlCJUcX9k3xGxMR1egsF3TI974NSyS/HUW3QQb2tbU/HtBKDu9cvQ
 BJMn4L3t02sypYqtlNhJMUBMdI5PGdZJjkZ+GgyKp3bJ8H0ZqXSXwo3VwG3EaKVGw0la
 Wlbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mONqQveYVejkeAKioAdXpRUBuNa8L08ZZaRylVK2NMw=;
 b=510Qqnq5CSnNcl3qekt3k4FNslJk79iwdo+N5Pw2qVTlqA5emCS4sATSyfTbsXCLKK
 //VxG79r+HpAVWHXq6HwZIoeBmvDX7toj5sLJdRgwWvAVVnYOnxhRgKCtfnaBNmZe8ac
 1VaY2fxptL/CcIV3cQ+Tw+LL4ECBOY2EV8NRq8zReaDpJ1ct+KKLqdfyrpUIIDi5hS6S
 Sk002fGnLFTUDlKbSGIpHhXls8IHymROWx5dSn4FSkud0HBc0NmUhe/rzdYR46thKEQD
 oCgVLMQLxrW/El7zS34wViXZUXxp7iABr8K58Yz2nhAKI77ZMQ2Xrq1boeaf7XN+K12B
 JnYw==
X-Gm-Message-State: AOAM530GQP/y6GnGrdfLsRW8qycS4CJdbOzJd9MbVui07cipWz9YhWVG
 4n+G5JqY7Qc4aFIbooYxPo+NiAorO/lxKnfWglVDs0u9Bx8=
X-Google-Smtp-Source: ABdhPJxCBRBY+qN+Xx7laPFIZgRV9R1H8+98vX1iZYbnOjPb0pKTuhHTZr4VCEvghMYx73yuXnJJVJjlREqAA+5uBFs=
X-Received: by 2002:a05:6902:34f:b0:645:463a:b824 with SMTP id
 e15-20020a056902034f00b00645463ab824mr10624891ybs.39.1650536065991; Thu, 21
 Apr 2022 03:14:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220324181557.203805-1-zongyuan.li@smartx.com>
In-Reply-To: <20220324181557.203805-1-zongyuan.li@smartx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 11:14:14 +0100
Message-ID: <CAFEAcA_Zoz67YYzMCqMJ4v2Lkgw_FuvOAEDu0oBiyz7LbGsDtA@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] Replace 'qemu_irq_split' with 'TYPE_SPLIT_IRQ'
To: Zongyuan Li <zongyuan.li@smartx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Mar 2022 at 18:22, Zongyuan Li <zongyuan.li@smartx.com> wrote:
>
> This patch set tries to replace 'qemu_irq_split' function with QOM
> object 'TYPE_SPLIT_IRQ' and totally remove this call.
>
> If this patch set is applied, issue:
>
> https://gitlab.com/qemu-project/qemu/-/issues/811
>
> can be closed.
>
> Changes since v3:
>
> 1. Squash Patch 3 & 4 into one, since they would affect each other.
> 2. Use `object_initialize_with_child` and `qdev_realize` for device code.
> 3. Code style fixes.
> 4. Remove unnecessary `if` statement used with `qdev_realize_and_unref.
> 5. Narrow scope of some variables.
>
> Changes since v4
>
> 1. Code style fixes.
>
> Zongyuan Li (4):
>   hw/arm/realview: replace 'qemu_split_irq' with 'TYPE_SPLIT_IRQ'
>   hw/arm/stellaris: replace 'qemu_split_irq' with 'TYPE_SPLIT_IRQ'
>   hw/intc/exynos4210: replace 'qemu_split_irq' in combiner and gic
>   hw/core/irq: remove unused 'qemu_irq_split' function

I've applied patches 1, 2 and 4 to target-arm.next, thanks
(after my exynos4210 cleanup series).

-- PMM

