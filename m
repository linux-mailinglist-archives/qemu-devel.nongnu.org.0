Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 469106577E9
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 15:39:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAXZy-0004zz-0I; Wed, 28 Dec 2022 09:38:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=vu6c=42=zx2c4.com=Jason@kernel.org>)
 id 1pAXZw-0004zU-3p
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 09:38:48 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=vu6c=42=zx2c4.com=Jason@kernel.org>)
 id 1pAXZu-0001Zn-4A
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 09:38:47 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A90F9B816E6;
 Wed, 28 Dec 2022 14:38:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241FCC433EF;
 Wed, 28 Dec 2022 14:38:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="A73fmF9l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1672238318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=dkJgTgd2jC8ETTG/AQ42cOUsYaFEUHH0gR+Zz3GXSTA=;
 b=A73fmF9lWmppNuC2KXpH47T/GR7PQl8TljcpIg0Gf0SivFw6DV9S8yGHxGfBgWJI0ldWQY
 Vb5I8HXrPFn5l9VAAL/Qwm/nGa4yvU1MWoL1hmAUwDA3QxJHswHgavJjMLfLtg8Hb9bhup
 Y+tVM8V0h0//pYpQSuX1yI00Jr4bAnE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d884e2a0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 28 Dec 2022 14:38:38 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: pbonzini@redhat.com, ebiggers@kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, qemu-devel@nongnu.org, ardb@kernel.org,
 kraxel@redhat.com, hpa@zytor.com, bp@alien8.de
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH qemu] x86: don't let decompressed kernel image clobber
 setup_data
Date: Wed, 28 Dec 2022 15:38:30 +0100
Message-Id: <20221228143831.396245-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=vu6c=42=zx2c4.com=Jason@kernel.org;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The setup_data links are appended to the compressed kernel image. Since
the kernel image is typically loaded at 0x100000, setup_data lives at
`0x100000 + compressed_size`, which does not get relocated during the
kernel's boot process.

The kernel typically decompresses the image starting at address
0x1000000 (note: there's one more zero there than the decompressed image
above). This usually is fine for most kernels.

However, if the compressed image is actually quite large, then
setup_data will live at a `0x100000 + compressed_size` that extends into
the decompressed zone at 0x1000000. In other words, if compressed_size
is larger than `0x1000000 - 0x100000`, then the decompression step will
clobber setup_data, resulting in crashes.

Fix this by detecting that possibility, and if it occurs, put setup_data
*after* the end of the decompressed kernel, so that it doesn't get
clobbered.

One caveat is that this only works for images less than around 64
megabytes, so just bail out in that case. This is unfortunate, but I
don't currently have a way of fixing it.

Cc: x86@kernel.org
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/i386/x86.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 78cc131926..628fd2b2e9 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1077,6 +1077,36 @@ void x86_load_linux(X86MachineState *x86ms,
     }
     fclose(f);
 
+    /* If a setup_data is going to be used, make sure that the bootloader won't
+     * decompress into it and clobber those bytes. */
+    if (dtb_filename || !legacy_no_rng_seed) {
+        uint32_t payload_offset = ldl_p(setup + 0x248);
+        uint32_t payload_length = ldl_p(setup + 0x24c);
+        uint32_t target_address = ldl_p(setup + 0x258);
+        uint32_t decompressed_length = ldl_p(kernel + payload_offset + payload_length - 4);
+
+        uint32_t estimated_setup_data_length = 4096 * 16;
+        uint32_t start_setup_data = prot_addr + kernel_size;
+        uint32_t end_setup_data = start_setup_data + estimated_setup_data_length;
+        uint32_t start_target = target_address;
+        uint32_t end_target = target_address + decompressed_length;
+
+        if ((start_setup_data >= start_target && start_setup_data < end_target) ||
+            (end_setup_data >= start_target && end_setup_data < end_target)) {
+            uint32_t padded_size = target_address + decompressed_length - prot_addr;
+
+            /* The early stage can't address past around 64 MB from the original
+             * mapping, so just give up in that case. */
+            if (padded_size < 62 * 1024 * 1024)
+                kernel_size = padded_size;
+            else {
+                fprintf(stderr, "qemu: Kernel image too large to hold setup_data\n");
+                dtb_filename = NULL;
+                legacy_no_rng_seed = true;
+            }
+        }
+    }
+
     /* append dtb to kernel */
     if (dtb_filename) {
         if (protocol < 0x209) {
-- 
2.39.0


