Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C8D6DCF20
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 03:18:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm2TI-0007AF-MF; Mon, 10 Apr 2023 21:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2T7-00062g-76
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:06:45 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2T4-0000i9-KH
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:06:44 -0400
Received: by mail-pl1-x62d.google.com with SMTP id e13so5954420plc.12
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 18:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+UEhKa6Kyo4j3o7ZlobQD32dbnUlsNBQxIzZtf9c8vU=;
 b=xQUW+pmp+bbkv9dsnFMd2/rpWlEZ+nQ2OK5YZMmwmm3UrVMW9zSHaUnEJvbgObbgxw
 FtAzx4V3ABnt4/lg85Y9STzcGMU2OoYF7mxSPzpTb43yFIHiRCz9id79M9a26l/XfY8H
 mM52ZTDoEdbZeMnf7ByqaRpnFQV9mejLmGtbZHXgAf80jOQFEF8Y0seU4we4AolxpIB4
 aJ2WZGjonPDM2RACBa0hsJya+8GxGy275Baa3Wr7mL25R3wHMjTJCeFZUhfA0hzDSq+y
 DzNrd/O3+w6LGWTLmIK6JPN4q1fs5sjCILA7PlJVkejbctgE4VMlJuRdilo+96JPIW+d
 v05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+UEhKa6Kyo4j3o7ZlobQD32dbnUlsNBQxIzZtf9c8vU=;
 b=E3YQYK2UlFDJ9TYykW+JPOoTs3FIdArdcM7jj0XfW3biU4kCMeSLAG+HrCm5+E7Z9U
 LYvTOg5ypQO018/y7HbqYzRNdUi1qsZbNlNTcdvpB5mEC/PqFOXb/AaWM/9Y/dtEaupE
 qHJeLNDt6BYys017BrAyDhfy2mFGe4a9r0aMy6bXYANJYpq1zDf1OJ3CSq8MAYea2OhE
 LS3PeoLXkaJSaIuMD4m7iO9sP4ecz9556wpR7RWSE7xjG4eHVcB9SmjywUvGIzcZ0Cq9
 TJyBxjXMBi4nmVfNXwCxk7Wp2QeJgjbme99Iu5p2Rpkt7SJ4gZkZCrd+1wgEHojyE3ZA
 eqAg==
X-Gm-Message-State: AAQBX9cLQXpJodG5/LseGrZAZN64rb1EZrDqZtVte1QICtlJz9hVwpEE
 qDprBwAMynNDXzJz+bUfTACttcNObq1v9ZsG72uvHg==
X-Google-Smtp-Source: AKy350ZcoE7hNpEwNkJfHWt0guHaB3jC/YWN5ICuHEBa0gIhZY4JOPBz/VnTN10LT3bkm2MVMJb6pg==
X-Received: by 2002:a05:6a20:17aa:b0:d8:decb:3419 with SMTP id
 bl42-20020a056a2017aa00b000d8decb3419mr8955926pzb.40.1681175201698; 
 Mon, 10 Apr 2023 18:06:41 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:06:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 31/54] tcg: Move TCGLabelQemuLdst to tcg.c
Date: Mon, 10 Apr 2023 18:04:49 -0700
Message-Id: <20230411010512.5375-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This will shortly be used by sparc64 without also using
TCG_TARGET_NEED_LDST_LABELS.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c          | 13 +++++++++++++
 tcg/tcg-ldst.c.inc | 14 --------------
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index cfd3262a4a..6f5daaee5f 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -94,6 +94,19 @@ typedef struct QEMU_PACKED {
     DebugFrameFDEHeader fde;
 } DebugFrameHeader;
 
+typedef struct TCGLabelQemuLdst {
+    bool is_ld;             /* qemu_ld: true, qemu_st: false */
+    MemOpIdx oi;
+    TCGType type;           /* result type of a load */
+    TCGReg addrlo_reg;      /* reg index for low word of guest virtual addr */
+    TCGReg addrhi_reg;      /* reg index for high word of guest virtual addr */
+    TCGReg datalo_reg;      /* reg index for low word to be loaded or stored */
+    TCGReg datahi_reg;      /* reg index for high word to be loaded or stored */
+    const tcg_insn_unit *raddr;   /* addr of the next IR of qemu_ld/st IR */
+    tcg_insn_unit *label_ptr[2]; /* label pointers to be updated */
+    QSIMPLEQ_ENTRY(TCGLabelQemuLdst) next;
+} TCGLabelQemuLdst;
+
 static void tcg_register_jit_int(const void *buf, size_t size,
                                  const void *debug_frame,
                                  size_t debug_frame_size)
diff --git a/tcg/tcg-ldst.c.inc b/tcg/tcg-ldst.c.inc
index 403cbb0f06..ffada04af0 100644
--- a/tcg/tcg-ldst.c.inc
+++ b/tcg/tcg-ldst.c.inc
@@ -20,20 +20,6 @@
  * THE SOFTWARE.
  */
 
-typedef struct TCGLabelQemuLdst {
-    bool is_ld;             /* qemu_ld: true, qemu_st: false */
-    MemOpIdx oi;
-    TCGType type;           /* result type of a load */
-    TCGReg addrlo_reg;      /* reg index for low word of guest virtual addr */
-    TCGReg addrhi_reg;      /* reg index for high word of guest virtual addr */
-    TCGReg datalo_reg;      /* reg index for low word to be loaded or stored */
-    TCGReg datahi_reg;      /* reg index for high word to be loaded or stored */
-    const tcg_insn_unit *raddr;   /* addr of the next IR of qemu_ld/st IR */
-    tcg_insn_unit *label_ptr[2]; /* label pointers to be updated */
-    QSIMPLEQ_ENTRY(TCGLabelQemuLdst) next;
-} TCGLabelQemuLdst;
-
-
 /*
  * Generate TB finalization at the end of block
  */
-- 
2.34.1


