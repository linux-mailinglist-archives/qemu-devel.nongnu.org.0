Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A6C5EDBFB
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 13:46:20 +0200 (CEST)
Received: from localhost ([::1]:60090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odVW7-00022i-DJ
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 07:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1odTug-00019N-Lm; Wed, 28 Sep 2022 06:03:35 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:30312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1odTue-00079x-Rn; Wed, 28 Sep 2022 06:03:34 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28S9vsln039483;
 Wed, 28 Sep 2022 10:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=qUi0NCrPzDUorqH6Y4leU/zehLg6NmyCovvT7z+8JJg=;
 b=SST1dxDVEqij0l2qq2tcUXmtU5TUku17QbX6/Ot7cVBz2N9OdxZRIfPmqXiay7cZdOpF
 m7XtprqqqMEwYspAYYjhFAUuTmjFJ/ttA5fo3Js8MV/CZ9KKthg2JoMpUuasP19zL5Ju
 yhRf3MMGBzQIj+zSt42fEIWv0RDZeNA23des1ZwUxfvHck+Vfo10zOXIRHN79ePSbtLo
 qldRyo4p+KFfnevIUISz6wvDuRhFIqJS4f3Bsz0WdeK6Km6QnUKZjtJNGSDkSFDRZPqw
 TwwxnzI08bxlp96eSGEcISQXuIHk0GeV8ZolEgNujiJxWC1uQ0KZU4bVOn94qgSUuynh RA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jvm3qg6aw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 10:03:30 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28SA0dbl013477;
 Wed, 28 Sep 2022 10:03:29 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jvm3qg68t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 10:03:29 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28S9rqIr003634;
 Wed, 28 Sep 2022 10:03:26 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 3jssh8usft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 10:03:26 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 28SA3NsD53739776
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Sep 2022 10:03:23 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1CB2C4C052;
 Wed, 28 Sep 2022 10:03:23 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4125F4C040;
 Wed, 28 Sep 2022 10:03:22 +0000 (GMT)
Received: from [9.171.31.212] (unknown [9.171.31.212])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 28 Sep 2022 10:03:22 +0000 (GMT)
Message-ID: <e5e4aabd-64aa-70c0-e301-0d11e70829f2@linux.ibm.com>
Date: Wed, 28 Sep 2022 12:03:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v9 03/10] s390x/cpu topology: reporting the CPU topology
 to the guest
Content-Language: en-US
To: Nico Boehr <nrb@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 frankja@linux.ibm.com
References: <20220902075531.188916-1-pmorel@linux.ibm.com>
 <20220902075531.188916-4-pmorel@linux.ibm.com>
 <166245225333.5995.17109067416462484247@t14-nrb>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <166245225333.5995.17109067416462484247@t14-nrb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QWfzCb2PuSeW8adl_S_w_Wi2vIB48UpJ
X-Proofpoint-GUID: Ab-Gyf7slNEh6gSDk5aSvbbCP9NqNWLf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_03,2022-09-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 mlxscore=0 impostorscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209280061
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/6/22 10:17, Nico Boehr wrote:
> Quoting Pierre Morel (2022-09-02 09:55:24)
>> The guest can use the STSI instruction to get a buffer filled
>> with the CPU topology description.
>>
>> Let us implement the STSI instruction for the basis CPU topology
>> level, level 2.
> 
> I like this. It is so much simpler. Thanks.
> 
> [...]
>> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
>> index a6ca006ec5..e2fd5c7e44 100644
>> --- a/hw/s390x/cpu-topology.c
>> +++ b/hw/s390x/cpu-topology.c
>> @@ -76,9 +76,11 @@ void s390_topology_new_cpu(int core_id)
>>        * in the CPU container allows to represent up to the maximal number of
>>        * CPU inside several CPU containers inside the socket container.
>>        */
>> +    qemu_mutex_lock(&topo->topo_mutex);
> 
> You access topo->cores above. Do you need the mutex for that? I guess not since
> it can't change at runtime (right?), so maybe it is worth documenting what the
> topo_mutex actually protects or you just take the mutex at the start of the
> function.

You are right one should always do that.
I will add this.

> 
> [...]
>> diff --git a/target/s390x/cpu_topology.c b/target/s390x/cpu_topology.c
>> new file mode 100644
>> index 0000000000..56865dafc6
>> --- /dev/null
>> +++ b/target/s390x/cpu_topology.c
> [...]
>> +static char *fill_tle_cpu(char *p, uint64_t mask, int origin)
>> +{
>> +    SysIBTl_cpu *tle = (SysIBTl_cpu *)p;
>> +
>> +    tle->nl = 0;
>> +    tle->dedicated = 1;
>> +    tle->polarity = S390_TOPOLOGY_POLARITY_H;
>> +    tle->type = S390_TOPOLOGY_CPU_TYPE;
>> +    tle->origin = origin * 64;
> 
> origin would also need a byte order conversion.

yes

> 
>> +    tle->mask = be64_to_cpu(mask);
> 
> cpu_to_be64()

yes

> 
> [...]
>> +static char *s390_top_set_level2(S390Topology *topo, char *p)
>> +{
>> +    int i, origin;
>> +
>> +    for (i = 0; i < topo->sockets; i++) {
>> +        if (!topo->socket[i].active_count) {
>> +            continue;
>> +        }
>> +        p = fill_container(p, 1, i);
>> +        for (origin = 0; origin < S390_TOPOLOGY_MAX_ORIGIN; origin++) {
>> +            uint64_t mask = 0L;
>> +
>> +            mask = be64_to_cpu(topo->tle[i].mask[origin]);
> 
> Don't you already do the endianness conversion in fill_tle_cpu()?

yes

> 
> [...]
>> +void insert_stsi_15_1_x(S390CPU *cpu, int sel2, __u64 addr, uint8_t ar)
>> +{
>> +    SysIB_151x *sysib;
>> +    int len = sizeof(*sysib);
>> +
>> +    if (s390_is_pv() || sel2 < 2 || sel2 > S390_TOPOLOGY_MAX_MNEST) {
>> +        setcc(cpu, 3);
>> +        return;
>> +    }
>> +
>> +    sysib = g_malloc0(TARGET_PAGE_SIZE);
>> +
>> +    len += setup_stsi(sysib, sel2);
>> +    if (len > TARGET_PAGE_SIZE) {
>> +        setcc(cpu, 3);
>> +        goto out_free;
>> +    }
> 
> Maybe I don't get it, but isn't it kind of late for this check? You would
> already have written beyond the end of the buffer at this point in time...

it is


Thanks for your comments.

regards,
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

