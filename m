Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B952FE72E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 11:11:00 +0100 (CET)
Received: from localhost ([::1]:36408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Wva-0007Ay-0f
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 05:10:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schnelle@linux.ibm.com>)
 id 1l2WjQ-00052M-Qj; Thu, 21 Jan 2021 04:58:25 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34710
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schnelle@linux.ibm.com>)
 id 1l2WjL-0008LP-Ko; Thu, 21 Jan 2021 04:58:24 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10L9Wk3Q042700; Thu, 21 Jan 2021 04:58:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=8BQ+fdpAVnPTmi2+HQ6aRuVDUozD4RfbymsIic4uxW8=;
 b=qYLS+QAY16/Wsma7HychZYcuYQP4WEIkbxkIbTxduytrhefXO/pP0ragXmWzReEMiNro
 1ONDIhwlE4z3HQh/V6LP0Llf6wxPTo4yfUKFZnk7FPRGCXlMTsDUVtC93nLBxtxR2ke9
 3SvHAx1uwxOpWyOHyJQbmf8hVEywnLPhGtxegAsSGgJLrfxFbk2J3imjD/WlTolknKvo
 v9I7INH6d3jxLxkqzG80U6MMBSCpyYxP2MHtPCM79YulsC94wBS3qKwhsjMSaruz6IWm
 CJEtbybcDKqNTpiTZSQ4ChvmZ7o4RCjuzgU7wvh579LxeV7TE5OeL0+yqwPSRP6OIZLV mw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3676sx9bc2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 04:58:16 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10L9WsSW043581;
 Thu, 21 Jan 2021 04:58:15 -0500
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3676sx9bbg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 04:58:15 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10L9bbmC000637;
 Thu, 21 Jan 2021 09:58:14 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 3668p90snx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 09:58:13 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10L9wAlB38207846
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jan 2021 09:58:11 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D57DC4C040;
 Thu, 21 Jan 2021 09:58:10 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B6F34C046;
 Thu, 21 Jan 2021 09:58:10 +0000 (GMT)
Received: from [9.145.88.16] (unknown [9.145.88.16])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 21 Jan 2021 09:58:10 +0000 (GMT)
Subject: Re: [PATCH 0/8] s390x/pci: Fixing s390 vfio-pci ISM support
To: Pierre Morel <pmorel@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, cohuck@redhat.com,
 thuth@redhat.com
References: <1611089059-6468-1-git-send-email-mjrosato@linux.ibm.com>
 <511aebd3-fc4f-d7d3-32c2-27720fb38fe8@linux.ibm.com>
 <15dbd981-7dda-2526-8f13-52ead6298ef1@linux.ibm.com>
 <a1d1df76-07df-9879-ae77-ff677efdd291@linux.ibm.com>
 <f3e074d2-4f47-d229-9002-010e91df95d1@linux.ibm.com>
 <914d4af3-32ee-e300-9738-92aececa81d6@linux.ibm.com>
 <789388f4-983b-2810-7f46-ce7f07022a66@linux.ibm.com>
 <ff5674ed-8ce2-73d7-1991-de424d62288c@linux.ibm.com>
From: Niklas Schnelle <schnelle@linux.ibm.com>
Message-ID: <bd94ca8a-70b2-36b3-d357-3527e8d3dc62@linux.ibm.com>
Date: Thu, 21 Jan 2021 10:58:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <ff5674ed-8ce2-73d7-1991-de424d62288c@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-21_04:2021-01-20,
 2021-01-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 clxscore=1011 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101210049
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=schnelle@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Cc: mst@redhat.com, david@redhat.com, richard.henderson@linaro.org,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, alex.williamson@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/21/21 9:27 AM, Pierre Morel wrote:
> 
> 
> On 1/20/21 9:29 PM, Matthew Rosato wrote:
>> On 1/20/21 2:18 PM, Pierre Morel wrote:
>>>
>>>
> ...snip...
> 
>>
>> So, I mean I can change the code to be more permissive in that way (allow any device that doesn't have MSI-X capability to at least attempt to use the region).  But the reality is that ISM specifically needs the region for successful pass through, so I don't see a reason to create a different bit for that vs just checking for the PFT in QEMU and using that value to decide whether or not region availability is a requirement for allowing the device to pass through.
> 
> 
> There is no need for a new bit to know if a device support MIO or not, as I said before, there is already one in the CLP query PCI function response and it is already used in the kernel zPCI architecture.
> 
> 
> It is not a big think to do and does not change the general architecture of the patch, only the detection of which device is impacted to make it generic instead of device dedicated.
> 
> Regards,
> Pierre

Just wanted to say that we've had a very similar discussion with
Cornelia end of last year and came to the conclusion that explicitly
matching the PFT is likely the safest bet:
https://lkml.org/lkml/2020/12/22/479

One other point for me is that all these special requirements seem
to stem from the fact that ISM is not a physical PCIe device but
a special s390 only thing. That also implies that unlike with real
PCI devices we are not going to find an existing Linux driver
and infrastructure that just works. I'd bet if it's anywhere
as special as ISM we will also need a QEMU change either way
and if that change is only to change the PFT check then
great, won't have trouble getting that backported...
So the PFT check ensures we're definitely trying the standard path
first and only change it to a special case if we understand that
it is required as we do for ISM.

That said it's also important to note that we are not searching
for a be all end all solution here. The standard path's to-MIO
translation, even though it is working, is weird enough and also
not ideal for performance so we might look at that again
in separate work and yes that could change things for
this case too but that too will require QEMU and Kernel
changes either way.
Furthermore we will be looking into handling more PCI
without leaving SIE at which point we will also re-evaluate
if that works for ISM. Again that needs QEMU and likely Kernel
changes. I'm a great fan of general solutions that
don't unnecessarily exclude something, so I do understand your
concern but let's focus on what we know and want to fix now
instead of trying to solve future theoretical issues that
we have no strong reason to believe will ever appear.

If we stick with the PFT check I think we do need to
change some wording especially for the Kernel changes.


> 

