Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 900DD42A732
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 16:31:05 +0200 (CEST)
Received: from localhost ([::1]:34456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maIo4-0000GE-2X
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 10:31:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1maIjg-0005vG-Pb; Tue, 12 Oct 2021 10:26:32 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:64962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1maIje-0007L5-Bl; Tue, 12 Oct 2021 10:26:32 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19CDkGFL032681; 
 Tue, 12 Oct 2021 10:26:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=6Gy5frYzA/vOcMqh+IocuHUgkDZvFK3LnkFHqwQ/QRQ=;
 b=oCu9FcG4DTJD9Si1MJvndvtS9G+loXoKwNG4WY6Yl1TzK0Na6cebpTfWRjyXTgvkJyoQ
 GUMraOrZX5xko9cgy7fGPlmj4okbNG4n8vZrWp1Y5Jesui7+w41ANiqzZjYo+gB7u7hB
 Gm0mlK+44hf7qVvv+TFsGeqRWhhY5z9Hr/z65laW+GuQiXG/gDMze6tb6zQc8ETcYl2W
 naL9y4HY6FmdTUZPwBh+yFZoFXPIxvAZvZyoqSX4+2zX+xuVsyRzGYKvhNCWHZMv3ihI
 Z3YwX41QoYYs/jQxrrf5I0NhQ8XBek/bj1ZROO+Ah7rNLbdcnUNyBTZtuTWrh2WlJc3Q 0w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bnbhb9bcj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Oct 2021 10:26:25 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19CDlve1006378;
 Tue, 12 Oct 2021 10:26:25 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bnbhb9bby-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Oct 2021 10:26:25 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19CEQ8iA027236;
 Tue, 12 Oct 2021 14:26:22 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3bk2bj9uce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Oct 2021 14:26:22 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 19CEKY2v34603272
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Oct 2021 14:20:34 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9774A4065;
 Tue, 12 Oct 2021 14:26:10 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5951A406D;
 Tue, 12 Oct 2021 14:26:05 +0000 (GMT)
Received: from [9.152.222.57] (unknown [9.152.222.57])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 12 Oct 2021 14:26:05 +0000 (GMT)
Message-ID: <2583e99f-9551-db86-7e92-9155de06569e@linux.ibm.com>
Date: Tue, 12 Oct 2021 16:26:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/1] s390x:clp: implementing CLP immediate commands
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
References: <1631880413-20655-1-git-send-email-pmorel@linux.ibm.com>
 <1631880413-20655-2-git-send-email-pmorel@linux.ibm.com>
 <5efab45a-289a-5759-d6a5-5dbe7949f4ef@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <5efab45a-289a-5759-d6a5-5dbe7949f4ef@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3IFDW_XZCslgi3HH_vCr4vcjhaa4lktO
