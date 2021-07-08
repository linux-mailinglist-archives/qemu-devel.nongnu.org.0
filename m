Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F273BFA00
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 14:24:23 +0200 (CEST)
Received: from localhost ([::1]:55714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1T4o-000126-4B
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 08:24:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1SzM-0004aE-G2
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:18:46 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:37453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1SzH-0006of-86
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:18:43 -0400
Received: by mail-ej1-x633.google.com with SMTP id i20so9261634ejw.4
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 05:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zldsFtJGNuZGAcWb7ecfr6t3EizshehHskWZQUJkoM8=;
 b=YyHlxcnQZja4V1pH1TagrchJzwmEz1TR/v5rfcBWBV3E2DMNb5f8SqlX82PHxFpsnk
 ZE9xpj1cxwCNKIMKkiP9kI3+VEwXoruMEuyN0F5UGbC/593mfzXExsZotdrkkae8BLYM
 XsGgrhJP8LdlVY6te0MQ+DaSqmFVRDzDl3u6U7DjptvMo7AaDNRAieY3avll+3hsOtDp
 g36gIpHyjTxxSNhWz9T182QVkmuWibmrSymnIC/vW4Qy8skuofpFdUra4mVjanu5DH0t
 EUz1WcKZshCwHH6nFuRzo3gvnu6bgNAWFkX3tyqh92TFFGlXeKUqsUeVcoZHdR8xTjGB
 G5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zldsFtJGNuZGAcWb7ecfr6t3EizshehHskWZQUJkoM8=;
 b=AAMOuipDNjTl3vrT1Uv2fVxGeBYe41OYdmqrKmklAXp6SrEXi1HjEbJt9c+axZPrUW
 eI87jNOOm244BoEVkBzbhQ5nYN/g+wYBBUEpf4CUaQk8dCR9IxmKDHdq8Z0R+ooBWaa7
 s8xIaDSDj0Z4zxJl5T5AT0iBgYGHYhibYugJBm/sYuUWDtC+CVjvWcNRPLQAMdzJMo8D
 WUns7OXENyAK7nuxXWURBk01plzK9nqVtT1VD5SSaRFL80fULcqAe1jFBbbIW4DV2ea2
 sxPjlxfNOZhPZhq2KudpQBTQNo58wv+BGlDbC3YJOwry2mugx4bf/ewzD/nM1E8Dmpme
 Az6g==
X-Gm-Message-State: AOAM533j3nRoD6qeL3adcefsulQpzYD++MDcxbXlDD0Wg5u0kCeTnLEq
 P0048Xx2hXicfsnrwTUB0yF3YJT6Hvy/FBq54FrcRA==
X-Google-Smtp-Source: ABdhPJzZm/tjIOt7qfU+ReDgK3uCJQLzE5WUtExuBGuk5YFeKKgvNR9V/qq78BojyuUktFFYChcv/Wk/gqvcangw9Aw=
X-Received: by 2002:a17:907:9701:: with SMTP id
 jg1mr19407880ejc.56.1625746717872; 
 Thu, 08 Jul 2021 05:18:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
 <20210630183226.3290849-18-richard.henderson@linaro.org>
In-Reply-To: <20210630183226.3290849-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 13:17:59 +0100
Message-ID: <CAFEAcA9X0rx+J4qd-zgd9_AABJ=ar9QA6HpzWOp9Xfvg65RwYA@mail.gmail.com>
Subject: Re: [PATCH v2 17/28] target/nios2: Use translator_use_goto_tb
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Jun 2021 at 19:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Just use translator_use_goto_tb directly at the one call site,
> rather than maintaining a local wrapper.
>
> Cc: Chris Wulff <crwulff@gmail.com>
> Cc: Marek Vasut <marex@denx.de>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

