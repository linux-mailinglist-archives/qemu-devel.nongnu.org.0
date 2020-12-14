Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACDF2D9FA9
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 19:56:05 +0100 (CET)
Received: from localhost ([::1]:52794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kot0t-0006h4-TI
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 13:56:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koskG-0000Jj-6L
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:38:53 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:56225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kosk9-0007Tw-1L
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:38:47 -0500
Received: by mail-wm1-x335.google.com with SMTP id x22so14682933wmc.5
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 10:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z4msl+4E6QtN6RCQD089Ehf2sv+vjVAWY6z4uBcfgdk=;
 b=DrDZm/9e0lVMSvZGjsIYjHK94ow+Jg5D8TItRlY9LizKyMcpKEvRgNUACXmaxqgSm/
 rG16dqW9KtMQQ4EUwmY6ebTXQC+UAAV9zxqB8CoaYZx1l8VuToAuCWUjxhlYvabVB1X8
 L1rdGB4P1fUIPm+pYAfsNjlG/iicbg6rAkFKGNcTqzpQm0c8sdLJerwqElgw1M3tJ6G6
 xnZ44g/I12U9vLGVJbrctPB3k8joVqHIcOjVvfRUZ3cHezjvT+bPTbuOylBVikUyu3N8
 FlFKlM98G+kNm1e7mr9DPkOVWKHbfuvCkQp07yVSDl9dCzdPbJJmTYQaFnJhJFFbfSkZ
 tHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=z4msl+4E6QtN6RCQD089Ehf2sv+vjVAWY6z4uBcfgdk=;
 b=UxA5Se82TN/WgIfe0Q+7y7peiAbWBbcrv36hJg9bhrd/An0B5Z4kS/F1qqQ7gqPU1Z
 r6AEuvHgXtvtjQS5GpJCe9nQHmYoZAVuhtS5K7+W76KLA/+mO25yYMxHTL7x1m5Dyyde
 QMXQ1uXxKX92l1bgNx8C2oYrU/fHO3xusQ0ohv5YVQC2adkUhDtsPYvG9jRZNSKZ/SeK
 SRq+mcIV5YEN9xXYPdKZNdQjvNV3PpWquXuwCuWFUYN2xcLn3q5Ur7cwpxS3ASBMmLH9
 yjPCajLLAf7rfqmUX/ERXwCdManPK3GLDcs9NpcEpBT91WmInDQanMH1rd9H4auQif94
 W+ww==
X-Gm-Message-State: AOAM532T3W1e0sFcYSqBNEr7qlnUVMCH49NvDIoEVnYoUkimO1yhonw1
 QmDetI/dDs4mTA2KBozXNhquSlbvLKU=
X-Google-Smtp-Source: ABdhPJwl6pcDop1GdGO4Cb9M9Dsjwa8SEcn5CnQdkLcnNoCGQzV5Bj0mR7LYdZNaxsMtDUxaCAAh4A==
X-Received: by 2002:a7b:cb93:: with SMTP id m19mr30063317wmi.45.1607971123469; 
 Mon, 14 Dec 2020 10:38:43 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id v7sm31858058wma.26.2020.12.14.10.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 10:38:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/16] target/mips/translate: Extract DisasContext structure
Date: Mon, 14 Dec 2020 19:37:35 +0100
Message-Id: <20201214183739.500368-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201214183739.500368-1-f4bug@amsat.org>
References: <20201214183739.500368-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract DisasContext to a new 'translate.h' header so
different translation files (ISA, ASE, extensions)
can use it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201207235539.4070364-2-f4bug@amsat.org>
---
 target/mips/translate.h | 50 +++++++++++++++++++++++++++++++++++++++++
 target/mips/translate.c | 38 +------------------------------
 2 files changed, 51 insertions(+), 37 deletions(-)
 create mode 100644 target/mips/translate.h

diff --git a/target/mips/translate.h b/target/mips/translate.h
new file mode 100644
index 00000000000..fcda1a99001
--- /dev/null
+++ b/target/mips/translate.h
@@ -0,0 +1,50 @@
+/*
+ *  MIPS translation routines.
+ *
+ *  Copyright (c) 2004-2005 Jocelyn Mayer
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+#ifndef TARGET_MIPS_TRANSLATE_H
+#define TARGET_MIPS_TRANSLATE_H
+
+#include "exec/translator.h"
+
+typedef struct DisasContext {
+    DisasContextBase base;
+    target_ulong saved_pc;
+    target_ulong page_start;
+    uint32_t opcode;
+    uint64_t insn_flags;
+    int32_t CP0_Config1;
+    int32_t CP0_Config2;
+    int32_t CP0_Config3;
+    int32_t CP0_Config5;
+    /* Routine used to access memory */
+    int mem_idx;
+    MemOp default_tcg_memop_mask;
+    uint32_t hflags, saved_hflags;
+    target_ulong btarget;
+    bool ulri;
+    int kscrexist;
+    bool rxi;
+    int ie;
+    bool bi;
+    bool bp;
+    uint64_t PAMask;
+    bool mvh;
+    bool eva;
+    bool sc;
+    int CP0_LLAddr_shift;
+    bool ps;
+    bool vp;
+    bool cmgcr;
+    bool mrp;
+    bool nan2008;
+    bool abs2008;
+    bool saar;
+    bool mi;
+    int gi;
+} DisasContext;
+
+#endif
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 49570a95615..0db0fce3789 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -36,6 +36,7 @@
 #include "exec/log.h"
 #include "qemu/qemu-print.h"
 #include "fpu_helper.h"
+#include "translate.h"
 
 #define MIPS_DEBUG_DISAS 0
 
@@ -2554,43 +2555,6 @@ static TCGv mxu_CR;
     tcg_temp_free_i32(helper_tmp);                                \
     } while (0)
 
-typedef struct DisasContext {
-    DisasContextBase base;
-    target_ulong saved_pc;
-    target_ulong page_start;
-    uint32_t opcode;
-    uint64_t insn_flags;
-    int32_t CP0_Config1;
-    int32_t CP0_Config2;
-    int32_t CP0_Config3;
-    int32_t CP0_Config5;
-    /* Routine used to access memory */
-    int mem_idx;
-    MemOp default_tcg_memop_mask;
-    uint32_t hflags, saved_hflags;
-    target_ulong btarget;
-    bool ulri;
-    int kscrexist;
-    bool rxi;
-    int ie;
-    bool bi;
-    bool bp;
-    uint64_t PAMask;
-    bool mvh;
-    bool eva;
-    bool sc;
-    int CP0_LLAddr_shift;
-    bool ps;
-    bool vp;
-    bool cmgcr;
-    bool mrp;
-    bool nan2008;
-    bool abs2008;
-    bool saar;
-    bool mi;
-    int gi;
-} DisasContext;
-
 #define DISAS_STOP       DISAS_TARGET_0
 #define DISAS_EXIT       DISAS_TARGET_1
 
-- 
2.26.2


