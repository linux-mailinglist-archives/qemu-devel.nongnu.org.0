Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 560D647C430
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 17:51:08 +0100 (CET)
Received: from localhost ([::1]:41788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mziLz-0002uq-GD
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 11:51:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIs-00005Y-Pt
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:47:54 -0500
Received: from [2607:f8b0:4864:20::102d] (port=52974
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIo-0007bA-Oa
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:47:54 -0500
Received: by mail-pj1-x102d.google.com with SMTP id co15so13019696pjb.2
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zUDP7FmcR1rHD0pS6HJ64HKaD5yQmCsg2nMq4yKO5cY=;
 b=VvxR0yI78aINeYBYI8Fwm3IgvypmRxbbe4JcW/IuYtTKRQvmJTxCYoE4vKePPcmBJS
 hZ3/feiJWiWg+MRjhRE18tF8sId+dJIamtL4Vb+n9tQDbjj4JVT3eySfb4eBwMlWmny+
 6JgzFAADuEGVtpkF94ztTTXtF6qIMJyGQoWz98w2iHXdmmhhhMEXBqBzV8rPwx/GmxSe
 5+I8iVcRHIt7bwWUPWBIx5BGMoZ1NkhTvyvVoUr1XB1rbZwaO8DUB6VPfL4Q7QNBWJ9b
 iF45sm/qvn7C2zdkvj6olL6eiyJZBwHEvdMMhj8kkhTSnt9tikOQTgvWWp7xfLPi86Mb
 t2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zUDP7FmcR1rHD0pS6HJ64HKaD5yQmCsg2nMq4yKO5cY=;
 b=aVNfh+TzLwf5oqWKnvR1Z4K+N/ViSBBsdVEjZeXjh1GZk6nBDjxe1GhLsjVy6p3+mP
 dyeHDNwp0InvkGjIa39VHy5I/CxKwHPCTiMxRaGszEp6CK88ymIBU/Pk8Fi7eRt8sktj
 8SBhvnmP9LiswZ2iyhabgz/s/sL7vgnyTzKCJg6Ce39qlgBhuAmuoNbiAJM5zB8UFrTQ
 si5IHozMT7Wzq9BpeSWAEb4pMU+XuHUJSd8fOZdH4U3K4ask6v76oWC0mUZuS3ZaAhya
 rU+dQjzMYRtQX4UCNfVm4pb5SeOQK9UNdMP1dgjiNeY8G6ArgiVVimwaqlqkCK0Crvfm
 UI8w==
X-Gm-Message-State: AOAM532iucpHOFX8Ubui66xL3AwBeaDPbrzPTPDcd8KDSWnn6CXNLJjW
 r0/HHHJHVqLM80BtlZYwM4NW6bAuv9D2uA==
X-Google-Smtp-Source: ABdhPJylWwXuwRvrRC7PTr8dZG0ZsdEjtu4UflJ6S3f1vuXwJgHaK9CANvDs6UhVaSK4j+OneqXkTw==
X-Received: by 2002:a17:902:c193:b0:149:b6f:4e65 with SMTP id
 d19-20020a170902c19300b001490b6f4e65mr3871039pld.81.1640105265693; 
 Tue, 21 Dec 2021 08:47:45 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b192sm2256818pga.35.2021.12.21.08.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 08:47:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/31] tcg/loongarch64: Implement necessary relocation
 operations
Date: Tue, 21 Dec 2021 08:47:13 -0800
Message-Id: <20211221164737.1076007-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221164737.1076007-1-richard.henderson@linaro.org>
References: <20211221164737.1076007-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: WANG Xuerui <git@xen0n.name>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211221054105.178795-8-git@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 66 ++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 1c1b798c06..a88ba9a253 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -168,3 +168,69 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
     }
     return false;
 }
+
+/*
+ * Relocations
+ */
+
+/*
+ * Relocation records defined in LoongArch ELF psABI v1.00 is way too
+ * complicated; a whopping stack machine is needed to stuff the fields, at
+ * the very least one SOP_PUSH and one SOP_POP (of the correct format) are
+ * needed.
+ *
+ * Hence, define our own simpler relocation types. Numbers are chosen as to
+ * not collide with potential future additions to the true ELF relocation
+ * type enum.
+ */
+
+/* Field Sk16, shifted right by 2; suitable for conditional jumps */
+#define R_LOONGARCH_BR_SK16     256
+/* Field Sd10k16, shifted right by 2; suitable for B and BL */
+#define R_LOONGARCH_BR_SD10K16  257
+
+static bool reloc_br_sk16(tcg_insn_unit *src_rw, const tcg_insn_unit *target)
+{
+    const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
+    intptr_t offset = (intptr_t)target - (intptr_t)src_rx;
+
+    tcg_debug_assert((offset & 3) == 0);
+    offset >>= 2;
+    if (offset == sextreg(offset, 0, 16)) {
+        *src_rw = deposit64(*src_rw, 10, 16, offset);
+        return true;
+    }
+
+    return false;
+}
+
+static bool reloc_br_sd10k16(tcg_insn_unit *src_rw,
+                             const tcg_insn_unit *target)
+{
+    const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
+    intptr_t offset = (intptr_t)target - (intptr_t)src_rx;
+
+    tcg_debug_assert((offset & 3) == 0);
+    offset >>= 2;
+    if (offset == sextreg(offset, 0, 26)) {
+        *src_rw = deposit64(*src_rw, 0, 10, offset >> 16); /* slot d10 */
+        *src_rw = deposit64(*src_rw, 10, 16, offset); /* slot k16 */
+        return true;
+    }
+
+    return false;
+}
+
+static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
+                        intptr_t value, intptr_t addend)
+{
+    tcg_debug_assert(addend == 0);
+    switch (type) {
+    case R_LOONGARCH_BR_SK16:
+        return reloc_br_sk16(code_ptr, (tcg_insn_unit *)value);
+    case R_LOONGARCH_BR_SD10K16:
+        return reloc_br_sd10k16(code_ptr, (tcg_insn_unit *)value);
+    default:
+        g_assert_not_reached();
+    }
+}
-- 
2.25.1


