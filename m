Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6456E15FE
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 22:38:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn3c2-0003ji-8h; Thu, 13 Apr 2023 16:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pn3bu-0003fn-1o; Thu, 13 Apr 2023 16:32:03 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pn3bn-0003id-Ou; Thu, 13 Apr 2023 16:32:01 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 58F6640131;
 Thu, 13 Apr 2023 23:31:55 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id DC87B95;
 Thu, 13 Apr 2023 23:31:53 +0300 (MSK)
Received: (nullmailer pid 2344340 invoked by uid 1000);
 Thu, 13 Apr 2023 20:31:53 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 06/21] target/s390x: Fix emulation of C(G)HRL
Date: Thu, 13 Apr 2023 23:31:18 +0300
Message-Id: <20230413203143.2344250-6-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230413203051.2344192-1-mjt@tls.msk.ru>
References: <20230413203051.2344192-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

From: Nina Schoetterl-Glausch <nsg@linux.ibm.com>

The second operand of COMPARE HALFWORD RELATIVE LONG is a signed
halfword, it does not have the same size as the first operand.

Fixes: a7e836d5eb ("target-s390: Convert COMPARE, COMPARE LOGICAL")
Signed-off-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20230310114157.3024170-2-nsg@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
(cherry picked from commit 54fce97cfcaf5463ee5f325bc1f1d4adc2772f38)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target/s390x/tcg/insn-data.h.inc | 4 ++--
 target/s390x/tcg/translate.c     | 7 +++++++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/s390x/tcg/insn-data.h.inc b/target/s390x/tcg/insn-data.h.inc
index 54d4250c9f..2a5fc99818 100644
--- a/target/s390x/tcg/insn-data.h.inc
+++ b/target/s390x/tcg/insn-data.h.inc
@@ -199,8 +199,8 @@
     C(0xe55c, CHSI,    SIL,   GIE, m1_32s, i2, 0, 0, 0, cmps64)
     C(0xe558, CGHSI,   SIL,   GIE, m1_64, i2, 0, 0, 0, cmps64)
 /* COMPARE HALFWORD RELATIVE LONG */
-    C(0xc605, CHRL,    RIL_b, GIE, r1_o, mri2_32s, 0, 0, 0, cmps32)
-    C(0xc604, CGHRL,   RIL_b, GIE, r1_o, mri2_64, 0, 0, 0, cmps64)
+    C(0xc605, CHRL,    RIL_b, GIE, r1_o, mri2_16s, 0, 0, 0, cmps32)
+    C(0xc604, CGHRL,   RIL_b, GIE, r1_o, mri2_16s, 0, 0, 0, cmps64)
 /* COMPARE HIGH */
     C(0xb9cd, CHHR,    RRE,   HW,  r1_sr32, r2_sr32, 0, 0, 0, cmps32)
     C(0xb9dd, CHLR,    RRE,   HW,  r1_sr32, r2_o, 0, 0, 0, cmps32)
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 1e599ac259..9c3ee5ed72 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6050,6 +6050,13 @@ static void in2_m2_64a(DisasContext *s, DisasOps *o)
 #define SPEC_in2_m2_64a 0
 #endif
 
+static void in2_mri2_16s(DisasContext *s, DisasOps *o)
+{
+    o->in2 = tcg_temp_new_i64();
+    tcg_gen_qemu_ld16s(o->in2, gen_ri2(s), get_mem_index(s));
+}
+#define SPEC_in2_mri2_16s 0
+
 static void in2_mri2_16u(DisasContext *s, DisasOps *o)
 {
     in2_ri2(s, o);
-- 
2.30.2


