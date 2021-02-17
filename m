Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C38E631E339
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 00:49:40 +0100 (CET)
Received: from localhost ([::1]:57758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWZf-000113-R3
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 18:49:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRL-0000DH-NV
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:03 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:43146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRI-0004fg-D2
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:03 -0500
Received: by mail-pf1-x434.google.com with SMTP id c11so21437pfp.10
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 15:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m+z7zKbfPSgVE/5d/mcHl+RUaATXirz6IlvqMojiK3Y=;
 b=Qv+uKsLkJ5Ahnv0ys+VVoqlmuSsEydwMVIYY0FXtvnt0qJPScIN+cqR9Hwv8xnGOww
 a/STx1fMUv9SvYGSZM4DCrti4q4ouz8gkfhYdSn3Az5Bk3luxapp783gvSXGKllkz41J
 d0GteNC8Qw5tWV9njnIaCIr2zoCc1RpxmR/k/E0QB+TrzJ6s/Yv/iEAtv0+ozotL4lTm
 qJ/XfwiMR23VqS1O3L1BZljvhbUo/WfYn30dN0+8kQ6C/I1VfHeqU4aQLHlpwXpzEEq1
 /WMNWKTtkpm/7eNtP/lkLzrS5M7tVOVS0ot4nwPGWmfA3wTt1dejJImA7vDEhAitKRnp
 06eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m+z7zKbfPSgVE/5d/mcHl+RUaATXirz6IlvqMojiK3Y=;
 b=Xe15U8icPc8+SMgstTLk1d1RxWeBRWHSQRhhBVm47CbQclgWQ1MmPjxUyyASmei2AG
 76fWlv3PeawTgU5N3aA5B6OeIL0pvwLhrfU5PZ2gFUySoyoxJI25CM0lxzZMKvRw7YwO
 tQnvN64j8Ljzh2h+5Uryv1JLzmdnnEqp36BmHJEYxhZxhZSCqMipMfAJQhqAFEicDpOc
 K+CZstDTcZCwW9+YKna3JZx0XXfjeHn3JuqdMfdUhou7vksyUOadUFHmKVnhlZPUH8/h
 jiu2Cu1XcNLJA+c3UL2goCQ/Ob6JoOqnVSDoEdkmPupzHkR4VZr8LDZdgWTFJOTdDYGM
 zy3w==
X-Gm-Message-State: AOAM531+IKyXBaCk/omr/13kNsd8xc+POYOnIvK45m1f2s5Q/hylz2Fa
 m2dIyoBl6btBMSjSxnfJEBrqnvcjtyrHNA==
X-Google-Smtp-Source: ABdhPJz9doksfDcUUhAIDyBItKszx7D5ev8vmUoXi3GMcFyfhvhRF7UZB1kOTImc26moz6IrclE7lA==
X-Received: by 2002:a05:6a00:2ac:b029:1e9:3cb7:324a with SMTP id
 q12-20020a056a0002acb02901e93cb7324amr1623242pfs.36.1613605258880; 
 Wed, 17 Feb 2021 15:40:58 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c21sm3950355pgh.0.2021.02.17.15.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 15:40:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/35] Hexagon (target/hexagon) instruction printing
Date: Wed, 17 Feb 2021 15:40:03 -0800
Message-Id: <20210217234023.1742406-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217234023.1742406-1-richard.henderson@linaro.org>
References: <20210217234023.1742406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1612763186-18161-15-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/printinsn.h |  27 +++++++
 target/hexagon/printinsn.c | 146 +++++++++++++++++++++++++++++++++++++
 2 files changed, 173 insertions(+)
 create mode 100644 target/hexagon/printinsn.h
 create mode 100644 target/hexagon/printinsn.c

