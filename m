Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFE43F48D5
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 12:45:05 +0200 (CEST)
Received: from localhost ([::1]:47412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI7Rs-0005dF-03
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 06:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mI7Qf-0004MV-UB; Mon, 23 Aug 2021 06:43:45 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:39825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mI7Qe-0004PC-6x; Mon, 23 Aug 2021 06:43:45 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso13704844wmg.4; 
 Mon, 23 Aug 2021 03:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EAHnzb/jk9Bwzx+S2TOYL6gtVJvewz88cp4uAB7MZAU=;
 b=UoBqcnkFK8F2uIvQ2eeVB6q24Bbh00DETGujcTdSlwU76FtZtMyzTTsbfVtIl7sDgk
 cl5KMjZE9KVZpsD3AGg8TbEAJpK5PRWCs53J+IkTAYmO9NnW+5cjxhFw7PteWef3Z822
 IVAQxuzEkM+kJRuRj6b9AUp1HTu0AvMQbTxLrHEe/uIr/kbQCU33h+k4IX8B4hlEjM0j
 o6DGecNnIkLHHw8RvUdSIJUWjTs/XKg0sim/FvQahe0h65j+ApiSbGJiNM9niarPL3tP
 nf0ETav80GEOl3a26IVOYDptn+JlN1AQigaCxr99avYZRpQX3iZ5S7E6xsIpOelM0nlc
 oYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EAHnzb/jk9Bwzx+S2TOYL6gtVJvewz88cp4uAB7MZAU=;
 b=oOQmv5eair7td302ZTT+3hovUdY4fS0C7ZDwxn7a3Ynxu33GMYhvNHTvK+1D65vjKm
 UwGbiN3BAicYbh83aeDNmgv5u1sNLz28J4yy+Xxe0TZeqWJqm1I5Y59qXyM9t1XPoj9K
 A61Gd4exnpG8L7Id01OzBnHtYO6LfmO7/PxDEw7zTwoCL9v+hEye6m6r8TLvSWDlEAr5
 EQZKd+xhUDb7sRAtgCsXqcdVZ2b9Ukdd9itTCp+QBZ/Y2aZp+x8kJlQVqkfjXR0R8b/7
 aZed9Y2En5dfrU9ShUeZw52kdp0rA+j9g2TVeSxU6vc/g8/dC58a/+kL8PdMvc5AfEwF
 JcNQ==
X-Gm-Message-State: AOAM533GtQw9nczfLtpCzMLB0o/fqXzwpFUNlbiO3NJGjvTOaAEIMJeR
 2urfGYsITZUnuyp3TFjg7GA=
X-Google-Smtp-Source: ABdhPJyAo/6/pEuqEbLus825Tf3q3PDnxOqvsCb9GitBOc1LKZ37EFfmGDSHm2qh4Bo6x00UWw1ThA==
X-Received: by 2002:a1c:7ecb:: with SMTP id
 z194mr15715989wmc.182.1629715421907; 
 Mon, 23 Aug 2021 03:43:41 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id t8sm17190831wrx.27.2021.08.23.03.43.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 03:43:41 -0700 (PDT)
Subject: Re: [PATCH 2/3] hw/char: cadence_uart: Disable transmit when input
 clock is disabled
To: Bin Meng <bmeng.cn@gmail.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210823020813.25192-1-bmeng.cn@gmail.com>
 <20210823020813.25192-3-bmeng.cn@gmail.com>
 <7997927e-3a66-aa0e-6099-f1efe3cbb9ee@amsat.org>
 <CAEUhbmVVRKebU-=k0WaxpaRe-E_UsLy_82K0PzRE=7xNHp9hGQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <abf7ac8e-c5bc-e239-ab9b-a9d868b477dc@amsat.org>
Date: Mon, 23 Aug 2021 12:43:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmVVRKebU-=k0WaxpaRe-E_UsLy_82K0PzRE=7xNHp9hGQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.959,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 11:57 AM, Bin Meng wrote:
> On Mon, Aug 23, 2021 at 4:14 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On 8/23/21 4:08 AM, Bin Meng wrote:
>>> At present when input clock is disabled, any character transmitted
>>> to tx fifo can still show on the serial line, which is wrong.
>>>
>>> Fixes: b636db306e06 ("hw/char/cadence_uart: add clock support")
>>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>>> ---
>>>
>>>  hw/char/cadence_uart.c | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
>>> index b4b5e8a3ee..154be34992 100644
>>> --- a/hw/char/cadence_uart.c
>>> +++ b/hw/char/cadence_uart.c
>>> @@ -327,6 +327,11 @@ static gboolean cadence_uart_xmit(void *do_not_use, GIOCondition cond,
>>>  static void uart_write_tx_fifo(CadenceUARTState *s, const uint8_t *buf,
>>>                                 int size)
>>>  {
>>> +    /* ignore characters when unclocked or in reset */
>>> +    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
>>> +        return;
>>> +    }
>>
>> Incorrect handler?
>>
> 
> Sorry I don't get it. This patch is for the Tx path, while patch #3 is
> for the Rx path.

Sorry, I was not totally awake o_O

-- >8 --
diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index b4b5e8a3ee0..78990ea79dc 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -403,15 +403,20 @@ static void uart_read_rx_fifo(CadenceUARTState *s,
uint32_t *c)
     uart_update_status(s);
 }

-static void uart_write(void *opaque, hwaddr offset,
-                          uint64_t value, unsigned size)
+static MemTxResult uart_write(void *opaque, hwaddr offset, uint64_t value,
+                              unsigned size, MemTxAttrs attrs)
 {
     CadenceUARTState *s = opaque;

+    /* ignore characters when unclocked or in reset */
+    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
+        return MEMTX_DECODE_ERROR;
+    }
+
     DB_PRINT(" offset:%x data:%08x\n", (unsigned)offset, (unsigned)value);
     offset >>= 2;
     if (offset >= CADENCE_UART_R_MAX) {
-        return;
+        return MEMTX_OK;
     }
     switch (offset) {
     case R_IER: /* ier (wts imr) */
@@ -458,14 +463,21 @@ static void uart_write(void *opaque, hwaddr offset,
         break;
     }
     uart_update_status(s);
+
+    return MEMTX_OK;
 }

-static uint64_t uart_read(void *opaque, hwaddr offset,
-        unsigned size)
+static MemTxResult uart_read(void *opaque, hwaddr offset, uint64_t *data,
+                             unsigned size, MemTxAttrs attrs)
 {
     CadenceUARTState *s = opaque;
     uint32_t c = 0;

+    /* ignore characters when unclocked or in reset */
+    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
+        return MEMTX_DECODE_ERROR;
+    }
+
     offset >>= 2;
     if (offset >= CADENCE_UART_R_MAX) {
         c = 0;
@@ -476,12 +488,14 @@ static uint64_t uart_read(void *opaque, hwaddr offset,
     }

     DB_PRINT(" offset:%x data:%08x\n", (unsigned)(offset << 2),
(unsigned)c);
-    return c;
+    *data = c;
+
+    return MEMTX_OK;
 }

 static const MemoryRegionOps uart_ops = {
-    .read = uart_read,
-    .write = uart_write,
+    .read_with_attrs = uart_read,
+    .write_with_attrs = uart_write,
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
---

