Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1639B360905
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 14:14:03 +0200 (CEST)
Received: from localhost ([::1]:50354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX0sj-00081r-KT
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 08:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lX0rL-0006uC-IM; Thu, 15 Apr 2021 08:12:35 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:23168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lX0rH-0006Yu-Qd; Thu, 15 Apr 2021 08:12:35 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13FC2p9s062408; Thu, 15 Apr 2021 08:12:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=F+tlrPmyVBpSdEYaBC1y14WKy9/DITrf6OM+wrrUkrI=;
 b=OSmCwquLVNqFTZ+1P+WSFU9PVZ4SYV5k24DSVtsDqVeewVWalAHVaGngsHMjyQkJa4gz
 aAQqeNj6qJWwSgNouaNK5dkaeKCjuxSLm2jKC6KOhcFvbI4rH2Oe/+nXOXGrEF5oQqfT
 Z2E0qqqq66kAqMzmIkyStmDl5yLwQqF5CzCoUvUEkVAU/QL/5p6jQTmLlhF85sWOnZOF
 kl4BaH34v8WOMdI0bFtNUKsN6a2bkTEMuwxUIQ1TMHiOX+uh7LNWwE6mYQLHSCm4YPsR
 UVB0NUe19GEZwgJb1M5JPo5wGVRZsnGxUcR+gZ3Um6C+SYWQe6+xSEHJr71Pq/fM1gXO zA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37x5apfd53-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 08:12:27 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13FC2w4o063362;
 Thu, 15 Apr 2021 08:12:27 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37x5apfd4e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 08:12:27 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13FCC0fa005641;
 Thu, 15 Apr 2021 12:12:26 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01dal.us.ibm.com with ESMTP id 37u3na38f2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 12:12:26 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13FCCPqt30212416
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Apr 2021 12:12:25 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ADA50AE060;
 Thu, 15 Apr 2021 12:12:25 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D96A9AE05C;
 Thu, 15 Apr 2021 12:12:24 +0000 (GMT)
Received: from localhost (unknown [9.211.84.45])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 15 Apr 2021 12:12:24 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Subject: Re: [PATCH v2 1/4] target/ppc: Fix POWER9 radix guest HV interrupt
 AIL behaviour
In-Reply-To: <20210415054227.1793812-2-npiggin@gmail.com>
References: <20210415054227.1793812-1-npiggin@gmail.com>
 <20210415054227.1793812-2-npiggin@gmail.com>
Date: Thu, 15 Apr 2021 09:12:21 -0300
Message-ID: <87k0p3zqze.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _akNgD1JhD0o9MaFklrPMtV5QzSXKHMo
X-Proofpoint-ORIG-GUID: 08VmclVAkZ_422Z6xoPYyq7Kqr2sYNql
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_04:2021-04-15,
 2021-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104150081
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@fr.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> ISA v3.0 radix guest execution has a quirk in AIL behaviour such that
> the LPCR[AIL] value can apply to hypervisor interrupts.
>
> This affects machines that emulate HV=1 mode (i.e., powernv9).
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  target/ppc/excp_helper.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 85de7e6c90..b8881c0f85 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -791,14 +791,23 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>  #endif
>  
>      /*
> -     * AIL only works if there is no HV transition and we are running
> -     * with translations enabled
> +     * AIL only works if MSR[IR] and MSR[DR] are both enabled.
>       */
> -    if (!((msr >> MSR_IR) & 1) || !((msr >> MSR_DR) & 1) ||
> -        ((new_msr & MSR_HVB) && !(msr & MSR_HVB))) {
> +    if (!((msr >> MSR_IR) & 1) || !((msr >> MSR_DR) & 1)) {
>          ail = 0;
>      }
>  
> +    /*
> +     * AIL does not work if there is a MSR[HV] 0->1 transition and the
> +     * partition is in HPT mode. For radix guests, such interrupts are
> +     * allowed to be delivered to the hypervisor in ail mode.
> +     */
> +    if ((new_msr & MSR_HVB) && !(msr & MSR_HVB)) {
> +        if (!(env->spr[SPR_LPCR] & LPCR_HR)) {
> +            ail = 0;
> +        }
> +    }
> +
>      vector = env->excp_vectors[excp];
>      if (vector == (target_ulong)-1ULL) {
>          cpu_abort(cs, "Raised an exception without defined vector %d\n",

