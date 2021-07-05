Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7053BBD8A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 15:35:54 +0200 (CEST)
Received: from localhost ([::1]:49524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0OlN-0007ec-J1
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 09:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0OiL-0005a7-8R
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:32:46 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:35395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0OiJ-0004p4-K2
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:32:44 -0400
Received: by mail-ed1-x530.google.com with SMTP id k17so5936764edq.2
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 06:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jCCZapk8HcyKdE6udf+TE8WAzb3DjFDijdv6CbUn8F0=;
 b=Tu4EzYVZ0S/JIB6hxhvhIBEhDgNEGKeTABzXyjOfZ/7JHmQmxy2wAh06bbiWhdDmBI
 2ciwKafyPjySha0IDQO5e1lBNGlGDLKkyX6k6nk4ONmkMJH3Ars8Ygm6oBL/c6VLZoOA
 MZbYri8MzU+hPd5E+7Gw+uOMVopuqSvu19BFC9jLkzXNAveY1jiQEgFv9T62wQ5OrF0S
 k+n0nwEO9heTykpolGZuSwgl/pdLqx7Bm9wdcDeDP7NP6CrzslI8Xq3PA3s0LT4owBl/
 rKGl4CCGexqE0uUxdL+d4zndubW//J7A12OPnkn+N/G1LDg2MuZoxF1ASkkAOYprZr8A
 rLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jCCZapk8HcyKdE6udf+TE8WAzb3DjFDijdv6CbUn8F0=;
 b=Cykam7PSSxbd1V/vVetVEjUd9/upW9SavK/QGD3XOJJp+jri2DRsvaZgOHKCIXHnrW
 sz6zjeB/ffCeWBQoI0i9d5TxOF3vZxj43qRAyGQID6jM9Mvx+U7i9HJLVhjIz/fZVb60
 uMtYyYAGgl3UbvfCJOHFEydrplzV64ODW5s1LZwuVTXRtkSrHeUyHeBeYkKCCtJajp9+
 /T5KbIl6BEuXXWppX5RkLN12ziRbdNTJI6YTUiRrvJAVTRrVzHkkKkz6DSV9x+D+XzDE
 57qS8eFDzIz/IyRX3IxQjb3ZuWxjfK3SBTKV0zp7oV0W6cBadjSotmMC5yTYK+vcZ75G
 Gniw==
X-Gm-Message-State: AOAM532bEE3dVHoNlBkBcYfVSPOoT7dt+khfyFLvJ59rqYR9YStRH46S
 hK9i/Ql//F4LVYIvkZjorIim512LWjJvkyjmEHK4/A==
X-Google-Smtp-Source: ABdhPJz1VqSmB0a+tvOCyMEwr/UOxgXfPzkn9NjP2DB+0jOYWIRmp1YrJ9I4ZNqMvV9XNJHTUC9dinHgCC8/oYXZ/G8=
X-Received: by 2002:a05:6402:1e8e:: with SMTP id
 f14mr3593095edf.52.1625491962096; 
 Mon, 05 Jul 2021 06:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210702233701.3369-1-ricarkol@google.com>
In-Reply-To: <20210702233701.3369-1-ricarkol@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jul 2021 14:32:04 +0100
Message-ID: <CAFEAcA89ek38DKx00W=pq6H1a-2Tw2V00GoDDcMW1QotMt5DwQ@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gicv3_cpuif: Fix virtual irq number check in
 icv_[dir|eoir]_write
To: Ricardo Koller <ricarkol@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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

On Sat, 3 Jul 2021 at 00:37, Ricardo Koller <ricarkol@google.com> wrote:
>
> icv_eoir_write() and icv_dir_write() ignore invalid virtual IRQ numbers
> (like LPIs).  The issue is that these functions check against the number
> of implemented IRQs (QEMU's default is num_irq=288) which can be lower
> than the maximum virtual IRQ number (1020 - 1).  The consequence is that
> if a hypervisor creates an LR for an IRQ between 288 and 1020, then the
> guest is unable to deactivate the resulting IRQ. Note that other
> functions that deal with large IRQ numbers, like icv_iar_read, check
> against 1020 and not against num_irq.
>
> Fix the checks by using GICV3_MAXIRQ (1020) instead of the number of
> implemented IRQs.
>
> Signed-off-by: Ricardo Koller <ricarkol@google.com>
> ---
>  hw/intc/arm_gicv3_cpuif.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)



Applied to target-arm.next, thanks.

-- PMM

