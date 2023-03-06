Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A756AB3C6
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:42:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyuo-0006Zl-3s; Sun, 05 Mar 2023 19:41:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytz-0004WU-I9
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:32 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytx-0006d6-Im
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:31 -0500
Received: by mail-pj1-x1041.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so11558943pjb.3
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063229;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JFiRdzxnzZIO8XB0DPfhc28x4cUm55mTEkHKbVdrFk0=;
 b=bImUsTtTwnqLkDSp+YRyxOe9vO4x/F0G6iOng/wW4DyeCcPjxTH4IMaPiY0MlF8nC8
 rBRVgA7Dv5NFXFdB3FhbQxHEabVuDUMUsBr4T/RAuJ61xsodiN+5LzJwbrme536rARlM
 blUgJFTvlSEwBrekNbhu1C/c2RF9QVrDGViSjiWBTCbqrouWptpWIb0oKq2zhHLtWqdC
 QH0JqFzsbwK/UX9Gzuh+Bzp5uuqN0afcT8yJZGYbY+ethyAPDLdeI8Yg7DHlB9yWCWBy
 QbTaBSsRoT8ezQb9pQ38eMWvBtABU88PXT00yzfinHD42a9K5HDR0PjFrfmc9WCwevgJ
 qNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063229;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JFiRdzxnzZIO8XB0DPfhc28x4cUm55mTEkHKbVdrFk0=;
 b=nxjYtkUT20Hj49Xqpq2kTezIAgV8KOkUhdAcfP8kbdhpmbmwEU2o33Dvnvi4qrkAJW
 du8zCR/Tk+FsDF47pYzF8ghZ0Qepv1O+Yc/FuiY4SxbcKU7+hvVupnOcU4LEqWj60OwK
 rq645Wdl1StRHIFF+D81DDX8WWNVEWGm/gvm8Nrt4GcQEu33AaG38qEwzw2ld2I7AJ7Q
 oYV9cw3XTtp9FQzE4M3UJxfl/6aYYDHX+zM7KWX3kGnWV8PWTYCCzLI0TtQCmnSNM1xy
 YSQvRRHvGHZQhCEPAOmuDpQmjb0DPmewHzlQHyLKQVV70bsaydJfPxTNXI0OJiEvN8rk
 Dr6Q==
X-Gm-Message-State: AO0yUKXFZ6Wvk9eGPuF1GUcapvaeZtW5vbc1/WSYVPu/y2cxC/L+zV7b
 dMy3mS+vdYG2c4Fy3pBmK7+QkYCZ60KCK/dmdVgv3Qtb
X-Google-Smtp-Source: AK7set+BxSx1+Y3/VwBBvjJNySwPucsRs4j9qt/4ibks7hhejb4vR65xdFb+DSSYNckiZEslWNcfnQ==
X-Received: by 2002:a17:90a:16:b0:233:fdfd:711c with SMTP id
 22-20020a17090a001600b00233fdfd711cmr9621819pja.33.1678063228865; 
 Sun, 05 Mar 2023 16:40:28 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a17090b050d00b002372106a5c2sm6567901pjz.37.2023.03.05.16.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:40:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Taylor Simpson <tsimpson@quicinc.com>
Subject: [PULL 37/84] target/hexagon: Drop tcg_temp_free from gen_tcg_funcs.py
Date: Sun,  5 Mar 2023 16:39:07 -0800
Message-Id: <20230306003954.1866998-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Translators are no longer required to free tcg temporaries.

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/gen_tcg_funcs.py | 79 +--------------------------------
 1 file changed, 1 insertion(+), 78 deletions(-)

diff --git a/target/hexagon/gen_tcg_funcs.py b/target/hexagon/gen_tcg_funcs.py
index dfc90712fb..02cb52c21e 100755
--- a/target/hexagon/gen_tcg_funcs.py
+++ b/target/hexagon/gen_tcg_funcs.py
@@ -26,10 +26,7 @@
 ## Helpers for gen_tcg_func
 ##
 def gen_decl_ea_tcg(f, tag):
-    f.write("    TCGv EA = tcg_temp_new();\n")
-
-def gen_free_ea_tcg(f):
-    f.write("    tcg_temp_free(EA);\n")
+    f.write("    TCGv EA G_GNUC_UNUSED = tcg_temp_new();\n")
 
 def genptr_decl_pair_writable(f, tag, regtype, regid, regno):
     regN="%s%sN" % (regtype,regid)
@@ -269,73 +266,6 @@ def genptr_decl_imm(f,immlett):
     f.write("    int %s = insn->immed[%d];\n" % \
         (hex_common.imm_name(immlett), i))
 
