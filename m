Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E713370FBD
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 01:23:58 +0200 (CEST)
Received: from localhost ([::1]:43776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldLRN-0005F3-9t
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 19:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMZ-0008K9-4W
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:19:00 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:55915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLMV-0002ue-LI
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:18:58 -0400
Received: by mail-pj1-x102a.google.com with SMTP id gj14so2044804pjb.5
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GXOmKXszIGwBckjBN7CglCgbQXtrKK9pBKMuXQiqDTI=;
 b=n10v2TV3GGT1QuaQkkC+yCWivJ8tX4HMofBOTk7bmUwNDmXeZnaoCLNUxW86su884n
 LaHUyZCNhIy253y0LMrnXoiWnYWEwrPBubRFFbNnA0XoQcjahg8WAWsnJ5Fpx3mxytHd
 blpxKAuhRwsgU1hCg+paqbb2I62VDcF2VC5+fjB1WAHFX1ldixb02B/+W9efJuHnmnE6
 vOvLjfkPzGtf9vTthz4Jfo8zOR3FnWXxxjTCLWO2YKnan5d/htry/vAm4C30QXDm+mon
 Gk9UC31wfkDQC12WMNvLUwBuScqOYI7En2E61W3QqQa6Q7m+cH4uVNULbrQbBGJLqhrB
 LyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GXOmKXszIGwBckjBN7CglCgbQXtrKK9pBKMuXQiqDTI=;
 b=pUm42E1CPvpdx4VHkkBIjo+uRqXNpBcSA1zhmq1QGb9ouECxG80asIx/82qszKrd0o
 +937n3kH3ClQ2SoY4V1yFvG/PgEXfPz8JZ6cG8LpsKgjuPjz515aQGOSIknMncmdS9Q4
 Q9V/w+jCZcAaE2X9+SIlYnIo7DXFI+WZ7MEK+0stcZqvMv6AvUFVYuPPVHRuzsRaBhZL
 fx3o2QNapWZJ8mViQhEKwNh/+KOX76xPLRKVea+MNTc/Tuny3cTMEE4Fk8vAbnk6iXIb
 nMkgtVQuWHi51ZnIWx5NFP3lTrVUjdqj1P9+Rr8truJjR4LWMMiK1RWhaX6iwybFeOzU
 efWw==
X-Gm-Message-State: AOAM530Kz1+MO6txebuXYBMkoKergKqLAJqdMEGD8UJYBdTh6NxVk0nx
 Ws7zx8FKoBjewLAkcAoY+H8vRop7OdiA6A==
X-Google-Smtp-Source: ABdhPJxoncksfmyVnkAEujjW7ukVmq8spgkNA53xPlBedvmc4xYdgVGbLbcB1FbEBT2TQJrxA7lbpg==
X-Received: by 2002:a17:90a:4b0e:: with SMTP id
 g14mr15679052pjh.48.1619997534324; 
 Sun, 02 May 2021 16:18:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k17sm7146236pfa.68.2021.05.02.16.18.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:18:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/28] tcg: Create tcg_init
Date: Sun,  2 May 2021 16:18:27 -0700
Message-Id: <20210502231844.1977630-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502231844.1977630-1-richard.henderson@linaro.org>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

Perform both tcg_context_init and tcg_region_init.
Do not leave this split to the caller.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h         | 3 +--
 tcg/internal.h            | 1 +
 accel/tcg/translate-all.c | 3 +--
 tcg/tcg.c                 | 9 ++++++++-
 4 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 7a435bf807..3ad77ec34d 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -874,7 +874,6 @@ void *tcg_malloc_internal(TCGContext *s, int size);
 void tcg_pool_reset(TCGContext *s);
 TranslationBlock *tcg_tb_alloc(TCGContext *s);
 
-void tcg_region_init(size_t tb_size, int splitwx);
 void tb_destroy(TranslationBlock *tb);
 void tcg_region_reset_all(void);
 
@@ -907,7 +906,7 @@ static inline void *tcg_malloc(int size)
     }
 }
 
-void tcg_context_init(TCGContext *s);
+void tcg_init(size_t tb_size, int splitwx);
 void tcg_register_thread(void);
 void tcg_prologue_init(TCGContext *s);
 void tcg_func_start(TCGContext *s);
diff --git a/tcg/internal.h b/tcg/internal.h
index b1dda343c2..f13c564d9b 100644
--- a/tcg/internal.h
+++ b/tcg/internal.h
@@ -30,6 +30,7 @@
 extern TCGContext **tcg_ctxs;
 extern unsigned int n_tcg_ctxs;
 
+void tcg_region_init(size_t tb_size, int splitwx);
 bool tcg_region_alloc(TCGContext *s);
 void tcg_region_initial_alloc(TCGContext *s);
 void tcg_region_prologue_set(TCGContext *s);
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index e481f23ac2..bebb3366c0 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -920,10 +920,9 @@ static void tb_htable_init(void)
 void tcg_exec_init(unsigned long tb_size, int splitwx)
 {
     tcg_allowed = true;
-    tcg_context_init(&tcg_init_ctx);
     page_init();
     tb_htable_init();
-    tcg_region_init(tb_size, splitwx);
+    tcg_init(tb_size, splitwx);
 
 #if defined(CONFIG_SOFTMMU)
     /* There's no guest base to take into account, so go ahead and
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 26eeed05d9..92749a2f8b 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -579,8 +579,9 @@ static void process_op_defs(TCGContext *s);
 static TCGTemp *tcg_global_reg_new_internal(TCGContext *s, TCGType type,
                                             TCGReg reg, const char *name);
 
-void tcg_context_init(TCGContext *s)
+static void tcg_context_init(void)
 {
+    TCGContext *s = &tcg_init_ctx;
     int op, total_args, n, i;
     TCGOpDef *def;
     TCGArgConstraint *args_ct;
@@ -657,6 +658,12 @@ void tcg_context_init(TCGContext *s)
     cpu_env = temp_tcgv_ptr(ts);
 }
 
+void tcg_init(size_t tb_size, int splitwx)
+{
+    tcg_context_init();
+    tcg_region_init(tb_size, splitwx);
+}
+
 /*
  * Allocate TBs right before their corresponding translated code, making
  * sure that TBs and code are on different cache lines.
-- 
2.25.1


