Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FB42EE6D6
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:28:50 +0100 (CET)
Received: from localhost ([::1]:56588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxbtp-000063-Jh
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:28:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbgz-00018o-SF
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:33 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:35531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbgi-0001UQ-JT
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:29 -0500
Received: by mail-pl1-x633.google.com with SMTP id g3so4170103plp.2
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9ERcwQ1o1WQCtk37LfWcrGwhEwI+ExpBZ4567jVnbB8=;
 b=koyIZqoBQWXXGphDxv9A1v7hB4X6F300OVwcEYLBHLbChdyP8qBIAW/3Q360Kr7YQu
 8hMC1MB9VvuZM8OPPLaAgy8tkpaEX9MxC9YkvlHxoE+qLm5cH7IiKvu4j6Qkil7Qr0s0
 0H8589l97rPKA1cGAFAf3LRLEkHMV2FqOaL/7DT+cl6b36ktZ1UcEaCX7pirYgcyzN4l
 rjiUqxbRzNqasgPa3rgCy4V6YwZ16GyCYZjiT+HUlMsfCHTOon/AsSK4fivCPx7nsHuy
 iD6W8I0cr33F6HRWRz/M7Lzr22RmOiyV+v+RP2vScAurBU0QJtfB1blTInqc30zUVgrR
 Na+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9ERcwQ1o1WQCtk37LfWcrGwhEwI+ExpBZ4567jVnbB8=;
 b=Jq5Dl6z+ZQFGy4ZKNDyIbSAegiFL0zkmExswQ9Wo9isa1d0YuA366Diz1a9An0JR51
 ONcial9BClBFpAvxbdXw8QjiL/TxiMJN3OOypvt1JpjK/eCDxrMRpCzwZZW8w+QYCKcn
 VvbqrjhDtvHWjzQTIx2bS29bQt4aI1oP0ydijOEWdITDgRmoZstfhLH6FmoFsHz4h48d
 fe63enrinbCkVpSnQckx6bxrZNHtyNmrcOMx2lrWXk60Hx0hkBfHLE116gyZlMoHLV6l
 VFkV3yfZHIh+wrs6a9x4DqtfPh/9TM/W/SH5mnQoJUxFwrQoNTdCSac83WFcQ/lgH1mV
 eaGw==
X-Gm-Message-State: AOAM5302DsFhpuq95eTRDp/RujvJMsDIDEm6K4/LB5GssrzRjSTOFtkb
 gCK14RUHBttKcv8c5+lfGXNSY3FWDiPRPw==
X-Google-Smtp-Source: ABdhPJwKzFG0EJNr2/4sXB5JX7r6ko2Vh/YooA2hhcFSCjck1Zf8wTEoo99Ys0fzTMJS+ej1oXm5og==
X-Received: by 2002:a17:90a:5b:: with SMTP id 27mr154834pjb.207.1610050512311; 
 Thu, 07 Jan 2021 12:15:12 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:15:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/47] tcg: Add in_code_gen_buffer
Date: Thu,  7 Jan 2021 10:14:12 -1000
Message-Id: <20210107201448.1152301-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create a function to determine if a pointer is within the buffer.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h         | 11 +++++++++++
 accel/tcg/translate-all.c | 26 ++++++++------------------
 2 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index bb1e97b13b..ef571b6f3e 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -680,6 +680,17 @@ extern __thread TCGContext *tcg_ctx;
 extern void *tcg_code_gen_epilogue;
 extern TCGv_env cpu_env;
 
+static inline bool in_code_gen_buffer(const void *p)
+{
+    const TCGContext *s = &tcg_init_ctx;
+    /*
+     * Much like it is valid to have a pointer to the byte past the
+     * end of an array (so long as you don't dereference it), allow
+     * a pointer to the byte past the end of the code gen buffer.
+     */
+    return (size_t)(p - s->code_gen_buffer) <= s->code_gen_buffer_size;
+}
+
 static inline size_t temp_idx(TCGTemp *ts)
 {
     ptrdiff_t n = ts - tcg_ctx->temps;
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index a1803a1026..3f9e25fa0c 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -392,27 +392,18 @@ void tb_destroy(TranslationBlock *tb)
 
 bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
 {
-    TranslationBlock *tb;
-    bool r = false;
-    uintptr_t check_offset;
-
-    /* The host_pc has to be in the region of current code buffer. If
-     * it is not we will not be able to resolve it here. The two cases
-     * where host_pc will not be correct are:
+    /*
+     * The host_pc has to be in the region of the code buffer.
+     * If it is not we will not be able to resolve it here.
+     * The two cases where host_pc will not be correct are:
      *
      *  - fault during translation (instruction fetch)
      *  - fault from helper (not using GETPC() macro)
      *
      * Either way we need return early as we can't resolve it here.
-     *
-     * We are using unsigned arithmetic so if host_pc <
-     * tcg_init_ctx.code_gen_buffer check_offset will wrap to way
-     * above the code_gen_buffer_size
      */
-    check_offset = host_pc - (uintptr_t) tcg_init_ctx.code_gen_buffer;
-
-    if (check_offset < tcg_init_ctx.code_gen_buffer_size) {
-        tb = tcg_tb_lookup(host_pc);
+    if (in_code_gen_buffer((const void *)host_pc)) {
+        TranslationBlock *tb = tcg_tb_lookup(host_pc);
         if (tb) {
             cpu_restore_state_from_tb(cpu, tb, host_pc, will_exit);
             if (tb_cflags(tb) & CF_NOCACHE) {
@@ -421,11 +412,10 @@ bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
                 tcg_tb_remove(tb);
                 tb_destroy(tb);
             }
-            r = true;
+            return true;
         }
     }
-
-    return r;
+    return false;
 }
 
 static void page_init(void)
-- 
2.25.1


