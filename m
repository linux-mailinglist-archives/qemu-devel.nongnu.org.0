Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 610953CC69E
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 00:23:42 +0200 (CEST)
Received: from localhost ([::1]:45378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4sij-0007Vn-Dx
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 18:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4seF-00072u-JB
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 18:19:03 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:38595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4seD-00023X-Vx
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 18:19:03 -0400
Received: by mail-pg1-x535.google.com with SMTP id h4so14538273pgp.5
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 15:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P6wdHlO6cHzs3gBckJx4V6EWh6TuoOxJ0Z4U1Y1q9Fw=;
 b=e32ma5Z3xM+TahQ79kY4E7Yq7pcnxIT1+KHbZsVAze4gWRs9PJ1AqAj4FgXCM1uJFN
 Rlw/UqDGSt1ru4+B3CIOJ2kSFq/T+H9ftDQrcoeRmpA9nEZG/CA5j9pvaSe/jFEgvhYI
 1g9YvLyiC5B1qfUNQE9mBSYfPVYodPgJodpuBGKgV6G1+1J8jJ7ZEDusOt/ONHCbB13E
 6fD23uoIcPVwuAmsmvsZM21x/5gznSGiSTAfgfYYvFVaFfl02+q5+MA/Y5NtmU35pLnQ
 +yjqJrjVDBDxstlfLLlxWh/7hIvVOSb6KGq96Pp9ha44N4opLl85mXaZFQvfbOWv1pAm
 E0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P6wdHlO6cHzs3gBckJx4V6EWh6TuoOxJ0Z4U1Y1q9Fw=;
 b=PU49llL2QzjjnVdfVYPj9bO2t7w3Fr75ze6TxqaYPs1S3MB0vibsTqLV+CftmoV2FZ
 EmfLiasbzyNs53jBRiHgZ1dZOSqzkbdbdngeTDCdAz+6kTk61FDCemFVTMDZfnMGB+dg
 zlT+/yI+5kGWa3LjvigZ2ePfIf5JUDGflOZTEKSKeqaxxB38liS9ECaS2ZEkPeODvxrn
 Vk+K6DnspLwDhYtVgreOoHXItieo5UWPT1t5r2MUwi01VVLejqSV9KIbdXZVQIQN8BPH
 0QC3HvwUd0MG18MYi1jDaYfJck6musPSNCsV5cxERSqAEWQgjLVTfhQ2AFAOi6MzjEQW
 +I5g==
X-Gm-Message-State: AOAM533WyixL3ke2G5Uq5B4LKUFv8J3iNYKkH5DbQvmMzZbzRAaa0Rt1
 JeenIA6VjhQnrd/dt0xJznkLwazYxIcGzw==
X-Google-Smtp-Source: ABdhPJzo3mSMlZqOrQUmDNQg/56OOKGBBKY4h/L/zV5oyf7n/TKCp+NohkeZY1C590LmvUD7BMLkCA==
X-Received: by 2002:a62:1743:0:b029:32c:d286:edd8 with SMTP id
 64-20020a6217430000b029032cd286edd8mr17344415pfx.77.1626560340443; 
 Sat, 17 Jul 2021 15:19:00 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id n14sm2405091pjv.34.2021.07.17.15.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 15:19:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/13] accel/tcg: Hoist tb_cflags to a local in
 translator_loop
Date: Sat, 17 Jul 2021 15:18:50 -0700
Message-Id: <20210717221851.2124573-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717221851.2124573-1-richard.henderson@linaro.org>
References: <20210717221851.2124573-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The access internal to tb_cflags() is atomic.
Avoid re-reading it as such for the multiple uses.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translator.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 1c44d096d8..449159a27c 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -50,6 +50,7 @@ bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest)
 void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
                      CPUState *cpu, TranslationBlock *tb, int max_insns)
 {
+    uint32_t cflags = tb_cflags(tb);
     bool plugin_enabled;
 
     /* Initialize DisasContext */
@@ -72,8 +73,7 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
     ops->tb_start(db, cpu);
     tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
 
-    plugin_enabled = plugin_gen_tb_start(cpu, tb,
-                                         tb_cflags(db->tb) & CF_MEMI_ONLY);
+    plugin_enabled = plugin_gen_tb_start(cpu, tb, cflags & CF_MEMI_ONLY);
 
     while (true) {
         db->num_insns++;
@@ -125,14 +125,13 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
            update db->pc_next and db->is_jmp to indicate what should be
            done next -- either exiting this loop or locate the start of
            the next instruction.  */
-        if (db->num_insns == db->max_insns
-            && (tb_cflags(db->tb) & CF_LAST_IO)) {
+        if (db->num_insns == db->max_insns && (cflags & CF_LAST_IO)) {
             /* Accept I/O on the last instruction.  */
             gen_io_start();
             ops->translate_insn(db, cpu);
         } else {
             /* we should only see CF_MEMI_ONLY for io_recompile */
-            tcg_debug_assert(!(tb_cflags(db->tb) & CF_MEMI_ONLY));
+            tcg_debug_assert(!(cflags & CF_MEMI_ONLY));
             ops->translate_insn(db, cpu);
         }
 
-- 
2.25.1


