Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C0039A1B5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 14:59:08 +0200 (CEST)
Received: from localhost ([::1]:45618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lomwF-0000aD-Dr
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 08:59:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lomui-0007do-LE
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 08:57:32 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:43887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lomug-00069d-Am
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 08:57:32 -0400
Received: by mail-ej1-x632.google.com with SMTP id ci15so9040587ejc.10
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 05:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QQIvVpx31q6wXMgO40cinFWb038Lva1Yx9996rq1+wo=;
 b=U0re6QnqE/T3JsI6hzDMpGafb3qdt39f8j1CDHYdVXjtYmHl1DqEjTMq0LAmUjSWAZ
 iBjyPNEJBXt/8loNmzQSLcN3hMKMNS4tR1apfqtBnjeNjVsyOAtHyvpH+G9k3MkeVFgL
 ZavG3YY1/myS9V0tgZJ0y1qbWfJOpNXH0tsC91yIqeurpOQKiM+DdU8j2o2sYBz4U/pd
 3SCqJ0Bcu0XJtcTDREuCVpR6ZGD+lrVolncKviBEfAfoYkMMe33NIVxFS9N5PyyrzPOK
 Trx8cKkhX7wJMtkOCzMp9G7fPvLMKwCaH6D5Sfn6hpS+U9eOBKgFXcQRjCYF9OkIhMJR
 tUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QQIvVpx31q6wXMgO40cinFWb038Lva1Yx9996rq1+wo=;
 b=EuOnm5iWGzL1H/eLnzNsQ7jtG9LaMq5uX/PAQSNK/ZYUZNBwinOJJr/huv94zv7Xr6
 bM8y2cJCIZjknVtmfoocRj82BY9bgBQP5mswisBtOldQWnRUllnR5jRr2tYzB9b9l4UD
 ctt+ht92bJP7OvaHjnFdskMMTwhXthbXybmHJ/345x6xm9dT5n8AvevlTJe8P/AT5U+C
 HaZ1wwi+jAdTLa0NEnAZSqKHISjKOc4Vsmb0VTR7O6mEloP7P2gf9w3Ovh8+OMqLxePc
 ZMckcE1mZiFTxjKynejrJSpju2wxjotCXmbvDYqeKcxdEBXlCfseyWVbfqBkBTZmG0Zu
 BJ1w==
X-Gm-Message-State: AOAM5329Hckls8TjVv1KQff3laehr35F3s2ll4laoyUlXhCapqyXgK+i
 PbzFJGQ8ZgLrkOa8DUMkvy6oZM18CcdGbOiQp8R3lg==
X-Google-Smtp-Source: ABdhPJx+yHxdJ/N5i6X40TaKRyEXBx5S9NNBAp0bBk2uFHlPb6t28W/zl/6MdkkgHZVYBYn5oP2od0BNC7XzIzY1wSc=
X-Received: by 2002:a17:906:4109:: with SMTP id
 j9mr11239264ejk.250.1622725048132; 
 Thu, 03 Jun 2021 05:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210603110012.1182530-1-jean-philippe@linaro.org>
In-Reply-To: <20210603110012.1182530-1-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jun 2021 13:56:55 +0100
Message-ID: <CAFEAcA-mGR3S_z7OEYhQwCOyYO_mX3QkbTOO_vcY3yz6OtbDUA@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gicv3_cpuif: Tolerate spurious EOIR writes
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Jun 2021 at 12:01, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> Commit 382c7160d1cd ("hw/intc/arm_gicv3_cpuif: Fix EOIR write access
> check logic") added an assert_not_reached() if the guest writes the EOIR
> register while no interrupt is active.
>
> It turns out some software does this: EDK2, in GicV3ExitBootServicesEvent(),
> unconditionally write EOIR for all interrupts that it manages. This now
> causes QEMU to abort when running UEFI on a VM with GICv3. Although it
> is UNPREDICTABLE behavior and EDK2 does need fixing, the punishment
> seems a little harsh, especially since icc_eoir_write() already
> tolerates writes of nonexistent interrupt numbers. Simply ignore
> spurious EOIR writes.
>
> Fixes: 382c7160d1cd ("hw/intc/arm_gicv3_cpuif: Fix EOIR write access check logic")
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  hw/intc/arm_gicv3_cpuif.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index 81f94c7f4a..1d0964c9bf 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -1357,7 +1357,8 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
>          }
>          break;
>      default:
> -        g_assert_not_reached();
> +        /* No interrupt was active, this is UNPREDICTABLE. Ignore it. */
> +        return;
>

Makes sense (and looking at the comment in icc_highest_active_group()
that says "return -1 so the caller ignores the spurious EOI attempt"
it is what the code originally intended).

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Shashi, I guess this also fixes the assert you were seeing here ?

thanks
-- PMM

