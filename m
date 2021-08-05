Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6D33E0C0C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 03:22:24 +0200 (CEST)
Received: from localhost ([::1]:49062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBS5X-0001bh-6H
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 21:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1mBS4M-0000rm-AO; Wed, 04 Aug 2021 21:21:10 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:9230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1mBS4K-0006xQ-Il; Wed, 04 Aug 2021 21:21:10 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17514M95139087; Wed, 4 Aug 2021 21:21:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Dajh0+2O9P8UE88SubfK9TeJUWDgfTlWSC/QJeTl1yo=;
 b=T49VKbLfMEvNV4bVHi1Uylm2idDSwnVmiK94J9xnErNVRpqeaCAl8FQr4hmX4W9tIGqZ
 XiEmBaUQVnBiLTc9XHgCvYJRx8zdTP9iPlo2iyR5Z2i5cy57cLIJZWmhoVWVP7GHiLd7
 4hSUSkxy5tIsvcuvJse958C7f/BbkEKbX2UzpariHDLb3fpimj4h6AhR8uPOq9QbeH9I
 ZRBKIFlM6FHFW6zYRGtZKcyMfRM7ovXaFRlv66lxW/DIlSv3mD9MoMmf+GOH8btpecpf
 ZGVIcJsGXlup78eNDD5ZsXmh9OVpOIFt2mXqx4BplzKx1AiFFjJ1PXfABMKbVLE+onZX qA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a83gpbe8g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Aug 2021 21:21:05 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 175153oR145047;
 Wed, 4 Aug 2021 21:21:05 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a83gpbe87-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Aug 2021 21:21:05 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1751CDhm029627;
 Thu, 5 Aug 2021 01:21:04 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03dal.us.ibm.com with ESMTP id 3a7anhjvbk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 01:21:04 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1751L3SO36700600
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Aug 2021 01:21:03 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96B0328058;
 Thu,  5 Aug 2021 01:21:03 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6827028059;
 Thu,  5 Aug 2021 01:21:02 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.211.57.100])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  5 Aug 2021 01:21:02 +0000 (GMT)
Subject: Re: [PATCH v2 0/2] s390x: improve subchannel error handling (vfio)
To: Jared Rossi <jrossi@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>
References: <20210705163952.736020-1-cohuck@redhat.com>
 <e2032c05-ec0b-d653-959f-dcc045da2036@linux.ibm.com>
 <e8426672-bd10-de2d-7dc9-1a46a52f3dea@linux.ibm.com>
 <5ba5fc45-1e61-f774-0340-06961dbfc611@linux.ibm.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
Message-ID: <409ce925-d040-68a6-2d50-f144a1807f2a@linux.ibm.com>
Date: Wed, 4 Aug 2021 21:21:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <5ba5fc45-1e61-f774-0340-06961dbfc611@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5Z-tLJpcR7m6GptQBUyG86hSbY4uvrN1
X-Proofpoint-GUID: uHxxRdwURNxFN6fcfgtnGK7Pl5Ae8Hvx
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-04_08:2021-08-04,
 2021-08-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 mlxscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108050007
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.132, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org, mkawano@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/4/21 8:30 PM, Jared Rossi wrote:
> I've exercised the error paths and it appears to all work correctly.
> 
> On 7/19/21 11:09 AM, Jared Rossi wrote:
>> I will take a look and see if I can exercise the error paths.
>>
>> Regards,
>>
>> Jared Rossi

Thanks Jared!  So, with that I'd suggest a

Tested-by: Jared Rossi <jrossi@linux.ibm.com>

and as I said earlier the code LGTM -- so for the series:

Reviewed-by: Matthew Rosato <mjrosato@linux.ibm.com>

>>
>> On 7/19/21 10:16 AM, Matthew Rosato wrote:
>>> On 7/5/21 12:39 PM, Cornelia Huck wrote:
>>>> This is a followup on the first version (which I had sent out in May,
>>>> and which kind of fell through the cracks.) While the first patch
>>>> is mostly unchanged, I added a second patch to address some possible
>>>> problems with the generated unit exceptions; non-vfio subchannels
>>>> are not affected by this.
>>>>
>>>> As before, this works on the good path, and I have not managed to
>>>> actually get my system to exercise the error path :(
>>>
>>> Sorry for the silence, was out of office for a bit and Eric is 
>>> unavailable -- Anyway the code LGTM and matches what I see in the 
>>> POPs, I'd be willing to ACK but I'd feel better if we could exercise 
>>> the error paths before merging.
>>>
>>> @Jared/@Mike, you've both had eyes on this area of code recently, 
>>> would one of you be willing to take a crack at a tested-by (non-zero 
>>> CCs on HSCH/CSCH + also drive the sch_gen_unit_exception path)?
>>>
>>>>
>>>> v1->v2:
>>>> - add comments regarding -ENODEV/-EACCES handling
>>>> - add second patch
>>>>
>>>> Cornelia Huck (2):
>>>>    vfio-ccw: forward halt/clear errors
>>>>    css: fix actl handling for unit exceptions
>>>>
>>>>   hw/s390x/css.c         | 38 ++++++++++++++++++++++++++++++++++----
>>>>   hw/vfio/ccw.c          |  4 ++--
>>>>   include/hw/s390x/css.h |  3 ++-
>>>>   3 files changed, 38 insertions(+), 7 deletions(-)
>>>>
>>>


