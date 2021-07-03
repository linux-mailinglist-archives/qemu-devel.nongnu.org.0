Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D063BA8CD
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 15:12:27 +0200 (CEST)
Received: from localhost ([::1]:49938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzfRZ-0001X1-TM
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 09:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzfQ6-0000EH-Dr
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 09:10:54 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzfQ3-0007sf-Ux
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 09:10:54 -0400
Received: by mail-wr1-x42b.google.com with SMTP id i8so16065513wrc.0
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 06:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zvUj2HKb0IBPoKVGW5FvOWfX5Q6LoLtDSTdfuNrwHX4=;
 b=kmWVqOCHX+n7Y5vHqp2P880GJD718kVl5M2oVcoxhN0KeXaAH6FbnazSAUckHIQovO
 4l5ThPKfoPs2EAIDb/tJ1Wbl/zyMMbqryYaMFWQoZYLSLpc08RF8GE3l4f9G3yxGp1Ve
 Mui/waBouFpiGGbmlsycVQuPTOkDujFGLu6uBPrtQdp3rxiYcJfAweW/+OtT8USxTJDy
 cQQ0DZMk5Phjx5uD81w8OwaNzoqdOVzX5o9DBSCcu7ykQVXtKAJb//BUZfV+MA2x3tCG
 hw4h6UEesV3KSuvWfv+TgHV+X6Ezo8TpCumiCHqZ4JwscHxhg0N8QKDBnksaNHOLZTlK
 ha5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zvUj2HKb0IBPoKVGW5FvOWfX5Q6LoLtDSTdfuNrwHX4=;
 b=rZ4inwshjkh74ntQOY+IUoO+SxVsSlJIObn2QktSJQh2HcGC+QNxAECFWWjB0Nd90B
 qT4pJj8MyMhbXocwjLDmVfzQmOuA0xDcakOvleVXfZ+3Yu0QiS9Vi6QW+PbvbOcda6jy
 y+NhGExp3mNgrTuyO4VhL7QbRP8X3BINeoZEMZ/p3aJ86ubsTzR2ybotcbECJtxd6rdO
 A3sF2cZu5gYS6IprL0gnLnhYUbxcLReW+6jWrWcpyTFpsxg11dVuzuXi8T1LV5X1fYcl
 yxEX8KZouqRnxNK5U3OlAML2GHcGNQStW34X6/4toYahVgYtX2epzIRNFUWeilYv0+ZN
 teEg==
X-Gm-Message-State: AOAM532t4twBtQ7eHPN3X4BFgD1C13/78ddtPkr4/vOTzEU7jEuTXHfa
 5DoEDguG+t7Xta3iaHVQ1YA=
X-Google-Smtp-Source: ABdhPJzF1ly5Uh7Nk8UCczM9BJ9s+bF4kHxWg4rPDbvAC7gzGVR0P+qK7mLxWZZsa/orUwJrkDTpqA==
X-Received: by 2002:a5d:5307:: with SMTP id e7mr5236239wrv.353.1625317849764; 
 Sat, 03 Jul 2021 06:10:49 -0700 (PDT)
Received: from [192.168.43.238] (184.red-95-127-187.staticip.rima-tde.net.
 [95.127.187.184])
 by smtp.gmail.com with ESMTPSA id u15sm14058240wmq.1.2021.07.03.06.10.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jul 2021 06:10:48 -0700 (PDT)
Subject: Re: [PATCH v2 08/10] dp8393x: don't force 32-bit register access
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Finn Thain <fthain@linux-m68k.org>
References: <20210625065401.30170-1-mark.cave-ayland@ilande.co.uk>
 <20210625065401.30170-9-mark.cave-ayland@ilande.co.uk>
 <a6fae6a6-4fbd-a75c-96b5-403ba3658217@amsat.org>
 <82eeaede-12e7-29f3-9084-33105f5cb61e@linux-m68k.org>
 <5d13cc8c-237c-83c8-bc0c-aecc1d531df5@ilande.co.uk>
 <d389779d-a63b-8ecb-b3a4-aed2f32d97d4@amsat.org>
 <1eb37600-7aa4-1803-562a-5a60500ed1dd@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7a5c9aa3-6665-3b2e-9dc2-017647316e6e@amsat.org>
Date: Sat, 3 Jul 2021 15:10:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1eb37600-7aa4-1803-562a-5a60500ed1dd@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: aleksandar.rikalo@syrmia.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 laurent@vivier.eu, hpoussin@reactos.org, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/3/21 2:04 PM, Mark Cave-Ayland wrote:
> On 03/07/2021 09:52, Philippe Mathieu-Daudé wrote:
>> On 7/3/21 8:21 AM, Mark Cave-Ayland wrote:
>>> On 02/07/2021 05:36, Finn Thain wrote:
>>>
>>>>> On 6/25/21 8:53 AM, Mark Cave-Ayland wrote:
>>>>>> Commit 3fe9a838ec "dp8393x: Always use 32-bit accesses" assumed that
>>>>>> all accesses to the registers were 32-bit
>>>>
>>>> No, that assumption was not made there. Just take a look at my
>>>> commits in
>>>> Linux that make 16-bit accesses. If commit 3fe9a838ec worked by
>>>> accident,
>>>> it probably just reflects my inadequate knowledge of QEMU internals.
>>>>
>>>>>> but this is actually not the case. The access size is determined by
>>>>>> the CPU instruction used and not the number of physical address
>>>>>> lines.
>>>>>>
>>>>
>>>> I think that's an over-simplification (in the context of commit
>>>> 3fe9a838ec).
>>>
>>> Let me try and clarify this a bit more: there are 2 different changes
>>> incorporated into 3fe9a838ec. The first (as you mention below and also
>>> detailed in the commit messge), is related to handling writes to the
>>> upper 16-bits of a word from the device and ensuring that 32-bit
>>> accesses are handled correctly. This part seems correct to me based upon
>>> reading the datasheet and the commit message:
>>>
>>> @@ -246,9 +246,19 @@ static void dp8393x_put(dp8393xState *s, int width,
>>> int offset,
>>>                           uint16_t val)
>>>   {
>>>       if (s->big_endian) {
>>> -        s->data[offset * width + width - 1] = cpu_to_be16(val);
>>> +        if (width == 2) {
>>> +            s->data[offset * 2] = 0;
>>> +            s->data[offset * 2 + 1] = cpu_to_be16(val);
>>> +        } else {
>>> +            s->data[offset] = cpu_to_be16(val);
>>> +        }
>>>       } else {
>>> -        s->data[offset * width] = cpu_to_le16(val);
>>> +        if (width == 2) {
>>> +            s->data[offset * 2] = cpu_to_le16(val);
>>> +            s->data[offset * 2 + 1] = 0;
>>> +        } else {
>>> +            s->data[offset] = cpu_to_le16(val);
>>> +        }
>>>       }
>>>   }
>>>
>>> The second change incorporated into 3fe9a838ec (and the one this patch
>>> fixes) is a similar change made to the MMIO *register* accesses:
>>>
>>> @@ -590,7 +600,7 @@ static uint64_t dp8393x_read(void *opaque, hwaddr
>>> addr, unsigned int size)
>>>
>>>       DPRINTF("read 0x%04x from reg %s\n", val, reg_names[reg]);
>>>
>>> -    return val;
>>> +    return s->big_endian ? val << 16 : val;
>>>   }
>>>
>>> and:
>>>
>>> @@ -598,13 +608,14 @@ static void dp8393x_write(void *opaque, hwaddr
>>> addr, uint64_t data,
>>>   {
>>>       dp8393xState *s = opaque;
>>>       int reg = addr >> s->it_shift;
>>> +    uint32_t val = s->big_endian ? data >> 16 : data;
>>>
>>> This is not correct since the QEMU memory API handles any access size
>>> and endian conversion before the MMIO access reaches the device. It is
>>> this change which breaks the 32-bit accesses used by MacOS to read/write
>>> the dp8393x registers because it applies an additional endian swap on
>>> top of that already done by the memory API.
>>>
>>>>>> The big_endian workaround applied to the register read/writes was
>>>>>> actually caused by forcing the access size to 32-bit when the
>>>>>> guest OS
>>>>>> was using a 16-bit access. Since the registers are 16-bit then we can
>>>>>> simply set .impl.min_access to 2 and then the memory API will
>>>>>> automatically do the right thing for both 16-bit accesses used by
>>>>>> Linux and 32-bit accesses used by the MacOS toolbox ROM.
>>>>>
>>>>> Hmm I'm not sure. This sounds to me like the "QEMU doesn't model
>>>>> busses
>>>>> so we end using kludge to hide bugs" pattern. Can you provide a QTest
>>>>> (ideally) or a "-trace memory_region_ops_\*" log of your firmware
>>>>> accessing the dp8393x please?
>>>>>
>>>> The DP83932 chip is highly configurable, so I'm not sure that the
>>>> behaviour of any given firmware would resolve the question.
>>>
>>> Indeed, I don't think that will help much here. Phil, if you would still
>>> like me to send you some traces after reading the explanation above then
>>> do let me know.
>>
>> I read it and still would have few traces. We can hand-write them too.
>>
>> I'd like to add qtests for some read/write,16/32(A)==B.
> 
> Sigh. I was just about to attempt some traces when I realised looking at
> the patch that I made a mistake, and that in order for the memory API to
> automatically handle the 4 byte accesses as 2 x 2 byte accesses then
> both .impl.min_access_size and .impl.max_access_size need to be set to 2
> :(  The remainder of the patch is the same but dp8393x_ops now looks
> like this:
> 
> static const MemoryRegionOps dp8393x_ops = {
>     .read = dp8393x_read,
>     .write = dp8393x_write,
>     .impl.min_access_size = 2,
>     .impl.max_access_size = 2,
>     .endianness = DEVICE_NATIVE_ENDIAN,
> };

Yes :) This is closer to what I wrote during my review:

-- >8 --
diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index bff359ed13f..6061268dc49 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -697,7 +697,9 @@ static const MemoryRegionOps dp8393x_ops = {
     .read = dp8393x_read,
     .write = dp8393x_write,
     .impl.min_access_size = 2,
-    .impl.max_access_size = 4,
+    .impl.max_access_size = 2,
+    .valid.min_access_size = 2,
+    .valid.max_access_size = 4,
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
---

> 
> I've tested this under Linux/m68k, NetBSD/arc and MacOS and networking
> seems fine after a quick test in each OS. The slight curiosity is that
> the 4 byte accesses used by MacOS are split into 2 x 2 byte accesses,
> but since MacOS only uses the bottom 16-bit of the result and ignores
> the top 16-bits then despite there being 2 accesses, everything still
> works as expected (see below).
> 
> 
> READ:
> 
> dp8393x_read reg=0x28 [SR] val=0x0004 size=2
> memory_region_ops_read cpu 0 mr 0x55f210f44830 addr 0x5000a0a0 value 0x4
> size 2
> dp8393x_read reg=0x28 [SR] val=0x0004 size=2
> memory_region_ops_read cpu 0 mr 0x55f210f44830 addr 0x5000a0a2 value 0x4
> size 2
> memory_region_ops_read cpu 0 mr 0x55f210c9c330 addr 0x50f0a0a0 value
> 0x40004 size 4
> 
> WRITE:
> 
> memory_region_ops_write cpu 0 mr 0x55f210c9c330 addr 0x50f0a01c value
> 0x248fe8 size 4
> memory_region_ops_write cpu 0 mr 0x55f210f44830 addr 0x5000a01c value
> 0x24 size 2
> dp8393x_write reg=0x7 [CTDA] val=0x0024 size=2
> memory_region_ops_write cpu 0 mr 0x55f210f44830 addr 0x5000a01e value
> 0x8fe8 size 2
> dp8393x_write reg=0x7 [CTDA] val=0x8fe8 size=2
> 
> 
> If you're happy with this, I'll resubmit a revised version of the patch
> but with an updated commit message: the Fixes: tag is still the same,
> but the updated fix is to ensure that .impl.min_access_size and
> .impl.max_access_size match the real-life 16-bit register size.

Hold on a bit more, I'm still reviewing the datasheet ;)

My code note so far (untested) are:

-- >8 --
@@ -219,34 +225,48 @@ static uint32_t dp8393x_wt(dp8393xState *s)
     return s->regs[SONIC_WT1] << 16 | s->regs[SONIC_WT0];
 }

-static uint16_t dp8393x_get(dp8393xState *s, int width, int offset)
+static uint16_t dp8393x_get(dp8393xState *s, hwaddr addr, unsigned ofs16)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     uint16_t val;

-    if (s->big_endian) {
-        val = be16_to_cpu(s->data[offset * width + width - 1]);
+    if (s->regs[SONIC_DCR] & SONIC_DCR_DW) {
+        addr += 2 * ofs16;
+        if (s->big_endian) {
+            val = address_space_ldl_be(&s->as, addr, attrs, NULL);
+        } else {
+            val = address_space_ldl_le(&s->as, addr, attrs, NULL);
+        }
     } else {
-        val = le16_to_cpu(s->data[offset * width]);
+        addr += 1 * ofs16;
+        if (s->big_endian) {
+            val = address_space_lduw_be(&s->as, addr, attrs, NULL);
+        } else {
+            val = address_space_lduw_le(&s->as, addr, attrs, NULL);
+        }
     }
+
     return val;
 }

-static void dp8393x_put(dp8393xState *s, int width, int offset,
-                        uint16_t val)
+static void dp8393x_put(dp8393xState *s,
+                        hwaddr addr, unsigned ofs16, uint16_t val)
 {
-    if (s->big_endian) {
-        if (width == 2) {
-            s->data[offset * 2] = 0;
-            s->data[offset * 2 + 1] = cpu_to_be16(val);
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
+
+    if (s->regs[SONIC_DCR] & SONIC_DCR_DW) {
+        addr += 2 * ofs16;
+        if (s->big_endian) {
+            address_space_stl_be(&s->as, addr, val, attrs, NULL);
         } else {
-            s->data[offset] = cpu_to_be16(val);
+            address_space_stl_le(&s->as, addr, val, attrs, NULL);
         }
     } else {
-        if (width == 2) {
-            s->data[offset * 2] = cpu_to_le16(val);
-            s->data[offset * 2 + 1] = 0;
+        addr += 1 * ofs16;
+        if (s->big_endian) {
+            address_space_stw_be(&s->as, addr, val, attrs, NULL);
         } else {
-            s->data[offset] = cpu_to_le16(val);
+            address_space_stw_le(&s->as, addr, val, attrs, NULL);
         }
     }
 }
@@ -313,14 +331,12 @@ static void dp8393x_do_read_rra(dp8393xState *s)
     /* Read memory */
     width = (s->regs[SONIC_DCR] & SONIC_DCR_DW) ? 2 : 1;
     size = sizeof(uint16_t) * 4 * width;
-    address_space_read(&s->as, dp8393x_rrp(s),
-                       MEMTXATTRS_UNSPECIFIED, s->data, size);

     /* Update SONIC registers */
-    s->regs[SONIC_CRBA0] = dp8393x_get(s, width, 0);
-    s->regs[SONIC_CRBA1] = dp8393x_get(s, width, 1);
-    s->regs[SONIC_RBWC0] = dp8393x_get(s, width, 2);
-    s->regs[SONIC_RBWC1] = dp8393x_get(s, width, 3);
+    s->regs[SONIC_CRBA0] = dp8393x_get(s, dp8393x_rrp(s), 0);
+    s->regs[SONIC_CRBA1] = dp8393x_get(s, dp8393x_rrp(s), 1);
+    s->regs[SONIC_RBWC0] = dp8393x_get(s, dp8393x_rrp(s), 2);
+    s->regs[SONIC_RBWC1] = dp8393x_get(s, dp8393x_rrp(s), 3);
     trace_dp8393x_read_rra_regs(s->regs[SONIC_CRBA0], s->regs[SONIC_CRBA1],
                                 s->regs[SONIC_RBWC0],
s->regs[SONIC_RBWC1]);

@@ -416,28 +432,22 @@ static void
dp8393x_do_receiver_disable(dp8393xState *s)
 static void dp8393x_do_transmit_packets(dp8393xState *s)
 {
     NetClientState *nc = qemu_get_queue(s->nic);
-    int width, size;
     int tx_len, len;
     uint16_t i;

-    width = (s->regs[SONIC_DCR] & SONIC_DCR_DW) ? 2 : 1;
-
     while (1) {
         /* Read memory */
-        size = sizeof(uint16_t) * 6 * width;
         s->regs[SONIC_TTDA] = s->regs[SONIC_CTDA];
         trace_dp8393x_transmit_packet(dp8393x_ttda(s));
-        address_space_read(&s->as, dp8393x_ttda(s) + sizeof(uint16_t) *
width,
-                           MEMTXATTRS_UNSPECIFIED, s->data, size);
         tx_len = 0;

         /* Update registers */
-        s->regs[SONIC_TCR] = dp8393x_get(s, width, 0) & 0xf000;
-        s->regs[SONIC_TPS] = dp8393x_get(s, width, 1);
-        s->regs[SONIC_TFC] = dp8393x_get(s, width, 2);
-        s->regs[SONIC_TSA0] = dp8393x_get(s, width, 3);
-        s->regs[SONIC_TSA1] = dp8393x_get(s, width, 4);
-        s->regs[SONIC_TFS] = dp8393x_get(s, width, 5);
+        s->regs[SONIC_TCR] = dp8393x_get(s, dp8393x_ttda(s), 0) & 0xf000;
+        s->regs[SONIC_TPS] = dp8393x_get(s, dp8393x_ttda(s), 1);
+        s->regs[SONIC_TFC] = dp8393x_get(s, dp8393x_ttda(s), 2);
+        s->regs[SONIC_TSA0] = dp8393x_get(s, dp8393x_ttda(s), 3);
+        s->regs[SONIC_TSA1] = dp8393x_get(s, dp8393x_ttda(s), 4);
+        s->regs[SONIC_TFS] = dp8393x_get(s, dp8393x_ttda(s), 5);

         /* Handle programmable interrupt */
         if (s->regs[SONIC_TCR] & SONIC_TCR_PINT) {
@@ -459,15 +469,9 @@ static void
dp8393x_do_transmit_packets(dp8393xState *s)
             i++;
             if (i != s->regs[SONIC_TFC]) {
                 /* Read next fragment details */
-                size = sizeof(uint16_t) * 3 * width;
-                address_space_read(&s->as,
-                                   dp8393x_ttda(s)
-                                   + sizeof(uint16_t) * width * (4 + 3
* i),
-                                   MEMTXATTRS_UNSPECIFIED, s->data,
-                                   size);
-                s->regs[SONIC_TSA0] = dp8393x_get(s, width, 0);
-                s->regs[SONIC_TSA1] = dp8393x_get(s, width, 1);
-                s->regs[SONIC_TFS] = dp8393x_get(s, width, 2);
+                s->regs[SONIC_TSA0] = dp8393x_get(s, dp8393x_ttda(s), 0);
+                s->regs[SONIC_TSA1] = dp8393x_get(s, dp8393x_ttda(s), 1);
+                s->regs[SONIC_TFS] = dp8393x_get(s, dp8393x_ttda(s), 2);
             }
         }

@@ -500,22 +504,12 @@ static void
dp8393x_do_transmit_packets(dp8393xState *s)
         s->regs[SONIC_TCR] |= SONIC_TCR_PTX;

         /* Write status */
-        dp8393x_put(s, width, 0,
-                    s->regs[SONIC_TCR] & 0x0fff); /* status */
-        size = sizeof(uint16_t) * width;
-        address_space_write(&s->as, dp8393x_ttda(s),
-                            MEMTXATTRS_UNSPECIFIED, s->data, size);
+        dp8393x_put(s, dp8393x_ttda(s), 0, s->regs[SONIC_TCR] & 0x0fff);

         if (!(s->regs[SONIC_CR] & SONIC_CR_HTX)) {
             /* Read footer of packet */
-            size = sizeof(uint16_t) * width;
-            address_space_read(&s->as,
-                               dp8393x_ttda(s)
-                               + sizeof(uint16_t) * width
-                                 * (4 + 3 * s->regs[SONIC_TFC]),
-                               MEMTXATTRS_UNSPECIFIED, s->data,
-                               size);
-            s->regs[SONIC_CTDA] = dp8393x_get(s, width, 0);
+            s->regs[SONIC_CTDA] = dp8393x_get(s, dp8393x_ttda(s),
+                                               s->regs[SONIC_TFC]);
             if (s->regs[SONIC_CTDA] & SONIC_DESC_EOL) {
                 /* EOL detected */
                 break;
@@ -764,7 +759,7 @@ static ssize_t dp8393x_receive(NetClientState *nc,
const uint8_t * buf,
     dp8393xState *s = qemu_get_nic_opaque(nc);
     int packet_type;
     uint32_t available, address;
-    int width, rx_len, padded_len;
+    int rx_len, padded_len;
     uint32_t checksum;
     int size;

@@ -777,10 +772,8 @@ static ssize_t dp8393x_receive(NetClientState *nc,
const uint8_t * buf,

     rx_len = pkt_size + sizeof(checksum);
     if (s->regs[SONIC_DCR] & SONIC_DCR_DW) {
-        width = 2;
         padded_len = ((rx_len - 1) | 3) + 1;
     } else {
-        width = 1;
         padded_len = ((rx_len - 1) | 1) + 1;
     }

@@ -801,11 +794,7 @@ static ssize_t dp8393x_receive(NetClientState *nc,
const uint8_t * buf,
     /* Check for EOL */
     if (s->regs[SONIC_LLFA] & SONIC_DESC_EOL) {
         /* Are we still in resource exhaustion? */
-        size = sizeof(uint16_t) * 1 * width;
-        address = dp8393x_crda(s) + sizeof(uint16_t) * 5 * width;
-        address_space_read(&s->as, address, MEMTXATTRS_UNSPECIFIED,
-                           s->data, size);
-        s->regs[SONIC_LLFA] = dp8393x_get(s, width, 0);
+        s->regs[SONIC_LLFA] = dp8393x_get(s, dp8393x_crda(s), 5);
         if (s->regs[SONIC_LLFA] & SONIC_DESC_EOL) {
             /* Still EOL ; stop reception */
             return -1;
@@ -813,11 +802,7 @@ static ssize_t dp8393x_receive(NetClientState *nc,
const uint8_t * buf,
         /* Link has been updated by host */

         /* Clear in_use */
-        size = sizeof(uint16_t) * width;
-        address = dp8393x_crda(s) + sizeof(uint16_t) * 6 * width;
-        dp8393x_put(s, width, 0, 0);
-        address_space_rw(&s->as, address, MEMTXATTRS_UNSPECIFIED,
-                         (uint8_t *)s->data, size, 1);
+        dp8393x_put(s, dp8393x_crda(s), 6, 0x0000);

         /* Move to next descriptor */
         s->regs[SONIC_CRDA] = s->regs[SONIC_LLFA];
@@ -846,8 +831,8 @@ static ssize_t dp8393x_receive(NetClientState *nc,
const uint8_t * buf,
     /* Pad short packets to keep pointers aligned */
     if (rx_len < padded_len) {
         size = padded_len - rx_len;
-        address_space_rw(&s->as, address, MEMTXATTRS_UNSPECIFIED,
-            (uint8_t *)"\xFF\xFF\xFF", size, 1);
+        address_space_write(&s->as, address, MEMTXATTRS_UNSPECIFIED,
+                            (uint8_t *)"\xFF\xFF\xFF", size);
         address += size;
     }

@@ -871,32 +856,20 @@ static ssize_t dp8393x_receive(NetClientState *nc,
const uint8_t * buf,

     /* Write status to memory */
     trace_dp8393x_receive_write_status(dp8393x_crda(s));
-    dp8393x_put(s, width, 0, s->regs[SONIC_RCR]); /* status */
-    dp8393x_put(s, width, 1, rx_len); /* byte count */
-    dp8393x_put(s, width, 2, s->regs[SONIC_TRBA0]); /* pkt_ptr0 */
-    dp8393x_put(s, width, 3, s->regs[SONIC_TRBA1]); /* pkt_ptr1 */
-    dp8393x_put(s, width, 4, s->regs[SONIC_RSC]); /* seq_no */
-    size = sizeof(uint16_t) * 5 * width;
-    address_space_write(&s->as, dp8393x_crda(s),
-                        MEMTXATTRS_UNSPECIFIED,
-                        s->data, size);
+    dp8393x_put(s, dp8393x_crda(s), 0, s->regs[SONIC_RCR]); /* status */
+    dp8393x_put(s, dp8393x_crda(s), 1, rx_len); /* byte count */
+    dp8393x_put(s, dp8393x_crda(s), 2, s->regs[SONIC_TRBA0]); /*
pkt_ptr0 */
+    dp8393x_put(s, dp8393x_crda(s), 3, s->regs[SONIC_TRBA1]); /*
pkt_ptr1 */
+    dp8393x_put(s, dp8393x_crda(s), 4, s->regs[SONIC_RSC]); /* seq_no */

     /* Check link field */
-    size = sizeof(uint16_t) * width;
-    address_space_read(&s->as,
-                       dp8393x_crda(s) + sizeof(uint16_t) * 5 * width,
-                       MEMTXATTRS_UNSPECIFIED, s->data, size);
-    s->regs[SONIC_LLFA] = dp8393x_get(s, width, 0);
+    s->regs[SONIC_LLFA] = dp8393x_get(s, dp8393x_crda(s), 5);
     if (s->regs[SONIC_LLFA] & SONIC_DESC_EOL) {
         /* EOL detected */
         s->regs[SONIC_ISR] |= SONIC_ISR_RDE;
     } else {
         /* Clear in_use */
-        size = sizeof(uint16_t) * width;
-        address = dp8393x_crda(s) + sizeof(uint16_t) * 6 * width;
-        dp8393x_put(s, width, 0, 0);
-        address_space_write(&s->as, address, MEMTXATTRS_UNSPECIFIED,
-                            s->data, size);
+        dp8393x_put(s, dp8393x_crda(s), 6, 0x0000);

         /* Move to next descriptor */
         s->regs[SONIC_CRDA] = s->regs[SONIC_LLFA];
---

Now I'll look at the CAM then the cksum.

Regards,

Phil.

