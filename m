Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD35D2EE6EA
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:31:54 +0100 (CET)
Received: from localhost ([::1]:36926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxbwn-0003kL-Oi
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:31:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbh0-0001AJ-IX
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:34 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:35161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbgo-0001Xk-HK
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:34 -0500
Received: by mail-pg1-x529.google.com with SMTP id n7so5757597pgg.2
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NQliFXXfgB1CXPoiBmFHUeq1S6nzHe9RcOFk3sVmuPo=;
 b=RYPyOcCcx9wrq9L4pSwI50ot5Mx+BJ3BQy10hscCx/iUwX96nO7QHCreRfKSrQ6Dig
 bqkCb2VPiEcVNc3vKpz3wFHl+uJBHWZQvPCYEPgcjtgDS7ECJITxf2p3Xydv2CCLWG4R
 wlnwLCPV4Jh/Hjah4v3y1hrfF92u8FMbWrUdGdoi3+R+ziEehvklMUsAhApE7cvTj7T/
 3PGgG4JI/KOY8ak3Dkt3Vd4T/vo8iMK1Jcoxa2obJYEPpUvFPYi2mwQmasNO/qw8KZXz
 hTnaoaPIZgY3n93RjHX5ifyq7dn+vZLxUaYoYpmKhm9u5599BuVQNvFyWdCiZIRrzWHh
 Dpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NQliFXXfgB1CXPoiBmFHUeq1S6nzHe9RcOFk3sVmuPo=;
 b=bFY3+p9t6Lbs2we7Q7z1pqVkRdXiJJlyzkdZVFW2mta2PWo051rseMxEUfx3JojlWD
 aTvqGsRS2y/vZ7DE8+bAtbA+5+iQRZdO2XPB3vmRmmQIj+HCU5jqnu5G+wI2lKOgElhb
 +Y/6lGAMbFbPECivSBRjaw/Vlx0efb8JJTWGZrxjm8SrlZQ+8GSTE//tPvvSrYe2EYFL
 P4irjqr3aJAGmm4ng4dr516EKylva3a4s6madT8RsZBm9pQEIG4BRFJXW02deGqYafsw
 kNd1vrhhKGmIJYTsKVeEkruwitZAbLnYXqDcUXWhb+pmh8GRzhv0iAE3U404yHxSOrby
 lSrQ==
X-Gm-Message-State: AOAM532p6HT1vHHCGQoQoFlnXOFlk5YEYuRhzlYHIOq008Ll8ctfzLoN
 D8w0btg0L+1XJjpwSy6Fb4kwgmB9SXGZeA==
X-Google-Smtp-Source: ABdhPJySf3LUGf/2eg+OcxqGNV5cgo1r2JA/kNLHWYs+5fXPPxRnupIMjEhXZoA576jh7PFrDUyArA==
X-Received: by 2002:a62:1dd5:0:b029:19d:fc87:5f45 with SMTP id
 d204-20020a621dd50000b029019dfc875f45mr307607pfd.63.1610050519407; 
 Thu, 07 Jan 2021 12:15:19 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:15:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/47] tcg: Adjust tcg_out_label for const
Date: Thu,  7 Jan 2021 10:14:16 -1000
Message-Id: <20210107201448.1152301-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: peter.maydell@linaro.org, Joelle van Dyne <j@getutm.app>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simplify the arguments to always use s->code_ptr instead of
take it as an argument.  That makes it easy to ensure that
the value_ptr is always the rx version.

Reviewed-by: Joelle van Dyne <j@getutm.app>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                 |  6 +++---
 tcg/i386/tcg-target.c.inc | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index a34d2e5bb7..898c4bd1b6 100644
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
@@ -4329,7 +4329,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
             break;
         case INDEX_op_set_label:
             tcg_reg_alloc_bb_end(s, s->reserved_regs);
-            tcg_out_label(s, arg_label(op->args[0]), s->code_ptr);
+            tcg_out_label(s, arg_label(op->args[0]));
             break;
         case INDEX_op_call:
             tcg_reg_alloc_call(s, op);
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 9e4053f4e7..197e3006c8 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1461,7 +1461,7 @@ static void tcg_out_brcond2(TCGContext *s, const TCGArg *args,
     default:
         tcg_abort();
     }
-    tcg_out_label(s, label_next, s->code_ptr);
+    tcg_out_label(s, label_next);
 }
 #endif
 
@@ -1503,10 +1503,10 @@ static void tcg_out_setcond2(TCGContext *s, const TCGArg *args,
 
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
@@ -1520,7 +1520,7 @@ static void tcg_out_setcond2(TCGContext *s, const TCGArg *args,
         tcg_out_brcond2(s, new_args, const_args+1, 1);
 
         tgen_arithi(s, ARITH_ADD, args[0], 1, 0);
-        tcg_out_label(s, label_over, s->code_ptr);
+        tcg_out_label(s, label_over);
     }
 }
 #endif
@@ -1534,7 +1534,7 @@ static void tcg_out_cmov(TCGContext *s, TCGCond cond, int rexw,
         TCGLabel *over = gen_new_label();
         tcg_out_jxx(s, tcg_cond_to_jcc[tcg_invert_cond(cond)], over, 1);
         tcg_out_mov(s, TCG_TYPE_I32, dest, v1);
-        tcg_out_label(s, over, s->code_ptr);
+        tcg_out_label(s, over);
     }
 }
 
-- 
2.25.1


