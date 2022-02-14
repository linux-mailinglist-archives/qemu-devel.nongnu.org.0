Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A3C4B531C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 15:21:18 +0100 (CET)
Received: from localhost ([::1]:35376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJcE9-0002S7-6H
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 09:21:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nJbT6-0001FL-7V; Mon, 14 Feb 2022 08:32:41 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:32330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nJbT4-0005JL-JA; Mon, 14 Feb 2022 08:32:39 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21ECndVL007767; 
 Mon, 14 Feb 2022 13:32:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=R+JU/Iww6mMuN2ssfI/XXaEFFPT6A2N+E7at6gIGoIQ=;
 b=Im7FahSFsDZGFcIvGE71ud2n3H+AJdsJDxXNBBWuDdZlr7yM/38IG3oZuwDccp+Mp3kq
 nnFR26lZFpQENim420VeRK1hyXk9fKmmQSkUb9ua5IIBJA6hS22WkJapZmyiCSepzUQB
 uMb/KZUqIn9PtBIDbOW2u8ydLwz0HsYNT0fos8hAGbW/4cLZVSew8KeijgNWp861qmED
 U1gI3KxoViqVHZFjNEMwDudDG7D20Nt6rpcdEBfj8fx/q6lmU4hbSZpMhtIDDhwADjq1
 w9HJOIDA4YDCRnRrfW0nK4h2+pJ0mMFf8Qvr6g3U8fDEzZRqc63juWhe+lf+DD2DUOnR 4Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e78m0j2m8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 13:32:36 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21ECw29p004893;
 Mon, 14 Feb 2022 13:32:36 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e78m0j2kr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 13:32:36 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21EDCqan008643;
 Mon, 14 Feb 2022 13:32:34 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01wdc.us.ibm.com with ESMTP id 3e64h9yvv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 13:32:34 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21EDWX8535193108
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 13:32:33 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4CE231120A7;
 Mon, 14 Feb 2022 13:32:33 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38E53112085;
 Mon, 14 Feb 2022 13:32:32 +0000 (GMT)
Received: from localhost (unknown [9.211.47.159])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 14 Feb 2022 13:32:31 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Subject: Re: [PATCH] spapr: prevent hdec timer being set up under virtual
 hypervisor
In-Reply-To: <20220214123116.1546406-1-npiggin@gmail.com>
References: <20220214123116.1546406-1-npiggin@gmail.com>
Date: Mon, 14 Feb 2022 10:32:29 -0300
Message-ID: <87mtitlgk2.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: b1YhpBBVExvxCXsIFcaZAwrZHNACuTkK
X-Proofpoint-ORIG-GUID: QWmdZ7z8eUxqvYK-TXOVYMeXV3Uld_n-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_06,2022-02-14_03,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 mlxscore=0 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140082
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> The spapr virtual hypervisor does not require the hdecr timer.

Why is that? Is this not needed for an emulated powernv running KVM
guests?

> Remove it.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  hw/ppc/ppc.c            | 2 +-
>  hw/ppc/spapr_cpu_core.c | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index 462c87dba8..a7c262db93 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -1072,7 +1072,7 @@ clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, uint32_t freq)
>      }
>      /* Create new timer */
>      tb_env->decr_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &cpu_ppc_decr_cb, cpu);
> -    if (env->has_hv_mode) {
> +    if (env->has_hv_mode && !cpu->vhyp) {
>          tb_env->hdecr_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &cpu_ppc_hdecr_cb,
>                                                  cpu);
>      } else {
> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> index a781e97f8d..ed84713960 100644
> --- a/hw/ppc/spapr_cpu_core.c
> +++ b/hw/ppc/spapr_cpu_core.c
> @@ -261,12 +261,12 @@ static bool spapr_realize_vcpu(PowerPCCPU *cpu, SpaprMachineState *spapr,
>          return false;
>      }
>  
> -    /* Set time-base frequency to 512 MHz */
> -    cpu_ppc_tb_init(env, SPAPR_TIMEBASE_FREQ);
> -
>      cpu_ppc_set_vhyp(cpu, PPC_VIRTUAL_HYPERVISOR(spapr));
>      kvmppc_set_papr(cpu);
>  
> +    /* Set time-base frequency to 512 MHz. vhyp must be set first. */
> +    cpu_ppc_tb_init(env, SPAPR_TIMEBASE_FREQ);
> +
>      if (spapr_irq_cpu_intc_create(spapr, cpu, errp) < 0) {
>          qdev_unrealize(DEVICE(cpu));
>          return false;

