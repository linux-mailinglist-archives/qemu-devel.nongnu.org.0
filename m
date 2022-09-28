Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 286BC5EDA47
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 12:43:28 +0200 (CEST)
Received: from localhost ([::1]:60182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odUXH-0006Pg-4d
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 06:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1odSrB-0003MS-AI; Wed, 28 Sep 2022 04:55:53 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:44206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1odSr7-0005oN-VK; Wed, 28 Sep 2022 04:55:52 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28S8Y376024398;
 Wed, 28 Sep 2022 08:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=/7+i1mM+aTmaJcZZ2lTbeNagkHj51JY7eVpWNdR0HWI=;
 b=a792UKDdgh52gSuTuqacD6Uk2D6OJAA83pGxWFZlUMtW+KBTcLDcOm76n0OrBFxvxOVN
 iMiBsT0ezsNOwRJUpuKKPAT8Y9SjOe4Lhw68yuY1ZzxXPU4Gi4YsXzKense9J6Qo83dz
 1T7fx6TcKloed1GExo9nvECJvnwuulC58bi1NC0X686DMoXm8DcaQWCcAfsKCUbqGO7e
 hs+RpE4v7ERWYb8O21p1PDZUyIzNJrHtES4PQP+22y16o/e85PYzrJClV3frA0+oQJ8z
 beXUmqwg9MOSIWCYK6zpRlGB6SyugVgcCwY2o4+V37MR1yTHIFxL8amUpYGJbBupdDir oQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jvjn6s3m5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 08:55:47 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28S8ZJaM001160;
 Wed, 28 Sep 2022 08:55:46 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jvjn6s3jf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 08:55:46 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28S8pwsw024381;
 Wed, 28 Sep 2022 08:55:44 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3juapujmbd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 08:55:43 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 28S8tfnO65995242
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Sep 2022 08:55:41 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E420B4C040;
 Wed, 28 Sep 2022 08:55:40 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 05C454C046;
 Wed, 28 Sep 2022 08:55:40 +0000 (GMT)
Received: from [9.171.31.212] (unknown [9.171.31.212])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 28 Sep 2022 08:55:39 +0000 (GMT)
Message-ID: <f63f9e7b-18f4-95f1-7912-e6ea27ac1784@linux.ibm.com>
Date: Wed, 28 Sep 2022 10:55:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v9 05/10] s390x/cpu: reporting drawers and books topology
 to the guest
Content-Language: en-US
To: Janis Schoetterl-Glausch <scgl@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com
References: <20220902075531.188916-1-pmorel@linux.ibm.com>
 <20220902075531.188916-6-pmorel@linux.ibm.com>
 <ecfcac0e9f31b6d4eac15b8b2cd10aab31ff0ff7.camel@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <ecfcac0e9f31b6d4eac15b8b2cd10aab31ff0ff7.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MlsdVGD4Arwq5YXg67fRKaAniamnCPtJ
X-Proofpoint-GUID: c70vG8Z0JEwBK-SjzcBUP3zAbS8ya79B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_03,2022-09-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209280051
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



On 9/7/22 12:36, Janis Schoetterl-Glausch wrote:
> On Fri, 2022-09-02 at 09:55 +0200, Pierre Morel wrote:
>> The guest can ask for a topology report on drawer's or book's
>> level.
>> Let's implement the STSI instruction's handling for the corresponding
>> selector values.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   hw/s390x/cpu-topology.c         | 19 +++++++---
>>   hw/s390x/s390-virtio-ccw.c      |  2 ++
>>   include/hw/s390x/cpu-topology.h |  7 +++-
>>   target/s390x/cpu_topology.c     | 64 +++++++++++++++++++++++++++------
>>   4 files changed, 76 insertions(+), 16 deletions(-)
>>
>> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
>> index e2fd5c7e44..bb9ae63483 100644
>> --- a/hw/s390x/cpu-topology.c
>> +++ b/hw/s390x/cpu-topology.c
>>
> [...]
> 
>> @@ -99,13 +103,20 @@ static void s390_topology_realize(DeviceState *dev, Error **errp)
>>       S390Topology *topo = S390_CPU_TOPOLOGY(dev);
>>       int n;
>>   
>> +    topo->drawers = ms->smp.drawers;
>> +    topo->books = ms->smp.books;
>> +    topo->total_books = topo->books * topo->drawers;
>>       topo->sockets = ms->smp.sockets;
>> +    topo->total_sockets = topo->sockets * topo->books * topo->drawers;
>>       topo->cores = ms->smp.cores;
>> -    topo->tles = ms->smp.max_cpus;
>>   
>> -    n = topo->sockets;
>> +    n = topo->drawers;
>> +    topo->drawer = g_malloc0(n * sizeof(S390TopoContainer));
>> +    n *= topo->books;
>> +    topo->book = g_malloc0(n * sizeof(S390TopoContainer));
>> +    n *= topo->sockets;
>>       topo->socket = g_malloc0(n * sizeof(S390TopoContainer));
>> -    topo->tle = g_malloc0(topo->tles * sizeof(S390TopoTLE));
>> +    topo->tle = g_malloc0(n * sizeof(S390TopoTLE));
> 
> Same question here about using g_new0.

