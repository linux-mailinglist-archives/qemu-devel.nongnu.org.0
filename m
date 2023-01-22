Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A12AE67703C
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Jan 2023 16:40:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJcSE-0001TZ-Ho; Sun, 22 Jan 2023 10:40:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pJcSC-0001Rw-Ru; Sun, 22 Jan 2023 10:40:20 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pJcSB-0007GK-9g; Sun, 22 Jan 2023 10:40:20 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6C18C745720;
 Sun, 22 Jan 2023 16:37:54 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2B71A745712; Sun, 22 Jan 2023 16:37:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2A5137456E3;
 Sun, 22 Jan 2023 16:37:53 +0100 (CET)
Date: Sun, 22 Jan 2023 16:37:53 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH] mac_nvram: Add block backend to persist NVRAM contents
In-Reply-To: <64b1bbda-37db-2751-073b-54572d186c83@kaod.org>
Message-ID: <30c4ec97-2475-3e28-a30d-7d30f0a6d168@eik.bme.hu>
References: <20230119222845.27209745706@zero.eik.bme.hu>
 <64b1bbda-37db-2751-073b-54572d186c83@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1156829068-1674401873=:82194"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1156829068-1674401873=:82194
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 20 Jan 2023, Cédric Le Goater wrote:
> On 1/19/23 23:28, BALATON Zoltan wrote:
>> Add a way to set a backing store for the mac_nvram similar to what
>> spapr_nvram or mac_via PRAM already does to allow to save its contents
>> between runs. Use -drive file=nvram.img,format=raw,if=mtd to specify
>> backing file where nvram.img must be MACIO_NVRAM_SIZE which is 8192
>> bytes. It is only wired for mac_oldworld for now but could be used by
>> mac_newworld in the future too.
>> 
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>   hw/nvram/mac_nvram.c         | 28 ++++++++++++++++++++++++++++
>>   hw/ppc/mac_oldworld.c        |  8 +++++++-
>>   include/hw/nvram/mac_nvram.h |  1 +
>>   3 files changed, 36 insertions(+), 1 deletion(-)
>> 
>> diff --git a/hw/nvram/mac_nvram.c b/hw/nvram/mac_nvram.c
>> index 3d9ddda217..810e84f07e 100644
>> --- a/hw/nvram/mac_nvram.c
>> +++ b/hw/nvram/mac_nvram.c
>> @@ -24,9 +24,12 @@
>>    */
>>     #include "qemu/osdep.h"
>> +#include "qapi/error.h"
>>   #include "hw/nvram/chrp_nvram.h"
>>   #include "hw/nvram/mac_nvram.h"
>>   #include "hw/qdev-properties.h"
>> +#include "hw/qdev-properties-system.h"
>> +#include "sysemu/block-backend.h"
>>   #include "migration/vmstate.h"
>>   #include "qemu/cutils.h"
>>   #include "qemu/module.h"
>> @@ -44,6 +47,9 @@ static void macio_nvram_writeb(void *opaque, hwaddr addr,
>>       addr = (addr >> s->it_shift) & (s->size - 1);
>>       trace_macio_nvram_write(addr, value);
>>       s->data[addr] = value;
>> +    if (s->blk) {
>> +        blk_pwrite(s->blk, addr, 1, &s->data[addr], 0);
>> +    }
>>   }
>>     static uint64_t macio_nvram_readb(void *opaque, hwaddr addr,
>> @@ -91,6 +97,27 @@ static void macio_nvram_realizefn(DeviceState *dev, 
>> Error **errp)
>>         s->data = g_malloc0(s->size);
>>   +    if (s->blk) {
>> +        int64_t len = blk_getlength(s->blk);
>> +        if (len < 0) {
>> +            error_setg_errno(errp, -len,
>> +                             "could not get length of nvram backing 
>> image");
>> +            return;
>> +        } else if (len != s->size) {
>> +            error_setg_errno(errp, -len,
>> +                             "invalid size nvram backing image");
>> +            return;
>> +        }
>> +        if (blk_set_perm(s->blk, BLK_PERM_CONSISTENT_READ | 
>> BLK_PERM_WRITE,
>> +                         BLK_PERM_ALL, errp) < 0) {
>> +            return;
>> +        }
>> +        if (blk_pread(s->blk, 0, s->size, s->data, 0) < 0) {
>> +            error_setg(errp, "can't read-nvram contents");
>> +            return;
>> +        }
>
> This could use blk_check_size_and_read_all() instead ?

Good idea, except that comments in that function say its error handling is 
not very good and tends to give unuseful messages to users so maybe until 
that's sorted out I'd stay with open coding it here.

Regards,
BALATON Zoltan
--3866299591-1156829068-1674401873=:82194--

