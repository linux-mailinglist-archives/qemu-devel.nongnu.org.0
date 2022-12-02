Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE5D63FFE3
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 06:41:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ymc-0002eY-Md; Fri, 02 Dec 2022 00:40:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymb-0002eK-8i
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:21 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymZ-0003My-Eq
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:20 -0500
Received: by mail-pg1-x532.google.com with SMTP id 62so3525488pgb.13
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 21:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3PNalx9xC9o37R0T2TRvL9fvT6DAngOYvV1/eVoQctk=;
 b=GiwqymHt8LAh9jA+y7sv/yHuUQ9/o++2EPCQeFgzMCt0lyKzXvleeaIKmjj24tdGWM
 1Pq5ZJAN1k/CiZ8lyqntyscRtev5olhRiS7+vV4MWojVtlTZINMqcgHhK8v8q/iwAVm8
 6xVj5D2sOHA51vbxryR6YPIYEQUxwz3n9SQlaEXnAYZ9l1PqP2W01hECEHbLRQi7MBhh
 V4+RvsPF3EgZaAoaN5h3hOi2olOUrc9GEk2zQp/Bw8AEd07rHbgRySywAOtAhU5hHqda
 ZoMlhhG3xOnajHuU79JAqrN52YWFl+r017ujPExjo4up17ELAaKUXF7EJPgDOqx/T/PQ
 nVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3PNalx9xC9o37R0T2TRvL9fvT6DAngOYvV1/eVoQctk=;
 b=ap51f5mB+GmCZDb57obU46MTum1Ap852gr27vAaKlp1XeLHNd69hmolwqr8O+AXSw0
 OWbNw+J8UjHvwd+cEmN5Pl+mAj/III73CUnscS4ytgwR4GP/C5bxi3pcuocuHDz54Rr6
 /icTwK2GBW1KbxPehot4iDpjlxo5MX8MTyiQHUPRzlD/jcFU/8bMdNgZDrsRRY7hJBtn
 PKYJpR8bfALJLfByCa4hbQNZCywYKAMoDJ1EtWvboBdIzz7OPjBLAlKzP/mwtPo7lcGV
 TjGMBHEKnY40wDXvASjjRExzWh9aS1FhNYx4VHUI81dRsLkRFrVgfGdwTKQ9Q+Xo3mYP
 DvNw==
X-Gm-Message-State: ANoB5pmYb63nBrO0cbmVG+8lKvKKokBPDOsOxpSlTaPvxQpt0wP3PxWT
 7JdOlswepqIhry9LbOGzAvT852vLAHhqKrSg
X-Google-Smtp-Source: AA0mqf5u/LRhf44hLnbyzcYbcvviuUo84h0vo5e4Bs6JYttRqcKekm4snA/nFhdEJRN9SV/Agin+mg==
X-Received: by 2002:a62:d10b:0:b0:575:ad52:ba94 with SMTP id
 z11-20020a62d10b000000b00575ad52ba94mr14981954pfg.74.1669959618148; 
 Thu, 01 Dec 2022 21:40:18 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b00186f0f59c85sm4637075plh.235.2022.12.01.21.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 21:40:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 18/34] tcg: Introduce tcg_type_size
Date: Thu,  1 Dec 2022 21:39:42 -0800
Message-Id: <20221202053958.223890-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202053958.223890-1-richard.henderson@linaro.org>
References: <20221202053958.223890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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


