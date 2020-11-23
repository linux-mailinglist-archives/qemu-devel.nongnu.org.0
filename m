Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B77D72C0123
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 09:10:23 +0100 (CET)
Received: from localhost ([::1]:34226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh6vV-0005Sx-I7
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 03:10:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kh6tK-0003hn-1N; Mon, 23 Nov 2020 03:08:06 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:9220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kh6tE-0006OA-0t; Mon, 23 Nov 2020 03:08:05 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AN81tCC088490; Mon, 23 Nov 2020 03:07:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=H9qsDqnApA16hwleIbkOJ4lIcwI2Iux9bOezob7Qw3I=;
 b=izDe5jqgFelUFu84W65X5KZ3QqD8hmMmS3RGuYXcIdqDYnLADKdT8zCskBMbNfukvuMJ
 9zfROymVfcIdF592dBi+NBt5WU6R3dqAki3jwGX847ST8jLXYEU0N+5ssb3RZjgyP90U
 UJHQ1fsvWqmqTgIB2jdfO9MaomEWKpkT6BWIrBvZTm75hQLgeHVMwayLHVgcxCtxgaG8
 6zHZ7JOr+O3/6hcalBpaJnLRBpNObg1PyVjZOfCcOKe7YSQcW7OuNOcCD9SGiSpg8Yhf
 Qu4H3ocBTox/vQC3zoxPiEN93X0IIXfnO5lC9Tiug6PkzAWYNv5uHr9+ApnRfhsjtsNM pg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34xvnhn5va-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Nov 2020 03:07:57 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AN828h0089515;
 Mon, 23 Nov 2020 03:07:57 -0500
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34xvnhn5u0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Nov 2020 03:07:57 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AN81gsY023274;
 Mon, 23 Nov 2020 08:07:55 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 34xth8956k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Nov 2020 08:07:54 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AN87quC9437888
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Nov 2020 08:07:52 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F34E4C082;
 Mon, 23 Nov 2020 08:07:50 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36A554C05C;
 Mon, 23 Nov 2020 08:07:50 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.54.238])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 23 Nov 2020 08:07:50 +0000 (GMT)
Subject: Re: [PATCH v2 2/2] pc-bios: s390x: Clear out leftover S390EP string
To: Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20201120160117.59366-1-farman@linux.ibm.com>
 <20201120160117.59366-3-farman@linux.ibm.com>
 <e29df739-baca-cd0a-d1d9-a690c0238ca4@de.ibm.com>
 <4738082f-ec10-e2a3-7756-9180a57329bb@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <1ad47eb6-5aca-a766-3bad-aa38924b5ef8@de.ibm.com>
Date: Mon, 23 Nov 2020 09:07:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <4738082f-ec10-e2a3-7756-9180a57329bb@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-23_02:2020-11-20,
 2020-11-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011230052
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Jason Herne <jjherne@linux.ibm.com>, qemu-s390x@nongnu.org,
 Janosch Frank <frankja@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 23.11.20 09:05, Thomas Huth wrote:
> On 23/11/2020 08.39, Christian Borntraeger wrote:
>> On 20.11.20 17:01, Eric Farman wrote:
>>> A Linux binary will have the string "S390EP" at address 0x10008,
>>> which is important in getting the guest up off the ground. In the
>>> case of a reboot (specifically chreipl going to a new device),
>>> we should defer to the PSW at address zero for the new config,
>>> which will re-write "S390EP" from the new image.
>>>
>>> Let's clear it out at this point so that a reipl to, say, a DASD
>>> passthrough device drives the IPL path from scratch without disrupting
>>> disrupting the order of operations for other boots.
>>>
>>> Rather than hardcoding the address of this magic (again), let's
>>> define it somewhere so that the two users are visibly related.
>>
>>
>> Hmmm, this might have side effects, e.g. if you do something like a kdump
>> or kexec to a non-Linux binary that happens to have code at 0x10008, no?
> 
> Do these scenarios really go through the s390-ccw bios again, or do they
> rather bypass the bios and jump directly into the new kernel?

Right they jump directly into the new kernel. So this patch could actually
be "good enough" for 5.2 as is?

