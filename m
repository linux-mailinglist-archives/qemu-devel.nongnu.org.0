Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BC62FF2DA
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 19:08:38 +0100 (CET)
Received: from localhost ([::1]:39676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2eNo-000775-5r
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 13:08:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1l2eLw-000669-PU; Thu, 21 Jan 2021 13:06:41 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:63908
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1l2eLp-00040p-S4; Thu, 21 Jan 2021 13:06:40 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10LI0mjP179205; Thu, 21 Jan 2021 13:06:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=j8H3srakPzT6JC8PWa2jvKDU34B4oouoFv8h1bhQ+1g=;
 b=C1zzEhkEZvKQU4E72veCMbDSMx0CXLcupigPIeM9Eu4nCjLMsg4i37RHgXQKgJePQiih
 I1w+07ZC/MCQ8PLFq5vGiEhPOllKZp9DjkeLSij09G0T1dAfFk2zMKP0uQTaUd/xkB3d
 VdK0jHfKIcIhD2BrTdLy1EGghXf4gf5UyrfZaEqyhCcU21+TGbWJvgVgVRADDISQEDYW
 TgLwjihye2aHtw8gsKYK3fAtT+122FfNhhzX08E6zKYg4SXjoASsYDN8nlkaeSGS9SWu
 eE1xXnREt6Zger1st9S0JbREr+D8H1lcFJUISQxuNNlk1iouKTQoy7QoYfxkC5JKbSc9 Ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 367eg88bxd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 13:06:29 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10LI1S7a181760;
 Thu, 21 Jan 2021 13:06:28 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 367eg88bx0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 13:06:28 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10LI6OQl026165;
 Thu, 21 Jan 2021 18:06:28 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03dal.us.ibm.com with ESMTP id 3668pshf0j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 18:06:28 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10LI6R1w13173016
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jan 2021 18:06:27 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4AF88112061;
 Thu, 21 Jan 2021 18:06:27 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43849112065;
 Thu, 21 Jan 2021 18:06:25 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.211.56.144])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 21 Jan 2021 18:06:25 +0000 (GMT)
Subject: Re: [PATCH 0/8] s390x/pci: Fixing s390 vfio-pci ISM support
To: Cornelia Huck <cohuck@redhat.com>, Niklas Schnelle <schnelle@linux.ibm.com>
References: <1611089059-6468-1-git-send-email-mjrosato@linux.ibm.com>
 <511aebd3-fc4f-d7d3-32c2-27720fb38fe8@linux.ibm.com>
 <15dbd981-7dda-2526-8f13-52ead6298ef1@linux.ibm.com>
 <a1d1df76-07df-9879-ae77-ff677efdd291@linux.ibm.com>
 <f3e074d2-4f47-d229-9002-010e91df95d1@linux.ibm.com>
 <914d4af3-32ee-e300-9738-92aececa81d6@linux.ibm.com>
 <789388f4-983b-2810-7f46-ce7f07022a66@linux.ibm.com>
 <ff5674ed-8ce2-73d7-1991-de424d62288c@linux.ibm.com>
 <bd94ca8a-70b2-36b3-d357-3527e8d3dc62@linux.ibm.com>
 <213c00ca-1b8f-ecee-dd22-d86cad8eb63b@linux.ibm.com>
 <4a3e13fe-ec6a-27bc-7f30-9ad9691a4522@linux.ibm.com>
 <a458fa0e-2c4a-551f-2f54-3dcedc4bbade@linux.ibm.com>
 <9522792d-6677-eed4-f480-4efaaf00dd51@linux.ibm.com>
 <20210121185036.41fde30c.cohuck@redhat.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
Message-ID: <60a2efe8-ff3d-6ea5-230c-408995eaf016@linux.ibm.com>
Date: Thu, 21 Jan 2021 13:06:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121185036.41fde30c.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-21_09:2021-01-21,
 2021-01-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 adultscore=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101210091
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, Pierre Morel <pmorel@linux.ibm.com>, david@redhat.com,
 mst@redhat.com, richard.henderson@linaro.org, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 alex.williamson@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 12:50 PM, Cornelia Huck wrote:
> On Thu, 21 Jan 2021 15:54:22 +0100
> Niklas Schnelle <schnelle@linux.ibm.com> wrote:
> 
>> On 1/21/21 3:46 PM, Pierre Morel wrote:
>>>
>>>
>>> On 1/21/21 2:37 PM, Niklas Schnelle wrote:
>>>>
>>>>
>>>> On 1/21/21 1:30 PM, Pierre Morel wrote:
>>>    
>>>>>>
>>>>>> Just wanted to say that we've had a very similar discussion with
>>>>>> Cornelia end of last year and came to the conclusion that explicitly
>>>>>> matching the PFT is likely the safest bet:
>>>>>> https://lkml.org/lkml/2020/12/22/479
>>>>>
>>>>> What I see there is a discussion on the relation between relaxed access and MIO without explaining to Connie that we have in the kernel the possibility to know if a device support MIO or not independently of it supports the relaxed access.
>>>>>
>>>>> The all point here is about taking decisions for the right reasons.
>>>>>
>>>>> We have the possibility to take the decision based on functionalities and not on a specific PCI function.
>>>>
>>>> Yes but that goes both ways the functionality of the region has to match
>>>> that of the device and at least in it's current state the regions functionality
>>>> matches only ISM in a way that is so specific that it is very unlikely to match anything
>>>> else. For example it can't support a PCI device that requires non-MIO but
>>>> also MSI-X. In its current form it doesn't even support PCI Store only PCI Store
>>>> Block, we had that in an earlier version and it's trivial but then we get the MSI-X
>>>> problem.
>>>
>>>
>>> What does that change if we take one or the other solution considering the checking of MIO/MSIX/relax versus PFT?
>>
>>
>> If it's !MIO && !MSIX && relax_align I'm fine with that check but
>> then we should also add PCISTG to the region.
>>
> 
> Just to double check: that would today cover only ISM (which doesn't
> use PCISTG), correct?
> 

Yes, correct -- So to summarize the proposal outlined is to use those 
features to determine whether a device should be using the region or not 
rather rather than strictly saying only PFT==ISM may use it.

Practically speaking, ISM is the only device that fits the bill today 
when you combine these things, and ISM does not use PCISTG -- so PCISTG 
support was simply omitted from the region (prior versions before coming 
upstream included it, was dropped since ISM doesn't use it).

What Niklas suggests here is that, if we are going to be broad in 
determining whether the region can be used for a given device vs saying 
'only PFT==ISM', then we can no longer assume that the device doesn't 
use PCISTG and as such is suggesting the region should also include 
PCISTG support as a means of future compatibility (to ensure non-MIO 
PCISTG is issued for the device).

> /me getting a bit lost in this discussion :)
> 

