Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AF9472FF9
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 16:02:18 +0100 (CET)
Received: from localhost ([::1]:49946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwmqH-0001Sg-3K
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 10:02:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mwmnc-00079c-UR; Mon, 13 Dec 2021 09:59:32 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:65502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mwmna-0002SK-NN; Mon, 13 Dec 2021 09:59:32 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BDEvG7M027605; 
 Mon, 13 Dec 2021 14:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=4uVSW/mJ9sAcm6tvy4ZbkZM/ZfraN/RvSc37+6p1cxw=;
 b=h1tAJeZMzEZbuJw64+KMEYz0H/Jg684GeIAoMh+Lrn7zqavotBmh49Tt2Hfant4ddpn3
 2V47C4pL81p8vlardIWRb5dcPAk8kP7fSYG7grRR/901VwMKth+4kEhO+CRSPdDh2W3S
 4Cyuo0dDKsMIqFCk7PUq0BHfiXUa8/E+Pi09PE5TiNHUi0RHDVpUam9UU8YlywvS3OYJ
 2n+hyy3DvdBgd+JwoTNgt52Ao7CpGVB1Cp0e7yCo34Y7qiMt6TEuCJXhNk0EToa1WT0C
 j1ut4Qz2JEvsdpEjG1oABW107HDf9+u7GkCLzMt0u84UvuNCeyOVqLSV1cLh33IHiQcm AA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cx8d281vu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Dec 2021 14:59:15 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BDEvYRJ029020;
 Mon, 13 Dec 2021 14:59:14 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cx8d281v2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Dec 2021 14:59:14 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BDEw84g023769;
 Mon, 13 Dec 2021 14:59:13 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 3cvkma7fc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Dec 2021 14:59:13 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BDExCpr32506232
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Dec 2021 14:59:12 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2FEBCAC06D;
 Mon, 13 Dec 2021 14:59:12 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C431AC068;
 Mon, 13 Dec 2021 14:59:10 +0000 (GMT)
Received: from localhost (unknown [9.211.152.7])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 13 Dec 2021 14:59:09 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH] target/ppc: Fix e6500 boot
In-Reply-To: <f79d58b2-ad6d-2f85-b0d5-3d9db65f07dd@kaod.org>
References: <20211213133542.2608540-1-farosas@linux.ibm.com>
 <f79d58b2-ad6d-2f85-b0d5-3d9db65f07dd@kaod.org>
Date: Mon, 13 Dec 2021 11:59:06 -0300
Message-ID: <87o85kzh39.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: b4tUSQbnMJab0PyS80gWtrErpNngMNGE
X-Proofpoint-ORIG-GUID: KXNsXwJvoxdgrpaSCKiptWwDZB0vt1Js
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-13_06,2021-12-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=983
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112130093
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, mario@locati.it
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> On 12/13/21 14:35, Fabiano Rosas wrote:
>> When Altivec support was added to the e6500 kernel in 2012[1], the
>> QEMU code was not changed, so we don't register the VPU/VPUA
>> exceptions for the e6500:
>>=20
>>    qemu: fatal: Raised an exception without defined vector 73
>>=20
>> Note that the error message says 73, instead of 32, which is the IVOR
>> for VPU. This is because QEMU knows only knows about the VPU interrupt
>> for the 7400s. In theory, we should not be raising _that_ VPU
>> interrupt, but instead another one specific for the e6500.
>>=20
>> We unfortunately cannot register e6500-specific VPU/VPUA interrupts
>> because the SPEU/EFPDI interrupts also use IVOR32/33. These are
>> present only in the e500v1/2 versions. From the user manual:
>>=20
>> e500v1, e500v2: only SPEU/EFPDI/EFPRI
>> e500mc, e5500:  no SPEU/EFPDI/EFPRI/VPU/VPUA
>> e6500:          only VPU/VPUA
>>=20
>> So I'm leaving IVOR32/33 as SPEU/EFPDI, but altering the dispatch code
>> to convert the VPU #73 to a #32 when we're in the e6500. Since the
>> handling for SPEU and VPU is the same this is the only change that's
>> needed. The EFPDI is not implemented and will cause an abort. I don't
>> think it worth it changing the error message to take VPUA into
>> consideration, so I'm not changing anything there.
>>=20
>> This bug was discussed in the thread:
>> https://lists.gnu.org/archive/html/qemu-ppc/2021-06/msg00222.html
>>=20
>> 1- https://git.kernel.org/torvalds/c/cd66cc2ee52
>>=20
>> Reported-by: <mario@locati.it>
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
> One comment,
>
>> ---
>>   target/ppc/cpu_init.c    |  6 ++++++
>>   target/ppc/excp_helper.c | 12 +++++++++++-
>>   2 files changed, 17 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
>> index 6695985e9b..d8efcb24ed 100644
>> --- a/target/ppc/cpu_init.c
>> +++ b/target/ppc/cpu_init.c
>> @@ -2273,8 +2273,14 @@ static void init_excp_e200(CPUPPCState *env, targ=
et_ulong ivpr_mask)
>>       env->excp_vectors[POWERPC_EXCP_DTLB]     =3D 0x00000000;
>>       env->excp_vectors[POWERPC_EXCP_ITLB]     =3D 0x00000000;
>>       env->excp_vectors[POWERPC_EXCP_DEBUG]    =3D 0x00000000;
>> +    /*
>> +     * These two are the same IVOR as POWERPC_EXCP_VPU and
>> +     * POWERPC_EXCP_VPUA. We deal with that when dispatching at
>> +     * powerpc_excp().
>> +     */
>>       env->excp_vectors[POWERPC_EXCP_SPEU]     =3D 0x00000000;
>>       env->excp_vectors[POWERPC_EXCP_EFPDI]    =3D 0x00000000;
>> +
>>       env->excp_vectors[POWERPC_EXCP_EFPRI]    =3D 0x00000000;
>>       env->ivor_mask =3D 0x0000FFF7UL;
>>       env->ivpr_mask =3D ivpr_mask;
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index 17607adbe4..7bb170f440 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -344,6 +344,16 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp_model, int excp)
>>           excp =3D POWERPC_EXCP_PROGRAM;
>>       }
>>=20=20=20
>> +#ifdef TARGET_PPC64
>> +    /*
>> +     * SPEU and VPU share the same IVOR but they exist in different
>> +     * processors. SPEU is e500v1/2 only and VPU is e6500 only.
>> +     */
>> +    if (excp_model =3D=3D POWERPC_EXCP_BOOKE && excp =3D=3D POWERPC_EXC=
P_VPU) {
>> +        excp =3D POWERPC_EXCP_SPEU;
>> +    }
>> +#endif
>
> I am not in favor of changing powerpc_excp() but I know you have
> plans for a major clean up :)

Yep, I think is better to fix everything that is broken before the
cleanup so we have more code working and being tested before the
changes.

I would have sent this patch months ago if I knew how to fix it then =3D)


