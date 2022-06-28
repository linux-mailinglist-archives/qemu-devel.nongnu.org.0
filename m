Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C83655BE27
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 06:25:33 +0200 (CEST)
Received: from localhost ([::1]:52446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o62n6-0004dB-Bh
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 00:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jG-0001Hf-U8
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:21:35 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:45914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jD-0003de-2w
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:21:34 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 g20-20020a17090a579400b001ed52939d72so5960541pji.4
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zt0iFWR3qz21z3bSyJ1iuT1OyELXtc2hbyVwv56j1M4=;
 b=CxlH52+qXuplkB1/KC0KLwGqbORfNtZNuTrOSWH6SE//XbXV+jBuIN/Qx5bU47WVkY
 B6gCnJQuJyqOcB0OzNHzAERU9co25y38RjOuYL+Xx8G05DNXc7p0LMh1zcFpfRvic35q
 c9i4Um8CUTo+4ODBeWLSNlz6MjjNhch9Pc2wUizvzyyV+w+jXmbmJz4KEp6xMJU/IT5e
 4WzdBClnzT2J9ANCujBIe4GZFQFw8HETk4ieQ6LzB7z25tD8Ued4EH+YF7S7wtWXuE3s
 WMujIseUG12vkYZsxy8FQN+Ef6H3F+zOEyCi5Ucl+lc2DNvdHyODCeNvavOASeQ2v6Bb
 QxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zt0iFWR3qz21z3bSyJ1iuT1OyELXtc2hbyVwv56j1M4=;
 b=guSkIc14vTGSIYaBsUAyjx+HOezyCH4ZoO+RVGDiLmuz7TJPu5fWMY64uwOIN2g811
 WGBGjw9YbwN+NrAiVDVhweGDW9GpCI9fjLd+Iq9WmkysoosGF7oQ5yUT2LwpnhOs93cY
 7JNuQ0IaD+FI7MdDSxfHDGYqREGRoZyvQZ+Z5wQOkDDX9YmDezeDtJkExLPKMfilQR8V
 epGPgY9lcoVj2MYT70QvSz/lnSfi+IGmMOXpaPIpoUjdZKcrbbddBnoU/TOZdaGZ7j2H
 0zoTg8vT+0aw9MqGhOJSDgF8lt+KbZbKIdOHgvPwTb2O+Njy2efFnldVsXtKVXWxhLi5
 +t1w==
X-Gm-Message-State: AJIora8C2w94qg1HFs/2xBQarZhcchmGX8HG0Q/r+E7LgJPJubcyMLQr
 YAaF3mo5X3tWOpDM5VcDIbkgJWnkdY4dUw==
X-Google-Smtp-Source: AGRyM1s5o43TBKpRB7m1CCs0zatfrUZ8APSJ6eC+3giaSYykzkYH3qmpFLHfMrOjyZAUgK/DmE5uWg==
X-Received: by 2002:a17:903:2488:b0:163:b2c0:7efe with SMTP id
 p8-20020a170903248800b00163b2c07efemr3010957plw.164.1656390087559; 
 Mon, 27 Jun 2022 21:21:27 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:21:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 02/45] target/arm: Add infrastructure for disas_sme
Date: Tue, 28 Jun 2022 09:50:34 +0530
Message-Id: <20220628042117.368549-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This includes the build rules for the decoder, and the
new file for translation, but excludes any instructions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h |  1 +
 target/arm/sme.decode      | 20 ++++++++++++++++++++
 target/arm/translate-a64.c |  7 ++++++-
 target/arm/translate-sme.c | 35 +++++++++++++++++++++++++++++++++++
 target/arm/meson.build     |  2 ++
 5 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 target/arm/sme.decode
 create mode 100644 target/arm/translate-sme.c

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index f0970c6b8c..789b6e8e78 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -146,6 +146,7 @@ static inline int pred_gvec_reg_size(DisasContext *s)
 }
 
 bool disas_sve(DisasContext *, uint32_t);
+bool disas_sme(DisasContext *, uint32_t);
 
 void gen_gvec_rax1(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                    uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
diff --git a/target/arm/sme.decode b/target/arm/sme.decode
new file mode 100644
index 0000000000..c25c031a71
--- /dev/null
+++ b/target/arm/sme.decode
@@ -0,0 +1,20 @@
+# AArch64 SME instruction descriptions
+#
+#  Copyright (c) 2022 Linaro, Ltd
+#
+# This library is free software; you can redistribute it and/or
+# modify it under the terms of the GNU Lesser General Public
+# License as published by the Free Software Foundation; either
+# version 2.1 of the License, or (at your option) any later version.
+#
+# This library is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# Lesser General Public License for more details.
+#
+# You should have received a copy of the GNU Lesser General Public
+# License along with this library; if not, see <http://www.gnu.org/licenses/>.
+
+#
+# This file is processed by scripts/decodetree.py
+#
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index c86b97b1d4..a5f8a6c771 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14806,7 +14806,12 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     }
 
     switch (extract32(insn, 25, 4)) {
-    case 0x0: case 0x1: case 0x3: /* UNALLOCATED */
+    case 0x0:
+        if (!extract32(insn, 31, 1) || !disas_sme(s, insn)) {
+            unallocated_encoding(s);
+        }
+        break;
+    case 0x1: case 0x3: /* UNALLOCATED */
         unallocated_encoding(s);
         break;
     case 0x2:
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
new file mode 100644
index 0000000000..786c93fb2d
--- /dev/null
+++ b/target/arm/translate-sme.c
@@ -0,0 +1,35 @@
+/*
+ * AArch64 SME translation
+ *
+ * Copyright (c) 2022 Linaro, Ltd
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "tcg/tcg-op.h"
+#include "tcg/tcg-op-gvec.h"
+#include "tcg/tcg-gvec-desc.h"
+#include "translate.h"
+#include "exec/helper-gen.h"
+#include "translate-a64.h"
+#include "fpu/softfloat.h"
+
+
+/*
+ * Include the generated decoder.
+ */
+
+#include "decode-sme.c.inc"
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 43dc600547..6dd7e93643 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -1,5 +1,6 @@
 gen = [
   decodetree.process('sve.decode', extra_args: '--decode=disas_sve'),
+  decodetree.process('sme.decode', extra_args: '--decode=disas_sme'),
   decodetree.process('neon-shared.decode', extra_args: '--decode=disas_neon_shared'),
   decodetree.process('neon-dp.decode', extra_args: '--decode=disas_neon_dp'),
   decodetree.process('neon-ls.decode', extra_args: '--decode=disas_neon_ls'),
@@ -50,6 +51,7 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'sme_helper.c',
   'translate-a64.c',
   'translate-sve.c',
+  'translate-sme.c',
 ))
 
 arm_softmmu_ss = ss.source_set()
-- 
2.34.1


