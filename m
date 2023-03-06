Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4593A6AB478
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 02:58:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ06M-000487-21; Sun, 05 Mar 2023 20:57:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZ06G-00047V-Se
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 20:57:16 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZ06F-0003IR-CP
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 20:57:16 -0500
Received: by mail-pf1-x42f.google.com with SMTP id cp12so4788587pfb.5
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 17:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678067834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L77qkOSs51Hv1VBgnoUhwAR0MTuD2MxK8XGop9z/E6E=;
 b=to/MfcvR96FlKuEX2zW6r1r1qcKzhg5q0EyU8RIlH1fAHUkuGsrcgKjSA62AmZCOLs
 u1P4sfPygWsaBysj/N6eVd/l6qdMPOmvK0YvC6vZLSit5H9lELko4x4oceve4Yj3lA9W
 m7FO7TclTo6GDujWwlYbCZEsYKG1T/fWsXJrsKlsDWWi9LhyeLUgS6v9HQy0glEF05Jw
 sPXL8r7e4B5ITpLTjTmNHYYs/L2Cejvakbr+AwsGtoO55NNKzp7PVAIHAAmjCxFZSvxM
 kbF/cBd8tpouloji32WONGLRVAdanW46YtdFFQpLzftP2rFkfEBX26hNvj6iFe3RKwSR
 u8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678067834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L77qkOSs51Hv1VBgnoUhwAR0MTuD2MxK8XGop9z/E6E=;
 b=vXnxDl3AFR6iFjaLKCZd6FB+C96q9f2F2e0nQD7myX5zADO0PwlWRyMyeZMofIcZgY
 dfy0aiIo2KbynkE8y7TndD7xsgCpyLADIxSEdBeR6JGXpuntb9COBr41QVbITqi8svX/
 5vgHFUOl6+wn6iFJhg4TwAzvf0LIt5VLp1ijbqHIKuDgDP1R9zyAArro+epSvO0OnL8L
 Tz1a6P6Z26LfwS1/QEVtBzBknIOYPkTHMXoT538ZLDVICCJteUPo+b1D98RXP5akCZmK
 Q1BPqqo+ed+Ga+qHxgSHSesdlUTepr5oD12y+Xr4qi6ubBP7COokQp9JUgkE9tgoZUW9
 rJsw==
X-Gm-Message-State: AO0yUKUTbdLew9vfcXOd0oWqZtO8Q6Jl43bPZcOnzT7CJcc46efNFTWj
 dafJ7De8LxU37/1+T/+cF+bbiDvNiyHg36U8v8JJFA==
X-Google-Smtp-Source: AK7set+AJAzi68gHhcaoLSbma89Y6jNQXy8yuoOZje2gCu7DVNpdh5GpXqCfd8h+0XevteoGsuQVvQ==
X-Received: by 2002:aa7:98de:0:b0:5ec:702c:5880 with SMTP id
 e30-20020aa798de000000b005ec702c5880mr7556387pfm.32.1678067834076; 
 Sun, 05 Mar 2023 17:57:14 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 g23-20020aa78197000000b0061949fe3beasm2921056pfi.22.2023.03.05.17.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 17:57:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 3/5] tcg: Create tcg_req_mo
Date: Sun,  5 Mar 2023 17:57:08 -0800
Message-Id: <20230306015710.1868853-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306015710.1868853-1-richard.henderson@linaro.org>
References: <20230306015710.1868853-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Split out the logic to emit a host memory barrier in response to
a guest memory operation.  Do not provide a true default for
TCG_GUEST_DEFAULT_MO because the defined() check will still be
useful for determining if a guest has been updated for MTTCG.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h   | 20 ++++++++++++++++++++
 accel/tcg/tcg-all.c |  6 +-----
 tcg/tcg-op.c        |  8 +-------
 3 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index a5cf21be83..b76b597878 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -1171,6 +1171,26 @@ static inline size_t tcg_current_code_size(TCGContext *s)
     return tcg_ptr_byte_diff(s->code_ptr, s->code_buf);
 }
 
+/**
+ * tcg_req_mo:
+ * @type: TCGBar
+ *
+ * Filter @type to the barrier that is required for the guest
+ * memory ordering vs the host memory ordering.  A non-zero
+ * result indicates that some barrier is required.
+ *
+ * If TCG_GUEST_DEFAULT_MO is not defined, assume that the
+ * guest requires strict alignment.
+ *
+ * This is a macro so that it's constant even without optimization.
+ */
+#ifdef TCG_GUEST_DEFAULT_MO
+# define tcg_req_mo(type) \
+    ((type) & TCG_GUEST_DEFAULT_MO & ~TCG_TARGET_DEFAULT_MO)
+#else
+# define tcg_req_mo(type) ((type) & ~TCG_TARGET_DEFAULT_MO)
+#endif
+
 /**
  * tcg_qemu_tb_exec:
  * @env: pointer to CPUArchState for the CPU
diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index 5dab1ae9dd..604efd1b18 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -74,11 +74,7 @@ DECLARE_INSTANCE_CHECKER(TCGState, TCG_STATE,
 
 static bool check_tcg_memory_orders_compatible(void)
 {
-#if defined(TCG_GUEST_DEFAULT_MO) && defined(TCG_TARGET_DEFAULT_MO)
-    return (TCG_GUEST_DEFAULT_MO & ~TCG_TARGET_DEFAULT_MO) == 0;
-#else
-    return false;
-#endif
+    return tcg_req_mo(TCG_MO_ALL) == 0;
 }
 
 static bool default_mttcg_enabled(void)
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 2721c1cab9..d6faf30c52 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2930,13 +2930,7 @@ static void gen_ldst_i64(TCGOpcode opc, TCGv_i64 val, TCGv addr,
 
 static void tcg_gen_req_mo(TCGBar type)
 {
-#ifdef TCG_GUEST_DEFAULT_MO
-    type &= TCG_GUEST_DEFAULT_MO;
-#endif
-    type &= ~TCG_TARGET_DEFAULT_MO;
-    if (type) {
-        tcg_gen_mb(type | TCG_BAR_SC);
-    }
+    tcg_gen_mb(tcg_req_mo(type) | TCG_BAR_SC);
 }
 
 static inline TCGv plugin_prep_mem_callbacks(TCGv vaddr)
-- 
2.34.1


