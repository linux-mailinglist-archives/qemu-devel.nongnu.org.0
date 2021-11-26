Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F2B45EE8E
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 14:05:54 +0100 (CET)
Received: from localhost ([::1]:46296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqavH-0005nm-CS
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 08:05:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mqasg-0003X5-8B; Fri, 26 Nov 2021 08:03:10 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mqasd-0003Hq-MO; Fri, 26 Nov 2021 08:03:09 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AQCkQQB004622; 
 Fri, 26 Nov 2021 13:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=miBLs+YIglFn0XVMUjCL0uVAHcjku1QqOD029z1xMW8=;
 b=aw2I1v1kkpF9+ctAbsCvVxZnVxhwIOqghaud9mLeUrxnRc9StwwxFv4KhxsNqEkCjO/V
 Z2w0NtFE1YhTM71GmnjlnJ91ptcIH4P0tIIgv0dwghIdkRH+VvsNMaUwTyLFK5OuOCF+
 yvz83K9ymKq+LYdjFRq6c2xFYvjv+zCQG2p8XuQYW9u6k41tcyzGbmHmjqx6KXUxs03U
 +mGjH8pywmDdN8RLevL0O2l9jAB3KcTnbUcFCob+dKJsRmNb6e99HMLBAq/MJvgA/lVP
 MP10hJ5Vm0PLzfK4ehPCMoODEagUmFzlH8qKpoTAGiQOhtgh8wQNV8hrAiMX1zBWb/yI ZQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cjyvqrb2b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Nov 2021 13:02:57 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AQCu2wd013216;
 Fri, 26 Nov 2021 13:02:56 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cjyvqrb26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Nov 2021 13:02:56 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AQCrBa1011553;
 Fri, 26 Nov 2021 13:02:55 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 3ch1ndm7e7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Nov 2021 13:02:55 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AQD2scM35062262
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Nov 2021 13:02:54 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C889EAE05C;
 Fri, 26 Nov 2021 13:02:54 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E4B5AE05F;
 Fri, 26 Nov 2021 13:02:54 +0000 (GMT)
Received: from localhost (unknown [9.211.89.149])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 26 Nov 2021 13:02:53 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, Segher Boessenkool
 <segher@kernel.crashing.org>
Subject: Re: [OpenBIOS] Re: [RFC PATCH 0/2] QEMU/openbios: PPC Software TLB
 support in the G4 family
In-Reply-To: <37135ecd-dec9-860f-69b7-cffe97b0ee8a@kaod.org>
References: <20211119134431.406753-1-farosas@linux.ibm.com>
 <87pmqpqknn.fsf@linux.ibm.com>
 <48c4262-ff7d-2897-9764-cadd98683e97@eik.bme.hu>
 <20211125093801.GM614@gate.crashing.org>
 <484dc989-71db-6273-e868-efaf2ad29fcf@kaod.org>
 <20211126103732.GP614@gate.crashing.org> <87lf1bqflu.fsf@linux.ibm.com>
 <37135ecd-dec9-860f-69b7-cffe97b0ee8a@kaod.org>
Date: Fri, 26 Nov 2021 10:02:51 -0300
Message-ID: <87czmnqdc4.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6mvkn4iBWLNQ0tFdF7DPLdH3-rRjt8ps
X-Proofpoint-GUID: 97B79pQDsjRn2yqUMgPKsW6Vipc5r-oL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-26_03,2021-11-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=766
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111260077
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 openbios@openbios.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> On 11/26/21 13:13, Fabiano Rosas wrote:
>> Segher Boessenkool <segher@kernel.crashing.org> writes:
>>=20
>>> Hi!
>>>
>>> On Fri, Nov 26, 2021 at 09:34:44AM +0100, C=C3=A9dric Le Goater wrote:
>>>> On 11/25/21 10:38, Segher Boessenkool wrote:
>>>>> On Thu, Nov 25, 2021 at 01:45:00AM +0100, BALATON Zoltan wrote:
>>>>>> As for guests, those running on the said PowerMac G4 should have sup=
port
>>>>>> for these CPUs so maybe you can try some Mac OS X versions (or maybe
>>>>>
>>>>> OSX uses hardware pagetables.
>>>>>
>>>>>> MorphOS but that is not the best for debugging as there's no source
>>>>>> available nor any help from its owners but just to see if it boots i=
t may
>>>>>> be sufficient, it should work on real PowerMac G4).
>>>>>
>>>>> I have no idea what MorphOS uses, but I bet HPT as well.  That is
>>>>> because HPT is fastest in general.  Software TLB reloads are good in
>>>>> special cases only; the most common is real-time OSes, which can use =
its
>>>>> lower guaranteed latency for some special address spaces (and can hav=
e a
>>>>> simpler address map in general).
>>>>
>>>> The support was added to QEMU knowing that Linux didn't handle soft TL=
Bs.
>>>> And the commit says that it was kept disabled initially. I guess that =
was
>>>> broken these last years.
>>>
>>> Ah :-)  So when was it enabled, do you know?
>>=20
>> Hm.. That commit message does not match the code. They simply added the
>> software TLB implementation to an already existing SOFT_74xx MMU
>> model. I don't see anything that would keep it disabled at that time.
>>=20
>
> because most of the cpu definitions in ppc_defs[] are protected by a :
>
> #if defined (TODO)
>
> See below. commit 8ca3f6c3824c ("Allow selection of all defined PowerPC
> 74xx (aka G4) CPUs.") removed the TODO without a reason :/ This is old,
> when SVN was in used.

Ah nice catch!

