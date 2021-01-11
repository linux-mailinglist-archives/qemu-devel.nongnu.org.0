Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 783A82F1023
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 11:33:27 +0100 (CET)
Received: from localhost ([::1]:60458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyuVq-00085r-Ia
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 05:33:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent.desnogues@gmail.com>)
 id 1kyuU1-00075s-Pb; Mon, 11 Jan 2021 05:31:33 -0500
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:45571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laurent.desnogues@gmail.com>)
 id 1kyuTz-0004Cb-P5; Mon, 11 Jan 2021 05:31:33 -0500
Received: by mail-il1-x130.google.com with SMTP id y13so9857146ilm.12;
 Mon, 11 Jan 2021 02:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aKeTIQ6k7Ajw6Y8Kt8KUnyrc9f8sIz2BFeY2ErOSnbw=;
 b=QEXyS5ndrsIZ1MDUjrVZ+lKqCrV6p9HMN9wKt0Wlp0cqMZl/TOYh3NwC4iotGE3FVt
 lwaHqa/MYV5yeFmWk3ru3KNydmHGMSlLJOdtziFMwvnVSnHP4toiJhw1iZyYP7DP/Twf
 o2iF/4IK1m+zDX25nP31wCXkHm7M++wYMTRpmtUos6XabuSI+ubwGcgsX0yDvIsPNowI
 ffhuhZG5BBsLaCOZEeN2U4RM3Cw7Y5Yl/BqjoOZEgnRsCh2wmwWANyJeOn1oHW7YwPBt
 61cJ5oO3tLZbkTldkUVW706Pxe6UN0w522Sf7EkI0GJqG6O13zVKzD2QPs6ToVkLYXJ2
 NQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aKeTIQ6k7Ajw6Y8Kt8KUnyrc9f8sIz2BFeY2ErOSnbw=;
 b=nHIw2XoBeWMRXlCsu9PUgJyIW4tpqj45c/737Us693MPuxcyQ1qPZIOdAKc9HdSRJQ
 leb7UkhsilReMM0yQxdSklY6e/zswNvaqsYk3Ub1XrQGcI43VCWgbnDXptMYKPf0iryH
 lUjLJodqHzpz2V83bY4Xg6ORGD9HpJ8c5jPJsWQPZeRBHRxPeO6eyNktCFd3WQmVzMiZ
 +qbBr+f4VuilmP7Fpm13Q5KXqXSY2lmgNMtsEvSHMZJfFGG/Z+iUyUnVkR3+xeFp0dlg
 upL9x2WHV9KefTT6dCmKWvyJ/tpVomUjw5HUJQ3zddNQpFhtwRf59Wj9g9WVCUhiUhNV
 YsUQ==
X-Gm-Message-State: AOAM5306Eq95MoTPQYiNrZJIpt1gPnR/9pv42OxIlPIbus/2UNwa4/8e
 tfEvSfCuFMdm4VQoZxN+O79LgVm3dk9cMyAX/WD1dkXWaV4=
X-Google-Smtp-Source: ABdhPJwUWpeStzZVStcTtMkB9sVhcBEQ0zBxC1Y+XUQuDq3K664tWjllfL2a80kV0Al4VEie8UBk6YqgBtg96L8MKY0=
X-Received: by 2002:a92:c052:: with SMTP id o18mr14598479ilf.245.1610361090342; 
 Mon, 11 Jan 2021 02:31:30 -0800 (PST)
MIME-Version: 1.0
References: <20210108185154.8108-1-leif@nuviainc.com>
 <20210108185154.8108-4-leif@nuviainc.com>
In-Reply-To: <20210108185154.8108-4-leif@nuviainc.com>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Mon, 11 Jan 2021 11:31:42 +0100
Message-ID: <CABoDooP_z68nwT6bi_xsZ156040tiP1qD1W=GOVAjg2D5Xg1pw@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] target/arm: make ARMCPU.ctr 64-bit
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=laurent.desnogues@gmail.com; helo=mail-il1-x130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 8, 2021 at 7:51 PM Leif Lindholm <leif@nuviainc.com> wrote:
>
> When FEAT_MTE is implemented, the AArch64 view of CTR_EL0 adds the
> TminLine field in bits [37:32].
> Extend the ctr field to be able to hold this context.
>
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>

Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>

Thanks,

Laurent

> ---
>  target/arm/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index fadd1a47df..063228de2a 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -931,7 +931,7 @@ struct ARMCPU {
>      uint64_t midr;
>      uint32_t revidr;
>      uint32_t reset_fpsid;
> -    uint32_t ctr;
> +    uint64_t ctr;
>      uint32_t reset_sctlr;
>      uint64_t pmceid0;
>      uint64_t pmceid1;
> --
> 2.20.1
>

