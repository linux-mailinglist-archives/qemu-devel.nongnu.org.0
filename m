Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32B863ECA4
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 10:39:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0g1e-000441-IM; Thu, 01 Dec 2022 04:38:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1p0g1K-0003wy-7V; Thu, 01 Dec 2022 04:38:27 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1p0g1G-0003mT-4C; Thu, 01 Dec 2022 04:38:17 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B19Lfj3008985; Thu, 1 Dec 2022 09:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=0yDREg9MGdqCNxR8IO/Nk02yMrY0YjXusOFfPzon5lY=;
 b=S4nqwpvO8LM7WIlyN3s276BS9OIbFLjLzb1JSHix+nWHThicEEMNo0jaFOBp50K2ZNIG
 HFgF+U9JJMVRY2NT7MYFsh2skbxWbbFLahhUsHmq/b7YgMuuXMXIj8Mpc1/mEN8kA0rf
 zyoZ1jfXq2HLYqbhd2YCb0wGWmhRbuq2B0m+vHygZ/e/fj33qYIqy6zyXG9WYA1F7DiS
 R7d7EMZZiOZnqj941RYSLDVuqi2dR4OJPG4OYbgahZX9DtMiFL6hHANJgH7fdeuUPcNY
 lX1+G7u90rUDOmeyl7TIznKBTJ8XVVQgZC93SuIz2oJx5g0sPQM/nVl41Ft+1orJYdr6 zA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m6sjrrej0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Dec 2022 09:37:59 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B19LnB3009209;
 Thu, 1 Dec 2022 09:37:58 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m6sjrregq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Dec 2022 09:37:58 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2B19ZXK7025384;
 Thu, 1 Dec 2022 09:37:56 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3m3ae9f48b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Dec 2022 09:37:55 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2B19bqZs3670752
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Dec 2022 09:37:52 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB8B211C050;
 Thu,  1 Dec 2022 09:37:52 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC11111C052;
 Thu,  1 Dec 2022 09:37:51 +0000 (GMT)
Received: from [9.171.21.111] (unknown [9.171.21.111])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  1 Dec 2022 09:37:51 +0000 (GMT)
Message-ID: <e026cd45-afae-3c60-e967-17147709c1e9@linux.ibm.com>
Date: Thu, 1 Dec 2022 10:37:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v12 1/7] s390x/cpu topology: Creating CPU topology device
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 scgl@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com,
 clg@kaod.org
References: <20221129174206.84882-1-pmorel@linux.ibm.com>
 <20221129174206.84882-2-pmorel@linux.ibm.com>
 <b61c8e4d-cae9-b267-a00b-007401b95bfb@redhat.com>
Content-Language: en-US
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <b61c8e4d-cae9-b267-a00b-007401b95bfb@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7Xf_tiJBINCpB66aCJParLKtXnABuZQQ
X-Proofpoint-ORIG-GUID: HmzZAcR8iGC_sYqD10ioNffqKnOjAV4f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_04,2022-11-30_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212010066
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 12/1/22 10:08, Thomas Huth wrote:
> On 29/11/2022 18.42, Pierre Morel wrote:
>> We will need a Topology device to transfer the topology
>> during migration and to implement machine reset.
>>
>> The device creation is fenced by s390_has_topology().
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
> ...
>> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
>> index 2e64ffab45..973bbdd36e 100644
>> --- a/hw/s390x/s390-virtio-ccw.c
>> +++ b/hw/s390x/s390-virtio-ccw.c
>> @@ -44,6 +44,7 @@
>>   #include "hw/s390x/pv.h"
>>   #include "migration/blocker.h"
>>   #include "qapi/visitor.h"
>> +#include "hw/s390x/cpu-topology.h"
>>   static Error *pv_mig_blocker;
>> @@ -102,6 +103,24 @@ static void s390_init_cpus(MachineState *machine)
>>       }
>>   }
>> +static DeviceState *s390_init_topology(MachineState *machine, Error 
>> **errp)
>> +{
>> +    DeviceState *dev;
>> +
>> +    dev = qdev_new(TYPE_S390_CPU_TOPOLOGY);
>> +
>> +    object_property_add_child(&machine->parent_obj,
>> +                              TYPE_S390_CPU_TOPOLOGY, OBJECT(dev));
>> +    object_property_set_int(OBJECT(dev), "num-cores",
>> +                            machine->smp.cores * 
>> machine->smp.threads, errp);
> 
> I wonder what will happen if we ever support multithreading on s390x 
> later? ... won't this cause some oddities when migrating older machines 
> types with smp.threads > 1 later? Maybe we should prohibit to enable the 
> CPU topology instead if a user tried to use threads > 1 with an older 
> machine type?

Yes, right, I forgot to change this back.
Anyway it has no sens for new machine which prohibit smp.threads > 1 
neither.

I change this by returning an error in case we have smp.threads > 1

Thanks.

Pierre

> 
>   Thomas
> 
> 
>> +    object_property_set_int(OBJECT(dev), "num-sockets",
>> +                            machine->smp.sockets, errp);
>> +
>> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), errp);
>> +
>> +    return dev;
>> +}
> 

-- 
Pierre Morel
IBM Lab Boeblingen

