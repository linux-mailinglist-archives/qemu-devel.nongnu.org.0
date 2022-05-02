Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5004B517A38
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 00:53:45 +0200 (CEST)
Received: from localhost ([::1]:43188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlevH-0003eq-Uz
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 18:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=8Tv5=VK=zx2c4.com=Jason@kernel.org>)
 id 1nleuO-0002xu-Jb
 for qemu-devel@nongnu.org; Mon, 02 May 2022 18:52:48 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:46070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=8Tv5=VK=zx2c4.com=Jason@kernel.org>)
 id 1nleuM-0004Nr-Ea
 for qemu-devel@nongnu.org; Mon, 02 May 2022 18:52:48 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3A41DB81A60;
 Mon,  2 May 2022 22:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6772BC385AC;
 Mon,  2 May 2022 22:52:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="gu3swz4w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1651531953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=jVvqtibdROd/SImZZd0KliWCAmrH5hWUG052WA69KPQ=;
 b=gu3swz4w/Mt631PQWNbyRBtmAIZR7mARZpShm0ZscrKijMtTgBTqy9pk7maDf/l7SL5ETN
 Z+plLevu9kj6tvSOdjmuF4ySxDFdodRFi88VbZVU62twqUT8fFT9QK8Wz5pHUpKPrNLMuO
 U3zAh5eyx5bmPFNZTDHRaRbqTF4/66s=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7a06a0ed
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Mon, 2 May 2022 22:52:33 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-devel@nongnu.org,
	openrisc@lists.librecores.org,
	shorne@gmail.com
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH] target/openrisc: implement shutdown and reset helpers
Date: Tue,  3 May 2022 00:52:30 +0200
Message-Id: <20220502225230.237369-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=8Tv5=VK=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

OpenRISC defines various nop instructions in or1k as meaning shutdown or
reset. Implement these in TCG. This has been tested with Linux and
confirmed to work.

Cc: Stafford Horne <shorne@gmail.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 target/openrisc/helper.h     |  1 +
 target/openrisc/sys_helper.c | 18 ++++++++++++++++++
 target/openrisc/translate.c  |  1 +
 3 files changed, 20 insertions(+)

diff --git a/target/openrisc/helper.h b/target/openrisc/helper.h
index d847814a28..ea3557b3f9 100644
--- a/target/openrisc/helper.h
+++ b/target/openrisc/helper.h
@@ -64,3 +64,4 @@ DEF_HELPER_FLAGS_1(rfe, 0, void, env)
 /* sys */
 DEF_HELPER_FLAGS_3(mtspr, 0, void, env, tl, tl)
 DEF_HELPER_FLAGS_3(mfspr, TCG_CALL_NO_WG, tl, env, tl, tl)
+DEF_HELPER_1(nop, void, i32)
diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
index 48674231e7..f6249896fb 100644
--- a/target/openrisc/sys_helper.c
+++ b/target/openrisc/sys_helper.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "sysemu/runstate.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
@@ -314,3 +315,20 @@ target_ulong HELPER(mfspr)(CPUOpenRISCState *env, target_ulong rd,
     /* for rd is passed in, if rd unchanged, just keep it back.  */
     return rd;
 }
+
+void HELPER(nop)(uint32_t arg)
+{
+#ifndef CONFIG_USER_ONLY
+	switch (arg) {
+	case 0x001: /* NOP_EXIT */
+	case 0x00c: /* NOP_EXIT_SILENT */
+		qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+		break;
+	case 0x00d: /* NOP_RESET */
+		qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+		break;
+	default:
+		break;
+	}
+#endif
+}
diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index 7b8ad43d5f..2e4f3759d4 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -780,6 +780,7 @@ static bool trans_l_sh(DisasContext *dc, arg_store *a)
 
 static bool trans_l_nop(DisasContext *dc, arg_l_nop *a)
 {
+    gen_helper_nop(cpu_R(dc, a->k));
     return true;
 }
 
-- 
2.35.1


