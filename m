Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9164B63EFF5
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 12:54:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0i7V-0006bs-Ny; Thu, 01 Dec 2022 06:52:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1p0i7U-0006bf-4u; Thu, 01 Dec 2022 06:52:48 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1p0i7S-0004QD-6p; Thu, 01 Dec 2022 06:52:47 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B1BjOp1020802; Thu, 1 Dec 2022 11:52:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=xqS6QbBW8ODJFNE4gcGi9rrzUH9f7YDDtJkyIcWZ5rQ=;
 b=N2/gZBUwkHYGGfz2M/cEY5c8esk5Wkg8zK7aaHLkl+FOCBJPzvQcEE2MhUbAIPZEHr7W
 t5xoSa7oClvg9KOKGdiMTEwtjh8vcVkBVT7/AdPTbCtTp0gYNGZkFfeb1lqlAT8AAJSs
 YvurJGkAK4wGvwdXq9NmwM2ui7niVuxfz5SxGog4XPgsNQWfbpOYzLCTVMiAwbSayuQf
 2B7LK1GTtAJ8WVm8THIaimPgMAWHYWJC7HZDgFQjH2VD+HmZ5MstGW3IOsZHoD4sGGjN
 n0psC5N30Gu7cQuenDlGgpVS0azff0Yz1eyDHxJ+npLD6Xel987vfKM/B6dSyemNGQna GA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m6unv0493-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Dec 2022 11:52:34 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B1BlLur028650;
 Thu, 1 Dec 2022 11:52:34 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m6unv048c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Dec 2022 11:52:34 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2B1Bq0sr004326;
 Thu, 1 Dec 2022 11:52:31 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 3m3ae9d9ew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Dec 2022 11:52:31 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2B1BqS0i8061450
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Dec 2022 11:52:28 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2C3C11C04A;
 Thu,  1 Dec 2022 11:52:27 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE97D11C04C;
 Thu,  1 Dec 2022 11:52:26 +0000 (GMT)
Received: from [9.171.21.111] (unknown [9.171.21.111])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  1 Dec 2022 11:52:26 +0000 (GMT)
Message-ID: <ea965d1c-ab6a-5aa3-8ce3-65b8177f6320@linux.ibm.com>
Date: Thu, 1 Dec 2022 12:52:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v12 6/7] s390x/cpu_topology: activating CPU topology
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 scgl@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com,
 clg@kaod.org
References: <20221129174206.84882-1-pmorel@linux.ibm.com>
 <20221129174206.84882-7-pmorel@linux.ibm.com>
 <fcedb98d-4333-9100-5366-8848727528f3@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <fcedb98d-4333-9100-5366-8848727528f3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hw5nlMbfqsyN_fVcQdkhbpDyG2meUXbn
X-Proofpoint-ORIG-GUID: -ohskUUqf2S37VIPWiEAwvjH6hPLS4n8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_04,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 spamscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212010083
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 12/1/22 11:15, Thomas Huth wrote:
> On 29/11/2022 18.42, Pierre Morel wrote:
>> The KVM capability, KVM_CAP_S390_CPU_TOPOLOGY is used to
>> activate the S390_FEAT_CONFIGURATION_TOPOLOGY feature and
>> the topology facility for the guest in the case the topology
>> is available in QEMU and in KVM.
>>
>> The feature is fenced for SE (secure execution).
> 
> Out of curiosity: Why does it not work yet?
> 
>> To allow smooth migration with old QEMU the feature is disabled by
>> default using the CPU flag -disable-topology.
> 
> I stared at this code for a while now, but I have to admit that I don't 
> quite get it. Why do we need a new "disable" feature flag here? I think 
> it is pretty much impossible to set "ctop=on" with an older version of 
> QEMU, since it would require the QEMU to enable 
> KVM_CAP_S390_CPU_TOPOLOGY in the kernel for this feature bit - and older 
> versions of QEMU don't set this capability yet.
> 
> Which scenario would fail without this disable-topology feature bit? 
> What do I miss?

The only scenario it provides is that ctop is then disabled by default 
on newer QEMU allowing migration between old and new QEMU for older 
machine without changing the CPU flags.

Otherwise, we would need -ctop=off on newer QEMU to disable the topology.


> 
>> Making the S390_FEAT_CONFIGURATION_TOPOLOGY belonging to the
>> default features makes the -ctop CPU flag is no more necessary,
> 
> too many verbs in this sentence ;-)

definitively :)

> 
>> turning the topology feature on is done with -disable-topology
>> only.
> ...
> 
>   Thomas
> 
> 

-- 
Pierre Morel
IBM Lab Boeblingen

