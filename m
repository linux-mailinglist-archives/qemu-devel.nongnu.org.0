Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B50664A563
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 18:00:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4m9K-0000bm-6l; Mon, 12 Dec 2022 11:59:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1p4m9H-0000bS-Md
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:59:27 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1p4m9F-00022Z-Oo
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:59:27 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCG4fCT028878
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 16:59:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=S0zvxd7aI3VMJEvXstZVaMONT7zY35sPquoqA19eGTs=;
 b=GGa0kFuYr+NPwCVFOuRTT05ZawF4krAwrrGZP0VQl0biwSaDrLBCJQoAGxUKhZZPRXGd
 tqeNPKJfA5W6MYTKDhIUH2a5n52JDNCo/xm6lV/x9MWanykiJ4AHwEiMgr/qe876bkue
 LDLQdBXEa4PGSYDPrhH5z5a1olLumt0x5WyfEwg+0fAhoa9xnF66+5g1toHdRqlpV57Y
 E6u+G7+0iTHxRNDwzDfXqaiqT5Fa+rT+a2PIeDa0/u3RwJssMwg2q9W4X6SevVs1LN/Q
 GH4QaFXt71VFslJAZFHmZX3mCIbLNO8eCSuKRo1Wf70KqFeOX2B+rTYqtn36ZGzvFZtu fw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3me7gnshfm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 16:59:24 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BCGtrfb024868
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 16:59:23 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3me7gnshfd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 16:59:23 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2BCEqNfe030360;
 Mon, 12 Dec 2022 16:59:23 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3mchr6hrew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 16:59:22 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BCGxLNR56230352
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 16:59:21 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF4A658056;
 Mon, 12 Dec 2022 16:59:20 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8AC8158052;
 Mon, 12 Dec 2022 16:59:20 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 12 Dec 2022 16:59:20 +0000 (GMT)
Message-ID: <f76810cb-3658-84b0-e4b4-a684dff99f38@linux.ibm.com>
Date: Mon, 12 Dec 2022 11:59:20 -0500
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
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <b06d31496117c8dd8b8fe60c4bebd96377ca3ff1.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: C7Uhrex9H8jeXuL3loygnsrtMaTeFceI
X-Proofpoint-GUID: 5p4xprljmhST3flSeC8H6PVPAr0tLh_k
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=622
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120150
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
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



On 12/12/22 11:38, James Bottomley wrote:
> On Mon, 2022-12-12 at 15:47 +0000, Daniel P. Berrangé wrote:
>> Copy'ing Markus for QAPI design feedback.
>>
>> On Sat, Dec 10, 2022 at 12:10:18PM -0500, James Bottomley wrote:
>>> The Microsoft Simulator (mssim) is the reference emulation platform
>>> for the TCG TPM 2.0 specification.
>>>
>>> https://github.com/Microsoft/ms-tpm-20-ref.git
>>>
>>> It exports a fairly simple network socket baset protocol on two
>>> sockets, one for command (default 2321) and one for control
>>> (default 2322).  This patch adds a simple backend that can speak
>>> the mssim protocol over the network.  It also allows the host, and
>>> two ports to be specified on the qemu command line.  The benefits
>>> are twofold: firstly it gives us a backend that actually speaks a
>>> standard TPM emulation protocol instead of the linux specific TPM
>>> driver format of the current emulated TPM backend and secondly,
>>> using the microsoft protocol, the end point of the emulator can be
>>> anywhere on the network, facilitating the cloud use case where a
>>> central TPM service can be used over a control network.
>>
>> What's the story with security for this ?  The patch isn't using
>> TLS, so talking to any emulator over anything other than localhost
>> looks insecure, unless I'm missing something.
> 
> Pretty much every TPM application fears interposers and should thus be
> using the TPM transport security anyway. *If* this is the case, then
> the transport is secure.  Note that this currently isn't the case for

What about all the older kernels that are out there?

> the kernel use of the TPM, but I'm trying to fix that.  The standard
> mssim server is too simplistic to do transport layer security, but like
> everything that does this (or rather doesn't do this), you can front it
> with stunnel4.

And who or what is going to set this up?

    Stefan

