Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 587933F0DA0
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 23:44:30 +0200 (CEST)
Received: from localhost ([::1]:48322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGTML-0004kF-Cs
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 17:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobin@linux.ibm.com>)
 id 1mGTKP-0002i9-Fc
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:42:29 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:2570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobin@linux.ibm.com>)
 id 1mGTKN-000745-0O
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:42:28 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17ILXQv3127870; Wed, 18 Aug 2021 17:42:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=X/ZVamOOUM56zqGVXqXhKtm9nuRDiqFsLspvE+SmSLo=;
 b=Fvj1hqL2lX7upR5AKfgOxrK5khFyoj7tgvK5eayO5RO/p+KTsWI4b6x4NesYPKNm3N+A
 URI+oGD7GOKl59wIxAqQlDVaDpjg2aAcHe+JBVkAhElx+1p0Ulv4XckKKPu8kpwu3W95
 1nDtBvZFb9ut851FY4wAOxancWRI6DH2yfhnN2Dxec+YgHDSavkSCbKJF1U3KMphzUKq
 m6NWsRLWUUwJ+1Dret7m4WmnRasCZX7mUQKIL6KhJ6s15++/dkbNYeJ9WD36XpXAGNyb
 KFOcnaO5VEq9ygvgefhMfuO8Mq5MtTreEM/4HZK/qicBCanJnaj+yHfcvNkxXBO4tpUP Dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3agcf6uq2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Aug 2021 17:42:21 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17ILXXVR128249;
 Wed, 18 Aug 2021 17:42:20 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3agcf6uq1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Aug 2021 17:42:20 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17ILaRXd000505;
 Wed, 18 Aug 2021 21:42:19 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02wdc.us.ibm.com with ESMTP id 3ae5fe5nwm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Aug 2021 21:42:19 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17ILgHhn8389206
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Aug 2021 21:42:18 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3E6CAE07D;
 Wed, 18 Aug 2021 21:42:17 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76D89AE06D;
 Wed, 18 Aug 2021 21:42:17 +0000 (GMT)
Received: from Tobins-MacBook-Pro-2.local (unknown [9.77.128.89])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 18 Aug 2021 21:42:17 +0000 (GMT)
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <cover.1629118207.git.ashish.kalra@amd.com>
 <CABayD+fyrcyPGg5TdXLr95AFkPFY+EeeNvY=NvQw_j3_igOd6Q@mail.gmail.com>
 <0fcfafde-a690-f53a-01fc-542054948bb2@redhat.com>
 <37796fd1-bbc2-f22c-b786-eb44f4d473b9@linux.ibm.com>
 <CABayD+evf56U4yT2V1TmEzaJjvV8gutUG5t8Ob2ifamruw5Qrg@mail.gmail.com>
 <458ba932-5150-8706-3958-caa4cc67c8e3@linux.ibm.com>
 <YR1ZvArdq4sKVyTJ@work-vm>
From: Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Message-ID: <c1d8dbca-c6a9-58da-6f95-b33b74e0485a@linux.ibm.com>
Date: Wed, 18 Aug 2021 17:42:16 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YR1ZvArdq4sKVyTJ@work-vm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: O_1Qqnfk-yDoDkmanszpGR48sMJ1efjy
X-Proofpoint-GUID: lczFpwtEUJtXdyY0Y1zatQYDEk_mM86E
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-18_07:2021-08-17,
 2021-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 mlxscore=0 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108180132
Received-SPF: pass client-ip=148.163.156.1; envelope-from=tobin@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: thomas.lendacky@amd.com, Ashish Kalra <Ashish.Kalra@amd.com>,
 brijesh.singh@amd.com, ehabkost@redhat.com, kvm@vger.kernel.org,
 mst@redhat.com, Steve Rutherford <srutherford@google.com>,
 richard.henderson@linaro.org, jejb@linux.ibm.com, tobin@ibm.com,
 qemu-devel@nongnu.org, frankeh@us.ibm.com, Paolo Bonzini <pbonzini@redhat.com>,
 dovmurik@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 3:04 PM, Dr. David Alan Gilbert wrote:
> * Tobin Feldman-Fitzthum (tobin@linux.ibm.com) wrote:
>> On 8/17/21 6:04 PM, Steve Rutherford wrote:
>>> Ahh, It sounds like you are looking into sidestepping the existing
>>> AMD-SP flows for migration. I assume the idea is to spin up a VM on
>>> the target side, and have the two VMs attest to each other. How do the
>>> two sides know if the other is legitimate? I take it that the source
>>> is directing the LAUNCH flows?
>> Yeah we don't use PSP migration flows at all. We don't need to send the MH
>> code from the source to the target because the MH lives in firmware, which
>> is common between the two.
> Are you relying on the target firmware to be *identical* or purely for
> it to be *compatible* ?  It's normal for a migration to be the result of
> wanting to do an upgrade; and that means the destination build of OVMF
> might be newer (or older, or ...).
>
> Dave

This is a good point. The migration handler on the source and target 
must have the same memory footprint or bad things will happen. Using the 
same firmware on the source and target is an easy way to guarantee this. 
Since the MH in OVMF is not a contiguous region of memory, but a group 
of functions scattered around OVMF, it is a bit difficult to guarantee 
that the memory footprint is the same if the build is different.

-Tobin

>
>
>> We start the target like a normal VM rather than
>> waiting for an incoming migration. The plan is to treat the target like a
>> normal VM for attestation as well. The guest owner will attest the target VM
>> just like they would any other VM that is started on their behalf. Secret
>> injection can be used to establish a shared key for the source and target.
>>
>> -Tobin
>>
>>> --Steve
>>>

