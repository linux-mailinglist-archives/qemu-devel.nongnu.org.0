Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C43EC344850
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 15:57:33 +0100 (CET)
Received: from localhost ([::1]:42302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOLzo-0004JA-SW
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 10:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOLGp-0005gw-Bt
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:11:03 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:44550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOLGn-0001LE-3D
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:11:02 -0400
Received: by mail-ed1-x529.google.com with SMTP id j3so19479598edp.11
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 07:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7TpV+bCO2xaHCJsOvJimOy4ll+LR+x9pNBj3mDgNrr8=;
 b=EUAbsjlsbLgq3UIvBmNVsJ3Y7p7eNJwCcFg/W78WpN+c/G468lNM2gMu3vAhUyWrK1
 qYYvVHjqQsLvJ3F6X7hIRT+uMSSZpHUvxhXc4i5U6ZCzxlYTmVk+hBU/aQWzeQZXd73Z
 oPuzdRwTXhNZbI7MGFEmaSjwV/J3XNomEotRjunwhq84mOvbY9QVkxCyCi+alAqyswYJ
 OWVWGoWjWgIZwvbMZWnNtoqlwDmK9vkIkU27QyVAhK2nBGA1bH22i8Y2PPvoTmCqtIlQ
 ZS+4uITMSooxpVLHkzxY8LR7PWJX+/WlpghWxiucwKGsDhEg6LukA/tM/qjGWspg38ul
 2InQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7TpV+bCO2xaHCJsOvJimOy4ll+LR+x9pNBj3mDgNrr8=;
 b=WJoAN4KW87fUSoVk11k4rv8PhRfzTObDSz5NIxbqqwGeeXdztEfijkFRkjC8ohWzfD
 at74OygjJuRMhflAY8+OWB77GFfwbRTRrlRJaQ9gCUh6CyfnQWMD91iBfqI0Zifjwag6
 HHEA5Gho4fNTugH9lY+5u3qF5dcNE33acYXWrXRxd8ISfKuiICzhOVh75l4uhDz1iTPX
 HVsPWh95aSERxEKWfUXzFvxs4N8xEqpc9v9lT8XSxeOUCRsbu9kRFkq5yQKvCjkJHCn4
 BPqZEXDrY31Qb9r07aMaEjn9n1ru5IUHRTgZMiM4/56+Pcpv1o3Mg6A9Tki3SIH3xRNO
 5H6Q==
X-Gm-Message-State: AOAM531Kz5D7HUNEYNh7Eqd0Mqc29DVn1PfZa9GtzFioWwMByO08FFwY
 jck29ZyncdhNB9kMVizbDjnyaLqAol3n3ftfDUww9eoWrqxrQw==
X-Google-Smtp-Source: ABdhPJy/kL955D2LPVfTMu5iYHDNDAe6SlHuemAb6Lc/cCCV7XwIqh2LB89zWZcdc0apS11EINTp41m301I7r7jxpIs=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr25611320edv.44.1616422259335; 
 Mon, 22 Mar 2021 07:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210320000606.1788699-1-richard.henderson@linaro.org>
In-Reply-To: <20210320000606.1788699-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Mar 2021 14:10:31 +0000
Message-ID: <CAFEAcA_gVEMzgaVgE5U6hvoE+H38EiCr7NeZejVHztJta5sM=g@mail.gmail.com>
Subject: Re: [PATCH for-6.0] target/arm: Set ARMMMUFaultInfo.level in
 user-only arm_cpu_tlb_fill
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 20 Mar 2021 at 00:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pretend the fault always happens at page table level 3.
>
> Failure to set this leaves level = 0, which is impossible for
> ARMFault_Permission, and produces an invalid syndrome, which
> reaches g_assert_not_reached in cpu_loop.
>
> Fixes: 8db94ab4e5db ("linux-user/aarch64: Pass syndrome to EXC_*_ABORT")
> Reported-by: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tlb_helper.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
> index 9609333cbd..3107f9823e 100644
> --- a/target/arm/tlb_helper.c
> +++ b/target/arm/tlb_helper.c
> @@ -163,6 +163,7 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>      } else {
>          fi.type = ARMFault_Translation;
>      }
> +    fi.level = 3;
>
>      /* now we have a real cpu fault */
>      cpu_restore_state(cs, retaddr, true);


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

