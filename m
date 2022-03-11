Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 513DE4D5CD5
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 08:54:44 +0100 (CET)
Received: from localhost ([::1]:35102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSa6l-0003L2-Eg
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 02:54:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSa5B-0002VM-0C
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 02:53:05 -0500
Received: from [2607:f8b0:4864:20::42f] (port=45601
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSa59-0001a9-9Z
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 02:53:04 -0500
Received: by mail-pf1-x42f.google.com with SMTP id s8so7216286pfk.12
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 23:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LqP4IBBWQt0Zh6R+vabA/ZXJY6oyUr6uXPYOwi2dKGw=;
 b=vGXv2sc0S5+7mxtcEc5qOtWh4Y40oqDwXjGWdc4XtIQDrFcjTyjDEeDfuht8Miw5U+
 B71QGrn1ZPuSmmUGxla/JkvZArDWJxDq75b+WTULZOD2mG4WFu7POhW8LY4jBLLQztQi
 /rH75Wx3N6uUvUHk+qb/vqSCHiSOh38YPG+xjL2OSNNMGPGP4VVGdohZA7FkPZ3RS7+c
 xvk8mFGeM+AUPBPmGKB0bjqvePLq9avhXzKdd+dyf91r61nz8gt///2qYUm38EpOQya9
 h4hMFclmsJTrX4rIqjgoQNg3fuRBeinp/IDb78vr9z0kqwenR5AkVYN8BW1ZKc/xtsli
 23gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LqP4IBBWQt0Zh6R+vabA/ZXJY6oyUr6uXPYOwi2dKGw=;
 b=1nsS5xVM97eDZDws9/mMS1JtoME77cwLS+Nc2wIV/o54gburoKMKcZt79uEw1J+SV3
 kvGiiQYCPWWmrJIJxXqku0RGcRNKf4t5eLEy+SA27MsWmQE3VmeUe7xfCheevjOyr8rN
 viB4kO0YlJqmbPGIKG6HCz+yjXdRUDfNUnsNhJ3HUkDGEGfgy9r3ipcZzs4UotpH+JQg
 39/9ulUFqz9CqaVVTUarzqAEEPnjUW2yuGheXy6L9aXtwubvPH971icG80pTOUBeUJC9
 CI4jf1dyzjIKffcD3EPbubcsRxulE4n9XUYaAgYspp0gfc/W1v1Nk/bi0YE2jyVqdrUY
 5j6Q==
X-Gm-Message-State: AOAM532FU7eVM+ICi6tVgAXC4dg7FBqM3qx3Z6o3K3sQrHeEOUmJ37fy
 TxPRJVKiV2BUwPlXZmFDXAaiEb5TATauEg==
X-Google-Smtp-Source: ABdhPJyihx7ZmzfsKJCQQs2iFIPLNrwlb9E6/Ro3C/letOA1OvjLlSxW+toX5WkVqWw7/EldozTAhw==
X-Received: by 2002:a05:6a00:23c5:b0:4f7:b50:e5f3 with SMTP id
 g5-20020a056a0023c500b004f70b50e5f3mr9141568pfc.36.1646985181615; 
 Thu, 10 Mar 2022 23:53:01 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 14-20020a17090a01ce00b001bfbffc1331sm5893261pjd.46.2022.03.10.23.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 23:53:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg/arm: Don't emit UNPREDICTABLE LDRD with Rm == Rt or Rt+1
Date: Thu, 10 Mar 2022 23:53:00 -0800
Message-Id: <20220311075300.609094-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: peter.maydell@linaro.org
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


