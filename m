Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B63564D8B39
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 18:59:45 +0100 (CET)
Received: from localhost ([::1]:42368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nToyu-0006Rp-Ru
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 13:59:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTocA-0006uM-Vs
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:36:15 -0400
Received: from [2607:f8b0:4864:20::102b] (port=51079
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nToc9-0007sO-Aw
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:36:14 -0400
Received: by mail-pj1-x102b.google.com with SMTP id m22so15447688pja.0
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 10:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HBwan3ikRKwWJ4ff5ws0FdOZZkWoH5Z3Uy/j8VWWXqM=;
 b=ESjJ5Tfy/um8Rre231we+E63i68EZ7Ap5ku20Tg/NYzWElRrYUYHmNj5F6YXCw53ts
 pvX1MG4unVV+rOyr7iVo9W+veD6yv/IN9WuQU6QGnhLPlD4u02oIhMsF+JRxrJD0atFh
 oRk7ZuRDiKbQh+lZu/KrGo28K93tLovuHAMDcrJWwi/uAk9DqczsvoenRC/6r14o2Lid
 yC0FLsbuQST6tArNOHsfNi6JWCtf+DRuatuTG0dDy3yNsLwYnFVV0NE9Vw7dGjhDeQQo
 aZ/Im4rJRIZAdfj4R4bIT3RHN14jgEKw3gyi3tADytUGJM4Mc0xuz0dd6rWP6qXO2vyL
 l+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HBwan3ikRKwWJ4ff5ws0FdOZZkWoH5Z3Uy/j8VWWXqM=;
 b=Ukzq6PMqYhiw3SQh7shLz+PsN/sF97BPTMaMN2ULO7t0APn/BvHMajgBdtGYIHOcdL
 KUBgEWWMndqviTybT0WpmGqfkAvhw0RBHW4BBzwKmHb63rFE8heHfaKzfV/IHpPTFoi+
 UWzeGGVLf2d+KKXR/P1DikuPcysQUy8A53UqfWHfo4VX8mollhvC8Nn73o79bH1cBudi
 mrDbafvdOM4cu5qYcd9FydDNlB0GOXEGUPlVN6EnfPGKYbSDfePoCR/+qIPGa4aEEszI
 ROgxhuL+fB2UJjnC2lGtN7xquRRMgYsEz7+XaysZQx13c/YqWjpG75ZxLT5glcK+Y7W+
 NGPg==
X-Gm-Message-State: AOAM533z1ZEM5WH8OICX+jXB15SG7xVzdOkWFQZF9JfqzfdmFekp24A/
 /ww69lxLD+YdldbODtPoGfwbLPDqIzNZHg==
X-Google-Smtp-Source: ABdhPJxcmDw5Yr1vxu8FnMP2AgsQ3563ZJqX7h2tXCup3xR7TaaGa8/4yWaSqqLV6AZDxq1gOaqqfg==
X-Received: by 2002:a17:903:2303:b0:151:d02f:44c with SMTP id
 d3-20020a170903230300b00151d02f044cmr24534858plh.139.1647279372067; 
 Mon, 14 Mar 2022 10:36:12 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g24-20020a17090a579800b001c60f919656sm113847pji.18.2022.03.14.10.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 10:36:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/4] tcg/arm: Don't emit UNPREDICTABLE LDRD with Rm == Rt or
 Rt+1
Date: Mon, 14 Mar 2022 10:36:07 -0700
Message-Id: <20220314173607.145630-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220314173607.145630-1-richard.henderson@linaro.org>
References: <20220314173607.145630-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The LDRD (register) instruction is UNPREDICTABLE if the Rm register
is the same as either Rt or Rt+1 (the two registers being loaded to).
We weren't making sure we avoided this, with the result that on some
host CPUs like the Cortex-A7 we would get a SIGILL because the CPU
chooses to UNDEF for this particular UNPREDICTABLE case.

Since we've already checked that datalo is aligned, we can simplify
the test vs the Rm operand by aligning it before comparison.  Check
for the two orderings before falling back to two ldr instructions.

We don't bother to do anything similar for tcg_out_ldrd_rwb(),
because it is only used in tcg_out_tlb_read() with a fixed set of
registers which don't overlap.

There is no equivalent UNPREDICTABLE case for STRD.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/896
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index e1ea69669c..4bc0420f4d 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1689,8 +1689,21 @@ static void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
         /* LDRD requires alignment; double-check that. */
         if (get_alignment_bits(opc) >= MO_64
             && (datalo & 1) == 0 && datahi == datalo + 1) {
-            tcg_out_ldrd_r(s, COND_AL, datalo, addrlo, addend);
-        } else if (scratch_addend) {
+            /*
+             * Rm (the second address op) must not overlap Rt or Rt + 1.
+             * Since datalo is aligned, we can simplify the test via alignment.
+             * Flip the two address arguments if that works.
+             */
+            if ((addend & ~1) != datalo) {
+                tcg_out_ldrd_r(s, COND_AL, datalo, addrlo, addend);
+                break;
+            }
+            if ((addrlo & ~1) != datalo) {
+                tcg_out_ldrd_r(s, COND_AL, datalo, addend, addrlo);
+                break;
+            }
+        }
+        if (scratch_addend) {
             tcg_out_ld32_rwb(s, COND_AL, datalo, addend, addrlo);
             tcg_out_ld32_12(s, COND_AL, datahi, addend, 4);
         } else {
-- 
2.25.1


