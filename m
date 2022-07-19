Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6A4579ACB
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 14:19:15 +0200 (CEST)
Received: from localhost ([::1]:33890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDmC2-0006OI-O9
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 08:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=TnJG=XY=zx2c4.com=Jason@kernel.org>)
 id 1oDm93-0003Cn-SA
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:16:09 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:47460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=TnJG=XY=zx2c4.com=Jason@kernel.org>)
 id 1oDm91-0002MP-3O
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:16:09 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8079C6182C;
 Tue, 19 Jul 2022 12:16:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5F6EC341D1;
 Tue, 19 Jul 2022 12:16:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="pnPJr8O9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658232963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=paFNJFgLRACHVN8LsQ6P3mttpkeistRrEsmmIMK2MLM=;
 b=pnPJr8O9mfhQMOs92sjVgAaYFB2uuqIFvx5Bx/l2dTr3oQSIqrKvbJyZIP754wDJWU942H
 pPgrpeCm/eeehOLc5XxX9lMkM5VwZ1iGD2YpO4fLfuLrVuE5uXMxXEPUXctLehUzMts3na
 cO4oT91bTuQoXqtdlYxXkHwdoNuc3zs=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5106a23b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 19 Jul 2022 12:16:03 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] hw/guest-loader: pass random seed to fdt
Date: Tue, 19 Jul 2022 14:15:59 +0200
Message-Id: <20220719121559.135355-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=TnJG=XY=zx2c4.com=Jason@kernel.org;
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
generation function. This FDT node is part of the DT specification.

Cc: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/core/guest-loader.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/core/guest-loader.c b/hw/core/guest-loader.c
index 391c875a29..4f8572693c 100644
--- a/hw/core/guest-loader.c
+++ b/hw/core/guest-loader.c
@@ -31,6 +31,7 @@
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qemu/guest-random.h"
 #include "guest-loader.h"
 #include "sysemu/device_tree.h"
 #include "hw/boards.h"
@@ -46,6 +47,7 @@ static void loader_insert_platform_data(GuestLoaderState *s, int size,
     g_autofree char *node = g_strdup_printf("/chosen/module@0x%08" PRIx64,
                                             s->addr);
     uint64_t reg_attr[2] = {cpu_to_be64(s->addr), cpu_to_be64(size)};
+    uint8_t rng_seed[32];
 
     if (!fdt) {
         error_setg(errp, "Cannot modify FDT fields if the machine has none");
@@ -55,6 +57,9 @@ static void loader_insert_platform_data(GuestLoaderState *s, int size,
     qemu_fdt_add_subnode(fdt, node);
     qemu_fdt_setprop(fdt, node, "reg", &reg_attr, sizeof(reg_attr));
 
+    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
+    qemu_fdt_setprop(fdt, node, "rng-seed", rng_seed, sizeof(rng_seed));
+
     if (s->kernel) {
         const char *compat[2] = { "multiboot,module", "multiboot,kernel" };
         if (qemu_fdt_setprop_string_array(fdt, node, "compatible",
-- 
2.35.1


