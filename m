Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC3342EDE0
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:41:00 +0200 (CEST)
Received: from localhost ([::1]:42660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJhz-0001jz-Jb
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mbJTn-0005WG-Nm; Fri, 15 Oct 2021 05:26:21 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:24543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mbJTi-0001F9-18; Fri, 15 Oct 2021 05:26:17 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 795B1748F58;
 Fri, 15 Oct 2021 11:26:11 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 574B3748F57; Fri, 15 Oct 2021 11:26:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 55810748F56;
 Fri, 15 Oct 2021 11:26:11 +0200 (CEST)
Date: Fri, 15 Oct 2021 11:26:11 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 3/6] ppc/pegasos2: Implement get-time-of-day RTAS function
 with VOF
In-Reply-To: <YWjyxvGlkzgi2nl6@yekko>
Message-ID: <dfe0a1bf-a4c7-935a-f9e8-d6692d5c1c9@eik.bme.hu>
References: <cover.1634241019.git.balaton@eik.bme.hu>
 <6233eb07c680d6c74427e11b9641958f98d53378.1634241019.git.balaton@eik.bme.hu>
 <YWjyxvGlkzgi2nl6@yekko>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Oct 2021, David Gibson wrote:
> On Thu, Oct 14, 2021 at 09:50:19PM +0200, BALATON Zoltan wrote:
>> This is needed for Linux to access RTC time.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/ppc/pegasos2.c | 25 +++++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>
>> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
>> index a1dd1f6752..a9e3625f56 100644
>> --- a/hw/ppc/pegasos2.c
>> +++ b/hw/ppc/pegasos2.c
>> @@ -31,6 +31,8 @@
>>  #include "sysemu/kvm.h"
>>  #include "kvm_ppc.h"
>>  #include "exec/address-spaces.h"
>> +#include "qom/qom-qobject.h"
>> +#include "qapi/qmp/qdict.h"
>>  #include "trace.h"
>>  #include "qemu/datadir.h"
>>  #include "sysemu/device_tree.h"
>> @@ -369,6 +371,29 @@ static target_ulong pegasos2_rtas(PowerPCCPU *cpu, Pegasos2MachineState *pm,
>>          return H_PARAMETER;
>>      }
>>      switch (token) {
>> +    case RTAS_GET_TIME_OF_DAY:
>> +    {
>> +        QObject *qo = object_property_get_qobject(qdev_get_machine(),
>> +                                                  "rtc-time", &error_fatal);
>> +        QDict *qd = qobject_to(QDict, qo);
>> +
>> +        if (nargs != 0 || nrets != 8 || !qd) {
>> +            stl_be_phys(as, rets, -1);
>> +            qobject_unref(qo);
>> +            return H_PARAMETER;
>> +        }
>> +
>> +        stl_be_phys(as, rets, 0);
>> +        stl_be_phys(as, rets + 4, qdict_get_int(qd, "tm_year") + 1900);
>> +        stl_be_phys(as, rets + 8, qdict_get_int(qd, "tm_mon") + 1);
>> +        stl_be_phys(as, rets + 12, qdict_get_int(qd, "tm_mday"));
>> +        stl_be_phys(as, rets + 16, qdict_get_int(qd, "tm_hour"));
>> +        stl_be_phys(as, rets + 20, qdict_get_int(qd, "tm_min"));
>> +        stl_be_phys(as, rets + 24, qdict_get_int(qd, "tm_sec"));
>
> Doing a separate dictionary lookup for every component seems like it
> might be pretty expensive.  You might want to look at how spapr does
> this.

This is the only short way I could find to read the RTC the same way as 
the guest or firmware would. I wasn't sure because the rtc model has an 
update rtc function that it calls before reads to set the values but that 
looks like doing the same as spapr does so I'll send another patch 
replacing this with that then.

Thanks,
BALATON Zoltan

> However, you're maintainer for pegasos, so really it's your call -
> applied, thanks.
>
>> +        stl_be_phys(as, rets + 28, 0);
>> +        qobject_unref(qo);
>> +        return H_SUCCESS;
>> +    }
>>      case RTAS_READ_PCI_CONFIG:
>>      {
>>          uint32_t addr, len, val;
>
>

