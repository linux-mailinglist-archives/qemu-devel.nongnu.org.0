Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 762B942E7DC
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:26:48 +0200 (CEST)
Received: from localhost ([::1]:44474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbEnv-0006kx-GC
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYr-0007Cy-6p
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:14 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:33480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYp-0000H5-8Z
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:12 -0400
Received: by mail-pg1-x52a.google.com with SMTP id j190so698858pgd.0
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T6s+8p22L/kJt7ysU37rV/HmGCKRECxNpTVVs5PRRQU=;
 b=REPHbbf4TEkbB7/C3FISZnFJs0Y0hSnNMIJyQe4CQKlb5yJcXYR694/1TVG9dSoGp1
 ui1RonR0JLBznZhlMQDcCWvcSeq6IsoK0tQ9yK/uV1JZoZiZuZJ0PUYEpdj8Z2ZutgzR
 vz1DsACToajKO60xGhqhaSGxVHbGyI724yltsiST+GFJ+vY1S5Tn2wJPuwAmOkKQQYs1
 Q3J4XA9ZdnLAQbi9hcHkgG71Jg81g3hRI24+SOk44VGQI5+9RQIGrYXDH5aDQAjISJkZ
 zHsfogb1kToVhHDQEMwd93LU09WR6pkcxSIP678CKRWGc8Fm3cJobI23JqH1lunrUsd6
 016A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T6s+8p22L/kJt7ysU37rV/HmGCKRECxNpTVVs5PRRQU=;
 b=dsnEDLTKMxf8i7dRilfWwj1JDPBewM5+4/szz3jNtpbOLAw72G0owczrF6i3qtjBv5
 d4pN5vVZpM6qnRCRnVyBKGClmEAO/Q4iiDT8n4jGEC9UplaFeJ552cp1cYgD3VsGmGo9
 ipCefrO1DluZ1UcLyfVVU/vv66z//MWHBiDXrOeHs5tcgC/M7mieUTxAM5w6Qb7rU6BZ
 7lsFxOJF5Zh3wqb9ldfktYGL1ZHTieO0VJblqP5T21Ea5TL9KC3F5hdyMsd5DtFVP7nt
 NDzaVGimF89MEmU/U5FK32IDZqztEMruOQC2h6yhWTcMK4Zrxpq4bbDyBubbeuPBiY93
 28Vw==
X-Gm-Message-State: AOAM532bnQOhnovnliQstFfZTQQFGIeT5n2GHUks6H6Uru0CDbG6jmIc
 DbHflbcPpy+jAFNam9iyA0hT+D+0TTb1AA==
X-Google-Smtp-Source: ABdhPJwGK56lnndnTB9+AiSrpdAXbmo4Y7Rkny4jMhfYoFtwPARN1xPiFTQ7xPrbi2CJvyprpM3+lw==
X-Received: by 2002:a63:7404:: with SMTP id p4mr7213000pgc.222.1634271069860; 
 Thu, 14 Oct 2021 21:11:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id me12sm5718006pjb.27.2021.10.14.21.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:11:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 17/67] linux-user/host/riscv: Improve host_signal_write
Date: Thu, 14 Oct 2021 21:10:03 -0700
Message-Id: <20211015041053.2769193-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
 laurent@vivier.eu, imp@bsdimp.com
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


