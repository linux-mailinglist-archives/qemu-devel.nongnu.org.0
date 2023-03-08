Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 541756B0FB0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:04:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZx8S-0004bm-PL; Wed, 08 Mar 2023 11:59:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx8F-0004Wk-MJ; Wed, 08 Mar 2023 11:59:15 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx8C-000458-RP; Wed, 08 Mar 2023 11:59:15 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 7076540106;
 Wed,  8 Mar 2023 19:58:36 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 2E3711FE;
 Wed,  8 Mar 2023 19:58:35 +0300 (MSK)
Received: (nullmailer pid 2098334 invoked by uid 1000);
 Wed, 08 Mar 2023 16:58:34 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>, Dov Murik <dovmurik@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 28/47] Revert "x86: re-initialize RNG seed when selecting
 kernel"
Date: Wed,  8 Mar 2023 19:57:31 +0300
Message-Id: <20230308165815.2098148-28-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
References: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: "Michael S. Tsirkin" <mst@redhat.com>

This reverts commit cc63374a5a7c240b7d3be734ef589dabbefc7527.

Fixes: cc63374a5a ("x86: re-initialize RNG seed when selecting kernel")
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Dov Murik <dovmurik@linux.ibm.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
(cherry picked from commit b4bfa0a31d86caf89223e10e701c5b00df369b37)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/i386/x86.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 7984f65352..e1a5f244a9 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1116,14 +1116,11 @@ void x86_load_linux(X86MachineState *x86ms,
         setup_data->len = cpu_to_le32(RNG_SEED_LENGTH);
         qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
         qemu_register_reset(reset_rng_seed, setup_data);
-        fw_cfg_add_bytes_callback(fw_cfg, FW_CFG_KERNEL_DATA, reset_rng_seed, NULL,
-                                  setup_data, kernel, kernel_size, true);
-    } else {
-        fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
     }
 
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
+    fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
     sev_load_ctx.kernel_data = (char *)kernel;
     sev_load_ctx.kernel_size = kernel_size;
 
-- 
2.30.2


