Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A1C57C960
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 12:49:30 +0200 (CEST)
Received: from localhost ([::1]:47552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oETkH-00042c-6e
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 06:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org>)
 id 1oETiX-0002fI-I6
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 06:47:41 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:50916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org>)
 id 1oETiV-00034g-GU
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 06:47:41 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 24EC961910;
 Thu, 21 Jul 2022 10:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99B4CC341C0;
 Thu, 21 Jul 2022 10:47:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="QI00wjMV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658400454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rlbsdBiTxNAkbJoNlgq6A2tXE6ZGiy0kWkYLQurMKzs=;
 b=QI00wjMVcedehpouzDxiJQm1b/w5Csk9yc6rqtASrkH+V9Qhfzi5kPqlKzjoam8L7QrmkG
 xBQsU79zXKXcwaDXOGxUwvFcxfOS5YHWDbCvDVc+Q1R3pJpro1tmzAtHPZSA2tzAmL02zs
 zbB99xcCXktrulLz3TDgoD5vyt7hlzI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ca78a015
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 21 Jul 2022 10:47:33 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: mst@redhat.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v5] hw/i386: pass RNG seed via setup_data entry
Date: Thu, 21 Jul 2022 12:47:30 +0200
Message-Id: <20220721104730.434017-1-Jason@zx2c4.com>
In-Reply-To: <Ytktk532xNP8sjgR@zx2c4.com>
References: <Ytktk532xNP8sjgR@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org;
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
which means a random seed has to be supplied some other way. For this
purpose, Linux (≥5.20) supports passing a seed in the setup_data table
with SETUP_RNG_SEED, specially intended for hypervisors, kexec, and
specialized bootloaders. The linked commit shows the upstream kernel
implementation.

Link: https://git.kernel.org/tip/tip/c/68b8e9713c8
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Eduardo Habkost <eduardo@habkost.net>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/i386/x86.c                                | 21 +++++++++++++++++---
 include/standard-headers/asm-x86/bootparam.h |  1 +
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 6003b4b2df..dd44c72ba3 100644
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
@@ -774,7 +775,7 @@ void x86_load_linux(X86MachineState *x86ms,
     int dtb_size, setup_data_offset;
     uint32_t initrd_max;
     uint8_t header[8192], *setup, *kernel;
-    hwaddr real_addr, prot_addr, cmdline_addr, initrd_addr = 0;
+    hwaddr real_addr, prot_addr, cmdline_addr, initrd_addr = 0, first_setup_data = 0;
     FILE *f;
     char *vmode;
     MachineState *machine = MACHINE(x86ms);
@@ -784,6 +785,7 @@ void x86_load_linux(X86MachineState *x86ms,
     const char *dtb_filename = machine->dtb;
     const char *kernel_cmdline = machine->kernel_cmdline;
     SevKernelLoaderContext sev_load_ctx = {};
+    enum { RNG_SEED_LENGTH = 32 };
 
     /* Align to 16 bytes as a paranoia measure */
     cmdline_size = (strlen(kernel_cmdline) + 16) & ~15;
@@ -1063,16 +1065,29 @@ void x86_load_linux(X86MachineState *x86ms,
         kernel_size = setup_data_offset + sizeof(struct setup_data) + dtb_size;
         kernel = g_realloc(kernel, kernel_size);
 
-        stq_p(header + 0x250, prot_addr + setup_data_offset);
 
         setup_data = (struct setup_data *)(kernel + setup_data_offset);
-        setup_data->next = 0;
+        setup_data->next = cpu_to_le64(first_setup_data);
+        first_setup_data = prot_addr + setup_data_offset;
         setup_data->type = cpu_to_le32(SETUP_DTB);
         setup_data->len = cpu_to_le32(dtb_size);
 
         load_image_size(dtb_filename, setup_data->data, dtb_size);
     }
 
+    setup_data_offset = QEMU_ALIGN_UP(kernel_size, 16);
+    kernel_size = setup_data_offset + sizeof(struct setup_data) + RNG_SEED_LENGTH;
+    kernel = g_realloc(kernel, kernel_size);
+    setup_data = (struct setup_data *)(kernel + setup_data_offset);
+    setup_data->next = cpu_to_le64(first_setup_data);
+    first_setup_data = prot_addr + setup_data_offset;
+    setup_data->type = cpu_to_le32(SETUP_RNG_SEED);
+    setup_data->len = cpu_to_le32(32);
+    qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
+
+    /* Offset 0x250 is a pointer to the first setup_data link. */
+    stq_p(header + 0x250, first_setup_data);
+
     /*
      * If we're starting an encrypted VM, it will be OVMF based, which uses the
      * efi stub for booting and doesn't require any values to be placed in the
diff --git a/include/standard-headers/asm-x86/bootparam.h b/include/standard-headers/asm-x86/bootparam.h
index 072e2ed546..b2aaad10e5 100644
--- a/include/standard-headers/asm-x86/bootparam.h
+++ b/include/standard-headers/asm-x86/bootparam.h
@@ -10,6 +10,7 @@
 #define SETUP_EFI			4
 #define SETUP_APPLE_PROPERTIES		5
 #define SETUP_JAILHOUSE			6
+#define SETUP_RNG_SEED			9
 
 #define SETUP_INDIRECT			(1<<31)
 
-- 
2.35.1


