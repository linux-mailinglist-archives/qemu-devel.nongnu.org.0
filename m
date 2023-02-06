Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADEF68BD51
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 13:51:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP0xT-00036A-1Z; Mon, 06 Feb 2023 07:50:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pP0x6-00032j-Gm; Mon, 06 Feb 2023 07:50:35 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pP0x2-0003wd-US; Mon, 06 Feb 2023 07:50:32 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 316Cansh024418; Mon, 6 Feb 2023 12:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=upD3/kX31wc4ZUWUKILtzQmhrsGxhsPrJi3DuQw4VY0=;
 b=BLro4v3c+MUzt8tZRDxc/lm2qeE+cnCdYcSBHE8vx5C2ehLYgMW3/ck+oKnigvkaRxVA
 IXGaIj16b4REKdtGhiIG2ek0l0ERXKDov+DHcIvHTc93gKFl8yLBjPbVFJiLxRL2uxNT
 FjdnRT7RitztlnCdIAe+037FcU+tZSBmfUImvUvIGFjbhBbBLTwn2T/e66Bijrhaqy/U
 f4E6YAGKUgL6ddm9zsSQK6Qx4dDL9wfXFp6RnA9jbZL69AmDFdYMzDMzx1FV8hIlRJxC
 up5R9G1YluREAhkgFCTwb1bdgIeb4k4ckpOErB8x6I7/uPvnLN2kumGzVX0gHetrnDfj UQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nk1gkgp49-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Feb 2023 12:50:17 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 316CljNl029585;
 Mon, 6 Feb 2023 12:50:17 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nk1gkgp2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Feb 2023 12:50:16 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3164i6bm018248;
 Mon, 6 Feb 2023 12:50:13 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3nhf06hpuh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Feb 2023 12:50:13 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 316Co9GG23921048
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Feb 2023 12:50:09 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CAA3620049;
 Mon,  6 Feb 2023 12:50:09 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FE332004B;
 Mon,  6 Feb 2023 12:50:08 +0000 (GMT)
Received: from [9.171.30.242] (unknown [9.171.30.242])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  6 Feb 2023 12:50:08 +0000 (GMT)
Message-ID: <d2d8a7d8-cab2-61e0-b7ff-2e505f226022@linux.ibm.com>
Date: Mon, 6 Feb 2023 13:50:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v15 05/11] s390x/cpu topology: resetting the
 Topology-Change-Report
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 nsg@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230201132051.126868-1-pmorel@linux.ibm.com>
 <20230201132051.126868-6-pmorel@linux.ibm.com>
 <88c4686a-985c-9465-d4dd-6cd5b2faa026@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <88c4686a-985c-9465-d4dd-6cd5b2faa026@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DmDOlqzL2WKkTCRfLabRoHrpYXrgWcVw
X-Proofpoint-GUID: F28BO4Q9XXiVxTx_GYVlTHJ8FSA5Sx6O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_06,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302060102
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148, SPF_HELO_NONE=0.001,
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



On 2/6/23 12:05, Thomas Huth wrote:
> On 01/02/2023 14.20, Pierre Morel wrote:
>> During a subsystem reset the Topology-Change-Report is cleared
>> by the machine.
>> Let's ask KVM to clear the Modified Topology Change Report (MTCR)
>> bit of the SCA in the case of a subsystem reset.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
> ...
>> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
>> index a80a1ebf22..cf63f3dd01 100644
>> --- a/hw/s390x/cpu-topology.c
>> +++ b/hw/s390x/cpu-topology.c
>> @@ -85,6 +85,18 @@ static void s390_topology_init(MachineState *ms)
>>       QTAILQ_INSERT_HEAD(&s390_topology.list, entry, next);
>>   }
>> +/**
>> + * s390_topology_reset:
>> + *
>> + * Generic reset for CPU topology, calls s390_topology_reset()
>> + * s390_topology_reset() to reset the kernel Modified Topology
> 
> Duplicated s390_topology_reset() in the comment.

right, thx.

> 
>> + * change record.
>> + */
>> +void s390_topology_reset(void)
>> +{
>> +    s390_cpu_topology_reset();
>> +}
> 
> With the nit fixed:
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 

Thanks!

Regards,
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

