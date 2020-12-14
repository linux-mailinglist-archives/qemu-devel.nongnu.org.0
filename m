Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAD12D996B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:06:59 +0100 (CET)
Received: from localhost ([::1]:46310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kooV8-0003ge-KD
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:06:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooS6-0001gt-B5
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:50 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:36138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooRw-0003wK-1t
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:50 -0500
Received: by mail-ot1-x32b.google.com with SMTP id y24so15767770otk.3
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EeMew5wTlTMjBZ99xkYZl0TWaxQaxxbFks8B9K3f6rI=;
 b=djVNtLKcFhVmVu3WqN4puhv2rNoiOdwSv9Zs57+Z9xOwei5S9xNG8DdVv7UUqOhQuR
 OkrOUsBtf50PnHRM0S14Fq7/T8N7hhxOw4cHUvyOebaz2iUGW5qUYAhbTcNiQVDrao1o
 Ti8qntY7SKJ/yJOuPLvXvWFBD7MeojjBqGCp0pJuoFOB0DXd6GMsWUjDjIESWeZ/ezKn
 2VNQQjEk6D+7fUyMGWrbvfIvjGip7HlprZxOTBqojnlZzHgkmeIEQooIryIDR1s+Hgcp
 sa/yiTv83vxeCO193HLXzvy4qUaViTAmXlCEnLl8azQzmfBj6WMI5XuIwbqxhfO+b1xi
 RokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EeMew5wTlTMjBZ99xkYZl0TWaxQaxxbFks8B9K3f6rI=;
 b=bXqftMT4nSwXjya90BoYScrq6VEVpVTRakId23zrBHU6XgzPJY/hFQTJJf7Yd4MJb2
 IOPwvpsR9MRmjjCmUYN0rwErnQzIBOWvFA1RKIq2p03cb3Vc0KnpYzrdO/O/y7LmfMMC
 k4MyBYRNGcKsQNXcoJEQuawY2ksGGESQ5rvBehIfS/FwfyH7VKpY3qh1CVve4u1eUkK4
 OOEi/KEu9ubHODRCR+QiCrwjIXFtSCU5LGb14shaS1v2XjLMoLJvRgA/eXFtESc2ogjj
 S3vLebHAuwnk/W3p4oYTFAC9wZCjvSGVLZkXfAlclIZB/8Z48KrSKliGpgaueYvyxQQ4
 F1IQ==
X-Gm-Message-State: AOAM531T0Kr4e9/FLW8+Ohwq2mv6rlkDMvmUGTwKUbOdyNlQPUPcOYIO
 2N55ov52BEw2CiQuF0pKi+4EdwolL3mRhSvq
X-Google-Smtp-Source: ABdhPJyAfgXU4d+LYvlKyampcF6nfd3/tuCTXJRzB3A9lEGwZAQLC8gMeKrTyyb4uGrt8yATj8dpQQ==
X-Received: by 2002:a05:6830:22eb:: with SMTP id
 t11mr20670646otc.114.1607954618083; 
 Mon, 14 Dec 2020 06:03:38 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.03.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:03:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/43] tcg: Adjust tcg_register_jit for const
Date: Mon, 14 Dec 2020 08:02:43 -0600
Message-Id: <20201214140314.18544-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We must change all targets at once, since all must match
the declaration in tcg.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h            |  2 +-
 tcg/tcg.c                    | 10 +++++-----
 tcg/aarch64/tcg-target.c.inc |  2 +-
 tcg/arm/tcg-target.c.inc     |  2 +-
 tcg/i386/tcg-target.c.inc    |  2 +-
 tcg/mips/tcg-target.c.inc    |  2 +-
 tcg/ppc/tcg-target.c.inc     |  2 +-
 tcg/riscv/tcg-target.c.inc   |  2 +-
 tcg/s390/tcg-target.c.inc    |  2 +-
 tcg/sparc/tcg-target.c.inc   |  2 +-
 10 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index b2ba16ea8c..67d57695c2 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -1250,7 +1250,7 @@ typedef uintptr_t tcg_prologue_fn(CPUArchState *env, const void *tb_ptr);
 extern tcg_prologue_fn *tcg_qemu_tb_exec;
 #endif
 
