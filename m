Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 347D14C4A5B
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 17:16:52 +0100 (CET)
Received: from localhost ([::1]:34780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNdH1-0002E8-AW
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 11:16:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nNd8q-0001VM-Eg; Fri, 25 Feb 2022 11:08:27 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60840
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nNd8o-000346-5Y; Fri, 25 Feb 2022 11:08:24 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21PFnHOE004765; 
 Fri, 25 Feb 2022 16:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=4ECW/PX3bKj7wZYm/7hUbnGqSX+pOMO4rX+e8YQHjms=;
 b=cqt42EsW+CB3cByHDwCFmeU+7v75nQegWcu8FoKTxltFrIt5gqJ22k8mrVVJMtmx6lWh
 liACVLKzywIvlJKjQbq7B7r5jWRaburqCT4zZMLkQ1pMAowbxbHF+EPX8MY6pjRscPIg
 X966AU+zK0qFlloAv+e6uPxmIrQI+3Bs5FquA+QBdtGOhXWJgHQtNvdv7bI5sO8CuqxN
 BqKJk9b8KJKWRMD+X8fAujZykJpfoWiuIlmKVKTe6yTIT4YjjJmBfASVCqPqoKqAk+Vo
 TyfptwqMiJV7DbP10eOeMlk9JCps77rG0ssUbKDpUWg+tnmTjit0gmvEWU69WAnXlAPJ hw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ef23c8hdq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 16:08:15 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21PFpA6L012382;
 Fri, 25 Feb 2022 16:08:15 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ef23c8hdf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 16:08:15 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21PFwFti017056;
 Fri, 25 Feb 2022 16:08:14 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 3eeb06usj3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 16:08:14 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21PG8E9G45482282
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Feb 2022 16:08:14 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1164911206F;
 Fri, 25 Feb 2022 16:08:14 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26A51112062;
 Fri, 25 Feb 2022 16:08:13 +0000 (GMT)
Received: from localhost (unknown [9.211.119.70])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 25 Feb 2022 16:08:12 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [RFC PATCH 1/4] target/ppc: TCG: Migrate tb_offset and decr
In-Reply-To: <YhhJu9HcctgA7xx2@yekko>
References: <20220224185817.2207228-1-farosas@linux.ibm.com>
 <20220224185817.2207228-2-farosas@linux.ibm.com> <YhhJu9HcctgA7xx2@yekko>
Date: Fri, 25 Feb 2022 13:08:10 -0300
Message-ID: <8735k73p5h.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uYESc64TNvXQZQE2ucK3PP8ASv95AjTI
X-Proofpoint-ORIG-GUID: 7wHKsSbbDAnHU4SkPrX1UtaceynJU_xg
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-25_09,2022-02-25_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202250095
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 npiggin@gmail.com, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Gibson <david@gibson.dropbear.id.au> writes:

> On Thu, Feb 24, 2022 at 03:58:14PM -0300, Fabiano Rosas wrote:
>> These two were not migrated so the remote end was starting with the
>> decrementer expired.
>> 
>> I am seeing less frequent crashes with this patch (tested with -smp 4
>> and -smp 32). It certainly doesn't fix all issues but it looks like it
>> helps.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>
> Nack.  This completely breaks migration compatibility for all ppc
> machines.  In order to maintain compatibility as Richard says new info
> has to go into a subsection, with a needed function that allows
> migration of existing machine types both to and from a new qemu
> version.

Ok, I'm still learning the tenets of migration. I'll give more thought
to that in the next versions.

>
> There are also some other problems.
>
>> ---
>>  target/ppc/machine.c | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>> 
>> diff --git a/target/ppc/machine.c b/target/ppc/machine.c
>> index 1b63146ed1..7ee1984500 100644
>> --- a/target/ppc/machine.c
>> +++ b/target/ppc/machine.c
>> @@ -9,6 +9,7 @@
>>  #include "qemu/main-loop.h"
>>  #include "kvm_ppc.h"
>>  #include "power8-pmu.h"
>> +#include "hw/ppc/ppc.h"
>>  
>>  static void post_load_update_msr(CPUPPCState *env)
>>  {
>> @@ -666,6 +667,18 @@ static const VMStateDescription vmstate_compat = {
>>      }
>>  };
>>  
>> +static const VMStateDescription vmstate_tb_env = {
>> +    .name = "cpu/env/tb_env",
>
> Because spapr requires that all cpus have synchronized timebases, we
> migrate the timebase state from vmstate_spapr, not from each cpu
> individually, to make sure it stays synchronized across migration.  If
> that's not working right, that's a bug, but it needs to be fixed
> there, not just plastered over with extra information transmitted at
> cpu level.

Ok, so it that what guest_timebase is about? We shouldn't need to
migrate DECR individually then.

>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_INT64(tb_offset, ppc_tb_t),
>
> tb_offset isn't a good thing to put directly in the migration stream.
> tb_offset has kind of non-obvious semantics to begin with: when we're
> dealing with TCG (which is your explicit case), there is no host TB,
> so what's this an offset from?  That's why vmstate_ppc_timebase uses
> an explicit guest timebase value matched with a time of day in real
> units.  Again, if there's a bug, that needs fixing there.

This should be in patch 4, but tb_offset is needed for the nested
case. When we enter the nested guest we increment tb_offset with
nested_tb_offset and decrement it when leaving the nested guest. So
tb_offset needs to carry this value over.

But maybe we could alternatively modify the nested code to just zero
tb_offset when leaving the guest instead? We could then remove
nested_tb_offset altogether.

>> +        VMSTATE_UINT64(decr_next, ppc_tb_t),
>> +        VMSTATE_TIMER_PTR(decr_timer, ppc_tb_t),
>
> You're attempting to migrate decr_next and decr_timer, but not the
> actual DECR value, which makes me suspect that *is* being migrated.
> In which case you should be able to reconstruct the next tick and
> timer state in a post_load function on receive.  If that's buggy, it
> needs to be fixed there.

There isn't any "actual DECR" when running TCG, is there? My
understanding is that it is embedded in the QEMUTimer.

Mark mentioned this years ago:

 "I can't see anything in __cpu_ppc_store_decr() that
 updates the spr[SPR_DECR] value when the decrementer register is
 changed"
 
 https://lists.gnu.org/archive/html/qemu-devel/2016-01/msg01114.html

Your answer was along the lines of:

 "we should be reconstructing the decrementer on
 the destination based on an offset from the timebase"

 https://lists.gnu.org/archive/html/qemu-devel/2016-01/msg01373.html

So if I'm getting this right, in TCG we don't touch SPR_DECR because we
only effectively care about what is in the decr_timer->expire_time.

And in KVM we don't migrate DECR explicitly because we use the tb_offset
and timebase_save/timebase_load to ensure the tb_offset in the
destination has the correct value.

But timebase_save/timebase_load are not used for TCG currently. So there
would be nothing transfering the current decr value to the other side.

>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>>  const VMStateDescription vmstate_ppc_cpu = {
>>      .name = "cpu",
>>      .version_id = 5,
>> @@ -696,12 +709,16 @@ const VMStateDescription vmstate_ppc_cpu = {
>>          /* Backward compatible internal state */
>>          VMSTATE_UINTTL(env.hflags_compat_nmsr, PowerPCCPU),
>>  
>> +        VMSTATE_STRUCT_POINTER_V(env.tb_env, PowerPCCPU, 1,
>> +                                 vmstate_tb_env, ppc_tb_t),
>> +
>>          /* Sanity checking */
>>          VMSTATE_UINTTL_TEST(mig_msr_mask, PowerPCCPU, cpu_pre_2_8_migration),
>>          VMSTATE_UINT64_TEST(mig_insns_flags, PowerPCCPU, cpu_pre_2_8_migration),
>>          VMSTATE_UINT64_TEST(mig_insns_flags2, PowerPCCPU,
>>                              cpu_pre_2_8_migration),
>>          VMSTATE_UINT32_TEST(mig_nb_BATs, PowerPCCPU, cpu_pre_2_8_migration),
>> +
>>          VMSTATE_END_OF_LIST()
>>      },
>>      .subsections = (const VMStateDescription*[]) {

