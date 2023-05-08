Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF156FB6D6
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 21:42:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw6jc-0000XS-9G; Mon, 08 May 2023 15:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1pw6jZ-0000UA-Pr; Mon, 08 May 2023 15:41:21 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1pw6jX-0002RM-UB; Mon, 08 May 2023 15:41:21 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f22908a082so2559581e87.1; 
 Mon, 08 May 2023 12:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683574877; x=1686166877;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AS9hwBRrLwBVLGSk1mb4Bne5rt3KNvkrXmBGX3oVvjI=;
 b=VPZfiOtQhfi8Nvu9+I6RxDGr0QsuG2c7neu8f05uiJa3707aVP1hFvhIi6CwQR/Uvi
 3ss54ThRKHlJmM4b3MYYAgr8kQSJdnaezGfbv8dWFE97kUXQSGk21aSoKYFnMmBBchaf
 SAw+jxkpnkWBgDPhLMfz8XbotLevOsFbe1lZV2cvvkvhlAX3Zz2V18EWzDpScSHIRHg1
 N49SZZRm8J/Tl4xOUVK2BkzEzzJBR37fVVe9B5GmqiM3qdMxHvqQr9pBsA1WAK6sg1Xn
 r7pCG9GlpkjqHpQYWqu48pYla7aXMoA2Y6pS9zigflqhvrSTVRqgtveg5w8JXp42L/yZ
 Rlug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683574877; x=1686166877;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AS9hwBRrLwBVLGSk1mb4Bne5rt3KNvkrXmBGX3oVvjI=;
 b=NYNo4pGnU0ocd7xRD6fFi5rLgHLSiwHJzx03mTi8sAaYxTK2WGI5V142RfHlCiSaSl
 BfrM8X2tVXFeyvjdxSTGfZRFAW+U3EyOyKnxOBhvvP3kEGAJAnqQD7dBRihkzhY/Mt+6
 3TV1dsRx1CGvAAfU4LAOVmf8ekkiIycKXW6yHqIMpggUvZ7W6stk/6Pw+mOvhSdjdG7S
 R3GucY7WKNlAfYQO+2nwMVYW/XZ9Q5uG1TC1jgOeE+7eoCYkCnEEvs6Ov7Pn1P6u3DtV
 vn0xe+g81upJRwZwkD1ZBxB/+j/DkMfDx6okjXQVuk3+yOluuKaqIjoyaLLcBQFBiS6n
 PpFQ==
X-Gm-Message-State: AC+VfDwIlvIW0oSXgJFK172I1ujTpQqrSI1ZAjEo4Ku3HJicjUC6omZO
 ILDGY4FmVphSO/s7cirfoeU=
X-Google-Smtp-Source: ACHHUZ6N9/sXtNndJ6nnTbtWMZ1ylvhcNBwOiP/2X3n1qvQbl95ek5kVVv4JE49zfnzVVDsd8RWBmA==
X-Received: by 2002:a19:760f:0:b0:4ed:d5b0:7fd9 with SMTP id
 c15-20020a19760f000000b004edd5b07fd9mr60675lff.19.1683574877506; 
 Mon, 08 May 2023 12:41:17 -0700 (PDT)
Received: from fralle-msi (217-76-87-243.cust.bredband2.com. [217.76.87.243])
 by smtp.gmail.com with ESMTPSA id
 b20-20020ac247f4000000b004eb0dcc52ddsm82350lfp.41.2023.05.08.12.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 May 2023 12:41:17 -0700 (PDT)
Date: Mon, 8 May 2023 21:41:15 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/net: Move xilinx_ethlite.c to the target-independent
 source set
Message-ID: <20230508194114.GC6984@fralle-msi>
References: <20230508120314.59274-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508120314.59274-1-thuth@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On [2023 May 08] Mon 14:03:14, Thomas Huth wrote:
> Now that the tswap() functions are available for target-independent
> code, too, we can move xilinx_ethlite.c from specific_ss to softmmu_ss
> to avoid that we have to compile this file multiple times.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  hw/net/xilinx_ethlite.c | 2 +-
>  hw/net/meson.build      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
> index 99c22819ea..89f4f3b254 100644
> --- a/hw/net/xilinx_ethlite.c
> +++ b/hw/net/xilinx_ethlite.c
> @@ -25,7 +25,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/module.h"
>  #include "qom/object.h"
> -#include "cpu.h" /* FIXME should not use tswap* */
> +#include "exec/tswap.h"
>  #include "hw/sysbus.h"
>  #include "hw/irq.h"
>  #include "hw/qdev-properties.h"
> diff --git a/hw/net/meson.build b/hw/net/meson.build
> index e2be0654a1..a7860c5efe 100644
> --- a/hw/net/meson.build
> +++ b/hw/net/meson.build
> @@ -43,7 +43,7 @@ softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_emc.c'))
>  softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_eth.c'))
>  softmmu_ss.add(when: 'CONFIG_COLDFIRE', if_true: files('mcf_fec.c'))
>  specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('spapr_llan.c'))
> -specific_ss.add(when: 'CONFIG_XILINX_ETHLITE', if_true: files('xilinx_ethlite.c'))
> +softmmu_ss.add(when: 'CONFIG_XILINX_ETHLITE', if_true: files('xilinx_ethlite.c'))
>  
>  softmmu_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('net_rx_pkt.c'))
>  specific_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('virtio-net.c'))
> -- 
> 2.31.1
> 
> 

