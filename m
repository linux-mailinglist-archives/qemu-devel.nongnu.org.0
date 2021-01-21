Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A93B2FED9E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 15:56:10 +0100 (CET)
Received: from localhost ([::1]:54934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2bNZ-0005YF-F4
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 09:56:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schnelle@linux.ibm.com>)
 id 1l2bM6-000546-Up; Thu, 21 Jan 2021 09:54:38 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schnelle@linux.ibm.com>)
 id 1l2bM4-0008Er-Vl; Thu, 21 Jan 2021 09:54:38 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10LEg6sr062674; Thu, 21 Jan 2021 09:54:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=yC5LRhUocx9Vwo9OSLQCceyY/DQ+/wkNlu2hVUNQ1Ns=;
 b=mQzcmHKDz4vpc5gdTsLjD0WBHrFaEdipmeOcJpzLq0+OcY3mY5sqd28p/suZ8CYOgI7p
 +cJ9mqxcUU2U0vPPMPh9RHHRYnifRyHQn+ono80wjS1y5dKO0bpM8k3BwECwuxqWukvG
 5MyTfWDVHFodtonRIMATbb/TpdZzM1onQg3lfNOmGkJkJpwkS/ivfmkxFxSfcIDxjQKv
 r0lg5uNc5X9kYUevFXfGSXgX2k/0JJzqVnIb/l4c2dAD95Gx5qW4H8kI0LOLThnfhEQK
 bPOGsYssipJskvKwL8pnwuf51DrSkY5lj4dD2zo04s3bH19cTtfeAg8JZaQ3Daj9Yq4v 5Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 367bkuraj5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 09:54:33 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10LEgA0k062809;
 Thu, 21 Jan 2021 09:54:32 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 367bkurafq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 09:54:32 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10LEqu3g030558;
 Thu, 21 Jan 2021 14:54:26 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3668nwsrm1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 14:54:26 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10LEsNhM28377348
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jan 2021 14:54:23 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28155A4057;
 Thu, 21 Jan 2021 14:54:23 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8660CA4040;
 Thu, 21 Jan 2021 14:54:22 +0000 (GMT)
Received: from [9.145.88.16] (unknown [9.145.88.16])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 21 Jan 2021 14:54:22 +0000 (GMT)
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
 <bd94ca8a-70b2-36b3-d357-3527e8d3dc62@linux.ibm.com>
 <213c00ca-1b8f-ecee-dd22-d86cad8eb63b@linux.ibm.com>
 <4a3e13fe-ec6a-27bc-7f30-9ad9691a4522@linux.ibm.com>
 <a458fa0e-2c4a-551f-2f54-3dcedc4bbade@linux.ibm.com>
From: Niklas Schnelle <schnelle@linux.ibm.com>
Message-ID: <9522792d-6677-eed4-f480-4efaaf00dd51@linux.ibm.com>
Date: Thu, 21 Jan 2021 15:54:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <a458fa0e-2c4a-551f-2f54-3dcedc4bbade@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-21_06:2021-01-21,
 2021-01-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 mlxscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101210078
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=schnelle@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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



On 1/21/21 3:46 PM, Pierre Morel wrote:
> 
> 
> On 1/21/21 2:37 PM, Niklas Schnelle wrote:
>>
>>
>> On 1/21/21 1:30 PM, Pierre Morel wrote:
> 
>>>>
>>>> Just wanted to say that we've had a very similar discussion with
>>>> Cornelia end of last year and came to the conclusion that explicitly
>>>> matching the PFT is likely the safest bet:
>>>> https://lkml.org/lkml/2020/12/22/479
>>>
>>> What I see there is a discussion on the relation between relaxed access and MIO without explaining to Connie that we have in the kernel the possibility to know if a device support MIO or not independently of it supports the relaxed access.
>>>
>>> The all point here is about taking decisions for the right reasons.
>>>
>>> We have the possibility to take the decision based on functionalities and not on a specific PCI function.
>>
>> Yes but that goes both ways the functionality of the region has to match
>> that of the device and at least in it's current state the regions functionality
>> matches only ISM in a way that is so specific that it is very unlikely to match anything
>> else. For example it can't support a PCI device that requires non-MIO but
>> also MSI-X. In its current form it doesn't even support PCI Store only PCI Store
>> Block, we had that in an earlier version and it's trivial but then we get the MSI-X
>> problem.
> 
> 
> What does that change if we take one or the other solution considering the checking of MIO/MSIX/relax versus PFT?


If it's !MIO && !MSIX && relax_align I'm fine with that check but
then we should also add PCISTG to the region.

