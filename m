Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABE06E4370
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 11:17:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poKy5-0000Jb-HV; Mon, 17 Apr 2023 05:16:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1poKy3-0000Ha-3o; Mon, 17 Apr 2023 05:16:11 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1poKxy-0001io-Cp; Mon, 17 Apr 2023 05:16:10 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33H8Qnlc000900; Mon, 17 Apr 2023 09:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=QUu+yLi2NHUlhSB9ekSyiX496Y8nT5kAYiwMVSvtRdI=;
 b=dBK8L9XHzMe4gcTY0BPcfxy5Eyxluqhju73ZLENYweFkZUOfRvhxEeSJp15GTI/5e1IZ
 GnwpPEz446xp/ZArle2c0ZCcTMDDRKNmPLRXkcdg6LG5c973SRQT6ga86yVv/edwunFL
 Fwur6PJ8VBq1QcNXetEDNQX5e0iu7ejioAs4l0m6bLFKv5AfjJEZtyK9Hqes6cI/UbZ+
 muWrGpuVFcRysN0wrK+RaePHzZnheBbhjHF/PS752tjeDchy7WXZoQrksrwtmsB20CnG
 HG/ZosgmQV/UY3tnYSnXjq5Wv/Pea/1j6sl4u6wr+8Sc+UXc26+WijSEdBv3e3hJrnxB kg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q12m1933r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 09:15:51 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33H9ClZQ009466;
 Mon, 17 Apr 2023 09:15:51 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q12m1932t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 09:15:51 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33H0Ztol002435;
 Mon, 17 Apr 2023 09:15:48 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3pykj696kn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 09:15:48 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33H9FiYb61145452
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Apr 2023 09:15:44 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D9B22004B;
 Mon, 17 Apr 2023 09:15:44 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB89D20040;
 Mon, 17 Apr 2023 09:15:41 +0000 (GMT)
Received: from [9.171.91.35] (unknown [9.171.91.35])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Mon, 17 Apr 2023 09:15:41 +0000 (GMT)
Message-ID: <8e4e84fc-2602-87da-99fc-3ee148d253a9@linux.ibm.com>
Date: Mon, 17 Apr 2023 11:15:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v19 01/21] s390x/cpu topology: add s390 specifics to CPU
 topology
To: Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com
References: <20230403162905.17703-1-pmorel@linux.ibm.com>
 <20230403162905.17703-2-pmorel@linux.ibm.com>
 <4118bb4e-0505-26d3-3ffe-49245eae5364@kaod.org>
 <bd5cc488-20a7-54d1-7c3e-86136db77f84@linux.ibm.com>
 <55c4e517-dbd0-bbd2-7dde-0e2cab746101@kaod.org>
 <a46e9349-704c-e842-58c0-515ecb7b2d60@linux.ibm.com>
 <1bc361f6675ea9d8332131725cb5d778aa32e8bd.camel@linux.ibm.com>
Content-Language: en-US
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <1bc361f6675ea9d8332131725cb5d778aa32e8bd.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BC-QOqjFtd4hHVYtvtw576Rz57EwzKwh
X-Proofpoint-GUID: NdGT_PO7idoov8ccCKV6OTr1bHf7Y7yl
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_04,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=728
 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304170073
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.976, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


On 4/11/23 14:27, Nina Schoetterl-Glausch wrote:
> On Tue, 2023-04-04 at 16:04 +0200, Pierre Morel wrote:
>> On 4/4/23 14:35, Cédric Le Goater wrote:
>>>>>> @@ -0,0 +1,15 @@
>>>>>> +/*
>>>>>> + * CPU Topology
>>>>>> + *
>>>>>> + * Copyright IBM Corp. 2022
>>>>> Shouldn't we have some range : 2022-2023 ?
>>>> There was a discussion on this in the first spins, I think to
>>>> remember that Nina wanted 22 and Thomas 23,
>>>>
>>>> now we have a third opinion :) .
>>>>
>>>> I must say that all three have their reasons and I take what the
>>>> majority wants.
>>> There is an internal IBM document describing the copyright tags. If I
>>> recall
>>> well, first date is the first year the code was officially published,
>>> second
>>> year is the last year it was modified (so last commit of the year). Or
>>> something like that and it's theory, because we tend to forget.
>>>
>>> For an example, see the OPAL FW https://github.com/open-power/skiboot/,
>>> and run :
>>>
>>>    "grep Copyright.*IBM" in the OPAL FW
>>
>> OK for me, it looks logical, and all three of you are right then.
>>
>> So I will use
>>
>> Copyright IBM Corp. 2022-2023
> You should use a comma instead of a hyphen as per IBM policy.
> I.e. 2022, 2023


OK, thanks.

Regards,

Pierre




