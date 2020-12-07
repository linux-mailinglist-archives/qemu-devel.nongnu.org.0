Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7E52D1EB1
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 00:57:48 +0100 (CET)
Received: from localhost ([::1]:48034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmQO3-0005V7-Ns
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 18:57:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmQMA-0003uv-64
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 18:55:50 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:45097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmQM8-00044Q-Ob
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 18:55:49 -0500
Received: by mail-ej1-x636.google.com with SMTP id qw4so22032574ejb.12
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 15:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rwO8LiwFgyb0U3AML1ri+5J9BRwA5KGBeXVuU1ilwAY=;
 b=IsEQt9eHq9o2acsK71gmBFTuGXV5lC+YqQx9+pL9as6Vue5qugTfLFzUt93gj7wtWp
 kozJHMY4DbdOLBwrBb7Vf0YYsOQcFiTpeexlwXep7Ln5XwAn3ahdQwoTU3+huR9lez/o
 Eq22pHnDvoo6cyUOzba75NxtpN0sOKjmJ7kjUdLasaLdyq9RHcTMak1AhwOsy+dxD+a1
 N8fdoJtuG2+YnbDhpb3mOwNJzPmQzBkxESoOGgLzAHhLvxSITLrrVD9GHuH8wmdLBFrM
 uaX9Oo2D0XdXkkWg8fCHYNHp9WkOGMTVY53fc/CSvnuqbMhCgN8f0on5QZcDA96+3JrS
 wwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rwO8LiwFgyb0U3AML1ri+5J9BRwA5KGBeXVuU1ilwAY=;
 b=JWO8mKq5Y8VFwQtUmAC2lvFHeptUiGFZwvZ3s4Gf0h69XysZx3okNy8BbTyPGk7kHL
 6RGHdrvm9zGII1QAjpQ06iQWPsQ/Jq7PX1vaWqFskCd/I9pKkweSwS7haF2C7A7KAzYU
 +fobLaCOlH9UkmwCDa1wlIc6eexIe+PHlYJZvtZyCd3vANPBSyLYMXQzAa1Lo4a9P2DO
 DmtTxgr2JFHKL1G5+5hlQachyXcjmq6ApJzoERJAmVSSYQZqGBiH5xnbsO96bDZfNSAp
 Jys+7HU1lUd4tmAf73nD/QVWg99XLnHLhjt0hW28HnYZqLVPqVklFeAPgIbDiNmSxQWE
 Pc1Q==
X-Gm-Message-State: AOAM531dJCdBilRj6VHYun5J9325nWQwWv1ScXZRzUxMFN6X9bZeJPmr
 6sYjTW8mG6zTqmi0nk1PX/wPh7cEm0o=
X-Google-Smtp-Source: ABdhPJyQuO9/gar2g2osp7t5aul42q7+WXXIAflzr+Fjc1MLTB5i7v/dLVh1dDWA69f1KSvnvy96xA==
X-Received: by 2002:a17:906:2499:: with SMTP id
 e25mr21090103ejb.446.1607385346908; 
 Mon, 07 Dec 2020 15:55:46 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id op5sm13736899ejb.43.2020.12.07.15.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 15:55:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] target/mips/translate: Extract DisasContext structure
Date: Tue,  8 Dec 2020 00:55:33 +0100
Message-Id: <20201207235539.4070364-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201207235539.4070364-1-f4bug@amsat.org>
References: <20201207235539.4070364-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract DisasContext to a new 'translate.h' header so
different translation files (ISA, ASE, extensions)
can use it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index ee45dce9a50..d7f5a1e8d84 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -39,6 +39,7 @@
 #include "exec/translator.h"
 #include "exec/log.h"
 #include "qemu/qemu-print.h"
+#include "translate.h"
 
 #define MIPS_DEBUG_DISAS 0
 
@@ -2557,43 +2558,6 @@ static TCGv mxu_CR;
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


