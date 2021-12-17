Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 696054786EA
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 10:19:56 +0100 (CET)
Received: from localhost ([::1]:52112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my9P9-0003HR-IT
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 04:19:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1my9NS-0001sX-5L; Fri, 17 Dec 2021 04:18:10 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1my9NQ-0000jJ-CL; Fri, 17 Dec 2021 04:18:09 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BH71erF017663; 
 Fri, 17 Dec 2021 09:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=fsgDETjS/+KdERY05SY1CvdLmE3+2/3B0+czWa/5t/w=;
 b=JLnE5N+mBfZB+ad14JitJdPSPAnoERpA/vBBkFPK5RLIEM+8fJLfnfrj6j1cP78xftP9
 TkP8qccUnt4W7OO7NFVKydEGyE1WwXCMRYUc3T75qiaNV6bb1ECLeRjI7rkidCad4a5f
 om4pULcs7oNllaiCr73/X0aV3qhFBvOwyDXhN42eIjaJriJRfQDOnZrgUeZyQ1Z7ttMP
 jmIkb5C4vUun79A4/p3P8RraKBEcCqlR/XPs8Ub2oJ2GuD3ILim5V8XJ7w5pkGMy0cwF
 vvi5IdZv1FyfD45Hs+Mt/RzO9yQV92sJsjm1tq6IzYNwyyTT3dC5326u2zTszFiQ/DAq 6g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cynfx2x7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Dec 2021 09:18:03 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BH9Gtlo019150;
 Fri, 17 Dec 2021 09:18:03 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cynfx2x6g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Dec 2021 09:18:02 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BH96qlf015988;
 Fri, 17 Dec 2021 09:18:00 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 3cy78hpprd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Dec 2021 09:18:00 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BH99r9T44171764
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Dec 2021 09:09:53 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9CDCA4060;
 Fri, 17 Dec 2021 09:17:56 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BCDDA4054;
 Fri, 17 Dec 2021 09:17:56 +0000 (GMT)
Received: from [9.171.60.51] (unknown [9.171.60.51])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 17 Dec 2021 09:17:56 +0000 (GMT)
Message-ID: <9170c198-d5da-1d41-c1d1-81a0e3a8e634@linux.ibm.com>
Date: Fri, 17 Dec 2021 10:17:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 00/12] s390x/pci: zPCI interpretation support
Content-Language: en-US
To: Matthew Rosato <mjrosato@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
References: <20211207210425.150923-1-mjrosato@linux.ibm.com>
 <e1ba4cce-d6b9-bc86-9999-dc135046129d@linux.ibm.com>
 <6103b709-f29d-16f2-7fe6-f9a25dd85b89@linux.ibm.com>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <6103b709-f29d-16f2-7fe6-f9a25dd85b89@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KtpZLSHHFDzVR5vn_e1ooCdKyH-QEW2y
X-Proofpoint-ORIG-GUID: wuj4l0OYeTFV_gAr13E-x2bVQEvvEFPc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-17_03,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112170051
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: farman@linux.ibm.com, kvm@vger.kernel.org, schnelle@linux.ibm.com,
 cohuck@redhat.com, richard.henderson@linaro.org, thuth@redhat.com,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 15.12.21 um 16:53 schrieb Matthew Rosato:
> On 12/15/21 2:35 AM, Pierre Morel wrote:
>>
>>
>> On 12/7/21 22:04, Matthew Rosato wrote:
>>> Note:  The first 3 patches of this series are included as pre-reqs, but
>>> should be pulled via a separate series.  Also, patch 5 is needed to
>>> support 5.16+ linux header-sync and was already done by Paolo but not
>>> merged yet so is thus included here as well.
>>>
>>> For QEMU, the majority of the work in enabling instruction interpretation
>>> is handled via new VFIO ioctls to SET the appropriate interpretation and
>>> interrupt forwarding modes, and to GET the function handle to use for
>>> interpretive execution.
>>>
>>> This series implements these new ioctls, as well as adding a new, optional
>>> 'intercept' parameter to zpci to request interpretation support not be used
>>> as well as an 'intassist' parameter to determine whether or not the
>>> firmware assist will be used for interrupt delivery or whether the host
>>> will be responsible for delivering all interrupts.
>>
>> In which circumstances do we have an added value by not using interrupt delivered by firmware?
>>
> 
> Disabling it can be a tool to debug and assist in problem determination, but that's about the only scenario I can think of where you would intentionally want to disable intassist.  Perhaps then it's not worth leaving in place.

I would leave it in in case we run into problems. Things like the nomio parameter for the kernel have proven to be useful.


