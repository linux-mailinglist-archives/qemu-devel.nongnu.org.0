Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 258442EB15C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:28:52 +0100 (CET)
Received: from localhost ([::1]:55346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwq8Z-00050l-6d
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:28:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0K-0002Ji-3M
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:20 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:34009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0B-0006SG-7W
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:16 -0500
Received: by mail-pl1-x636.google.com with SMTP id t6so73951plq.1
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wFm6MDTFivie1E/Xe2P9hEcJO2tCRms/0WVX0C0Bj2Q=;
 b=jw4rWHdVAEZZcIaU+Pb4omEybixJ04qc/T7/Q+tatFUsguJ51Wd8Dcwi0BGJqh3NLh
 JgflBzJU2DnkhPYJFVmsgzNZR5SVw0SLlS0boF0vypgut8KZpfxlzS7ntbt6vgOU+Jbt
 c54OHl6ZoceJWZAHDpJ6iIERzIewCe3Dmqql7Ywa9AfUatozAfSPOdL7Vjy2aT1zqTE8
 hDO3RnH7wisKg3dTGJ974ypMIOLikTapnycWkYLbFhQo0A/7KJZy6cuFXACY7sGlafTt
 MkbzJP6Q2+wc5S/D05j1jBFBtATxEdRjgIGQQymXfGgEsHV6sEQG6OTrLwcN5gx18hL+
 puAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wFm6MDTFivie1E/Xe2P9hEcJO2tCRms/0WVX0C0Bj2Q=;
 b=WgXWXx1iRGQ72CpVb5pjb0u+gNmNKjfdi/ND7kIUYitslvz4EGnj8Aahjsz2q7xiqE
 78OYH1QKL3m7Bby2NqeZ+B6Tifs3Vz3VctgUPWjXQcU005Bvh3+6Nd03ypP2ocarkx/x
 DX59/HVLKpQkdeiJaV6LeLH19LEgogpf+bL4qENOssbOWBZWekYoUdeAVbWthZPSmyoo
 66M1A8k54+KPPNYD3CR1n/+OhfialnSQh819/7FGXMktqWzFvyTZcTzbOmncSUyDX3h7
 1oh/3LBt/ebfrENZgBaT45umV7Sa+gKZOg4KEiDNPvhapu2y7D7+bpZXOs9OUq4mZ4d6
 QecA==
X-Gm-Message-State: AOAM530WJ4N2wUOtGc0/Zt9s83/kpFTNFyMGlgcbnWzMJaWwf8sSSwhr
 LM3MhA6QBl+33TaFU8uapeBdWPDtZS4p/A==
X-Google-Smtp-Source: ABdhPJymkQ1VfYxQ//Z5ISohjRk3FUKg4FxxqCJKgLrWto3thBnhPA2UHd/8l7ui5Hj9b8vtWUEbAA==
X-Received: by 2002:a17:90b:4394:: with SMTP id
 in20mr300466pjb.34.1609867209396; 
 Tue, 05 Jan 2021 09:20:09 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:20:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/43] tcg: Add in_code_gen_buffer
Date: Tue,  5 Jan 2021 07:19:14 -1000
Message-Id: <20210105171950.415486-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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
index b7d50a73d4..9f5879b63f 100644
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


