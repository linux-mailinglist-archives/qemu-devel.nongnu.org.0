Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id 582DC38759
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 11:49:45 +0200 (CEST)
Received: from localhost ([::1]:47632 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZBVF-0005iM-1E
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 05:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41490)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hZAuV-0000xp-F4
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 05:11:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hZAuP-0002wm-FS
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 05:11:43 -0400
Received: from mail02.asahi-net.or.jp ([202.224.55.14]:41551)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hZAuO-0002qz-T0
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 05:11:37 -0400
Received: from h61-195-96-97.vps.ablenet.jp (h61-195-96-97.ablenetvps.ne.jp
 [61.195.96.97]) (Authenticated sender: PQ4Y-STU)
 by mail02.asahi-net.or.jp (Postfix) with ESMTPA id 098BD41900;
 Fri,  7 Jun 2019 18:11:32 +0900 (JST)
Received: from yo-satoh-debian.localdomain (ZM005235.ppp.dion.ne.jp
 [222.8.5.235])
 by h61-195-96-97.vps.ablenet.jp (Postfix) with ESMTPSA id B72A0240085;
 Fri,  7 Jun 2019 18:11:31 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Date: Fri,  7 Jun 2019 18:11:13 +0900
Message-Id: <20190607091116.49044-22-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190607091116.49044-1-ysato@users.sourceforge.jp>
References: <20190607091116.49044-1-ysato@users.sourceforge.jp>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 202.224.55.14
Subject: [Qemu-devel] [PATCH v17 21/24] target/rx: Emit all disassembly in
 one prt()
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
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Many of the multi-part prints have been eliminated by previous
patches.  Eliminate the rest of them.

Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 target/rx/disas.c | 75 +++++++++++++++++++++++++++++--------------------------
 1 file changed, 39 insertions(+), 36 deletions(-)

diff --git a/target/rx/disas.c b/target/rx/disas.c
index db10385fd0..ebc1a44249 100644
--- a/target/rx/disas.c
+++ b/target/rx/disas.c
@@ -228,24 +228,21 @@ static bool trans_MOV_ra(DisasContext *ctx, arg_MOV_ra *a)
 /* mov.[bwl] rs,rd */
 static bool trans_MOV_mm(DisasContext *ctx, arg_MOV_mm *a)
 {
-    char dspd[8], dsps[8];
+    char dspd[8], dsps[8], szc = size[a->sz];
 
-    prt("mov.%c\t", size[a->sz]);
     if (a->lds == 3 && a->ldd == 3) {
         /* mov.[bwl] rs,rd */
-        prt("r%d, r%d", a->rs, a->rd);
-        return true;
-    }
-    if (a->lds == 3) {
+        prt("mov.%c\tr%d, r%d", szc, a->rs, a->rd);
+    } else if (a->lds == 3) {
         rx_index_addr(ctx, dspd, a->ldd, a->sz);
-        prt("r%d, %s[r%d]", a->rs, dspd, a->rd);
+        prt("mov.%c\tr%d, %s[r%d]", szc, a->rs, dspd, a->rd);
     } else if (a->ldd == 3) {
         rx_index_addr(ctx, dsps, a->lds, a->sz);
-        prt("%s[r%d], r%d", dsps, a->rs, a->rd);
+        prt("mov.%c\t%s[r%d], r%d", szc, dsps, a->rs, a->rd);
     } else {
         rx_index_addr(ctx, dsps, a->lds, a->sz);
         rx_index_addr(ctx, dspd, a->ldd, a->sz);
-        prt("%s[r%d], %s[r%d]", dsps, a->rs, dspd, a->rd);
+        prt("mov.%c\t%s[r%d], %s[r%d]", szc, dsps, a->rs, dspd, a->rd);
     }
     return true;
 }
@@ -254,8 +251,11 @@ static bool trans_MOV_mm(DisasContext *ctx, arg_MOV_mm *a)
 /* mov.[bwl] rs,[-rd] */
 static bool trans_MOV_rp(DisasContext *ctx, arg_MOV_rp *a)
 {
-    prt("mov.%c\tr%d, ", size[a->sz], a->rs);
-    prt((a->ad == 0) ? "[r%d+]" : "[-r%d]", a->rd);
+    if (a->ad) {
+        prt("mov.%c\tr%d, [-r%d]", size[a->sz], a->rs, a->rd);
+    } else {
+        prt("mov.%c\tr%d, [r%d+]", size[a->sz], a->rs, a->rd);
+    }
     return true;
 }
 
@@ -263,9 +263,11 @@ static bool trans_MOV_rp(DisasContext *ctx, arg_MOV_rp *a)
 /* mov.[bwl] [-rd],rs */
 static bool trans_MOV_pr(DisasContext *ctx, arg_MOV_pr *a)
 {
-    prt("mov.%c\t", size[a->sz]);
-    prt((a->ad == 0) ? "[r%d+]" : "[-r%d]", a->rd);
-    prt(", r%d", a->rs);
+    if (a->ad) {
+        prt("mov.%c\t[-r%d], r%d", size[a->sz], a->rd, a->rs);
+    } else {
+        prt("mov.%c\t[r%d+], r%d", size[a->sz], a->rd, a->rs);
+    }
     return true;
 }
 
