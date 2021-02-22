Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D26B732213B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 22:20:00 +0100 (CET)
Received: from localhost ([::1]:59456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEIcZ-0001w0-Uj
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 16:19:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1lEIbB-0001J2-B0; Mon, 22 Feb 2021 16:18:33 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:7674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1lEIb9-00042f-CK; Mon, 22 Feb 2021 16:18:33 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11ML3fg2052930; Mon, 22 Feb 2021 16:18:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=reply-to : subject : to
 : cc : references : from : message-id : date : mime-version : in-reply-to
 : content-type : content-transfer-encoding; s=pp1;
 bh=KSti3OiepDaSHUGqcUc4kMtQpd35GyDHejFJlAllEDI=;
 b=EhC+CAzDm96DUCq4fGoBRVeEkY6XLcj7BtUM9q7SdVWy5npn0B27UoUPYcr7uUISxodQ
 j1VJKCOt5b9mAttw+8/i0dkfGeHOjhIHlu73Akf641sWOWqlFaV1/NC+989i3sRFqZXr
 LSGuqIHFso6nwR06oRMZnCxCJEXj42aiinOhJvcDhguPQrOHeN6p0HnUyZFIT9jfbcHZ
 YhnvylOitT4qPsPP9vkm/cCQPKpTkY0iqqFJIWVG8Gr/TPnq7uM2fYeWx+WNnvYwlAUs
 uPKgly1PO+6ss4AMd0zruyon1SW+y6SDrSF+5VY4nanKvXmAxJRwzFIQ4HFW2xeOx9iF hQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36vkmp9te7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 16:18:15 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 11ML47Yp055403;
 Mon, 22 Feb 2021 16:18:15 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36vkmp9tdy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 16:18:15 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11MKvc7f012162;
 Mon, 22 Feb 2021 21:18:14 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 36tt28su6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 21:18:14 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11MLIEFV10879436
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Feb 2021 21:18:14 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB48A7805F;
 Mon, 22 Feb 2021 21:18:13 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50FF578063;
 Mon, 22 Feb 2021 21:18:10 +0000 (GMT)
Received: from lagarcia.br.ibm.com (unknown [9.85.163.84])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 22 Feb 2021 21:18:09 +0000 (GMT)
Subject: Re: Editing QEMU POWER Platform wiki page
To: Greg Kurz <groug@kaod.org>
References: <91874f1e-4b14-5fb1-f1ae-1225938df759@linux.ibm.com>
 <20210222120138.31f313c9@bahia.lan>
From: =?UTF-8?Q?Leonardo_Augusto_Guimar=c3=a3es_Garcia?=
 <lagarcia@linux.ibm.com>
Organization: IBM
Message-ID: <3c3fc3f0-afb8-1012-eaf7-11ecbe146025@linux.ibm.com>
Date: Mon, 22 Feb 2021 18:18:08 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222120138.31f313c9@bahia.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-22_07:2021-02-22,
 2021-02-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 clxscore=1011 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102220185
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=lagarcia@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: lagarcia@br.ibm.com
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU devel list <qemu-devel@nongnu.org>,
 Programmingkid <programmingkidx@gmail.com>,
 QEMU PPC devel list <qemu-ppc@nongnu.org>, Cedric Le Goater <clg@kaod.org>,
 lagarcia@br.ibm.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 8:01 AM, Greg Kurz wrote:
> On Thu, 18 Feb 2021 10:16:25 -0300
> Leonardo Augusto Guimarães Garcia <lagarcia@linux.ibm.com> wrote:
>
>> Hi there,
>>
>> I would like to edit the wiki page at [0] as it contains some outdated
>> information. Could anyone that has access to the wiki please help me
>> create a user so that I can edit it?
>>
>> 0. https://wiki.qemu.org/Documentation/Platforms/POWER
>>
> Hi Leo,
>
> User creation isn't publicly available to avoid spam : only an existing
> user can create a new account.


Yeah, I saw that. That's why I asked here.


> This being said, wiki isn't the preferred
> way to expose documentation since there's no review and things ultimately
> bitrot. Page [0] you want to update is a perfect example of the mess :
> not only it contains irrelevant data but also stuff that is definitely
> wrong (e.g. 'compat' cpu property was deprecated in QEMU 5.0 and will
> be removed in QEMU 6.0).
>
> Ideally we'd want everything to be in the main QEMU doc and don't
> even need a wiki.
>
> On the PowerPC front, the most up-to-date docs are in the QEMU tree:
>
> docs/system/ppc/embedded.rst
> docs/system/ppc/powermac.rst
> docs/system/ppc/powernv.rst
> docs/system/ppc/prep.rst
> docs/system/ppc/pseries.rst
> docs/system/target-ppc.rst
>
> So I don't know exactly what changes you had in mind, but maybe first
> consider to update the main documentation.


I got here because someone pointed to me the wiki is saying that nested 
virtualization is not supported on Power, which is wrong. But I saw many 
other outdated information on the wiki as you pointed out.


>
> On my side, I think I want do ditch all the current content and just put
> links to https://qemu.readthedocs.io/en/latest/ instead. I can take care
> of that, in which case you wouldn't need an account.


I agree this would be the preferable way. Could you go ahead and do 
that, please, if others agree as well?

Cheers,

Leo


>
> Cheers,
>
> --
> Greg
>
> PS:
>
> Cedric reported that we also have a page for non-pseries
> platforms:
>
> https://wiki.qemu.org/Documentation/Platforms/PowerPC
>
> I'm Cc'ing some regular contributors for those platforms so
> they can  evaluate the bitrotting status of this wiki.
>
>> Cheers,
>>
>> Leo
>>
>>
>

