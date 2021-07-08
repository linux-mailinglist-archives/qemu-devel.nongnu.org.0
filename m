Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 716523C17BE
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:07:35 +0200 (CEST)
Received: from localhost ([::1]:54424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XUs-0008Ga-Fo
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X55-0001N1-Fi
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:40:55 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:35577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X53-00089Y-AD
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:40:55 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 h1-20020a17090a3d01b0290172d33bb8bcso6288060pjc.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CYAA0gCcixaZvejCGIEmqi8brwY1zVT0feeRzB35ZxQ=;
 b=YgezZudac54HhmcCI/Mvc1saFYr7b6VC6nHXJTZyLjB/JzLBTE+Axp/Lm7q9Z3MoYI
 Ja3C0K/jKBDK4TMJ4nGBHv8t4Ev9o8JcVjbtySXRQxjSkWbkEjLyyXhrvx2GredzedI7
 yeGPhypTxbDHxP1EbdNOuAVD4xsLdbGHyMrUls/jTUpSN8wjTJRHOl0jQYl/2n1ft7Dq
 1gGnld76VvmVrfWkl3LQ2APRwVh+Pym+wxxTQb8Kv2yT5ZXUqtcXSQDpajHqq6wc/LNr
 w3h+RAkplCWPsenGNuZpKsUKj54Oety/t10dD1L8exjUNkrxBJ1FMqSGwXdz/ok0m+P1
 y1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CYAA0gCcixaZvejCGIEmqi8brwY1zVT0feeRzB35ZxQ=;
 b=aD4NKxh88CTfr9rXF4BZstAYCakFS215meoHcZyeY+w8WpJ2YdVN7ppqrikqK/21mK
 ZMWoCH2r21UVQ8qUERuDBO6YCpt3lewzgRXgdV/mVoc3atVEMvdqXwQY5xwB2dA2f/jV
 7HJaqPdF51ZuT3GZV+OLY+IUl/7Ltsr26NhJEPZJr7CVbe2keuIc40rjjeGOnaHZjRlc
 FLmdW5gNFLi6XI7cO+O88De7NNmqTJIO19hBhgZLmk/M56HlHnvmmTWQ2b46sun+fTeE
 r0dnY6cxeUjjP1IpenWllH66lo47L3I2y8hsMh7q7gPjammayFLTdTC6ipcIPLc5OjM5
 KDuQ==
X-Gm-Message-State: AOAM533M79XRqnag35EKBGFGhUuCL6EQLuBnsdQ07HcGbCYCtGXPeSi7
 Ut6cTLt++p6PVLWwEfIeG7s5HHSjFV9KWg==
X-Google-Smtp-Source: ABdhPJzoQRCVFE9aKF1Mx08by7LPRVN9M5A0pZgGMxkc/dUAQQ/HpMldXgQW2Pw6XxD0Vm/FXdMEPQ==
X-Received: by 2002:a17:90a:bb83:: with SMTP id
 v3mr33120558pjr.102.1625762451520; 
 Thu, 08 Jul 2021 09:40:51 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j129sm3465678pfb.132.2021.07.08.09.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 09:40:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/28] accel/tcg: Introduce translator_use_goto_tb
Date: Thu,  8 Jul 2021 09:40:23 -0700
Message-Id: <20210708164050.711967-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708164050.711967-1-richard.henderson@linaro.org>
References: <20210708164050.711967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a generic version of the common use_goto_tb test.

Various targets avoid the page crossing test for CONFIG_USER_ONLY,
but that is wrong: mmap and mprotect can change page permissions.

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


