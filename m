Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0210A3368C4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 01:36:10 +0100 (CET)
Received: from localhost ([::1]:36538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK9JB-0004vm-2A
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 19:36:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95w-0004uw-Ht
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:28 -0500
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:37825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95l-0001Mp-JW
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:28 -0500
Received: by mail-ot1-x335.google.com with SMTP id 75so15057406otn.4
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 16:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1JDFX+MuUZit7885JaLDSIbe6sMdYH/iLicvWinCUzk=;
 b=oamRHYls84rysOZM5w4pfNikUItq+ZbfZ3VS6JaOwegoi9OG3+dMGW/jjHTrZsyaS4
 n7Bajs6cJmd6nXS5i/MjNmWu+o82W/y7xve2MLyGRKA5swf/Ufcg72fMs2uomHQJYKrF
 FSkw8ecxo2CYDFQemxqs1TkCQXQFjQDAmuX0kFekVG6hWoBSfpp2bMydVi6sl4xGvEnI
 ENYfNVjNukGIYOrhXpxbRoOMEishRNrXCEsKyR1/YskAxAQBxcYwro5n6CAdziTu/H6d
 inNX5+68PdbR0w3ZsyyxkuQylACqIXwDI0Jf9YYVfyxxt7zIH2/UNc5OMzMRBDK3Z4wi
 21KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1JDFX+MuUZit7885JaLDSIbe6sMdYH/iLicvWinCUzk=;
 b=oW6RH03X+XXqe0Reu9ewJsdO/3F7xm/Tw0Wq8ef8z8Hm/ceQUm1//W3IB+iigGkHF6
 ejiYlDxpoLjhXjMoy5XYIw3uh5sijyNNAVl51NBgyOrw9diSI4tdW9YGO5Ntx4Q0a/sp
 FTSpm6C22j3mL84wrlHuIAheiXriGEVl8enXZdT3WsgzAQ3uyugFWVhY/FdnSXyowBoF
 VbXlzBCIWkE/skgtfFMk6XgD0XBVkF1cmaLdmODmEGazbUMSPKSG3BOUmLxvpwa4vpTw
 wwtcnK5+2sGUf8R4BD5I1H2bctj6zWBqxUy72ptByi7TLCUj6z+e7MgHU5HxUkkGTSJH
 poQA==
X-Gm-Message-State: AOAM533vTzTdIo2Infc9BYqx+miNCoDqJHgiiTq6/5PxUy7ToppigSsa
 MbxmKtwejOq8vL7GD3F0znmXwLh+tKADHp06
X-Google-Smtp-Source: ABdhPJzSOiqD5RjqdeDpnboWi11uJMeKwnEYz2ZSKveHy9/dEYYnWKVVaetRsoxpFLLxJq0TxqIg0w==
X-Received: by 2002:a9d:2cf:: with SMTP id 73mr4731292otl.28.1615422134335;
 Wed, 10 Mar 2021 16:22:14 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a6sm300962otq.79.2021.03.10.16.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 16:22:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/26] tcg: Create tcg_init
Date: Wed, 10 Mar 2021 18:21:42 -0600
Message-Id: <20210311002156.253711-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311002156.253711-1-richard.henderson@linaro.org>
References: <20210311002156.253711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
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
Cc: r.bolshakov@yadro.com, j@getutm.app
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
index 4071edda16..050b4bff46 100644
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
index 10a571d41c..65a63bda8a 100644
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


