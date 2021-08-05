Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B16813E0B33
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 02:31:49 +0200 (CEST)
Received: from localhost ([::1]:59806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBRIa-00046S-NY
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 20:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrossi@linux.ibm.com>)
 id 1mBRHC-0003Ch-PU; Wed, 04 Aug 2021 20:30:23 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrossi@linux.ibm.com>)
 id 1mBRHA-0006Gr-Sq; Wed, 04 Aug 2021 20:30:22 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17504Bb1144757; Wed, 4 Aug 2021 20:30:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=gkWQiRZ35wnDj0CGdpy6fZMoSJjWNAowj4Am4/2N/4Y=;
 b=ZrgrECFKPSakND5b4Vp4YkyuyyOP7It5hL7rbO7IINP/1JmoHItiDmLuMp9ZVbgJphHl
 h6aj3jJF6q7m8FrdQX/zbotfH9I5epRfs89LRL2FeAaccTumHPRHU7H6kTZ/MAWw70FR
 Nrlo/DVPCdlqebP96r/Yp3+wJxW7ZASJG6glpXwT8F4Kjq6dyfqz6PUX+Hqmmd+e8U7b
 bb8IReIX3SXxMNNw/bbK+JTAg0NafDyOoeXVnPCHfu4LnsbFV/TSn/JxVWlWCDbHOfCo
 P/hHcCZidlfZRQIT0ah6wBbxlaQB8si9KT2glJoxLDIhl8o1PwkbyKg4V2bNL9jyoVMb QQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a84mus2e7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Aug 2021 20:30:17 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1750M5X1016249;
 Wed, 4 Aug 2021 20:30:16 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a84mus2dr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Aug 2021 20:30:16 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1750RMhZ015467;
 Thu, 5 Aug 2021 00:30:15 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03wdc.us.ibm.com with ESMTP id 3a77h3wbjk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 00:30:15 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1750UEH336176328
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Aug 2021 00:30:14 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 93E5C124053;
 Thu,  5 Aug 2021 00:30:14 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B09B124080;
 Thu,  5 Aug 2021 00:30:14 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.21.91])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu,  5 Aug 2021 00:30:13 +0000 (GMT)
Subject: Re: [PATCH v2 0/2] s390x: improve subchannel error handling (vfio)
From: Jared Rossi <jrossi@linux.ibm.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>, Cornelia Huck
 <cohuck@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>
References: <20210705163952.736020-1-cohuck@redhat.com>
 <e2032c05-ec0b-d653-959f-dcc045da2036@linux.ibm.com>
 <e8426672-bd10-de2d-7dc9-1a46a52f3dea@linux.ibm.com>
Message-ID: <5ba5fc45-1e61-f774-0340-06961dbfc611@linux.ibm.com>
Date: Wed, 4 Aug 2021 20:30:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <e8426672-bd10-de2d-7dc9-1a46a52f3dea@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: djnfM2sBJZX2LhaBsjeU7ParEme83xRz
X-Proofpoint-ORIG-GUID: emnaX_ZN4jZ73B_qzhjyTgXtLlv9NIuP
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-04_08:2021-08-04,
 2021-08-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108040151
Received-SPF: pass client-ip=148.163.156.1; envelope-from=jrossi@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.132, SPF_HELO_NONE=0.001,
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

I've exercised the error paths and it appears to all work correctly.

On 7/19/21 11:09 AM, Jared Rossi wrote:
> I will take a look and see if I can exercise the error paths.
>
> Regards,
>
> Jared Rossi
>
> On 7/19/21 10:16 AM, Matthew Rosato wrote:
>> On 7/5/21 12:39 PM, Cornelia Huck wrote:
>>> This is a followup on the first version (which I had sent out in May,
>>> and which kind of fell through the cracks.) While the first patch
>>> is mostly unchanged, I added a second patch to address some possible
>>> problems with the generated unit exceptions; non-vfio subchannels
>>> are not affected by this.
>>>
>>> As before, this works on the good path, and I have not managed to
>>> actually get my system to exercise the error path :(
>>
>> Sorry for the silence, was out of office for a bit and Eric is 
>> unavailable -- Anyway the code LGTM and matches what I see in the 
>> POPs, I'd be willing to ACK but I'd feel better if we could exercise 
>> the error paths before merging.
>>
>> @Jared/@Mike, you've both had eyes on this area of code recently, 
>> would one of you be willing to take a crack at a tested-by (non-zero 
>> CCs on HSCH/CSCH + also drive the sch_gen_unit_exception path)?
>>
>>>
>>> v1->v2:
>>> - add comments regarding -ENODEV/-EACCES handling
>>> - add second patch
>>>
>>> Cornelia Huck (2):
>>>    vfio-ccw: forward halt/clear errors
>>>    css: fix actl handling for unit exceptions
>>>
>>>   hw/s390x/css.c         | 38 ++++++++++++++++++++++++++++++++++----
>>>   hw/vfio/ccw.c          |  4 ++--
>>>   include/hw/s390x/css.h |  3 ++-
>>>   3 files changed, 38 insertions(+), 7 deletions(-)
>>>
>>

