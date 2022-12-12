Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4238C649A67
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 09:52:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4eXQ-0000s7-Ei; Mon, 12 Dec 2022 03:51:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1p4eX0-0000pD-Uc; Mon, 12 Dec 2022 03:51:28 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1p4eWy-0001kJ-L8; Mon, 12 Dec 2022 03:51:26 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BC8aOKo011976; Mon, 12 Dec 2022 08:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=JBXjQCImaFukSoxP5Ug682SQ3wmFJA9c+KzwN4XOPhk=;
 b=rEhtIqRxAswPbvp03OmfGyOMt57PvLr9Ro7qcB7etVXDIVQEyvMPjQF7zIv2Gsuw702P
 RxJ2ZIJFx1fOu38RAmFo5k/ulroQufP9TRCOmR0tJDFjUN9SU9og3ghyg2OtZstEOpDX
 d2Y6TjEtRkyNtkzn8Hc3U9rhtHG7NTh6Br4Z08D+GiJZHAm6kWgjZ59MUaqvGIYjtKyp
 QbfjmZ6ZjQ1pkg8PBAGKHU/wR4RlbFwoaoFa3qYPG3PREeNLgpSrBSRMPlOzbRSJB3c+
 G6fYbgtohzdXGYt7fqffAktELcv9Y18a4+saH67MmL9bXEir29VNCyFZ/BwN0hjYv/A4 Yw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3md3vcbkx5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 08:51:13 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BC8cAXs018684;
 Mon, 12 Dec 2022 08:51:13 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3md3vcbkw6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 08:51:12 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BC6YlKW011845;
 Mon, 12 Dec 2022 08:51:10 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3mchr61pfc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 08:51:10 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BC8p5FJ44630380
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 08:51:06 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 46A6220040;
 Mon, 12 Dec 2022 08:51:05 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABE2F2004B;
 Mon, 12 Dec 2022 08:51:03 +0000 (GMT)
Received: from [9.171.10.222] (unknown [9.171.10.222])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 12 Dec 2022 08:51:03 +0000 (GMT)
Message-ID: <60f006f4-d29e-320a-d656-600b2fd4a11a@linux.ibm.com>
Date: Mon, 12 Dec 2022 09:51:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v13 0/7] s390x: CPU Topology
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 scgl@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com,
 clg@kaod.org
References: <20221208094432.9732-1-pmorel@linux.ibm.com>
 <8c0777d2-7b70-51ce-e64a-6aff5bdea8ae@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <8c0777d2-7b70-51ce-e64a-6aff5bdea8ae@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: m96byv4qYfOJ4DWcQl3AZ1_OUAkeGv3o
X-Proofpoint-ORIG-GUID: wc42q8Uin9VSo9_oh6lwwk9QZXviYmid
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_01,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212120080
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 12/9/22 14:32, Thomas Huth wrote:
> On 08/12/2022 10.44, Pierre Morel wrote:
>> Hi,
>>
>> Implementation discussions
>> ==========================
>>
>> CPU models
>> ----------
>>
>> Since the S390_FEAT_CONFIGURATION_TOPOLOGY is already in the CPU model
>> for old QEMU we could not activate it as usual from KVM but needed
>> a KVM capability: KVM_CAP_S390_CPU_TOPOLOGY.
>> Checking and enabling this capability enables
>> S390_FEAT_CONFIGURATION_TOPOLOGY.
>>
>> Migration
>> ---------
>>
>> Once the S390_FEAT_CONFIGURATION_TOPOLOGY is enabled in the source
>> host the STFL(11) is provided to the guest.
>> Since the feature is already in the CPU model of older QEMU,
>> a migration from a new QEMU enabling the topology to an old QEMU
>> will keep STFL(11) enabled making the guest get an exception for
>> illegal operation as soon as it uses the PTF instruction.
> 
> I now thought that it is not possible to enable "ctop" on older QEMUs 
> since the don't enable the KVM capability? ... or is it still somehow 
> possible? What did I miss?
> 
>   Thomas

Enabling ctop with ctop=on on old QEMU is not possible, this is right.
But, if STFL(11) is enable in the source KVM by a new QEMU, I can see 
that even with -ctop=off the STFL(11) is migrated to the destination.

It is highly possible that I missed something in the cpu model.

A solution proposed by Cedric was to add a new machine but we did not 
want this because we decided that we do not want to wait for a new machine.

Another solution could be to have a we can have a new CPU feature 
overruling ctop like S390_FEAT_CPU_TOPOLOGY in the last series version 12.
I am not sure it must be linked with the creation of a new machine.

The solution here in this series is to add a VMState which will block 
the migration with older QEMU if the topology is activated with ctop on 
a new QEMU.

Regards,
Pierre

> 
> 
>> A VMState keeping track of the S390_FEAT_CONFIGURATION_TOPOLOGY
>> allows to forbid the migration in such a case.
>>
>> Note that the VMState will be used to hold information on the
>> topology once we implement topology change for a running guest.
> 

-- 
Pierre Morel
IBM Lab Boeblingen

