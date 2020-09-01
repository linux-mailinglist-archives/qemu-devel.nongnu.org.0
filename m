Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52B1259314
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 17:21:41 +0200 (CEST)
Received: from localhost ([::1]:56064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD86O-0005As-QB
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 11:21:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kD83j-0008H2-Gy
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 11:18:55 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:56286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kD83h-0006DT-Ou
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 11:18:55 -0400
Received: by mail-wm1-x32d.google.com with SMTP id a65so1537622wme.5
 for <qemu-devel@nongnu.org>; Tue, 01 Sep 2020 08:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=znDMfNw/x+bDEAmrLcSJSrfAUXdWqj8CB9fQetbEyRQ=;
 b=nmgEjulrwo9cv8E8ovavPp9sw/kN27Xb1Q2QlKxBmdIAxN8meruOOMga3C3XLhnaxp
 Ss/FUp0ZamJmY3uLUjy+ksMmVKbuKlk6yE33Tr56xeDET2zPLBhUo31YaQAIhiR7msRj
 NkO3BbeI4eFtSAnq9Z7gsMt5iIfbppf0oOeCKGd7J38J9GF/X2loSbAenfWHlfwImFy6
 4dSS5rskysygAFnswNj/eYQ25Yx45Sszx52mZXvE4F+U8BimLnfvptjy8hqchwHbtTWH
 c7wL0EmEPNQPa/kX7aar4rOrXCchFlQiwJP7ZFZ6lgdX/UK05+vZpMB5br99ch50hX/S
 J3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=znDMfNw/x+bDEAmrLcSJSrfAUXdWqj8CB9fQetbEyRQ=;
 b=F4uHnXQzC2yQit2r0V5ANbeJI/PMAVwR8I4zB/A8dODZpjlM8n5zciLM3+teigLBtU
 RkwQXrGwoerbpLHXrcS/fzPMmQJe1U4b1JQQgpa/0qnGmsoCN54gG5zf5EKtMaX9tnHB
 sGo/1s7DT+iGPMqoNpoi0BZSFAeTAqK5SJb42hROTmb76jfkcsLRWX/8mW1Y6FB8naOK
 fdNiGv76HLUl68QapHY+oahUXIzbH80Mn+xg/lAl02tiaNvaGIt5l/pbtxjpmbPh6OoW
 iQZBrdkBdykq4PX51r6M9rcqFrk6sOddc8B93rv8nxWbHQ+Wu+KgDUk0FZSB9dmt5qgq
 umgw==
X-Gm-Message-State: AOAM530yriM0e9HqS1LdH1lRGSdc92wiV6vZ3yW0/LT5+J3SecGHBfZT
 +UIjMroXxxphD1kJl2Bx6YbcvYWyRgSPvK3A
X-Google-Smtp-Source: ABdhPJwO04cjPWlaAIgHqkZgXXd+trAkF5BgB6dmwBWdK5whUqB/A11XFdnoBqd3Ve9bvCIHDQCQpQ==
X-Received: by 2002:a7b:c84a:: with SMTP id c10mr2227363wml.139.1598973532092; 
 Tue, 01 Sep 2020 08:18:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id z9sm2242317wma.4.2020.09.01.08.18.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 08:18:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/47] target/arm: Implement new VFP fp16 insn VMOVX
Date: Tue,  1 Sep 2020 16:17:56 +0100
Message-Id: <20200901151823.29785-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200901151823.29785-1-peter.maydell@linaro.org>
References: <20200901151823.29785-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

The fp16 extension includes a new instruction VMOVX, which copies the
upper 16 bits of a 32-bit source VFP register into the lower 16
bits of the destination and zeroes the high half of the destination.
Implement it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20200828183354.27913-21-peter.maydell@linaro.org
---
 target/arm/vfp-uncond.decode   |  3 +++
 target/arm/translate-vfp.c.inc | 25 +++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/target/arm/vfp-uncond.decode b/target/arm/vfp-uncond.decode
index 39dc8f6373a..8891ab3d549 100644
--- a/target/arm/vfp-uncond.decode
+++ b/target/arm/vfp-uncond.decode
@@ -75,5 +75,8 @@ VCVT        1111 1110 1.11 11 rm:2 .... 1010 op:1 1.0 .... \
 VCVT        1111 1110 1.11 11 rm:2 .... 1011 op:1 1.0 .... \
             vm=%vm_dp vd=%vd_sp sz=3
 
+VMOVX       1111 1110 1.11 0000 .... 1010 01 . 0 .... \
+            vd=%vd_sp vm=%vm_sp
+
 VINS        1111 1110 1.11 0000 .... 1010 11 . 0 .... \
             vd=%vd_sp vm=%vm_sp
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index bda3dd25136..4b26156eccc 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -3482,3 +3482,28 @@ static bool trans_VINS(DisasContext *s, arg_VINS *a)
     tcg_temp_free_i32(rd);
     return true;
 }
+
+static bool trans_VMOVX(DisasContext *s, arg_VINS *a)
+{
+    TCGv_i32 rm;
+
+    if (!dc_isar_feature(aa32_fp16_arith, s)) {
+        return false;
+    }
+
+    if (s->vec_len != 0 || s->vec_stride != 0) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    /* Set Vd to high half of Vm */
+    rm = tcg_temp_new_i32();
+    neon_load_reg32(rm, a->vm);
+    tcg_gen_shri_i32(rm, rm, 16);
+    neon_store_reg32(rm, a->vd);
+    tcg_temp_free_i32(rm);
+    return true;
+}
-- 
2.20.1


