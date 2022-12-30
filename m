Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D9C6593BE
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:16:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2sL-0003jp-8r; Thu, 29 Dec 2022 19:03:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rY-00039U-7d
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:03:05 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rS-0002jX-6h
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:03:03 -0500
Received: by mail-pl1-x632.google.com with SMTP id s7so20361635plk.5
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2o2XDAJHkByCPpkF/Lmz5Vj1kOnPZRYyLt/A96h6Ftc=;
 b=WOzC4oBUrSOpQ5ZnNDi1URQ60QzwVqDv/isINYLe1QLIx2UutNdUC1y+EGYkSfeUQK
 9joChL8Qpv5fvsa9oVpA1TBjqI5Pkc+1l+cNXkkb6cNUqxjeOVVgXABMMo30C7q4ERyL
 JTjkeOcBdVOpKZhtnV91zw8HkusgFj0zqNWml42vTnlfv2yCaq4Gmz80e6hgrJtbyidH
 qgq+zoQdtkwChn+8iwQoChAjdGFYHQbjuj19n86S5PZfDGfRyw9SBehWz9RKwnp8dzSE
 isSH5FJCZEGuA3glS7Kyxiil0Itb4j9TqpbaG5bvR2Tii2yWSlCWgxxeezVCowcyZOyS
 yi0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2o2XDAJHkByCPpkF/Lmz5Vj1kOnPZRYyLt/A96h6Ftc=;
 b=1XGyga2eDwm7YBV/+/UCw3CJ1GLPrQjjNaC63yE1+v4CJ4I6DIhB8lIo092zSK0sbh
 cLNlSidfgQJhpQBlQ424CEsKBEBjDza1r3Z2CwCsQmGmIIPPTOJUmJys9vByDQgeXDrS
 iM6RI1H0KWM/vM6NbwO5ZM7LgaZ0aSuUMS0OnQx96rsXh1GjLnMspUi+P38Dr27BDWbV
 6w8avgj9uYbLyLyXz2j7UIyYtpnAsqCwp/B1M5m1Ja2adX8Nv7my2wNsVbSsnUNWqQIR
 7rFZATyEOsqQexntLWt0EGn5eqhWdVyO+7/x6gHA0IPH6nlexkCyY3h3VxhUhl9TqNS1
 Zg7w==
X-Gm-Message-State: AFqh2kpUIW6cn2G62w0chZhGBokZ3STxiIU6MLt+72fJNhyu/UglwiOo
 5SuYxmuGW3G8zvJKPPIpth09idXdKlA+Aq29
X-Google-Smtp-Source: AMrXdXv5hGHx04rOx61qaE99Y5ZDmEN6qF8GU0wz3Za2r+0zct+/mPAcrUbhtQvxgtTnA/v1k21LUA==
X-Received: by 2002:a17:902:eb8a:b0:192:9dc5:54b6 with SMTP id
 q10-20020a170902eb8a00b001929dc554b6mr5371327plg.48.1672358567831; 
 Thu, 29 Dec 2022 16:02:47 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903028e00b00192849e1d0asm7343953plr.116.2022.12.29.16.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:02:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 27/47] tcg: Introduce tcg_type_size
Date: Thu, 29 Dec 2022 16:02:01 -0800
Message-Id: <20221230000221.2764875-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
index c830b3756d..02b2103daf 100644
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


