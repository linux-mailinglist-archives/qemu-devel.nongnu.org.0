Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4A042BAB9
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 10:42:48 +0200 (CEST)
Received: from localhost ([::1]:49916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maZqZ-0006z5-2a
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 04:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1maZoi-0006Bw-4g; Wed, 13 Oct 2021 04:40:52 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1maZof-0003Q1-IL; Wed, 13 Oct 2021 04:40:51 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19D7c5x2021877; 
 Wed, 13 Oct 2021 04:40:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vENGsMQ+Qf8093asK7RoKtuhGfZLDOk7N3l4P5RTCro=;
 b=pQcH1XsREeQq4gFgtPEZPIxXjdQ5SUALppA3uqNBsAs8PAenPLcqVnjISrPPiTIdMyN9
 M497HJL2PIvwmTm2cBK91VWx/FPBPeP0qOXzqlCXFoMp8PZBceOkFsYIAQhSRaBRNKsq
 S1ERWOmy0M1S55SEV/5Noggp5eSSgm3HJXhbk/OeaX5DrCKWCQA3wSHJquKUN/eyBt9m
 YvKEe3R7EH24A+ue9qZG/GBOlRbRDzar3fN+/i52hnAtpe9xHufsf0niaoSWKjbmXWEz
 ETMzfWgzKoySyWTgZgDlHIqD+pCmhbCOr7weVNpfRdrIopuYZ3RqniMwLdoKoOdrlhd+ 3Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bnr79d020-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Oct 2021 04:40:46 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19D764eC019670;
 Wed, 13 Oct 2021 04:40:45 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bnr79d00t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Oct 2021 04:40:45 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19D8bQR6014458;
 Wed, 13 Oct 2021 08:40:41 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3bk2q9rpc2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Oct 2021 08:40:41 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 19D8Yu2G58458582
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Oct 2021 08:34:56 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A63DA404D;
 Wed, 13 Oct 2021 08:40:34 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40A7EA4055;
 Wed, 13 Oct 2021 08:40:31 +0000 (GMT)
Received: from [9.171.19.130] (unknown [9.171.19.130])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 13 Oct 2021 08:40:30 +0000 (GMT)
Message-ID: <d892f64b-2260-808b-2b05-f38839e4b52e@linux.ibm.com>
Date: Wed, 13 Oct 2021 10:40:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 4/4] s390x: topology: implementating Store Topology
 System Information
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
References: <1631800254-25762-1-git-send-email-pmorel@linux.ibm.com>
 <1631800254-25762-5-git-send-email-pmorel@linux.ibm.com>
 <e20bcaec-e76e-d12a-3a94-f4f0170b203a@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <e20bcaec-e76e-d12a-3a94-f4f0170b203a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wKqBT_STpzLFAqa0OfayH3pPqYODRxSL
X-Proofpoint-ORIG-GUID: PF0PLvI4BfARQoOqMCZw8fzpBiSrJ4Fs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-13_02,2021-10-13_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2110130057
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
Cc: david@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/13/21 10:20, Thomas Huth wrote:
> On 16/09/2021 15.50, Pierre Morel wrote:
>> The handling of STSI is enhanced with the interception of the
>> function code 15 for storing CPU topology.
>>
>> Using the objects built during the pluging of CPU, we build the
>> SYSIB 15_1_x structures.
>>
>> With this patch the maximum MNEST level is 2, this is also
>> the only level allowed and only SYSIB 15_1_2 will be built.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   target/s390x/kvm/kvm.c | 101 +++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 101 insertions(+)
>>
>> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
>> index dd036961fe..0a5f2aced2 100644
>> --- a/target/s390x/kvm/kvm.c
>> +++ b/target/s390x/kvm/kvm.c
>> @@ -52,6 +52,7 @@
>>   #include "hw/s390x/s390-virtio-ccw.h"
>>   #include "hw/s390x/s390-virtio-hcall.h"
>>   #include "hw/s390x/pv.h"
>> +#include "hw/s390x/cpu-topology.h"
>>   #ifndef DEBUG_KVM
>>   #define DEBUG_KVM  0
>> @@ -1908,6 +1909,102 @@ static void insert_stsi_3_2_2(S390CPU *cpu, 
>> __u64 addr, uint8_t ar)
>>       }
>>   }
> 
> Could you maybe put the new code in a separate file under target/s390x/ 
> (maybe target/s390x/topology.c ?), in case we ever want to implement 
> this for TCG, too?

Yes right, did not thing about TCG as I saw it as pure Z.
But in fact it may be adapted for TCG too.


> 
>> +static int stsi_15_cpus(void *p, S390TopologyCores *cd)
>> +{
>> +    SysIBTl_cpu *tle = (SysIBTl_cpu *)p;
>> +
>> +    tle->nl = 0;
>> +    tle->dedicated = cd->dedicated;
>> +    tle->polarity = cd->polarity;
>> +    tle->type = cd->cputype;
>> +    tle->origin = cd->origin;
> 
> If we want to use this for TCG, too, one day:
> 
>     tle->origin = be16_to_cpu(cd->origin);

yes.

> 
>> +    tle->mask = cd->mask;
>> +
>> +    return sizeof(*tle);
>> +}
>> +
>> +static int set_socket(const MachineState *ms, void *p,
>> +                      S390TopologySocket *socket)
>> +{
>> +    BusChild *kid;
>> +    int l, len = 0;
>> +
>> +    len += stsi_15_container(p, 1, socket->socket_id);
>> +    p += len;
>> +
>> +    QTAILQ_FOREACH_REVERSE(kid, &socket->bus->children, sibling) {
>> +        l = stsi_15_cpus(p, S390_TOPOLOGY_CORES(kid->child));
>> +        p += l;
>> +        len += l;
>> +    }
>> +    return len;
>> +}
>> +
>> +static void insert_stsi_15_1_2(const MachineState *ms, void *p)
>> +{
>> +    S390TopologyBook *book;
>> +    SysIB_151x *sysib;
>> +    BusChild *kid;
>> +    int level = 2;
>> +    int len, l;
>> +
>> +    sysib = (SysIB_151x *)p;
>> +    sysib->mnest = level;
>> +    sysib->mag[TOPOLOGY_NR_MAG2] = ms->smp.sockets;
>> +    sysib->mag[TOPOLOGY_NR_MAG1] = ms->smp.cores;
>> +
>> +    book = s390_get_topology();
>> +    len = sizeof(SysIB_151x);
>> +    p += len;
>> +
>> +    QTAILQ_FOREACH_REVERSE(kid, &book->bus->children, sibling) {
>> +        l = set_socket(ms, p, S390_TOPOLOGY_SOCKET(kid->child));
>> +        p += l;
>> +        len += l;
>> +    }
>> +
>> +    sysib->length = len;
> 
> For TCG awareness:
> 
>      sysib->length = be16_to_cpu(len);

OK

Yes, thanks I will take care of TCG in the next spin.
Regards,
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

