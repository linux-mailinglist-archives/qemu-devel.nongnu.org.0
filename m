Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E095EC582
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 16:08:10 +0200 (CEST)
Received: from localhost ([::1]:60176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odBFo-00044t-S8
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 10:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1od9lo-0007za-J5; Tue, 27 Sep 2022 08:33:05 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:29712
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1od9lm-0004uV-Ib; Tue, 27 Sep 2022 08:33:04 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28RC7Go7010098;
 Tue, 27 Sep 2022 12:33:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=H2ycVdwsaW6+vrrtDZjFE5h/TC4dQxva/AchUE2ynaI=;
 b=s/ERlUAIqrwJakFZA215ASC4cwbYFFxX8bdQwGGWc7ihGJ3oGZ2GQVT4Nwo4mLsi3YZo
 DC4tRR5RW/ePRf5hGp21yOaQ8AxxdBnJMVELOR6euvuoPB5XEyLGPhc7bSq267jWwc3H
 syHiFrsEetoZuryNPMC95BNdXoWMO2FYyJMedaDk3QcipaPdmZNPNaz1kqmGJtmF7HHA
 dcvkvsTIDXlPb1LMR0JIxxYM5tH81NeOJlW1MeCdAkEWwhRUq6Jmkja8YKLKbDquOrRh
 H/JNCohUWAN2oAyr6TP1Y/U2VBMFUMMx6csdtkAP6/7pjAt2NQP4eUel5o4W65gspjXD Sg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3juxwtmbwe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Sep 2022 12:33:00 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28R9t5QP018170;
 Tue, 27 Sep 2022 12:32:59 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3juxwtmbwa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Sep 2022 12:32:59 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28RCKVWX012548;
 Tue, 27 Sep 2022 12:32:59 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04wdc.us.ibm.com with ESMTP id 3jssh9cfj0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Sep 2022 12:32:58 +0000
Received: from smtpav05.dal12v.mail.ibm.com ([9.208.128.132])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 28RCWxae8323830
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Sep 2022 12:33:00 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC1025804C;
 Tue, 27 Sep 2022 12:32:57 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 337E858056;
 Tue, 27 Sep 2022 12:32:57 +0000 (GMT)
Received: from localhost (unknown [9.77.133.152])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Tue, 27 Sep 2022 12:32:56 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, Daniel Henrique Barboza
 <danielhb413@gmail.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] target/ppc: restore powerpc_excp_booke doorbell interrupts
In-Reply-To: <20220924114436.1422786-1-npiggin@gmail.com>
References: <20220924114436.1422786-1-npiggin@gmail.com>
Date: Tue, 27 Sep 2022 09:32:55 -0300
Message-ID: <871qrx5760.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Lo_IBFmh8gD6iAo8XAULWTBrRZtxK86J
X-Proofpoint-GUID: uoGv2MgbhuD6LDD9I1Cxg_reoCxMobAP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-27_03,2022-09-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 mlxscore=0 suspectscore=0 mlxlogscore=979
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209270073
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> This partially reverts commit 9dc20cc37db9 ("target/ppc: Simplify
> powerpc_excp_booke"), which removed DOORI and DOORCI interrupts.
> Without this patch, a -cpu e5500 -smp 2 machine booting Linux
> crashes with:
>
>   qemu: fatal: Invalid PowerPC exception 36. Aborting
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  target/ppc/excp_helper.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 214acf5ac4..43f2480e94 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1247,6 +1247,12 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
>      case POWERPC_EXCP_SPEU:   /* SPE/embedded floating-point unavailable/VPU  */
>          env->spr[SPR_BOOKE_ESR] = ESR_SPV;
>          break;
> +    case POWERPC_EXCP_DOORI:     /* Embedded doorbell interrupt              */
> +        break;
> +    case POWERPC_EXCP_DOORCI:    /* Embedded doorbell critical interrupt     */
> +        srr0 = SPR_BOOKE_CSRR0;
> +        srr1 = SPR_BOOKE_CSRR1;
> +        break;
>      case POWERPC_EXCP_RESET:     /* System reset exception                   */
>          if (FIELD_EX64(env->msr, MSR, POW)) {
>              cpu_abort(cs, "Trying to deliver power-saving system
> reset "

Ah, booke always trips me up.

Since BookE has exception handler locations defined at runtime, the
env->excp_vectors array doesn't really need to be initialized with valid
exceptions/addresses (that is done on demand at
translate.c:spr_write_excp_vector). So, unlike the other ppc variants,
the init_excp_BookE/e200 code is not an exhaustive list of the
exceptions that might exist.

Note that with this patch the doorbells behave differently if we try to
dispatch the exception before the OS has touched the IVORs. For all
other exceptions we dispatch at 0x0 + prefix while for the doorbells
we'd bail here:

    vector = env->excp_vectors[excp];
    if (vector == (target_ulong)-1ULL) {
        cpu_abort(cs, "Raised an exception without defined vector %d\n",
                  excp);
    }

We might want to consider adding DOORI/DOORCI to init_excp_BookE. Or
alternatively remove all of the 0x0 initialization from that
function.

The fix is good anyway:

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

