Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 333CF2D3E03
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 09:59:36 +0100 (CET)
Received: from localhost ([::1]:54588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmvJv-0003gT-4G
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 03:59:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kmvB7-0000Ym-SV
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 03:50:29 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:46614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kmvB6-0004DH-2w
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 03:50:29 -0500
Received: from [192.168.61.100] (lfbn-lyo-1-447-149.w2-7.abo.wanadoo.fr
 [2.7.4.149])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 513FF21CD2;
 Wed,  9 Dec 2020 08:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1607503826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sNdqjCfShFF+WPCJ6EShyv8kSL/2cfEp7XK2TzOeoM8=;
 b=wOsntz2G0d/lywEvR/YsgXFuRJARYSPrR4O6jK8r2raaSvE0ns1oztgWWWyrnVkJB6KHFv
 iLwB3FEvgDv2A08gxYwNtZzvVqHz0P5OIOzIdMopLTVCEQz6rsoEanv399ZxPytfpfNT1D
 zUrO/cXO/F1JOs1+n+AInx5RXj3pobI=
Subject: Re: [PATCH 4/4] clock: Define and use new clock_display_freq()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201208181554.435-1-peter.maydell@linaro.org>
 <20201208181554.435-5-peter.maydell@linaro.org>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <7eff2b82-8649-8ccf-8db2-d24b6bae46b8@greensocs.com>
Date: Wed, 9 Dec 2020 09:50:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201208181554.435-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 7:15 PM, Peter Maydell wrote:
> It's common to want to print a human-readable indication of a clock's
> frequency. Provide a utility function in the clock API to return a
> string which is a displayable representation of the frequency,
> and use it in qdev-monitor.c.
> 
> Before:
> 
>    (qemu) info qtree
>    [...]
>    dev: xilinx,zynq_slcr, id ""
>      clock-in "ps_clk" freq_hz=3.333333e+07
>      mmio 00000000f8000000/0000000000001000
> 
> After:
> 
>    dev: xilinx,zynq_slcr, id ""
>      clock-in "ps_clk" freq_hz=33.3 MHz
>      mmio 00000000f8000000/0000000000001000
> 
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
> This is based on Philippe's patch
> "qdev-monitor: Display frequencies scaled to SI unit"
> but I have abstracted out the "prettified string" into the clock API.
> ---
>   docs/devel/clocks.rst  |  5 +++++
>   include/hw/clock.h     | 12 ++++++++++++
>   hw/core/clock.c        |  6 ++++++
>   softmmu/qdev-monitor.c |  6 +++---
>   4 files changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
> index 9a93d1361b4..cf8067542a1 100644
> --- a/docs/devel/clocks.rst
> +++ b/docs/devel/clocks.rst
> @@ -267,6 +267,11 @@ Here is an example:
>                           clock_get(dev->my_clk_input));
>       }
>   
> +If you are only interested in the frequency for displaying it to
> +humans (for instance in debugging), use ``clock_display_freq()``,
> +which returns a prettified string-representation, e.g. "33.3 MHz".
> +The caller must free the string with g_free() after use.
> +
>   Calculating expiry deadlines
>   ----------------------------
>   
> diff --git a/include/hw/clock.h b/include/hw/clock.h
> index 9c0b1eb4c3f..7bc9afb0800 100644
> --- a/include/hw/clock.h
> +++ b/include/hw/clock.h
> @@ -252,4 +252,16 @@ static inline bool clock_is_enabled(const Clock *clk)
>       return clock_get(clk) != 0;
>   }
>   
> +/**
> + * clock_display_freq: return human-readable representation of clock frequency
> + * @clk: clock
> + *
> + * Return a string which has a human-readable representation of the
> + * clock's frequency, e.g. "33.3 MHz". This is intended for debug
> + * and display purposes.
> + *
> + * The caller is responsible for freeing the string with g_free().
> + */
> +char *clock_display_freq(Clock *clk);
> +
>   #endif /* QEMU_HW_CLOCK_H */
> diff --git a/hw/core/clock.c b/hw/core/clock.c
> index 8c6af223e7c..76b5f468b6e 100644
> --- a/hw/core/clock.c
> +++ b/hw/core/clock.c
> @@ -12,6 +12,7 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "qemu/cutils.h"
>   #include "hw/clock.h"
>   #include "trace.h"
>   
> @@ -111,6 +112,11 @@ static void clock_disconnect(Clock *clk)
>       QLIST_REMOVE(clk, sibling);
>   }
>   
> +char *clock_display_freq(Clock *clk)
> +{
> +    return freq_to_str(clock_get_hz(clk));
> +}
> +
>   static void clock_initfn(Object *obj)
>   {
>       Clock *clk = CLOCK(obj);
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index bf79d0bbcd9..6263d600026 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -747,11 +747,11 @@ static void qdev_print(Monitor *mon, DeviceState *dev, int indent)
>           }
>       }
>       QLIST_FOREACH(ncl, &dev->clocks, node) {
> -        qdev_printf("clock-%s%s \"%s\" freq_hz=%e\n",
> +        g_autofree char *freq_str = clock_display_freq(ncl->clock);
> +        qdev_printf("clock-%s%s \"%s\" freq_hz=%s\n",
>                       ncl->output ? "out" : "in",
>                       ncl->alias ? " (alias)" : "",
> -                    ncl->name,
> -                    CLOCK_PERIOD_TO_HZ(1.0 * clock_get(ncl->clock)));
> +                    ncl->name, freq_str);
>       }
>       class = object_get_class(OBJECT(dev));
>       do {
> 

