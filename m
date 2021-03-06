Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB6232FD93
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 22:42:15 +0100 (CET)
Received: from localhost ([::1]:39608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIegg-00073G-GL
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 16:42:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIeb9-0006xV-2n
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:32 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:34534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIeb5-0002xX-8w
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:30 -0500
Received: by mail-pl1-x636.google.com with SMTP id ba1so3124443plb.1
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 13:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A6vR6ziB3b9O465GIDkN5AIXP0cK+f5XI51tj6udrHk=;
 b=sHAkdhud8ogMLvIX1im25zJO5G/aoPZrsqQxW0zna4sEFq/5hdBf3zxfEmsEZSvC1W
 gx2jiCH10LP9C5B1ctI1XFwKLBIVZ5mOAqC23k78bYZYEx+jYoKFoyV0Y6GyQJkAnfaU
 ZgwgQRsJsQnFG9KojvmowU8HqsndDCqsGeFu4qtmbNKqb05Z9m6BNRdhLZ/BLSV3fkm2
 PB7GL3N3yQ4x75vD9Hgkp+5RqMgsqIe3NQ8ic3hAGAtywS6BHuT5i/MvBB6fisL3Mfk5
 elaMXuFevVGhJt0SVW52AZIlvyh3cq3TWigtGqGWJK2y23BtY7VUzJtjJ9KI+528F2+5
 +LLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A6vR6ziB3b9O465GIDkN5AIXP0cK+f5XI51tj6udrHk=;
 b=WX+GARZ2mAk2/CO6u5Ff8mDkVX1tJhCQ+/7uQ9Jp0fwGpg3D6/gTZTMFrPe4qxtfe5
 Obr83VGysL5FpvPzsq0cuKkWB240XbnqDfhs3FN98BgFCuHxCsb4sb6npYlXbbA5Uy03
 7eKrubsTXgKz4PcTGhqHNsslN8xi15RVRUwAewSlb71UsR14iA2k2J3kIxa7533ZKIf9
 yhljn1CoW3JoQU5B5BcC9mLLVHCUvJjE8JzUAqh48X+G3iDhAuCrvtHRKZUWaCUZLNjh
 0B88ZYsBTrMh+37H2BFeqCN+pLy1bs9Gv37sGbUZxiW/Hdqf10/5Bycj8ckiqWib4GJi
 +kcw==
X-Gm-Message-State: AOAM532RlFqfQxXjjU7FhIKSHoHWAnOUuH10BBGKFyJAFJyQh0WI/6Gn
 XMjHObj63CRvVmJcZIK1F4XKFkMZ7eue+g==
X-Google-Smtp-Source: ABdhPJx3u4cNyzoHtHI202JbqIDZ12l/kRyRaXs0okd9MTlLTLNDsKGkRVN2WY5VFvV+7pWhQYzI9A==
X-Received: by 2002:a17:902:f68a:b029:e5:b17f:9154 with SMTP id
 l10-20020a170902f68ab02900e5b17f9154mr14048084plg.28.1615066586089; 
 Sat, 06 Mar 2021 13:36:26 -0800 (PST)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id r30sm6365616pgu.86.2021.03.06.13.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 13:36:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/27] tcg/tci: Merge identical cases in generation
 (conditional opcodes)
Date: Sat,  6 Mar 2021 13:35:56 -0800
Message-Id: <20210306213613.85168-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210306213613.85168-1-richard.henderson@linaro.org>
References: <20210306213613.85168-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use CASE_32_64 and CASE_64 to reduce ifdefs and merge
cases that are identical between 32-bit and 64-bit hosts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210217202036.1724901-5-richard.henderson@linaro.org>
[PMD: Split patch as 4/5]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210218232840.1760806-5-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 4a86a3bb46..f9893b9539 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -417,15 +417,18 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         }
         set_jmp_reset_offset(s, args[0]);
         break;
+
     case INDEX_op_br:
         tci_out_label(s, arg_label(args[0]));
         break;
-    case INDEX_op_setcond_i32:
+
+    CASE_32_64(setcond)
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
         tcg_out_r(s, args[2]);
         tcg_out8(s, args[3]);   /* condition */
         break;
+
 #if TCG_TARGET_REG_BITS == 32
     case INDEX_op_setcond2_i32:
         /* setcond2_i32 cond, t0, t1_low, t1_high, t2_low, t2_high */
@@ -436,13 +439,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         tcg_out_r(s, args[4]);
         tcg_out8(s, args[5]);   /* condition */
         break;
-#elif TCG_TARGET_REG_BITS == 64
-    case INDEX_op_setcond_i64:
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        tcg_out8(s, args[3]);   /* condition */
-        break;
 #endif
     case INDEX_op_ld8u_i32:
     case INDEX_op_ld8s_i32:
@@ -505,14 +501,12 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         tcg_out8(s, args[4]);
         break;
 
-#if TCG_TARGET_REG_BITS == 64
-    case INDEX_op_brcond_i64:
+    CASE_32_64(brcond)
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
         tcg_out8(s, args[2]);           /* condition */
         tci_out_label(s, arg_label(args[3]));
         break;
-#endif /* TCG_TARGET_REG_BITS == 64 */
 
     CASE_32_64(neg)      /* Optional (TCG_TARGET_HAS_neg_*). */
     CASE_32_64(not)      /* Optional (TCG_TARGET_HAS_not_*). */
@@ -556,12 +550,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         tcg_out_r(s, args[3]);
         break;
 #endif
-    case INDEX_op_brcond_i32:
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out8(s, args[2]);           /* condition */
-        tci_out_label(s, arg_label(args[3]));
-        break;
+
     case INDEX_op_qemu_ld_i32:
         tcg_out_r(s, *args++);
         tcg_out_r(s, *args++);
-- 
2.25.1