diff --git a/target/hexagon/printinsn.h b/target/hexagon/printinsn.h
new file mode 100644
index 0000000000..2ecd1731d0
--- /dev/null
+++ b/target/hexagon/printinsn.h
@@ -0,0 +1,27 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HEXAGON_PRINTINSN_H
+#define HEXAGON_PRINTINSN_H
+
+#include "insn.h"
+
+void snprint_a_pkt_disas(GString *buf, Packet *pkt, uint32_t *words,
+                         target_ulong pc);
+void snprint_a_pkt_debug(GString *buf, Packet *pkt);
+
+#endif
diff --git a/target/hexagon/printinsn.c b/target/hexagon/printinsn.c
new file mode 100644
index 0000000000..4865cdd133
--- /dev/null
+++ b/target/hexagon/printinsn.c
@@ -0,0 +1,146 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "attribs.h"
+#include "printinsn.h"
+#include "insn.h"
+#include "reg_fields.h"
+#include "internal.h"
+
+static const char *sreg2str(unsigned int reg)
+{
+    if (reg < TOTAL_PER_THREAD_REGS) {
+        return hexagon_regnames[reg];
+    } else {
+        return "???";
+    }
+}
+
+static const char *creg2str(unsigned int reg)
+{
+    return sreg2str(reg + HEX_REG_SA0);
+}
+
+static void snprintinsn(GString *buf, Insn *insn)
+{
+    switch (insn->opcode) {
+#define DEF_VECX_PRINTINFO(TAG, FMT, ...) DEF_PRINTINFO(TAG, FMT, __VA_ARGS__)
+#define DEF_PRINTINFO(TAG, FMT, ...) \
+    case TAG: \
+        g_string_append_printf(buf, FMT, __VA_ARGS__); \
+        break;
+#include "printinsn_generated.h.inc"
+#undef DEF_VECX_PRINTINFO
+#undef DEF_PRINTINFO
+    }
+}
+
+void snprint_a_pkt_disas(GString *buf, Packet *pkt, uint32_t *words,
+                         target_ulong pc)
+{
+    bool has_endloop0 = false;
+    bool has_endloop1 = false;
+    bool has_endloop01 = false;
+
+    for (int i = 0; i < pkt->num_insns; i++) {
+        if (pkt->insn[i].part1) {
+            continue;
+        }
+
+        /* We'll print the endloop's at the end of the packet */
+        if (pkt->insn[i].opcode == J2_endloop0) {
+            has_endloop0 = true;
+            continue;
+        }
+        if (pkt->insn[i].opcode == J2_endloop1) {
+            has_endloop1 = true;
+            continue;
+        }
+        if (pkt->insn[i].opcode == J2_endloop01) {
+            has_endloop01 = true;
+            continue;
+        }
+
+        g_string_append_printf(buf, "0x" TARGET_FMT_lx "\t", words[i]);
+
+        if (i == 0) {
+            g_string_append(buf, "{");
+        }
+
+        g_string_append(buf, "\t");
+        snprintinsn(buf, &(pkt->insn[i]));
+
+        if (i < pkt->num_insns - 1) {
+            /*
+             * Subinstructions are two instructions encoded
+             * in the same word. Print them on the same line.
+             */
+            if (GET_ATTRIB(pkt->insn[i].opcode, A_SUBINSN)) {
+                g_string_append(buf, "; ");
+                snprintinsn(buf, &(pkt->insn[i + 1]));
+                i++;
+            } else if (pkt->insn[i + 1].opcode != J2_endloop0 &&
+                       pkt->insn[i + 1].opcode != J2_endloop1 &&
+                       pkt->insn[i + 1].opcode != J2_endloop01) {
+                pc += 4;
+                g_string_append_printf(buf, "\n0x" TARGET_FMT_lx ":  ", pc);
+            }
+        }
+    }
+    g_string_append(buf, " }");
+    if (has_endloop0) {
+        g_string_append(buf, "  :endloop0");
+    }
+    if (has_endloop1) {
+        g_string_append(buf, "  :endloop1");
+    }
+    if (has_endloop01) {
+        g_string_append(buf, "  :endloop01");
+    }
+}
+
+void snprint_a_pkt_debug(GString *buf, Packet *pkt)
+{
+    int slot, opcode;
+
+    if (pkt->num_insns > 1) {
+        g_string_append(buf, "\n{\n");
+    }
+
+    for (int i = 0; i < pkt->num_insns; i++) {
+        if (pkt->insn[i].part1) {
+            continue;
+        }
+        g_string_append(buf, "\t");
+        snprintinsn(buf, &(pkt->insn[i]));
+
+        if (GET_ATTRIB(pkt->insn[i].opcode, A_SUBINSN)) {
+            g_string_append(buf, " //subinsn");
+        }
+        if (pkt->insn[i].extension_valid) {
+            g_string_append(buf, " //constant extended");
+        }
+        slot = pkt->insn[i].slot;
+        opcode = pkt->insn[i].opcode;
+        g_string_append_printf(buf, " //slot=%d:tag=%s\n",
+                               slot, opcode_names[opcode]);
+    }
+    if (pkt->num_insns > 1) {
+        g_string_append(buf, "}\n");
+    }
+}
-- 
2.25.1


