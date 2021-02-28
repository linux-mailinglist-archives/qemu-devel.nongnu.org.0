Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A203632753A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:30:58 +0100 (CET)
Received: from localhost ([::1]:46228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVWb-0005fA-FZ
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:30:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPN-0005KD-0S
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:29 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:34756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPL-0007fD-AP
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:28 -0500
Received: by mail-pf1-x434.google.com with SMTP id m6so10282315pfk.1
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SbL2dW1QfQ+CyQTDJgcTi/qLjMFE5Hm5ssvxBaiakag=;
 b=vo7vwJnOUBy3AXHollETtSZd5+/BQ42mggGxVn8fmG5zj0kCbooLCIMF+qKcPZ1x3N
 U1IOa+/2ON7stQY+I6LOcwSsI6QBCwQCQRvx/th7JnB5/KRYy42nrHyZumKjULMktzxM
 UdrgI88gpkqe2Tzgvg7U8D6+5ytIUkksLNLM1ZNn3OFbdVO3hEiXe4c1etufq2KNQfBF
 NpPzIRvSEGT6QgH8uz0oGV8FXvSQw+urxzIT9ZD2wQY6YZRLqlHuEyomTe+r/0/oyufw
 TtFgs/wdGGANqYBiYBkzxXCpinrRw6rc790hl+rJEkfeHJ/TjvJCz/QaoGHwsyMGbiPa
 upLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SbL2dW1QfQ+CyQTDJgcTi/qLjMFE5Hm5ssvxBaiakag=;
 b=KSXRn3UUEi4oDK4ogDxZl21u4AvPmzHbm0IENJeakIMG3hnKkjdCUV/aM5Dfdj9Ilu
 XZVIatU+ze9FB7rSE63PuhHbN8PiIrG8blBJxy/Dy7ctpIU0S0KMSX1ghNG8PWSfsZwu
 biUvZdGZ6kFbwCm9IWGuRC+hU8rRk8WAqNTA9PW80+ZNtmdqf1idWTPBT4tXlmaMjqxG
 W0gauoYrKPJoPTgm30IGfptxPbNpi7QeOb9QE1PUPTMolzmkcT5xgRKRTHIpMnObGWZ6
 8KCx4eznM2BK8Q/x4eodOprRXTZqdgt0vRXlTE/l2YmSSvXFK7Ew0Om+tFoW6lrpT9+q
 PMdA==
X-Gm-Message-State: AOAM530zsqLaEbELxEinw/y9OOqsp8W2hCI55e9EA120gf7OoMSi42SI
 GlICtUrUgySzcUc+Kkse+9gX1J0oVU1M8A==
X-Google-Smtp-Source: ABdhPJyAmQaHnt9l79V+oBc3hrpBgeD+sfELKy5qaA801RN+ip4qrGVGQPT7207zwWYAKkUe+I9VYg==
X-Received: by 2002:a63:36c4:: with SMTP id
 d187mr10068396pga.168.1614554605926; 
 Sun, 28 Feb 2021 15:23:25 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/50] target/i386: Unify code paths for IRET
Date: Sun, 28 Feb 2021 15:22:34 -0800
Message-Id: <20210228232321.322053-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In vm86 mode, we use the same helper as real-mode, but with
an extra check for IOPL.  All non-exceptional paths set EFLAGS.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 5703b253a1..59c1212625 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -6571,22 +6571,18 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         goto do_lret;
     case 0xcf: /* iret */
         gen_svm_check_intercept(s, pc_start, SVM_EXIT_IRET);
-        if (!s->pe) {
-            /* real mode */
-            gen_helper_iret_real(cpu_env, tcg_const_i32(dflag - 1));
-            set_cc_op(s, CC_OP_EFLAGS);
-        } else if (s->vm86) {
-            if (s->iopl != 3) {
+        if (!s->pe || s->vm86) {
+            /* real mode or vm86 mode */
+            if (s->vm86 && s->iopl != 3) {
                 gen_exception_gpf(s);
-            } else {
-                gen_helper_iret_real(cpu_env, tcg_const_i32(dflag - 1));
-                set_cc_op(s, CC_OP_EFLAGS);
+                break;
             }
+            gen_helper_iret_real(cpu_env, tcg_const_i32(dflag - 1));
         } else {
             gen_helper_iret_protected(cpu_env, tcg_const_i32(dflag - 1),
                                       tcg_const_i32(s->pc - s->cs_base));
-            set_cc_op(s, CC_OP_EFLAGS);
         }
+        set_cc_op(s, CC_OP_EFLAGS);
         gen_eob(s);
         break;
     case 0xe8: /* call im */
-- 
2.25.1


