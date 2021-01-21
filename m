Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F522FED30
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 15:44:18 +0100 (CET)
Received: from localhost ([::1]:44176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2bC5-00009D-FH
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 09:44:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1l2bAX-00085a-2b; Thu, 21 Jan 2021 09:42:41 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:20266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1l2bAU-00037A-VD; Thu, 21 Jan 2021 09:42:40 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10LEUwVl191683; Thu, 21 Jan 2021 09:42:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=qYJW2Kg414Sh4e1iytP9qJakL5qe3gg5hES3QwgdnC4=;
 b=cecHepoY+HObyxyywwaiD5SVl9bxuqiKHYvx7klxutOvQ+LR3F6jX5fYMq29O+Q6JcYI
 T9Nes+1a43j+pPQzsU/aouHxdcSDMLEG45qt1KRAIJOyQtLF1FK0B1HYnmk8cJCMd4Ix
 GZqdjV6zT2+qgLbq6NTNx31FxbdoETzBqk17MTH1OVi2Hv/KuLa0FZsK23oCKdvwst2J
 Vuype/1Jl0/GYU8DoCQErIQ+tVObDrcsVsOq6rJSwFHSHtlZNFQGqE2tjPLlkO6u0yEg
 znsMzMbexsTrDVA2qGATNsJghp5QyUf8g9Jyr5PjdS3+2Dz954R9LB57tJWjmj7g5vU8 Fw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 367b708xfk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 09:42:33 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10LEUxiF191701;
 Thu, 21 Jan 2021 09:42:32 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 367b708xdw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 09:42:32 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10LEawGu009988;
 Thu, 21 Jan 2021 14:42:30 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 3668p2yuhq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 14:42:30 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10LEgTJ611928010
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jan 2021 14:42:29 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01862BE054;
 Thu, 21 Jan 2021 14:42:29 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6832BE056;
 Thu, 21 Jan 2021 14:42:27 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.211.56.144])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 21 Jan 2021 14:42:27 +0000 (GMT)
Subject: Re: [PATCH 0/8] s390x/pci: Fixing s390 vfio-pci ISM support
To: Pierre Morel <pmorel@linux.ibm.com>, cohuck@redhat.com, thuth@redhat.com
References: <1611089059-6468-1-git-send-email-mjrosato@linux.ibm.com>
 <511aebd3-fc4f-d7d3-32c2-27720fb38fe8@linux.ibm.com>
 <15dbd981-7dda-2526-8f13-52ead6298ef1@linux.ibm.com>
 <a1d1df76-07df-9879-ae77-ff677efdd291@linux.ibm.com>
 <f3e074d2-4f47-d229-9002-010e91df95d1@linux.ibm.com>
 <914d4af3-32ee-e300-9738-92aececa81d6@linux.ibm.com>
 <789388f4-983b-2810-7f46-ce7f07022a66@linux.ibm.com>
 <ff5674ed-8ce2-73d7-1991-de424d62288c@linux.ibm.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
Message-ID: <1dc0dde6-b619-5fe6-1a89-50c15dc4512c@linux.ibm.com>
Date: Thu, 21 Jan 2021 09:42:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <ff5674ed-8ce2-73d7-1991-de424d62288c@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-21_06:2021-01-21,
 2021-01-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 mlxscore=0 clxscore=1015 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101210078
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
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
Cc: schnelle@linux.ibm.com, alex.williamson@redhat.com, david@redhat.com,
 mst@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 3:27 AM, Pierre Morel wrote:
> 
> 
> On 1/20/21 9:29 PM, Matthew Rosato wrote:
>> On 1/20/21 2:18 PM, Pierre Morel wrote:
>>>
>>>
> ...snip...
> 
>>> So we have:
>>> devices supporting MIO and MSIX
>>> devices not supporting MIO nor MSIX
>>> devices not supporting the use of PCISTG to emulate PCISTB
>>>
>>> The first two are two different things indicated by two different 
>>> entries in the clp query PCI function response.
>>>
>>> The last one, we do not have an indicator as if the relaxed alignment 
>>> and length is set, PCISTB can not be emulated with PCISTG
> 
> 
> hum sorry, it seems I rewrote my sentence until it was wrong wrong!
> I wanted to say we DO HAVE an indicator with the relaxed bit...

