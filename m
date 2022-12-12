Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1AD64A825
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 20:34:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4oXs-0000U7-Af; Mon, 12 Dec 2022 14:33:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1p4oXp-0000T8-8W
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 14:32:57 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1p4oXm-0006oM-4x
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 14:32:56 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCJD7bJ027543
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 19:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=WpQ4fLp30VSwIJKYeyitTHh6iu99BANLi1ouaS9RJhQ=;
 b=l167IyUicHJNQe/tsFErG/XAJKWi7tF3o9Na9Xkg2cBk2mxRV0JpEjr6atRgw4YAsiOV
 4eFYYi9Md0hdKuYTYfHOCJyspKM3R1nD3OZS03PKVYrIhxuyinFvXW2rg7y6IVuqGyrH
 2zRIXhprVL5PcS16pHtnCM43T+8ryAZS+jqoeCt9px0pJ1PLfgoAO7U6GG5MTibcCreC
 naJfp5qrKSr4sPXMOSCfyrJV1hYozNQB/+YfE8sCLcwsDvmO94vGW9l8owms2luHj2Sh
 3jtFmRjuN3HJeXDalMrOTN/ZckNwAbVcUq6r7WmQJXs8seSqTz7uFKCyZlpB1FSn0dAp WQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3me8g13ab5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 19:32:50 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BCJD7LO027469
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 19:32:50 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3me8g13aa6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 19:32:50 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BCHYrFj014243;
 Mon, 12 Dec 2022 19:32:49 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([9.208.129.116])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3mchr6tk5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 19:32:48 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com
 [10.241.53.101])
 by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BCJWlEW47776020
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 19:32:47 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13BCF5805C;
 Mon, 12 Dec 2022 19:32:47 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83E0758070;
 Mon, 12 Dec 2022 19:32:46 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 12 Dec 2022 19:32:46 +0000 (GMT)
Message-ID: <dc520ab2-04db-b8cb-15fd-871bb1da0d1b@linux.ibm.com>
Date: Mon, 12 Dec 2022 14:32:45 -0500
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
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <92daee895872aab2047c3768a9c67b1839406568.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8QBbIw2-026ZTA961Ka0FiDuo2X5RUaQ
X-Proofpoint-GUID: ccsl9f-UID8BhMWWtBQqL_rzCZdy8lha
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=555 clxscore=1015 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212120175
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



On 12/12/22 14:12, James Bottomley wrote:
> On Mon, 2022-12-12 at 13:58 -0500, Stefan Berger wrote:
>> On 12/12/22 13:48, James Bottomley wrote:
>>> On Mon, 2022-12-12 at 11:59 -0500, Stefan Berger wrote:
>>>> On 12/12/22 11:38, James Bottomley wrote:
> [...]
>>>>> the kernel use of the TPM, but I'm trying to fix that.  The
>>>>> standard mssim server is too simplistic to do transport layer
>>>>> security, but like everything that does this (or rather doesn't
>>>>> do this), you can front it with stunnel4.
>>>>
>>>> And who or what is going to set this up?
>>>
>>> I'm not sure I understand the question.  Stunnel4 is mostly used to
>>> convert unencrypted proxies like imap on 143 or smtp on 25 to the
>>> secure version.  Most people who run servers are fairly familiar
>>> with using it.  It's what IBM used for encrypted migration
>>> initially.  You can run stunnel on both ends, or the qemu side
>>> could be built in using the qemu tls-creds way of doing things but
>>> anything running the standard MS server would have to front it with
>>> stunnel still.
>>
>> So it's up to libvirt to setup stunnel to support a completely
>> different setup than what it has for swtpm already?
> 
> I don't think so, no.  Libvirt doesn't usually help with server setup
> (witness the complexity of setting up a server side vtpm proxy) so in
> the case tls-creds were built in, it would just work if the object is

I see, so you are extending the TPM emulator with TLS on the client side so you don't need another tool to setup a TLS connection from the QEMU/client side.

Is the server side across the network or on the same host? Either way, what is the latency that this introduces because I would expect that this slows down IMA since the PCR extensions & TPM 2 response now go back and forth across the network?

     Stefan

> specified.  The complexity is all on the server side to front it with
> stunnel.
>
> James
> 

