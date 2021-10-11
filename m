Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA5F428908
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 10:43:19 +0200 (CEST)
Received: from localhost ([::1]:56338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZqtx-0007Sk-Pk
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 04:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mZqrg-00061R-96; Mon, 11 Oct 2021 04:40:56 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mZqre-0000TH-3p; Mon, 11 Oct 2021 04:40:55 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19B8aKZF011095; 
 Mon, 11 Oct 2021 04:40:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=+XHq9LSE5cOnYB5iYi6cmrZelT+ZE5ms3RmBLTqa1d8=;
 b=TDXrQ8t5rPtheAJKFWeZFlu+QP8z9d9n6cq+wf1e3aMpAyw2ZEQg8vLBK/CdRXvCzVx+
 X6cKOXWaEmRiKhlv8cdIDBNnjAp1dGIRTG+Yj8PYQoDnIQfOT3iZyYC7qZcbbCNha6+D
 EAejoixN5B5dOeMW6/lGI+JOZesPGz5qeJkeKV07b9Bhd58tFuAs8KdFb3H3ht/Hejn8
 6qn3YLyEXMz+lmfuk3g86spyGFpm3DBFrrl+RXZIYC/UDBLDq1gmMLVtHnfrFPheveAt
 VTeSe4SbsZrS/0Xm9hs4kayXYS4j1fSoGH3pexDz2L7BD8+Yl5DMWBuIDjtP2zvAP56N ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bmh3vs7gb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 04:40:48 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19B8bFlX013104;
 Mon, 11 Oct 2021 04:40:48 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bmh3vs7f5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 04:40:47 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19B8VlHq028157;
 Mon, 11 Oct 2021 08:40:46 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3bk2bhuub1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 08:40:45 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19B8edrp61604318
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 08:40:39 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1AAC14C058;
 Mon, 11 Oct 2021 08:40:39 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35B604C044;
 Mon, 11 Oct 2021 08:40:36 +0000 (GMT)
Received: from li-43c5434c-23b8-11b2-a85c-c4958fb47a68.ibm.com (unknown
 [9.171.26.102])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 11 Oct 2021 08:40:35 +0000 (GMT)
Subject: Re: [RFC PATCH v1 2/2] s390x/kvm: Pass SIGP Stop flags
To: David Hildenbrand <david@redhat.com>, Eric Farman <farman@linux.ibm.com>, 
 Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20211008203811.1980478-1-farman@linux.ibm.com>
 <20211008203811.1980478-3-farman@linux.ibm.com>
 <0addcdbc-50cb-420d-5864-af3a8a894321@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <28832611-02f0-7e52-6f15-39427c96d8bf@de.ibm.com>
Date: Mon, 11 Oct 2021 10:40:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <0addcdbc-50cb-420d-5864-af3a8a894321@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eP4LmK6OMsF4fn6Zk3-LQK1FIx2fQufC
X-Proofpoint-ORIG-GUID: TCg4526pIf6AzGSyGAHWtKzek64D5b15
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-11_02,2021-10-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=938
 phishscore=0 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1011
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110110049
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Janosch Frank <frankja@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 11.10.21 um 09:09 schrieb David Hildenbrand:
> On 08.10.21 22:38, Eric Farman wrote:
>> When building a Stop IRQ to pass to KVM, we should incorporate
>> the flags if handling the SIGP Stop and Store Status order.
>> With that, KVM can reject other orders that are submitted for
>> the same CPU while the operation is fully processed.
>>
>> Signed-off-by: Eric Farman <farman@linux.ibm.com>
>> Acked-by: Janosch Frank <frankja@linux.ibm.com>
>> ---
>>   target/s390x/kvm/kvm.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
>> index 5b1fdb55c4..701b9ddc88 100644
>> --- a/target/s390x/kvm/kvm.c
>> +++ b/target/s390x/kvm/kvm.c
>> @@ -2555,6 +2555,10 @@ void kvm_s390_stop_interrupt(S390CPU *cpu)
>>           .type = KVM_S390_SIGP_STOP,
>>       };
>> +    if (cpu->env.sigp_order == SIGP_STOP_STORE_STATUS) {
>> +        irq.u.stop.flags = KVM_S390_STOP_FLAG_STORE_STATUS;
>> +    }
>> +
> 
> KVM_S390_STOP_FLAG_STORE_STATUS tells KVM to perform the store status as well ... is that really what we want?
At least it should not hurt I guess. QEMU then does it again?
> 
> Maybe we want a different (more generic) way to tell KVM that a CPU is temporarily busy for SIGP orders?
> 

