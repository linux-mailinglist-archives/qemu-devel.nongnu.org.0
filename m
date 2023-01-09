Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 084FC662FB3
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 20:01:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pExOg-0002kB-I9; Mon, 09 Jan 2023 14:01:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pExOe-0002jV-Nn
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 14:01:24 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pExOc-0000q0-PJ
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 14:01:24 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 309HWAGK006217
 for <qemu-devel@nongnu.org>; Mon, 9 Jan 2023 19:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=+ATHlYPkxGJNgpawQA75xjvDf/aO1BmoJ6dvDFVtWsE=;
 b=bqImX8FEfAtodebRB34Sc/WllAJzORQBr3KsfMojuzt0TcHot1WaCSmeDgxK9T/S+j+t
 K69Ofc3ZE5pPgvvsJ/lOoqWYBNWE0PUj3wJC39KDsQHbl0qlJXafVGwBlnxIWeHklaiB
 P6NoKppIpo3l52Mjc1b0KgCxKGAS28X2NXQHkm5bDTMNqWUmUb8FMamAKR3UI4EF6EsN
 9d91wvCNFxW4Cw9WnRpWKVxMq+H5pxDjKzazR4U9hkB8FJcLNDO2/kDWY8SUd4dCdky5
 UxmVq9iDeuqWXJrjA/fLQC3qkL7fvbkIcGy3Fg0nYoTJZH9peXF2nin9Wg5RLnA/h0F+ Xw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjgdxx3e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 19:01:20 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 309Ir2p7016497
 for <qemu-devel@nongnu.org>; Mon, 9 Jan 2023 19:01:20 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjgdxx2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 19:01:20 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 309IC6xc014050;
 Mon, 9 Jan 2023 19:01:18 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3my0c75du2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 19:01:18 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com
 [10.241.53.100])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 309J1H3D4653720
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Jan 2023 19:01:17 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BC6E58058;
 Mon,  9 Jan 2023 19:01:17 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A41858057;
 Mon,  9 Jan 2023 19:01:17 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  9 Jan 2023 19:01:16 +0000 (GMT)
Message-ID: <a7472cd7-97b2-a063-0065-a78e49d0509a@linux.ibm.com>
Date: Mon, 9 Jan 2023 14:01:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] tpm: add backend for mssim
Content-Language: en-US
To: jejb@linux.ibm.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <9fac7d95-d891-413f-93f1-18324c7943ea@linux.ibm.com>
 <a8863d1905aa427543facb68d8892af369262f19.camel@linux.ibm.com>
 <29e99f54-d5e8-b18d-08a6-d24435032272@linux.ibm.com>
 <Y5xH/0bbgFzi+G//@redhat.com>
 <a990f3c8-cca9-86ff-6995-6e49ba90f839@linux.ibm.com>
 <Y5xqgK8UXe28VZQ2@redhat.com>
 <cb752b76-a8d1-b3e0-b9ae-94e136eed7d6@linux.ibm.com>
 <Y5yAz0qzaIW4HwFi@redhat.com> <Y7xH1i0Uvbo0FUwG@work-vm>
 <5c07f6ab6adfe53f7e7fbeeda67f2eb62afccdfa.camel@linux.ibm.com>
 <Y7xUVq9PT9ohGfCj@work-vm>
 <af22847d6e8f3a64720c4d4d00b93f57ea63ad3e.camel@linux.ibm.com>
 <f2e036a7-5cff-4f95-902f-b31fce3c0ade@linux.ibm.com>
 <f928986fd4095b1f27c83ede96f3b0dd65ad965e.camel@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <f928986fd4095b1f27c83ede96f3b0dd65ad965e.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oItfoZ3lvXKmfaouM9o_V9CHTFJypMBB
X-Proofpoint-ORIG-GUID: fV7Q_s6GWwk0CTiSCMoyu-O6At_Cey_C
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_12,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301090135
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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



On 1/9/23 13:51, James Bottomley wrote:
> On Mon, 2023-01-09 at 13:34 -0500, Stefan Berger wrote:
>>
>>
>> On 1/9/23 12:55, James Bottomley wrote:
>>> On Mon, 2023-01-09 at 17:52 +0000, Dr. David Alan Gilbert wrote:
>>>> * James Bottomley (jejb@linux.ibm.com) wrote:
>>> [...]
>>>>> external MSSIM TPM emulator has to be kept running to preserve
>>>>> the state.  If you restart it, the migration will fail.
>>>>
>>>> Document that and we're getting there.
>>>
>>>
>>> The documentation in the current patch series says
>>>
>>> ----
>>> The mssim backend supports snapshotting and migration, but the
>>> state of the Microsoft Simulator server must be preserved (or the
>>> server kept running) outside of QEMU for restore to be successful.
>>> ----
>>>
>>> What, beyond this would you want to see?
>>
>> mssim today lacks the functionality of marshalling and unmarshalling
>> the permanent and volatile state of the TPM 2, which are both needed
>> for snapshot support. How does this work with mssim?
> 
> You preserve the state by keeping the simulator running as the above
> says.  As long as you can preserve the state, there's no maximum time
> between snapshots.  There's no need of marshal/unmarshal if you do
> this

 From https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg03146.html

"VM snapshotting is basically VM suspend / resume on steroids requiring
permanent and volatile state to be saved and restoreable from possible very
different points in time with possibly different seeds, NVRAM locations etc.
How the mssim protocol does this is non-obvious to me and how one coordinates
the restoring and saving of the TPM's state without direct coordination by QEMU
is also non-obvious."


    Stefan
.
> 
> James
> 

