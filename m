Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F77607152
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 09:43:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmh6-0008Mg-7f
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:43:52 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmHY-0003G2-Rw
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:17:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHG-0003CH-BJ
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:11 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHE-0005kb-Fv
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:09 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 i3-20020a17090a3d8300b00212cf2e2af9so854516pjc.1
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JONxt9CE65pjWaD+nTpNlKjL3nDuRwB7r5QiBKPwDCY=;
 b=VABAGKaGx25IkbEfL0YUAnzAlz49KNPSwdhSN8lORyV5W4oMvfl237lql2virU41US
 jinc/H23DO4NskLnEamk54jreoJ1AYN7h2L1XZAyDQeDzJCgHnMxGuZcRBe+ue843Lo3
 1zgMatg2W2t9XzCfY0UdozJ/mTPevHP4bPIF8cGWff8APMKAyAbdQjwxxlnt6oeupBd0
 1QOYJC4lYbTOyapP5DqE1IIipyMc05L516aE5cLAOHuWtN/EiDZcQ8wDomlaKtCtqseh
 bqFSzt/t0cki/5nptwX5K1RUd7ODevRojnn01X2Ak3Xo6pmXQauznqBX10zZWjSFa9Hw
 R/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JONxt9CE65pjWaD+nTpNlKjL3nDuRwB7r5QiBKPwDCY=;
 b=vpZ8+mwO7inLFPczGalCXbfNOLgybsjtDmaAtUKXEfTP1OK10CO8EBs6/1QFCMlSvj
 cRL13GZxvBNyAHiFZcn1F7tbiexmM/FJ284UPLue4YNHAYrdLDF/F2zaGPMP1GC3966G
 RXg5aaDpzbs6FTgSUzYi7Hz15/2WMDPuQ330Irz0VUOdxCe6OgkzeDljMLBZF75HzP8g
 5A0ynT1yAY8aovC6TSxejuQgeylqVmZGQD0rMnQupJN9zwwt5EtZkA4ePwEzjbz353pG
 dvqk4oPaLYFENl9IuBJI0v3dxx+NNOlX9ZKWGk/age+uJQmLG1Sl85cW7igCdAX7SRB4
 pJKg==
X-Gm-Message-State: ACrzQf1CLoOB9n6W0ilmgs+V+jyzToApSBxb83lN8wktrBNGQtK40/ku
 MxFgVdqw8hHTJ5hdQZ+UzOiHKe6U+sFMWm6G
X-Google-Smtp-Source: AMsMyM6Sh603TYee2sO0Lc1QHwbz2+IebEccL2YigTd6+YcyCiaSr553x3dulocC0u/fHuAPWamDlw==
X-Received: by 2002:a17:90b:4a0b:b0:20c:5ac8:1e2c with SMTP id
 kk11-20020a17090b4a0b00b0020c5ac81e2cmr20417930pjb.98.1666336627030; 
 Fri, 21 Oct 2022 00:17:07 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b0041cd5ddde6fsm13003327pgn.76.2022.10.21.00.17.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:17:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/36] tcg: Introduce tcg_type_size
Date: Fri, 21 Oct 2022 17:15:28 +1000
Message-Id: <20221021071549.2398137-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021071549.2398137-1-richard.henderson@linaro.org>
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a helper function for computing the size of a type.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 16 ++++++++++++++++
 tcg/tcg.c         | 26 ++++++++++++--------------
 2 files changed, 28 insertions(+), 14 deletions(-)

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
index 73d8b33b06..48b517a856 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3110,22 +3110,22 @@ static void check_regs(TCGContext *s)
 
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
@@ -3641,8 +3641,8 @@ static void tcg_reg_alloc_dup(TCGContext *s, const TCGOp *op)
     TCGRegSet dup_out_regs, dup_in_regs;
     TCGTemp *its, *ots;
     TCGType itype, vtype;
-    intptr_t endian_fixup;
     unsigned vece;
+    int lowpart_ofs;
     bool ok;
 
     ots = arg_temp(op->args[0]);
@@ -3711,14 +3711,12 @@ static void tcg_reg_alloc_dup(TCGContext *s, const TCGOp *op)
         /* fall through */
 
     case TEMP_VAL_MEM:
-#if HOST_BIG_ENDIAN
-        endian_fixup = itype == TCG_TYPE_I32 ? 4 : 8;
-        endian_fixup -= 1 << vece;
-#else
-        endian_fixup = 0;
-#endif
+        lowpart_ofs = 0;
+        if (HOST_BIG_ENDIAN) {
+            lowpart_ofs = tcg_type_size(itype) - (1 << vece);
+        }
         if (tcg_out_dupm_vec(s, vtype, vece, ots->reg, its->mem_base->reg,
-                             its->mem_offset + endian_fixup)) {
+                             its->mem_offset + lowpart_ofs)) {
             goto done;
         }
         tcg_out_ld(s, itype, ots->reg, its->mem_base->reg, its->mem_offset);
-- 
2.34.1


