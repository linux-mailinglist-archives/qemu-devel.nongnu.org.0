Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C3B6EBE90
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 12:22:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqWpT-0004Fh-8N; Sun, 23 Apr 2023 06:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqWp9-0004CR-37
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 06:20:03 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqWp0-0003Dy-NS
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 06:20:02 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f086770a50so21422665e9.2
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 03:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682245192; x=1684837192;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BxabGAakyN9OM2KP8Jp9zypxfyfwXhXvIRpxoVlsGFU=;
 b=Sxtn/P3b+4NW+6IKOwNBz213omMGS13xykZAeNc78CtVZG/8s7BKHcG/CcXwZ3IOm9
 yalKtFPdtuGew+zM2EKW9beF7KbNx3xPEFo5aU9Z1N2fwBrMQSL8WXBVrPvBYrCfiLaD
 m4UQJKUhSnf/4+w/KGymcXm977Ub66p2+mtr5f60p9s3II+W4HTZyQm6JYf+I4+YNVNc
 TTeEqnUGgLV0p/5mRkoRk4NixM9+NvSy2EhqDrZhMFcZY7nL4TtBHdiiihcCR525eepx
 0A1p5WZmODJGO7yCKEvhDqDjrqucc77ZRxhMyRKCHG+abgE+LOOUE/1PPah8rvNN+lNi
 55Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682245192; x=1684837192;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BxabGAakyN9OM2KP8Jp9zypxfyfwXhXvIRpxoVlsGFU=;
 b=T3sjPNgzykcstMwCqLtpbwBHZJcNTnz+Drl9QWu80G6G6eXsaX+1TDVo48jUZzvB5n
 UV2oHK+hgOd124RfsHnOj6MU4galcQoyuD3rPItPypqOqxda5pyRqP6nZG6tYn1YQDSt
 uA5G9byAcozpFfp84kslQjV5dHxU7Zln54zdKzRlX5VRZKR7UYBtfOqh+6Xbp8B7cwLV
 MeCiifRd775IxY/umjbzVEom9arP7nxNk8yzsZKspFma61qtJduu+FoDzZ7fioT8lush
 31U9X7tkZd/oODqi21/OITo0lTHxvwaJRDd7X5mSCzj88VT/KsBdiqIIu9hvr2E734ZD
 NQvg==
X-Gm-Message-State: AAQBX9fp+EytTkLw+AxXqmAiTmceW0VRBIPqO8Nn5TePBVspeTQzMP31
 6PHUrwAgVZsUqpqDICinKuAMqSPNk7yoNq4fHuooSw==
X-Google-Smtp-Source: AKy350YOPztc49AaD/21BBDfjavBZpzt3YpCnaNY3Iug/oHHOzbAjF2LgcvWdE8fSxHZtnVUrGuPnQ==
X-Received: by 2002:a7b:cbd9:0:b0:3f1:952c:3c70 with SMTP id
 n25-20020a7bcbd9000000b003f1952c3c70mr4412521wmi.40.1682245192418; 
 Sun, 23 Apr 2023 03:19:52 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a7bc2aa000000b003f080b2f9f4sm12550541wmk.27.2023.04.23.03.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 03:19:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 01/15] tcg: Replace if + tcg_abort with tcg_debug_assert
Date: Sun, 23 Apr 2023 11:19:36 +0100
Message-Id: <20230423101950.817899-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230423101950.817899-1-richard.henderson@linaro.org>
References: <20230423101950.817899-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                 | 4 +---
 tcg/i386/tcg-target.c.inc | 8 +++-----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index bb52bc060b..100f81edb2 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1174,9 +1174,7 @@ static TCGTemp *tcg_global_reg_new_internal(TCGContext *s, TCGType type,
 {
     TCGTemp *ts;
 
-    if (TCG_TARGET_REG_BITS == 32 && type != TCG_TYPE_I32) {
-        tcg_abort();
-    }
+    tcg_debug_assert(TCG_TARGET_REG_BITS == 64 || type == TCG_TYPE_I32);
 
     ts = tcg_global_alloc(s);
     ts->base_type = type;
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 5a151fe64a..dfd41c7bf1 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1369,8 +1369,8 @@ static void tcg_out_addi(TCGContext *s, int reg, tcg_target_long val)
     }
 }
 
-/* Use SMALL != 0 to force a short forward branch.  */
-static void tcg_out_jxx(TCGContext *s, int opc, TCGLabel *l, int small)
+/* Set SMALL to force a short forward branch.  */
+static void tcg_out_jxx(TCGContext *s, int opc, TCGLabel *l, bool small)
 {
     int32_t val, val1;
 
@@ -1385,9 +1385,7 @@ static void tcg_out_jxx(TCGContext *s, int opc, TCGLabel *l, int small)
             }
             tcg_out8(s, val1);
         } else {
-            if (small) {
-                tcg_abort();
-            }
+            tcg_debug_assert(!small);
             if (opc == -1) {
                 tcg_out8(s, OPC_JMP_long);
                 tcg_out32(s, val - 5);
-- 
2.34.1


