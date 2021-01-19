Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B55A2FBB3A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:33:58 +0100 (CET)
Received: from localhost ([::1]:55988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1t13-00010l-1q
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:33:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfK-0007pg-OL
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:30 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:37459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfD-0001HP-FR
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:30 -0500
Received: by mail-wm1-x334.google.com with SMTP id c128so70218wme.2
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GNG5+xacq3ckuhsDuukyHs2V5wuN/oDLTpVlzadHh+s=;
 b=uF5cucgwO3c/JIZ6MsUxSIdsD5wyjvnjXTBtJwU1iVd59FqzQNiPDpbyY3WCf1M137
 XSCZPW8vmURTsMxyV40puUTJwx/ZVC1Y5v/XLwNJrYnIGWFWXba54uLlhMpb9VAU/MPa
 p1J2y8LYCqT7LYeLlucvNKrJvJnqQse6FgY3+M/MNefij0+d3CZcpFiY7Be7pBLe7Lrm
 0vREiRpyD+rBg3nP61+fg/6lROqj/ieqqt58zsbgg8NWX99CoV11FglOM3nrMuLEXo4Y
 XGtOSVyv314wb2yKzCDsyZgithFjbq8hdamBisUhh7Iz1l3JzJ/XOeZdq0IQNPe34l9I
 nTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GNG5+xacq3ckuhsDuukyHs2V5wuN/oDLTpVlzadHh+s=;
 b=W9wbUDksQj5mv6KgT/AN5572HWq9+U5fCGV/uSDLSoTLYRU5e5oHk+vjEW+7GmiDeN
 Fncrzoi1w1JAsTqVFd7aL3K69DDUwxuD+SB+FeBOoXr6HSliGC1hd+mjLQZcmf3e7vw0
 CwXuRzDYjnkaBXnzN62eye76jDZ1M+JTZLiK1EUNnW555t98ftF1PIGd1sAeoBrv72Jq
 yoOA9amMxz23usOz60vTdwbakB8aAC2T84mEET+Cr4zdONjXcIWZU+87JHWba1EaFMs5
 pUbKPaw4wDlIoiMNL6h4QtHvD2WfifzLrSMXylgPo7vW3g0T3VTgsXGBpCQwz2YLh85B
 TMdw==
X-Gm-Message-State: AOAM5306pPI6OCPtM2L3VQ8juxj3Zrd2EbNMGw5ws3F1VqPBFEuC0L61
 VRkcQg4ugLd2JLF10gTlAyWKqeOKcM73ZQ==
X-Google-Smtp-Source: ABdhPJxjPATNY5bkyXx68gNrRNmbjduTUy8s4oSOH0zKPHqr5L9QwNaMEc38RFjZ1z4PRtcZ09c50g==
X-Received: by 2002:a1c:df88:: with SMTP id w130mr96788wmg.164.1611069082167; 
 Tue, 19 Jan 2021 07:11:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a184sm4843699wme.35.2021.01.19.07.11.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 07:11:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/33] target/arm: revector to run-time pick target EL
Date: Tue, 19 Jan 2021 15:10:50 +0000
Message-Id: <20210119151104.16264-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119151104.16264-1-peter.maydell@linaro.org>
References: <20210119151104.16264-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

On ARMv8-A, accesses by 32-bit secure EL1 to monitor registers trap to
the upper (64-bit) EL. With Secure EL2 support, we can no longer assume
that that is always EL3, so make room for the value to be computed at
run-time.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210112104511.36576-16-remi.denis.courmont@huawei.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 528b93dffa2..614a6853ca5 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1094,6 +1094,22 @@ static void unallocated_encoding(DisasContext *s)
                        default_exception_el(s));
 }
 
+static void gen_exception_el(DisasContext *s, int excp, uint32_t syn,
+                             TCGv_i32 tcg_el)
+{
+    TCGv_i32 tcg_excp;
+    TCGv_i32 tcg_syn;
+
+    gen_set_condexec(s);
+    gen_set_pc_im(s, s->pc_curr);
+    tcg_excp = tcg_const_i32(excp);
+    tcg_syn = tcg_const_i32(syn);
+    gen_helper_exception_with_syndrome(cpu_env, tcg_excp, tcg_syn, tcg_el);
+    tcg_temp_free_i32(tcg_syn);
+    tcg_temp_free_i32(tcg_excp);
+    s->base.is_jmp = DISAS_NORETURN;
+}
+
 /* Force a TB lookup after an instruction that changes the CPU state.  */
 static inline void gen_lookup_tb(DisasContext *s)
 {
@@ -2818,8 +2834,11 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
             /* If we're in Secure EL1 (which implies that EL3 is AArch64)
              * then accesses to Mon registers trap to EL3
              */
-            exc_target = 3;
-            goto undef;
+            TCGv_i32 tcg_el = tcg_const_i32(3);
+
+            gen_exception_el(s, EXCP_UDEF, syn_uncategorized(), tcg_el);
+            tcg_temp_free_i32(tcg_el);
+            return false;
         }
         break;
     case ARM_CPU_MODE_HYP:
-- 
2.20.1


