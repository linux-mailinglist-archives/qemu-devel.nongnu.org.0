Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F27364A7C6
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 20:00:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4o0h-0007mu-JN; Mon, 12 Dec 2022 13:58:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1p4o0d-0007me-UM
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 13:58:40 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1p4o0b-0001hI-Q2
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 13:58:39 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCGsiJi015457
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 18:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=VQpp+g4IuGuhhCjnx0XOLwzgpSI5/1ucxeQUZwNK1ds=;
 b=kXGuSASP7iD4HWYVPjjRQkKBaZBjJ8uYpHFPDLImhYrEcIGLTxyPRARbtYmItu6u0wVb
 i+zapwwrSWflo6VBEgrLSrhb59Dk/6dTVIZNTwzlzJJCxqh/7wIGULeUSiETq1CBRzCH
 WChnOGUoWPy8UHw1aCz4CoYWUkoY3rurGEyVizG54JkxVC+Djj6+x/ezZXZZg4xZDv92
 NJOonsIQTz6E0PzPjaiMAgAbWChVTcLtTXsk4y+yiEsnzBCsSLnWc/n/akRzXvMbVB2Q
 sh4eP4OnRe4gixwwuDbYO9lP0yoMIDMtxniy5NuMzwzWxePi1oFGG8lX7+UvgMZOrYjE WA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3me87xju09-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 18:58:32 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BCIsqJq015208
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 18:58:32 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3me87xjtyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 18:58:32 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2BCHcP17004339;
 Mon, 12 Dec 2022 18:58:31 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
 by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3mchr6eqsq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 18:58:31 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com
 [10.39.53.230])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BCIwUev50594268
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 18:58:30 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3724658054;
 Mon, 12 Dec 2022 18:58:30 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B66D158062;
 Mon, 12 Dec 2022 18:58:29 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 12 Dec 2022 18:58:29 +0000 (GMT)
Message-ID: <c3fa7405-7d4c-a686-d4c3-a3ff74864467@linux.ibm.com>
Date: Mon, 12 Dec 2022 13:58:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] tpm: add backend for mssim
Content-Language: en-US
To: jejb@linux.ibm.com, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <4780481659602f92fffacac66e7dca41ad2787c4.camel@linux.ibm.com>
 <Y5dNC77CubqrfXku@redhat.com>
 <b06d31496117c8dd8b8fe60c4bebd96377ca3ff1.camel@linux.ibm.com>
 <f76810cb-3658-84b0-e4b4-a684dff99f38@linux.ibm.com>
 <8066be497c4c81827b24a672a550a805e06eec68.camel@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <8066be497c4c81827b24a672a550a805e06eec68.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tkhu8CzozMzU97JJXHUhP6FPbqudobAT
X-Proofpoint-GUID: 6aHJ7oS8l7PfOas5oyO6g2nr1fUvyQHR
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 impostorscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 mlxlogscore=664 spamscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120168
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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



On 12/12/22 13:48, James Bottomley wrote:
> On Mon, 2022-12-12 at 11:59 -0500, Stefan Berger wrote:
>>
>>
>> On 12/12/22 11:38, James Bottomley wrote:
>>> On Mon, 2022-12-12 at 15:47 +0000, Daniel P. Berrangé wrote:
>>>> Copy'ing Markus for QAPI design feedback.
>>>>
>>>> On Sat, Dec 10, 2022 at 12:10:18PM -0500, James Bottomley wrote:
>>>>> The Microsoft Simulator (mssim) is the reference emulation
>>>>> platform for the TCG TPM 2.0 specification.
>>>>>
>>>>> https://github.com/Microsoft/ms-tpm-20-ref.git
>>>>>
>>>>> It exports a fairly simple network socket baset protocol on two
>>>>> sockets, one for command (default 2321) and one for control
>>>>> (default 2322).  This patch adds a simple backend that can
>>>>> speak the mssim protocol over the network.  It also allows the
>>>>> host, and two ports to be specified on the qemu command line.
>>>>> The benefits are twofold: firstly it gives us a backend that
>>>>> actually speaks a standard TPM emulation protocol instead of
>>>>> the linux specific TPM driver format of the current emulated
>>>>> TPM backend and secondly, using the microsoft protocol, the end
>>>>> point of the emulator can be anywhere on the network,
>>>>> facilitating the cloud use case where a central TPM service can
>>>>> be used over a control network.
>>>>
>>>> What's the story with security for this ?  The patch isn't using
>>>> TLS, so talking to any emulator over anything other than
>>>> localhost looks insecure, unless I'm missing something.
>>>
>>> Pretty much every TPM application fears interposers and should thus
>>> be using the TPM transport security anyway. *If* this is the case,
>>> then the transport is secure.  Note that this currently isn't the
>>> case for
>>
>> What about all the older kernels that are out there?
> 
> No current kernel uses transport security.  In the event the patch
> eventually gets upstream, the kernel be secure against interposer
> attacks going forwards.  I would imagine there might be pressure to
> backport the patch given the current level of worry about interposers.
> 
>>> the kernel use of the TPM, but I'm trying to fix that.  The
>>> standard mssim server is too simplistic to do transport layer
>>> security, but like everything that does this (or rather doesn't do
>>> this), you can front it with stunnel4.
>>
>> And who or what is going to set this up?
> 
> I'm not sure I understand the question.  Stunnel4 is mostly used to
> convert unencrypted proxies like imap on 143 or smtp on 25 to the
> secure version.  Most people who run servers are fairly familiar with
> using it.  It's what IBM used for encrypted migration initially.  You
> can run stunnel on both ends, or the qemu side could be built in using
> the qemu tls-creds way of doing things but anything running the
> standard MS server would have to front it with stunnel still.


So it's up to libvirt to setup stunnel to support a completely different setup than what it has for swtpm already?

    Stefan

> 
> James
> 