yes, g_new0 is better here

>>   
>>       qemu_mutex_init(&topo->topo_mutex);
>>   }
>> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
>> index 15cefd104b..3f28e28d47 100644
>> --- a/hw/s390x/s390-virtio-ccw.c
>> +++ b/hw/s390x/s390-virtio-ccw.c
>> @@ -626,6 +626,8 @@ static void ccw_machine_class_init(ObjectClass *oc, void *data)
>>       hc->unplug_request = s390_machine_device_unplug_request;
>>       nc->nmi_monitor_handler = s390_nmi;
>>       mc->default_ram_id = "s390.ram";
>> +    mc->smp_props.books_supported = true;
>> +    mc->smp_props.drawers_supported = true;
>>   }
>>   
>>   static inline bool machine_get_aes_key_wrap(Object *obj, Error **errp)
>> diff --git a/include/hw/s390x/cpu-topology.h b/include/hw/s390x/cpu-topology.h
>> index 0b7f3d10b2..4f8ac39ca0 100644
>> --- a/include/hw/s390x/cpu-topology.h
>> +++ b/include/hw/s390x/cpu-topology.h
>> @@ -29,9 +29,14 @@ typedef struct S390TopoTLE {
>>   
>>   struct S390Topology {
>>       SysBusDevice parent_obj;
>> +    int total_books;
>> +    int total_sockets;
> 
> What are these used for? I'm not seeing anything.
> 
>> +    int drawers;
>> +    int books;
>>       int sockets;
>>       int cores;
>> -    int tles;
> 
> You remove this in this patch and you didn't really need it before.
> As far as I can tell it was just used for calculating the number of
> tles to allocate and you could use a local variable instead.
> So I would get rid of it in the patch that introduced it.

yes


> 
>> +    S390TopoContainer *drawer;
>> +    S390TopoContainer *book;
>>       S390TopoContainer *socket;
>>       S390TopoTLE *tle;
>>       QemuMutex topo_mutex;
>> diff --git a/target/s390x/cpu_topology.c b/target/s390x/cpu_topology.c
>> index 56865dafc6..305fbb9734 100644
>> --- a/target/s390x/cpu_topology.c
>> +++ b/target/s390x/cpu_topology.c
>> @@ -37,19 +37,18 @@ static char *fill_tle_cpu(char *p, uint64_t mask, int origin)
>>       return p + sizeof(*tle);
>>   }
>>   
>> -static char *s390_top_set_level2(S390Topology *topo, char *p)
>> +static char *s390_top_set_level2(S390Topology *topo, char *p, int fs, int ns)
>>   {
> 
> I wouldn't hate more verbose names for fs and ns. start_socket,
> num_socket maybe? Same for fb, nb, but it is your call, it's not really
> hard to understand the code.

I prefer to keep the names short but I will have a second thought.

> 
>> -    int i, origin;
>> +    int socket, origin;
>> +    uint64_t mask;
>>   
>> -    for (i = 0; i < topo->sockets; i++) {
>> -        if (!topo->socket[i].active_count) {
>> +    for (socket = fs; socket < fs + ns; socket++) {
>> +        if (!topo->socket[socket].active_count) {
>>               continue;
>>           }
>> -        p = fill_container(p, 1, i);
>> +        p = fill_container(p, 1, socket);
> 
> Have you considered using an enum for the level constants?

did not but yes it would be better.

> 
>>           for (origin = 0; origin < S390_TOPOLOGY_MAX_ORIGIN; origin++) {
>> -            uint64_t mask = 0L;
>> -
>> -            mask = be64_to_cpu(topo->tle[i].mask[origin]);
>> +            mask = be64_to_cpu(topo->tle[socket].mask[origin]);
>>               if (mask) {
>>                   p = fill_tle_cpu(p, mask, origin);
>>               }
>> @@ -58,19 +57,63 @@ static char *s390_top_set_level2(S390Topology *topo, char *p)
>>       return p;
>>   }
>>   
>> +static char *s390_top_set_level3(S390Topology *topo, char *p, int fb, int nb)
>> +{
>> +    int book, fs = 0;
>> +
>> +    for (book = fb; book < fb + nb; book++, fs += topo->sockets) {
>> +        if (!topo->book[book].active_count) {
>> +            continue;
>> +        }
>> +        p = fill_container(p, 2, book);
>> +    p = s390_top_set_level2(topo, p, fs, topo->sockets);
> 
> Indent is off.

thx

> 
>> +    }
>> +    return p;
>> +}
>> +
>> +static char *s390_top_set_level4(S390Topology *topo, char *p)
>> +{
>> +    int drawer, fb = 0;
>> +
>> +    for (drawer = 0; drawer < topo->drawers; drawer++, fb += topo->books) {
>> +        if (!topo->drawer[drawer].active_count) {
>> +            continue;
>> +        }
>> +        p = fill_container(p, 3, drawer);
>> +        p = s390_top_set_level3(topo, p, fb, topo->books);
>> +    }
>> +    return p;
>> +}
>> +
>>   static int setup_stsi(SysIB_151x *sysib, int level)
>>   {
>>       S390Topology *topo = s390_get_topology();
>>       char *p = (char *)sysib->tle;
>> +    int max_containers;
>>   
>>       qemu_mutex_lock(&topo->topo_mutex);
>>   
>>       sysib->mnest = level;
>>       switch (level) {
>>       case 2:
>> +        max_containers = topo->sockets * topo->books * topo->drawers;
>> +        sysib->mag[TOPOLOGY_NR_MAG2] = max_containers;
>> +        sysib->mag[TOPOLOGY_NR_MAG1] = topo->cores;
>> +        p = s390_top_set_level2(topo, p, 0, max_containers);
> 
> Isn't this logic change already required for the patch that introduced
> stsi 15.1.2 handling?

yes, thx

> 
>> +        break;
>> +    case 3:
>> +        max_containers = topo->books * topo->drawers;
>> +        sysib->mag[TOPOLOGY_NR_MAG3] = max_containers;
>>           sysib->mag[TOPOLOGY_NR_MAG2] = topo->sockets;
>>           sysib->mag[TOPOLOGY_NR_MAG1] = topo->cores;
>> -        p = s390_top_set_level2(topo, p);
>> +        p = s390_top_set_level3(topo, p, 0, max_containers);
>> +        break;
>> +    case 4:
>> +        sysib->mag[TOPOLOGY_NR_MAG4] = topo->drawers;
>> +        sysib->mag[TOPOLOGY_NR_MAG3] = topo->books;
>> +        sysib->mag[TOPOLOGY_NR_MAG2] = topo->sockets;
>> +        sysib->mag[TOPOLOGY_NR_MAG1] = topo->cores;
>> +        p = s390_top_set_level4(topo, p);
>>           break;
>>       }
>>   
>> @@ -79,7 +122,7 @@ static int setup_stsi(SysIB_151x *sysib, int level)
>>       return p - (char *)sysib->tle;
>>   }
>>   
>> -#define S390_TOPOLOGY_MAX_MNEST 2
>> +#define S390_TOPOLOGY_MAX_MNEST 4
> 
> AFAIK you're only allowed to increase this if the maximum mnest
> facility is installed. If it isn't, only level 2 is supported.
> Which would mean that this patch doesn't do anything.

AFAIU this is model dependant but I have to rework the MNEST entry of 
the SYSIB anyway.

> 
>>   void insert_stsi_15_1_x(S390CPU *cpu, int sel2, __u64 addr, uint8_t ar)
>>   {
>>       SysIB_151x *sysib;
>> @@ -105,4 +148,3 @@ void insert_stsi_15_1_x(S390CPU *cpu, int sel2, __u64 addr, uint8_t ar)
>>   out_free:
>>       g_free(sysib);
>>   }
>> -
> 

Thanks for the comments

Regards,
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

