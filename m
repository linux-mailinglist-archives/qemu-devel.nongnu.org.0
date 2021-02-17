Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 290C031E32D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 00:45:29 +0100 (CET)
Received: from localhost ([::1]:46554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWVa-0004d4-Ns
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 18:45:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWR4-0007zS-JA
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:40:46 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:42141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWR2-0004bZ-Hq
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:40:46 -0500
Received: by mail-pf1-x430.google.com with SMTP id w18so23441pfu.9
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 15:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=efU7ifq9UHagxlnOIXBK9C1qiS3Jd4xMBPPTZVTIbDY=;
 b=gC3TM2taN0e8jDaoxIN53fP4wOhxMGx7BstzVcAv82Ckc+cHsM9trud6XtuDwyCOy8
 4u0RrjMGBpR0oPV2pkw7llQBPmD5S2rdTY+l77gxB5wqeB0DyfSBk6ChJ9bKBbqfJKdi
 Sa7J8Zll5V8nuwmg4iuRt9OWwjR6XufW4gzgTbDLQGTGhybbmuIa4kGynWI4khMxPGel
 w+VHt0YVsg3VgtXwqyKOLUFQKzhiMz0KLht/H708NJ9Wt15euYZhbGQd3Fi0XBXgqu08
 aQ4dqDNIbs7zSjTYOy+U96G+rSfQbwfwWvsf/rkrZN8bdqLbwm3xeKht0p7nxRUzmWEd
 Aiug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=efU7ifq9UHagxlnOIXBK9C1qiS3Jd4xMBPPTZVTIbDY=;
 b=JC0QA318fvoJngvq22KeVsijosM5ntOpZBbIMq5ubfGNgE28LVsJI0nVlYmu7N7nh4
 i/ihLDoRRfsnv3+l4B5mceRrO1k5Eb3GqFvqYkzjkgwuBhKxKzYG42+A91pHcZnBX+kn
 k1Z928DxjE9n11gprtefgasCcBW2b/zGih2JOS+OqTTzW8vFiGmmUpG40oMfTbGsA6FR
 fZgTeuOnsjvPe6tJGf2mdPS1W/aETM6hn+qX7EReyRnmIRpPTxS1HznX7ZFhs3Cy2pxx
 j8Ih92H+FFHPMurx5ZTu8EWQkTCOTg6nys/gvrLwUNOz0YlvE5W1QV9uTVkhX5OXAPwj
 2D9g==
X-Gm-Message-State: AOAM533/hD8qsqiWG6vk0q/J+Ul0m/JKH0kNJNlHnPx3z+05RmWlK++6
 Fo1iKAKS9BsGdf0uW9Fdg0cY56UpptGOFg==
X-Google-Smtp-Source: ABdhPJxhywzBWgRBOz+LiJOhGYhMbPxb9bMdBDnZOJdOkh+RDyZ4zTQ8G8e43TWoS+5KZ+GyreEiaQ==
X-Received: by 2002:a62:dd48:0:b029:1d5:e29c:621c with SMTP id
 w69-20020a62dd480000b02901d5e29c621cmr1534670pff.31.1613605240182; 
 Wed, 17 Feb 2021 15:40:40 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c21sm3950355pgh.0.2021.02.17.15.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 15:40:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/35] Hexagon (disas) disassembler
Date: Wed, 17 Feb 2021 15:39:54 -0800
Message-Id: <20210217234023.1742406-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217234023.1742406-1-richard.henderson@linaro.org>
References: <20210217234023.1742406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

Add hexagon to disas/meson.build
Add disas/hexagon.c
Add hexagon to include/disas/dis-asm.h

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <1612763186-18161-6-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/disas/dis-asm.h |  1 +
 disas/hexagon.c         | 65 +++++++++++++++++++++++++++++++++++++++++
 disas/meson.build       |  1 +
 3 files changed, 67 insertions(+)
 create mode 100644 disas/hexagon.c

diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
index d1133a4e04..13fa1edd41 100644
--- a/include/disas/dis-asm.h
+++ b/include/disas/dis-asm.h
@@ -459,6 +459,7 @@ int print_insn_xtensa           (bfd_vma, disassemble_info*);
 int print_insn_riscv32          (bfd_vma, disassemble_info*);
 int print_insn_riscv64          (bfd_vma, disassemble_info*);
 int print_insn_rx(bfd_vma, disassemble_info *);
+int print_insn_hexagon(bfd_vma, disassemble_info *);
 
 #ifdef CONFIG_CAPSTONE
 bool cap_disas_target(disassemble_info *info, uint64_t pc, size_t size);
diff --git a/disas/hexagon.c b/disas/hexagon.c
new file mode 100644
index 0000000000..3c24e2a94a
--- /dev/null
+++ b/disas/hexagon.c
@@ -0,0 +1,65 @@
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
+/*
+ * QEMU Hexagon Disassembler
+ */
+
+#include "qemu/osdep.h"
+#include "disas/dis-asm.h"
+#include "target/hexagon/cpu_bits.h"
+
+/*
+ * We will disassemble a packet with up to 4 instructions, so we need
+ * a hefty size buffer.
+ */
+#define PACKET_BUFFER_LEN                   1028
+
+int print_insn_hexagon(bfd_vma memaddr, struct disassemble_info *info)
+{
+    uint32_t words[PACKET_WORDS_MAX];
+    bool found_end = false;
+    GString *buf = g_string_sized_new(PACKET_BUFFER_LEN);
+    int i, len;
+
+    for (i = 0; i < PACKET_WORDS_MAX && !found_end; i++) {
+        int status = (*info->read_memory_func)(memaddr + i * sizeof(uint32_t),
+                                               (bfd_byte *)&words[i],
+                                               sizeof(uint32_t), info);
+        if (status) {
+            if (i > 0) {
+                break;
+            }
+            (*info->memory_error_func)(status, memaddr, info);
+            return status;
+        }
+        if (is_packet_end(words[i])) {
+            found_end = true;
+        }
+    }
+
+    if (!found_end) {
+        (*info->fprintf_func)(info->stream, "<invalid>");
+        return PACKET_WORDS_MAX * sizeof(uint32_t);
+    }
+
+    len = disassemble_hexagon(words, i, memaddr, buf);
+    (*info->fprintf_func)(info->stream, "%s", buf->str);
+    g_string_free(buf, true);
+
+    return len;
+}
diff --git a/disas/meson.build b/disas/meson.build
index da341a511e..4c8da01877 100644
--- a/disas/meson.build
+++ b/disas/meson.build
@@ -6,6 +6,7 @@ common_ss.add(when: 'CONFIG_ARM_A64_DIS', if_true: files('arm-a64.cc'))
 common_ss.add_all(when: 'CONFIG_ARM_A64_DIS', if_true: libvixl_ss)
 common_ss.add(when: 'CONFIG_ARM_DIS', if_true: files('arm.c'))
 common_ss.add(when: 'CONFIG_CRIS_DIS', if_true: files('cris.c'))
+common_ss.add(when: 'CONFIG_HEXAGON_DIS', if_true: files('hexagon.c'))
 common_ss.add(when: 'CONFIG_HPPA_DIS', if_true: files('hppa.c'))
 common_ss.add(when: 'CONFIG_I386_DIS', if_true: files('i386.c'))
 common_ss.add(when: 'CONFIG_LM32_DIS', if_true: files('lm32.c'))
-- 
2.25.1


