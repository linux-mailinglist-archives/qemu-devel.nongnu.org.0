Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C65F63B8885
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:35:20 +0200 (CEST)
Received: from localhost ([::1]:40578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyf3P-0007v7-Rg
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0j-00055S-JV
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:33 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:38586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0g-0001xN-Ml
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:33 -0400
Received: by mail-pg1-x534.google.com with SMTP id h4so3185397pgp.5
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CYAA0gCcixaZvejCGIEmqi8brwY1zVT0feeRzB35ZxQ=;
 b=oti2FHeChbI1wdzzHQpYrI5qRwC97GMusq3vx1fF+wKn3/9cNBzNADp8l9JErDQ8O1
 7opXMsZRYEIV77sxm1NE/A0fm+G32LUzvC1UGZhwDV0QEHVQLkTHeyON3TCbx7zRJ75d
 lxOAp2SST30XuVGm3sqQnUwm4qRHnTy0uCg4JcmkahrgdzPGKarNq67W/KMp80/oQVn3
 T4I4ytDBS2csvNQYORLHLQfO2xnQzFS1JmKjGZ1Vz3rl0fDinYyVZEIUHz9FdfAm+fql
 l72IECWa4tVXRy134jMqphdejHuP6atAED3QklzpmZDxf2rjrQm/X/Auy0NbcNPsIc3p
 cK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CYAA0gCcixaZvejCGIEmqi8brwY1zVT0feeRzB35ZxQ=;
 b=drpEM36Xbqbd626B185L6KV+EQE30E82PWgCepaPIDD5CcpSa92kN1Y+vNyn2pOL9r
 i+9O3d+IX/T5gvs3UuTsm/tIOTPE5h6Jb92SHgFbpRB6W5O3OZBWa48vfXoFpPgQ+E1w
 PW2z2FkX46AM45baZ8hoZPb5yBGCUJK/ohm2X2SfIoDI8lUJiJDv6w1WVLOuVTyWkgmO
 dQf67ywXTSH8G9s+lf/ppEpRwj9gaOqvSegtB1IGE5T5Kcdj5GfKwP8jGKbsnWMhC+lG
 tOr/vTkFTWkV3eO8pn3mYnylOA/WCfisv6+QiP2O4Dcv9LJ0ke/KuBIXrE+8Wq81w2M/
 lGSA==
X-Gm-Message-State: AOAM530oqOQGBKea+fPbj5xfMS9GKMo+q2YsB/mZGsCQ+/JYSSve5Rna
 GSdmiUSzj+lqTm37vYp3+TK3c+qg3vbDig==
X-Google-Smtp-Source: ABdhPJwH7SVej9WpqRKD2QeiC86agGgjyEYZ1+hbAByDcU7yLxhDe98dQLiL7srg44isqgzj+8BSzg==
X-Received: by 2002:a63:230c:: with SMTP id j12mr3607238pgj.382.1625077948664; 
 Wed, 30 Jun 2021 11:32:28 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm23909517pff.88.2021.06.30.11.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:32:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/28] accel/tcg: Introduce translator_use_goto_tb
Date: Wed, 30 Jun 2021 11:31:59 -0700
Message-Id: <20210630183226.3290849-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630183226.3290849-1-richard.henderson@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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


