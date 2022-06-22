Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1DC5545DB
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 13:48:27 +0200 (CEST)
Received: from localhost ([::1]:32920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3yqQ-0000Q7-96
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 07:48:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=9o3N=W5=zx2c4.com=Jason@kernel.org>)
 id 1o3ynw-0007z7-Q8
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 07:45:52 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:37752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=9o3N=W5=zx2c4.com=Jason@kernel.org>)
 id 1o3ynu-0007KM-Oc
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 07:45:52 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 386BE61705;
 Wed, 22 Jun 2022 11:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43F53C34114;
 Wed, 22 Jun 2022 11:45:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="SgQ/A6hK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1655898338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c6zeBGUvw+slSLWmpUrVML59rfJPYwSVd+GNl0CKGOw=;
 b=SgQ/A6hKhecuoPDxFYBPNQhvnbnHRwugM76N7EwDyUL1Ue+7tqul+Frd9b2P0AFTaJE3tA
 N2zBE7yv89Fsai7OM1vGJZOWM6Gr4xG+5TWAll6QlA1NuTcJBuVhbhbX89jhOeSmoSIG+Q
 QpHhyl13DE8QNqUhNwSuWXYTDFF42Ac=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cf779c80
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 22 Jun 2022 11:45:38 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Stafford Horne <shorne@gmail.com>
Subject: [PATCH v2] hw/openrisc: virt: pass random seed to fdt
Date: Wed, 22 Jun 2022 13:45:13 +0200
Message-Id: <20220622114513.293882-1-Jason@zx2c4.com>
In-Reply-To: <CAHmME9o_Oq7TKFXx-rxRxpVR-akE+gVCutK879Tp_ubVwEu=TA@mail.gmail.com>
References: <CAHmME9o_Oq7TKFXx-rxRxpVR-akE+gVCutK879Tp_ubVwEu=TA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=9o3N=W5=zx2c4.com=Jason@kernel.org;
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
Changes v1->v2:
- This is rebased on top of your "or1k-virt-2" branch.
- It makes the change to the new "virt" platform, since that's where it
  makes most sense to have.

 hw/openrisc/virt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/openrisc/virt.c b/hw/openrisc/virt.c
index 13b0a1d7dc..f1d62fcb7d 100644
--- a/hw/openrisc/virt.c
+++ b/hw/openrisc/virt.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
+#include "qemu/guest-random.h"
 #include "qapi/error.h"
 #include "cpu.h"
 #include "exec/address-spaces.h"
@@ -141,6 +142,7 @@ static void openrisc_create_fdt(OR1KVirtState *state,
     void *fdt;
     int cpu;
     char *nodename;
+    uint8_t rng_seed[32];
 
     fdt = state->fdt = create_device_tree(&state->fdt_size);
     if (!fdt) {
@@ -197,6 +199,10 @@ static void openrisc_create_fdt(OR1KVirtState *state,
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


