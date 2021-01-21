Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F812FE4F5
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 09:29:00 +0100 (CET)
Received: from localhost ([::1]:45214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2VKt-0004Fl-ES
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 03:28:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1l2VJM-0003nO-C3; Thu, 21 Jan 2021 03:27:24 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48976
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1l2VJK-0000a2-6x; Thu, 21 Jan 2021 03:27:24 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10L82go3084121; Thu, 21 Jan 2021 03:27:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=0HQbRsZWbJKSjxU1T5nRQPvugHYAatfeLaKPvos0yXA=;
 b=FzGDp3gCx9MpMq4bmql2qkUdnPjaId7JUYLPt76/ipEIL2cb7YAXo0xUfmt/Pcab31aM
 AlRSnFLjw/FLQjQDPxIgtw2zBL+PYeFSNdIxxXgNXbVC90A8IYwM1cq1nhzPWRe1dUJM
 BjHDzjoDZQecMeyNNvwxTZB1vViT5pCXMAs7D1L8vmGSuu6JGSG04sUyhEwmM1MDNvCX
 R5KKl+h8gWfQTxvlAYNtlrMzAFh7JolWm9lpJ/ddqTu++Y+azfXhHzv6iY3XjChFvi/o
 /Gc8AaP2K+BHILdBTmFJzX+OC8yK80nSX8QbgUcB1NopzUF35B+UlrtjooqsMfqkAaGI zw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3674v129m6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 03:27:18 -0500
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10L82e3t083909;
 Thu, 21 Jan 2021 03:27:18 -0500
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3674v129kp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 03:27:18 -0500
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10L8RGCA009469;
 Thu, 21 Jan 2021 08:27:16 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 3668p4gray-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 08:27:16 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10L8RDGM39125380
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jan 2021 08:27:13 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89150A4051;
 Thu, 21 Jan 2021 08:27:13 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC006A404D;
 Thu, 21 Jan 2021 08:27:12 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.36.14])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 21 Jan 2021 08:27:12 +0000 (GMT)
Subject: Re: [PATCH 0/8] s390x/pci: Fixing s390 vfio-pci ISM support
To: Matthew Rosato <mjrosato@linux.ibm.com>, cohuck@redhat.com,
 thuth@redhat.com
References: <1611089059-6468-1-git-send-email-mjrosato@linux.ibm.com>
 <511aebd3-fc4f-d7d3-32c2-27720fb38fe8@linux.ibm.com>
 <15dbd981-7dda-2526-8f13-52ead6298ef1@linux.ibm.com>
 <a1d1df76-07df-9879-ae77-ff677efdd291@linux.ibm.com>
 <f3e074d2-4f47-d229-9002-010e91df95d1@linux.ibm.com>
 <914d4af3-32ee-e300-9738-92aececa81d6@linux.ibm.com>
 <789388f4-983b-2810-7f46-ce7f07022a66@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <ff5674ed-8ce2-73d7-1991-de424d62288c@linux.ibm.com>
Date: Thu, 21 Jan 2021 09:27:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <789388f4-983b-2810-7f46-ce7f07022a66@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-21_03:2021-01-20,
 2021-01-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101210039
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
Cc: schnelle@linux.ibm.com, david@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, alex.williamson@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/20/21 9:29 PM, Matthew Rosato wrote:
> On 1/20/21 2:18 PM, Pierre Morel wrote:
>>
>>
...snip...

>> So we have:
>> devices supporting MIO and MSIX
>> devices not supporting MIO nor MSIX
>> devices not supporting the use of PCISTG to emulate PCISTB
>>
>> The first two are two different things indicated by two different 
>> entries in the clp query PCI function response.
>>
>> The last one, we do not have an indicator as if the relaxed alignment 
>> and length is set, PCISTB can not be emulated with PCISTG


hum sorry, it seems I rewrote my sentence until it was wrong wrong!
I wanted to say we DO HAVE an indicator with the relaxed bit...

>>
>> What I mean with this is that considering the proposed implementation 
>> and considering:
>> MIO MSIX RELAX
>>
>> 0 0 1  -> must use the new region (ISM)
>> 1 1 0  -> must use the standard VFIO region (MLX)
>>
>> we can discuss other 6 possibilities
>>
>> 0 0 0 -> must use the new region
>> 0 1 0 -> NOOP
>> 0 1 1 -> NOOP
>> 1 0 0 -> can use any region
>> 1 0 1 -> can use any region
>> 1 1 1 -> NOOP
>>
>> In my opinion the test for using one region or another should be done 
>> on these indicator instead of using the PFT. > This may offer us more 
>> compatibility with other hardware we may not be
>> aware of as today.
> 
> This gets a little shaky, and goes both ways -- Using your list, a 
> device that supports MIO, does not have MSI-X capability and doesn't 
> support relaxed alignment (1 0 0 from above) can use any region -- but 
> that may not always be true.  What if "other hardware we may not be 
> aware of as today" includes future hardware that ONLY supports the MIO 
> instruction set?  Then that device really can't use this region either.


Right, but there is no bit in the CLP response for this case.
Until there is one, the system is supposed to handle legacy instructions

> 
> But forgetting that possibility...  I think we can really simplify the 
> above matrix down to a statement of "if device doesn't support MSI-X but 
> DOES support non-MIO instructions, it can use the region."  I believe 
> the latter half of that statement is implicit in the architecture today, 
> so it's really then "if device doesn't support MSI-X, it can use the 
> region".  There's just the caveat of, if the device is ISM, it changes 
> from 'can use the region' to 'must use the region'.


There can surely be simplifications.

> 
> So, I mean I can change the code to be more permissive in that way 
> (allow any device that doesn't have MSI-X capability to at least attempt 
> to use the region).  But the reality is that ISM specifically needs the 
> region for successful pass through, so I don't see a reason to create a 
> different bit for that vs just checking for the PFT in QEMU and using 
> that value to decide whether or not region availability is a requirement 
> for allowing the device to pass through.


There is no need for a new bit to know if a device support MIO or not, 
as I said before, there is already one in the CLP query PCI function 
response and it is already used in the kernel zPCI architecture.


It is not a big think to do and does not change the general architecture 
of the patch, only the detection of which device is impacted to make it 
generic instead of device dedicated.

Regards,
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

