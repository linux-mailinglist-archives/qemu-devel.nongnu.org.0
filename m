Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BEF48431B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 15:12:47 +0100 (CET)
Received: from localhost ([::1]:38134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4kYQ-0004UG-4H
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 09:12:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n4kXK-0003JJ-Tp; Tue, 04 Jan 2022 09:11:39 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:44902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n4kXI-0000tQ-MM; Tue, 04 Jan 2022 09:11:38 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 204Dc55A019349; 
 Tue, 4 Jan 2022 14:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=bbvXPqEfaYl013FIOT3u6HrKDazdu9Ni0NIt4tVeipM=;
 b=exwwehcgwGzqYU+mKtNEBpbgJGqjReHSJN5IqS6ygvkocRG71qg6lkv3qtgcc6RL4pPr
 9AAF3+1mXxP1uvSjNR2NiD+GqunYRG3Z7Okf5VMKaBwAab3QPCG0S4GQ02clzRxMAykI
 nx+eF8Qx9NGdQ5+kwR9No08MEzU+Q5IjSrIO78m6Rgo+eGOcrHgi/hSoRmK+0jYENEEb
 vRlM7n0NBABAcdqRFdiOw6admv/F/V+GCC8hlhmjOoXWCrqc19ag+c1oFwVdNIUztmAy
 xjU/4dS0tw7Hsw1yb+4MLWUn5MnSZQeg6flraucO5kqyvZS0/afDOXATe10uczknXsSL lw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dch82fnk1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 14:11:23 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 204DVTC2020309;
 Tue, 4 Jan 2022 14:11:23 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dch82fnjm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 14:11:23 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 204E7wjA022357;
 Tue, 4 Jan 2022 14:11:22 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma05wdc.us.ibm.com with ESMTP id 3daekakpq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 14:11:21 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 204EBKJb19202378
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Jan 2022 14:11:20 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A0D2C6065;
 Tue,  4 Jan 2022 14:11:20 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CA42C605F;
 Tue,  4 Jan 2022 14:11:19 +0000 (GMT)
Received: from localhost (unknown [9.163.4.248])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue,  4 Jan 2022 14:11:19 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH 5/9] target/ppc: Use ppc_interrupts_little_endian in
 powerpc_excp
In-Reply-To: <ca700ead-7cf1-6d8c-12f6-9d03b547d517@kaod.org>
References: <20220103220746.3916246-1-farosas@linux.ibm.com>
 <20220103220746.3916246-6-farosas@linux.ibm.com>
 <ca700ead-7cf1-6d8c-12f6-9d03b547d517@kaod.org>
Date: Tue, 04 Jan 2022 11:11:17 -0300
Message-ID: <87bl0rh9q2.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CbCklOPuAKNzs0SqClwUWyRlR707QpLI
X-Proofpoint-GUID: biYIy3MtZe9zkfGB_UDvq5ErlP7QE_50
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_06,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=847 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201040095
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, richard.henderson@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> On 1/3/22 23:07, Fabiano Rosas wrote:
>> The ppc_interrupts_little_endian function is suitable for determining
>> the endianness of interrupts for all Book3S CPUs.
>>=20
>> (I'm keeping the MSR check for the rest of the CPUs, but it will go
>> away in the next patch.)
>>=20
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> ---
>>   target/ppc/excp_helper.c | 21 ++-------------------
>>   1 file changed, 2 insertions(+), 19 deletions(-)
>>=20
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index 0dbadc5d07..5d31940426 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -760,25 +760,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, in=
t excp)
>>        * CPU, the HV mode, etc...
>>        */
>>   #ifdef TARGET_PPC64
>> -    if (excp_model =3D=3D POWERPC_EXCP_POWER7) {
>> -        if (!(new_msr & MSR_HVB) && (env->spr[SPR_LPCR] & LPCR_ILE)) {
>> -            new_msr |=3D (target_ulong)1 << MSR_LE;
>> -        }
>> -    } else if (excp_model =3D=3D POWERPC_EXCP_POWER8) {
>> -        if (new_msr & MSR_HVB) {
>> -            if (env->spr[SPR_HID0] & HID0_HILE) {
>> -                new_msr |=3D (target_ulong)1 << MSR_LE;
>> -            }
>> -        } else if (env->spr[SPR_LPCR] & LPCR_ILE) {
>> -            new_msr |=3D (target_ulong)1 << MSR_LE;
>> -        }
>> -    } else if (excp_model =3D=3D POWERPC_EXCP_POWER9 ||
>> -               excp_model =3D=3D POWERPC_EXCP_POWER10) {
>> -        if (new_msr & MSR_HVB) {
>> -            if (env->spr[SPR_HID0] & HID0_POWER9_HILE) {
>> -                new_msr |=3D (target_ulong)1 << MSR_LE;
>> -            }
>> -        } else if (env->spr[SPR_LPCR] & LPCR_ILE) {
>> +    if (excp_model >=3D POWERPC_EXCP_970) {
>
> why include POWERPC_EXCP_970 ? These CPUs do not support Little Endian.
>

Because the 970 exception model covers POWER5P as well which has ILE.

And looking at cpu_init.c, POWER5 uses a bunch of 970 functions. And
POWER7 uses the POWER5 ones. So we kind of have a dependency chain
there. That is why I'm always handling ">=3D 970" as "books".

