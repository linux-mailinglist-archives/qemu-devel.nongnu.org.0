Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5B84AAEDD
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 11:37:22 +0100 (CET)
Received: from localhost ([::1]:34678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGev3-0000ub-3Q
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 05:37:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGepo-0004X2-OB
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 05:31:56 -0500
Received: from [2607:f8b0:4864:20::102c] (port=53953
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGepm-0002Oo-Tn
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 05:31:56 -0500
Received: by mail-pj1-x102c.google.com with SMTP id qe15so556220pjb.3
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 02:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qJCEm5RzzhXFwEaNpyHXU7iJl0JP4KgfJFsTaZhBw3w=;
 b=UGfJznfbJflKzVctyyhSyA1LLSZoKiwJtxVJAlvnfONl7IwefZ+/Azi/+WXp6N+OwB
 G2YYlzZUu4g9xoa2oHm646XReiDU369DKC6Esbp2NmYgDED0DewXYGs/HfBcBMTcOJJR
 V7rSFijvT/y0dPwZ9AY2BZoFXTE/Xekv1tayF0ewlPOHu2xIV+45CPE6cpQYA611rsED
 wiZpkkdM4ShJYQUyJOCdyFdv3R35ydkoY3XZjvbCSvM7U14b2yvbFAK7JlrDJIVMSN1V
 J7X18C+PFWFvo0N0FqbnpRMZBVkEc9GnbTRVf3fQJRjdIMQu9q8TFVw0El8+mIP4UD/6
 rVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qJCEm5RzzhXFwEaNpyHXU7iJl0JP4KgfJFsTaZhBw3w=;
 b=h+vFPRxk/5vKPNFTzbiZnVjY1wB6G1pXgx7pYnhdsPAuWXFqT7r0clthmh36hAjDK/
 0HKrIZNoeayu8bjlX9S5o8pvq6plzFGpWyoCcBz7kJLcVr0waTXx6NXLx1xRy9LjjfiQ
 9vqdqRsY9hBNYZ0CDuEbECfo2JM2LS9giL3kE/tkmHhS6cWjnL/BuOCTM5o/ILRnUwst
 +1VnplPZHRpWTVD7WTSTxDEcu+nx7swPibxPa6RFctuCnMYeQ9Wjnkcfezijw8Yttxq2
 SmAAV/Ps0vZNVvy3edPnbJhqAmLfPLBUaB0doHbD7aHR+cgex/S/O7jwdBeZjtq0xCFq
 wD3g==
X-Gm-Message-State: AOAM532VzWxAflcua01bmevK5T5bZbtRKEqL4iaIrn02I6iSBDDgzO4J
 03+p4aF2dTuYb9eE1kSfnizRcx/LBEkcD3GW
X-Google-Smtp-Source: ABdhPJzx55iIQvb2yyhXWYkUkkDSLHBoE50Lz4CfKgOaU5QsgkkcXoDCSqN73BGZVlkQlzk6AZRokw==
X-Received: by 2002:a17:902:b213:: with SMTP id
 t19mr11492306plr.100.1644143513383; 
 Sun, 06 Feb 2022 02:31:53 -0800 (PST)
Received: from localhost.localdomain ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id s2sm5605937pgl.21.2022.02.06.02.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 02:31:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 4/6] tcg/sparc: Use the constant pool for 64-bit constants
Date: Sun,  6 Feb 2022 21:31:36 +1100
Message-Id: <20220206103138.36105-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220206103138.36105-1-richard.henderson@linaro.org>
References: <20220206103138.36105-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index f3043e6833..074fb25af2 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -336,6 +336,13 @@ static bool patch_reloc(tcg_insn_unit *src_rw, int type,
         insn &= ~INSN_OFF19(-1);
         insn |= INSN_OFF19(pcrel);
         break;
+    case R_SPARC_13:
+        if (!check_fit_ptr(value, 13)) {
+            return false;
+        }
+        insn &= ~INSN_IMM13(-1);
+        insn |= INSN_IMM13(value);
+        break;
     default:
         g_assert_not_reached();
     }
@@ -473,6 +480,14 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
         return;
     }
 
+    /* Use the constant pool, if possible. */
+    if (!in_prologue && USE_REG_TB) {
+        new_pool_label(s, arg, R_SPARC_13, s->code_ptr,
+                       tcg_tbrel_diff(s, NULL));
+        tcg_out32(s, LDX | INSN_RD(ret) | INSN_RS1(TCG_REG_TB));
+        return;
+    }
+
     /* A 64-bit constant decomposed into 2 32-bit pieces.  */
     if (check_fit_i32(lo, 13)) {
         hi = (arg - lo) >> 32;
-- 
2.25.1


