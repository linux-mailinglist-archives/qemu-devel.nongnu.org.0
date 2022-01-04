Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B713848497C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 21:53:29 +0100 (CET)
Received: from localhost ([::1]:52960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4qoC-0001H5-FI
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 15:53:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n4qma-0000QE-9G; Tue, 04 Jan 2022 15:51:48 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n4qmY-00078V-Mt; Tue, 04 Jan 2022 15:51:48 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 204JrSIu031003; 
 Tue, 4 Jan 2022 20:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=/MIB7NFvW5UCRnu2JdO9BkMCSwSmaQdOFod1D+N5RGQ=;
 b=Jou38eVMlZG94hh93s2/O6ebtAIyUrxZ5pmpCRHq8qZASyC/RVvYAR0vgHyjhpbfsKZy
 nT45RKZC46dzgK0QqDIopmp30SF1Bd8nZigM1L8Ojwhf2ivXc/TxL1ayodURy78jjZaZ
 5x7A7oECZL99r5CfFbIf2nT4Z6agNTjvK9gjeOfNJbTntHkqMzIksKfnTp4GHNq6uiQa
 0Wd3K2sXWA8idvngW1Htvdp5ZxTDS1eKnk4VeZ36rp2EYFi7gXGD7bWjgSta8gQ8knLF
 9X547HpIjNFb49rgoh41zFrWmSXi4YZAT/U5aN4nt596Sv9VItVLSQn2bdOf8byTRdcH Kg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcp2qhdvp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 20:51:32 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 204Kp6pp030108;
 Tue, 4 Jan 2022 20:51:32 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcp2qhdvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 20:51:32 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 204KmYfZ031128;
 Tue, 4 Jan 2022 20:51:31 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04dal.us.ibm.com with ESMTP id 3daekbesvw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 20:51:31 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 204KpUmr33489358
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Jan 2022 20:51:30 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25FDD78067;
 Tue,  4 Jan 2022 20:51:30 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85B5E78074;
 Tue,  4 Jan 2022 20:51:29 +0000 (GMT)
Received: from localhost (unknown [9.163.4.248])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue,  4 Jan 2022 20:51:29 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 6/9] target/ppc: powerpc_excp: Preserve MSR_LE bit
In-Reply-To: <20220103220746.3916246-7-farosas@linux.ibm.com>
References: <20220103220746.3916246-1-farosas@linux.ibm.com>
 <20220103220746.3916246-7-farosas@linux.ibm.com>
Date: Tue, 04 Jan 2022 17:51:27 -0300
Message-ID: <87fsq3ns1c.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: W5ku9CrUuyneDdeSZ0CKjET5pLWF_vHB
X-Proofpoint-ORIG-GUID: D-131QxTs27woGGZk2eGecx-YFZerVbJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_10,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 mlxscore=0
 mlxlogscore=578 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201040133
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fabiano Rosas <farosas@linux.ibm.com> writes:

> We currently clear MSR_LE when copying bits from env->msr to
> new_msr. However, for CPUs that do not have LPCR_ILE we always set
> new_msr[LE] according to env->msr[LE]. And for CPUs that do have ILE
> support we need to check LPCR/HID0 anyway, so there's no need to clear
> the bit when copying.
>
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  target/ppc/excp_helper.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
>
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 5d31940426..e56ddbe5d5 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -348,10 +348,10 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
>      }
>  
>      /*
> -     * new interrupt handler msr preserves existing HV and ME unless
> -     * explicitly overriden
> +     * new interrupt handler msr preserves existing HV, ME and LE
> +     * unless explicitly overriden.
>       */
> -    new_msr = env->msr & (((target_ulong)1 << MSR_ME) | MSR_HVB);
> +    new_msr = env->msr & (((target_ulong)1 << MSR_ME) | MSR_HVB | MSR_LE);
>  
>      /* target registers */
>      srr0 = SPR_SRR0;
> @@ -763,13 +763,9 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
>      if (excp_model >= POWERPC_EXCP_970) {
>          if (ppc_interrupts_little_endian(cpu, !!(new_msr & MSR_HVB))) {
>              new_msr |= (target_ulong)1 << MSR_LE;
> +        } else {
> +            new_msr &= ~((target_ulong)1 << MSR_LE);
>          }
> -    } else if (msr_ile) {
> -        new_msr |= (target_ulong)1 << MSR_LE;
> -    }
> -#else
> -    if (msr_ile) {
> -        new_msr |= (target_ulong)1 << MSR_LE;
>      }
>  #endif

This patch is incorrect, don't bother with it. I misread the msr_ile
macro as msr_le. I'll think of an alternative.

