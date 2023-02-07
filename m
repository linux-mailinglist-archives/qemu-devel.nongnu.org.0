Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DC068E392
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 23:49:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPWm2-0003iB-AK; Tue, 07 Feb 2023 17:49:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=KxRu=6D=zx2c4.com=Jason@kernel.org>)
 id 1pPWlz-0003hK-OS
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 17:49:11 -0500
Received: from ams.source.kernel.org ([145.40.68.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=KxRu=6D=zx2c4.com=Jason@kernel.org>)
 id 1pPWly-00027s-3G
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 17:49:11 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B8836B81B35;
 Tue,  7 Feb 2023 22:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70212C433D2;
 Tue,  7 Feb 2023 22:49:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="mB4x1036"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1675810145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mmF5cmjJqKs/c2ujhOJHw4MyozFGKJOoSzRlAe/Wo1A=;
 b=mB4x1036U9fiG1PXe4HIuZ9VGkmQAenajjVdklk3V7O3LZvpOrgpcQtYeronah9oPCv4VE
 /XXLPyzbY1004vpGf6sh3uiUpdhJlKDbyyNDF2NV/gP4y5CsE/Ex6+mPupTHeWytmyRFEX
 HvTHmwgW65EvYUh91EzLU6YBP3TDKc8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1a94f89e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 7 Feb 2023 22:49:05 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: mst@redhat.com,
	qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 2/2] x86: don't append setup_data to cmdline for SEV guests
Date: Tue,  7 Feb 2023 19:48:47 -0300
Message-Id: <20230207224847.94429-3-Jason@zx2c4.com>
In-Reply-To: <20230207224847.94429-1-Jason@zx2c4.com>
References: <20230207224847.94429-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=KxRu=6D=zx2c4.com=Jason@kernel.org;
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

From: Dov Murik <dovmurik@linux.ibm.com>

Modifying the cmdline by appending setup_data breaks measured boot with
SEV and OVMF, and possibly signed boot. Previously this was disabled
when appending to the kernel image, but with eac7a7791bb6 ("x86: don't
let decompressed kernel image clobber setup_data"), this was changed to
the cmdline file instead, with the sev_enabled() check left out.

Fixes: eac7a7791bb6 ("x86: don't let decompressed kernel image clobber setup_data")
Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/i386/x86.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index c6d7bf6db2..80a1678acd 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1079,7 +1079,7 @@ void x86_load_linux(X86MachineState *x86ms,
     fclose(f);
 
     /* append dtb to kernel */
-    if (dtb_filename) {
+    if (dtb_filename && !sev_enabled()) {
         if (protocol < 0x209) {
             fprintf(stderr, "qemu: Linux kernel too old to load a dtb\n");
             exit(1);
@@ -1103,7 +1103,7 @@ void x86_load_linux(X86MachineState *x86ms,
         load_image_size(dtb_filename, setup_data->data, dtb_size);
     }
 
-    if (!legacy_no_rng_seed && protocol >= 0x209) {
+    if (!legacy_no_rng_seed && protocol >= 0x209 && !sev_enabled()) {
         setup_data_offset = cmdline_size;
         cmdline_size += sizeof(SetupData) + RNG_SEED_LENGTH;
         kernel_cmdline = g_realloc(kernel_cmdline, cmdline_size);
-- 
2.39.1


