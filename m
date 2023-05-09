Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D7A6FC339
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 11:52:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwK0I-0004Xf-1w; Tue, 09 May 2023 05:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pwK0F-0004XQ-NW; Tue, 09 May 2023 05:51:27 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pwK0D-0005jE-Pz; Tue, 09 May 2023 05:51:27 -0400
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3499To4p000446; Tue, 9 May 2023 09:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=AeYuuT5syceWlJOKkFsLWqGSXq/t1My6a3+CF+Dt1Dc=;
 b=jX+hMF/TpD+fQRgNk/CSPeeor0hdOVF9TSY4uxW1RkbnI0UWnZGnj2sTHUAtBl97F/IJ
 xSOxi29ysNWZlcTCmXXx5nZngfT9RG9KmbAZtMa7xY7Fin8tl6FRW7QSeWkVCoQlULPm
 re46NyYVM55O9O/a0CnFChLMkoyJ+gpxe3dQ/hP1iY6GEfbyKpwBCHrNEkrnh93EC8QP
 kPRFJmetE0QvaEwuAxgNr8iyEtxaNoeIOnS9D4b099TRTlW9xaLpBtSpCehIYp/lFXvW
 cCDlNv26ZlFXs4QHQI921hPcc+Yaduqd1YZcUV8lrHInuyg7l2jJ2Zw/tGQtyR+NJo6B 0A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qfjnhadv6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 09:51:22 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3499gar5000562;
 Tue, 9 May 2023 09:51:21 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qfjnhadtr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 09:51:21 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3494FEWf011950;
 Tue, 9 May 2023 09:51:19 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3qf7s8g9fx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 09:51:19 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3499pGJR30868132
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 May 2023 09:51:16 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 926E520049;
 Tue,  9 May 2023 09:51:16 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7323420040;
 Tue,  9 May 2023 09:51:15 +0000 (GMT)
Received: from li-1901474c-32f3-11b2-a85c-fc5ff2c001f3.ibm.com (unknown
 [9.109.242.129])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Tue,  9 May 2023 09:51:15 +0000 (GMT)
Date: Tue, 9 May 2023 15:21:08 +0530
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, harshpb@linux.ibm.com
Subject: Re: [PATCH 6/6] target/ppc: Implement HEIR SPR
Message-ID: <ZFoXjN/PUyDhMDG1@li-1901474c-32f3-11b2-a85c-fc5ff2c001f3.ibm.com>
References: <20230323022237.1807512-1-npiggin@gmail.com>
 <20230323022237.1807512-6-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323022237.1807512-6-npiggin@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: j7aB0s83u_i91oss7MCtY_g2ePoz2Z0o
X-Proofpoint-ORIG-GUID: pRdG0bQTQkePXmXLknKJrvwiZulw9L1N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_06,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 clxscore=1015 adultscore=0 mlxlogscore=786 suspectscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305090074
Received-SPF: pass client-ip=148.163.156.1; envelope-from=harshpb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Mar 23, 2023 at 12:22:37PM +1000, Nicholas Piggin wrote:
> The hypervisor emulation assistance interrupt modifies HEIR to
> contain the value of the instruction which caused the exception.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  target/ppc/cpu.h         |  1 +
>  target/ppc/cpu_init.c    | 23 +++++++++++++++++++++++
>  target/ppc/excp_helper.c | 12 +++++++++++-
>  3 files changed, 35 insertions(+), 1 deletion(-)
> 

<snip>

> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 2e0321ab69..d206903562 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1614,13 +1614,23 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
>      case POWERPC_EXCP_HDECR:     /* Hypervisor decrementer exception         */
>      case POWERPC_EXCP_HDSI:      /* Hypervisor data storage exception        */
>      case POWERPC_EXCP_SDOOR_HV:  /* Hypervisor Doorbell interrupt            */
> -    case POWERPC_EXCP_HV_EMU:
>      case POWERPC_EXCP_HVIRT:     /* Hypervisor virtualization                */
>          srr0 = SPR_HSRR0;
>          srr1 = SPR_HSRR1;
>          new_msr |= (target_ulong)MSR_HVB;
>          new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
>          break;
> +    case POWERPC_EXCP_HV_EMU:
> +        env->spr[SPR_HEIR] = insn;
> +        if (is_prefix_excp(env, insn)) {
> +            uint32_t insn2 = ppc_ldl_code(env, env->nip + 4);
> +            env->spr[SPR_HEIR] |= (uint64_t)insn2 << 32;
> +        }
> +        srr0 = SPR_HSRR0;
> +        srr1 = SPR_HSRR1;
> +        new_msr |= (target_ulong)MSR_HVB;
> +        new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
> +        break;

Since there is a common code, this could be better written like:
    case POWERPC_EXCP_HV_EMU:
        env->spr[SPR_HEIR] = insn;
        if (is_prefix_excp(env, insn)) {
            uint32_t insn2 = ppc_ldl_code(env, env->nip + 4);
            env->spr[SPR_HEIR] |= (uint64_t)insn2 << 32;
        }
	/* fall through below common code for EXCP_HVIRT */
    case POWERPC_EXCP_HVIRT:     /* Hypervisor virtualization                */
        srr0 = SPR_HSRR0;
        srr1 = SPR_HSRR1;
        new_msr |= (target_ulong)MSR_HVB;
        new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
        break;

regards,
Harsh
>      case POWERPC_EXCP_VPU:       /* Vector unavailable exception             */
>      case POWERPC_EXCP_VSXU:       /* VSX unavailable exception               */
>      case POWERPC_EXCP_FU:         /* Facility unavailable exception          */
> -- 
> 2.37.2
> 
> 

