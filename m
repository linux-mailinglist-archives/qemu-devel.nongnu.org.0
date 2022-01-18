Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D74F492D5A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 19:33:46 +0100 (CET)
Received: from localhost ([::1]:57804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9tIe-0007NR-Rk
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 13:33:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1n9tHJ-0006cX-9I; Tue, 18 Jan 2022 13:32:21 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:5608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1n9tHH-0000so-KF; Tue, 18 Jan 2022 13:32:20 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20IHvg7l013536; 
 Tue, 18 Jan 2022 18:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=nXIc+BurcjMJbheQTjSBw3CQWZoO1FMRGYbXtUdLIdo=;
 b=kESWBSVi1qqTNTxOQlgMuygD2p6FNoGmkcNsrIZQd/3HzduIASnohg94stFSD0wlJx0a
 yWvIQyDHyrQj5J84f9VCEfRC/JSjNG3IzOoWLJIEWsgexHL8RNWzFIpZzPBCaw9tMMbX
 7Mqtk+oUCuyfTr7L9igfuBjx+g5X0GSUv0KJQxKfq9ScdoaTHyFKBpbgDhQkMpG1RlKy
 ebf1/rcukhXBhqtY2MERBwme/5S42qNXvBuixZ0D9T/u0aGDuRxn0BZq4pKBdypA/f87
 k5F3Uwo5u13hYGX8LteuXaCrXuG0GOiNe3qQJRqMPxNk55Q1qTsR/+na7uvrOf5kAvqZ wQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dp2dms4nh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 18:32:16 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20IIV2SS008226;
 Tue, 18 Jan 2022 18:32:15 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dp2dms4ms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 18:32:15 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20IIHviM020629;
 Tue, 18 Jan 2022 18:32:14 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma05wdc.us.ibm.com with ESMTP id 3dknwaqje1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 18:32:14 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20IIWDvD31785328
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 18:32:13 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5AE546E05B;
 Tue, 18 Jan 2022 18:32:13 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE1856E05D;
 Tue, 18 Jan 2022 18:32:11 +0000 (GMT)
Received: from [9.163.19.30] (unknown [9.163.19.30])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 18 Jan 2022 18:32:11 +0000 (GMT)
Message-ID: <c44a7ba3-37bf-6b25-1e89-719a1487ca20@linux.ibm.com>
Date: Tue, 18 Jan 2022 13:32:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 0/9] s390x/pci: zPCI interpretation support
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
References: <20220114203849.243657-1-mjrosato@linux.ibm.com>
 <32c83624-eb3b-05ea-6fb6-737bd9876db3@redhat.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <32c83624-eb3b-05ea-6fb6-737bd9876db3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: axDwkrt98FfFsrlLXD9vFSJaiBdYi8hr
X-Proofpoint-GUID: UUWcwG8OkAizBPCo4zGyv7o9iVS9R8Tf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-18_05,2022-01-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201180112
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: farman@linux.ibm.com, kvm@vger.kernel.org, pmorel@linux.ibm.com,
 schnelle@linux.ibm.com, cohuck@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, david@redhat.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/17/22 10:23 AM, Thomas Huth wrote:
> On 14/01/2022 21.38, Matthew Rosato wrote:
>> For QEMU, the majority of the work in enabling instruction interpretation
>> is handled via new VFIO ioctls to SET the appropriate interpretation and
>> interrupt forwarding modes, and to GET the function handle to use for
>> interpretive execution.
>>
>> This series implements these new ioctls, as well as adding a new, 
>> optional
>> 'intercept' parameter to zpci to request interpretation support not be 
>> used
>> as well as an 'intassist' parameter to determine whether or not the
>> firmware assist will be used for interrupt delivery or whether the host
>> will be responsible for delivering all interrupts.
> 
>   Hi Matthew,
> 
> would it make sense to create a docs/system/s390x/zpci.rst doc file, 

This is a good idea and probably something that was due for zpci before 
this series even.

> too, where you could describe such new parameters like 'intassist' and 
> 'intercept' (or is it 'interp') ? ... otherwise hardly anybody except 

Oops, 'intercept' was a holdover from a previous version and effectively 
had an inverted meaning.  It is indeed 'interp' with this current series 
(and subject to change again per other thread)



