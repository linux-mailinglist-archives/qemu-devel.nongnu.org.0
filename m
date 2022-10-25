Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A13B960C021
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 02:51:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on83H-0004xO-G5; Mon, 24 Oct 2022 20:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=a4uw=22=zx2c4.com=Jason@kernel.org>)
 id 1on83F-0004wz-HP
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 20:44:17 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=a4uw=22=zx2c4.com=Jason@kernel.org>)
 id 1on83E-0005Hh-1g
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 20:44:17 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 89171B8170E;
 Tue, 25 Oct 2022 00:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C4FC433D6;
 Tue, 25 Oct 2022 00:44:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="WvMDl5so"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1666658652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ATL8rtbSuz39xKOTaSAyB9TBkVZPhRXgfwvL3gzMBVU=;
 b=WvMDl5soWa2tbJw/FpyB8EEPETQXNrirx+IcbqNCCKylFZ82oNd+78xyy4Op7XFBkyUs51
 VK4BzL77rlrukeJdf2e4VWClKhbipxeGckq96/VrXB1ucm3J0SMj4cjCIsGO2riZsMoOpF
 xLqcZfBOOd9CfehyRWtL7X2Ubh2vXf0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7bfb554f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 25 Oct 2022 00:44:11 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: peter.maydell@linaro.org, pbonzini@redhat.com, qemu-devel@nongnu.org,
 richard.henderson@linaro.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Stafford Horne <shorne@gmail.com>
Subject: [PATCH v4 10/11] openrisc: re-randomize rng-seed on reboot
Date: Tue, 25 Oct 2022 02:43:26 +0200
Message-Id: <20221025004327.568476-11-Jason@zx2c4.com>
In-Reply-To: <20221025004327.568476-1-Jason@zx2c4.com>
References: <20221025004327.568476-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=a4uw=22=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When the system reboots, the rng-seed that the FDT has should be
re-randomized, so that the new boot gets a new seed. Since the FDT is in
the ROM region at this point, we add a hook right after the ROM has been
added, so that we have a pointer to that copy of the FDT.

Cc: Stafford Horne <shorne@gmail.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/openrisc/boot.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/openrisc/boot.c b/hw/openrisc/boot.c
index 128ccbcba2..007e80cd5a 100644
--- a/hw/openrisc/boot.c
+++ b/hw/openrisc/boot.c
@@ -14,6 +14,7 @@
 #include "hw/openrisc/boot.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/qtest.h"
+#include "sysemu/reset.h"
 
 #include <libfdt.h>
 
@@ -111,6 +112,8 @@ uint32_t openrisc_load_fdt(void *fdt, hwaddr load_start,
 
     rom_add_blob_fixed_as("fdt", fdt, fdtsize, fdt_addr,
                           &address_space_memory);
+    qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
+                        rom_ptr_for_as(&address_space_memory, fdt_addr, fdtsize));
 
     return fdt_addr;
 }
-- 
2.38.1


