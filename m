Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F942A7D9A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 12:55:52 +0100 (CET)
Received: from localhost ([::1]:55536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kadrr-0007kA-UO
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 06:55:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kadqo-0007JJ-U3
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 06:54:46 -0500
Received: from mail.ispras.ru ([83.149.199.84]:60882)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kadql-0000mw-Mh
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 06:54:46 -0500
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 116B540A2075;
 Thu,  5 Nov 2020 11:54:37 +0000 (UTC)
Subject: [PATCH] target/openrisc: fix icount handling for timer instructions
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Thu, 05 Nov 2020 14:54:36 +0300
Message-ID: <160457727672.17573.9713521384015502561.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/05 06:54:37
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Cc: shorne@gmail.com, pavel.dovgalyuk@ispras.ru, proljc@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds icount handling to mfspr/mtspr instructions
that may deal with hardware timers.

Signed-off-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
---
 target/openrisc/translate.c |   15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index c6dce879f1..a9c81f8bd5 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -884,6 +884,18 @@ static bool trans_l_mfspr(DisasContext *dc, arg_l_mfspr *a)
         gen_illegal_exception(dc);
     } else {
         TCGv spr = tcg_temp_new();
+
+        if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
+            gen_io_start();
+            if (dc->delayed_branch) {
+                tcg_gen_mov_tl(cpu_pc, jmp_pc);
+                tcg_gen_discard_tl(jmp_pc);
+            } else {
+                tcg_gen_movi_tl(cpu_pc, dc->base.pc_next + 4);
+            }
+            dc->base.is_jmp = DISAS_EXIT;
+        }
+
         tcg_gen_ori_tl(spr, cpu_R(dc, a->a), a->k);
         gen_helper_mfspr(cpu_R(dc, a->d), cpu_env, cpu_R(dc, a->d), spr);
         tcg_temp_free(spr);
@@ -898,6 +910,9 @@ static bool trans_l_mtspr(DisasContext *dc, arg_l_mtspr *a)
     } else {
         TCGv spr;
 
+        if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
+            gen_io_start();
+        }
         /* For SR, we will need to exit the TB to recognize the new
          * exception state.  For NPC, in theory this counts as a branch
          * (although the SPR only exists for use by an ICE).  Save all


