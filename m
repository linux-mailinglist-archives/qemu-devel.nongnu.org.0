Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A652EB177
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:35:39 +0100 (CET)
Received: from localhost ([::1]:42356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqF8-0003C6-M3
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:35:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0S-0002Mk-KH
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:30 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:37703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0J-0006XA-TC
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:27 -0500
Received: by mail-pg1-x536.google.com with SMTP id z21so287114pgj.4
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rtXLHEnFm6PYImUKUfsTMRutoZrBjCY0hpS4NqovFSw=;
 b=EY+M/8gNzVhdKntpBBWgdB1gsDvy2Vd5rYKdBhF7OVi5oaZ/qxF+a0u/eyYGW5S+yF
 Hs0RLKfU2Q5j1ng9GhghIrN0bLqvsuwDKR7QR+otdQ3SmChF5jvmhWGSXQ/4S101GTYT
 F7gLZPMXA4TSAs98GJTUSl5poVWC3ZYy1TphtZpByDWa/z+2ZAOFw3gicG0qGncoebJJ
 jZQ1E1dunezKTfgW1xa3aO03jDXuPnKlCcV1dqmsivljLIVNz2dLBfBELVMUdHOyh+hk
 Fn4lJUwKm9EwXkaRsAciNB/oo3akNHro7EQchX+kcx8gtfph4v9fOzKJs9d2xuU2RD2c
 hnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rtXLHEnFm6PYImUKUfsTMRutoZrBjCY0hpS4NqovFSw=;
 b=uL3F0YhcbZNwsIsCYvtYkr9G2ilAaVUR+0udfG/rLZXNq2INPVxjcWRiD9aOSv5LKa
 Hca15HKbQnIDHjwUsJ/HqlU+m26bO2Obw1LvuMTLE38NGr0p+os9WGDqAKSs6MaTANMN
 Lnss/FTLm70ClnXtw7eBceO1D3zLD0tYl+nJA2hXNwYv8Ui4605vCYNgyqp92srBYG+J
 T1PVT3TGw1FQofiHprY7y05gkpkYlxfYtIiSUEO6ZRN42H/3/e1CpAwiCt+n3QtXSWic
 YmLYSCAte5nznfA0lG67uOK/19XJ4LQYjne0ZgAhi0cWrT47B5iptWe1He+qjkQh4KDK
 DY5A==
X-Gm-Message-State: AOAM533feOeoFo6acQgKyHsh7L4IG0Ce+JIQLoM2App/NGCWN7eXqDgn
 24jr0CyxeZeUYuAlRYI8e9KsaVpvyZ0r/w==
X-Google-Smtp-Source: ABdhPJyZIDYYBfn/tVFciPwv8K+1aMVlDaiH44gCsGGzeWm9ZN4gs/XdVv8lVB2xSrA0bTB40LTjDg==
X-Received: by 2002:a05:6a00:88b:b029:19c:780e:1cd with SMTP id
 q11-20020a056a00088bb029019c780e01cdmr456388pfj.64.1609867218037; 
 Tue, 05 Jan 2021 09:20:18 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:20:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 12/43] tcg: Adjust tcg_register_jit for const
Date: Tue,  5 Jan 2021 07:19:19 -1000
Message-Id: <20210105171950.415486-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We must change all targets at once, since all must match
the declaration in tcg.c.

Reviewed-by: Joelle van Dyne <j@getutm.app>
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
index e9af279738..e744a1ce02 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -1255,7 +1255,7 @@ typedef uintptr_t tcg_prologue_fn(CPUArchState *env, const void *tb_ptr);
 extern tcg_prologue_fn *tcg_qemu_tb_exec;
 #endif
 
-void tcg_register_jit(void *buf, size_t buf_size);
+void tcg_register_jit(const void *buf, size_t buf_size);
 
 #if TCG_TARGET_MAYBE_vec
 /* Return zero if the tuple (opc, type, vece) is unsupportable;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 898c4bd1b6..f278772512 100644
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
@@ -4511,7 +4511,7 @@ static int find_string(const char *strtab, const char *str)
     }
 }
 
-static void tcg_register_jit_int(void *buf_ptr, size_t buf_size,
+static void tcg_register_jit_int(const void *buf_ptr, size_t buf_size,
                                  const void *debug_frame,
                                  size_t debug_frame_size)
 {
@@ -4713,13 +4713,13 @@ static void tcg_register_jit_int(void *buf_ptr, size_t buf_size,
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
index 197e3006c8..d272975ff1 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -3976,7 +3976,7 @@ static const DebugFrame debug_frame = {
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
index 90588ca2a3..0518595742 100644
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