-void tcg_register_jit(void *buf, size_t buf_size);
+void tcg_register_jit(const void *buf, size_t buf_size);
 
 #if TCG_TARGET_MAYBE_vec
 /* Return zero if the tuple (opc, type, vece) is unsupportable;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index d94d38cc28..5f585c2ed2 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -97,7 +97,7 @@ typedef struct QEMU_PACKED {
     DebugFrameFDEHeader fde;
 } DebugFrameHeader;
 
-static void tcg_register_jit_int(void *buf, size_t size,
+static void tcg_register_jit_int(const void *buf, size_t size,
                                  const void *debug_frame,
                                  size_t debug_frame_size)
     __attribute__((unused));
@@ -1137,7 +1137,7 @@ void tcg_prologue_init(TCGContext *s)
     total_size -= prologue_size;
     s->code_gen_buffer_size = total_size;
 
-    tcg_register_jit(s->code_gen_buffer, total_size);
+    tcg_register_jit(tcg_splitwx_to_rx(s->code_gen_buffer), total_size);
 
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_OUT_ASM)) {
@@ -4507,7 +4507,7 @@ static int find_string(const char *strtab, const char *str)
     }
 }
 
-static void tcg_register_jit_int(void *buf_ptr, size_t buf_size,
+static void tcg_register_jit_int(const void *buf_ptr, size_t buf_size,
                                  const void *debug_frame,
                                  size_t debug_frame_size)
 {
@@ -4709,13 +4709,13 @@ static void tcg_register_jit_int(void *buf_ptr, size_t buf_size,
 /* No support for the feature.  Provide the entry point expected by exec.c,
    and implement the internal function we declared earlier.  */
 
-static void tcg_register_jit_int(void *buf, size_t size,
+static void tcg_register_jit_int(const void *buf, size_t size,
                                  const void *debug_frame,
                                  size_t debug_frame_size)
 {
 }
 
-void tcg_register_jit(void *buf, size_t buf_size)
+void tcg_register_jit(const void *buf, size_t buf_size)
 {
 }
 #endif /* ELF_HOST_MACHINE */
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 6d8152c468..9ace859db3 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -2964,7 +2964,7 @@ static const DebugFrame debug_frame = {
     }
 };
 
-void tcg_register_jit(void *buf, size_t buf_size)
+void tcg_register_jit(const void *buf, size_t buf_size)
 {
     tcg_register_jit_int(buf, buf_size, &debug_frame, sizeof(debug_frame));
 }
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index a197e6bc45..9b9400f164 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -2353,7 +2353,7 @@ static const DebugFrame debug_frame = {
     }
 };
 
-void tcg_register_jit(void *buf, size_t buf_size)
+void tcg_register_jit(const void *buf, size_t buf_size)
 {
     tcg_register_jit_int(buf, buf_size, &debug_frame, sizeof(debug_frame));
 }
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 0ac1ef3d82..7f74c77d7f 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -3998,7 +3998,7 @@ static const DebugFrame debug_frame = {
 #endif
 
 #if defined(ELF_HOST_MACHINE)
-void tcg_register_jit(void *buf, size_t buf_size)
+void tcg_register_jit(const void *buf, size_t buf_size)
 {
     tcg_register_jit_int(buf, buf_size, &debug_frame, sizeof(debug_frame));
 }
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 6d2c369a85..e9c8c24741 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -2703,7 +2703,7 @@ static const DebugFrame debug_frame = {
     }
 };
 
-void tcg_register_jit(void *buf, size_t buf_size)
+void tcg_register_jit(const void *buf, size_t buf_size)
 {
     tcg_register_jit_int(buf, buf_size, &debug_frame, sizeof(debug_frame));
 }
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 38dabe40c4..a0a5bac13f 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -3847,7 +3847,7 @@ static DebugFrame debug_frame = {
     }
 };
 
-void tcg_register_jit(void *buf, size_t buf_size)
+void tcg_register_jit(const void *buf, size_t buf_size)
 {
     uint8_t *p = &debug_frame.fde_reg_ofs[3];
     int i;
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 4416a93e1f..025e3cd0bb 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1907,7 +1907,7 @@ static const DebugFrame debug_frame = {
     }
 };
 
-void tcg_register_jit(void *buf, size_t buf_size)
+void tcg_register_jit(const void *buf, size_t buf_size)
 {
     tcg_register_jit_int(buf, buf_size, &debug_frame, sizeof(debug_frame));
 }
diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
index 37f4dc4cfd..1444914428 100644
--- a/tcg/s390/tcg-target.c.inc
+++ b/tcg/s390/tcg-target.c.inc
@@ -2620,7 +2620,7 @@ static const DebugFrame debug_frame = {
     }
 };
 
-void tcg_register_jit(void *buf, size_t buf_size)
+void tcg_register_jit(const void *buf, size_t buf_size)
 {
     tcg_register_jit_int(buf, buf_size, &debug_frame, sizeof(debug_frame));
 }
diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 1a40911660..4c81d5f1c2 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -1816,7 +1816,7 @@ static const DebugFrame debug_frame = {
     .fde_ret_save = { 9, 15, 31 },      /* DW_CFA_register o7, i7 */
 };
 
-void tcg_register_jit(void *buf, size_t buf_size)
+void tcg_register_jit(const void *buf, size_t buf_size)
 {
     tcg_register_jit_int(buf, buf_size, &debug_frame, sizeof(debug_frame));
 }
-- 
2.25.1


