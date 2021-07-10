Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 268B83C3528
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:33:31 +0200 (CEST)
Received: from localhost ([::1]:40890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2Eyw-0008AG-3w
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:33:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExM-000521-Ma
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:52 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:46913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExL-0002EM-2l
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:52 -0400
Received: by mail-pl1-x635.google.com with SMTP id c15so6622036pls.13
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CYAA0gCcixaZvejCGIEmqi8brwY1zVT0feeRzB35ZxQ=;
 b=tED+WZ27q/v2AbfSeaZysfo10uxy09ZcSkxdPCt+9nT1EhDdPQogqyyeZPoYbwt7r6
 I/rcNbiVgN2oa7KsscUcnKXdI9twVnadwuN3GUZrs8WfGWoAIWXFc/DUshX78vK2VIgd
 9Sit04/g4MZkb3lZQDsgPW1YqdXBfC7gRn5frukkzOGNdrGPO6oCLNIJhOF1r+CldvzU
 oDkXreu4fwKlKX6sPdJ9QejAoQP1sSzd6FDzM8bhUTg8pYawpGtPuJv5HccTULcTbvg5
 mXgLf1l0R2aQHTtjqxCuc6INAEfmFeJZsvBP6LEk9YEO9nwiTsC5RJS/GD1l9xNCBl0i
 rJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CYAA0gCcixaZvejCGIEmqi8brwY1zVT0feeRzB35ZxQ=;
 b=lEvGsFVbvRgKJcr6BrmYx+2uJhtjWeGrmK5mCDr7pLYXV7BIRFhonCcM/knRhl/FbP
 BhBcAOh1KAZB5LdNRVfAjx3emtJaJvwiC5kFWo5JKrfHsATdnkmGx9GHfcy9yb9B1Q6U
 +3oNn4oi5B3TK87PQcVoPUSWjacdVGPMpSyOFgk8yRPNQfWPK0LpGDkoDffQB3hWnCQh
 oNID8efMDgHhmsk8D+PtIEb4uycZpc0nZbnAChvblhDIjCbXZ7fDd/K82hTTxweGJvI3
 SO6ITWw1E3SFATlg+LBt17ZnwflMwABVnt5mZwTNzSy5ElHhojKqZQoEOgTa5nXX4vn6
 xyEg==
X-Gm-Message-State: AOAM533omZa7M21pqQfEM0mmD25Q39sufOz6bRFa3NLbvr5+TGm+3Jfz
 rRWExHqC+6bbFFR0JDcpN66AYUd90xibsw==
X-Google-Smtp-Source: ABdhPJzVaBs3OI6rhKnVTBKCpl1c/i0CSj1luOg53YCJUVEOA+/2aTeoPZKsqdJ6M0lpLRASG6syuA==
X-Received: by 2002:a17:903:248e:b029:101:fa49:3f96 with SMTP id
 p14-20020a170903248eb0290101fa493f96mr35667689plw.16.1625931109686; 
 Sat, 10 Jul 2021 08:31:49 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:31:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/41] accel/tcg: Introduce translator_use_goto_tb
Date: Sat, 10 Jul 2021 08:31:08 -0700
Message-Id: <20210710153143.1320521-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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


