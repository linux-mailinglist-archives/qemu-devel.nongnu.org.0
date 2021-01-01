Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 587C92E85DD
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 00:04:54 +0100 (CET)
Received: from localhost ([::1]:55562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvTTY-00027y-TA
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 18:04:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kvTSd-0001ip-Kh
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 18:03:56 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:25922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kvTSY-0007Gl-0O
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 18:03:53 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 48B927470FB;
 Sat,  2 Jan 2021 00:03:44 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 16C927470FA; Sat,  2 Jan 2021 00:03:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 14A847470F9;
 Sat,  2 Jan 2021 00:03:44 +0100 (CET)
Date: Sat, 2 Jan 2021 00:03:44 +0100 (CET)
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 09/10] vt82c686: Convert debug printf to trace
 points
In-Reply-To: <3088f630-ffc4-22e8-e04b-c3eff09bd9c4@amsat.org>
Message-ID: <f37da831-94d3-36ef-929d-f4b3e3c42b85@eik.bme.hu>
References: <cover.1609121293.git.balaton@eik.bme.hu>
 <28d9455165261a9cfd2cc4a650b25f987e60295c.1609121293.git.balaton@eik.bme.hu>
 <3088f630-ffc4-22e8-e04b-c3eff09bd9c4@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-606383100-1609542224=:11390"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-606383100-1609542224=:11390
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 1 Jan 2021, Philippe Mathieu-Daudé wrote:
> On 12/28/20 3:08 AM, BALATON Zoltan via wrote:
>> Drop DPRINTF and use trace functions instead. Two debug messages about
>> unimplemented registers could be converted to qemu_log_mask() but in
>> reality all registers are currently unimplemented (we just store and
>> return values of writable regs but do nothing with them). As we
>> already trace register access there's no need for additional debug
>> messages so these are just removed and a comment is added as a reminder.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>
>> ---
>> v2: Extended commit message
>>
>>  hw/isa/trace-events |  6 ++++++
>>  hw/isa/vt82c686.c   | 51 +++++++++++++--------------------------------
>>  2 files changed, 21 insertions(+), 36 deletions(-)
>>
>> diff --git a/hw/isa/trace-events b/hw/isa/trace-events
>> index 3544c6213c..d267d3e652 100644
>> --- a/hw/isa/trace-events
>> +++ b/hw/isa/trace-events
>> @@ -13,3 +13,9 @@ pc87312_io_write(uint32_t addr, uint32_t val) "write addr=0x%x val=0x%x"
>>  # apm.c
>>  apm_io_read(uint8_t addr, uint8_t val) "read addr=0x%x val=0x%02x"
>>  apm_io_write(uint8_t addr, uint8_t val) "write addr=0x%x val=0x%02x"
>> +
>> +# vt82c686.c
>> +via_isa_write(uint32_t addr, uint32_t val, int len) "addr 0x%x val 0x%x len 0x%x"
>> +via_pm_write(uint32_t addr, uint32_t val, int len) "addr 0x%x val 0x%x len 0x%x"
>> +via_superio_read(uint8_t addr, uint8_t val) "addr 0x%x val 0x%x"
>> +via_superio_write(uint8_t addr, uint32_t val) "addr 0x%x val 0x%x"
>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>> index cd87ec0103..d7ce15bf9f 100644
>> --- a/hw/isa/vt82c686.c
>> +++ b/hw/isa/vt82c686.c
>> @@ -27,14 +27,7 @@
>>  #include "qemu/timer.h"
>>  #include "exec/address-spaces.h"
>>  #include "qom/object.h"
>> -
>> -/* #define DEBUG_VT82C686B */
>> -
>> -#ifdef DEBUG_VT82C686B
>> -#define DPRINTF(fmt, ...) fprintf(stderr, "%s: " fmt, __func__, ##__VA_ARGS__)
>> -#else
>> -#define DPRINTF(fmt, ...)
>> -#endif
>> +#include "trace.h"
>>
>>  typedef struct SuperIOConfig {
>>      uint8_t config[0x100];
>> @@ -55,12 +48,12 @@ static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
>>  {
>>      SuperIOConfig *superio_conf = opaque;
>>
>> -    DPRINTF("superio_ioport_writeb  address 0x%x  val 0x%x\n", addr, data);
>> -    if (addr == 0x3f0) {
>> +    if (addr == 0x3f0) { /* config index register */
>>          superio_conf->index = data & 0xff;
>>      } else {
>>          bool can_write = true;
>> -        /* 0x3f1 */
>> +        /* 0x3f1, config data register */
>> +        trace_via_superio_write(superio_conf->index, data & 0xff);
>>          switch (superio_conf->index) {
>>          case 0x00 ... 0xdf:
>>          case 0xe4:
>> @@ -73,18 +66,7 @@ static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
>>          case 0xfd ... 0xff:
>>              can_write = false;
>>              break;
>> -        case 0xe7:
>> -            if ((data & 0xff) != 0xfe) {
>> -                DPRINTF("change uart 1 base. unsupported yet\n");
>> -                can_write = false;
>> -            }
>> -            break;
>> -        case 0xe8:
>> -            if ((data & 0xff) != 0xbe) {
>> -                DPRINTF("change uart 2 base. unsupported yet\n");
>> -                can_write = false;
>> -            }
>> -            break;
>> +        /* case 0xe6 ... 0xe8: Should set base port of parallel and serial */
>
> If you don't mind I'll prepend this patch:

I'll split it. I've finished rewriting vt82c686b to add vt8231 emulation 
and ended up with a 24 patch series. This'll make it 25. This includes all 
of part I and part II I've already posted and some more. Fuloong2e still 
seems to work (with the Bonito fix) at least with PMON and pegasos2 
firmware also runs and starts to boot but MorphOS does not fully boot for 
some reason but I'm not sure if it's because of some other change or a bug 
somewhere in this series. I need to do more testing but I think I'll 
submit this series now anyway so it can be reviewed in the meantime and I 
can make changes in next iteration and don't need too many versions 
because I'll have less time for it now.

Regards and happy new year,
BALATON Zoltan

> -- >8 --
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index cd87ec01039..23b4deaac93 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -25,6 +25,7 @@
> #include "qapi/error.h"
> #include "qemu/module.h"
> #include "qemu/timer.h"
> +#include "qemu/log.h"
> #include "exec/address-spaces.h"
> #include "qom/object.h"
>
> @@ -73,17 +74,9 @@ static void superio_ioport_writeb(void *opaque,
> hwaddr addr, uint64_t data,
>         case 0xfd ... 0xff:
>             can_write = false;
>             break;
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
> +        case 0xe6 ... 0xe8: /* set base port of parallel and serial */
> +            qemu_log_mask(LOG_UNIMP, "change base port not implemented\n");
> +            can_write = false;
>             break;
>         default:
>             break;
> ---
>
>
--3866299591-606383100-1609542224=:11390--

