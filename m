Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F004B1BB2
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 02:57:54 +0100 (CET)
Received: from localhost ([::1]:36954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nILC5-0003Lg-Vj
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 20:57:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKo7-0005bF-VT
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:33:07 -0500
Received: from [2607:f8b0:4864:20::42d] (port=40608
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKo0-0007Uv-9S
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:33:07 -0500
Received: by mail-pf1-x42d.google.com with SMTP id a39so12647303pfx.7
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VVgTfM7BfNjQi2pAaP/bo2OPnT/0AIG3Sa126Er0izA=;
 b=SN9VuGGm31jmL+Sy9XUdGUYAPQ6x2qYmQckKpxwVQLAvcIIVl3fjcq096aiFzfTipq
 /o05pab5rUkqLNqP5F6ggnxbl8uVLozMdiXDtGe70zmrj09rCddoyRypvDzpJNyuyknQ
 rYAVlBTzXVOa6SzaOIzgDaswyY+Q/iVsJDQmRvS0FOJg+ZTK/BqNw2L2+bmBU0w64cib
 5C3fQjfvu3c7zqyVJJmhf2c8/ISog0DPkGk1z9ar3m4h55180vGDR/JMcKRDyEnAOaJV
 qV0gk/pYYNyVgnQ1WIN0QPLPDs2qR1I59fddrrYhr7s6iIL8dmnwH7Q9gn5KDTGnbwHe
 1XRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VVgTfM7BfNjQi2pAaP/bo2OPnT/0AIG3Sa126Er0izA=;
 b=NfhG2HucxhvCxoCHKHlnc492A4jaUBcCS0hEQGhC3uaemuV2U/1ndGzjvs6Q1n8ahh
 Z5OTE5Y6mKMaBDvedDA47wJxgrqbfQ96lqmwlnLEsWgghDrcSdVfMSg231SUrn0zc5AU
 37cRLRLLPsN4SY+S2knfm2pKt6o5Hw6L5kh+ysYCr5PQWRfgQmnvymtGaUz/40Gr2o4x
 SGCKRuiiNt/IGUan/joJ0E6SWCW2vXtiYDe2pD6mLY9FPmWnBv+c2gX780LlR0pFR8nD
 7KauNDOZ3mEH3ywOIH5XiHwm0RWPEO+yC+5Vcm2N/+tTKpMETZFZQejhPA8IUgfluUZN
 U7wg==
X-Gm-Message-State: AOAM532jZ9DRBejjT7RTpO7OIyKOyU60+etOPswEPJiQTdhvaM+zD4xB
 i2emng0B+g1YmXDphXrf6G5hrfB1ANj77IwT
X-Google-Smtp-Source: ABdhPJyjjBFft5zZdavkpivRl0pMleQHSDCNOigPSQncUbbE4zle6qMh9QoORbGcML3Ff6RLaq1d0A==
X-Received: by 2002:a63:64c:: with SMTP id 73mr4445570pgg.360.1644543173339;
 Thu, 10 Feb 2022 17:32:53 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25738788pfi.111.2022.02.10.17.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 17:32:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/34] tcg/sparc: Use the constant pool for 64-bit constants
Date: Fri, 11 Feb 2022 12:30:56 +1100
Message-Id: <20220211013059.17994-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211013059.17994-1-richard.henderson@linaro.org>
References: <20220211013059.17994-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
index 213aba4be6..e78945d153 100644
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
@@ -479,6 +486,14 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
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


