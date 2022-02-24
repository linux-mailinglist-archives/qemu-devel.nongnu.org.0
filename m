Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DF14C304A
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 16:49:38 +0100 (CET)
Received: from localhost ([::1]:58460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNGN7-0003FF-VD
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 10:49:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNGHX-0003nM-4W
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 10:43:51 -0500
Received: from [2607:f8b0:4864:20::531] (port=46731
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNGHV-0008LP-Bg
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 10:43:50 -0500
Received: by mail-pg1-x531.google.com with SMTP id o23so2025561pgk.13
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 07:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AjZ+FpblYWm6FJefeogQ9VtXs9ARWVunhYnnzFSnb/Q=;
 b=fq+mZ4PFD4tZXQRFxana7XTjbVGbiSlV7AQKxsCongHNr7dNLRT1uiBU3FNXS4xZZL
 dWfpfVNkrItxXdXuHtgilaGU/rCdOkF/MU4fn32CpBZ7/ZElujOpFOB6GhvMUxx8rRCl
 mE7kXUlHbzo65ySZ8sySWGUVQFWmUp46KVSShfyAqL1Efe4xXJcgVEm1B6CrxVoR2UF5
 dxYQoewAynfHGdOfcVuy4yspNtozxIvQloJBQqg+juchappGbTxvPmbMEULuFDm8qTV0
 nfVyXd7lGXttTtfGkUkUxQA2hbvHjVRr8YSgmNOpt9ohBYQbj1biAwQuuggcPCNyjdx3
 Z7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AjZ+FpblYWm6FJefeogQ9VtXs9ARWVunhYnnzFSnb/Q=;
 b=qh3fm+ZdhVo8hkxVQK11dIZbdb4IAR1XfGG4ZSms/X0WJ1vSx7Q4Qjh1kaY1vDkuR0
 cdC3rPx/rCloBk5neZJPph0P729ZfxvyZQx1p0yz9BUigD5vOkrkhTUTcTuk+VwLYHgi
 pBXvGdiUEztlqDXZnllJZkOwCjAMYxPYhF8BMP0So77WfBUoyJW19HDvQcaipaFUT2Wy
 BiVY/4Av5wQaUQjjGdiykyo2kaq9uH/wqGrmfYnNjuDsSchGhlc4XaxE0M+rAn7ve14s
 Nm0PUk242gmnhsHw5Bm1/6zS0pBMEpszqMCuZZ2GN5APeONnzu4fSjMdSMg29BKv3GKh
 1Gew==
X-Gm-Message-State: AOAM530d/xYwSzwwkTMGoLns95jJGdbh80vLXWgdRQ8CIBjcb2c9b68Z
 j5HUriM+KKWwaRcaPuQFdaTEcrabWSQ7VQ==
X-Google-Smtp-Source: ABdhPJxDBKKw8bSmbvUj2854oPjOJGAvADo/pIbSOw+1ZDBOPL0E1MBf9DoYG5+H+XDHuZHfxNwPHw==
X-Received: by 2002:a63:4a4c:0:b0:375:6898:f6b6 with SMTP id
 j12-20020a634a4c000000b003756898f6b6mr2687196pgl.83.1645717428092; 
 Thu, 24 Feb 2022 07:43:48 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id v20sm3198062pju.9.2022.02.24.07.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 07:43:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/10] tcg/s390x: Use tgen_movcond_int in tgen_clz
Date: Thu, 24 Feb 2022 05:43:31 -1000
Message-Id: <20220224154333.125185-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224154333.125185-1-richard.henderson@linaro.org>
References: <20220224154333.125185-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-s390x@nongnu.org, david@redhat.com, dmiller423@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reuse code from movcond to conditionally copy a2 to dest,
based on the condition codes produced by FLOGR.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target-con-set.h |  1 +
 tcg/s390x/tcg-target.c.inc     | 26 +++++++++++---------------
 2 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/tcg/s390x/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
index 38ebce3594..a49e91bfcc 100644
--- a/tcg/s390x/tcg-target-con-set.h
+++ b/tcg/s390x/tcg-target-con-set.h
@@ -24,6 +24,7 @@ C_O1_I2(r, 0, rI)
 C_O1_I2(r, 0, rJ)
 C_O1_I2(r, r, r)
 C_O1_I2(r, r, ri)
+C_O1_I2(r, r, rI)
 C_O1_I2(r, r, rJ)
 C_O1_I2(r, rZ, r)
 C_O1_I2(v, v, r)
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 8edad2c390..e32eddf584 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1658,21 +1658,15 @@ static void tgen_clz(TCGContext *s, TCGReg dest, TCGReg a1,
 
     if (a2const && a2 == 64) {
         tcg_out_mov(s, TCG_TYPE_I64, dest, TCG_REG_R0);
-    } else {
-        if (a2const) {
-            tcg_out_movi(s, TCG_TYPE_I64, dest, a2);
-        } else {
-            tcg_out_mov(s, TCG_TYPE_I64, dest, a2);
-        }
-        if (HAVE_FACILITY(LOAD_ON_COND)) {
-            /* Emit: if (one bit found) dest = r0.  */
-            tcg_out_insn(s, RRFc, LOCGR, dest, TCG_REG_R0, 2);
-        } else {
-            /* Emit: if (no one bit found) goto over; dest = r0; over:  */
-            tcg_out_insn(s, RI, BRC, 8, (4 + 4) >> 1);
-            tcg_out_insn(s, RRE, LGR, dest, TCG_REG_R0);
-        }
+        return;
     }
+
+    /*
+     * Conditions from FLOGR are:
+     *   2 -> one bit found
+     *   8 -> no one bit found
+     */
+    tgen_movcond_int(s, TCG_TYPE_I64, dest, a2, a2const, TCG_REG_R0, 8, 2);
 }
 
 static void tgen_deposit(TCGContext *s, TCGReg dest, TCGReg src,
@@ -3304,11 +3298,13 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_rotl_i64:
     case INDEX_op_rotr_i32:
     case INDEX_op_rotr_i64:
-    case INDEX_op_clz_i64:
     case INDEX_op_setcond_i32:
     case INDEX_op_setcond_i64:
         return C_O1_I2(r, r, ri);
 
+    case INDEX_op_clz_i64:
+        return C_O1_I2(r, r, rI);
+
     case INDEX_op_sub_i32:
     case INDEX_op_sub_i64:
     case INDEX_op_and_i32:
-- 
2.25.1


