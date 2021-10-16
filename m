Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1156443043B
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 20:37:33 +0200 (CEST)
Received: from localhost ([::1]:43158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mboYm-0007wW-6e
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 14:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDe-0008PL-9W
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:43 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:39882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDZ-00028m-RR
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:41 -0400
Received: by mail-pf1-x433.google.com with SMTP id d9so4071206pfl.6
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 11:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KpJskJGYG8NwOwmiH2Iu6UhY3Zn5zWd+0hF4Ppw0hnM=;
 b=w2PaDEIjRb6BzZsMnxvRucHE8xbQ8mie6Wl+fWuvdeH3yYsPorXhKGTP/guyNcdRkl
 lXoJwFhjUaQNH74WnxaBt/DX4ERpwgwzOx3gKl9LiErlQIrnwKRFW6IlZvZ0sKV6XgGk
 SyXdKWbr1+taWjABw8w7Gv3zk8MboCLFbRFLoZsGnDleyyNf2oFPyA7VLE/d2UrxUItr
 aZ9UPgEBCJWUzeiEUP0mtjKBQ2FJclIML0ixBhZNo1CErr0rsE++JYaSR5R9/mv4oV2A
 Hew5Sw9FtSBdL9D8UA1RO+WKKzldZQivjbex1gQT3lFzz4GkvYn032LwqUulJxcJ/OQg
 QVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KpJskJGYG8NwOwmiH2Iu6UhY3Zn5zWd+0hF4Ppw0hnM=;
 b=DnF46WlaqEjE3Os4+pmU0YTVZrTwU5pBN6HzOBRSyu+Mfc8EUEcNZu1QNxcwHPar8W
 xhKV0LA/4RUbSXNyF/jAlesmdW9RtRsa8Y/mv596iw3QqONrZtJEfFaNuQb+HBIOTHqQ
 dXyVMIKaeeglId1vBXvAw82I4tVGfX1aPtT09fxbKfve6Nm1l/uJodcCwokz+KEYLPFD
 ctIiL75eUT9iDtURyZiuy7IxuZqnqfIRZUg3Ey86oQQsuKr1cGjihV5LvF5OMIBIrsTp
 /reEh2LP7/Zxj+YEu75XmzddzxNrFSPivFW5H+BfZHveS1e0MUa/+eTjfqAI24fVFj7G
 Xn2A==
X-Gm-Message-State: AOAM530cUtHj1gsrG38KZIQcCA5RVuU9VV2dnn6Qm7qSWBCE2M8wWVvc
 tcaum5yA/275xnvdSVPEbTWi6ccT6qk=
X-Google-Smtp-Source: ABdhPJxykYVAU4EJpf/58WBPTDBWXFNrIZeGbpzz4WXD0MACkqFTCAf94p083iWqlvXiPCno+2G+7g==
X-Received: by 2002:a63:8c4d:: with SMTP id q13mr14843517pgn.92.1634408136512; 
 Sat, 16 Oct 2021 11:15:36 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ob5sm5075097pjb.2.2021.10.16.11.15.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 11:15:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/24] target/xtensa: Drop check for singlestep_enabled
Date: Sat, 16 Oct 2021 11:15:13 -0700
Message-Id: <20211016181514.3165661-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016181514.3165661-1-richard.henderson@linaro.org>
References: <20211016181514.3165661-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

GDB single-stepping is now handled generically.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index dcf6b500ef..09430c1bf9 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -382,18 +382,14 @@ static void gen_jump_slot(DisasContext *dc, TCGv dest, int slot)
     if (dc->icount) {
         tcg_gen_mov_i32(cpu_SR[ICOUNT], dc->next_icount);
     }
-    if (dc->base.singlestep_enabled) {
-        gen_exception(dc, EXCP_DEBUG);
+    if (dc->op_flags & XTENSA_OP_POSTPROCESS) {
+        slot = gen_postprocess(dc, slot);
+    }
+    if (slot >= 0) {
+        tcg_gen_goto_tb(slot);
+        tcg_gen_exit_tb(dc->base.tb, slot);
     } else {
-        if (dc->op_flags & XTENSA_OP_POSTPROCESS) {
-            slot = gen_postprocess(dc, slot);
-        }
-        if (slot >= 0) {
-            tcg_gen_goto_tb(slot);
-            tcg_gen_exit_tb(dc->base.tb, slot);
-        } else {
-            tcg_gen_exit_tb(NULL, 0);
-        }
+        tcg_gen_exit_tb(NULL, 0);
     }
     dc->base.is_jmp = DISAS_NORETURN;
 }
@@ -1293,12 +1289,7 @@ static void xtensa_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     case DISAS_NORETURN:
         break;
     case DISAS_TOO_MANY:
-        if (dc->base.singlestep_enabled) {
-            tcg_gen_movi_i32(cpu_pc, dc->pc);
-            gen_exception(dc, EXCP_DEBUG);
-        } else {
-            gen_jumpi(dc, dc->pc, 0);
-        }
+        gen_jumpi(dc, dc->pc, 0);
         break;
     default:
         g_assert_not_reached();
-- 
2.25.1


