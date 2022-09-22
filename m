Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EB05E67BB
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 17:56:46 +0200 (CEST)
Received: from localhost ([::1]:42612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obOZB-0002x3-U4
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 11:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=dGS3=ZZ=zx2c4.com=Jason@kernel.org>)
 id 1obO8O-0001pZ-OF
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:29:05 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:45364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=dGS3=ZZ=zx2c4.com=Jason@kernel.org>)
 id 1obO8M-00065h-Nj
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:29:04 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A7076B83877;
 Thu, 22 Sep 2022 15:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DF86C433D6;
 Thu, 22 Sep 2022 15:28:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="mo3fnyyS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1663860536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=mgvOqEV2xm4TSx4tHkD6FTczT22w2CRk/X4Jy1Z9LbY=;
 b=mo3fnyySHFvmGx0jWo3+FOgaJ5qfct70cApo9gvVLi1To/7DEvbPABp4LLn+Vqw13wNF1d
 Z/0Xs4e36B66c3VRVP/In/jXqP2GSBO3nOl5aS7vD8wmPU4RvNFZ5xJ69dfZ9Cs94lBQT6
 eG7Lq/a9vNyxAI4mReZn2aqjRvlez0M=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 91ba5763
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 22 Sep 2022 15:28:56 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-devel@nongnu.org,
	pbonzini@redhat.com
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH] x86: re-initialize RNG seed when selecting kernel
Date: Thu, 22 Sep 2022 17:28:47 +0200
Message-Id: <20220922152847.3670513-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=dGS3=ZZ=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't want it to be possible to re-read the RNG seed after ingesting
it, because this ruins forward secrecy. Currently, however, the setup
data section can just be re-read. Since the kernel is always read after
the setup data, use the selection of the kernel as a trigger to
re-initialize the RNG seed, just like we do on reboot, to preserve
forward secrecy.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
Paolo- this applies on top of the 4 you merged this morning. -Jason

 hw/i386/x86.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index f9a4ddaa4a..1148f70c03 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1112,11 +1112,14 @@ void x86_load_linux(X86MachineState *x86ms,
         setup_data->len = cpu_to_le32(RNG_SEED_LENGTH);
         qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
         qemu_register_reset(reset_rng_seed, setup_data);
+        fw_cfg_add_bytes_callback(fw_cfg, FW_CFG_KERNEL_DATA, reset_rng_seed, NULL,
+                                  setup_data, kernel, kernel_size, true);
+    } else {
+        fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
     }
 
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
-    fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
     sev_load_ctx.kernel_data = (char *)kernel;
     sev_load_ctx.kernel_size = kernel_size;
 
-- 
2.37.3


