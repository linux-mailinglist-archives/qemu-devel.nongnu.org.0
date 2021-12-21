Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C705E47C44B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 17:58:23 +0100 (CET)
Received: from localhost ([::1]:59146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mziT0-0006If-UA
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 11:58:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIz-0000TM-6V
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:01 -0500
Received: from [2607:f8b0:4864:20::52d] (port=35552
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIt-0007dY-T7
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:00 -0500
Received: by mail-pg1-x52d.google.com with SMTP id v25so7744027pge.2
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PjAarXq7rmQslFajUb9OO37bFQay55ayArd0DDEEb8g=;
 b=I43/09yTbP0FNRJVfxLrJ+OSagGrlqFPoiQugjy1YQQSHDKocx7ejSoxwCICzD/9wE
 ECVa24nHUeQcsoNU1lJwrLDd8yLoyBiTHPoRR14G2tf0V9wnLEc8d6t675C916FVNepu
 eXJWyOPs/36BzdVVgyjo23wFUVJiIBSKZhgiH9bDg6E+AGnpdNdaqlHVCCZNkPDnpOOy
 lqq5LcFBgUwgiJLLuOUE5+nHOpN8WzPTzUcxMhVwmgsZojgN0FTrBwXDXkrpOPqqxIcJ
 DTIg3x7bsLTcxFkh+GIgL8EZQJyrExT8qxj5f+zGnITBQbUP8AcBd/ulTyHHjmPQPWfP
 Rqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PjAarXq7rmQslFajUb9OO37bFQay55ayArd0DDEEb8g=;
 b=gnJdqp1pFrup6Nm5mWpm73L7bq5A7ClT4A3SNzKaroDQOKD2h5Z3iiYWp+SEWmiVx3
 hzm8RjqxDo+HVfN7/IzU22JxYTRhn68hRgMg3yJlJH9RGm4dNNLU+PcXJU7j/7IWNbmq
 YYXCadez0OUiIXMW3p3K01wPiMDi7nc4bCpp8YeekEAItvcvj9co8ei2LTutLlaMQBSf
 V4diVPBjsC7SdqXfLCsu7MpvtYmDJ/qedfCkHUPNhnoDxqRCrLKdds4Db95j4UqCBHzu
 GheXSJZu1YBmHHheXjY0X4waz0xx06U3xaLNo98CcV6rVaEzOLmuz8aVjL5z79wZuLEv
 vimg==
X-Gm-Message-State: AOAM533BztHWXq/G5AaveOy1L1fklnDtRoYyvfk6L4y0PGxW3hSBwBcz
 yn7iNuw9WcP+kjNslbTiuGXLKMpnbjOxhQ==
X-Google-Smtp-Source: ABdhPJwuZtcYCfgbtCARKpKaEKj8Q2XTqlFRvJ/LFBx+nf5HiQipwQarDp9YdgM4HL+yRz7VIi82sA==
X-Received: by 2002:a05:6a00:1516:b0:4a0:2c42:7f17 with SMTP id
 q22-20020a056a00151600b004a02c427f17mr3852784pfu.74.1640105274688; 
 Tue, 21 Dec 2021 08:47:54 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b192sm2256818pga.35.2021.12.21.08.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 08:47:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/31] tcg/loongarch64: Implement add/sub ops
Date: Tue, 21 Dec 2021 08:47:23 -0800
Message-Id: <20211221164737.1076007-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221164737.1076007-1-richard.henderson@linaro.org>
References: <20211221164737.1076007-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: WANG Xuerui <git@xen0n.name>

The neg_i{32,64} ops is fully expressible with sub, so omitted for
simplicity.

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211221054105.178795-18-git@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target-con-set.h |  2 ++
 tcg/loongarch64/tcg-target.c.inc     | 38 ++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/tcg/loongarch64/tcg-target-con-set.h b/tcg/loongarch64/tcg-target-con-set.h
index 42f8e28741..4b8ce85897 100644
--- a/tcg/loongarch64/tcg-target-con-set.h
+++ b/tcg/loongarch64/tcg-target-con-set.h
@@ -18,6 +18,8 @@ C_O0_I1(r)
 C_O1_I1(r, r)
 C_O1_I2(r, r, rC)
 C_O1_I2(r, r, ri)
+C_O1_I2(r, r, rI)
 C_O1_I2(r, r, rU)
 C_O1_I2(r, r, rW)
 C_O1_I2(r, 0, rZ)
+C_O1_I2(r, rZ, rN)
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 2895769e68..c71d25d3fe 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -687,6 +687,36 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
+    case INDEX_op_add_i32:
+        if (c2) {
+            tcg_out_opc_addi_w(s, a0, a1, a2);
+        } else {
+            tcg_out_opc_add_w(s, a0, a1, a2);
+        }
+        break;
+    case INDEX_op_add_i64:
+        if (c2) {
+            tcg_out_opc_addi_d(s, a0, a1, a2);
+        } else {
+            tcg_out_opc_add_d(s, a0, a1, a2);
+        }
+        break;
+
+    case INDEX_op_sub_i32:
+        if (c2) {
+            tcg_out_opc_addi_w(s, a0, a1, -a2);
+        } else {
+            tcg_out_opc_sub_w(s, a0, a1, a2);
+        }
+        break;
+    case INDEX_op_sub_i64:
+        if (c2) {
+            tcg_out_opc_addi_d(s, a0, a1, -a2);
+        } else {
+            tcg_out_opc_sub_d(s, a0, a1, a2);
+        }
+        break;
+
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     default:
@@ -748,6 +778,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_rotr_i64:
         return C_O1_I2(r, r, ri);
 
+    case INDEX_op_add_i32:
+    case INDEX_op_add_i64:
+        return C_O1_I2(r, r, rI);
+
     case INDEX_op_and_i32:
     case INDEX_op_and_i64:
     case INDEX_op_nor_i32:
@@ -770,6 +804,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         /* Must deposit into the same register as input */
         return C_O1_I2(r, 0, rZ);
 
+    case INDEX_op_sub_i32:
+    case INDEX_op_sub_i64:
+        return C_O1_I2(r, rZ, rN);
+
     default:
         g_assert_not_reached();
     }
-- 
2.25.1


