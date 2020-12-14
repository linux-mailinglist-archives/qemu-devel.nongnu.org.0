Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E44042D99A3
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:19:43 +0100 (CET)
Received: from localhost ([::1]:60698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koohS-0004Es-VA
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:19:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooS5-0001gO-By
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:49 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:33197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooRu-0003wC-WC
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:46 -0500
Received: by mail-oi1-x242.google.com with SMTP id d27so19254256oic.0
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1GlVA1Mk+DCqrpNhETwdyV3r3sGUvkB6WjkwT6v+rmo=;
 b=ZGwRjpz7QcbqO4mg+sHOph4f3PrkXN4BA5aLVukHk1vJa5Wy3X8UhJAHJODIdG3xoS
 095irJQobsRotwKCvzfKexIJm/xnRx9qm/ATk8KvDMmvmusDfMWuDEMFuADV9Ebx1J9N
 OB7mfb6kDP7fAFpYBKdSYSF0mjtEqEpgwJawIxdp7ojmhY9sXz8A9UG/YI2OP+ok+sVx
 VxAZjggl4bMZjjNpRY0ysJe9yjUoQmE9FkDpm7htAUmacrl0mDpemi1okBfNDVQOFyk4
 OuFA02OBTjixxTXcmjFe2OXDJIC8/kCP3qYqMyKprPhrbiJC4f3NChcdSNPDFvv7w2WD
 T0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1GlVA1Mk+DCqrpNhETwdyV3r3sGUvkB6WjkwT6v+rmo=;
 b=Mk4nkwOcOT4S6zv4B4GRJxFd7fNer2Xw3UDPPQnysmc0QIYwQpqlSSFSrs/zvgyBSL
 9Om3/m74ctOuMZ3p7EXzLliwq2YVtPaAm0VuhZJbSItp0xo4wTA36pdBgxCq6TEeRDjc
 vCGIjoyjosRPYt94D/rexbILRKU7ZLlf+gjWH9kLHUfOfbKC2zgODUJCsz/TcaycNXvS
 s+3iq4DWvoO3JcCclA7up1i8I2366PJ1XaZkAWKLES76Q84IbRy0QBeVukgSwUCYC7eD
 GNWcsh9m5Dmfbg+Chex+zxLuPHEzGrsD3+ouFekpucSw+ur4C1xcR+G98ZCMxcpt9R7e
 QxXQ==
X-Gm-Message-State: AOAM530zw15cNftTr7J0hXDKvV7v9UeT2ZhF8YJJa9eQy0lbYloVE1KP
 Lu1U/M4pWNUfq4YFhN/ekAj7LVq/GW7e4yBE
X-Google-Smtp-Source: ABdhPJw2Ma87bS1Ecghxnq0WDUbroA7LqKiY9MULewZcacSuHQkvVvZj7YT8WVbkmKp9Mna3DiqNdg==
X-Received: by 2002:aca:d506:: with SMTP id m6mr18167675oig.113.1607954615632; 
 Mon, 14 Dec 2020 06:03:35 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.03.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:03:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/43] tcg: Adjust tcg_out_label for const
Date: Mon, 14 Dec 2020 08:02:42 -0600
Message-Id: <20201214140314.18544-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x242.google.com
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

Simplify the arguments to always use s->code_ptr instead of
take it as an argument.  That makes it easy to ensure that
the value_ptr is always the rx version.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                 |  6 +++---
 tcg/i386/tcg-target.c.inc | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 435b0f1662..d94d38cc28 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -302,11 +302,11 @@ static void tcg_out_reloc(TCGContext *s, tcg_insn_unit *code_ptr, int type,
     QSIMPLEQ_INSERT_TAIL(&l->relocs, r, next);
 }
 
-static void tcg_out_label(TCGContext *s, TCGLabel *l, tcg_insn_unit *ptr)
+static void tcg_out_label(TCGContext *s, TCGLabel *l)
 {
     tcg_debug_assert(!l->has_value);
     l->has_value = 1;
-    l->u.value_ptr = tcg_splitwx_to_rx(ptr);
+    l->u.value_ptr = tcg_splitwx_to_rx(s->code_ptr);
 }
 
 TCGLabel *gen_new_label(void)
@@ -4325,7 +4325,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
             break;
         case INDEX_op_set_label:
             tcg_reg_alloc_bb_end(s, s->reserved_regs);
-            tcg_out_label(s, arg_label(op->args[0]), s->code_ptr);
+            tcg_out_label(s, arg_label(op->args[0]));
             break;
         case INDEX_op_call:
             tcg_reg_alloc_call(s, op);
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 095553ce28..0ac1ef3d82 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1452,7 +1452,7 @@ static void tcg_out_brcond2(TCGContext *s, const TCGArg *args,
     default:
         tcg_abort();
     }
-    tcg_out_label(s, label_next, s->code_ptr);
+    tcg_out_label(s, label_next);
 }
 #endif
 
@@ -1494,10 +1494,10 @@ static void tcg_out_setcond2(TCGContext *s, const TCGArg *args,
 
         tcg_out_movi(s, TCG_TYPE_I32, args[0], 0);
         tcg_out_jxx(s, JCC_JMP, label_over, 1);
-        tcg_out_label(s, label_true, s->code_ptr);
+        tcg_out_label(s, label_true);
 
         tcg_out_movi(s, TCG_TYPE_I32, args[0], 1);
-        tcg_out_label(s, label_over, s->code_ptr);
+        tcg_out_label(s, label_over);
     } else {
         /* When the destination does not overlap one of the arguments,
            clear the destination first, jump if cond false, and emit an
@@ -1511,7 +1511,7 @@ static void tcg_out_setcond2(TCGContext *s, const TCGArg *args,
         tcg_out_brcond2(s, new_args, const_args+1, 1);
 
         tgen_arithi(s, ARITH_ADD, args[0], 1, 0);
-        tcg_out_label(s, label_over, s->code_ptr);
+        tcg_out_label(s, label_over);
     }
 }
 #endif
@@ -1525,7 +1525,7 @@ static void tcg_out_cmov(TCGContext *s, TCGCond cond, int rexw,
         TCGLabel *over = gen_new_label();
         tcg_out_jxx(s, tcg_cond_to_jcc[tcg_invert_cond(cond)], over, 1);
         tcg_out_mov(s, TCG_TYPE_I32, dest, v1);
-        tcg_out_label(s, over, s->code_ptr);
+        tcg_out_label(s, over);
     }
 }
 
-- 
2.25.1


