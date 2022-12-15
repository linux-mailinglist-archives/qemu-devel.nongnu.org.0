Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FDA64E247
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 21:23:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5ukQ-0007lh-5K; Thu, 15 Dec 2022 15:22:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1p5ukN-0007lX-Lc
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 15:22:27 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1p5ukL-0001oH-ME
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 15:22:27 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BFKDQ6A022275
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 20:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=i6Ap+y3AUts8qTmkNTFdvDyCaYBipjhhmj5eZr8mtW0=;
 b=XbHWUT3B9gAY3Kq4k+nDyiEjsd7t9y45Rt5heWc4je68lOyZ4Yjm1I+dQwT1QVYmhBOj
 ooKIsaXcfqBTORfFn1RM0qIz7q3lvZAbu/xHUpY/ZtvmyX6eVTQaP/YJgyhQSMdWu9E8
 z0DP4eOiaiSlRHZv9saWJkP160j/840NeDYovpNT3D/8aBWUIu29dncieecuQdti2JQT
 0Vq+EQ/8TPHa97irkzRph/HybGfiYWI9vEgNgXKHRVi+rEKQNhZzdOgkYDVEKjZnHxFe
 u0dEiS1fSruYIhHHbm79uWqeMShOMTw1QFKrJ8x+7+tCVy2QI77OcYad0w/axIwOAOaP aA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mg938j9ks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 20:22:23 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BFK3W9l019435
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 20:22:23 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mg938j9kd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 20:22:23 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BFKGABa019280;
 Thu, 15 Dec 2022 20:22:22 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3mf03agn3a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 20:22:22 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com
 [10.241.53.102])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BFKMKUu45547996
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Dec 2022 20:22:21 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0ED55805A;
 Thu, 15 Dec 2022 20:22:20 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 609FD5803F;
 Thu, 15 Dec 2022 20:22:20 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 15 Dec 2022 20:22:20 +0000 (GMT)
Message-ID: <9fac7d95-d891-413f-93f1-18324c7943ea@linux.ibm.com>
Date: Thu, 15 Dec 2022 15:22:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/2] tpm: add backend for mssim
Content-Language: en-US
To: jejb@linux.ibm.com, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20221215180125.24632-1-jejb@linux.ibm.com>
 <20221215180125.24632-3-jejb@linux.ibm.com>
 <b5cafbd3-d529-3a84-0604-c49aa30bf916@linux.ibm.com>
 <6fd1144d09777ddcdb7a1a1ba58cbbec345da9ef.camel@linux.ibm.com>
 <e77a3a76-c874-d279-52bf-18a4e3a36ba2@linux.ibm.com>
 <77bc5a11fcb7b06deba1c54b1ef2de28e0c53fb1.camel@linux.ibm.com>
 <10fbda0f-7c8a-3819-fb22-34a9249ac138@linux.ibm.com>
 <b5d26ab0e54c15c408e9bae136bce969283ed5bd.camel@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <b5d26ab0e54c15c408e9bae136bce969283ed5bd.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gJPlviOpQb5xW1MJsy2b9h-aHjGgvu0V
X-Proofpoint-ORIG-GUID: W-ucIBR7-3p6DeZn5WShYPh86Z6p9SgD
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-15_11,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212150168
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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



On 12/15/22 15:07, James Bottomley wrote:
> On Thu, 2022-12-15 at 14:57 -0500, Stefan Berger wrote:
>> On 12/15/22 14:40, James Bottomley wrote:
>>> On Thu, 2022-12-15 at 14:35 -0500, Stefan Berger wrote:
> [...]
>>>> You should also add a description to docs/specs/tpm.rst.
>>>
>>> Description of what?  It functions exactly like passthrough on
>>
>> Please describe all the scenarios so that someone else can repeat
>> them when trying out **your** device.
>>
>> There are sections describing how things for swtpm and you should add
>> how things work for the mssim TPM.
>>
>> https://github.com/qemu/qemu/blob/master/docs/specs/tpm.rst#the-qemu-tpm-emulator-device
>> https://github.com/qemu/qemu/blob/master/docs/specs/tpm.rst#migration-with-the-tpm-emulator
> 
> The passthrough snapshot/restore isn't described there either.  This

Forget about passthrough, rather compare it to swtpm.

> behaves exactly the same in that it's caveat emptor.  If something
> happens in the interim to upset the TPM state then the restore will
> have unexpected effects due to the externally changed TPM state.  This
> is actually a feature: I'm checking our interposer defences by doing
> external state manipulation.
> 
>>> migration.  Since the TPM state is retained in the server a
>>> reconnection just brings everything back to where it was.
>>
>> So it's remote. And the ports are always open and someone can just
>> connect to the open ports and power cycle the device?
> 
> in the same way as you can power off the hardware and have issues with
> a passthrough TPM on vm restore, yes.

I don't thinkyou should compare the mssim TPM with passthrough but rather with swtpm emulator + tpm_emulator backend. That's a much better comparison.

> 
>> This may not be the most important scenario but nevertheless I
>> wouldn't want to deal with bug reports if someone does 'VM
>> snapshotting' -- how this is correctly handled would be of interest.
> 
> I'd rather say nothing, like passthrough, then there are no
> expectations beyond it might work if you know what you're doing.  I

Why do we need this device then if it doesn't handle migration scenarios in the same or better way than swtpm + tpm_emulator backends already do?

> don't really have much interest in the migration use case, but I knew
> it should work like the passthrough case, so that's what I tested.

I think your device needs to block migrations since it doesn't handle all migration scenarios correctly.

    Stefan

> 
> James
> 

