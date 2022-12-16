Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 890DC64EB6E
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 13:29:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p69pw-00005j-Uk; Fri, 16 Dec 2022 07:29:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1p69pu-00005J-5V
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 07:29:10 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1p69ps-0002Jf-7O
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 07:29:09 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BGCNPhW031139
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 12:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=3+W9myhVJVWh9uODg9y49Kvgb+37drU/ZQwkd+ZznCE=;
 b=XjUXfZD2Q3Ux7503NwMrrNMHXTWHb/J7FRh3UnUkQ5oM5jppDXJM2i3EWGU+Q+fZSxze
 OhiTXhD61VamJc02UD+G1HNW5OLGmSey6l0OEgT45VDkR4zZNuV59XTs3pGCuEGcs1UV
 n4TDh47BXrnKKh/HOXN46HquCgiYZF1YzlWU847qIhgmgiLPCBqm1vpepLZNdaZ3Jx8m
 kjHtrqB3IohzljC+3NV52gdMLg6PqVaFqdn+L/LZnHqvMncUjioao/XPAtxbstPqG1ip
 ZMiEul23Mzvt2CfP7lSPVdzSQrMjZzdJiiMMbuDq6y+FTN/REs4b67hGYjEwwMXzy/f1 BQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mgrmxg2p8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 12:29:03 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BGCOJOj004319
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 12:29:03 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mgrmxg2nt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Dec 2022 12:29:03 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BGACq8T003862;
 Fri, 16 Dec 2022 12:29:02 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3mf03ap6w4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Dec 2022 12:29:02 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com
 [10.39.53.231])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BGCT0lZ4719146
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Dec 2022 12:29:00 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8104A58045;
 Fri, 16 Dec 2022 12:29:00 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB65F58050;
 Fri, 16 Dec 2022 12:28:59 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 16 Dec 2022 12:28:59 +0000 (GMT)
Message-ID: <a990f3c8-cca9-86ff-6995-6e49ba90f839@linux.ibm.com>
Date: Fri, 16 Dec 2022 07:28:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/2] tpm: add backend for mssim
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: jejb@linux.ibm.com, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
References: <20221215180125.24632-3-jejb@linux.ibm.com>
 <b5cafbd3-d529-3a84-0604-c49aa30bf916@linux.ibm.com>
 <6fd1144d09777ddcdb7a1a1ba58cbbec345da9ef.camel@linux.ibm.com>
 <e77a3a76-c874-d279-52bf-18a4e3a36ba2@linux.ibm.com>
 <77bc5a11fcb7b06deba1c54b1ef2de28e0c53fb1.camel@linux.ibm.com>
 <10fbda0f-7c8a-3819-fb22-34a9249ac138@linux.ibm.com>
 <b5d26ab0e54c15c408e9bae136bce969283ed5bd.camel@linux.ibm.com>
 <9fac7d95-d891-413f-93f1-18324c7943ea@linux.ibm.com>
 <a8863d1905aa427543facb68d8892af369262f19.camel@linux.ibm.com>
 <29e99f54-d5e8-b18d-08a6-d24435032272@linux.ibm.com>
 <Y5xH/0bbgFzi+G//@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <Y5xH/0bbgFzi+G//@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rcgPWfcX4HsXgqGHhJ18IosmAsc8trDo
X-Proofpoint-ORIG-GUID: jgjF5lHQtlDCkD-A_FjRO0PQqg36Rhsm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-16_07,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 mlxlogscore=691 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212160107
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



On 12/16/22 05:27, Daniel P. Berrangé wrote:
> On Thu, Dec 15, 2022 at 03:53:43PM -0500, Stefan Berger wrote:
>>
>>
>> On 12/15/22 15:30, James Bottomley wrote:
>>> On Thu, 2022-12-15 at 15:22 -0500, Stefan Berger wrote:
>>>> On 12/15/22 15:07, James Bottomley wrote:
>>> [...]
>>>>> don't really have much interest in the migration use case, but I
>>>>> knew it should work like the passthrough case, so that's what I
>>>>> tested.
>>>>
>>>> I think your device needs to block migrations since it doesn't handle
>>>> all migration scenarios correctly.
>>>
>>> Passthrough doesn't block migrations either, presumably because it can
>>> also be made to work if you know what you're doing.  I might not be
>>
>> Don't compare it to passthrough, compare it to swtpm. It should
>> have at least the same features as swtpm or be better, otherwise
>> I don't see why we need to have the backend device in the upstream
>> repo.
> 
> James has explained multiple times that mssim is a beneficial
> thing to support, given that it is the reference implementation
> of TPM2. Requiring the same or greater features than swtpm is
> an unreasonable thing to demand.

Nevertheless it needs documentation and has to handle migration scenarios either via a blocker or it has to handle them all correctly. Since it's supposed to be a TPM running remote you had asked for TLS support iirc.

   Stefan

> 
> With regards,
> Daniel

