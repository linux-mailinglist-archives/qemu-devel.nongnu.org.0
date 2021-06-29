Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE8E3B78C5
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:38:30 +0200 (CEST)
Received: from localhost ([::1]:50184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJYz-0003Z1-7E
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItQ-0008U5-1o
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:32 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:39529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItA-0000u0-6m
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:31 -0400
Received: by mail-pg1-x52b.google.com with SMTP id a2so19348443pgi.6
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TmE3ty8MFHw5l53WoOarVMR7r8mrPkuN/VqQisWZNow=;
 b=VagcJCg+8PKv7Un9QpSXaMhROyqusSVdbeZJ8cNbFyOe1zJuOl26fxBdCUeRWsCYhJ
 jINVtJi30w1x9f2JLcYK7LroXYYo/eNa3cETC8MZDpfIN7YvJDstWEDlh69/ueqxxRhs
 A1fV8DBQ6rwAzJhNxqz0L1DnuWLZk8H7E4fuu/mnQz4I8yXfp9e/VeIqRaXjH3luKc8j
 ZhlCR+TyAbEPsTayQrFtbIer1511kbchtd6pSK5QukEYU8dI8T+E+mIiBuayUabRzYKA
 /58mWoK5KAAz8D5lqaaFjnhYYi36dOQVK7yR5JmA+KvfKOBzMNxh2AAqfCbJU22MJMnY
 7N9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TmE3ty8MFHw5l53WoOarVMR7r8mrPkuN/VqQisWZNow=;
 b=sudcwY5wbv2d5uf7/RgJKT73SJT5WqeV1E81yD2T1zYSrTp0t5/HdUB2FHqnqaV+c1
 uZkQCZy9vqtWNYEkY3i1JnfOB+7A1h/gc/nxHgTNC8TvaYvG28Pph2/dbF4cww/nkL7E
 xGIXQMjA8lcczDeTDE4VhxkfwNXezo7QEzYL0RUzn09dctfglIYvfDXyVf6W7DY7K1uu
 I8gw0a5fYJnxDKsNK5bDRL5ehylOedKWhsjnNK31fctOZjx1EcZ7Rps2lEx1t2aj94Kl
 M6A5v6UAZErpbqzt8eYl+Qzcd7SueTWno3U0A3yo2nO40nX8P1JmqaSOYkpG0qZ2sy5o
 hMfw==
X-Gm-Message-State: AOAM5336wjIgglC7o/ENwPNKBFNA0z3Qvh4k98sfeYg9PNk5f4oykYIv
 03Wr17Ji6Xr8WdfvMrfMInf7F28PvE3CuA==
X-Google-Smtp-Source: ABdhPJyzuNECmltFcoDLGcHpv2YbpaWLNjSuy8oX7iXqlkI/QCQuVbD5Tm6uuT/dUJ9Kqlx3lnNfdg==
X-Received: by 2002:a63:f557:: with SMTP id e23mr29717312pgk.55.1624992911053; 
 Tue, 29 Jun 2021 11:55:11 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:55:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/63] target/cris: Improve JMP_INDIRECT
Date: Tue, 29 Jun 2021 11:54:18 -0700
Message-Id: <20210629185455.3131172-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use movcond instead of brcond to set env_pc.
Discard the btarget and btaken variables to improve
register allocation and avoid unnecessary writeback.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 8b379522c6..1d4c78eab2 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -522,17 +522,6 @@ static void t_gen_swapr(TCGv d, TCGv s)
     tcg_temp_free(org_s);
 }
 
-static void t_gen_cc_jmp(TCGv pc_true, TCGv pc_false)
-{
-    TCGLabel *l1 = gen_new_label();
-
-    /* Conditional jmp.  */
-    tcg_gen_mov_tl(env_pc, pc_false);
-    tcg_gen_brcondi_tl(TCG_COND_EQ, env_btaken, 0, l1);
-    tcg_gen_mov_tl(env_pc, pc_true);
-    gen_set_label(l1);
-}
-
 static bool use_goto_tb(DisasContext *dc, target_ulong dest)
 {
     return ((dest ^ dc->base.pc_first) & TARGET_PAGE_MASK) == 0;
@@ -3321,8 +3310,17 @@ static void cris_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             /* fall through */
 
         case JMP_INDIRECT:
-            t_gen_cc_jmp(env_btarget, tcg_constant_tl(npc));
+            tcg_gen_movcond_tl(TCG_COND_NE, env_pc,
+                               env_btaken, tcg_constant_tl(0),
+                               env_btarget, tcg_constant_tl(npc));
             is_jmp = dc->cpustate_changed ? DISAS_UPDATE : DISAS_JUMP;
+
+            /*
+             * We have now consumed btaken and btarget.  Hint to the
+             * tcg compiler that the writeback to env may be dropped.
+             */
+            tcg_gen_discard_tl(env_btaken);
+            tcg_gen_discard_tl(env_btarget);
             break;
 
         default:
-- 
2.25.1


