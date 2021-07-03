Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E433BA786
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 08:22:50 +0200 (CEST)
Received: from localhost ([::1]:51114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzZ3A-0003t5-Up
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 02:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lzZ2L-0003CO-I7
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 02:21:57 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40690
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lzZ2J-0001qo-Jk
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 02:21:57 -0400
Received: from host86-179-59-238.range86-179.btcentralplus.com
 ([86.179.59.238] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lzZ1t-0005JW-MB; Sat, 03 Jul 2021 07:21:30 +0100
To: Finn Thain <fthain@linux-m68k.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210625065401.30170-1-mark.cave-ayland@ilande.co.uk>
 <20210625065401.30170-9-mark.cave-ayland@ilande.co.uk>
 <a6fae6a6-4fbd-a75c-96b5-403ba3658217@amsat.org>
 <82eeaede-12e7-29f3-9084-33105f5cb61e@linux-m68k.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <5d13cc8c-237c-83c8-bc0c-aecc1d531df5@ilande.co.uk>
Date: Sat, 3 Jul 2021 07:21:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <82eeaede-12e7-29f3-9084-33105f5cb61e@linux-m68k.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.59.238
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 08/10] dp8393x: don't force 32-bit register access
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: aleksandar.rikalo@syrmia.com, jasowang@redhat.com, laurent@vivier.eu,
 qemu-devel@nongnu.org, hpoussin@reactos.org, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/07/2021 05:36, Finn Thain wrote:

>> On 6/25/21 8:53 AM, Mark Cave-Ayland wrote:
>>> Commit 3fe9a838ec "dp8393x: Always use 32-bit accesses" assumed that
>>> all accesses to the registers were 32-bit
> 
> No, that assumption was not made there. Just take a look at my commits in
> Linux that make 16-bit accesses. If commit 3fe9a838ec worked by accident,
> it probably just reflects my inadequate knowledge of QEMU internals.
> 
>>> but this is actually not the case. The access size is determined by
>>> the CPU instruction used and not the number of physical address lines.
>>>
> 
> I think that's an over-simplification (in the context of commit
> 3fe9a838ec).

Let me try and clarify this a bit more: there are 2 different changes incorporated 
into 3fe9a838ec. The first (as you mention below and also detailed in the commit 
messge), is related to handling writes to the upper 16-bits of a word from the device 
and ensuring that 32-bit accesses are handled correctly. This part seems correct to 
me based upon reading the datasheet and the commit message:

@@ -246,9 +246,19 @@ static void dp8393x_put(dp8393xState *s, int width, int offset,
                          uint16_t val)
  {
      if (s->big_endian) {
-        s->data[offset * width + width - 1] = cpu_to_be16(val);
+        if (width == 2) {
+            s->data[offset * 2] = 0;
+            s->data[offset * 2 + 1] = cpu_to_be16(val);
+        } else {
+            s->data[offset] = cpu_to_be16(val);
+        }
      } else {
-        s->data[offset * width] = cpu_to_le16(val);
+        if (width == 2) {
+            s->data[offset * 2] = cpu_to_le16(val);
+            s->data[offset * 2 + 1] = 0;
+        } else {
+            s->data[offset] = cpu_to_le16(val);
+        }
      }
  }

The second change incorporated into 3fe9a838ec (and the one this patch fixes) is a 
similar change made to the MMIO *register* accesses:

@@ -590,7 +600,7 @@ static uint64_t dp8393x_read(void *opaque, hwaddr addr, unsigned 
int size)

      DPRINTF("read 0x%04x from reg %s\n", val, reg_names[reg]);

-    return val;
+    return s->big_endian ? val << 16 : val;
  }

and:

@@ -598,13 +608,14 @@ static void dp8393x_write(void *opaque, hwaddr addr, uint64_t data,
  {
      dp8393xState *s = opaque;
      int reg = addr >> s->it_shift;
+    uint32_t val = s->big_endian ? data >> 16 : data;

This is not correct since the QEMU memory API handles any access size and endian 
conversion before the MMIO access reaches the device. It is this change which breaks 
the 32-bit accesses used by MacOS to read/write the dp8393x registers because it 
applies an additional endian swap on top of that already done by the memory API.

>>> The big_endian workaround applied to the register read/writes was
>>> actually caused by forcing the access size to 32-bit when the guest OS
>>> was using a 16-bit access. Since the registers are 16-bit then we can
>>> simply set .impl.min_access to 2 and then the memory API will
>>> automatically do the right thing for both 16-bit accesses used by
>>> Linux and 32-bit accesses used by the MacOS toolbox ROM.
>>
>> Hmm I'm not sure. This sounds to me like the "QEMU doesn't model busses
>> so we end using kludge to hide bugs" pattern. Can you provide a QTest
>> (ideally) or a "-trace memory_region_ops_\*" log of your firmware
>> accessing the dp8393x please?
>>
> The DP83932 chip is highly configurable, so I'm not sure that the
> behaviour of any given firmware would resolve the question.

Indeed, I don't think that will help much here. Phil, if you would still like me to 
send you some traces after reading the explanation above then do let me know.

> Anyway, as far as the DP83932 hardware is concerned, the behaviour of the
> upper 16-bits of the data bus depends on the configuration programmed into
> the DP83932 registers, and whether the chip is accessed as a slave or
> performing DMA as a master.

The important part of the commit and its associated message is that it only changes 
the *register* accesses which were introduced as part of 3fe9a838ec.

In the end all the patch does is remove the manual endian swap from the MMIO 
registers since QEMU's memory API does the right thing all by itself, and adds the 
tweak below:

@@ -694,7 +693,7 @@ static void dp8393x_write(void *opaque, hwaddr addr, uint64_t data,
  static const MemoryRegionOps dp8393x_ops = {
      .read = dp8393x_read,
      .write = dp8393x_write,
-    .impl.min_access_size = 4,
+    .impl.min_access_size = 2,
      .impl.max_access_size = 4,
      .endianness = DEVICE_NATIVE_ENDIAN,
  };

As Finn points out the dp8393x registers are 16-bit so we declare the implementation 
size as 2 bytes and the maximum size as 4 bytes. This allows Linux to function 
correctly with 16-bit accesses, whilst 32-bit accesses done by MacOS are split into 2 
separate 16-bit accesses and combined automatically by the memory API.


ATB,

Mark.

