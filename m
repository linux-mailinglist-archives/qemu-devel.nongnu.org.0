Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB3D53C0DF
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:40:50 +0200 (CEST)
Received: from localhost ([::1]:51826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwtUn-0002wb-BE
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsk9-0001IB-1e
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:37 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:45777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsk4-0000rf-KW
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:52:34 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 w2-20020a17090ac98200b001e0519fe5a8so5873332pjt.4
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rJ9jQIVXgPW88TErZyxfJAphrMIXEeDwD7105AVfBkg=;
 b=CWKhqRzoztu9sfKpoafhnPVyKzgXn+P7p7DbyllQXjCOEjrH4C3ANZXGe7myOntxkK
 woQwAnimkp986a+AsqC41Oe1Cbvk+hbWzJ6TjjjgJF90EeTayaQI10Y9RsCWsVjAK5jc
 QHkVZdOyNWMdHfwtudPabqmcFBkp+GcxgZPFR7Y4HNDtZo6FvxKiTRRGE+XiXBcrH5SF
 Esz9kz4eNS5If5xQac3xGCIyzxFxJlLDYHIunLweDkHapT4yn8QCzgfI9zxCS2EhYL1+
 +5S7X2JgqhSA7kKND8XJGMMFQ0IoRM2acMjIgYCJNrSk0c0B6ZHXvr/12Hau0ucjPwML
 w0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rJ9jQIVXgPW88TErZyxfJAphrMIXEeDwD7105AVfBkg=;
 b=Pmc22OYmzJRh1z3GyTTKrwZ+Ys1M8vWczOfuVqMkNePWENbjegNoq4Ian99IneRazC
 u1qAgOyRqk1+Fl0+Zx+kXtjQXYatpaQZM6CL4CzlhcsL7VIJkFxkFCXPnKdAsHPLLHS5
 QMuaogOs5FB0fzDxmJkXqMZYGG7FGC0sNK/BSh7K7sHoG9Z5fkxCBO16TPd7qZg6K6dp
 YOg6QUO8DAxrzb0ge72eh8nwDaeNDZ1OjLWfjcAhLaO9OwRWSj2hYFdLSKJIGpoXdo4I
 EblH0mVw6jrmpOqJpLELj4FQ8EvYYEmmXPInae4/dJOh9ZgVmeGXnaWDqkMOU6EmFFTM
 hCSg==
X-Gm-Message-State: AOAM532Jf0cc4y+G1xNEkb8OEFTjuDLlQdL3cQe1IifZIi1Nt9SlhFM2
 N6aK5vxsjkyjUSpipJzQ6SDrzGT2sduGMw==
X-Google-Smtp-Source: ABdhPJwgC9q4rK9+XHcPYnMVp4UzQotMDmwFYHqltqCQ4Don3KpSbJCQHg7AAkHZJ+rsav9BP8eGTQ==
X-Received: by 2002:a17:90b:1bc5:b0:1e3:3c67:37bf with SMTP id
 oa5-20020a17090b1bc500b001e33c6737bfmr7470973pjb.87.1654206751124; 
 Thu, 02 Jun 2022 14:52:31 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 41/71] target/arm: Add infrastructure for disas_sme
Date: Thu,  2 Jun 2022 14:48:23 -0700
Message-Id: <20220602214853.496211-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
index b1d2840819..8a38fbc33b 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14814,7 +14814,12 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     }
 
     switch (extract32(insn, 25, 4)) {
-    case 0x0: case 0x1: case 0x3: /* UNALLOCATED */
+    case 0x0:
+        if (!disas_sme(s, insn)) {
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
index 02c91f72bb..c47d86c609 100644
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


