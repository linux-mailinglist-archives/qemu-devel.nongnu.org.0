Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC103CB6B1
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 13:24:40 +0200 (CEST)
Received: from localhost ([::1]:55082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4LxP-0007fd-Nt
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 07:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m4LwP-0006uv-JA; Fri, 16 Jul 2021 07:23:37 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:10312
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m4LwN-0005F5-Jh; Fri, 16 Jul 2021 07:23:37 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16GBBaVx162586; Fri, 16 Jul 2021 07:23:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=BsQ+5fBrtJdRTc/WEBJYwrJyyk3GSrPSGzYEQvQ0wdo=;
 b=JR613yW+BPZVcWzlrfdLFhtvUyE+5L1kRk1KWEg9XwAW0otSsOWyNEjFor+8lVqUeU1d
 N++wgE/vQwRV8oJkxFY1xrs8DhcfWsdrIUYA070XJEaqgXzCR/flLadFodCSZehDb9jb
 pmoA3d9j3OXIDQp9Rbk+HAsnpWNbOWWr7bSxjmRwi4jx2YdVFP6zMwMhqcxMBZZjh97I
 2Ro4DtK6CnDdFPHue90I2OTuZrHfzEQCc70gz/+IxoCPFE+NIaEAL4uR3iPUmq64STpN
 dXrykI0DBkAlJaiKhDE/EStXymFKRxqtS1cEdbRLwPUDAcpfvxsrdtX2m6K6koex71Wq lQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39twnt164u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 07:23:34 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16GB4atb136588;
 Fri, 16 Jul 2021 07:23:33 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39twnt164d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 07:23:33 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16GBIhiZ022553;
 Fri, 16 Jul 2021 11:23:31 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 39s3p78v2j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 11:23:31 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16GBNSx630015890
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Jul 2021 11:23:28 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 534EB4C072;
 Fri, 16 Jul 2021 11:23:28 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA2754C063;
 Fri, 16 Jul 2021 11:23:27 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.164.173])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 16 Jul 2021 11:23:27 +0000 (GMT)
Subject: Re: [PATCH v1 6/9] s390x: kvm: topology: interception of PTF
 instruction
To: Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org
References: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
 <1626281596-31061-7-git-send-email-pmorel@linux.ibm.com>
 <87v95aboky.fsf@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <4eee89ff-1407-9f82-a7e4-f8a1093994b5@linux.ibm.com>
Date: Fri, 16 Jul 2021 13:23:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87v95aboky.fsf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: s03P7efSpLJ3gIi6jpvP6-Zwc7MvzKi3
X-Proofpoint-ORIG-GUID: XxqHq0X_B7ha16ETeSb6lh9NmqtiJTWW
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-16_04:2021-07-16,
 2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 adultscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107160067
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



On 7/16/21 11:22 AM, Cornelia Huck wrote:
> On Wed, Jul 14 2021, Pierre Morel <pmorel@linux.ibm.com> wrote:
> 
>> Interception of the PTF instruction depending on the new
>> KVM_CAP_S390_CPU_TOPOLOGY KVM extension.
> 
> Wasn't that the capability that you dropped?

yes,

> 
> Is PTF supposed to be always intercepting? If that isn't configurable,
> wouldn't older QEMUs generate exceptions for it? I'm a bit confused.

Yes, PTF generated an OPERATION exception on old QEMU, but was not used 
by the guest if it has not the topology facility 11.

So just as for STSI, I think we need the KVM_CAP_S390_CPU_TOPOLOGY I 
dropped because otherwise, now that the kernel will advertise facility 
11, the guest will use it and it will get the exception that it should 
not get.

Regards,
Pierre

> 
>>
>> A global value is used to remember if a Topology change occured since
>> the last interception of a PTF instruction with function code 0.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   hw/s390x/cpu-topology.c            | 19 +++++++++++
>>   include/hw/s390x/cpu-topology.h    |  8 +++++
>>   include/hw/s390x/s390-virtio-ccw.h |  1 +
>>   target/s390x/cpu.c                 |  4 +++
>>   target/s390x/cpu.h                 |  1 +
>>   target/s390x/kvm/kvm.c             | 52 ++++++++++++++++++++++++++++++
>>   6 files changed, 85 insertions(+)
> 

-- 
Pierre Morel
IBM Lab Boeblingen

