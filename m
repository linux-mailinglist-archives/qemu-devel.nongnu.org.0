Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B614C6A7D2D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 10:00:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXemT-0005Ye-Ai; Thu, 02 Mar 2023 03:59:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pXemQ-0005Y4-G1; Thu, 02 Mar 2023 03:59:14 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pXemO-0007pN-Jt; Thu, 02 Mar 2023 03:59:14 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3228CRYF011072; Thu, 2 Mar 2023 08:59:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=lahuxmXh6dxq2pXnqhg0/5Llftik42tGWeihza+UE0k=;
 b=pJ/MS0Id+xPhNVqEZVrVjsRFLRTpZJN2zrIzTuRjLtUgRyS4pHCXn7OXyS8cuGxa5w/X
 p9nANP/owSZdusB3fXrC0eVEfGArCDZ3KVdMOg9D5vEg/TloFbKuOZTdWYf58PpyXqKB
 br3R3P0Gx46crf2dnFRNVpAPGki23rdcmw6PDiBzB7sfcCk8H3VXh/slaTDibnYM/ku/
 XJ/d4v8EOy8y4TTB5gOu845tWS5O5qcXx40cn09Yt3/SnH7Wv+pX1A4AonV5Y4sEUhQX
 myRUbb8IWRzQdOMZiZHhO9/x8jAsD/z4wW/ldI1/x6CWzOzFpgRKS6CLZlaKuDfFxjWi 3Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p2r39s8cx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 08:59:02 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3228GhKE029424;
 Thu, 2 Mar 2023 08:59:01 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p2r39s8c1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 08:59:01 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3222N4UO028795;
 Thu, 2 Mar 2023 08:58:59 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3nybe2m236-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 08:58:59 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3228wt6858851646
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Mar 2023 08:58:56 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF91F20043;
 Thu,  2 Mar 2023 08:58:55 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4055820040;
 Thu,  2 Mar 2023 08:58:54 +0000 (GMT)
Received: from [9.171.4.190] (unknown [9.171.4.190])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Thu,  2 Mar 2023 08:58:54 +0000 (GMT)
Message-ID: <c3c9f46a-a792-c3ba-eb0b-a67a2c14962d@linux.ibm.com>
Date: Thu, 2 Mar 2023 09:58:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v16 11/11] docs/s390x/cpu topology: document s390x cpu
 topology
To: Nina Schoetterl-Glausch <nsg@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230222142105.84700-1-pmorel@linux.ibm.com>
 <20230222142105.84700-12-pmorel@linux.ibm.com>
 <ae00f540a0842d4a13b851ed0298812710dd8133.camel@linux.ibm.com>
Content-Language: en-US
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <ae00f540a0842d4a13b851ed0298812710dd8133.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BUCC3b8k8opo6lJpIVwsZ_iipl8NzsRr
X-Proofpoint-GUID: 8QHgu92tx4SY-GCIgwrpU92_eTQWkgUe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_04,2023-03-02_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303020073
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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


On 3/1/23 16:52, Nina Schoetterl-Glausch wrote:
> On Wed, 2023-02-22 at 15:21 +0100, Pierre Morel wrote:
>> Add some basic examples for the definition of cpu topology
>> in s390x.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   docs/system/s390x/cpu-topology.rst | 378 +++++++++++++++++++++++++++++
>>   docs/system/target-s390x.rst       |   1 +
>>   2 files changed, 379 insertions(+)
>>   create mode 100644 docs/system/s390x/cpu-topology.rst
>>
>> diff --git a/docs/system/s390x/cpu-topology.rst b/docs/system/s390x/cpu-topology.rst
>> new file mode 100644
>> index 0000000000..d470e28b97
>> --- /dev/null
>> +++ b/docs/system/s390x/cpu-topology.rst
>> @@ -0,0 +1,378 @@
>>
> [...]
>> +
>> +set-cpu-topology
>> +++++++++++++++++
>> +
>> +The command set-cpu-topology allows the admin to modify the topology
>> +tree or the topology modifiers of a vCPU in the configuration.
>> +
>> +.. code-block:: QMP
>> +
>> + -> { "execute": "set-cpu-topology",
>> +      "arguments": {
>> +         "core-id": 11,
>> +         "socket-id": 0,
>> +         "book-id": 0,
>> +         "drawer-id": 0,
>> +         "entitlement": low,
>> +         "dedicated": false
>> +      }
>> +    }
>> + <- {"return": {}}
> This fails when building the documenation.
> You need to get rid of the arrows and need "" around the low.
>
>
> [...]


right, thanks


Pierre


