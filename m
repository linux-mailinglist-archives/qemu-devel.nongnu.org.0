Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98ABE49D564
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 23:24:00 +0100 (CET)
Received: from localhost ([::1]:37736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCqhr-0007DP-71
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 17:23:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nCqer-00063o-QE; Wed, 26 Jan 2022 17:20:54 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:29012
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nCqep-0006xC-TD; Wed, 26 Jan 2022 17:20:53 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20QMKgtD017789; 
 Wed, 26 Jan 2022 22:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=Hoe9n1Mt2S+3CVhH9VclAS3wyM2v42EAc70ZuvDGFpM=;
 b=Q+ardA1lxiQFgyoU1HTLd8PmKodEAevZbL2s6TvJtTysw91dpoOPZI0HYql+ccg0EePn
 KMSSaWDnrNrlkhOIopUl6T29KsEpeonFIFCIReSTR2E0sm2nDnQIHnGeq+NDZlf7pCtX
 76v93qQHVFtnY0hAhc9PO9a9wIwF9vDU4pqTjSLx1tvI1A46iKe0iffXCrgNXozNAfHm
 w7cu+WIQLc5WCtG97JxygMP3HE0nNKyvSRgYO+ygYSsR+/x/JOJyBHs9EKFJBhGTAZst
 wm90/l/Dv6JjdOCodgqMOnfYIeuo6Qgc1H3Sbdoyn2m9QOL5nLc131nDvrjVRlR1AUWk eg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dueetgsq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jan 2022 22:20:43 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20QMKh6P018245;
 Wed, 26 Jan 2022 22:20:43 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dueetgsm8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jan 2022 22:20:42 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20QME4tm020603;
 Wed, 26 Jan 2022 22:20:32 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04wdc.us.ibm.com with ESMTP id 3dr9jbcxcq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jan 2022 22:20:32 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20QMKVtW44892470
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 22:20:31 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 065A6112067;
 Wed, 26 Jan 2022 22:20:31 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F27C3112061;
 Wed, 26 Jan 2022 22:20:29 +0000 (GMT)
Received: from localhost (unknown [9.211.99.130])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 26 Jan 2022 22:20:29 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 07/14] target/ppc: 405: External exception cleanup
In-Reply-To: <b2874090-0913-530f-b7bb-976ae6768a80@linaro.org>
References: <20220118184448.852996-1-farosas@linux.ibm.com>
 <20220118184448.852996-8-farosas@linux.ibm.com>
 <b2874090-0913-530f-b7bb-976ae6768a80@linaro.org>
Date: Wed, 26 Jan 2022 19:20:26 -0300
Message-ID: <87czkeqgut.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: j-J1HaNv_xNVhRiXGlvyK6B8xI6IPPHE
X-Proofpoint-ORIG-GUID: ZKvbSUvgjdQUpb36uuZ3-164IGFsdVwA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-26_08,2022-01-26_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 spamscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201260128
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Richard Henderson <richard.henderson@linaro.org> writes:

> On 1/19/22 5:44 AM, Fabiano Rosas wrote:
>> 405 has no MSR_HV and EPR is BookE only so we can remove it all.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
>> ---
>>   target/ppc/excp_helper.c | 37 -------------------------------------
>>   1 file changed, 37 deletions(-)
>> 
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index e98d783ecd..8fae8aa0be 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -472,44 +472,7 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
>>           msr |= env->error_code;
>>           break;
>>       case POWERPC_EXCP_EXTERNAL:  /* External input                           */
>> -    {
>> -        bool lpes0;
>> -
>> -        cs = CPU(cpu);
>> -
>> -        /*
>> -         * Exception targeting modifiers
>> -         *
>> -         * LPES0 is supported on POWER7/8/9
>> -         * LPES1 is not supported (old iSeries mode)
>> -         *
>> -         * On anything else, we behave as if LPES0 is 1
>> -         * (externals don't alter MSR:HV)
>> -         */
>> -#if defined(TARGET_PPC64)
>> -        if (excp_model == POWERPC_EXCP_POWER7 ||
>> -            excp_model == POWERPC_EXCP_POWER8 ||
>> -            excp_model == POWERPC_EXCP_POWER9 ||
>> -            excp_model == POWERPC_EXCP_POWER10) {
>> -            lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
>> -        } else
>> -#endif /* defined(TARGET_PPC64) */
>> -        {
>> -            lpes0 = true;
>> -        }
>> -
>> -        if (!lpes0) {
>> -            new_msr |= (target_ulong)MSR_HVB;
>> -            new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
>> -            srr0 = SPR_HSRR0;
>> -            srr1 = SPR_HSRR1;
>> -        }
>> -        if (env->mpic_proxy) {
>> -            /* IACK the IRQ on delivery */
>> -            env->spr[SPR_BOOKE_EPR] = ldl_phys(cs->as, env->mpic_iack);
>> -        }
>>           break;
>> -    }
>
> Bare break?  Should this be reachable at all?
> Should it in fact be g_assert_not_reached()?

It should be reachable. It is a valid exception for this CPU. We just
don't have anything else to do to dispatch it aside from what is done in
the generic code outside the switch statement.

