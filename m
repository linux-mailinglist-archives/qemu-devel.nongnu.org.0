Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AA92E85B9
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 22:33:39 +0100 (CET)
Received: from localhost ([::1]:46168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvS3G-0006df-1A
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 16:33:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvS2O-0006Ec-U2
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 16:32:46 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:38997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvS2L-000841-Qu
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 16:32:44 -0500
Received: by mail-wm1-x331.google.com with SMTP id 3so9933310wmg.4
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 13:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KgL2ePEMp0JfeG5rSbbcR8LgyAD2jBdAL6rNQo+/SFs=;
 b=pmmCmizMdGHDII5MHAm876cem+YVP8ltZik0dPAUIThwg9SDt4fxfDHPWEORJp08H6
 hai2loZnk2WrICJ0+BP/jdV8Vl/RKpsDqv6TY2CjYgvgZT0aaM2Kle31i/vYSafv9fC3
 79v2tvr7N/zUSeJ3E34O+jx7RuGWNJGI0HFrqoHE1sZRBy2/RXL7nEf2zGwUa9ULebyh
 rl0/BPJ0LAUX3CqKdhO65KPn4Q/APPnkyJy2im4sjlFhwdn0rkWJkhlp5o1M5N4mYuPC
 IUDOYWTTef0j3H4af7RAG0Jm7sr0Fr3z09886Vtsbg6fBo6F2DFrbiYoDlGXpCdMmzFe
 a8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KgL2ePEMp0JfeG5rSbbcR8LgyAD2jBdAL6rNQo+/SFs=;
 b=jQUU+Medv4hJYqfEKw4foP81tvImmrBIQ0Qu/JnT3GQyUVzQjSDva+zmbiJcUmcJLR
 ID9Wao03qnNWkHt7kL+elJXoNn2MDX3VePU2f9IGNluGE5M7cLyE6kgHWmKOxxOxSbnT
 oshlooSUHGAz3XGLvqR377DpkA17A/yz9jioZZkw0Hkwvm+rNNFKV6dsSCV2WUV7TUwy
 /842q+kDQQBJPjOeKGqp8/lmCqnXfDtKQu3c3X0mfi4pAoAX9Jj3AzPGnu+Z275yqywh
 3aASAca25hWOCq8Bz9qSvQCoQM7h5XGii4Kumga5JsPkndy7bCNtl01uwFb8p5XYBXLw
 xzZA==
X-Gm-Message-State: AOAM532Mf4uXktit2dHfsdJDVEEuaOo/plEJKDxu8oX3jszUXyJukpdL
 P186glS4xWDitvSIV7jOqXo=
X-Google-Smtp-Source: ABdhPJzIO/a3ZnDJRIuKd9vRsvbQS4lvSuMEUpdnhRo76tv6o8pa+KlYnuN6mQjDBSS+rIjNhs/+lg==
X-Received: by 2002:a1c:7f8c:: with SMTP id
 a134mr17257460wmd.184.1609536760299; 
 Fri, 01 Jan 2021 13:32:40 -0800 (PST)
Received: from [192.168.1.34] (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id z21sm18212021wmk.20.2021.01.01.13.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jan 2021 13:32:39 -0800 (PST)
Subject: Re: [PATCH v2 09/10] vt82c686: Convert debug printf to trace points
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1609121293.git.balaton@eik.bme.hu>
 <28d9455165261a9cfd2cc4a650b25f987e60295c.1609121293.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3088f630-ffc4-22e8-e04b-c3eff09bd9c4@amsat.org>
Date: Fri, 1 Jan 2021 22:32:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <28d9455165261a9cfd2cc4a650b25f987e60295c.1609121293.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.749,
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/28/20 3:08 AM, BALATON Zoltan via wrote:
> Drop DPRINTF and use trace functions instead. Two debug messages about
> unimplemented registers could be converted to qemu_log_mask() but in
> reality all registers are currently unimplemented (we just store and
> return values of writable regs but do nothing with them). As we
> already trace register access there's no need for additional debug
> messages so these are just removed and a comment is added as a reminder.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
> v2: Extended commit message
> 
>  hw/isa/trace-events |  6 ++++++
>  hw/isa/vt82c686.c   | 51 +++++++++++++--------------------------------
>  2 files changed, 21 insertions(+), 36 deletions(-)
> 
> diff --git a/hw/isa/trace-events b/hw/isa/trace-events
> index 3544c6213c..d267d3e652 100644
> --- a/hw/isa/trace-events
> +++ b/hw/isa/trace-events
> @@ -13,3 +13,9 @@ pc87312_io_write(uint32_t addr, uint32_t val) "write addr=0x%x val=0x%x"
>  # apm.c
>  apm_io_read(uint8_t addr, uint8_t val) "read addr=0x%x val=0x%02x"
>  apm_io_write(uint8_t addr, uint8_t val) "write addr=0x%x val=0x%02x"
> +
> +# vt82c686.c
> +via_isa_write(uint32_t addr, uint32_t val, int len) "addr 0x%x val 0x%x len 0x%x"
> +via_pm_write(uint32_t addr, uint32_t val, int len) "addr 0x%x val 0x%x len 0x%x"
> +via_superio_read(uint8_t addr, uint8_t val) "addr 0x%x val 0x%x"
> +via_superio_write(uint8_t addr, uint32_t val) "addr 0x%x val 0x%x"
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index cd87ec0103..d7ce15bf9f 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -27,14 +27,7 @@
>  #include "qemu/timer.h"
>  #include "exec/address-spaces.h"
>  #include "qom/object.h"
> -
> -/* #define DEBUG_VT82C686B */
> -
> -#ifdef DEBUG_VT82C686B
> -#define DPRINTF(fmt, ...) fprintf(stderr, "%s: " fmt, __func__, ##__VA_ARGS__)
> -#else
> -#define DPRINTF(fmt, ...)
> -#endif
> +#include "trace.h"
>  
>  typedef struct SuperIOConfig {
>      uint8_t config[0x100];
> @@ -55,12 +48,12 @@ static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
>  {
>      SuperIOConfig *superio_conf = opaque;
>  
> -    DPRINTF("superio_ioport_writeb  address 0x%x  val 0x%x\n", addr, data);
> -    if (addr == 0x3f0) {
> +    if (addr == 0x3f0) { /* config index register */
>          superio_conf->index = data & 0xff;
>      } else {
>          bool can_write = true;
> -        /* 0x3f1 */
> +        /* 0x3f1, config data register */
> +        trace_via_superio_write(superio_conf->index, data & 0xff);
>          switch (superio_conf->index) {
>          case 0x00 ... 0xdf:
>          case 0xe4:
> @@ -73,18 +66,7 @@ static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
>          case 0xfd ... 0xff:
>              can_write = false;
>              break;
> -        case 0xe7:
> -            if ((data & 0xff) != 0xfe) {
> -                DPRINTF("change uart 1 base. unsupported yet\n");
> -                can_write = false;
> -            }
> -            break;
> -        case 0xe8:
> -            if ((data & 0xff) != 0xbe) {
> -                DPRINTF("change uart 2 base. unsupported yet\n");
> -                can_write = false;
> -            }
> -            break;
> +        /* case 0xe6 ... 0xe8: Should set base port of parallel and serial */

If you don't mind I'll prepend this patch:
-- >8 --
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index cd87ec01039..23b4deaac93 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -25,6 +25,7 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "qemu/timer.h"
+#include "qemu/log.h"
 #include "exec/address-spaces.h"
 #include "qom/object.h"

@@ -73,17 +74,9 @@ static void superio_ioport_writeb(void *opaque,
hwaddr addr, uint64_t data,
         case 0xfd ... 0xff:
             can_write = false;
             break;
-        case 0xe7:
-            if ((data & 0xff) != 0xfe) {
-                DPRINTF("change uart 1 base. unsupported yet\n");
-                can_write = false;
-            }
-            break;
-        case 0xe8:
-            if ((data & 0xff) != 0xbe) {
-                DPRINTF("change uart 2 base. unsupported yet\n");
-                can_write = false;
-            }
+        case 0xe6 ... 0xe8: /* set base port of parallel and serial */
+            qemu_log_mask(LOG_UNIMP, "change base port not implemented\n");
+            can_write = false;
             break;
         default:
             break;
---

