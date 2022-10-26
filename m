Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC4B60DDB2
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 11:05:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oncLL-0004Kv-2G; Wed, 26 Oct 2022 05:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1oncLG-0003mF-0A; Wed, 26 Oct 2022 05:04:54 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1oncLD-0001hr-6J; Wed, 26 Oct 2022 05:04:52 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29Q850N8001587;
 Wed, 26 Oct 2022 09:04:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Eg3tSd88jZlSvJAjDu66NjYYojqavBcvCBSoX5Vg3Dk=;
 b=WuIag5GTcqEWQ2j+1MFb2T77iKep6KrwAkLkpc2TuDs3pS2qS4p74Ce4D3GhaPT+vW9A
 zE82beequf57ZjzwBaT29+aTwXycN/xDVZS8UhmEHvKmTCzfC5ee+19t0KZX2eYQ+1nA
 ZFyg7M08tGPfL8mEYImM/yYm+1k4y4Ar4ZHEd0s4jFCn0FXwLaQt+3Kx9hwWWRBv9YFo
 IDhulzAS2TZJOnLY8Rtdp7aGadKM30YlxZeCqxubLITsSL+qibYF5AOfALDVv8O4pooe
 sh+MUR3arsdFRINW65NC+/z/nXn1N3zRRwpNMtQ3Uu+6h6mNNVEy4BYyypwvH1H6cjss 2Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kf12t9uwq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Oct 2022 09:04:40 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29Q8IPFe030816;
 Wed, 26 Oct 2022 09:04:39 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kf12t9uu9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Oct 2022 09:04:39 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29Q8ovqO018581;
 Wed, 26 Oct 2022 09:04:36 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3kc7sj74gw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Oct 2022 09:04:36 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 29Q8xIkJ32375066
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Oct 2022 08:59:18 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CBCCAE056;
 Wed, 26 Oct 2022 09:04:33 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 899CCAE045;
 Wed, 26 Oct 2022 09:04:32 +0000 (GMT)
Received: from [9.171.85.254] (unknown [9.171.85.254])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 26 Oct 2022 09:04:32 +0000 (GMT)
Message-ID: <a28d41e1-f9dd-c620-8c54-bee4a0e46006@linux.ibm.com>
Date: Wed, 26 Oct 2022 11:04:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v10 7/9] s390x/cpu topology: add max_threads machine class
 attribute
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com
References: <20221012162107.91734-1-pmorel@linux.ibm.com>
 <20221012162107.91734-8-pmorel@linux.ibm.com>
 <b52ea256-c6c1-51ef-6e15-78a303143701@kaod.org>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <b52ea256-c6c1-51ef-6e15-78a303143701@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Ob-DvMwDdM3ki8B7S_g9ENujMBu22vHm
X-Proofpoint-ORIG-GUID: jNCXL8fRJ8sG_gnsYj5EYBUCpjODVE8v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-26_04,2022-10-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210260051
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 10/18/22 19:36, Cédric Le Goater wrote:
> On 10/12/22 18:21, Pierre Morel wrote:
>> The S390 CPU topology accepts the smp.threads argument while
>> in reality it does not effectively allow multthreading.
>>
>> Let's keep this behavior for machines older than 7.3 and
>> refuse to use threads in newer machines until multithreading
>> is really proposed to the guest by the machine.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   include/hw/s390x/s390-virtio-ccw.h |  1 +
>>   hw/s390x/s390-virtio-ccw.c         | 10 ++++++++++
>>   2 files changed, 11 insertions(+)
>>
>> diff --git a/include/hw/s390x/s390-virtio-ccw.h 
>> b/include/hw/s390x/s390-virtio-ccw.h
>> index 6c4b4645fc..319dfac1bb 100644
>> --- a/include/hw/s390x/s390-virtio-ccw.h
>> +++ b/include/hw/s390x/s390-virtio-ccw.h
>> @@ -48,6 +48,7 @@ struct S390CcwMachineClass {
>>       bool css_migration_enabled;
>>       bool hpage_1m_allowed;
>>       bool topology_allowed;
>> +    int max_threads;
>>   };
>>   /* runtime-instrumentation allowed by the machine */
>> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
>> index 3a13fad4df..d6ce31d168 100644
>> --- a/hw/s390x/s390-virtio-ccw.c
>> +++ b/hw/s390x/s390-virtio-ccw.c
>> @@ -85,8 +85,15 @@ out:
>>   static void s390_init_cpus(MachineState *machine)
>>   {
>>       MachineClass *mc = MACHINE_GET_CLASS(machine);
>> +    S390CcwMachineClass *s390mc = S390_CCW_MACHINE_CLASS(mc);
>>       int i;
>> +    if (machine->smp.threads > s390mc->max_threads) {
>> +        error_report("S390 does not support more than %d threads.",
>> +                     s390mc->max_threads);
>> +        exit(1);
>> +    }
>> +
>>       /* initialize possible_cpus */
>>       mc->possible_cpu_arch_ids(machine);
>> @@ -617,6 +624,7 @@ static void ccw_machine_class_init(ObjectClass 
>> *oc, void *data)
>>       s390mc->css_migration_enabled = true;
>>       s390mc->hpage_1m_allowed = true;
>>       s390mc->topology_allowed = true;
>> +    s390mc->max_threads = 1;
>>       mc->init = ccw_init;
>>       mc->reset = s390_machine_reset;
>>       mc->block_default_type = IF_VIRTIO;
>> @@ -887,12 +895,14 @@ static void 
>> ccw_machine_7_2_class_options(MachineClass *mc)
>>       S390CcwMachineClass *s390mc = S390_CCW_MACHINE_CLASS(mc);
>>       static GlobalProperty compat[] = {
>>           { TYPE_S390_CPU_TOPOLOGY, "topology-allowed", "off", },
>> +        { TYPE_S390_CPU_TOPOLOGY, "max_threads", "off", },
> 
> I don't understand this change.

hum, this was a try to understand how GlobalProperty_compat works and I 
forgot to remove it.
I must say I did not understand exactly how it works.

> 
> 
> C.
> 
> 
>>       };
>>       ccw_machine_7_3_class_options(mc);
>>       compat_props_add(mc->compat_props, hw_compat_7_2, 
>> hw_compat_7_2_len);
>>       compat_props_add(mc->compat_props, compat, G_N_ELEMENTS(compat));
>>       s390mc->topology_allowed = false;
>> +    s390mc->max_threads = S390_MAX_CPUS;
>>   }
>>   DEFINE_CCW_MACHINE(7_2, "7.2", false);
> 

-- 
Pierre Morel
IBM Lab Boeblingen

