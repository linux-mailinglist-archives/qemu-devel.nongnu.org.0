Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA256062CD
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:18:44 +0200 (CEST)
Received: from localhost ([::1]:37234 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWNa-0000uV-6e
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:18:40 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWGz-0006GN-N3
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7a-0004zB-NI
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:07 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:45659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7X-00011x-3D
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:53:57 -0400
Received: by mail-pl1-x631.google.com with SMTP id u6so2562806plq.12
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YCzzdZnSyQ77Hz0BhaipGA74v3MTG0pAyrseErj1GHU=;
 b=wo31aJuU/pxjjXGnO59hEJV6zLOVS4GbuQN2xA1OJRRIO64C3JtfL9goXGV4p2XoC3
 6/3GJysBnOJ0abo6hFsJInNZ7apCrRjtm0A+IQkI8Q13cf70rMlOuktAT0s9JaXxNiBV
 etkAGifYjdlF/RCrM4QecJUPkDwv5+aQR0F3gh8xgOhoU2XZJxSHcy+sf6ZehVpFEcjV
 WXPusoZ9gESgWwfh96/bycs8E5vN/vSbsEz6PRHcLjaE1K2ZEOQYrRKjT4Z19ARn9k44
 frHRmXwo3FmFNjL0OyjlqOv6qD8OTBuZiGCxvRGVpsn4Ttf0wfRA/d3fyX9x/YldGY2D
 2qYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YCzzdZnSyQ77Hz0BhaipGA74v3MTG0pAyrseErj1GHU=;
 b=QhQAUXm1jmHyFH+0TnlbCsxxH2Rq5RB36vOFow+FmUjgjbtFItqUSVja1xtSSUEIt+
 w/pjMUrHcReDOi11JoPupFSKJuNClmlE/XpkHrFdfEV00yuTQOdxEJK30nzQ9df1WfmU
 NkDSpfPsEms48yZemZzO7PrGGxM+g/wbgixaFOaZ9354dUud6eNJfbEiW5lvtxp+Kfo5
 6YUnlTBhk20W9jM5OpBYuBT0RwzhtXhW7godirGxMp6fk8G8fnJo/GriWG5KZPU+Nedq
 9ZIsDzK+Wl47i9TBj3PuoGB/HDuNGnjsBsZFYcOeGp6Sbq5u2PxLiQ15D5rP/so2OSEi
 sEeA==
X-Gm-Message-State: ACrzQf3hhl8N5SPTh4r2pdBbrtacBtGcAwxqa1WVMFe9F4ctDph7udR1
 7cMTWL4a/Z5SdxqdbzuemNBJOcSbNfE7Qm85
X-Google-Smtp-Source: AMsMyM5w63kYQS0UKi2jcFVlTDoCXNavrzpPVQdPCM8hDjXosC3kQGv1rrcPEqhPJbOqixpbl/3xmg==
X-Received: by 2002:a17:902:bc88:b0:185:4421:250 with SMTP id
 bb8-20020a170902bc8800b0018544210250mr13183848plb.29.1666266833618; 
 Thu, 20 Oct 2022 04:53:53 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 w206-20020a627bd7000000b0056109e15638sm13065464pfc.54.2022.10.20.04.53.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:53:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/31] tcg: Introduce tcg_type_size
Date: Thu, 20 Oct 2022 21:52:24 +1000
Message-Id: <20221020115242.2301066-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115242.2301066-1-richard.henderson@linaro.org>
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
 include/tcg/tcg.h | 10 ++++++++++
 tcg/tcg.c         | 26 ++++++++++++--------------
 2 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index a631e0bc80..08f997cbbc 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -319,6 +319,16 @@ typedef enum TCGType {
 /* Number of different types */
 #define TCG_TYPE_COUNT  (TCG_TYPE_V256 + 1)
 
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
index 71afa4b749..c1b9010b55 100644
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


