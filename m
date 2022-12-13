Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2D564BE7F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:34:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Cmm-0000e8-D2; Tue, 13 Dec 2022 16:26:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmk-0000dO-BW
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:25:58 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmi-0003Ep-PD
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:25:58 -0500
Received: by mail-oi1-x22b.google.com with SMTP id v82so1042740oib.4
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 13:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3PNalx9xC9o37R0T2TRvL9fvT6DAngOYvV1/eVoQctk=;
 b=Qynv2f2/vRtNDVUKBo6HgeFZD8XuMJA+SSC0Cq6RS9h3xa9sFQmJPSBdMTWMQOIE9n
 bEDGMdWnyV01yeI0dhnum3xF0fgTF4KrHpGVwHY9cSVU3r3PJMtn5AQTrDLJrx5LVH5i
 dFR0GmEKX6XPK/aajWcoRYMDrEkhuhGPvsHkSbPhpFANurqJsq6U3jB4mu7m1QHVs7Os
 T4c8fQazaL+w5bh7Lej5m56hU0JmaOiogzOuL2KjbHmjliV9N/by/SuC0P0z7l/uDyme
 fav+h5j8MyYFSi1r1L9M5HUsc4lFiu4OAIMJcTqeCzf9q/CNo58k0M+2RcRKAbg2fTG2
 q6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3PNalx9xC9o37R0T2TRvL9fvT6DAngOYvV1/eVoQctk=;
 b=YJI/sN4WWZWTm0DerhhQ9xCc434m0CiRRIQ4efdgfZkWAp2/d/IzFnsIyH3InBqFG0
 vB9uZowDWQBaNnVfxzNDfcb4AxTmN+VXqsSVWpplaH5ZBnLfe8OIMgjKu56Dx8Odb1T5
 AuFaEr7fFVkcKb8SYcQC0gPqJTyOeKJt+abI7Xn3vq/d3g8/nBkzBN3TY4JJ+INjEsCf
 fV6zJmz19p21eFRLIzUTOoLBgCST36c78LztbeqBPQdqVQDSO0+wxT8mr6eGjiwYdw2Z
 2AEDdDB0fiQUSDnEDL80QmzPYcrCzkjRz7OPDoVNap5JmZj4ID+5xNVTTzIndJAWIlwV
 /s1g==
X-Gm-Message-State: ANoB5pl6QoOcXqV5IhjIa0cJyjMFrT/V5f0t3T9IjohdcPUQwC7qSygu
 FmKFo8whe1wtqHJH04EmScqb8nz9G3eXhK8XsY0=
X-Google-Smtp-Source: AA0mqf7BCEqaa9nWwr7dwlzf84FA6nTD/bOag2tFWKIYEXZE1hZfBPRZh8KFwtD1m6XRNCHgc59ZpQ==
X-Received: by 2002:a05:6808:1a9c:b0:35a:2589:1c2d with SMTP id
 bm28-20020a0568081a9c00b0035a25891c2dmr8982882oib.44.1670966755674; 
 Tue, 13 Dec 2022 13:25:55 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:c63:85ed:4256:8ad0])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a056808098700b0035c073aa0d8sm5006831oic.18.2022.12.13.13.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 13:25:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 12/27] tcg: Introduce tcg_type_size
Date: Tue, 13 Dec 2022 15:25:26 -0600
Message-Id: <20221213212541.1820840-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213212541.1820840-1-richard.henderson@linaro.org>
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
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

Add a helper function for computing the size of a type.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 16 ++++++++++++++++
 tcg/tcg.c         | 27 ++++++++++++---------------
 2 files changed, 28 insertions(+), 15 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index f2da340bb9..8bcd60d0ed 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -319,6 +319,22 @@ typedef enum TCGType {
 #endif
 } TCGType;
 
+/**
+ * tcg_type_size
+ * @t: type
+ *
+ * Return the size of the type in bytes.
+ */
+static inline int tcg_type_size(TCGType t)
+{
+    unsigned i = t;
+    if (i >= TCG_TYPE_V64) {
+        tcg_debug_assert(i < TCG_TYPE_COUNT);
+        i -= TCG_TYPE_V64 - 1;
+    }
+    return 4 << i;
+}
+
 /**
  * get_alignment_bits
  * @memop: MemOp value
diff --git a/tcg/tcg.c b/tcg/tcg.c
index dbf4e864eb..12676268a2 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3038,22 +3038,22 @@ static bool liveness_pass_2(TCGContext *s)
 
 static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
 {
-    intptr_t off, size, align;
+    int size = tcg_type_size(ts->type);
+    int align;
+    intptr_t off;
 
     switch (ts->type) {
     case TCG_TYPE_I32:
-        size = align = 4;
+        align = 4;
         break;
     case TCG_TYPE_I64:
     case TCG_TYPE_V64:
-        size = align = 8;
+        align = 8;
         break;
     case TCG_TYPE_V128:
-        size = align = 16;
-        break;
     case TCG_TYPE_V256:
         /* Note that we do not require aligned storage for V256. */
-        size = 32, align = 16;
+        align = 16;
         break;
     default:
         g_assert_not_reached();
@@ -3593,8 +3593,8 @@ static void tcg_reg_alloc_dup(TCGContext *s, const TCGOp *op)
     TCGRegSet dup_out_regs, dup_in_regs;
     TCGTemp *its, *ots;
     TCGType itype, vtype;
-    intptr_t endian_fixup;
     unsigned vece;
+    int lowpart_ofs;
     bool ok;
 
     ots = arg_temp(op->args[0]);
@@ -3662,15 +3662,12 @@ static void tcg_reg_alloc_dup(TCGContext *s, const TCGOp *op)
         /* fall through */
 
     case TEMP_VAL_MEM:
-#if HOST_BIG_ENDIAN
-        endian_fixup = itype == TCG_TYPE_I32 ? 4 : 8;
-        endian_fixup -= 1 << vece;
-#else
-        endian_fixup = 0;
-#endif
-        /* Attempt to dup directly from the input memory slot. */
+        lowpart_ofs = 0;
+        if (HOST_BIG_ENDIAN) {
+            lowpart_ofs = tcg_type_size(itype) - (1 << vece);
+        }
         if (tcg_out_dupm_vec(s, vtype, vece, ots->reg, its->mem_base->reg,
-                             its->mem_offset + endian_fixup)) {
+                             its->mem_offset + lowpart_ofs)) {
             goto done;
         }
         /* Load the input into the destination vector register. */
-- 
2.34.1


