Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02979403935
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 13:57:29 +0200 (CEST)
Received: from localhost ([::1]:59234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNwCm-0008Bo-26
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 07:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mNwAe-0005YP-1P
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 07:55:16 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59020
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mNwAb-0005Fg-QN
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 07:55:15 -0400
Received: from host86-140-11-91.range86-140.btcentralplus.com ([86.140.11.91]
 helo=kentang.home) by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mNwAV-0009u6-SS; Wed, 08 Sep 2021 12:55:11 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Wed,  8 Sep 2021 12:54:41 +0100
Message-Id: <20210908115451.9821-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210908115451.9821-1-mark.cave-ayland@ilande.co.uk>
References: <20210908115451.9821-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.140.11.91
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 02/12] tcg: Drop gen_io_end()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Now we have removed all the uses of gen_io_end() from target frontends,
the only callsite is inside gen_tb_start(). Inline the code there,
and remove the reference to it from the documentation.

While we are inlining the code, switch it to use tcg_constant_i32()
so we don't have to manually create and destroy a TCG temporary.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210724134902.7785-3-peter.maydell@linaro.org>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 docs/devel/tcg-icount.rst |  3 ---
 include/exec/gen-icount.h | 27 ++++++++++-----------------
 2 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/docs/devel/tcg-icount.rst b/docs/devel/tcg-icount.rst
index 8d67b6c076..50c8e8dabc 100644
--- a/docs/devel/tcg-icount.rst
+++ b/docs/devel/tcg-icount.rst
@@ -92,6 +92,3 @@ When the translator is handling an instruction of this kind:
     }
 
 * it must end the TB immediately after this instruction
-
-Note that some older front-ends call a "gen_io_end()" function:
-this is obsolete and should not be used.
diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
index 467529d84c..610cba58fe 100644
--- a/include/exec/gen-icount.h
+++ b/include/exec/gen-icount.h
@@ -17,22 +17,6 @@ static inline void gen_io_start(void)
     tcg_temp_free_i32(tmp);
 }
 
-/*
- * cpu->can_do_io is cleared automatically at the beginning of
- * each translation block.  The cost is minimal and only paid
- * for -icount, plus it would be very easy to forget doing it
- * in the translator.  Therefore, backends only need to call
- * gen_io_start.
- */
-static inline void gen_io_end(void)
-{
-    TCGv_i32 tmp = tcg_const_i32(0);
-    tcg_gen_st_i32(tmp, cpu_env,
-                   offsetof(ArchCPU, parent_obj.can_do_io) -
-                   offsetof(ArchCPU, env));
-    tcg_temp_free_i32(tmp);
-}
-
 static inline void gen_tb_start(const TranslationBlock *tb)
 {
     TCGv_i32 count;
@@ -64,7 +48,16 @@ static inline void gen_tb_start(const TranslationBlock *tb)
         tcg_gen_st16_i32(count, cpu_env,
                          offsetof(ArchCPU, neg.icount_decr.u16.low) -
                          offsetof(ArchCPU, env));
-        gen_io_end();
+        /*
+         * cpu->can_do_io is cleared automatically here at the beginning of
+         * each translation block.  The cost is minimal and only paid for
+         * -icount, plus it would be very easy to forget doing it in the
+         * translator. Doing it here means we don't need a gen_io_end() to
+         * go with gen_io_start().
+         */
+        tcg_gen_st_i32(tcg_constant_i32(0), cpu_env,
+                       offsetof(ArchCPU, parent_obj.can_do_io) -
+                       offsetof(ArchCPU, env));
     }
 
     tcg_temp_free_i32(count);
-- 
2.20.1


