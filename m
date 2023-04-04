Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE03A6D6050
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 14:27:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjfkB-0006T3-1v; Tue, 04 Apr 2023 08:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pjfk9-0006SW-KV; Tue, 04 Apr 2023 08:26:33 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pjfk7-00006s-Oj; Tue, 04 Apr 2023 08:26:33 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 334CGYpo011097; Tue, 4 Apr 2023 12:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=w8FOvm+83Igx7pHPqGdzocDjhEgkYk3tl+QLztFt0g4=;
 b=hyk3Pa6Uj1uwHq3ctAkkAK0tjcfG7S9lSXFQyYDyczCElfOAdGBWFep9MAXWhI/B3OS7
 S83viTqwBqPZ7pvh9YKGuTjUzY2M+zMdipXQsgofRQ/l2pDLredRnV6aw7Wyxo3scQgM
 xAe8QIzmZHYkvX5trp9YjphKnGsCOiY0nnxHvImsp4TAYrUA6rQQXfnwAd6lBhYBdsID
 o4JNH6k+t5wCXjsYXvFsWinBlNLht91oZvRhSliPbdroPS8sipKF37SlBiPedpmBwzjL
 tfRP2HPOdpshtHXAUYlPj8wtzE5EQBHEjJrWJDuXt+QZZbxwCteph1aXA4T5rPHBf/VM sw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pr3gs6yrg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Apr 2023 12:26:28 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 334CNHoX003762;
 Tue, 4 Apr 2023 12:26:28 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pr3gs6yqj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Apr 2023 12:26:27 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 333Mejkq004036;
 Tue, 4 Apr 2023 12:26:26 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3ppbvg2gp0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Apr 2023 12:26:25 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 334CQMq546924240
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Apr 2023 12:26:22 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E61020043;
 Tue,  4 Apr 2023 12:26:22 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB98B20040;
 Tue,  4 Apr 2023 12:26:20 +0000 (GMT)
Received: from [9.152.222.242] (unknown [9.152.222.242])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Tue,  4 Apr 2023 12:26:20 +0000 (GMT)
Message-ID: <39da5f48-07ed-1097-8686-238e2899993a@linux.ibm.com>
Date: Tue, 4 Apr 2023 14:26:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v19 15/21] tests/avocado: s390x cpu topology polarisation
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, nsg@linux.ibm.com, frankja@linux.ibm.com,
 berrange@redhat.com
References: <20230403162905.17703-1-pmorel@linux.ibm.com>
 <20230403162905.17703-16-pmorel@linux.ibm.com>
 <0a5daba1-16df-cd01-f0fb-c6b9cccb04d3@kaod.org>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <0a5daba1-16df-cd01-f0fb-c6b9cccb04d3@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: z8F-ABKVk1mbGWmps9WKzcrus4fMVPO5
X-Proofpoint-ORIG-GUID: a1yBU80b-_A6lfuXRrYdznGpZKQNkplw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-04_04,2023-04-04_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304040112
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.925,
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


On 4/4/23 11:22, Cédric Le Goater wrote:
> On 4/3/23 18:28, Pierre Morel wrote:
>> Polarization is changed on a request from the guest.
>> Let's verify the polarization is accordingly set by QEMU.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   tests/avocado/s390_topology.py | 38 +++++++++++++++++++++++++++++++++-
>>   1 file changed, 37 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/avocado/s390_topology.py 
>> b/tests/avocado/s390_topology.py
>> index 38e9cc4f16..a4bbbc2cb6 100644
>> --- a/tests/avocado/s390_topology.py
>> +++ b/tests/avocado/s390_topology.py
>> @@ -107,6 +107,15 @@ def kernel_init(self):
>>                            '-initrd', initrd_path,
>>                            '-append', kernel_command_line)
>>   +    def system_init(self):
>> +        self.log.info("System init")
>> +        exec_command(self, 'mount proc -t proc /proc')
>> +        time.sleep(0.2)
>> +        exec_command(self, 'mount sys -t sysfs /sys')
>> +        time.sleep(0.2)
>> +        exec_command_and_wait_for_pattern(self,
>> +                '/bin/cat /sys/devices/system/cpu/dispatching', '0')
>> +
>>       def test_single(self):
>>           self.kernel_init()
>>           self.vm.launch()
>> @@ -116,7 +125,6 @@ def test_single(self):
>>       def test_default(self):
>>           """
>>           This test checks the implicite topology.
>> -
>
> unwanted change I guess ?


oh right

thanks

Pierre




