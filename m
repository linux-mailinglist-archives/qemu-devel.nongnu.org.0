Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5C15046CA
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 08:07:38 +0200 (CEST)
Received: from localhost ([::1]:45064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfy4P-0004kp-FI
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 02:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yvt@gabby.8vit.me>) id 1nfy1L-000464-CN
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 02:04:27 -0400
Received: from applejack.8vit.me ([165.227.58.191]:51388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yvt@gabby.8vit.me>) id 1nfy1J-0000Tg-PA
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 02:04:27 -0400
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=192.168.28.2;
 helo=gabby.8vit.me; envelope-from=yvt@gabby.8vit.me; receiver=<UNKNOWN> 
Received: from gabby.8vit.me (unknown [192.168.28.2])
 by applejack.8vit.me (Postfix) with ESMTPS id 0567123F7F4;
 Sun, 17 Apr 2022 15:02:53 +0900 (JST)
Received: by gabby.8vit.me (Postfix, from userid 1000)
 id B0A131A7495; Sun, 17 Apr 2022 15:02:52 +0900 (JST)
From: Tomoaki Kawada <i@yvt.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/rx: update PC correctly in wait instruction
Date: Sun, 17 Apr 2022 15:02:25 +0900
Message-Id: <20220417060224.2131788-1-i@yvt.jp>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=165.227.58.191; envelope-from=yvt@gabby.8vit.me;
 helo=applejack.8vit.me
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_NONE=0.001,
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
Cc: Tomoaki Kawada <i@yvt.jp>, Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

`cpu_pc` at this point does not necessary point to the current
instruction (i.e., the wait instruction being translated), so it's
incorrect to calculate the new value of `cpu_pc` based on this. It must
be updated with `ctx->base.pc_next`, which contains the correct address
of the next instruction.

This change fixes the wait instruction skipping the subsequent branch
when used in an idle loop like this:

    0:  wait
        bra.b 0b
        brk   // should be unreachable

Signed-off-by: Tomoaki Kawada <i@yvt.jp>
---
 target/rx/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/rx/translate.c b/target/rx/translate.c
index 5db8f79a82..f8812e7a6c 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -2281,7 +2281,7 @@ static bool trans_INT(DisasContext *ctx, arg_INT *a)
 static bool trans_WAIT(DisasContext *ctx, arg_WAIT *a)
 {
     if (is_privileged(ctx, 1)) {
-        tcg_gen_addi_i32(cpu_pc, cpu_pc, 2);
+        tcg_gen_movi_i32(cpu_pc, ctx->base.pc_next);
         gen_helper_wait(cpu_env);
     }
     return true;
-- 
2.35.1


