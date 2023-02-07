Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D60068E393
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 23:49:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPWlw-0003gK-32; Tue, 07 Feb 2023 17:49:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=KxRu=6D=zx2c4.com=Jason@kernel.org>)
 id 1pPWlu-0003ft-AK
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 17:49:06 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=KxRu=6D=zx2c4.com=Jason@kernel.org>)
 id 1pPWls-00027c-2g
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 17:49:05 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C480261309;
 Tue,  7 Feb 2023 22:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32584C4339B;
 Tue,  7 Feb 2023 22:49:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="lZIfUrOJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1675810140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hcyoBMj8mZ1vCFkSBM2gnGItvf1SfvioEdznuEnxUwQ=;
 b=lZIfUrOJgehPNe7VzWs0ntw+AjNx1/WXOo5RECdfJr5Adpz9LHpjkPmBEMUq3f21N9TUXs
 +EHFy2+3bogzxHI7hmxKGHLRBxnbZnIsCgp36fnEbJ4O2m2uMuDmNDvQFwx2MrHknGaQ+J
 Y5Gm2y22B8ixMEk/V3GaDo6TrcWVwMI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5caa9bb4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 7 Feb 2023 22:49:00 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: mst@redhat.com,
	qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 1/2] x86: reset rng seed when reading cmdline, not kernel image
Date: Tue,  7 Feb 2023 19:48:46 -0300
Message-Id: <20230207224847.94429-2-Jason@zx2c4.com>
In-Reply-To: <20230207224847.94429-1-Jason@zx2c4.com>
References: <20230207224847.94429-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=KxRu=6D=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

With eac7a7791bb6 ("x86: don't let decompressed kernel image clobber
setup_data"), the rng seed setup_data is now appended to the cmdline
file rather than the kernel image file. But in the process, the code to
re-randomize the seed when selecting the image was left out. So, change
the re-randomization over to trigger when selecting the cmdline, rather
than the kernel image.

Fixes: eac7a7791bb6 ("x86: don't let decompressed kernel image clobber setup_data")
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/i386/x86.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index eaff4227bd..c6d7bf6db2 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1114,15 +1114,15 @@ void x86_load_linux(X86MachineState *x86ms,
         setup_data->len = cpu_to_le32(RNG_SEED_LENGTH);
         qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
         qemu_register_reset_nosnapshotload(reset_rng_seed, setup_data);
-        fw_cfg_add_bytes_callback(fw_cfg, FW_CFG_KERNEL_DATA, reset_rng_seed, NULL,
-                                  setup_data, kernel, kernel_size, true);
+        fw_cfg_add_bytes_callback(fw_cfg, FW_CFG_CMDLINE_DATA, reset_rng_seed, NULL,
+                                  setup_data, kernel_cmdline, cmdline_size, true);
     } else {
-        fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
+        fw_cfg_add_bytes(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdline, cmdline_size);
     }
 
+    fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
     fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_ADDR, cmdline_addr);
     fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE, cmdline_size);
-    fw_cfg_add_bytes(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdline, cmdline_size);
     sev_load_ctx.cmdline_data = (char *)kernel_cmdline;
     sev_load_ctx.cmdline_size = cmdline_size;
 
-- 
2.39.1


