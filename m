Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4172FEF5C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 16:47:16 +0100 (CET)
Received: from localhost ([::1]:37234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2cB1-0003U1-JN
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 10:47:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1l2c94-0002TL-Rn; Thu, 21 Jan 2021 10:45:14 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:1842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1l2c92-0006B2-Ud; Thu, 21 Jan 2021 10:45:14 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10LFhGZx073595; Thu, 21 Jan 2021 10:45:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=OzW5S2p71GKR4+EA6f8BGRr76O+O8SKyXojZ8mmixdo=;
 b=P+Eltr3BDh2FS+nUUdnA6+yT7Wv64avx80YwcT2TfeHAa0OP54AluUD55T/KQS15F3Z/
 7jTyLxUWmxGRN/1KIE1eDt7SmntR5NCbDZN0Bo+I4GeLgEjkQUsPr/VUZgFgoqjAa3k0
 jcgdickPJLJeNcNBd3rEbfjFAVb8FrzEDKb0b8hXzKYsNINhNG+HV2zyT6puPjCmAdnl
 5iGHC+GnLHiLflXf9Q7fMUz/AyVDildDbhEdPLdyFaJ+opaM8tzFjKfnu+yugabm5b+U
 nSPGOw20ozZcDmisv95TMOzrOgtpw17Nn4R8erKI/3PsWm2EtyYR65p/gwcejD2c7wwF wQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 367cgc0265-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 10:45:10 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10LFhFbN073459;
 Thu, 21 Jan 2021 10:45:10 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 367cgc024n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 10:45:10 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10LFVgQl022278;
 Thu, 21 Jan 2021 15:45:08 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3668passvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 15:45:08 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10LFj4JH36045120
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jan 2021 15:45:04 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6751CA4051;
 Thu, 21 Jan 2021 15:45:04 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D34CCA4053;
 Thu, 21 Jan 2021 15:45:03 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.36.14])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 21 Jan 2021 15:45:03 +0000 (GMT)
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
 <ff5674ed-8ce2-73d7-1991-de424d62288c@linux.ibm.com>
 <1dc0dde6-b619-5fe6-1a89-50c15dc4512c@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <a781f908-1c70-3725-1484-bec10befbb35@linux.ibm.com>
Date: Thu, 21 Jan 2021 16:45:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1dc0dde6-b619-5fe6-1a89-50c15dc4512c@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-21_08:2021-01-21,
 2021-01-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101210085
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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



On 1/21/21 3:42 PM, Matthew Rosato wrote:
> On 1/21/21 3:27 AM, Pierre Morel wrote:
>>
>>
>> On 1/20/21 9:29 PM, Matthew Rosato wrote:
>>> On 1/20/21 2:18 PM, Pierre Morel wrote:
>>>>
>>>>
>> ...snip...
>>
>>>> So we have:
>>>> devices supporting MIO and MSIX
>>>> devices not supporting MIO nor MSIX
>>>> devices not supporting the use of PCISTG to emulate PCISTB
>>>>
>>>> The first two are two different things indicated by two different 
>>>> entries in the clp query PCI function response.
>>>>
>>>> The last one, we do not have an indicator as if the relaxed 
>>>> alignment and length is set, PCISTB can not be emulated with PCISTG
>>
>>
>> hum sorry, it seems I rewrote my sentence until it was wrong wrong!
>> I wanted to say we DO HAVE an indicator with the relaxed bit...
> 
> That's actually not quite true though...  The relaxed bit does not 
> directly imply that PCISTB cannot be emulated with PCISTG.


It does, PCISTG have stronger alignment enforcement as PCISTB with the 
relaxed bit set, as you say here under, so we agree.


>  Rather, it 
> more generally implies that PCISTB could be used instead of PCISTG as 
> the length and alignment requirements for PCISTB are waived.  As far as 
> I can tell, disallowing a PCISTG altogether is a trait that is unique to 
> ISM and I don't see anywhere that it's otherwise indicated in 
> architecture...  And in fact, for a given ISM device, certain address 
> spaces (command) WILL accept a series of PCISTG issued in a particular 
> manner in place of a PCISTB; meanwhile other ISM address spaces (data) 
> will not accept any PCISTG ever.  :(  The ISM driver just always uses 
> PCISTB.

Very interresting!

> 
> So that is why I suggested type==ISM must require use of the region 
> whereas other types that implement MSI could request (but not require) 
> use of the region.
> 
> But yes, any other theoretical piece of hardware that also does not 
> support MIO would have a similar region requirement.  I'll have a look 
> at the MIO bit you referenced below and will have to verify that it does 
> exactly what we expect for an ISM device.  Assuming yes, I will consider 
> the following sort of checking for the next version of QEMU...
> 
> if (!MIO) {
>      if (MSIX) {
>          // passthrough disallowed
>      }
>      else {
>          // region required, disallow if unavailable
>      }
> }
> else if(RELAX && !MSIX) {
>      // use region if available
> }
> 
> Sound good?

Yes sounds good to me.
I mean the idea, I will not try to simplify, I trust you on this.


Thanks,

Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

