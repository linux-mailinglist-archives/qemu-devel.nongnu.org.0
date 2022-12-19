Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DBC650D00
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 15:03:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7GiT-0007IT-Qi; Mon, 19 Dec 2022 09:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1p7GiE-0007HS-IF
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 09:01:51 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1p7GiC-0003Qa-MM
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 09:01:50 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJDfZxD001269
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 14:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=nt1LmW2UDvhWYFtcJTjT2IqqTxOyun7ouzTQ76u+9/U=;
 b=bYBsCvUK5oo4qdBRRNdUFO84QMcMApSgW0hEo1i6lKrOW0B/fyXE9a3phN8kzyAcG07s
 ub/1c4R5wFxaOtUw7U/d34LC1jJnW4r/a55NfNDtahF3/YStAMB177TZvHAZEGTvdvTP
 ti9WBIxntVJQoDqlNV+VbYmGQrTk9wPQS9+DBaxq0biEjTX6nMScfZnVY1vZO6kfUa26
 YErhiMdJQoltPH58SuVCYApzRo2as7nq0AI2Lt0pTvKbqvMrbdbL56Gh00ojffoctKFb
 TaBLNIIUXF0bKWMulYw+eeyD3cVNtVUmdOGU/+ag0ht/cLg3StBo6OXc/+bAwlXB8+NT HA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mjs2jgjy3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 14:01:45 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BJDgH3i009801
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 14:01:45 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mjs2jgjwc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 14:01:45 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BJC7iHG007611;
 Mon, 19 Dec 2022 14:01:43 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([9.208.129.116])
 by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3mh6yxdrc0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 14:01:43 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BJE1gNS8389254
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Dec 2022 14:01:42 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4246258059;
 Mon, 19 Dec 2022 14:01:42 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B88C55805F;
 Mon, 19 Dec 2022 14:01:41 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 19 Dec 2022 14:01:41 +0000 (GMT)
Message-ID: <cb2c3adc-fd8b-6606-a058-1785f8de86d8@linux.ibm.com>
Date: Mon, 19 Dec 2022 09:01:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/2] tpm: add backend for mssim
Content-Language: en-US
To: jejb@linux.ibm.com, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <6fd1144d09777ddcdb7a1a1ba58cbbec345da9ef.camel@linux.ibm.com>
 <e77a3a76-c874-d279-52bf-18a4e3a36ba2@linux.ibm.com>
 <77bc5a11fcb7b06deba1c54b1ef2de28e0c53fb1.camel@linux.ibm.com>
 <10fbda0f-7c8a-3819-fb22-34a9249ac138@linux.ibm.com>
 <b5d26ab0e54c15c408e9bae136bce969283ed5bd.camel@linux.ibm.com>
 <9fac7d95-d891-413f-93f1-18324c7943ea@linux.ibm.com>
 <a8863d1905aa427543facb68d8892af369262f19.camel@linux.ibm.com>
 <29e99f54-d5e8-b18d-08a6-d24435032272@linux.ibm.com>
 <Y5xH/0bbgFzi+G//@redhat.com>
 <a990f3c8-cca9-86ff-6995-6e49ba90f839@linux.ibm.com>
 <Y5xqgK8UXe28VZQ2@redhat.com>
 <cb752b76-a8d1-b3e0-b9ae-94e136eed7d6@linux.ibm.com>
 <158a33b6850db9ef18b240834e06665d7f9e4825.camel@linux.ibm.com>
 <9b808690-2f7a-cbd8-497a-fca63c7fc91d@linux.ibm.com>
 <3c1a78f396ebe32fddbe30ad7166717a493b2758.camel@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <3c1a78f396ebe32fddbe30ad7166717a493b2758.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sBVlgyVp3KOlIq6_wOtXJRLdPLMkTq8w
X-Proofpoint-ORIG-GUID: IBbVIycknu4sB2uSZXG1CYj0c3jIJIBg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-19_01,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212190125
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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



On 12/19/22 08:02, James Bottomley wrote:
> On Mon, 2022-12-19 at 06:49 -0500, Stefan Berger wrote:
>>
>>
>> On 12/16/22 08:53, James Bottomley wrote:
>>
>>>
>>> I could do a blog post, but I really don't think you want this in
>>> official documentation because that creates support expectations.
>>
>> We get support expectations if we don't mention it as not being
>> supported. So, since this driver is not supported the documentation
>> for QEMU should state something along the lines of 'this driver is
>> for experimental or testing purposes and is otherwise unsupported.'
>> That's fair to the user and maintainer.
> 
> Open source project don't provide support.  I already added a
> Maintainer entry for it, so I'll maintain it.

Support for me means reacting to user questions and addressing issues. Good that you maintain this now.

> 
>>   Nevertheless, if the documentation (or as a matter of fact the code)
>> was to claim that VM / TPM state migration scenarios, such as VM
>> snapshotting, are working then users should be able to ask someone
>> 'how' this can be done with the mssim protocol **today**. Since I
>> cannot answer that question you may need to find a way for how to
>> address this concern.
> 
> I already proposed all of this ... you were the one wanting to document
> migration.  The current wording is:

With documenting I wanted to see how users need to provide command lines for the mssim TPM.

> 
>     The mssim backend supports snapshotting and migration, but the state
>     of the Microsoft Simulator server must be preserved (or the server
>     kept running) outside of QEMU for restore to be successful.

VM snapshotting is basically VM suspend / resume on steroids requiring permanent and volatile state to be saved and restoreable from possible very different points in time with possibly different seeds, NVRAM locations etc. How the mssim protocol does this is non-obvious to me and how one coordinates the restoring and saving of the TPM's state without direct coordination by QEMU is also non-obvious.

    Stefan

> 
> James
> 
> 

