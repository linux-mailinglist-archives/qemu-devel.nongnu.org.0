Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4A1440AA6
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:35:25 +0200 (CEST)
Received: from localhost ([::1]:45084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgsGK-0000P8-6d
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:35:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryU-0002DZ-RB
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:17:00 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:41657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryQ-00009N-HV
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:16:57 -0400
Received: by mail-pf1-x429.google.com with SMTP id u33so277848pfg.8
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T6s+8p22L/kJt7ysU37rV/HmGCKRECxNpTVVs5PRRQU=;
 b=UFUe2cSHFQOsLrAKfKi0PhzDP/ZvDEZzljnGgNOEbHypVEACTSHShkND+gQMkHOnpB
 QKE4wxJSGBWX2bKvJy50wb0ikK1Q57b/ZOtGQTuwDuJ6EBoVFLEo1z45YchGb7SjeJw7
 9uvtcAZVWGbf8M20sE6R+jha0mpYOsQOGHgEwCzTCyX/nmWdb/CpkzbwrDCCx9z+PFMv
 VF+LnocNKE0WbPOKRNQWK+kPc9nMAEzyOE1keL7t3ZbOKzRAUYLZJ761h5JKOmnshbYd
 plWVqwzTvpwEJ3nmZzGm3YKqQnCdWodoQM5pxefydThui3pureaALjr7eojlhDTy+TJX
 JNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T6s+8p22L/kJt7ysU37rV/HmGCKRECxNpTVVs5PRRQU=;
 b=aRVkrzcVKMWCR9xbBJHe2gSz9NZ/ARRLC7vZ/Mjh99/QewDJeTbjThkyyirZqPBn58
 OrWQn9S131buIukIzpIen1STHWVTgoeoGskt6Ibgw9aafgR5MVkPT2U9V+Ulz7+1YMC9
 cCbbrjkuWjIg1/IWNlAuie0HET85AUteVe16/bp+TYcgSlzcr1vtvZYH7p9dap2XRM38
 o0YRObfWoyxu/dA2cIIOPbzmQOmxYfFCIpC0878RffJrL2NBBtJqSpYNmXvIiqd0NTDk
 KbruFbYSB4AQLnetXLeRuXAKaN8tvhLwXzfkVHKzQiYfuCgaHD4Bju2CrAknxs0W0F4f
 pSbw==
X-Gm-Message-State: AOAM532S0QJztvp6h1HnT3D4o4RTE4U7MYwf2y2S9Homa9zH2MUkKe3c
 qFX32i4sSrdOFq0Fkn3YOCTFbRYQP9r5nA==
X-Google-Smtp-Source: ABdhPJy3arkeFnxYZuqwNE0zVbLxkP63bwxqmhTlujwAh1AmeIx0qJBRLBM57Bxewt3NfOu+qMCv3w==
X-Received: by 2002:a62:3306:0:b0:480:f89c:c251 with SMTP id
 z6-20020a623306000000b00480f89cc251mr1531825pfz.74.1635614212876; 
 Sat, 30 Oct 2021 10:16:52 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nv4sm3111943pjb.17.2021.10.30.10.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:16:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 17/66] linux-user/host/riscv: Improve host_signal_write
Date: Sat, 30 Oct 2021 10:15:46 -0700
Message-Id: <20211030171635.1689530-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>, alex.bennee@linaro.org,
 laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not read 4 bytes before we determine the size of the insn.
Simplify triple switches in favor of checking major opcodes.
Include the missing cases of compact fsd and fsdsp.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/riscv/host-signal.h | 83 ++++++++++-------------------
 1 file changed, 28 insertions(+), 55 deletions(-)

diff --git a/linux-user/host/riscv/host-signal.h b/linux-user/host/riscv/host-signal.h
index 5860dce7d7..ab06d70964 100644
--- a/linux-user/host/riscv/host-signal.h
+++ b/linux-user/host/riscv/host-signal.h
@@ -17,65 +17,38 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)
 
 static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
 {
-    uint32_t insn = *(uint32_t *)host_signal_pc(uc);
-
     /*
-     * Detect store by reading the instruction at the program
-     * counter. Note: we currently only generate 32-bit
-     * instructions so we thus only detect 32-bit stores
+     * Detect store by reading the instruction at the program counter.
+     * Do not read more than 16 bits, because we have not yet determined
+     * the size of the instruction.
      */
-    switch (((insn >> 0) & 0b11)) {
-    case 3:
-        switch (((insn >> 2) & 0b11111)) {
-        case 8:
-            switch (((insn >> 12) & 0b111)) {
-            case 0: /* sb */
-            case 1: /* sh */
-            case 2: /* sw */
-            case 3: /* sd */
-            case 4: /* sq */
-                return true;
-            default:
-                break;
-            }
-            break;
-        case 9:
-            switch (((insn >> 12) & 0b111)) {
-            case 2: /* fsw */
-            case 3: /* fsd */
-            case 4: /* fsq */
-                return true;
-            default:
-                break;
-            }
-            break;
-        default:
-            break;
-        }
+    const uint16_t *pinsn = (const uint16_t *)host_signal_pc(uc);
+    uint16_t insn = pinsn[0];
+
+    /* 16-bit instructions */
+    switch (insn & 0xe003) {
+    case 0xa000: /* c.fsd */
+    case 0xc000: /* c.sw */
+    case 0xe000: /* c.sd (rv64) / c.fsw (rv32) */
+    case 0xa002: /* c.fsdsp */
+    case 0xc002: /* c.swsp */
+    case 0xe002: /* c.sdsp (rv64) / c.fswsp (rv32) */
+        return true;
     }
 
-    /* Check for compressed instructions */
-    switch (((insn >> 13) & 0b111)) {
-    case 7:
-        switch (insn & 0b11) {
-        case 0: /*c.sd */
-        case 2: /* c.sdsp */
-            return true;
-        default:
-            break;
-        }
-        break;
-    case 6:
-        switch (insn & 0b11) {
-        case 0: /* c.sw */
-        case 3: /* c.swsp */
-            return true;
-        default:
-            break;
-        }
-        break;
-    default:
-        break;
+    /* 32-bit instructions, major opcodes */
+    switch (insn & 0x7f) {
+    case 0x23: /* store */
+    case 0x27: /* store-fp */
+        return true;
+    case 0x2f: /* amo */
+        /*
+         * The AMO function code is in bits 25-31, unread as yet.
+         * The AMO functions are LR (read), SC (write), and the
+         * rest are all read-modify-write.
+         */
+        insn = pinsn[1];
+        return (insn >> 11) != 2; /* LR */
     }
 
     return false;
-- 
2.25.1


