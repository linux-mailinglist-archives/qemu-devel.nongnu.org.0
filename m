Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7AD553D78
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 23:22:37 +0200 (CEST)
Received: from localhost ([::1]:49564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3lKW-0003oB-0d
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 17:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1o3lJQ-0002td-Qh; Tue, 21 Jun 2022 17:21:28 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1o3lJO-0006LB-8c; Tue, 21 Jun 2022 17:21:28 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25LK3VHP024663;
 Tue, 21 Jun 2022 21:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=437h6QLVy78DzpJSiY0pAnBUIlrNMibujzAS7sXT3Ps=;
 b=fTAUNbq3hPsCeY5+Dql/OmMgZwQcH2KeF2KnF0j5rFHiL/1LFop7SrBywzCUqW0fklgP
 sEsl8hNCW6ea4Mtft2XVFgKNTTuBPXAg4JS4U+aIHzPTa/Jt3lgh6qsLSdgwaWX4cNKn
 sNwoIL7hmA/8nKoJxjbLKn836YEgDftQY58zZpuab8szcINJE4QQrPlOfq59FllTqYVp
 DEVaAQkvRH/ka8m1TxSFGcnFr3k7jNfNa849QmOmifSUzzg5MfHRz8wUXH89pI2Zz70/
 NvDouVle+ysEF+yNmvOH7ktdAMeKRmSRezH/kl86+CehaECL34r9lJ54KOWaL9Ee6Qzg 7A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gumpm20sf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jun 2022 21:21:08 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25LKqOYu005445;
 Tue, 21 Jun 2022 21:21:08 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gumpm20s0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jun 2022 21:21:08 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25LL5lw4011807;
 Tue, 21 Jun 2022 21:21:07 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 3gs6b9efv3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jun 2022 21:21:07 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25LLL7ob28115348
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jun 2022 21:21:07 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECCCEBE053;
 Tue, 21 Jun 2022 21:21:06 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28B94BE04F;
 Tue, 21 Jun 2022 21:21:06 +0000 (GMT)
Received: from localhost (unknown [9.160.71.76])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 21 Jun 2022 21:21:05 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: Re: [PATCH 2/3] target/ppc: Improve Radix xlate level validation
In-Reply-To: <20220620202704.78978-3-leandro.lupori@eldorado.org.br>
References: <20220620202704.78978-1-leandro.lupori@eldorado.org.br>
 <20220620202704.78978-3-leandro.lupori@eldorado.org.br>
Date: Tue, 21 Jun 2022 18:21:03 -0300
Message-ID: <87h74daf28.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: S9xxtYR8QZqdsMdvJlniIpzI9rf_cGY_
X-Proofpoint-ORIG-GUID: ZT7b_v1IvxNSY_7chz2-JSw5nPO2ALuH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_09,2022-06-21_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011
 mlxlogscore=999 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206210089
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

> Check if the number and size of Radix levels are valid on
> POWER9/POWER10 CPUs, according to the supported Radix Tree
> Configurations described in their User Manuals.
>
> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> ---
>  target/ppc/mmu-radix64.c | 36 +++++++++++++++++++++++++++++-------
>  1 file changed, 29 insertions(+), 7 deletions(-)
>
> diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
> index 9a8a2e2875..2f0bcbfe2e 100644
> --- a/target/ppc/mmu-radix64.c
> +++ b/target/ppc/mmu-radix64.c
> @@ -236,13 +236,31 @@ static void ppc_radix64_set_rc(PowerPCCPU *cpu, MMUAccessType access_type,
>      }
>  }
>  
> +static bool ppc_radix64_is_valid_level(int level, int psize, uint64_t nls)

I wonder if we should take the time to make this per-CPU now to prepare
for any future CPU that supports a different layout.


