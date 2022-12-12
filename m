Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C706864A465
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 16:48:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4l1L-0008I7-EU; Mon, 12 Dec 2022 10:47:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1p4l1B-0008Gp-F8
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 10:47:03 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1p4l19-0000WH-8z
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 10:47:01 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCE8s4N030224
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 15:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=BApjecGSsNCkvyto4huFV04lLz3pQSltQGD/oouWTzA=;
 b=JPXk4tDBWrxjUs08IUp/ncKIGQSldo9ZZcU8e2pbtmQSBU4XmUNHH8M8g5NGmHghUts7
 UWYmw+T6poAqqXkBUc0/MMF6a+wlUKYpq6+JMZvhaPSI7+XDBxGCH0+y7lQlSdsWgadN
 fBak0gvhEfvcSRpY1+ZjmzoCo7k41STGTFJJ75JO1CbNXRMSCwKS1wPWNfbOIh2dIyUS
 ZLxJ+X+J00RizImXjGwGmMgyaOD0zVIW1fgWwFxKQltGNWMbor6AezSgGLA367kS3YOc
 CGIEqeWAxib2ZehPVTfZF+vpNJfOiHEZzgoRu2cg1u5aZi2ZRWrk/k0VT0JNjxFX9VgE 6g== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3md40kv63y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 15:46:57 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2BCEefV7011450
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 15:46:55 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
 by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3mchr6duex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 15:46:55 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BCFksvD23397042
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 15:46:54 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D89558056;
 Mon, 12 Dec 2022 15:46:54 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19FD35804C;
 Mon, 12 Dec 2022 15:46:54 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 12 Dec 2022 15:46:53 +0000 (GMT)
Message-ID: <82627f1c-c162-7304-98c3-08ace0b3f2c6@linux.ibm.com>
Date: Mon, 12 Dec 2022 10:46:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] tpm: add backend for mssim
Content-Language: en-US
To: jejb@linux.ibm.com, qemu-devel@nongnu.org
References: <4780481659602f92fffacac66e7dca41ad2787c4.camel@linux.ibm.com>
 <b81db56b-9044-d569-7de2-5388f6958461@linux.ibm.com>
 <b7c4c45c2bcbcf5c2b111a978297c5bb07b49498.camel@linux.ibm.com>
 <b1cf9866-d28a-05c3-1f10-8745f9e43c44@linux.ibm.com>
 <4dae1219d816277085fcb82979cf6cded6a1bd6b.camel@linux.ibm.com>
 <9cc63b28-6700-59b3-1d4d-b89a4744a09b@linux.ibm.com>
 <43465b20acc0b120ed49330d2f985534d0b2fc60.camel@linux.ibm.com>
 <d7529c39-8236-5490-a1c0-59249ca61e46@linux.ibm.com>
 <4f719a60a82c1d3d335ff8a35fe65ffb3cf23be7.camel@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <4f719a60a82c1d3d335ff8a35fe65ffb3cf23be7.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tunAX_RbpN2w5p1618vu7PonPvNnLw8Z
X-Proofpoint-ORIG-GUID: tunAX_RbpN2w5p1618vu7PonPvNnLw8Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 phishscore=0 mlxlogscore=901 impostorscore=0 suspectscore=0 spamscore=0
 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120141
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



On 12/12/22 10:28, James Bottomley wrote:
> On Mon, 2022-12-12 at 10:20 -0500, Stefan Berger wrote:
>> On 12/12/22 09:47, James Bottomley wrote:
> [...]
>>> I don't actually use virsh in my harness.  I'm mostly interested in
>>> the running the kernel TPM selftests against the reference model.
>>> But I anticipate it wouldn't currently work because I don't believe
>>> virsh triggers a S3 event which is why snapshot and migration
>>> doesn't always work with PCI passthrough.
>>
>> Then I think you should at least add a blocker to your model so that
>> suspend/resume/snapshotting/migration are all disabled because the
>> mssim reference implementation doesn't support permanent & volatile
>> state suspend/resume (and upgrading!) without significant work on it
>> as can be seen in libtpms.
> 
> Actually, I would think adding support, if that's what people wanted,
> would be pretty simple.  Since the network end point is the identifier,
There's VM snapshotting as well where things are not as simple. Host reboot is a bit of a challenge when your TPM 2 emulator doesn't support permanent AND volatile state marshalling and unmarshalling. Upgrading the reference model has also been a challenge in the past where it couldn't read old state anymore when new pieces were added to the state. These were areas where efforts went into libtpms for example. This is not to say that everything is perfect with libtpms and swptm since they have thier own challenges but they have at least resolved some of the issues.

> the protocol would be not to power down the TPM on suspend/resume and
> simply to send TPM_STOP to close down the sockets gracefully.  Then the
> next connection picks up the state where the previous one left off.
> 
>> Why would we support another model for the backend that provides no
>> advantages over what is there right now?
> 
> The advantages were what was stated: ability to connect to the MS
> reference model directly and no dependence on the Linux VTPM_PROXY
> protocol.

We already have a working TPM 2 emulator that does support VM suspend/resume/snapshotting and migration. If you want to become maintainer of your backend model and everything associated with it, please add yourself to the MAINTAINERS list.

> 
> James
> 

