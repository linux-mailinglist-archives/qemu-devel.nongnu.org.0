Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E523CB681
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 13:03:11 +0200 (CEST)
Received: from localhost ([::1]:54196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4LcZ-00020Z-NP
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 07:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m4LZB-0001CF-91
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 06:59:37 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:39670
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m4LZ9-0005UP-KC
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 06:59:37 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16GAY3kT027059; Fri, 16 Jul 2021 06:59:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=L/E5LKsd3prMYCZUAMCm1xjUwGH+QTmpICEG3kFXHxo=;
 b=KOQwIS6jF3pSihqLiPNB1yvgi64jiRzwQaRLjCgxOymz6iLfzcVkE5K9MX+3tcYduQz8
 Q0K/KlNOr8im75XknouvHaGeHEXy29wDE5niNEd87jdPy4fUEI72ePIzZFMTyuX/KlD+
 HoiV8BLMLJ6BfFEykwzu55aAjoUH8856LTk0j+DLoPSIgQAnHLUcDX3Yn8RFxRN2/DZV
 NmpoAwSeWMABHMkQNAR6airYFNk38jI7wtHPEP+2aDJfhn6WJJkPL6tn21wQDojaK6Gq
 p8YCTpsWgse3mUwsugBBBXSJv3gJ0e7RxBCSBuKDovpma+BU2IUhk/Sg4rtBBUxLQu19 og== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39tw2rs6pe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 06:59:34 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16GAZXx6031077;
 Fri, 16 Jul 2021 06:59:34 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39tw2rs6ng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 06:59:34 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16GAxF7Z001828;
 Fri, 16 Jul 2021 10:59:32 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 39q3689eb8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 10:59:32 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16GAxTKn16711962
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Jul 2021 10:59:29 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E312B4C05C;
 Fri, 16 Jul 2021 10:59:28 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5AE834C076;
 Fri, 16 Jul 2021 10:59:28 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.164.173])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 16 Jul 2021 10:59:28 +0000 (GMT)
Subject: Re: [PATCH v1 1/9] s390x: smp: s390x dedicated smp parsing
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
 <1626281596-31061-2-git-send-email-pmorel@linux.ibm.com>
 <871r7yd4gf.fsf@redhat.com> <YPFN83pKBt7F97kW@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <2582afdf-4071-a12c-bf83-0fdb837bb5f1@linux.ibm.com>
Date: Fri, 16 Jul 2021 12:59:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPFN83pKBt7F97kW@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9Q-KXvu1LZm8OS6qIMXvJ1Vz_6K57SC5
X-Proofpoint-ORIG-GUID: IFlmQSwXhcQyEXBcqFQ2hM3xgzebptmW
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-16_04:2021-07-16,
 2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2107160063
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
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
Cc: thuth@redhat.com, ehabkost@redhat.com, david@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, armbru@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, pbonzini@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/16/21 11:14 AM, Daniel P. Berrangé wrote:
> On Fri, Jul 16, 2021 at 10:54:08AM +0200, Cornelia Huck wrote:
>> On Wed, Jul 14 2021, Pierre Morel <pmorel@linux.ibm.com> wrote:
>>
>>> We need a s390x dedicated SMP parsing to handle s390x specificities.
>>>
>>> In this patch we only handle threads, cores and sockets for
>>> s390x:
>>> - do not support threads, we always have 1 single thread per core
>>> - the sockets are filled one after the other with the cores
>>>
>>> Both these handlings are different from the standard smp_parse
>>> functionement and reflect the CPU topology in the simple case
>>> where all CPU belong to the same book.
>>>
>>> Topology levels above sockets, i.e. books, drawers, are not
>>> considered at this stage and will be introduced in a later patch.
>>>
>>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>>> ---
>>>   hw/s390x/s390-virtio-ccw.c | 42 ++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 42 insertions(+)
>>>
>>> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
>>> index e4b18aef49..899d3a4137 100644
>>> --- a/hw/s390x/s390-virtio-ccw.c
>>> +++ b/hw/s390x/s390-virtio-ccw.c
>>> @@ -582,6 +582,47 @@ static ram_addr_t s390_fixup_ram_size(ram_addr_t sz)
>>>       return newsz;
>>>   }
>>>   
>>> +/*
>>> + * In S390CCW machine we do not support threads for now,
>>> + * only sockets and cores.
>>> + */
>>> +static void s390_smp_parse(MachineState *ms, QemuOpts *opts)
>>
>> It seems you based this on an older version of the code? The current
>> signature of this function since 1e63fe685804 ("machine: pass QAPI
>> struct to mc->smp_parse") is
>>
>> void (*smp_parse)(MachineState *ms, SMPConfiguration *config, Error **errp);
>>
>> That affects your parsing, and also lets you get rid of the ugly exit(1)
>> statements.
>>
>>> +{
>>> +    unsigned cpus    = qemu_opt_get_number(opts, "cpus", 1);
>>> +    unsigned sockets = qemu_opt_get_number(opts, "sockets", 1);
>>> +    unsigned cores   = qemu_opt_get_number(opts, "cores", 1);
>>> +
>>> +    if (opts) {
>>> +        if (cpus == 0 || sockets == 0 || cores == 0) {
>>
>> This behaviour looks different from what we do for other targets: if you
>> specify the value as 0, a value is calculated from the other values;
>> here, you error out. It's probably not a good idea to differ.
> 
> I increasingly worry that we're making a mistake by going down the
> route of having custom smp_parse implementations per target, as this
> is showing signs of inconsistent behaviour and error reportings. I
> think the differences / restrictions have granularity at a different
> level that is being tested in many cases too.
> 
> Whether threads != 1 is valid will likely vary depending on what
> CPU model is chosen, rather than what architecture is chosen.
> The same is true for dies != 1. We're not really checking this
> closely even in x86 - for example I can request nonsense such
> as a 25 year old i486 CPU model with hyperthreading and multiple
> dies
> 
>    qemu-system-x86_64 -cpu 486 -smp 16,cores=4,dies=2,threads=2
> 
> In this patch, there is no error reporting if the user specifies
> dies != 1 or threads != 1 - it just silently ignores the request
> which is not good.

yes, I should change this

> 
> Some machine types may have constraints on CPU sockets.
> 
> This can of course all be handled by custom smp_parse impls, but
> this is ultimately going to lead to alot of duplicated and
> inconsistent logic I fear.
> 
> I wonder if we would be better off having machine class callback
> that can report topology constraints for the current configuration,
> along lines of
> 
>       smp_constraints(MachineState *ms,
>                       int *max_sockets,
>                       int *max_dies,
>                       int *max_cores,
>                       int *max_threads)


I find the idee good, but what about making it really machine agnostic 
by removing names and using a generic

     smp_constraints(MachineState *ms,
             int *nb_levels,
             int *levels[]
             );

Level can be replaced by another name like container.
The machine could also provide the level/container names according to 
its internal documentation.

Regards,
Pierre


> 
> And then have only a single smp_parse impl that takes into account
> these constraints, to report errors / fill in missing fields / etc ?
> 
> Regards,
> Daniel
> 

-- 
Pierre Morel
IBM Lab Boeblingen

