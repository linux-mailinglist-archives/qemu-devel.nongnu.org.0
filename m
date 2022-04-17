Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA865046BA
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 07:05:32 +0200 (CEST)
Received: from localhost ([::1]:57768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfx6I-0008LE-IB
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 01:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yvt@gabby.8vit.me>) id 1nfx2d-0006rr-IW
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 01:01:43 -0400
Received: from applejack.8vit.me ([165.227.58.191]:49964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yvt@gabby.8vit.me>) id 1nfx2Y-0000FA-QD
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 01:01:42 -0400
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=192.168.28.2;
 helo=gabby.8vit.me; envelope-from=yvt@gabby.8vit.me; receiver=<UNKNOWN> 
Received: from gabby.8vit.me (unknown [192.168.28.2])
 by applejack.8vit.me (Postfix) with ESMTPS id 65F5B23FAB2;
 Sun, 17 Apr 2022 14:00:05 +0900 (JST)
Received: by gabby.8vit.me (Postfix, from userid 1000)
 id DED4F1A7495; Sun, 17 Apr 2022 14:00:03 +0900 (JST)
From: Tomoaki Kawada <i@yvt.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/rx: set PSW.I when executing wait instruction
Date: Sun, 17 Apr 2022 13:59:38 +0900
Message-Id: <20220417045937.2128699-1-i@yvt.jp>
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

This patch fixes the implementation of the wait instruction to
implicitly update PSW.I as required by the ISA specification.

Signed-off-by: Tomoaki Kawada <i@yvt.jp>
---
 target/rx/op_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
index 11f952d340..81645adde3 100644
--- a/target/rx/op_helper.c
+++ b/target/rx/op_helper.c
@@ -448,6 +448,7 @@ void QEMU_NORETURN helper_wait(CPURXState *env)
 
     cs->halted = 1;
     env->in_sleep = 1;
+    env->psw_i = 1;
     raise_exception(env, EXCP_HLT, 0);
 }
 
-- 
2.35.1


