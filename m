Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 278703A4B5F
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:47:07 +0200 (CEST)
Received: from localhost ([::1]:60948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrqri-0002db-4Q
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmh-0002VK-Al
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:41:55 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:35456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmf-0002dY-HI
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:41:55 -0400
Received: by mail-pg1-x52f.google.com with SMTP id o9so3687772pgd.2
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V0czrnxS9aM+DQ7xCluYyJs7kI06p24rRdcOwsnauus=;
 b=hbJJWqerp2RAPX2vQZwmCmmdjkQpyUle3JTbjNxEzep6VQ2bWu0r13atInerV0cVev
 o9fn/AxqLX28godeD6qVc3nQvvR45r3Ur+WSaL1YPhOb9htNqs7QSy3Lxx3ApN97/OHb
 /S8UJfyWc2YDDDmk5UI1JeYE7LxCf/2mqRxWXBGpaNOUh1qQJHM7f+vRLEh2K9N8GRmz
 dtWaH6yRiLjaTuKk5NjFMjZy2KAYLJSIedOtcZ4XSp8xOKVpAm5iMdMvSqJ0GV4DbhXS
 89PYtBSMA7xWht6CECDyDRpb8X91OlmjPyWhDteljqlxxWwp/DjiU0GX+DYZU1J47I2P
 lDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V0czrnxS9aM+DQ7xCluYyJs7kI06p24rRdcOwsnauus=;
 b=nXBNiEqMUAsI57yC+m3I7Nt8BjngOvyx45KZ0OWbBzbCvJ3sx9SUBYuuGbv2z9bedB
 EdDv46jA/jy0kuy80H1srQf2G+uW7KhZf5rcKQgCdFvnl/+p/ymofwivCAcom9zvUnxc
 pCpvACtll8QwsfxYjg/tTJ5xU6Gu9qD+YwAXiXjED/qkRYpdqZd0j5tahuELCzAds/pE
 SGHZUN+1xkLuAdgeyZFgY60pb+NO2QlD5kQCeg2wabVL9tjWcQUmNsFS/B1o8ufuY/5W
 NHwuOg5T0mUoqFp/MriPJXqjGQwrKIGNSqhKkezWRs+PJQ6saTMNaHUcGIY/m3SuL0nF
 nyPg==
X-Gm-Message-State: AOAM533wfh4o6AZI1CfiKvuSDv5snrsY4R9zx9i7N99dGbVHLDcEBFhM
 u6Tu5VqI7W/k0KJJgDCtzbGtZB50Xri+mg==
X-Google-Smtp-Source: ABdhPJxGMcnKK5WqPOLkH3Ne6IjqaNmvOO98yFmDAdaLz1sXh10fFV0ua31rgO0JLt1cY1qtXmsG4A==
X-Received: by 2002:a05:6a00:1a48:b029:2f4:4632:ff14 with SMTP id
 h8-20020a056a001a48b02902f44632ff14mr10524560pfv.44.1623454912289; 
 Fri, 11 Jun 2021 16:41:52 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id q23sm6139829pgm.31.2021.06.11.16.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:41:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/34] tcg: Create tcg_init
Date: Fri, 11 Jun 2021 16:41:21 -0700
Message-Id: <20210611234144.653682-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611234144.653682-1-richard.henderson@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Perform both tcg_context_init and tcg_region_init.
Do not leave this split to the caller.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h         | 3 +--
 tcg/tcg-internal.h        | 1 +
 accel/tcg/translate-all.c | 3 +--
 tcg/tcg.c                 | 9 ++++++++-
 4 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 834785fc23..b3304ce095 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -873,7 +873,6 @@ void *tcg_malloc_internal(TCGContext *s, int size);
 void tcg_pool_reset(TCGContext *s);
 TranslationBlock *tcg_tb_alloc(TCGContext *s);
 
-void tcg_region_init(size_t tb_size, int splitwx);
 void tb_destroy(TranslationBlock *tb);
 void tcg_region_reset_all(void);
 
@@ -906,7 +905,7 @@ static inline void *tcg_malloc(int size)
     }
 }
 
-void tcg_context_init(TCGContext *s);
+void tcg_init(size_t tb_size, int splitwx);
 void tcg_register_thread(void);
 void tcg_prologue_init(TCGContext *s);
 void tcg_func_start(TCGContext *s);
diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index b1dda343c2..f13c564d9b 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -30,6 +30,7 @@
 extern TCGContext **tcg_ctxs;
 extern unsigned int n_tcg_ctxs;
 
+void tcg_region_init(size_t tb_size, int splitwx);
 bool tcg_region_alloc(TCGContext *s);
 void tcg_region_initial_alloc(TCGContext *s);
 void tcg_region_prologue_set(TCGContext *s);
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index ad7a25d9f0..4f563b8724 100644
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
index 8c43c0f316..2625d9e502 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -576,8 +576,9 @@ static void process_op_defs(TCGContext *s);
 static TCGTemp *tcg_global_reg_new_internal(TCGContext *s, TCGType type,
                                             TCGReg reg, const char *name);
 
-void tcg_context_init(TCGContext *s)
+static void tcg_context_init(void)
 {
+    TCGContext *s = &tcg_init_ctx;
     int op, total_args, n, i;
     TCGOpDef *def;
     TCGArgConstraint *args_ct;
@@ -654,6 +655,12 @@ void tcg_context_init(TCGContext *s)
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


