Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2AF64A9E9
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 23:03:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4qsz-0008Mg-9I; Mon, 12 Dec 2022 17:02:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1p4qsu-0008LX-Cu
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 17:02:53 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1p4qss-0007Wz-8O
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 17:02:52 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCLoVmh013283
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 22:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=NNRo1ms+wXtPHmtx8hsB+w+axnn1dC/37aMDE4K+QIo=;
 b=WFy4qQX28OrjNbgCJBUse8rxxI8NENlaHRKklNifQWNXc4OMd14ZsNfKXjM74Hymdkl/
 lb+E0fo6bfI921wwloRgNeUCo9f1hvPXMHbrNNnSWZ5ZoD5mEOrsbGs5LLnPBtBngiv6
 mvee9dafmDciugc0NHsPXJFB7dskd6UborJGV8zt7Y3m0ZCFZ4mwhlMV9DV70murY/2A
 7up+ksh9ui6GSJIjoErjDBoWRdx5sIWhj8Lu1XyejGVGR+Lpjwpx0hjTVOqM2NeATKfu
 1c3hkbDJTL0xNnLS8FRL1qKe5XDqHZizBWTq3JyN+EyTG6ztm9f6AVdm+8NVq6YKcy3u Sg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mecjs080m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 22:02:47 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BCLp3Db016748
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 22:02:47 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mecjs0803-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 22:02:47 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BCL2bV6032045;
 Mon, 12 Dec 2022 22:02:45 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
 by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3mchr67gx3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 22:02:45 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com
 [10.39.53.233])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BCM2imh7340558
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 22:02:44 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B8E915803F;
 Mon, 12 Dec 2022 22:02:44 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38B6558054;
 Mon, 12 Dec 2022 22:02:44 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 12 Dec 2022 22:02:44 +0000 (GMT)
Message-ID: <f7119c81-e571-382b-84c6-628747cd9e0b@linux.ibm.com>
Date: Mon, 12 Dec 2022 17:02:43 -0500
MIME-Version: 1.0
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
 <c3fa7405-7d4c-a686-d4c3-a3ff74864467@linux.ibm.com>
 <92daee895872aab2047c3768a9c67b1839406568.camel@linux.ibm.com>
 <dc520ab2-04db-b8cb-15fd-871bb1da0d1b@linux.ibm.com>
 <d2262d8bd5a1d53cb1d4c32e0424dc8727372265.camel@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <d2262d8bd5a1d53cb1d4c32e0424dc8727372265.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FxDTthgZuVkPs0o1THYvWw0jlas3OrQR
X-Proofpoint-ORIG-GUID: bCQxIDdDoZmeqN0itujOgLYHYVjG4HyE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212120189
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



On 12/12/22 16:36, James Bottomley wrote:
> On Mon, 2022-12-12 at 14:32 -0500, Stefan Berger wrote:
>>
>>
>> On 12/12/22 14:12, James Bottomley wrote:
>>> On Mon, 2022-12-12 at 13:58 -0500, Stefan Berger wrote:
>>>> On 12/12/22 13:48, James Bottomley wrote:
>>>>> On Mon, 2022-12-12 at 11:59 -0500, Stefan Berger wrote:
>>>>>> On 12/12/22 11:38, James Bottomley wrote:
>>> [...]
>>>>>>> the kernel use of the TPM, but I'm trying to fix that.  The
>>>>>>> standard mssim server is too simplistic to do transport
>>>>>>> layer
>>>>>>> security, but like everything that does this (or rather
>>>>>>> doesn't
>>>>>>> do this), you can front it with stunnel4.
>>>>>>
>>>>>> And who or what is going to set this up?
>>>>>
>>>>> I'm not sure I understand the question.  Stunnel4 is mostly
>>>>> used to
>>>>> convert unencrypted proxies like imap on 143 or smtp on 25 to
>>>>> the
>>>>> secure version.  Most people who run servers are fairly
>>>>> familiar
>>>>> with using it.  It's what IBM used for encrypted migration
>>>>> initially.  You can run stunnel on both ends, or the qemu side
>>>>> could be built in using the qemu tls-creds way of doing things
>>>>> but
>>>>> anything running the standard MS server would have to front it
>>>>> with
>>>>> stunnel still.
>>>>
>>>> So it's up to libvirt to setup stunnel to support a completely
>>>> different setup than what it has for swtpm already?
>>>
>>> I don't think so, no.  Libvirt doesn't usually help with server
>>> setup (witness the complexity of setting up a server side vtpm
>>> proxy) so in the case tls-creds were built in, it would just work
>>> if the object is
>>
>> I see, so you are extending the TPM emulator with TLS on the client
>> side so you don't need another tool to setup a TLS connection from
>> the QEMU/client side.
> 
> I didn't say I would do this, just that it's an easy possibility with
> the current qemu framework.  I actually need to fiddle with the TPM
> externally to do some of my testing (like platform reset injection) so
> I won't use TLS anyway.
> 
>> Is the server side across the network or on the same host?
> 
> It can be either.

For the remote TPM you'll need some sort of management stack (who is building this?) that does the port assignments (allocations and freeing, starting of TPM instances etc) for the possibly many TPMs you would run on a remote machine and then create the libvirt XML or QEMU command line with the port assignments. I am not sure I see the advantage of this versus what we have at the moment with a single management stack . Also, if you did this you'd have a single point of failure for many VMs whose TPM is presumably running on some dedicated machine(s).

> 
>>   Either way, what is the latency that this introduces because I would
>> expect that this slows down IMA since the PCR extensions & TPM 2
>> response now go back and forth across the network?
> 
> Most data centre protocols are now encrypted and networked (NVMeoF
> would probably be the poster child) with no real ill effects.  In terms
> of a TPM, the competition is an underpowered discrete chip over a slow
> serial bus, so I think we'll actually improve the latency not diminish
> it.

Compared to QEMU and swtpm talking over a local socket you probably have a decent amount of slow-down if this is over the network.
I still fail to see the advantage over what we have at the moment. Also I don't see what advantage the mssim protocol brings over what swtpm provides. If you are willing to do a 'dnf -y install swtpm_setup' and start the VM via libvirt it really doesn't matter what protocol the TPM is running underneath since it's all transparent.

    Stefan

> 
> James
> 

