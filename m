Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9BE2EE6A9
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:21:34 +0100 (CET)
Received: from localhost ([::1]:59204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxbmn-0006Di-Em
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:21:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbh0-0001BG-Vo
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:35 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:51490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbgq-0001Zh-1S
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:34 -0500
Received: by mail-pj1-x1033.google.com with SMTP id z12so2113424pjn.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rtXLHEnFm6PYImUKUfsTMRutoZrBjCY0hpS4NqovFSw=;
 b=IDQ37mg04ipoga/gdigKisakv9sEGUi1r0LS5oym5igu9gMjZBcDAIeSXFC4U1jnwI
 KvbSVeqdS+K4/dwRwt/laxGe8n+8dLO2Izj9lI4hkEgay5TBI0KUzBqkDbbqGTyF+hOj
 9rMinCylZAd/6MYHPoLbU2TB7KKXBfHdwmHlYxPaG0FPRbxGV2SykgM+WXZanfskCJy7
 sUcH28sTSDA9tfYaxeUGU6rneAWrbouL7WS2xfz7TN1u9m4RHZSI+4Jea6KrhGxdLjQH
 6jDEGP1nhF/39eVM8qkZXnRgqaTOz5pmoIzkPs7lMIXU3TwzvqAhbXaR/IXaCnF7fQA4
 V1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rtXLHEnFm6PYImUKUfsTMRutoZrBjCY0hpS4NqovFSw=;
 b=n9kw/9S9vAdBMd1+K85EfK+wc+1YOkKmJWnUI6/yZIjHK2b5P7TS1Gv1ehRVAyE1o3
 I58PDdZr0ljC4Gx5ZGWhqcHQjl/XOabzzW9NK+GBYWMyFb3wRzU8Na+v5Qz1cVGxLp9e
 /57w7ZWCDJCU++K9OyNl9Y7BnsC6NBrpo+hzc3UO0r7YI2hQYWr3mBKp5SljNLdob7r9
 NZSR13z2/OKAlXg/Am7JI9+vnAasjNr39KDn38LC2pLGQpEvAF/K745YUN4BLngY5KGP
 JdGH554Y0ZY2eGUKeUbanGvYucjv2TeqFuX+24+2ea58uKhGATjgUnTu9kj+FV/4auWQ
 fI3A==
X-Gm-Message-State: AOAM530+Bv0MH75vXl4pNzF+RwaxN+u9UprZZUyrrzkoYqc2H6Ad7kGk
 3a3ANfTrbJYoscswWUd07oVt3Ty7G0i0zw==
X-Google-Smtp-Source: ABdhPJyojZmuv/pVny1PfM/PxZ576qJm8S5Tc1pVVFVqDL5fth40oFwrims2jevKiMCS1yXFHreFPQ==
X-Received: by 2002:a17:90a:1c02:: with SMTP id
 s2mr186707pjs.212.1610050521080; 
 Thu, 07 Jan 2021 12:15:21 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:15:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/47] tcg: Adjust tcg_register_jit for const
Date: Thu,  7 Jan 2021 10:14:17 -1000
Message-Id: <20210107201448.1152301-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: peter.maydell@linaro.org, Joelle van Dyne <j@getutm.app>
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


