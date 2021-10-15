Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1258C42FDAA
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 23:52:32 +0200 (CEST)
Received: from localhost ([::1]:52378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbV7v-0004vK-5i
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 17:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mbV72-0003Tu-1E; Fri, 15 Oct 2021 17:51:36 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:40072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mbV6x-00053P-DH; Fri, 15 Oct 2021 17:51:35 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E69E47463B7;
 Fri, 15 Oct 2021 23:51:26 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id BB1DF746333; Fri, 15 Oct 2021 23:51:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id B9A3A7462D3;
 Fri, 15 Oct 2021 23:51:26 +0200 (CEST)
Date: Fri, 15 Oct 2021 23:51:26 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 3/6] ppc/pegasos2: Implement get-time-of-day RTAS function
 with VOF
In-Reply-To: <dfe0a1bf-a4c7-935a-f9e8-d6692d5c1c9@eik.bme.hu>
Message-ID: <35f4706b-7d53-3c8e-392d-2d7ea85683c@eik.bme.hu>
References: <cover.1634241019.git.balaton@eik.bme.hu>
 <6233eb07c680d6c74427e11b9641958f98d53378.1634241019.git.balaton@eik.bme.hu>
 <YWjyxvGlkzgi2nl6@yekko> <dfe0a1bf-a4c7-935a-f9e8-d6692d5c1c9@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Oct 2021, BALATON Zoltan wrote:
> On Fri, 15 Oct 2021, David Gibson wrote:
>> On Thu, Oct 14, 2021 at 09:50:19PM +0200, BALATON Zoltan wrote:
>>> This is needed for Linux to access RTC time.
>>> 
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> ---
>>>  hw/ppc/pegasos2.c | 25 +++++++++++++++++++++++++
>>>  1 file changed, 25 insertions(+)
>>> 
>>> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
>>> index a1dd1f6752..a9e3625f56 100644
>>> --- a/hw/ppc/pegasos2.c
>>> +++ b/hw/ppc/pegasos2.c
>>> @@ -31,6 +31,8 @@
>>>  #include "sysemu/kvm.h"
>>>  #include "kvm_ppc.h"
>>>  #include "exec/address-spaces.h"
>>> +#include "qom/qom-qobject.h"
>>> +#include "qapi/qmp/qdict.h"
>>>  #include "trace.h"
>>>  #include "qemu/datadir.h"
>>>  #include "sysemu/device_tree.h"
>>> @@ -369,6 +371,29 @@ static target_ulong pegasos2_rtas(PowerPCCPU *cpu, 
>>> Pegasos2MachineState *pm,
>>>          return H_PARAMETER;
>>>      }
>>>      switch (token) {
>>> +    case RTAS_GET_TIME_OF_DAY:
>>> +    {
>>> +        QObject *qo = object_property_get_qobject(qdev_get_machine(),
>>> +                                                  "rtc-time", 
>>> &error_fatal);
>>> +        QDict *qd = qobject_to(QDict, qo);
>>> +
>>> +        if (nargs != 0 || nrets != 8 || !qd) {
>>> +            stl_be_phys(as, rets, -1);
>>> +            qobject_unref(qo);
>>> +            return H_PARAMETER;
>>> +        }
>>> +
>>> +        stl_be_phys(as, rets, 0);
>>> +        stl_be_phys(as, rets + 4, qdict_get_int(qd, "tm_year") + 1900);
>>> +        stl_be_phys(as, rets + 8, qdict_get_int(qd, "tm_mon") + 1);
>>> +        stl_be_phys(as, rets + 12, qdict_get_int(qd, "tm_mday"));
>>> +        stl_be_phys(as, rets + 16, qdict_get_int(qd, "tm_hour"));
>>> +        stl_be_phys(as, rets + 20, qdict_get_int(qd, "tm_min"));
>>> +        stl_be_phys(as, rets + 24, qdict_get_int(qd, "tm_sec"));
>> 
>> Doing a separate dictionary lookup for every component seems like it
>> might be pretty expensive.  You might want to look at how spapr does
>> this.
>
> This is the only short way I could find to read the RTC the same way as the 
> guest or firmware would. I wasn't sure because the rtc model has an update 
> rtc function that it calls before reads to set the values but that looks like 
> doing the same as spapr does so I'll send another patch replacing this with 
> that then.

Forget it. I've looked at it and to get the time that way fitst we'd need 
the RTCState struct which we don't readily have as it's part of the vt8231 
device which creates it internally so the pegasos2 code does not see it 
directly but would need some qdev magic to find it. Then we would need to 
either export or duplicate the get_guest_rtc_ns() function from 
hw/rtc/mc146818rtc.c to get the guest clock. Since reading the rtc via 
RTAS is not a frequent operation and probably also slow on real hardware I 
can live with the above QObject solution so just keep this patch for now. 
It's only used by Linux to access hardware clock anyway.

Regards,
BALATON Zoltan

>> However, you're maintainer for pegasos, so really it's your call -
>> applied, thanks.
>> 
>>> +        stl_be_phys(as, rets + 28, 0);
>>> +        qobject_unref(qo);
>>> +        return H_SUCCESS;
>>> +    }
>>>      case RTAS_READ_PCI_CONFIG:
>>>      {
>>>          uint32_t addr, len, val;
>> 
>> 
>

