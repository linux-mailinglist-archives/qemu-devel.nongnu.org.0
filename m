Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE93060CB86
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 14:10:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onIgW-0002Ls-7J; Tue, 25 Oct 2022 08:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onIfY-0000Fo-Gc
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 08:04:33 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onIfP-0003Gl-CV
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 08:04:32 -0400
Received: by mail-pg1-x52e.google.com with SMTP id 128so11287553pga.1
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 05:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=59JaS4Wkj7dq0vEEMxDP2wfyvXcoHNuhHUP+ukzSxW0=;
 b=fy64zbJDJD40q1P2xiC75eD3E5BpAkm5cL2qWvavncEViUMXmnIH58U0CrnOjUeile
 jWBTefzAexpYdw3SpLATtACoD2AuA2AF/e98GrdZI0wlbHtqlhVLWc5POGYGevJnky0i
 n6ylwrS6bXo0SZ+vExNSirrktqmie7gxyizi705ZVc/fwMdQtf9HRpqHRPBHv+WD3juq
 mZ1QJzm12jGLb9pVaSqCtH0yKoboyPqeLva9xfYe3GFrVl88MOFJo6oYVTCKLMFOGaAR
 0oohFJ7mbb6jTwxN3mp7o1izAHV/1cpT4qWEUjZj45927m9sHOO384wE7uJQ2L0n7obu
 bHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=59JaS4Wkj7dq0vEEMxDP2wfyvXcoHNuhHUP+ukzSxW0=;
 b=jVMkQ0n9yEoWwnzU1uzIYgB7+GdzOeZi7fE54G25Cp7ZJyM3XCv+c47t2mh5sUxBkj
 6Y42L3KE16hJaTIR2aHMt24HUqoZrLM9piLR9LEMUCa5zQMAOPjySEKD+KIbCvFahQNm
 yrbIx9O+7EN5cvr/zDS2yntlM5eZMevAFyobwbs0fgEjBwpbT7h9CizK5TAtCEYiekX+
 /siL8EBVPY7v88M0lJ3LBIvWXM8K1Iw8Q8QtW5XCibiK1G2ENfxyV0iC4nf+5eNS112l
 mZZFPxmJ1GDheeeD8C+k85TQzPsXiPqoym6fGcn+LliGaea4WsMOvOy6zVpFS0CrBakA
 2ZLw==
X-Gm-Message-State: ACrzQf3abFvN6xtQO29r4TLWoG3SxwCDQq1SnEQpI2AtjCwWpcG1AQQ7
 Zag+or3o2prvDP1ZMfNHHPzt5Yg/jeda07Ceab1baw==
X-Google-Smtp-Source: AMsMyM682zkJm+bNsDU9yBkdGYvspjhecdu06evvH7CdEyd8X2XUH3KqqmPg3W2vhYzi0TlDAcKQokaS+flAgPrP9/g=
X-Received: by 2002:a05:6a00:b54:b0:566:917:e57e with SMTP id
 p20-20020a056a000b5400b005660917e57emr38310686pfo.26.1666699461573; Tue, 25
 Oct 2022 05:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <166663118138.13362.1229967229046092876-0@git.sr.ht>
In-Reply-To: <166663118138.13362.1229967229046092876-0@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Oct 2022 13:04:10 +0100
Message-ID: <CAFEAcA_W6QqBHeN0D+XR77MVyhk2Bj_kZC164SJtoMk8ByaVxw@mail.gmail.com>
Subject: Re: [PATCH qemu.git] target/imx: reload cmp timer outside of the
 reload ptimer transaction
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 24 Oct 2022 at 18:06, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> When running seL4 tests (https://docs.sel4.systems/projects/sel4test)
> on the sabrelight platform, the timer tests fail. The arm/imx6 EPIT
> timer interrupt does not fire properly, instead of a e.g. second in
> can take up to a minute to finally see the interrupt.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1263
>
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
> ---
> Fixed the comment style and the commit message.
>
> > Do we also need to change the other places that call
> > imx_epit_reload_compare_timer() in the handling of CR
> > register writes ? (Those are a little more tricky.)
>
> The current patch fixed the issue we are seeing. I'm not really
> an expert on the QEMU code here and still try to understand
> all details. Might also be that we never hit the other code paths
> in the end.

I suspect your guest happens to initialize the timer in
such a way that it doesn't matter if we don't get the
comparison stuff right on the write to the control
register: conceptually I think the CR write code has the
same bug where we call imx_epit_reload_compare_timer()
before we've finalized the value of the timer_reload value.

Anyway, this patch is definitely correct for the LR
register write, so I've applied it to target-arm.next.

thanks
-- PMM

