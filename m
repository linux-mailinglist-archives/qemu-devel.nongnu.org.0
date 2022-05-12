Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84745525603
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 21:47:13 +0200 (CEST)
Received: from localhost ([::1]:44616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npEmG-0001sO-1f
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 15:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1npEig-000839-BJ; Thu, 12 May 2022 15:43:30 -0400
Received: from [187.72.171.209] (port=25741 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1npEie-0003R0-CD; Thu, 12 May 2022 15:43:29 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 12 May 2022 16:43:06 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id E07D0800C32;
 Thu, 12 May 2022 16:43:05 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br
Subject: [RFC PATCH 2/2] target/ppc: Rely on do_float_check_status for
 VSX_MADD invalid excepts
Date: Thu, 12 May 2022 16:42:50 -0300
Message-Id: <20220512194250.138244-3-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220512194250.138244-1-victor.colombo@eldorado.org.br>
References: <20220512194250.138244-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 12 May 2022 19:43:06.0230 (UTC)
 FILETIME=[80309960:01D86638]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Make necessary changes for Multiply-Add instructions to use the
proposed reworked exceptions handling in do_float_check_status.

This should allow for cleaner code, not requiring the helper to check
multiple exceptions in its body.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/fpu_helper.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 988ddba282..a73a955b63 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2226,11 +2226,6 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
         t.fld = tp##_muladd(s1->fld, s3->fld, s2->fld, maddflgs, &tstat);     \
         env->fp_status.float_exception_flags |= tstat.float_exception_flags;  \
                                                                               \
-        if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {     \
-            float_invalid_op_madd(env, tstat.float_exception_flags,           \
-                                  sfifprf, GETPC());                          \
-        }                                                                     \
-                                                                              \
         if (sfifprf) {                                                        \
             helper_compute_fprf_float64(env, t.fld);                          \
         }                                                                     \
-- 
2.25.1


