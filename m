Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3839839F3D0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 12:42:33 +0200 (CEST)
Received: from localhost ([::1]:54048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqZBo-0008MX-9j
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 06:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqZ8S-0003iw-BF
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 06:39:04 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:38809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqZ8Q-0005SA-Pm
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 06:39:04 -0400
Received: by mail-ed1-x532.google.com with SMTP id d13so10409755edt.5
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 03:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DBL9HgJTqlTdVLjw4jUijMx0K9KTU4lml/nPaOkSmkk=;
 b=X3FX8fvBvuE0sX7fo4x6RWMnevEaelmxsCGh5O3E0gxp6j6b0Zc31Qskvn83M0CMAS
 86MCQ6DGPuhlB596Qp9JBYzUgOhYjYt0QlwyzBd47XrCuf8fpy9JilYOyCo0UzoMnGcG
 Uxwll4rBR+oNL1oMi7MvTBP0CSThlAyke+E2ex+y8XmORzRgOAeo0fOuW6PTLkpgJuNk
 u1AB5sdIuoqNeoWcM37EMPwOhH19rbckWMMfguCChiBMcXva0Q4hzOk8IHkM94sBLgZj
 LyCZA/Tg2ZfIFrGQlo+04oRma8ASEAVDwcdqoAHTlJk0ok/R37Y3Nxd/eUs/hQGF0CT5
 tqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DBL9HgJTqlTdVLjw4jUijMx0K9KTU4lml/nPaOkSmkk=;
 b=teUVjg+opDwO+YsdkFH2CliRutmdNFjd+NTem5+MP+fRhE9W/ZMk7x+xGdGVGbBfxl
 zoCWvH2x4FUiztOrtonn1yuqLzQUg3CsfJ28f8jOaK9GUeTUemFaVFEjerr8VTqRPyoQ
 DwnY1w6+t5Ig2dGHkfEQhusCtIpRavkVCbADdSLjMKGtj/qMWyDJ6AwN+ftinJ0cSel+
 o2jGPqhYIc6TkZQLYKuI7GQFdzJAGMfr3+0XUdHAO7b9VmXZEnQgaUnPUnQCwGO0Ok9D
 2v2f5zmOvwthQgwQVFHEDE7JhCsT7FMkLd2N2PcUYrL/nYXl/Mn7Kzku90A6oY2MtmJj
 6VEw==
X-Gm-Message-State: AOAM532vo/SWrZITJzhfAyDzQhlHMoW/KKTq8bgeAEMemw/leeXRvtkq
 tUW2KZMO5DGlV387sNgASBMgdvC92/RM9358YwIy0g==
X-Google-Smtp-Source: ABdhPJxK3Ohsxr5mzJbZfScgRWbubveaZNAYtpU48+gHZQRYmC4SSyEBYedQVzJy5hyJ0I165lE2hjudQkJAkjc5X0I=
X-Received: by 2002:a05:6402:3482:: with SMTP id
 v2mr14855994edc.44.1623148741134; 
 Tue, 08 Jun 2021 03:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-4-shashi.mallela@linaro.org>
In-Reply-To: <20210602180042.111347-4-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Jun 2021 11:38:27 +0100
Message-ID: <CAFEAcA8Q=xN3U9BMPaX8sHy_ep3YJQipgurDKCJQAiUQNZcLmA@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] hw/intc: GICv3 ITS command queue framework
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Jun 2021 at 19:00, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Added functionality to trigger ITS command queue processing on
> write to CWRITE register and process each command queue entry to
> identify the command type and handle commands like MAPD,MAPC,SYNC.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c  | 295 +++++++++++++++++++++++++++++++++++++++
>  hw/intc/gicv3_internal.h |  37 +++++
>  2 files changed, 332 insertions(+)

> +    if ((icid > s->ct.max_collids) || (rdbase > s->gicv3->num_cpu)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "ITS MAPC: invalid collection table attributes "
> +                      "icid %d rdbase %lu\n",  icid, rdbase);
> +        /*
> +         * in this implementation,in case of error

Still missing space after comma.

> +         * we ignore this command and move onto the next
> +         * command in the queue
> +         */
> +    } else {
> +        res = update_cte(s, icid, valid, rdbase);
> +    }
> +
> +    return res;
> +}


> +        } else {
> +            /*
> +             * in this implementation,in case of dma read/write error
> +             * we stall the command processing
> +             */

Ditto.

> +            s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, STALLED, 1);
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: %x cmd processing failed!!\n", __func__, cmd);

The double-exclamation marks are unnecessary :-)

> +            break;
> +        }
> +    }
> +}

Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

