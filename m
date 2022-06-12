Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEE0547CB1
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 00:02:33 +0200 (CEST)
Received: from localhost ([::1]:41052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0VfC-0006dm-RS
	for lists+qemu-devel@lfdr.de; Sun, 12 Jun 2022 18:02:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=m6xm=WT=zx2c4.com=Jason@kernel.org>)
 id 1o0Vcx-0004ot-Kw
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 18:00:11 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:48744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=m6xm=WT=zx2c4.com=Jason@kernel.org>)
 id 1o0Vcv-0000ys-H9
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 18:00:11 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0766761170;
 Sun, 12 Jun 2022 22:00:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E444CC34115;
 Sun, 12 Jun 2022 21:59:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="EGjI6xpH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1655071197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=+Ma3tYIAJRBLE1K1ZU5TfBMc99L/GKs10ywzqtFKe8Y=;
 b=EGjI6xpH/G/ManoSfjBElYtcwl3Sefyw2LvuzFLgeGNCiVwLR7PxWvGzdX9h3wIgk80Ss4
 NNeArLw97/+zbp4tzVNs7p03r1B/JDuniSxu7ZsUcx6sECPyk/bcizAV8JBPLXkpQFUNmB
 ET6J3Jl6gHpW28TigIAqyLJvICTCZco=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ff0d6404
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Sun, 12 Jun 2022 21:59:56 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Stafford Horne <shorne@gmail.com>
Subject: [PATCH] hw/openrisc: pass random seed to fdt
Date: Sun, 12 Jun 2022 23:59:49 +0200
Message-Id: <20220612215949.134807-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=m6xm=WT=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
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

If the FDT contains /chosen/rng-seed, then the Linux RNG will use it to
initialize early. Set this using the usual guest random number
generation function. This is confirmed to successfully initialize the
RNG on Linux 5.19-rc2.

Cc: Stafford Horne <shorne@gmail.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/openrisc/openrisc_sim.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index 35adce17ac..41821b5f30 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
+#include "qemu/guest-random.h"
 #include "qapi/error.h"
 #include "cpu.h"
 #include "hw/irq.h"
@@ -115,6 +116,7 @@ static void openrisc_create_fdt(Or1ksimState *state,
     int cpu;
     char *nodename;
     int pic_ph;
+    uint8_t rng_seed[32];
 
     fdt = state->fdt = create_device_tree(&state->fdt_size);
     if (!fdt) {
@@ -165,6 +167,10 @@ static void openrisc_create_fdt(Or1ksimState *state,
         qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
     }
 
+    /* Pass seed to RNG. */
+    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
+    qemu_fdt_setprop(fdt, "/chosen", "rng-seed", rng_seed, sizeof(rng_seed));
+
     /* Create aliases node for use by devices. */
     qemu_fdt_add_subnode(fdt, "/aliases");
 }
-- 
2.35.1


