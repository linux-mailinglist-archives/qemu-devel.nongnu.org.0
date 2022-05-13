Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 133575267FC
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 19:14:20 +0200 (CEST)
Received: from localhost ([::1]:42444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npYrq-0006Jw-OB
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 13:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1npYq3-0004hp-Tt; Fri, 13 May 2022 13:12:27 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35602
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1npYq2-0006h6-4U; Fri, 13 May 2022 13:12:27 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24DEwQla005747;
 Fri, 13 May 2022 17:12:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=WfQ9zSw7d5Gc/n9Zx98YhhZCcsWfB0O90fRuU6DQ/uo=;
 b=pkxL/ODiSl6yfLEABGdnSZlMNaPLzMV++sIy+cISzfCsu3ebf4d//CdmF3GOEnIxS/11
 C63VpmInTZrrG72dcYZIjyEwlUUrAxl/vw7pZVH7ynmhqiH943ettTi/+Fr8PmjCxFu0
 Gt5SDGxDTXCRaKKJtL77sjetiY0ilpfcqRn0+Zs6SwR1jx7nSQ9b1+ozrPsvsj4PPfVb
 7Ikt1A6l0TzbB1CwIcKgxbrZED3FdwUOcp0iKGNrs3W97uUVbpKqFP5nsqeYNK7VhNiS
 42WGeOFCt9K2OUvgTCUy1cbXcDZ1Nge6wvw6Sc8eQdChsa6dnuBkQC8MF63B2AMqvTB9 /Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g1sjkajx3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 May 2022 17:12:11 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24DHAR0v016935;
 Fri, 13 May 2022 17:12:11 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g1sjkajwt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 May 2022 17:12:11 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24DH7ko9003648;
 Fri, 13 May 2022 17:12:10 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma05wdc.us.ibm.com with ESMTP id 3fwgdaksgq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 May 2022 17:12:10 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24DHC9ux41550256
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 May 2022 17:12:09 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B07B9BE053;
 Fri, 13 May 2022 17:12:09 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 038F8BE054;
 Fri, 13 May 2022 17:12:09 +0000 (GMT)
Received: from localhost (unknown [9.160.112.92])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 13 May 2022 17:12:08 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: Re: [PATCH] target/ppc: Fix tlbie
In-Reply-To: <20220503163904.22575-1-leandro.lupori@eldorado.org.br>
References: <20220503163904.22575-1-leandro.lupori@eldorado.org.br>
Date: Fri, 13 May 2022 14:12:06 -0300
Message-ID: <87h75ttl09.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2c1zoYAK-PJcSfWox02a7ZB_UvXCK_bO
X-Proofpoint-ORIG-GUID: HA5q6YRRoq8_8vZzpmJsyWZpuVudv4-A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-13_09,2022-05-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205130073
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leandro Lupori <leandro.lupori@eldorado.org.br> writes:

> Commit 74c4912f097bab98 changed check_tlb_flush() to use
> tlb_flush_all_cpus_synced() instead of calling tlb_flush() on each
> CPU. However, as side effect of this, a CPU executing a ptesync
> after a tlbie will have its TLB flushed only after exiting its
> current Translation Block (TB).
>
> This causes memory accesses to invalid pages to succeed, if they
> happen to be on the same TB as the ptesync.
>
> To fix this, use tlb_flush_all_cpus() instead, that immediately
> flushes the TLB of the CPU executing the ptesync instruction.
>
> Fixes: 74c4912f097bab98 ("target/ppc: Fix synchronization of mttcg with broadcast TLB flushes")
> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  target/ppc/helper_regs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index 9a691d6833..1fa032e4d0 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -293,7 +293,7 @@ void check_tlb_flush(CPUPPCState *env, bool global)
>      if (global && (env->tlb_need_flush & TLB_NEED_GLOBAL_FLUSH)) {
>          env->tlb_need_flush &= ~TLB_NEED_GLOBAL_FLUSH;
>          env->tlb_need_flush &= ~TLB_NEED_LOCAL_FLUSH;
> -        tlb_flush_all_cpus_synced(cs);
> +        tlb_flush_all_cpus(cs);
>          return;
>      }

