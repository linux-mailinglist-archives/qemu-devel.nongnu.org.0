Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA845649B1E
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 10:27:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4f19-0000wc-Kv; Mon, 12 Dec 2022 04:22:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1p4f0X-0000lS-FJ; Mon, 12 Dec 2022 04:22:01 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1p4f0V-00076y-7x; Mon, 12 Dec 2022 04:21:56 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BC8WMCh004159; Mon, 12 Dec 2022 09:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=KF+C8nMnuOW1TMXIjYmXBmjAGH0JPVpSx5Y8SF/XesQ=;
 b=Dt8dSUhkZOl9fmbKxmfnePU9L1vUM46Eg6cMCBc3txOfroRv4E4ooE+cwcyRIU34EJfg
 KhLI4cX3cPoBRflVo4l9bUAhMhDbIoHEpwu5MQwfm4i/6JRYhozcsUZYJo/3tvc6istK
 w9qkVcBtwj3/6yZWPhbu3bfa9W1Lo9/uNJ3b1IYcywJkz8PU8KOiWUfPlZw6oIlTO9+s
 ik0C7GU1PwZ887lIn5xqaUUcVD7Zqmv7wZvP74svJcunWODqDrTTPjCddvjPqN9HXwvB
 yfkGSAtQu16Nq1CCz6Y3L8ePi3avBuQjGOyWKWGJ+pWZSkCXBsAAo80DNY6AnWJWvONF yg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3md40kktpj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 09:21:45 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BC99Hak006474;
 Mon, 12 Dec 2022 09:21:44 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3md40kktne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 09:21:44 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BC6Licg026302;
 Mon, 12 Dec 2022 09:21:42 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3mchr61qfg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 09:21:41 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BC9LceW24576508
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 09:21:38 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 193E520040;
 Mon, 12 Dec 2022 09:21:38 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF66620043;
 Mon, 12 Dec 2022 09:21:36 +0000 (GMT)
Received: from [9.171.10.222] (unknown [9.171.10.222])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 12 Dec 2022 09:21:36 +0000 (GMT)
Message-ID: <ba68a18a-8a72-3c37-8a7b-59c8a1b82f6a@linux.ibm.com>
Date: Mon, 12 Dec 2022 10:21:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v13 2/7] s390x/cpu topology: reporting the CPU topology to
 the guest
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, scgl@linux.ibm.com, frankja@linux.ibm.com,
 berrange@redhat.com
References: <20221208094432.9732-1-pmorel@linux.ibm.com>
 <20221208094432.9732-3-pmorel@linux.ibm.com>
 <d952f626-52bf-324b-c925-f118cd75c55e@kaod.org>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <d952f626-52bf-324b-c925-f118cd75c55e@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: j7tkayZkv3uOmFzYn43iK9AHTeajO6ik
X-Proofpoint-ORIG-GUID: _4byn6QCCvW8UGCklL-J8Ko4DkPrUUqZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0 spamscore=0
 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120084
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



On 12/9/22 16:43, Cédric Le Goater wrote:
> On 12/8/22 10:44, Pierre Morel wrote:
>> The guest uses the STSI instruction to get information on the
>> CPU topology.
>>
>> Let us implement the STSI instruction for the basis CPU topology
>> level, level 2.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---

...

>> +#define S390_TOPOLOGY_MAX_MNEST 2
>> +
>> +void insert_stsi_15_1_x(S390CPU *cpu, int sel2, __u64 addr, uint8_t ar)
>> +{
>> +    union {
>> +        char place_holder[S390_TOPOLOGY_SYSIB_SIZE];
>> +        SysIB_151x sysib;
>> +    } buffer QEMU_ALIGNED(8);
>> +    int len;
>> +
>> +    if (s390_is_pv() || !s390_has_topology() ||
> 
> Isn't the test s390_is_pv() redundant since patch 6 deactivates
> S390_FEAT_CONFIGURATION_TOPOLOGY for PV guests ?

Yes you are right it is.
I remove it.

Regards,
Pierre



-- 
Pierre Morel
IBM Lab Boeblingen

