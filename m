Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9777509E55
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:13:49 +0200 (CEST)
Received: from localhost ([::1]:47972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhUku-00041g-UD
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUYR-0001O6-53
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:00:56 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:35572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUYK-0007sK-P5
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:00:54 -0400
Received: by mail-yb1-xb35.google.com with SMTP id t67so8085915ybi.2
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6hIdhswsfcl65vmDp9ezeh89wHPSBVwDl2kytfmBQPU=;
 b=Pc3xanMjpZzljSTieaCVGCvs7h08nKpUXF/XATLBgXBeuIFKjXA/g6FXZxzFGenPPp
 R2YyaCX2olaRL68RRGltIBgreXkhphnKGnmGRhgorYPIimW27yD7jtmY/JW0n3G2aKxU
 aQyOhl1GAUY3bf6A8Izett9KlfNa22SG3qVYto00S6QpV4YsRh6kRG6xWPjuYIQASWcg
 0wmadze5j6EjO5I3kehSEYnGVAfaMOH8bHl7ypyNodyunELCVTSnkggsyTOr23VjQ8K1
 nM5cq+ifO1nVD4Baq3IzeXzakfGoeRpFp3D4lYHu4ueoxFwvauvXvZOxGq6E9ev5owWu
 o26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6hIdhswsfcl65vmDp9ezeh89wHPSBVwDl2kytfmBQPU=;
 b=6mJljwh6rar12vKNPG2jL0+qaHhMWdpxzsavFsgESeeHcx/otLoOGe7aolI1tcq68J
 fOt25R6ezQsADs5k06bM0UY2eVMpkQ1CooL6gi5S/SaPBjSxz/rlV4RrYiClO+eAh/VR
 2sAtpYjIYclG5o2sEUrXo16qMtRBDoxzAKSJiKZvZ5YhFdh1EcNQK9Rj83Yz6vuZ21En
 Akp10TQqcKub6+HQmTE1o60820ZOcr4Kjck8Yz1I+nzmh7yt5JW3MpSNAyX2pBjvLpYb
 cGDZg2wvdg4681WZ+fyYeS22gKDRaP4eJaVYdaErKz/29YC31m+uRphXnjP8EhBjO3q0
 Zdgw==
X-Gm-Message-State: AOAM530PMUiIRRB3TJm2TkKU/bbn4C789jQjL+1YMFniH0A/GQ96f4xB
 etpod2NsvDdfpJwbyba0UqvbK0a89roP63OM44SJ5Q==
X-Google-Smtp-Source: ABdhPJy3Ebn6WdHkIoF52cza3iZAwgSqySLFfWwplNcfuiJAIMMNql3WxhtiMDE2JXv+4dGGLqJOKC/L1k9FgW+0B40=
X-Received: by 2002:a05:6902:390:b0:645:7d46:f1db with SMTP id
 f16-20020a056902039000b006457d46f1dbmr385235ybs.85.1650538847566; Thu, 21 Apr
 2022 04:00:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
 <20220405223640.2595730-7-wuhaotsh@google.com>
In-Reply-To: <20220405223640.2595730-7-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 12:00:36 +0100
Message-ID: <CAFEAcA9TG60w87c0SpLA85g4ogCYTX0gi=ihNQaRQkpaoh1MYw@mail.gmail.com>
Subject: Re: [PATCH for-7.1 06/11] hw/intc: Add a property to allow GIC to
 reset into non secure mode
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Uri.Trichter@nuvoton.com, titusr@google.com, venture@google.com,
 hskinnemoen@google.com, qemu-devel@nongnu.org, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, Vishal.Soni@microsoft.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 5 Apr 2022 at 23:38, Hao Wu <wuhaotsh@google.com> wrote:
>
> This property allows certain boards like NPCM8xx to boot the kernel
> directly into non-secure mode. This is necessary since we do not
> support secure boot features for NPCM8xx now.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Patrick Venture <venture@google.com>
> ---
>  hw/intc/arm_gic_common.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
> index 7b44d5625b..7ddc5cfbd0 100644
> --- a/hw/intc/arm_gic_common.c
> +++ b/hw/intc/arm_gic_common.c
> @@ -358,6 +358,8 @@ static Property arm_gic_common_properties[] = {
>      /* True if the GIC should implement the virtualization extensions */
>      DEFINE_PROP_BOOL("has-virtualization-extensions", GICState, virt_extn, 0),
>      DEFINE_PROP_UINT32("num-priority-bits", GICState, n_prio_bits, 8),
> +    /* True if we want to directly booting a kernel into NonSecure */
> +    DEFINE_PROP_BOOL("irq-reset-nonsecure", GICState, irq_reset_nonsecure, 0),
>      DEFINE_PROP_END_OF_LIST(),
>  };

This isn't how this is supposed to work. Non-firmware (ie Linux
kernel boots) that have to emulate firmware init arrange to get
the irq_reset_nonsecure flag set because the GIC implements the
TYPE_ARM_LINUX_BOOT_IF and the boot.c code calls the callback
for every device that implements that interface. For firmware
boots, the firmware has to set up the GIC the way it wants.

thanks
-- PMM

