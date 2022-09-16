Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C395BAE67
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 15:43:34 +0200 (CEST)
Received: from localhost ([::1]:57534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZBcz-00080c-FB
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 09:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=EpFr=ZT=zx2c4.com=Jason@kernel.org>)
 id 1oZBW4-00076z-JL
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 09:36:24 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:45110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=EpFr=ZT=zx2c4.com=Jason@kernel.org>)
 id 1oZBW1-0001in-4A
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 09:36:23 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EB85662BB7;
 Fri, 16 Sep 2022 13:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 331FDC433C1;
 Fri, 16 Sep 2022 13:36:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="CIGd+2HL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1663335369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=PTOn1yM0zIBtLe1HQ7WGt9klmo6yUO3KPfHqsrM3jKk=;
 b=CIGd+2HLe1n3qk8Ps5XTTVFLERJ7nn+vQh7CSxVwFhXNAixruM7PhVRxkxDyEICrXA0+67
 ySGYkSOyCr/yueEiirNWxn+GSQkucwzNZhuHOEoWDFMfh4y9XiFfp4NpwBD7KFoYK+6tHt
 24FfF5HinireBrchOfGckrKZJ9uNk+k=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 69c78dbb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Fri, 16 Sep 2022 13:36:09 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH qboot] Place setup_data at location specified by host
Date: Fri, 16 Sep 2022 14:36:03 +0100
Message-Id: <20220916133603.693135-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=EpFr=ZT=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
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

QEMU places setup_data at a particular location, which cannot be
relocated due to it containing self references in absolute address
terms. For this reason, it supplies the intended location in
FW_CFG_SETUP_ADDR, which is what SeaBIOS uses. So use this too in qboot.
This also has the effect of removing the 8k limit on the copied size,
since the header is copied to the right location from the beginning.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 fw_cfg.c            | 13 ++++++++-----
 include/linuxboot.h |  1 -
 linuxboot.c         |  4 +---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/fw_cfg.c b/fw_cfg.c
index 4b920cf..f3d9605 100644
--- a/fw_cfg.c
+++ b/fw_cfg.c
@@ -269,6 +269,7 @@ void boot_from_fwcfg(void)
 {
 	struct linuxboot_args args;
 	uint32_t kernel_size;
+	enum { HEADER_PEEK_SIZE = 8192 };
 
 	fw_cfg_select(FW_CFG_CMDLINE_SIZE);
 	args.cmdline_size = fw_cfg_readl_le();
@@ -282,15 +283,17 @@ void boot_from_fwcfg(void)
 	kernel_size = fw_cfg_readl_le();
 	fw_cfg_select(FW_CFG_SETUP_SIZE);
 	args.vmlinuz_size = kernel_size + fw_cfg_readl_le();
+	fw_cfg_select(FW_CFG_SETUP_ADDR);
+	args.setup_addr = (void *)fw_cfg_readl_le();
 
 	if (!args.vmlinuz_size)
 		return;
 
 	fw_cfg_select(FW_CFG_SETUP_DATA);
-	fw_cfg_read(args.header, sizeof(args.header));
+	fw_cfg_read(args.setup_addr, HEADER_PEEK_SIZE);
 
 	if (!parse_bzimage(&args)) {
-		uint8_t *header = args.header;
+		uint8_t *header = args.setup_addr;
 
 		if (ldl_p(header) == 0x464c457f)  /* ELF magic */
 			boot_pvh_from_fw_cfg();
@@ -298,9 +301,9 @@ void boot_from_fwcfg(void)
 	}
 
 	/* SETUP_DATA already selected */
-	if (args.setup_size > sizeof(args.header))
-		fw_cfg_read(args.setup_addr + sizeof(args.header),
-			    args.setup_size - sizeof(args.header));
+	if (args.setup_size > HEADER_PEEK_SIZE)
+		fw_cfg_read(args.setup_addr + HEADER_PEEK_SIZE,
+			    args.setup_size - HEADER_PEEK_SIZE);
 
 	fw_cfg_select(FW_CFG_KERNEL_DATA);
 	fw_cfg_read_entry(FW_CFG_KERNEL_DATA, args.kernel_addr, kernel_size);
diff --git a/include/linuxboot.h b/include/linuxboot.h
index 6e865f0..e04c234 100644
--- a/include/linuxboot.h
+++ b/include/linuxboot.h
@@ -10,7 +10,6 @@ struct linuxboot_args {
 
 	/* Input */
 	uint32_t cmdline_size, vmlinuz_size, initrd_size;
-	uint8_t header[8192];
 };
 
 bool parse_bzimage(struct linuxboot_args *args);
diff --git a/linuxboot.c b/linuxboot.c
index 251bcb6..bdb01ee 100644
--- a/linuxboot.c
+++ b/linuxboot.c
@@ -11,7 +11,7 @@ struct hvm_start_info start_info = {0};
 
 bool parse_bzimage(struct linuxboot_args *args)
 {
-	uint8_t *header = args->header;
+	uint8_t *header = args->setup_addr;
 
 	uint32_t real_addr, cmdline_addr, prot_addr, initrd_addr;
 	uint32_t setup_size;
@@ -84,7 +84,6 @@ bool parse_bzimage(struct linuxboot_args *args)
 	args->setup_size = (setup_size+1)*512;
 	args->kernel_size = args->vmlinuz_size - setup_size;
 	args->initrd_addr = (void *)initrd_addr;
-	args->setup_addr = (void *)real_addr;
 	args->kernel_addr = (void *)prot_addr;
 	args->cmdline_addr = (void *)cmdline_addr;
 	return true;
@@ -92,7 +91,6 @@ bool parse_bzimage(struct linuxboot_args *args)
 
 void boot_bzimage(struct linuxboot_args *args)
 {
-	memcpy(args->setup_addr, args->header, sizeof(args->header));
 #ifdef BENCHMARK_HACK
 	/* Exit just before getting to vmlinuz, so that it is easy
 	 * to time/profile the firmware.
-- 
2.37.3