-def genptr_free(f, tag, regtype, regid, regno):
-    if (regtype == "R"):
-        if (regid in {"dd", "ss", "tt", "xx", "yy"}):
-            f.write("    tcg_temp_free_i64(%s%sV);\n" % (regtype, regid))
-        elif (regid in {"d", "e", "x", "y"}):
-            f.write("    tcg_temp_free(%s%sV);\n" % (regtype, regid))
-        elif (regid not in {"s", "t", "u", "v"}):
-            print("Bad register parse: ",regtype,regid)
-    elif (regtype == "P"):
-        if (regid in {"d", "e", "x"}):
-            f.write("    tcg_temp_free(%s%sV);\n" % (regtype, regid))
-        elif (regid not in {"s", "t", "u", "v"}):
-            print("Bad register parse: ",regtype,regid)
-    elif (regtype == "C"):
-        if (regid in {"dd", "ss"}):
-            f.write("    tcg_temp_free_i64(%s%sV);\n" % (regtype, regid))
-        elif (regid in {"d", "s"}):
-            f.write("    tcg_temp_free(%s%sV);\n" % (regtype, regid))
-        else:
-            print("Bad register parse: ",regtype,regid)
-    elif (regtype == "M"):
-        if (regid != "u"):
-            print("Bad register parse: ", regtype, regid)
-    elif (regtype == "V"):
-        if (regid in {"dd", "uu", "vv", "xx", \
-                      "d", "s", "u", "v", "w", "x", "y"}):
-            if (not hex_common.skip_qemu_helper(tag)):
-                f.write("    tcg_temp_free_ptr(%s%sV);\n" % \
-                    (regtype, regid))
-        else:
-            print("Bad register parse: ", regtype, regid)
-    elif (regtype == "Q"):
-        if (regid in {"d", "e", "s", "t", "u", "v", "x"}):
-            if (not hex_common.skip_qemu_helper(tag)):
-                f.write("    tcg_temp_free_ptr(%s%sV);\n" % \
-                    (regtype, regid))
-        else:
-            print("Bad register parse: ", regtype, regid)
-    else:
-        print("Bad register parse: ", regtype, regid)
-
-def genptr_free_new(f, tag, regtype, regid, regno):
-    if (regtype == "N"):
-        if (regid not in {"s", "t"}):
-            print("Bad register parse: ", regtype, regid)
-    elif (regtype == "P"):
-        if (regid not in {"t", "u", "v"}):
-            print("Bad register parse: ", regtype, regid)
-    elif (regtype == "O"):
-        if (regid != "s"):
-            print("Bad register parse: ", regtype, regid)
-    else:
-        print("Bad register parse: ", regtype, regid)
-
-def genptr_free_opn(f,regtype,regid,i,tag):
-    if (hex_common.is_pair(regid)):
-        genptr_free(f, tag, regtype, regid, i)
-    elif (hex_common.is_single(regid)):
-        if hex_common.is_old_val(regtype, regid, tag):
-            genptr_free(f, tag, regtype, regid, i)
-        elif hex_common.is_new_val(regtype, regid, tag):
-            genptr_free_new(f, tag, regtype, regid, i)
-        else:
-            print("Bad register parse: ",regtype,regid,toss,numregs)
-    else:
-        print("Bad register parse: ",regtype,regid,toss,numregs)
-
 def genptr_src_read(f, tag, regtype, regid):
     if (regtype == "R"):
         if (regid in {"ss", "tt", "xx", "yy"}):
@@ -578,7 +508,6 @@ def genptr_dst_write_opn(f,regtype, regid, tag):
 ##           <GEN>
 ##           gen_log_reg_write(RdN, RdV);
 ##           ctx_log_reg_write(ctx, RdN);
-##           tcg_temp_free(RdV);
 ##       }
 ##
 ##       where <GEN> depends on hex_common.skip_qemu_helper(tag)
@@ -692,12 +621,6 @@ def gen_tcg_func(f, tag, regs, imms):
         if (hex_common.is_written(regid)):
             genptr_dst_write_opn(f,regtype, regid, tag)
 
-    ## Free all the operands (regs and immediates)
-    if hex_common.need_ea(tag): gen_free_ea_tcg(f)
-    for regtype,regid,toss,numregs in regs:
-        genptr_free_opn(f,regtype,regid,i,tag)
-        i += 1
-
     f.write("}\n\n")
 
 def gen_def_tcg_func(f, tag, tagregs, tagimms):
-- 
2.34.1