@@ -299,9 +301,11 @@ static bool trans_MOVU_ar(DisasContext *ctx, arg_MOVU_ar *a)
 /* movu.[bw] [-rs],rd */
 static bool trans_MOVU_pr(DisasContext *ctx, arg_MOVU_pr *a)
 {
-    prt("movu.%c\t", size[a->sz]);
-    prt((a->ad == 0) ? "[r%d+]" : "[-r%d]", a->rd);
-    prt(", r%d", a->rs);
+    if (a->ad) {
+        prt("movu.%c\t[-r%d], r%d", size[a->sz], a->rd, a->rs);
+    } else {
+        prt("movu.%c\t[r%d+], r%d", size[a->sz], a->rd, a->rs);
+    }
     return true;
 }
 
@@ -478,11 +482,11 @@ static bool trans_TST_mr(DisasContext *ctx, arg_TST_mr *a)
 /* not rs, rd */
 static bool trans_NOT_rr(DisasContext *ctx, arg_NOT_rr *a)
 {
-    prt("not\t");
     if (a->rs != a->rd) {
-        prt("r%d, ", a->rs);
+        prt("not\tr%d, r%d", a->rs, a->rd);
+    } else {
+        prt("not\tr%d", a->rs);
     }
-    prt("r%d", a->rd);
     return true;
 }
 
@@ -490,11 +494,11 @@ static bool trans_NOT_rr(DisasContext *ctx, arg_NOT_rr *a)
 /* neg rs, rd */
 static bool trans_NEG_rr(DisasContext *ctx, arg_NEG_rr *a)
 {
-    prt("neg\t");
     if (a->rs != a->rd) {
-        prt("r%d, ", a->rs);
+        prt("neg\tr%d, r%d", a->rs, a->rd);
+    } else {
+        prt("neg\tr%d", a->rs);
     }
-    prt("r%d", a->rd);
     return true;
 }
 
@@ -606,11 +610,10 @@ static bool trans_SBB_mr(DisasContext *ctx, arg_SBB_mr *a)
 /* abs rs, rd */
 static bool trans_ABS_rr(DisasContext *ctx, arg_ABS_rr *a)
 {
-    prt("abs\t");
-    if (a->rs == a->rd) {
-        prt("r%d", a->rd);
+    if (a->rs != a->rd) {
+        prt("abs\tr%d, r%d", a->rs, a->rd);
     } else {
-        prt("r%d, r%d", a->rs, a->rd);
+        prt("abs\tr%d", a->rs);
     }
     return true;
 }
@@ -733,11 +736,11 @@ static bool trans_DIVU_mr(DisasContext *ctx, arg_DIVU_mr *a)
 /* shll #imm:5, rs, rd */
 static bool trans_SHLL_irr(DisasContext *ctx, arg_SHLL_irr *a)
 {
-    prt("shll\t#%d, ", a->imm);
     if (a->rs2 != a->rd) {
-        prt("r%d, ", a->rs2);
+        prt("shll\t#%d, r%d, r%d", a->imm, a->rs2, a->rd);
+    } else {
+        prt("shll\t#%d, r%d", a->imm, a->rd);
     }
-    prt("r%d", a->rd);
     return true;
 }
 
@@ -752,11 +755,11 @@ static bool trans_SHLL_rr(DisasContext *ctx, arg_SHLL_rr *a)
 /* shar #imm:5, rs, rd */
 static bool trans_SHAR_irr(DisasContext *ctx, arg_SHAR_irr *a)
 {
-    prt("shar\t#%d,", a->imm);
     if (a->rs2 != a->rd) {
-        prt("r%d, ", a->rs2);
+        prt("shar\t#%d, r%d, r%d", a->imm, a->rs2, a->rd);
+    } else {
+        prt("shar\t#%d, r%d", a->imm, a->rd);
     }
-    prt("r%d", a->rd);
     return true;
 }
 
@@ -771,11 +774,11 @@ static bool trans_SHAR_rr(DisasContext *ctx, arg_SHAR_rr *a)
 /* shlr #imm:5, rs, rd */
 static bool trans_SHLR_irr(DisasContext *ctx, arg_SHLR_irr *a)
 {
-    prt("shlr\t#%d, ", a->imm);
     if (a->rs2 != a->rd) {
-        prt("r%d, ", a->rs2);
+        prt("shlr\t#%d, r%d, r%d", a->imm, a->rs2, a->rd);
+    } else {
+        prt("shlr\t#%d, r%d", a->imm, a->rd);
     }
-    prt("r%d", a->rd);
     return true;
 }
 
-- 
2.11.0


