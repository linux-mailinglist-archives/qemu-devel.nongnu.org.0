Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D62F07C6
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Nov 2019 22:10:05 +0100 (CET)
Received: from localhost ([::1]:50092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iS65U-00048j-JE
	for lists+qemu-devel@lfdr.de; Tue, 05 Nov 2019 16:10:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58307)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mdroth@linux.vnet.ibm.com>) id 1iS5p4-0000P5-O3
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 15:53:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mdroth@linux.vnet.ibm.com>) id 1iS5p2-0001yn-UT
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 15:53:06 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43478)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mdroth@linux.vnet.ibm.com>)
 id 1iS5oz-0001us-0h; Tue, 05 Nov 2019 15:53:01 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA5KpcYW028474; Tue, 5 Nov 2019 15:52:59 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w3dd0xuw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2019 15:52:59 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xA5Knt3B031285;
 Tue, 5 Nov 2019 20:52:58 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01dal.us.ibm.com with ESMTP id 2w11e7hh8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2019 20:52:58 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xA5Kqv6O48693684
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Nov 2019 20:52:57 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F587124054;
 Tue,  5 Nov 2019 20:52:57 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C569124052;
 Tue,  5 Nov 2019 20:52:57 +0000 (GMT)
Received: from localhost (unknown [9.53.179.218])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  5 Nov 2019 20:52:57 +0000 (GMT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/55] target/arm: Don't abort on M-profile exception return
 in linux-user mode
Date: Tue,  5 Nov 2019 14:52:07 -0600
Message-Id: <20191105205243.3766-20-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191105205243.3766-1-mdroth@linux.vnet.ibm.com>
References: <20191105205243.3766-1-mdroth@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-05_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1911050170
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

An attempt to do an exception-return (branch to one of the magic
addresses) in linux-user mode for M-profile should behave like
a normal branch, because linux-user mode is always going to be
in 'handler' mode. This used to work, but we broke it when we added
support for the M-profile security extension in commit d02a8698d7ae2bfed.

In that commit we allowed even handler-mode calls to magic return
values to be checked for and dealt with by causing an
EXCP_EXCEPTION_EXIT exception to be taken, because this is
needed for the FNC_RETURN return-from-non-secure-function-call
handling. For system mode we added a check in do_v7m_exception_exit()
to make any spurious calls from Handler mode behave correctly, but
forgot that linux-user mode would also be affected.

How an attempted return-from-non-secure-function-call in linux-user
mode should be handled is not clear -- on real hardware it would
result in return to secure code (not to the Linux kernel) which
could then handle the error in any way it chose. For QEMU we take
the simple approach of treating this erroneous return the same way
it would be handled on a CPU without the security extensions --
treat it as a normal branch.

The upshot of all this is that for linux-user mode we should never
do any of the bx_excret magic, so the code change is simple.

This ought to be a weird corner case that only affects broken guest
code (because Linux user processes should never be attempting to do
exception returns or NS function returns), except that the code that
assigns addresses in RAM for the process and stack in our linux-user
code does not attempt to avoid this magic address range, so
legitimate code attempting to return to a trampoline routine on the
stack can fall into this case. This change fixes those programs,
but we should also look at restricting the range of memory we
use for M-profile linux-user guests to the area that would be
real RAM in hardware.

Cc: qemu-stable@nongnu.org
Reported-by: Christophe Lyon <christophe.lyon@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20190822131534.16602-1-peter.maydell@linaro.org
Fixes: https://bugs.launchpad.net/qemu/+bug/1840922
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
(cherry picked from commit 5e5584c89f36b302c666bc6db535fd3f7ff35ad2)
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 target/arm/translate.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7853462b21..24cb4ba075 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -952,10 +952,27 @@ static inline void gen_bx(DisasContext *s, TCGv_i32 var)
     store_cpu_field(var, thumb);
 }
 
-/* Set PC and Thumb state from var. var is marked as dead.
+/*
+ * Set PC and Thumb state from var. var is marked as dead.
  * For M-profile CPUs, include logic to detect exception-return
  * branches and handle them. This is needed for Thumb POP/LDM to PC, LDR to PC,
  * and BX reg, and no others, and happens only for code in Handler mode.
+ * The Security Extension also requires us to check for the FNC_RETURN
+ * which signals a function return from non-secure state; this can happen
+ * in both Handler and Thread mode.
+ * To avoid having to do multiple comparisons in inline generated code,
+ * we make the check we do here loose, so it will match for EXC_RETURN
+ * in Thread mode. For system emulation do_v7m_exception_exit() checks
+ * for these spurious cases and returns without doing anything (giving
+ * the same behaviour as for a branch to a non-magic address).
+ *
+ * In linux-user mode it is unclear what the right behaviour for an
+ * attempted FNC_RETURN should be, because in real hardware this will go
+ * directly to Secure code (ie not the Linux kernel) which will then treat
+ * the error in any way it chooses. For QEMU we opt to make the FNC_RETURN
+ * attempt behave the way it would on a CPU without the security extension,
+ * which is to say "like a normal branch". That means we can simply treat
+ * all branches as normal with no magic address behaviour.
  */
 static inline void gen_bx_excret(DisasContext *s, TCGv_i32 var)
 {
@@ -963,10 +980,12 @@ static inline void gen_bx_excret(DisasContext *s, TCGv_i32 var)
      * s->base.is_jmp that we need to do the rest of the work later.
      */
     gen_bx(s, var);
+#ifndef CONFIG_USER_ONLY
     if (arm_dc_feature(s, ARM_FEATURE_M_SECURITY) ||
         (s->v7m_handler_mode && arm_dc_feature(s, ARM_FEATURE_M))) {
         s->base.is_jmp = DISAS_BX_EXCRET;
     }
+#endif
 }
 
 static inline void gen_bx_excret_final_code(DisasContext *s)
-- 
2.17.1


