Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E396E15ED
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 22:35:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn3c7-0003mu-0z; Thu, 13 Apr 2023 16:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pn3bv-0003gc-Ld; Thu, 13 Apr 2023 16:32:05 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pn3bs-0003jh-Ix; Thu, 13 Apr 2023 16:32:03 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id B882840132;
 Thu, 13 Apr 2023 23:31:55 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 5047795;
 Thu, 13 Apr 2023 23:31:54 +0300 (MSK)
Received: (nullmailer pid 2344343 invoked by uid 1000);
 Thu, 13 Apr 2023 20:31:54 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 07/21] target/s390x: Split out gen_ri2
Date: Thu, 13 Apr 2023 23:31:19 +0300
Message-Id: <20230413203143.2344250-7-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230413203051.2344192-1-mjt@tls.msk.ru>
References: <20230413203051.2344192-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Use tcg_constant_i64.  Adjust in2_mri2_* to allocate a new
temporary for the output, using gen_ri2 for the address.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
(cherry picked from commit bdbc87e323ee417735141ed2b11dab0091b57593)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target/s390x/tcg/translate.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 9c3ee5ed72..ab60b51e31 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -5962,9 +5962,14 @@ static void in2_a2(DisasContext *s, DisasOps *o)
 }
 #define SPEC_in2_a2 0
 
+static TCGv gen_ri2(DisasContext *s)
+{
+    return tcg_constant_i64(s->base.pc_next + (int64_t)get_field(s, i2) * 2);
+}
+
 static void in2_ri2(DisasContext *s, DisasOps *o)
 {
-    o->in2 = tcg_const_i64(s->base.pc_next + (int64_t)get_field(s, i2) * 2);
+    o->in2 = gen_ri2(s);
 }
 #define SPEC_in2_ri2 0
 
@@ -6059,29 +6064,29 @@ static void in2_mri2_16s(DisasContext *s, DisasOps *o)
 
 static void in2_mri2_16u(DisasContext *s, DisasOps *o)
 {
-    in2_ri2(s, o);
-    tcg_gen_qemu_ld16u(o->in2, o->in2, get_mem_index(s));
+    o->in2 = tcg_temp_new_i64();
+    tcg_gen_qemu_ld16u(o->in2, gen_ri2(s), get_mem_index(s));
 }
 #define SPEC_in2_mri2_16u 0
 
 static void in2_mri2_32s(DisasContext *s, DisasOps *o)
 {
-    in2_ri2(s, o);
-    tcg_gen_qemu_ld32s(o->in2, o->in2, get_mem_index(s));
+    o->in2 = tcg_temp_new_i64();
+    tcg_gen_qemu_ld32s(o->in2, gen_ri2(s), get_mem_index(s));
 }
 #define SPEC_in2_mri2_32s 0
 
 static void in2_mri2_32u(DisasContext *s, DisasOps *o)
 {
-    in2_ri2(s, o);
-    tcg_gen_qemu_ld32u(o->in2, o->in2, get_mem_index(s));
+    o->in2 = tcg_temp_new_i64();
+    tcg_gen_qemu_ld32u(o->in2, gen_ri2(s), get_mem_index(s));
 }
 #define SPEC_in2_mri2_32u 0
 
 static void in2_mri2_64(DisasContext *s, DisasOps *o)
 {
-    in2_ri2(s, o);
-    tcg_gen_qemu_ld64(o->in2, o->in2, get_mem_index(s));
+    o->in2 = tcg_temp_new_i64();
+    tcg_gen_qemu_ld64(o->in2, gen_ri2(s), get_mem_index(s));
 }
 #define SPEC_in2_mri2_64 0
 
-- 
2.30.2


