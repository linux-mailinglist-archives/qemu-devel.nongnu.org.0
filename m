Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE73A2FEA1C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 13:32:21 +0100 (CET)
Received: from localhost ([::1]:49496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Z8O-0004Vu-Vj
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 07:32:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1l2Z6o-00042v-Am; Thu, 21 Jan 2021 07:30:42 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:11460
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1l2Z6m-0003S9-4o; Thu, 21 Jan 2021 07:30:41 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10LC0XsC072131; Thu, 21 Jan 2021 07:30:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=zojCUetfQQDZrQE9Cj/Auhuk+YLiCz4vyMsmBK5UnNQ=;
 b=OxhOG88qeI+j1iDYlmdhmKMnftsODv+h26csgldT8Y3Gs+waM3h3hklxDyidX8o9SMbW
 +WRcVhn634KTHnhd74/C1rM0k/L3sZpL/Sfd2r3rbuTQv0U9Af3G2+EYGPDMdSeaT6aI
 89ZOe4rv/U590DmvyCgL7600q60mRHCuFcerxJPbRnSP4uh2UfgxBvo5B/HDA3KDrBTu
 eMBbi1k7+E3aWGVxWKWa+qaujN1RQ05z1v4ZF1RKV7vFjFgfBbOrO32jkThAnBr/PQMD
 FV8tkO/v69lws3ZhSA/Rpdy+1432MFTEP3VRRUGD23hdqpv82qq1Dha27Tu0V9LzZKCW tQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36792a164x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 07:30:36 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10LC1VHj077013;
 Thu, 21 Jan 2021 07:30:36 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36792a164c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 07:30:35 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10LCSQBh013073;
 Thu, 21 Jan 2021 12:30:34 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3668pasn1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 12:30:34 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10LCUVcf40108432
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jan 2021 12:30:31 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33644A4053;
 Thu, 21 Jan 2021 12:30:31 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9BDE3A4040;
 Thu, 21 Jan 2021 12:30:30 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.36.14])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 21 Jan 2021 12:30:30 +0000 (GMT)
Subject: Re: [PATCH 0/8] s390x/pci: Fixing s390 vfio-pci ISM support
To: Niklas Schnelle <schnelle@linux.ibm.com>,
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
 <bd94ca8a-70b2-36b3-d357-3527e8d3dc62@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <213c00ca-1b8f-ecee-dd22-d86cad8eb63b@linux.ibm.com>
Date: Thu, 21 Jan 2021 13:30:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <bd94ca8a-70b2-36b3-d357-3527e8d3dc62@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-21_04:2021-01-21,
 2021-01-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101210063
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: mst@redhat.com, david@redhat.com, richard.henderson@linaro.org,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, alex.williamson@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/21/21 10:58 AM, Niklas Schnelle wrote:
> 
> 
> On 1/21/21 9:27 AM, Pierre Morel wrote:
>>
>>
>> On 1/20/21 9:29 PM, Matthew Rosato wrote:
>>> On 1/20/21 2:18 PM, Pierre Morel wrote:
>>>>
>>>>
>> ...snip...
>>
>>>
>>> So, I mean I can change the code to be more permissive in that way (allow any device that doesn't have MSI-X capability to at least attempt to use the region).  But the reality is that ISM specifically needs the region for successful pass through, so I don't see a reason to create a different bit for that vs just checking for the PFT in QEMU and using that value to decide whether or not region availability is a requirement for allowing the device to pass through.
>>
>>
>> There is no need for a new bit to know if a device support MIO or not, as I said before, there is already one in the CLP query PCI function response and it is already used in the kernel zPCI architecture.
>>
>>
>> It is not a big think to do and does not change the general architecture of the patch, only the detection of which device is impacted to make it generic instead of device dedicated.
>>
>> Regards,
>> Pierre
> 
> Just wanted to say that we've had a very similar discussion with
> Cornelia end of last year and came to the conclusion that explicitly
> matching the PFT is likely the safest bet:
> https://lkml.org/lkml/2020/12/22/479

What I see there is a discussion on the relation between relaxed access 
and MIO without explaining to Connie that we have in the kernel the 
possibility to know if a device support MIO or not independently of it 
supports the relaxed access.

The all point here is about taking decisions for the right reasons.

We have the possibility to take the decision based on functionalities 
and not on a specific PCI function.


If we keep the PFT check, and we can do this of course, but is it a good 
solution if it appears we have other PFT with the same functionalities?

Please note that this is a minor code change, keeping track of the MIO 
support just as we keep track of the PFT and check on this instead of on 
the PFT.

It does not modify the general architecture of the patch series neither 
in kernel nor in QEMU at all.


Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

