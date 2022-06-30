Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4001D5619B2
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 13:57:56 +0200 (CEST)
Received: from localhost ([::1]:41066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6snz-0005XE-9X
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 07:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=bCe9=XF=zx2c4.com=Jason@kernel.org>)
 id 1o6sUH-0002Rr-79
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 07:37:34 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:42910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=bCe9=XF=zx2c4.com=Jason@kernel.org>)
 id 1o6sUD-0006hi-QM
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 07:37:32 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 19FD660FC1
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 11:37:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AFC9C34115
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 11:37:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="F6NvzDVi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1656589045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=TSeGsw3ZXwe2MxjvM8bS6Z46KMSavUx2HDViLp6iLBQ=;
 b=F6NvzDViAJaK9hRSbiDXNi4AEQ3ChqJWFVuH/BWcgR8ellBt84VPUseSAGWRuLWPc/z88I
 bfLhN7YNoDOiZbSiuvU7qzkw1HuBfR7P8lpLSSxgyhmxu0YwknsfX3OmmWkspHXUYCCS0k
 30dvunqqxWaQIXXZH2pVM4f36MCS4J4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 749ac7b8
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 30 Jun 2022 11:37:25 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH] hw/i386: pass RNG seed to e820 setup table
Date: Thu, 30 Jun 2022 13:37:17 +0200
Message-Id: <20220630113717.1893529-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=bCe9=XF=zx2c4.com=Jason@kernel.org;
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

Tiny machines optimized for fast boot time generally don't use EFI,
which means a random seed has to be supplied some other way, in this
case by the e820 setup table, which supplies a place for one. This
commit adds passing this random seed via the table. It is confirmed to
be working with the Linux patch in the link.

Link: https://lore.kernel.org/lkml/20220630113300.1892799-1-Jason@zx2c4.com/
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/i386/x86.c                                | 19 ++++++++++++++-----
 include/standard-headers/asm-x86/bootparam.h |  1 +
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 6003b4b2df..0724759eec 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -26,6 +26,7 @@
 #include "qemu/cutils.h"
 #include "qemu/units.h"
 #include "qemu/datadir.h"
+#include "qemu/guest-random.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
 #include "qapi/qapi-visit-common.h"
@@ -1045,6 +1046,16 @@ void x86_load_linux(X86MachineState *x86ms,
     }
     fclose(f);
 
+    setup_data_offset = QEMU_ALIGN_UP(kernel_size, 16);
+    kernel_size = setup_data_offset + sizeof(struct setup_data) + 32;
+    kernel = g_realloc(kernel, kernel_size);
+    stq_p(header + 0x250, prot_addr + setup_data_offset);
+    setup_data = (struct setup_data *)(kernel + setup_data_offset);
+    setup_data->next = 0;
+    setup_data->type = cpu_to_le32(SETUP_RNG_SEED);
+    setup_data->len = cpu_to_le32(32);
+    qemu_guest_getrandom_nofail(setup_data->data, 32);
+
     /* append dtb to kernel */
     if (dtb_filename) {
         if (protocol < 0x209) {
@@ -1059,13 +1070,11 @@ void x86_load_linux(X86MachineState *x86ms,
             exit(1);
         }
 
-        setup_data_offset = QEMU_ALIGN_UP(kernel_size, 16);
-        kernel_size = setup_data_offset + sizeof(struct setup_data) + dtb_size;
+        kernel_size += sizeof(struct setup_data) + dtb_size;
         kernel = g_realloc(kernel, kernel_size);
 
-        stq_p(header + 0x250, prot_addr + setup_data_offset);
-
-        setup_data = (struct setup_data *)(kernel + setup_data_offset);
+        setup_data->next = prot_addr + setup_data_offset + sizeof(*setup_data) + setup_data->len;
+        ++setup_data;
         setup_data->next = 0;
         setup_data->type = cpu_to_le32(SETUP_DTB);
         setup_data->len = cpu_to_le32(dtb_size);
diff --git a/include/standard-headers/asm-x86/bootparam.h b/include/standard-headers/asm-x86/bootparam.h
index 072e2ed546..b8cb1fa313 100644
--- a/include/standard-headers/asm-x86/bootparam.h
+++ b/include/standard-headers/asm-x86/bootparam.h
@@ -10,6 +10,7 @@
 #define SETUP_EFI			4
 #define SETUP_APPLE_PROPERTIES		5
 #define SETUP_JAILHOUSE			6
+#define SETUP_RNG_SEED			8
 
 #define SETUP_INDIRECT			(1<<31)
 
-- 
2.35.1


