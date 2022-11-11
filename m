Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9617062552B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 09:26:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOfr-0006bR-K4; Fri, 11 Nov 2022 02:42:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfY-0006Bd-Cv
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:46 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfW-00082S-0e
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:43 -0500
Received: by mail-pl1-x62a.google.com with SMTP id l2so3600868pld.13
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FrghbrOmwlRnL2e6OOqpXhf7jPD3Ma/5bcPh3TvRHME=;
 b=e5b2lawj6t1ic1BEGnykBVITwtscs84+VCQF7p0ub4c5vmf659ianyDFlZJu+T9GZ9
 e43kJZd7liHBZTKJ3pZuIAVG/LN4dqTb2ls00e5GymAtrqB8Dt2GK7fuW56mHXex+nRp
 rGzRwRRMotIKw6spe6fajOd9XrlFYJ/4dGShlyc97LUYxpkPhCvTPFtI+kRqbcQGoipJ
 7867qw50dQBtjj2C/LXaCrjMtQf1bofUm6roQCx/OQhfGXqb1HRPn9gp0Xk9A3QUkxbb
 AhXKytTvmPZaYLeP/8VWOePebjRgNAHAgEOy+1xV8pZlUXQ8pW5zv5FgE4h3+doBGzzj
 Obvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FrghbrOmwlRnL2e6OOqpXhf7jPD3Ma/5bcPh3TvRHME=;
 b=ANPr3YBBUwsxpNMoICVVCwtJWNXYE9UeWj2xytnEAPbCAWuEpmU2WUtHoq8Z1Sz8Fl
 NHAtOd20e3g/wRbUyNrjXh35/8EaLDF5L8fRz24l7TTvP7c72niF1LSsg/PMJt8QvzFK
 bYmh5i1yG2702EeMIYkQg2DP4JTYlNZa6t5KEzj21UswrO5TlUOA5s/mApQX/NcV9x/6
 52180KGnBXY/wFSXn2fiNUueCIWlIqgHC2n+jvY9nTPpD73i4mmZcZB3qrAHtF3mSrkO
 /Wwr2QiBsYrBjfo/MTWCP82EmC6nigPI9jSx6n750T0R73eiNxocZrg6D4yLEBuqDFOe
 2+1A==
X-Gm-Message-State: ANoB5pkfPvKzzdXf8yL1QokOhyYwkIyQW45qh6CPk/aw23AQgnyKh0+1
 a64NxTUZHkmb3DX4S3+Y+euyvQIMzwFy3UZF
X-Google-Smtp-Source: AA0mqf4Q8QiArrUQe0wMBkMr+9KbdzkC+5I/ejJRZb1yJuznSu2toWKTN9o4CYBm8oKK1zEJ2mRf6g==
X-Received: by 2002:a17:90a:7442:b0:212:d686:f99f with SMTP id
 o2-20020a17090a744200b00212d686f99fmr626722pjk.109.1668152500746; 
 Thu, 10 Nov 2022 23:41:40 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001754fa42065sm976069plg.143.2022.11.10.23.41.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:41:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 v3 14/45] tcg: Introduce tcg_type_size
Date: Fri, 11 Nov 2022 17:40:30 +1000
Message-Id: <20221111074101.2069454-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
index f9315d00fc..ec03bd3d6a 100644
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


