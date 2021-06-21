Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F8B3AE152
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 03:36:35 +0200 (CEST)
Received: from localhost ([::1]:39122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv8rZ-0006Jx-Uw
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 21:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8pp-0003dw-W6
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:34:46 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:35421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8pm-00058U-VA
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:34:45 -0400
Received: by mail-pf1-x436.google.com with SMTP id t32so1055335pfg.2
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 18:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3dD79hCWh72uwMhZlBZFNfcYw08w7axPQZvzJYA+xi4=;
 b=pX9LHerKOlzU0GxHzfo3XshdwCqFttLfCYXxRHUcUHgxG9ititb4uFnfSoayPVi/RN
 XtY5EflFeOv9xmtzyGa3neeoRa38ILEHzaYVD5VUReVBWKjzWneTC5v5VuOEZRH3KwJi
 JQpmsfICjn5XjdedldDzhMYz0f4Sz3gV7gHtyYPXYDyEd6Ciww2vnwGXuDbUxTWSZhPO
 lkujm1GmCbeia96cD1kRgnGpuAbSFZPCEezoHsKPBJCp6qcDijSwkMCXE+Pc9CRYeacT
 g1TOjnpq9TSodZciwvkJ1mVoKy7YHmDBez0djqIxl+T8mb0bGhHdLhIr811X27LzkBgi
 14+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3dD79hCWh72uwMhZlBZFNfcYw08w7axPQZvzJYA+xi4=;
 b=s+c675jPt44RTzw0VY4b1JW0RGLcM1etOddcYEmpR4WctyUsaJ1P23TWeSTphOwz9e
 nz+iGTNKaA1+mLPiX9H5GqKSf0mYsamxNwo6k7TlSAsqypm9Aj7tMbyhZYWMApRfuDpD
 8MvfImT7vllCQG7HKfTdT1l6qTzSOMlWM7+CgCb9s8oW3XUW2a+fIm888Bas/nKdXQLa
 b3hH+wTfW+HxyygA6W/C+5x2CeUrtc5/UhxKMOvFczt/oBI+0Sk1DpJC4rRHS37T30ex
 97i3+zBy1HzIw7Ymz7uBzJdtsaAxxiW7bcfUlXvpF2L1QzZmxsq8OQRnfYgNw3dUCFzB
 87rg==
X-Gm-Message-State: AOAM532fhmSUkJMIQCoXHq/RPMCwx4MONB/VlWtRM5jfG1uTEzjRzQl8
 JVmMmVGQaOREzDtqCx7R18KKgTXqJlcEEA==
X-Google-Smtp-Source: ABdhPJycIOLbl5idwi2RUj35ORB7Cf86qOBQEU6stw1U3K/vfPj/g2NtRhVplB9vdaDYj4MwNM7xww==
X-Received: by 2002:a05:6a00:84d:b029:2fb:3d61:51dd with SMTP id
 q13-20020a056a00084db02902fb3d6151ddmr17157711pfk.11.1624239281573; 
 Sun, 20 Jun 2021 18:34:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s27sm1495628pfg.169.2021.06.20.18.34.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 18:34:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/26] accel/tcg: Introduce translator_use_goto_tb
Date: Sun, 20 Jun 2021 18:34:14 -0700
Message-Id: <20210621013439.1791385-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621013439.1791385-1-richard.henderson@linaro.org>
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

Add a generic version of the common use_goto_tb test.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/translator.h | 10 ++++++++++
 accel/tcg/translator.c    | 11 +++++++++++
 2 files changed, 21 insertions(+)

diff --git a/include/exec/translator.h b/include/exec/translator.h
index 24232ead41..dd9c06d40d 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -145,6 +145,16 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
 
 void translator_loop_temp_check(DisasContextBase *db);
 
+/**
+ * translator_use_goto_tb
+ * @db: Disassembly context
+ * @dest: target pc of the goto
+ *
+ * Return true if goto_tb is allowed between the current TB
+ * and the destination PC.
+ */
+bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest);
+
 /*
  * Translator Load Functions
  *
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 1d32732198..59804af37b 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -31,6 +31,17 @@ void translator_loop_temp_check(DisasContextBase *db)
     }
 }
 
+bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest)
+{
+    /* Suppress goto_tb in the case of single-steping.  */
+    if (db->singlestep_enabled || singlestep) {
+        return false;
+    }
+
+    /* Check for the dest on the same page as the start of the TB.  */
+    return ((db->pc_first ^ dest) & TARGET_PAGE_MASK) == 0;
+}
+
 void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
                      CPUState *cpu, TranslationBlock *tb, int max_insns)
 {
-- 
2.25.1


