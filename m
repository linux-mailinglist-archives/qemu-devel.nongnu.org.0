Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6602A53CD88
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 18:51:08 +0200 (CEST)
Received: from localhost ([::1]:42438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxAVv-0000V6-Hb
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 12:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxAUD-0008Ff-Uq
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 12:49:21 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:39684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxAUC-00026D-Fk
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 12:49:21 -0400
Received: by mail-pg1-x532.google.com with SMTP id q123so7631287pgq.6
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 09:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FP/0cBWYyQnmV5201R7oVWuaIjv5RaFw70neQP9wz4E=;
 b=i3pzUknT4/OEgAOKAvvi+ws4x88N4ewNMgUN+ot/7zjbQni7H8XI+/vFoC+mHo7U5D
 nMFSTm8TGwqfSOKstYuQGq6UU2VvtGbCyz4V3UGSMJ1p/Ys5015O1ZnF0zTjdgRmDF7E
 MqwJ5efDzcITWeUmgan3ii3H79xEFGZtMzHhfC491BZU1BMRb5YOLra0um+/042HejAu
 VueAPFznK0PwoVerhT8qKGUDaufgoUp50HIOqL/spxubuU49Fe7+/8IcdFKmTO7sKPOx
 lnOIRMrYsnyKE+DlNBr753Wl4ver608fedRs2kNWh8BhT/lH4zR0OyQ09Yjbz1FAk4je
 gQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FP/0cBWYyQnmV5201R7oVWuaIjv5RaFw70neQP9wz4E=;
 b=PnlydWO7AYv/l68GQpWSZ9WoI8emAY4u06+lXRUsZawOhiNwgRWSJg9/w3ALCaMAQR
 3zlTiKKVE1LWA701s3vvY8O49+XAE6eorUjrii+ralxfboOPd0ieqsjMsiYVxUoAVnLL
 lbeRGvyRJRduPWo2fIPXGLSPbsZl3p8DrfXwgBTgx01oN3MljA3R1zR542f6Qs3MFf8J
 IPthocJoxG6yRAe0DV5Yn6SObNd+Csxt8Y/CpjMA0pk+MVmnI/ihVXwLHO9wDwArosnT
 pG/Fqxk/GtbMYEBd58PrLJYZL+n9FtoTZbko84X8t02+s8h5PedyWjEM01YdKTV8rO8y
 U4qA==
X-Gm-Message-State: AOAM532vIlrBLEs0wK8R3PC1y7QHr3Zg0ELmLO5Dow7A4FTRIOmvyvva
 o4VEqRar0hoq9XM2tuuJ4y0eOYqUnmD/Zw==
X-Google-Smtp-Source: ABdhPJwBONF4oTCL0DC2ieOHkFNFaeqgH1SCcTULGealDfrZ22wrRZRoqMdp2GVZMrSDkLFz15TdAA==
X-Received: by 2002:a63:2cc3:0:b0:3db:5e24:67fa with SMTP id
 s186-20020a632cc3000000b003db5e2467famr9587555pgs.46.1654274958866; 
 Fri, 03 Jun 2022 09:49:18 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3286:cc26:3d5e:3f94?
 ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 s204-20020a632cd5000000b003fcc1a5da4csm4567716pgs.28.2022.06.03.09.49.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 09:49:18 -0700 (PDT)
Message-ID: <0a73c592-7ed4-df30-16c2-71fa41dfb474@linaro.org>
Date: Fri, 3 Jun 2022 09:49:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v6 40/43] hw/loongarch: Add LoongArch power manager support
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mst@redhat.com,
 imammedo@redhat.com, ani@anisinha.ca, mark.cave-ayland@ilande.co.uk
References: <20220601102509.985650-1-yangxiaojuan@loongson.cn>
 <20220601102509.985650-41-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220601102509.985650-41-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/22 03:25, Xiaojuan Yang wrote:
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   hw/loongarch/loongson3.c | 45 +++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 44 insertions(+), 1 deletion(-)
> 

Acked-by: Richard Henderson <richard.henderson@linaro.org>

> +#define PM_BASE 0x10080000
> +#define PM_SIZE 0x100
> +#define PM_CTRL 0x10
> +
> +static uint64_t loongarch_virt_pm_read(void *opaque, hwaddr addr, unsigned size)
> +{
> +    return 0;
> +}
> +
> +static void loongarch_virt_pm_write(void *opaque, hwaddr addr,
> +                               uint64_t val, unsigned size)
> +{
> +    if (addr != PM_CTRL) {
> +        return;
> +    }
> +
> +    switch (val) {
> +    case 0x00:
> +        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> +        return;
> +    case 0xff:
> +        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +        return;
> +    default:
> +        return;
> +    }
> +}

It would be nice to add a comment that this is a placeholder for missing ACPI, and will 
eventually be replaced.


r~