X-Proofpoint-GUID: D8qKmxQ6DbXGIFBRp6OEyyqW5hVtUNjF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-12_03,2021-10-12_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110120082
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: farman@linux.ibm.com, mjrosato@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/12/21 09:27, Thomas Huth wrote:
> On 17/09/2021 14.06, Pierre Morel wrote:
>> CLP immediate commands allow to query the Logical Processor
>> available on the machine and to check for a specific one.
>>
>> Let's add these commands.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   hw/s390x/s390-pci-inst.c         | 33 ++++++++++++++++++++++++++++++++
>>   include/hw/s390x/s390-pci-inst.h |  5 +++++
>>   target/s390x/kvm/kvm.c           |  6 ++++++
>>   3 files changed, 44 insertions(+)
>>
>> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
>> index 1c8ad91175..9fd0669591 100644
>> --- a/hw/s390x/s390-pci-inst.c
>> +++ b/hw/s390x/s390-pci-inst.c
>> @@ -156,6 +156,39 @@ out:
>>       return rc;
>>   }
>> +int clp_immediate_cmd(S390CPU *cpu, uint8_t r1, uint8_t r2, uint8_t i3,
>> +                      uintptr_t ra)
>> +{
>> +    CPUS390XState *env = &cpu->env;
>> +
>> +    switch (r2) {
>> +    case 0: /* Command Check */
>> +        switch (i3 & 0x07) {
>> +        case CLP_LPS_PCI: /* PCI */
>> +            if (!s390_has_feat(S390_FEAT_ZPCI)) {
>> +                setcc(cpu, 3);
>> +                return 0;
>> +            }
>> +            /* fallthrough */
>> +        case CLP_LPS_BASE: /* Base LP */
>> +            setcc(cpu, 0);
>> +            return 0;
>> +        }
>> +        setcc(cpu, 3);
>> +        return 0;
>> +    case 1: /* Command Query */
>> +        env->regs[r1] = CLP_QUERY_LP_BASE;
>> +        if (s390_has_feat(S390_FEAT_ZPCI)) {
>> +            env->regs[r1] |= CLP_QUERY_LP_BASE >> CLP_LPS_PCI;
>> +        }
>> +        setcc(cpu, 0);
>> +        return 0;
>> +    }
>> +
>> +    s390_program_interrupt(env, PGM_SPECIFICATION, ra);
> 
> Just a matter of taste, but I'd rather put that into a "default:" case, 
> so that the other cases could "break" instead of returning immediately.

OK, is better.

> 
>> +    return 0;
>> +}
> 
> All return statements return 0. Thus the return value does not really 
> matter, you could also turn this into a "void" function.

Yes.

> 
>>   int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra)
>>   {
>>       ClpReqHdr *reqh;
>> diff --git a/include/hw/s390x/s390-pci-inst.h 
>> b/include/hw/s390x/s390-pci-inst.h
>> index a55c448aad..07721b08da 100644
>> --- a/include/hw/s390x/s390-pci-inst.h
>> +++ b/include/hw/s390x/s390-pci-inst.h
>> @@ -101,6 +101,11 @@ typedef struct ZpciFib {
>>   int pci_dereg_irqs(S390PCIBusDevice *pbdev);
>>   void pci_dereg_ioat(S390PCIIOMMU *iommu);
>>   int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra);
>> +#define CLP_LPS_BASE 0
>> +#define CLP_LPS_PCI  2
>> +#define CLP_QUERY_LP_BASE (1UL << 63)
>> +int clp_immediate_cmd(S390CPU *cpu, uint8_t r1, uint8_t r2, uint8_t i3,
>> +                      uintptr_t ra);
>>   int pcilg_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, 
>> uintptr_t ra);
>>   int pcistg_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, 
>> uintptr_t ra);
>>   int rpcit_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, 
>> uintptr_t ra);
>> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
>> index 0a5f2aced2..af1316372d 100644
>> --- a/target/s390x/kvm/kvm.c
>> +++ b/target/s390x/kvm/kvm.c
>> @@ -1345,7 +1345,13 @@ static uint64_t get_base_disp_rsy(S390CPU *cpu, 
>> struct kvm_run *run,
>>   static int kvm_clp_service_call(S390CPU *cpu, struct kvm_run *run)
>>   {
>> +    uint8_t r1 = (run->s390_sieic.ipb & 0x00f00000) >> 20;
>>       uint8_t r2 = (run->s390_sieic.ipb & 0x000f0000) >> 16;
>> +    uint8_t i3 = (run->s390_sieic.ipb & 0xff000000) >> 24;
>> +
>> +    if (i3 & 0x80) {
>> +        return clp_immediate_cmd(cpu, r1, r2, i3, RA_IGNORED);
>> +    }
>>       if (s390_has_feat(S390_FEAT_ZPCI)) {
>>           return clp_service_call(cpu, r2, RA_IGNORED);
>>
> 
> Could you please adjust the TCG part accordingly, too?
> 
>   Thomas
> 
> 

Thanks for the comments,
I adjust TCG too.

Regards,
Pierre


-- 
Pierre Morel
IBM Lab Boeblingen

