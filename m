Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC977479C77
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 20:57:46 +0100 (CET)
Received: from localhost ([::1]:49392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myfpy-0000M3-3w
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 14:57:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbo-000144-04
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:43:08 -0500
Received: from [2607:f8b0:4864:20::433] (port=35551
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbj-0003UP-2A
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:43:07 -0500
Received: by mail-pf1-x433.google.com with SMTP id v11so1949976pfu.2
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 11:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=XHyeOii0ZhnExA6vwEVQHkpV1I3AvOoVnhEEyh3pzMc=;
 b=gxIqnur4TdMe/uQ/DG9SIUW/C6R/AEL7wRrDN4A4w/Bam1AG+dBzj6o3J3UJQ1ag+o
 65SySWE5NwjufColxCtZxCaNdFlwckg3WO9uJdYbmGqh1oMESoxPJH1i6wBSUZ3agV3y
 bdpfgeqE5hSdjFc8aHPbP7z2bcVkXK+lvcnzhroHMx4SjV2kAbI3Ryu36+TMj+BooCSp
 45vcTl2LPum33LkBKq9oWYYf80uhec0lMJktJmEcQPUVkHptK35r5Vn3BknIzhzvjVNt
 pmKKKsbZ4yWMe+taGTOlmzeCT5FRcOco2t0nvc7l9/I/qf5UgLY8wjBCe/FG1O3xj9Pl
 jgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XHyeOii0ZhnExA6vwEVQHkpV1I3AvOoVnhEEyh3pzMc=;
 b=YSOykuW+4d3xEMtDIIvObdqbqfeAuUr4qqbE3bs/fh0cwGaCY7YCFMglNHgztYX6Lt
 1nRWyb2/h0PruFm7B1CxjXo/mMJvdsCWJ2H9la3iaOMJ/9G1IWSsEPpHFV/FTj0jYcli
 DWOjDub1EvFZ9LYBQLuyArUx74PCHSqP+WNBC8aKWpD4tTBCdXXAwohOC7pJrqXEHDuJ
 X9GKnBlrB0bWz9SY2GVwC/eBeNALXchARNgnSZ5S1QNtSNmUiX4pN1bSBEwtJzuaKFYO
 +vNFKqiWl+mfFJqfWphjJKDnTvBCpux6uqcjfvBhtB8jnUq2IHSHv0pGcGREmfE5CpBJ
 b+Iw==
X-Gm-Message-State: AOAM533qMlrlkT94WmkVd+Y/qhAI81TFL6m85E9767RBpyPoTTmshHpz
 Jzwurv7cLAWcfV9jhiS3qIvp7Sk5l2R+SA==
X-Google-Smtp-Source: ABdhPJy22M/dlKioHMZiqPOKzJTDmZU60XIFn/skkb23fYb31sgqDzsTq0cewthpfT1hzsm1QREsWA==
X-Received: by 2002:a63:81c3:: with SMTP id t186mr8194696pgd.150.1639856581777; 
 Sat, 18 Dec 2021 11:43:01 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id g19sm10645919pfc.145.2021.12.18.11.43.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 11:43:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/20] tcg/i386: Expand scalar rotate with avx512 insns
Date: Sat, 18 Dec 2021 11:42:46 -0800
Message-Id: <20211218194250.247633-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211218194250.247633-1-richard.henderson@linaro.org>
References: <20211218194250.247633-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Expand 32-bit and 64-bit scalar rotate with VPRO[LR]V;
expand 16-bit scalar rotate with VPSHLDV.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 49 +++++++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 99ec31977a..447aab7438 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -3508,26 +3508,6 @@ static void expand_vec_rotli(TCGType type, unsigned vece,
     tcg_temp_free_vec(t);
 }
 
-static void expand_vec_rotls(TCGType type, unsigned vece,
-                             TCGv_vec v0, TCGv_vec v1, TCGv_i32 lsh)
-{
-    TCGv_i32 rsh;
-    TCGv_vec t;
-
-    tcg_debug_assert(vece != MO_8);
-
-    t = tcg_temp_new_vec(type);
-    rsh = tcg_temp_new_i32();
-
-    tcg_gen_neg_i32(rsh, lsh);
-    tcg_gen_andi_i32(rsh, rsh, (8 << vece) - 1);
-    tcg_gen_shls_vec(vece, t, v1, lsh);
-    tcg_gen_shrs_vec(vece, v0, v1, rsh);
-    tcg_gen_or_vec(vece, v0, v0, t);
-    tcg_temp_free_vec(t);
-    tcg_temp_free_i32(rsh);
-}
-
 static void expand_vec_rotv(TCGType type, unsigned vece, TCGv_vec v0,
                             TCGv_vec v1, TCGv_vec sh, bool right)
 {
@@ -3554,6 +3534,35 @@ static void expand_vec_rotv(TCGType type, unsigned vece, TCGv_vec v0,
     tcg_temp_free_vec(t);
 }
 
+static void expand_vec_rotls(TCGType type, unsigned vece,
+                             TCGv_vec v0, TCGv_vec v1, TCGv_i32 lsh)
+{
+    TCGv_vec t = tcg_temp_new_vec(type);
+
+    tcg_debug_assert(vece != MO_8);
+
+    if (vece >= MO_32 ? have_avx512vl : have_avx512vbmi2) {
+        tcg_gen_dup_i32_vec(vece, t, lsh);
+        if (vece >= MO_32) {
+            tcg_gen_rotlv_vec(vece, v0, v1, t);
+        } else {
+            expand_vec_rotv(type, vece, v0, v1, t, false);
+        }
+    } else {
+        TCGv_i32 rsh = tcg_temp_new_i32();
+
+        tcg_gen_neg_i32(rsh, lsh);
+        tcg_gen_andi_i32(rsh, rsh, (8 << vece) - 1);
+        tcg_gen_shls_vec(vece, t, v1, lsh);
+        tcg_gen_shrs_vec(vece, v0, v1, rsh);
+        tcg_gen_or_vec(vece, v0, v0, t);
+
+        tcg_temp_free_i32(rsh);
+    }
+
+    tcg_temp_free_vec(t);
+}
+
 static void expand_vec_mul(TCGType type, unsigned vece,
                            TCGv_vec v0, TCGv_vec v1, TCGv_vec v2)
 {
-- 
2.25.1


