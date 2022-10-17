Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2356007A2
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 09:24:12 +0200 (CEST)
Received: from localhost ([::1]:51790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okKTq-0000Dq-JP
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 03:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1okJn1-0005JR-Ii
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 02:39:56 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57826 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1okJmz-0002Sf-7P
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 02:39:55 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id AQAAf8CxhOSw+Exj8gMAAA--.86S3;
 Mon, 17 Oct 2022 14:39:47 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	stefanha@gmail.com
Subject: [PULL 1/5] target/loongarch: bstrins.w src register need EXT_NONE
Date: Mon, 17 Oct 2022 14:39:40 +0800
Message-Id: <20221017063944.1443723-2-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221017063944.1443723-1-gaosong@loongson.cn>
References: <20221017063944.1443723-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxhOSw+Exj8gMAAA--.86S3
X-Coremail-Antispam: 1UD129KBjvJXoWxXFykJFyrKrWrJrW8Xw1rXrb_yoW5Ww13pF
 yUCry8Kr4UXas3Zr92va1DuFnrXFs5Kw47WayIk34rCay5Xr1jgr4xK3sIkry0yrs5X3yv
 yFs5uryjga15JwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

use gen_bstrins/gen_bstrpic to replace gen_rr_ms_ls.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220930024510.800005-2-gaosong@loongson.cn>
---
 target/loongarch/insn_trans/trans_bit.c.inc | 36 +++++++++++++--------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/target/loongarch/insn_trans/trans_bit.c.inc b/target/loongarch/insn_trans/trans_bit.c.inc
index 9337714ec4..b01e4aeb23 100644
--- a/target/loongarch/insn_trans/trans_bit.c.inc
+++ b/target/loongarch/insn_trans/trans_bit.c.inc
@@ -27,26 +27,34 @@ static void gen_bytepick_d(TCGv dest, TCGv src1, TCGv src2, target_long sa)
     tcg_gen_extract2_i64(dest, src1, src2, (64 - sa * 8));
 }
 
-static void gen_bstrins(TCGv dest, TCGv src1,
-                        unsigned int ls, unsigned int len)
+static bool gen_bstrins(DisasContext *ctx, arg_rr_ms_ls *a,
+                        DisasExtend dst_ext)
 {
-    tcg_gen_deposit_tl(dest, dest, src1, ls, len);
+    TCGv src1 = gpr_src(ctx, a->rd, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+
+    if (a->ls > a->ms) {
+        return false;
+    }
+
+    tcg_gen_deposit_tl(dest, src1, src2, a->ls, a->ms - a->ls + 1);
+    gen_set_gpr(a->rd, dest, dst_ext);
+    return true;
 }
 
-static bool gen_rr_ms_ls(DisasContext *ctx, arg_rr_ms_ls *a,
-                         DisasExtend src_ext, DisasExtend dst_ext,
-                         void (*func)(TCGv, TCGv, unsigned int, unsigned int))
+static bool gen_bstrpick(DisasContext *ctx, arg_rr_ms_ls *a,
+                         DisasExtend dst_ext)
 {
-    TCGv dest = gpr_dst(ctx, a->rd, dst_ext);
-    TCGv src1 = gpr_src(ctx, a->rj, src_ext);
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
 
     if (a->ls > a->ms) {
         return false;
     }
 
-    func(dest, src1, a->ls, a->ms - a->ls + 1);
+    tcg_gen_extract_tl(dest, src1, a->ls, a->ms - a->ls + 1);
     gen_set_gpr(a->rd, dest, dst_ext);
-
     return true;
 }
 
@@ -206,7 +214,7 @@ TRANS(maskeqz, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, gen_maskeqz)
 TRANS(masknez, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, gen_masknez)
 TRANS(bytepick_w, gen_rrr_sa, EXT_NONE, EXT_NONE, gen_bytepick_w)
 TRANS(bytepick_d, gen_rrr_sa, EXT_NONE, EXT_NONE, gen_bytepick_d)
-TRANS(bstrins_w, gen_rr_ms_ls, EXT_NONE, EXT_NONE, gen_bstrins)
-TRANS(bstrins_d, gen_rr_ms_ls, EXT_NONE, EXT_NONE, gen_bstrins)
-TRANS(bstrpick_w, gen_rr_ms_ls, EXT_NONE, EXT_SIGN, tcg_gen_extract_tl)
-TRANS(bstrpick_d, gen_rr_ms_ls, EXT_NONE, EXT_NONE, tcg_gen_extract_tl)
+TRANS(bstrins_w, gen_bstrins, EXT_SIGN)
+TRANS(bstrins_d, gen_bstrins, EXT_NONE)
+TRANS(bstrpick_w, gen_bstrpick, EXT_SIGN)
+TRANS(bstrpick_d, gen_bstrpick, EXT_NONE)
-- 
2.31.1


