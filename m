Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E7D370FF9
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 02:02:10 +0200 (CEST)
Received: from localhost ([::1]:37038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldM2L-0004Nl-Qh
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 20:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLxy-0007bK-45
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:38 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:44763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLxv-0000Yn-8B
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:37 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 m6-20020a17090a8586b02901507e1acf0fso2329856pjn.3
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=VkGUbQQWrMvuFaugY3Xh4wNxOB8O4ztL54YvO2A4Oq4=;
 b=uCJQsj6Scy2VplYq2ZRELWJ7ae7oQIIP0eBy8RokpBcGsUIR+/EV6tKHqnVQhTsCvd
 Xwbnoqyj9BrOzSh0TwJnMQCFiknic2GH1hYzf9aanFUIckPILMya40mPT39B8NrrRUb9
 8Xa2/zyrgZNOG3UEFvo1QlwMfV4yqTeZmT2FiZNZwBVfxD4+uA/WSrfl2WF0U8r/ZDOU
 e0Y4Fxszroxkk8Q1WnqiUF24CF0+Qin3WV05emAPkHhlsvOZBWcN+GWc5FrzrGmOnffB
 eiYWTcBzRGzuUT3YAJ3qTA/pLqWzKosR4APL7TfJhGDqnt985TjxPDg7tBB4KnUC5Vtl
 aGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VkGUbQQWrMvuFaugY3Xh4wNxOB8O4ztL54YvO2A4Oq4=;
 b=sfaZz7Tu/8SI/QB/cVrA+O5BFj06LXapMDEvHrv48sbz55oA16WS3Yq/Qs0nAlxWdF
 8sa2sb2yynD9m2yVsdwoEXqpyaI6qSBl1zqvfeqC6yg6hU/hENdeEi31BKkIjEa//jGx
 uklWNBNArX0LLrWI/R7V2gqwoSpyh9pHjbFuZj9f6gJ+1s5J1br1QYsjSQ0Qm4Xt1kMU
 GWoRAVA1XQ2Co0eqQzYZyYKPUzeoxRH9Y5kKRdUUsjJbp29Q06vJwaK1KDIUCjD7stCS
 kjdbsRVy+2OAzy8REIXMOrBntj7s9Nxa8C5R6GlWviKs/LhwvvwDayHRv52nwpNk66Pq
 17Yw==
X-Gm-Message-State: AOAM530Ka88GRBIWQ2N2s2RDHKiibzqSdauy+fYAw0mWhA9cubpo/ahg
 TJF4CN8P2ujg8kuzx407pijkEvllfhgRMw==
X-Google-Smtp-Source: ABdhPJzGZ7DgOEUvxGwvF8S+7NFQwreu1XoFACp/52/C8jVUNK/UGT5s8pNmoDHN+O0WBhCNva2Wow==
X-Received: by 2002:a17:902:d4d0:b029:ee:d5c3:745b with SMTP id
 o16-20020a170902d4d0b02900eed5c3745bmr2799307plg.14.1619999854003; 
 Sun, 02 May 2021 16:57:34 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t184sm8098054pgt.32.2021.05.02.16.57.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:57:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 07/26] tcg: Add tcg_call_func
Date: Sun,  2 May 2021 16:57:08 -0700
Message-Id: <20210502235727.1979457-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502235727.1979457-1-richard.henderson@linaro.org>
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/internal.h | 5 +++++
 tcg/tcg.c      | 5 ++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/tcg/internal.h b/tcg/internal.h
index c2d5e9c42f..cd128e2a83 100644
--- a/tcg/internal.h
+++ b/tcg/internal.h
@@ -32,6 +32,11 @@ typedef struct TCGHelperInfo {
     unsigned typemask;
 } TCGHelperInfo;
 
+static inline void *tcg_call_func(TCGOp *op)
+{
+    return (void *)(uintptr_t)op->args[TCGOP_CALLO(op) + TCGOP_CALLI(op)];
+}
+
 static inline const TCGHelperInfo *tcg_call_info(TCGOp *op)
 {
     return (void *)(uintptr_t)op->args[TCGOP_CALLO(op) + TCGOP_CALLI(op) + 1];
diff --git a/tcg/tcg.c b/tcg/tcg.c
index d42fa6c956..1e5e165bff 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2310,7 +2310,7 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
             }
         } else if (c == INDEX_op_call) {
             const TCGHelperInfo *info = tcg_call_info(op);
-            void *func;
+            void *func = tcg_call_func(op);
 
             /* variable number of arguments */
             nb_oargs = TCGOP_CALLO(op);
@@ -2324,7 +2324,6 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
              * Note that plugins have a template function for the info,
              * but the actual function pointer comes from the plugin.
              */
-            func = (void *)(uintptr_t)op->args[nb_oargs + nb_iargs];
             if (func == info->func) {
                 col += qemu_log("%s", info->name);
             } else {
@@ -4346,7 +4345,7 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
     int allocate_args;
     TCGRegSet allocated_regs;
 
-    func_addr = (tcg_insn_unit *)(intptr_t)op->args[nb_oargs + nb_iargs];
+    func_addr = tcg_call_func(op);
     flags = tcg_call_flags(op);
 
     nb_regs = ARRAY_SIZE(tcg_target_call_iarg_regs);
-- 
2.25.1


