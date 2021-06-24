Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1D23B2AF8
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 11:03:16 +0200 (CEST)
Received: from localhost ([::1]:35870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwLGV-0007L3-FE
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 05:03:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwLFK-0006dr-C5
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 05:02:02 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:39727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwLFI-0000l7-JN
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 05:02:02 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso5716819wmh.4
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 02:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2+Mf07vnf3wx6SfB14Nnp+fW6eVChT88RWsROpccN8c=;
 b=BsoD4YbpA1YDdvDCk6VrVKUOO1aGzhwRMPsn1V97772Q4obSFufXFSkgzEJ5NImg/t
 /gWxkkaaykzsIV0ryWF3MlFcLN2BUfOOgqVddccH+hjgSl+Q2cHVp7dr9I1DczXFL+aH
 g+BTdY0xuCMU4YTKud1a66xWnbiXZkEN88zXRrKimqRc7zhB59S4+JKnYOyF/ohxbKbE
 wbLPIQFo2NVJ0kLGPVwH8PDhgtJO0hkH2v/v0OZTENOrYMsj8iE5XgPO/CKjQboMupy3
 KMgX2ux44l4OyITCcus1uIlE1yVNXueDPQUKcsCbKDHCxOE+xXMPjbZxC2LG3rUrcw3l
 BAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2+Mf07vnf3wx6SfB14Nnp+fW6eVChT88RWsROpccN8c=;
 b=gesYY63+1lIvM2w0GVCLPSV9yaNR4Pfe+AaoRAqgleWirtOHNh5z/MCBKyXhOIWEZn
 GagF2OAmryad83R33qqBftbvqLo5u3e42Jf6oTY3Ib+Ihx5vEJ7p6NkeGZdDrsrs3XzR
 h/2asTgYvZ4YnDTFMZIm6lYqig4nR6E1dv8w9PEKbK+dFaUIsRfHRUSFhFQuC/jY/mEb
 nWx0cZS7caNZUxpjv/PvLCyrmgyaO/UN2pWRFzg47BxwZ+Ei7uSnLlOzuDDPjYaK0kSL
 CBLI6eeMDmuTqlgTugpGXGsNrDP0d3IYHq/L09+TbZvHXUqzkLpNkJIUoHA6yqyC1lwH
 DoPg==
X-Gm-Message-State: AOAM530ek85OTR/pe60ng5Nn/FXfVEZdEx8Z9TVFz0aidqL7//yjS24g
 o6kD/tnTVmXauT+yHgaG/extUp+V2NiK+Q==
X-Google-Smtp-Source: ABdhPJxxv+gvvKvWD/MMF0yshgqMBntqhLZLcGjkMjQdFXLDNmojvLLqnN4UF6HyNtk3L8fk+y+bOA==
X-Received: by 2002:a05:600c:321a:: with SMTP id
 r26mr2996496wmp.90.1624525318768; 
 Thu, 24 Jun 2021 02:01:58 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id p5sm2750038wrd.25.2021.06.24.02.01.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 02:01:58 -0700 (PDT)
Subject: Re: [PATCH 2/3] hw/rx: rx62n switch renesas_timer.
To: Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-devel@nongnu.org
References: <20210623123416.60038-1-ysato@users.sourceforge.jp>
 <20210623123416.60038-3-ysato@users.sourceforge.jp>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a9d6e10d-2ce9-4db1-8f66-7fbce6ee3653@amsat.org>
Date: Thu, 24 Jun 2021 11:01:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210623123416.60038-3-ysato@users.sourceforge.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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

Hi Yoshinori,

On 6/23/21 2:34 PM, Yoshinori Sato wrote:
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  include/hw/rx/rx62n.h | 4 ++--
>  hw/rx/Kconfig         | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/rx/rx62n.h b/include/hw/rx/rx62n.h
> index 3ed80dba0d..c35bf3998c 100644
> --- a/include/hw/rx/rx62n.h
> +++ b/include/hw/rx/rx62n.h
> @@ -27,7 +27,7 @@
>  #include "target/rx/cpu.h"
>  #include "hw/intc/rx_icu.h"
>  #include "hw/timer/renesas_tmr.h"
> -#include "hw/timer/renesas_cmt.h"
> +#include "hw/timer/renesas_timer.h"
>  #include "hw/char/renesas_sci.h"
>  #include "qemu/units.h"
>  #include "qom/object.h"
> @@ -56,7 +56,7 @@ struct RX62NState {
>      RXCPU cpu;
>      RXICUState icu;
>      RTMRState tmr[RX62N_NR_TMR];
> -    RCMTState cmt[RX62N_NR_CMT];
> +    RenesasCMTState cmt[RX62N_NR_CMT];
>      RSCIState sci[RX62N_NR_SCI];
>  
>      MemoryRegion *sysmem;
> diff --git a/hw/rx/Kconfig b/hw/rx/Kconfig
> index 2b297c5a6a..f9cb892633 100644
> --- a/hw/rx/Kconfig
> +++ b/hw/rx/Kconfig
> @@ -2,7 +2,7 @@ config RX62N_MCU
>      bool
>      select RX_ICU
>      select RENESAS_TMR
> -    select RENESAS_CMT
> +    select RENESAS_TIMER
>      select RENESAS_SCI
>  
>  config RX_GDBSIM
> 

I am confused, your patch seems incomplete... missing:

-- >8 --
diff --git a/include/hw/rx/rx62n.h b/include/hw/rx/rx62n.h
index c35bf3998c7..a34b845e1e7 100644
--- a/include/hw/rx/rx62n.h
+++ b/include/hw/rx/rx62n.h
@@ -26,7 +26,6 @@

 #include "target/rx/cpu.h"
 #include "hw/intc/rx_icu.h"
-#include "hw/timer/renesas_tmr.h"
 #include "hw/timer/renesas_timer.h"
 #include "hw/char/renesas_sci.h"
 #include "qemu/units.h"
@@ -55,7 +54,7 @@ struct RX62NState {

     RXCPU cpu;
     RXICUState icu;
-    RTMRState tmr[RX62N_NR_TMR];
+    RenesasTMUState tmr[RX62N_NR_TMR];
     RenesasCMTState cmt[RX62N_NR_CMT];
     RSCIState sci[RX62N_NR_SCI];

diff --git a/include/hw/timer/renesas_timer.h
b/include/hw/timer/renesas_timer.h
index dc0711ba832..ccf2e64b702 100644
--- a/include/hw/timer/renesas_timer.h
+++ b/include/hw/timer/renesas_timer.h
@@ -30,6 +30,7 @@ enum {

 enum {
     CMT_NR_IRQ = 1 * TIMER_CH_CMT,
+    TMU_NR_IRQ = 1 * TIMER_CH_TMU,
 };

 enum {

diff --git a/hw/rx/rx62n.c b/hw/rx/rx62n.c
index fa5add9f9db..626d027a2db 100644
--- a/hw/rx/rx62n.c
+++ b/hw/rx/rx62n.c
@@ -163,13 +163,13 @@ static void register_tmr(RX62NState *s, int unit)
     int i, irqbase;

     object_initialize_child(OBJECT(s), "tmr[*]",
-                            &s->tmr[unit], TYPE_RENESAS_TMR);
+                            &s->tmr[unit], TYPE_RENESAS_TMU);
     tmr = SYS_BUS_DEVICE(&s->tmr[unit]);
     qdev_prop_set_uint64(DEVICE(tmr), "input-freq", s->pclk_freq_hz);
     sysbus_realize(tmr, &error_abort);

-    irqbase = RX62N_TMR_IRQ + TMR_NR_IRQ * unit;
-    for (i = 0; i < TMR_NR_IRQ; i++) {
+    irqbase = RX62N_TMR_IRQ + TMU_NR_IRQ * unit;
+    for (i = 0; i < TMU_NR_IRQ; i++) {
         sysbus_connect_irq(tmr, i, s->irq[irqbase + i]);
     }
     sysbus_mmio_map(tmr, 0, RX62N_TMR_BASE + unit * 0x10);
---

Have I misunderstood the point of your series?

Regards,

Phil.

