Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7E55185C9
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 15:42:26 +0200 (CEST)
Received: from localhost ([::1]:55360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlsnJ-0007za-J6
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 09:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shuizhuyuanluo@126.com>)
 id 1nlsjf-0004HZ-7t
 for qemu-devel@nongnu.org; Tue, 03 May 2022 09:38:39 -0400
Received: from m15112.mail.126.com ([220.181.15.112]:53344)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shuizhuyuanluo@126.com>) id 1nlsjZ-0003rq-Pm
 for qemu-devel@nongnu.org; Tue, 03 May 2022 09:38:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=4q369
 F+1rPOHa31tLcmfY3aa3/mPlTPUBiBc+g94g+8=; b=kLvXlKUxb39gfC2QghE6w
 EqCL8qVXcBdgo+eaMWkfXyXGGeU5HxkYcX2aDwCdbeI30x7O4ti4aw371rf4qUKO
 dUY1p9qhLBzv60yVjijLN+hYFE7hcj1IQNJu1hzhuLYqpSe2a8mHZskyXSN9BQZi
 kXwmeARLlRBE3MOhnojq/I=
Received: from localhost.localdomain (unknown [101.228.28.144])
 by smtp2 (Coremail) with SMTP id DMmowABHS_38KHFixa2dBA--.22839S5;
 Tue, 03 May 2022 21:07:09 +0800 (CST)
From: nihui <shuizhuyuanluo@126.com>
To: qemu-devel@nongnu.org
Cc: Ni Hui <shuizhuyuanluo@126.com>
Subject: [PATCH 4/4] target/mips: Do not treat msa INSERT as NOP when wd is
 zero
Date: Tue,  3 May 2022 21:07:08 +0800
Message-Id: <20220503130708.272850-4-shuizhuyuanluo@126.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220503130708.272850-1-shuizhuyuanluo@126.com>
References: <20220503130708.272850-1-shuizhuyuanluo@126.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMmowABHS_38KHFixa2dBA--.22839S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw1UtrW8Ar1fuF1fZry5Arb_yoW8Wryrpr
 18CF47Wa1rtayfXayUWF4DJw4Fyr1Sq3Wjg3Z2ywn5Zr98Grs8Jr4Utr12kF45XFZ29F15
 ZF4Yya47G3y2krUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR45l8UUUUU=
X-Originating-IP: [101.228.28.144]
X-CM-SenderInfo: pvkxx65kx13tpqox0qqrswhudrp/1tbibR71elpEAEFykgAAsD
Received-SPF: pass client-ip=220.181.15.112;
 envelope-from=shuizhuyuanluo@126.com; helo=m15112.mail.126.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Ni Hui <shuizhuyuanluo@126.com>

Only for msa COPY_U/COPY_S with wd zero, we treat it as NOP.

Move this special rule into COPY_U and COPY_S trans function.

Signed-off-by: Ni Hui <shuizhuyuanluo@126.com>
---
 target/mips/tcg/msa_translate.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 92ccc6f921..0b3dd0957c 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -603,11 +603,6 @@ static bool trans_msa_elm_fn(DisasContext *ctx, arg_msa_elm_df *a,
         return true;
     }
 
-    if (a->wd == 0) {
-        /* Treat as NOP. */
-        return true;
-    }
-
     gen_msa_elm[a->df](cpu_env,
                        tcg_constant_i32(a->wd),
                        tcg_constant_i32(a->ws),
@@ -624,6 +619,11 @@ static bool trans_msa_elm_fn(DisasContext *ctx, arg_msa_elm_df *a,
 
 static bool trans_COPY_U(DisasContext *ctx, arg_msa_elm_df *a)
 {
+    if (a->wd == 0) {
+        /* Treat as NOP. */
+        return true;
+    }
+
     static gen_helper_piii * const gen_msa_copy_u[4] = {
         gen_helper_msa_copy_u_b, gen_helper_msa_copy_u_h,
         NULL_IF_MIPS32(gen_helper_msa_copy_u_w), NULL
@@ -634,6 +634,11 @@ static bool trans_COPY_U(DisasContext *ctx, arg_msa_elm_df *a)
 
 static bool trans_COPY_S(DisasContext *ctx, arg_msa_elm_df *a)
 {
+    if (a->wd == 0) {
+        /* Treat as NOP. */
+        return true;
+    }
+
     static gen_helper_piii * const gen_msa_copy_s[4] = {
         gen_helper_msa_copy_s_b, gen_helper_msa_copy_s_h,
         gen_helper_msa_copy_s_w, NULL_IF_MIPS32(gen_helper_msa_copy_s_d)
-- 
2.25.1


