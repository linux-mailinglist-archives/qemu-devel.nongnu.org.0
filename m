Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A304E6A440B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:16:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeGf-00063L-5J; Mon, 27 Feb 2023 09:14:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pWeGb-0005ys-4w; Mon, 27 Feb 2023 09:14:13 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pWeGZ-0001bu-JF; Mon, 27 Feb 2023 09:14:12 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31RDBn0t027845; Mon, 27 Feb 2023 14:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=A0eoKE6J3qEYP7UYfilg0FoI800/L+uAJOG7QUUhClk=;
 b=GVTTm6rom/kDv9eXL09y73qLcVluyg3nmINprun0Fhhg8ueezpBuQNBkdy4bC9ZVmv1m
 yjhjp/SAXkdjztYIqE5nVsRDFivxAiud3k+LaZxOjp0Dg9riit7QfvV7UJkcIn/e2u6p
 chwuou5De87ILFgJL9Qb5PyMmGdT8az4JCIG77GKygGzyI0gyzRaNr0Jh4ThRVXUpUsP
 rkjL7/xzEINLyea1puuTll9YozHg3dkbulevpmycMA3GPODMNOu8kOkc/MfMrqnKax5B
 cVZH4x3NluYcRU3FKfiB2ybu6j8WMVERVgZy8VRTtBXGPpvL/71L3kqnF50PUhzqfhRk /A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p0sg47ux5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Feb 2023 14:14:02 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31REAhUB004888;
 Mon, 27 Feb 2023 14:14:02 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p0sg47uvw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Feb 2023 14:14:02 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31R0Rdfx022793;
 Mon, 27 Feb 2023 14:13:59 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3nybab1g0y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Feb 2023 14:13:59 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31REDtPS30081444
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Feb 2023 14:13:55 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97E6B2004B;
 Mon, 27 Feb 2023 14:13:55 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C7E120043;
 Mon, 27 Feb 2023 14:13:54 +0000 (GMT)
Received: from [9.171.14.212] (unknown [9.171.14.212])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Mon, 27 Feb 2023 14:13:54 +0000 (GMT)
Message-ID: <9907f93a-c22e-164d-2024-068f24c22944@linux.ibm.com>
Date: Mon, 27 Feb 2023 15:13:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v16 09/11] machine: adding s390 topology to query-cpu-fast
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 nsg@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230222142105.84700-1-pmorel@linux.ibm.com>
 <20230222142105.84700-10-pmorel@linux.ibm.com>
 <6db3c0bd-ce65-1d23-ca6c-ee4a6fb60dbf@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <6db3c0bd-ce65-1d23-ca6c-ee4a6fb60dbf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: k-Uq-8FYx6ISuGzKvHsM7R7k78zg_PdJ
X-Proofpoint-GUID: FgdJejd2A7vo2yb0ytJSyx8yLw08_D0i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_10,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302270109
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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


On 2/27/23 14:27, Thomas Huth wrote:
> On 22/02/2023 15.21, Pierre Morel wrote:
>> S390x provides two more topology attributes, entitlement and dedication.
>>
>> Let's add these CPU attributes to the QAPI command query-cpu-fast.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> Reviewed-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
>> ---
>>   qapi/machine.json          | 9 ++++++++-
>>   hw/core/machine-qmp-cmds.c | 2 ++
>>   2 files changed, 10 insertions(+), 1 deletion(-)
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
>
>
Thanks.

Regards,

Pierre


