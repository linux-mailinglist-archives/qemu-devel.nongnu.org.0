Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A779D6756FE
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 15:24:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIsHr-0007s2-Es; Fri, 20 Jan 2023 09:22:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pIsHj-0007ne-7O; Fri, 20 Jan 2023 09:22:29 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pIsHh-0006H6-G9; Fri, 20 Jan 2023 09:22:27 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30KDMGsi004257; Fri, 20 Jan 2023 14:22:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=fbTDpz0/ozxIhvj4DA6UKvzCfCYbFE9WLsOcCeP99u0=;
 b=OfmTJGi5dA8MNL33ul89Ol22dEsFJDgE3m9V3KQviiu23KaiRPUF+y3KQuDY9ZkAXin8
 be7Bauvyd8BfKa6kqy06zGqijB8hH0LJ2PNPdQw/FpzmAfUR5WoHvrPKSZsGfDOiQevD
 zeLDXj6zoiPRYEEa2MVDC2DrKHp9nMKBWhWKIYBbJu0BphxJPEBMSEE6fs7r99YqRNr1
 68R+nlAIkyCMa5SDGVJ84Gr5/F9PJ8zz2bjdRgiC5levMF/5+oTT5xDmhOj4V9co3gQE
 v7EGKyGNiP6v12Vm12q1VmdUWaXgaE8FCYdRenAWxEwCi20eroy4p9uuJJT3527hPdXI sA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7usghe2t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Jan 2023 14:22:19 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30KEBUe3023838;
 Fri, 20 Jan 2023 14:22:19 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7usghe1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Jan 2023 14:22:19 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30KCVaJK009485;
 Fri, 20 Jan 2023 14:22:17 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3n3knfr37u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Jan 2023 14:22:17 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30KEMDjF25428656
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Jan 2023 14:22:13 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F83E20040;
 Fri, 20 Jan 2023 14:22:13 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56E9720043;
 Fri, 20 Jan 2023 14:22:12 +0000 (GMT)
Received: from [9.171.50.198] (unknown [9.171.50.198])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 20 Jan 2023 14:22:12 +0000 (GMT)
Message-ID: <772f43f2-9dc3-befb-9061-effda2e357eb@linux.ibm.com>
Date: Fri, 20 Jan 2023 15:22:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v14 10/11] qapi/s390/cpu topology: POLARITY_CHANGE qapi
 event
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 scgl@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com,
 clg@kaod.org
References: <20230105145313.168489-1-pmorel@linux.ibm.com>
 <20230105145313.168489-11-pmorel@linux.ibm.com>
 <c338245c-82c3-ed57-9c98-f4d630fa1759@redhat.com>
 <5f177a1b-90d6-7e30-5b58-cdcae7919363@linux.ibm.com>
 <648e62ab-9d66-9a5a-0a03-124c16b85805@redhat.com>
Content-Language: en-US
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <648e62ab-9d66-9a5a-0a03-124c16b85805@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QamKRmy4ygtsxSOgYeNiAnPHfRD0siJz
X-Proofpoint-ORIG-GUID: ao9lXoyzQK9iV_tQHhzkFiIHXeijHB40
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-20_08,2023-01-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 impostorscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301200133
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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



On 1/20/23 12:56, Thomas Huth wrote:
> On 18/01/2023 18.09, Pierre Morel wrote:
>>
>> On 1/12/23 12:52, Thomas Huth wrote:
>>> On 05/01/2023 15.53, Pierre Morel wrote:
> ...>>> +#

OK

>>>> +# Emitted when the guest asks to change the polarity.
>>>> +#
>>>> +# @polarity: polarity specified by the guest
>>>
>>> Please elaborate: Where does the value come from (the PTF 
>>> instruction)? Which values are possible?
>>
>> Yes what about:
>>
>> # @polarity: the guest can specify with the PTF instruction a horizontal
>> #            or a vertical polarity.
> 
> Maybe something like: "The guest can tell the host (via the PTF 
> instruction) whether a CPU should have horizontal or vertical polarity." ?

Yes thanks, much better.

> 
>> #         On horizontal polarity the host is expected to provision
>> #            the vCPU equally.
> 
> Maybe: "all vCPUs equally" ?
> Or: "each vCPU equally" ?

yes, thx.


> 
>> #            On vertical polarity the host can provision each vCPU
>> #            differently
>> #            The guest can get information on the provisioning with
>> #            the STSI(15) instruction.
> 
>   Thomas
> 

I make the changes.

Regards,
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

