Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 995572EE90B
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:47:24 +0100 (CET)
Received: from localhost ([::1]:38150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxe3r-000741-HS
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:47:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdif-0000pK-QN
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:25:26 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdic-0005RG-Mu
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:25:24 -0500
Received: by mail-wr1-x433.google.com with SMTP id i9so7142544wrc.4
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2UuX+ygCL9NQhxyYPo8S/tX8V99CFSpKYjvju/1WTRw=;
 b=FtebATSCzssDKSTVyEBHTyfxZHEyueAnMcztoYO2nqONIlfNyNQ47V/b34tLC6l6t1
 oKM+cemUKzeLIspqo1pEWZQIiuDRkDk2rUy8OXEXwZSnGokAqUTwP2AttqLU+FkMcYMT
 wFTUF5n5meR9Z/ZixEHgLMRiQcjpKe+NVCsxpQtyN5Im14QXo6sxlLFkw6+KJJ+W9yXa
 yaB8mJ10nnJedDSDKRQhq+tnGWCeUuNXqeuM+edCvSvm4b7/waeMW1O520eh18ywKEpt
 SWnb8yAaF5mksm6wtMSNOqzp2XuOMYD+AlW3h/C24Y1/DBLOpxPmev9R02DQROaK8GNG
 ye+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2UuX+ygCL9NQhxyYPo8S/tX8V99CFSpKYjvju/1WTRw=;
 b=SHU8kWFAF0dy4+4omA7E06KoPwXq0v3BKyBjzuggQXF9J0yiVzwnP02NFkPkHyn0Nz
 LfV+FomRsMeuF4HTG3iQ+1+298ZItqLLQxOzr2Ytse1OSq1KucM6tXw+ev+QiNhJ7TCO
 ieuL5jb/8Fe797MKwfNEoTRsX1xWg2Mu5iiUG/aMCNjQNhYoqp/62UqLFPZKy1/5CGDe
 yXxUPC36u80HJrOmzI/ISQTjz/riOUw+/65LnvMuNZkFwbo4HSLS46UhUqf1Z2tKMyKG
 5f4aMLeraDpfNt5r93XkFGO3vOS4xSTYeYMrTg7rhNqzHiTNn3qVebwXEZnEdfMUrniT
 FUFg==
X-Gm-Message-State: AOAM532BJ2MyzA8UEHD5b1ogGAgUDBa3wxjfqBF8NUqnGo0YaLfnSRgZ
 r77TFVunC3h3HR8qraIRGgvHIxgqRx8=
X-Google-Smtp-Source: ABdhPJzMyJdqE/eO0phoPlTa/qBVpXHkKqr9ihmwxJoBQBQQQe/goVibMYsBjjZd/5mLbkiF7PY3xg==
X-Received: by 2002:adf:f891:: with SMTP id u17mr662412wrp.253.1610058321171; 
 Thu, 07 Jan 2021 14:25:21 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id c7sm11513721wro.16.2021.01.07.14.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:25:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/66] target/mips/translate: Extract DisasContext structure
Date: Thu,  7 Jan 2021 23:22:15 +0100
Message-Id: <20210107222253.20382-29-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
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
index f8f0f95509c..9e824e12d44 100644
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


