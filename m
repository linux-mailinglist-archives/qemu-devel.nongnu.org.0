Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB5046DEDE
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 00:09:15 +0100 (CET)
Received: from localhost ([::1]:58632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv63m-0003Rs-3G
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 18:09:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mv61n-0002i0-Hj; Wed, 08 Dec 2021 18:07:11 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:64624
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mv61l-0002Qy-F1; Wed, 08 Dec 2021 18:07:11 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B8MwTVY019673; 
 Wed, 8 Dec 2021 23:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=lmFrxLyEdemNhNc/q0CYoNek4RET+AgClarTeLGv7b4=;
 b=cIblaL1JnNFVRYvzEyRu2AskNxFGBVZZRoWoB1qzQkgTGoHkP0c7zNbdjddvUYAWRbTs
 sid9Jra4ojNLcSJLlaVd1ufMN7MwOVxP/Z3vSgl+doRPqlDxKHxEE/8mNLncT3h/2t5W
 jAD8R57LAqtntmNg5EsGrUjb6ri9Z1y8nrrsYQB2F2dLQyPy2/FIC7z40uvyUwgEBXvA
 N0zTz5cFtkIdgswxdKwg6wPTMqoRWfIKie0IJmJY6mVq1jLGr5FY1t6S36rK9z9rszHV
 Ae1Y80mjcgdiFIjMlKgKNMMxhf9kb/626+uoVMdSthrKdIVuxRU7/EFBc5SdvNwQGpns 8w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cu5ykg4hg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 23:07:00 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B8N6xjY023523;
 Wed, 8 Dec 2021 23:06:59 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cu5ykg4ha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 23:06:59 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B8N26Yd021374;
 Wed, 8 Dec 2021 23:06:58 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02wdc.us.ibm.com with ESMTP id 3cqyybc5qj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 23:06:58 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B8N6wDj27066730
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Dec 2021 23:06:58 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1FF4DAC091;
 Wed,  8 Dec 2021 23:06:58 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 311E4AC08F;
 Wed,  8 Dec 2021 23:06:56 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.43.72])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  8 Dec 2021 23:06:55 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/ppc: powerpc_excp: Guard ALIGNMENT interrupt with
 CONFIG_TCG
Date: Wed,  8 Dec 2021 20:06:50 -0300
Message-Id: <20211208230650.2125095-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YfSpB_EkgNUzv3givJLchaRm0PlAeGu4
X-Proofpoint-ORIG-GUID: o_7fycAdfRLC5T8XJHDLIpBwMx897jeJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-08_08,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 mlxlogscore=885 mlxscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112080127
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
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We cannot have TCG code in powerpc_excp because the function is called
from kvm-only code via ppc_cpu_do_interrupt:

 ../target/ppc/excp_helper.c:463:29: error: implicit declaration of
 function ‘cpu_ldl_code’ [-Werror=implicit-function-declaration]

Fortunately, the Alignment interrupt is not among the ones dispatched
from kvm-only code, so we can keep it out of the disable-tcg build for
now.

Fixes: 336e91f853 ("target/ppc: Move SPR_DSISR setting to powerpc_excp")
Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

---

Perhaps we could make powerpc_excp TCG only and have a separate
function that only knows the two interrupts that we use with KVM
(Program, Machine check). But for now this fix will do, I think.
---
 target/ppc/excp_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 17607adbe4..dcf22440cc 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -453,6 +453,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
         }
         break;
     }
+#ifdef CONFIG_TCG
     case POWERPC_EXCP_ALIGN:     /* Alignment exception                      */
         /*
          * Get rS/rD and rA from faulting opcode.
@@ -464,6 +465,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
             env->spr[SPR_DSISR] |= (insn & 0x03FF0000) >> 16;
         }
         break;
+#endif
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
         case POWERPC_EXCP_FP:
-- 
2.33.1


