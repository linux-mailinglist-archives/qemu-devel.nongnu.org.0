Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDAC46EAE2
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 16:12:22 +0100 (CET)
Received: from localhost ([::1]:48594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvL5p-0000x2-S1
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 10:12:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mvKzo-00013D-Vd; Thu, 09 Dec 2021 10:06:12 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35894
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mvKzk-0002sV-DK; Thu, 09 Dec 2021 10:06:07 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B9ESrbs009958; 
 Thu, 9 Dec 2021 15:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=boVXuGwTbLcJSra/N1+530ESaliFjl/otcgn52grMY4=;
 b=ssewT1G7sSBmJmnzNEO4XLyMCN1rD5CXSlyUnspakoyZZ5E8ExMNIg9QsCJbsSHN7Uu4
 QRycmxqpoYl9/Bq2HhurAIasa6wReHADCg4lpkQhAqvMQDIX/nJ5vy9Twl8ZSjzThqIx
 X40/OOUQ/FE/3WMbnBunoI8qBhxSiNzjLIvs+1oHjiQjek7zBc9c9Rvd+O5+d4jtq0ST
 EZMPdpZ2A+Edy8Xb7BsmVJXYdDzYpAVDuouv6lrHD83hMSmTcxFLsngSAVCPNUIXQZmi
 oyX/h1OcR1jDfL1r1tE3uUEiCSlGYGiwa826nUVjqQHUTQ2BFCRMdJ7ieV7f7Ozioxph LA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cukkq8xtq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 15:05:56 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B9EU1N7013190;
 Thu, 9 Dec 2021 15:05:56 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cukkq8xte-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 15:05:56 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B9F49t0026573;
 Thu, 9 Dec 2021 15:05:55 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 3cqyychw2k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 15:05:55 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B9F5s0b26345784
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Dec 2021 15:05:54 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C6E8BE07D;
 Thu,  9 Dec 2021 15:05:54 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C693DBE05A;
 Thu,  9 Dec 2021 15:05:53 +0000 (GMT)
Received: from localhost (unknown [9.163.12.190])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu,  9 Dec 2021 15:05:53 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH] target/ppc: powerpc_excp: Guard ALIGNMENT interrupt
 with CONFIG_TCG
In-Reply-To: <c17bf4e0-2c5c-0748-0539-34b441c81644@kaod.org>
References: <20211208230650.2125095-1-farosas@linux.ibm.com>
 <c17bf4e0-2c5c-0748-0539-34b441c81644@kaod.org>
Date: Thu, 09 Dec 2021 12:05:51 -0300
Message-ID: <87o85p6cog.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: arMEz4BKuw2sdZ6kLextm703-1NXXtu6
X-Proofpoint-ORIG-GUID: vGgnjpKrFQgD4eFoVFZBYODGUAs_604K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-09_06,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112090082
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> On 12/9/21 00:06, Fabiano Rosas wrote:
>> We cannot have TCG code in powerpc_excp because the function is called
>> from kvm-only code via ppc_cpu_do_interrupt:
>>=20
>>   ../target/ppc/excp_helper.c:463:29: error: implicit declaration of
>>   function =E2=80=98cpu_ldl_code=E2=80=99 [-Werror=3Dimplicit-function-d=
eclaration]
>>=20
>> Fortunately, the Alignment interrupt is not among the ones dispatched
>> from kvm-only code, so we can keep it out of the disable-tcg build for
>> now.
>>=20
>> Fixes: 336e91f853 ("target/ppc: Move SPR_DSISR setting to powerpc_excp")
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>>=20
>> ---
>>=20
>> Perhaps we could make powerpc_excp TCG only and have a separate
>> function that only knows the two interrupts that we use with KVM
>> (Program, Machine check). But for now this fix will do, I think.
>> ---
>>   target/ppc/excp_helper.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>=20
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index 17607adbe4..dcf22440cc 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -453,6 +453,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int=
 excp_model, int excp)
>>           }
>>           break;
>>       }
>> +#ifdef CONFIG_TCG
>>       case POWERPC_EXCP_ALIGN:     /* Alignment exception               =
       */
>>           /*
>>            * Get rS/rD and rA from faulting opcode.
>> @@ -464,6 +465,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int=
 excp_model, int excp)
>>               env->spr[SPR_DSISR] |=3D (insn & 0x03FF0000) >> 16;
>>           }
>>           break;
>> +#endif
>>       case POWERPC_EXCP_PROGRAM:   /* Program exception                 =
       */
>>           switch (env->error_code & ~0xF) {
>>           case POWERPC_EXCP_FP:
>>=20
>
> Shouldn't we move that code under ppc_cpu_do_unaligned_access ?

Well, it came from there initially. We could revert 336e91f853 and that
would fix the issue as well.

>
> Thanks,
>
> C.

