Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48143655BD8
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 00:59:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9EP5-0002tT-VQ; Sat, 24 Dec 2022 18:58:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOl-0002P5-4n
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:52 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOi-0006Jy-OL
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:50 -0500
Received: by mail-pj1-x1032.google.com with SMTP id ge16so4312198pjb.5
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 15:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3PNalx9xC9o37R0T2TRvL9fvT6DAngOYvV1/eVoQctk=;
 b=iiBm/1izNBrdardKXJtEhew5V5LimT7uyQsGF1o5TOfhEV43XEFPJ+5Go5F8du6g+0
 WJQG5QiBMIffrB4BGDiCkZ5TxxmLKHOJK2pCPEZlc8NEeHHK8I+9Gw11n3ohtSXEWxRR
 v0gctMSj3jYa+Pj3d5VerwuqhQ9ta9MnkZfmj1fY9lP5sLrrRdz9PJ8Ivrpr2NsnKzM8
 n/H2M0YQ+XK6BvgSn6F1X7xOVpPHBBAesekIVEVyuGqdZIMmTuF74j3gy9cn81zgZDfy
 U+NANuZWdABpgt2QYIvrQKe/eCwcShxuYdz18/7glmtLua/mJA375ygwDZJgH09WDfuf
 wIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3PNalx9xC9o37R0T2TRvL9fvT6DAngOYvV1/eVoQctk=;
 b=V3cRnGL85IXbGfXbmYcsbkC8yVDx7MkyEjhCAhwXfc+0dTY4n2AjTTU8E5ULLIEKn9
 i45+P4b8OlyV3knzI/V87FrgFCZmIvpxvVF+Nv2xDWxe/yyBbx1K3PvHW9OqCALvPmpN
 cA1rucKkE6JT50PJVUSMx5LyzlUcF6ghm71ILT4yT+sbD4LMi8JWoQiI6N5iFhFDYNNz
 sj52JcraNJqSqjgWpNqPlWitaQE9U4p5C0+HEIoBC5mJXyrfyzcwvG7AsEAP23xjGoO5
 AzzVkBo+Yesu5mypEqEiu/R5tsw25fBmw19vj5lKmHwQHdLQrBiaGhaJOyB9OEQzKPkA
 FFSQ==
X-Gm-Message-State: AFqh2kovc6v1skFSzq0ZryWpfy58Mgo5Rhd8NTqGMOFTiEYjurY9r4WO
 tzEWO76vO5t+RZ7a+xq/+0tmaBmyig4MDJES
X-Google-Smtp-Source: AMrXdXs2JVBA9++y9O8i82qi/x6E65P9W+OA2SVsXGB80/vsiDw9VKEthD0KdfgQ9memQcWbGPkRww==
X-Received: by 2002:a17:902:e952:b0:192:4ce1:3687 with SMTP id
 b18-20020a170902e95200b001924ce13687mr17659658pll.52.1671926268021; 
 Sat, 24 Dec 2022 15:57:48 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b00187022627d7sm4599716plb.36.2022.12.24.15.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 15:57:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v5 27/43] tcg: Introduce tcg_type_size
Date: Sat, 24 Dec 2022 15:57:04 -0800
Message-Id: <20221224235720.842093-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224235720.842093-1-richard.henderson@linaro.org>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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


