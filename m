Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 491B13B099E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 17:55:53 +0200 (CEST)
Received: from localhost ([::1]:33868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lviki-0002R8-9s
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 11:55:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvide-0005BY-0Z
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:48:34 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvidZ-0005Ka-IY
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:48:33 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso2510364pjb.4
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 08:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SpDU3fVzxTCg6gRwL/A7JZhAekSxML3t7A2jH96nB0U=;
 b=l7n2jzDNYJMxXM3cT9P8rrJZqHgPZZ4FLbfRkLPA7BhRmxq1usFLLJc3J1zsVWll9c
 Y/YlzePw7YxDB+5IKsiNVwNcIcptHE/+JsuZG/flRepnkEHfjehMDLOaM0GxXdBKCFKe
 lwda7q/MGhcABO334iqfpCHwPiHDprHetqNA0WaNCoQhya57sDRpltftGzny9YFgexnD
 23HPDh7MbFPa1gn00pyBGHTjhOisYpam8QGs9GPlSeg19POouMCNbBO2hMBX5SPvU+7M
 +mjLtJslXqHM7gwIR7nVeq/ICIEBiezmqwNQXYiX/hZjg0fQlh4Qw8WPbvByLIJS7+Sd
 kcTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SpDU3fVzxTCg6gRwL/A7JZhAekSxML3t7A2jH96nB0U=;
 b=N//ZtasQeRZqO4I68pfNstHQahscvTbpWHIy6RXPSTOOaOYb5/zZifvYrhxzVH0bQu
 3sA7lTcXDLnFOqmiD9Qym7EvO2nJWYgZnB5mA8QpJoEpDYhVD3C+UM//5QlldChjtFks
 2XqaVtb+z8i+ChorlFExwwHYZHmaDwYyHyHV69YiKDq7At2Kf3jMSu6/5p1+uROOMP4D
 7jU1LsfaQ5Y7ioHh8HkIh83rWLhKa0wWa7dlOYz4WCAlJTF/Igpze/wZTny+YJw000Nk
 1gR/6yacKbu2nGYdfXHKa9vlyOUARWnS8/Dpa4ulVj9pf0Hh5HKovWQ2ckGe2frRWzGQ
 /SUA==
X-Gm-Message-State: AOAM533lXwg6mV/G4CbwJOnWQFw7RUVjIjiSNBAreqryqEEeMZsdZers
 mUGN9XtupZcC9/nciq6Rgxctb5ivOk5r+g==
X-Google-Smtp-Source: ABdhPJxjAlSHbQ0+9a13FQIFP92i6x/vu2zCxpBRZz+QmTEzPdLWgdHR6J57b2nY/oQi1xepFyw/MA==
X-Received: by 2002:a17:90a:7a84:: with SMTP id
 q4mr4562109pjf.21.1624376908230; 
 Tue, 22 Jun 2021 08:48:28 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x13sm2898769pjh.30.2021.06.22.08.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 08:48:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/15] target/cris: Add DISAS_UPDATE_NEXT
Date: Tue, 22 Jun 2021 08:48:15 -0700
Message-Id: <20210622154820.1978982-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210622154820.1978982-1-richard.henderson@linaro.org>
References: <20210622154820.1978982-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move this pc update into tb_stop.
We will be able to re-use this code shortly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 80276ae84d..c9822eae4c 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -52,9 +52,15 @@
 #define BUG() (gen_BUG(dc, __FILE__, __LINE__))
 #define BUG_ON(x) ({if (x) BUG();})
 
-/* is_jmp field values */
-#define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
-#define DISAS_UPDATE  DISAS_TARGET_1 /* cpu state was modified dynamically */
+/*
+ * Target-specific is_jmp field values
+ */
+/* Only pc was modified dynamically */
+#define DISAS_JUMP          DISAS_TARGET_0
+/* Cpu state was modified dynamically, including pc */
+#define DISAS_UPDATE        DISAS_TARGET_1
+/* Cpu state was modified dynamically, excluding pc -- use npc */
+#define DISAS_UPDATE_NEXT   DISAS_TARGET_2
 
 /* Used by the decoder.  */
 #define EXTRACT_FIELD(src, start, end) \
@@ -3266,8 +3272,8 @@ static void cris_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 
     /* Force an update if the per-tb cpu state has changed.  */
     if (dc->base.is_jmp == DISAS_NEXT && dc->cpustate_changed) {
-        dc->base.is_jmp = DISAS_UPDATE;
-        tcg_gen_movi_tl(env_pc, dc->pc);
+        dc->base.is_jmp = DISAS_UPDATE_NEXT;
+        return;
     }
 
     /*
@@ -3309,6 +3315,7 @@ static void cris_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     if (unlikely(dc->base.singlestep_enabled)) {
         switch (is_jmp) {
         case DISAS_TOO_MANY:
+        case DISAS_UPDATE_NEXT:
             tcg_gen_movi_tl(env_pc, npc);
             /* fall through */
         case DISAS_JUMP:
@@ -3325,6 +3332,9 @@ static void cris_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     case DISAS_TOO_MANY:
         gen_goto_tb(dc, 0, npc);
         break;
+    case DISAS_UPDATE_NEXT:
+        tcg_gen_movi_tl(env_pc, npc);
+        /* fall through */
     case DISAS_JUMP:
     case DISAS_UPDATE:
         /* Indicate that interupts must be re-evaluated before the next TB. */
-- 
2.25.1


