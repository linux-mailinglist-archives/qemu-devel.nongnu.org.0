Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4A93D3BB0
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 16:13:36 +0200 (CEST)
Received: from localhost ([::1]:60744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6vvj-0007mn-3Q
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 10:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m6vud-0006q5-L6; Fri, 23 Jul 2021 10:12:27 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:44829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m6vuc-0000e6-56; Fri, 23 Jul 2021 10:12:27 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 j6-20020a05600c1906b029023e8d74d693so1703040wmq.3; 
 Fri, 23 Jul 2021 07:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VvLPOw+Gd7+ziLCFwk3tiDJhokiRJzD12v5ybSsAve8=;
 b=KkTXB3OtRik78WZ+zIdipFOHpWPrhZuTB6nEGRfaVgyhvZ/cJXsp5cBWfigbKDUCUc
 FQ7gEmH8gqRjB3XfYTZYZJoMM4ZXRKTrWlH4sCLBjI3Gykk+lZibsZA3zq7wSdiTEMmg
 1chISGHZvoWYQ8eDLCQQZ+RgsDZr00TrSZttZWc7QU6XvTw4RRJcFZWZpnJRDZy5s9d5
 XQLs7j/Q65bq5YFxo19EXrLhScFg4rGZS/sl/Mhe3rOGC+JHgSntiSQWrZknEU0L+dte
 duE6kaWbnF3IJ1Zi3TBg/bmyzVgpspsvSNcG/S7LZRW1QzXxLcHHrdbdU20ASRVIcSCn
 4rAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VvLPOw+Gd7+ziLCFwk3tiDJhokiRJzD12v5ybSsAve8=;
 b=ph2LI9nIZfKKeItA9jMhlczc/XK8pTE3Ek7J08qJ+Sqqhc2Q059UIHBMVgh5VxfUbA
 fiXOMi3RiWPp/h8y6EMEeSAOsYPUGO/mWreu5GBDoVln/f5XYYUORGW9Keb9J6uCb7+M
 6/Nc6l4YhVcqIqkXjSbOe1XM6tE8CEHg0BOie3Qno57vGsXcqxAsA5Yhywtgc02lAbkx
 Keg+BbFTymFsLRQWsvGQ44fn6oU1w3lPojFmhC5tIJYaD19k7rFg0E3EAlGWFfldEu1K
 3IXJWrN4TQgrxvYWE+q4GTLzQwXd8IqShZE9+Zh6o7JQekFJ/0c0CNU6t1Y4rtgjPYO1
 tFSA==
X-Gm-Message-State: AOAM533MAe+VhetSHBmkMWPVCD/yW3o2z041mQUm2IowV5fng59PYElb
 KUArauFlJc2JVJ+e5pnJwted6BX6yc9AbA==
X-Google-Smtp-Source: ABdhPJx26s5FAbMbEWT1Sc3wJK3kUbBtq/pSQT0AMd/swVmmLBB1MluJ73q1Vim8XT5xGgX4ZDnjYQ==
X-Received: by 2002:a1c:7fc5:: with SMTP id a188mr4831720wmd.133.1627049544165; 
 Fri, 23 Jul 2021 07:12:24 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id p2sm27409566wma.27.2021.07.23.07.12.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 07:12:23 -0700 (PDT)
Subject: Re: [PATCH] hw/intc/arm_gic: Fix set/clear pending of PPI/SPI
To: Sebastian Huber <sebastian.huber@embedded-brains.de>,
 qemu-devel@nongnu.org, qemu-arm <qemu-arm@nongnu.org>
References: <20210709094948.60344-1-sebastian.huber@embedded-brains.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <12832e23-e576-3fad-3439-c12cfef602b5@amsat.org>
Date: Fri, 23 Jul 2021 16:12:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709094948.60344-1-sebastian.huber@embedded-brains.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.203,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing qemu-arm@

On 7/9/21 11:49 AM, Sebastian Huber wrote:
> According to the GICv3 specification register GICD_ISPENDR0 is Banked for each
> connected PE with GICR_TYPER.Processor_Number < 8.  For Qemu this is the case
> since GIC_NCPU == 8.
> 
> For SPI, make the interrupt pending on all CPUs and not just the processor
> targets of the interrupt.
> 
> This behaviour is at least present on the i.MX7D which uses an Cortex-A7MPCore.
> 
> Signed-off-by: Sebastian Huber <sebastian.huber@embedded-brains.de>
> ---
>  hw/intc/arm_gic.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index a994b1f024..8e377bac59 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -1294,12 +1294,14 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
>  
>          for (i = 0; i < 8; i++) {
>              if (value & (1 << i)) {
> +                int cm = (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_MASK;
> +
>                  if (s->security_extn && !attrs.secure &&
>                      !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
>                      continue; /* Ignore Non-secure access of Group0 IRQ */
>                  }
>  
> -                GIC_DIST_SET_PENDING(irq + i, GIC_DIST_TARGET(irq + i));
> +                GIC_DIST_SET_PENDING(irq + i, cm);
>              }
>          }
>      } else if (offset < 0x300) {
> @@ -1317,11 +1319,10 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
>                  continue; /* Ignore Non-secure access of Group0 IRQ */
>              }
>  
> -            /* ??? This currently clears the pending bit for all CPUs, even
> -               for per-CPU interrupts.  It's unclear whether this is the
> -               corect behavior.  */
>              if (value & (1 << i)) {
> -                GIC_DIST_CLEAR_PENDING(irq + i, ALL_CPU_MASK);
> +                int cm = (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_MASK;
> +
> +                GIC_DIST_CLEAR_PENDING(irq + i, cm);
>              }
>          }
>      } else if (offset < 0x380) {
> 


