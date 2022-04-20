Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C44508B3E
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:54:09 +0200 (CEST)
Received: from localhost ([::1]:48116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBib-0006el-2r
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nhAgx-0007Us-AP; Wed, 20 Apr 2022 09:48:23 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:4942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nhAgv-0008TS-8w; Wed, 20 Apr 2022 09:48:23 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23KCrCGL001640; 
 Wed, 20 Apr 2022 13:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=GPKGXVgU0ebmE96YypmXVRRcu/9iXVksiUKhPehQu6s=;
 b=hjniJ83QxXC10FMBdT6jbiNcTiDm1RKI2GbFZgOuw/pJ2ohdfLZwkBoylDTTul2GS3W9
 awcbyLdKW+vZrZJt2QhdtXMRjtPWZSP6cOULKaXCWlPKFZtqQzMHCLsX9oilS34j+lO2
 PprUyK2x3f1IWRG2T0I1p9nhOammvtzUIn7k/k+XV3p1n9dORDPoVamGoBeWceEFCGpZ
 HEatuZS7IkBz/W/SDPIrSCGeVAo/zBQ9i180+xoNCqnXgdQcgYgvQYUH6NvUGmaAp+rn
 vA6KyJ+ZdIRmaKhtdIMy7UNqJDOSEOg8bZWa9AEu9Dqv9mD+roqTkaOdijI6ynwrRIbH wQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fg7kbaudv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Apr 2022 13:48:06 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23KCrDFV001816;
 Wed, 20 Apr 2022 13:48:05 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fg7kbaudg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Apr 2022 13:48:05 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23KDixB0026523;
 Wed, 20 Apr 2022 13:48:04 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 3ffneabpwf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Apr 2022 13:48:04 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23KDm3B934931136
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Apr 2022 13:48:03 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 916ABC6055;
 Wed, 20 Apr 2022 13:48:03 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F283DC6059;
 Wed, 20 Apr 2022 13:48:02 +0000 (GMT)
Received: from localhost (unknown [9.65.232.226])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 20 Apr 2022 13:48:02 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Bin Meng <bmeng.cn@gmail.com>, =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH] target/ppc: Fix BookE debug interrupt generation
In-Reply-To: <20220420082006.1096031-1-bmeng.cn@gmail.com>
References: <20220420082006.1096031-1-bmeng.cn@gmail.com>
Date: Wed, 20 Apr 2022 10:48:00 -0300
Message-ID: <87mtgf27e7.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UQv9W6SvrYmG1dUy87BMBFJFYdXwcikr
X-Proofpoint-GUID: b0A4WUiOb9aGvZtHydZ5DwmTyjEEXPYW
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-20_03,2022-04-20_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 mlxscore=0 mlxlogscore=609 bulkscore=0 lowpriorityscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204200081
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bin Meng <bmeng.cn@gmail.com> writes:

> From: Bin Meng <bin.meng@windriver.com>
>
> Per PowerISA v2.07 [1], Book III-E, chapter 7.6 "Interrupt definitions"

Which BookE board are you concerned about? I don't think we have any
BookE ISA v2.07 in QEMU currently.

> "When in Internal Debug Mode with MSR.DE=0, then Instruction Complete
> and Branch Taken debug events cannot occur, and no DBSR status bits
> are set and no subsequent imprecise Debug interrupt will occur."
>
> Current codes do not check MSR.DE bit before setting HFLAGS_SE and
> HFLAGS_BE flag, which would cause the immediate debug interrupt to
> be generated, e.g.: when DBCR0.ICMP bit is set by guest software
> and MSR.DE is not set.
>

The rationale and the change itself look ok.

> [1] https://ibm.ent.box.com/s/jd5w15gz301s5b5dt375mshpq9c3lh4u
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  target/ppc/helper_regs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index 9a691d6833..77bc57415c 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -63,10 +63,10 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
>  
>      if (ppc_flags & POWERPC_FLAG_DE) {
>          target_ulong dbcr0 = env->spr[SPR_BOOKE_DBCR0];
> -        if (dbcr0 & DBCR0_ICMP) {
> +        if ((dbcr0 & DBCR0_ICMP) && msr_de) {
>              hflags |= 1 << HFLAGS_SE;
>          }
> -        if (dbcr0 & DBCR0_BRT) {
> +        if ((dbcr0 & DBCR0_BRT) && msr_de) {
>              hflags |= 1 << HFLAGS_BE;
>          }
>      } else {