That's actually not quite true though...  The relaxed bit does not 
directly imply that PCISTB cannot be emulated with PCISTG.  Rather, it 
more generally implies that PCISTB could be used instead of PCISTG as 
the length and alignment requirements for PCISTB are waived.  As far as 
I can tell, disallowing a PCISTG altogether is a trait that is unique to 
ISM and I don't see anywhere that it's otherwise indicated in 
architecture...  And in fact, for a given ISM device, certain address 
spaces (command) WILL accept a series of PCISTG issued in a particular 
manner in place of a PCISTB; meanwhile other ISM address spaces (data) 
will not accept any PCISTG ever.  :(  The ISM driver just always uses 
PCISTB.

So that is why I suggested type==ISM must require use of the region 
whereas other types that implement MSI could request (but not require) 
use of the region.

But yes, any other theoretical piece of hardware that also does not 
support MIO would have a similar region requirement.  I'll have a look 
at the MIO bit you referenced below and will have to verify that it does 
exactly what we expect for an ISM device.  Assuming yes, I will consider 
the following sort of checking for the next version of QEMU...

if (!MIO) {
	if (MSIX) {
		// passthrough disallowed
	}
	else {
		// region required, disallow if unavailable
	}
}
else if(RELAX && !MSIX) {
	// use region if available
}

Sound good?

All said, this would result in another bit passed from the kernel as CLP 
info and some small changes to patch 6 of this set to determine when to 
call s390_pci_get_zpci_io_region(pbdev) -- But just about everything 
else is unaffected, so @all please feel free to provide other review 
comments for the series in the meanwhile.


> 
>>>
>>> What I mean with this is that considering the proposed implementation 
>>> and considering:
>>> MIO MSIX RELAX
>>>
>>> 0 0 1  -> must use the new region (ISM)
>>> 1 1 0  -> must use the standard VFIO region (MLX)
>>>
>>> we can discuss other 6 possibilities
>>>
>>> 0 0 0 -> must use the new region
>>> 0 1 0 -> NOOP
>>> 0 1 1 -> NOOP
>>> 1 0 0 -> can use any region
>>> 1 0 1 -> can use any region
>>> 1 1 1 -> NOOP
>>>
>>> In my opinion the test for using one region or another should be done 
>>> on these indicator instead of using the PFT. > This may offer us more 
>>> compatibility with other hardware we may not be
>>> aware of as today.
>>
>> This gets a little shaky, and goes both ways -- Using your list, a 
>> device that supports MIO, does not have MSI-X capability and doesn't 
>> support relaxed alignment (1 0 0 from above) can use any region -- but 
>> that may not always be true.  What if "other hardware we may not be 
>> aware of as today" includes future hardware that ONLY supports the MIO 
>> instruction set?  Then that device really can't use this region either.
> 
> 
> Right, but there is no bit in the CLP response for this case.
> Until there is one, the system is supposed to handle legacy instructions
> 
>>
>> But forgetting that possibility...  I think we can really simplify the 
>> above matrix down to a statement of "if device doesn't support MSI-X 
>> but DOES support non-MIO instructions, it can use the region."  I 
>> believe the latter half of that statement is implicit in the 
>> architecture today, so it's really then "if device doesn't support 
>> MSI-X, it can use the region".  There's just the caveat of, if the 
>> device is ISM, it changes from 'can use the region' to 'must use the 
>> region'.
> 
> 
> There can surely be simplifications.
> 
>>
>> So, I mean I can change the code to be more permissive in that way 
>> (allow any device that doesn't have MSI-X capability to at least 
>> attempt to use the region).  But the reality is that ISM specifically 
>> needs the region for successful pass through, so I don't see a reason 
>> to create a different bit for that vs just checking for the PFT in 
>> QEMU and using that value to decide whether or not region availability 
>> is a requirement for allowing the device to pass through.
> 
> 
> There is no need for a new bit to know if a device support MIO or not, 
> as I said before, there is already one in the CLP query PCI function 
> response and it is already used in the kernel zPCI architecture.
> 
> 
> It is not a big think to do and does not change the general architecture 
> of the patch, only the detection of which device is impacted to make it 
> generic instead of device dedicated.
> 
> Regards,
> Pierre
> 


