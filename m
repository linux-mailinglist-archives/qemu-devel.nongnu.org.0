Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1C92E291A
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 23:52:58 +0100 (CET)
Received: from localhost ([::1]:47808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksZTd-0001uX-E9
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 17:52:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ksZMP-0001y7-1s
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 17:45:29 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:41731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ksZMN-0008KI-9p
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 17:45:28 -0500
Received: by mail-pl1-x635.google.com with SMTP id y8so1811538plp.8
 for <qemu-devel@nongnu.org>; Thu, 24 Dec 2020 14:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0tkUfCciBAcZfDt5l7o3GW8+5Ehz0EGG5um2EBC7lJ8=;
 b=IoykNiaXskHcs8gIchNnP5agfgD3DC0rLPDfch+QYakEHswI1cr8mib1drFEN6naIe
 MQarN+Nansft38ZOvs+5Cwd93LPPVMwgEHQrbEkTG4rUxqUdxNisNwsWV/9cISogj7m7
 SHicTBolOJCl7/QLtUcYJEKNCwu1fVMXO/GyZbW5fHAow3VaZC0NrIxZq2bte9qInnsm
 kBFfLhTjd670eAFUc76Db6pnM9brE2erc1tYhhr8hAFhjsSTT7vUHMTAKzB86P74ePXv
 05LRUVKQTq1cpcS7yuvTHhEzm1coHfjPkEE30iKlgqoP6/PJR65wco4jNdrUJ3dIvgyI
 Ysdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0tkUfCciBAcZfDt5l7o3GW8+5Ehz0EGG5um2EBC7lJ8=;
 b=Oax6k4csXhQZ9VxvzkrDQmMd1I9LndRIlhPybrzWRSY8isVnq9tO1sil9sJRUsjZpt
 AXew89pRufmtT78wKjWo39OqKUyrJKt0X0kAotcl8mDyzzUL0RS7Pu9RyQ9Yf1W9ehsY
 y/iVr1HsFCPBtS59iUYhfc2jnN4w1FUe4H5VMXAu4xK/adX7X2KIiAOR4C1feba8/jsv
 g3wfMCNGCrCejluoWqkWTBJZQs6wxjLFjzwj3nNOuzIod/L5UmzXzb5KxKQqutaj+/Ze
 qaHxvc0WB1GBU17qNslEA1N+7K5r+WOWijVyHnI+/nDPAb0OzWgIXoXNOQD5XWsDDpI3
 l0tQ==
X-Gm-Message-State: AOAM530QzXm+o5ST1VEJnpGL35kGBN2GwFkan0f0479wdayUxxuJSlPI
 KOdtnY+fXnZINMkGMaoFkniA5UlAyMLB8g==
X-Google-Smtp-Source: ABdhPJyn9D2r0ncg8kEoyqOmY9IDla1AWMg0+qNak/4z4OwbClZNQNceJF8GrPL5/MVzgywXzQYhzw==
X-Received: by 2002:a17:902:bb8c:b029:dc:2e5e:2b2 with SMTP id
 m12-20020a170902bb8cb02900dc2e5e02b2mr30613516pls.10.1608849925724; 
 Thu, 24 Dec 2020 14:45:25 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id w11sm11844123pge.28.2020.12.24.14.45.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Dec 2020 14:45:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/15] tcg/arm: Implement TCG_TARGET_HAS_mul_vec
Date: Thu, 24 Dec 2020 14:45:08 -0800
Message-Id: <20201224224514.626561-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201224224514.626561-1-richard.henderson@linaro.org>
References: <20201224224514.626561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.h     | 2 +-
 tcg/arm/tcg-target.c.inc | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 344b0d3199..8e5b304a5a 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -165,7 +165,7 @@ extern bool use_neon_instructions;
 #define TCG_TARGET_HAS_shi_vec          1
 #define TCG_TARGET_HAS_shs_vec          0
 #define TCG_TARGET_HAS_shv_vec          0
-#define TCG_TARGET_HAS_mul_vec          0
+#define TCG_TARGET_HAS_mul_vec          1
 #define TCG_TARGET_HAS_sat_vec          0
 #define TCG_TARGET_HAS_minmax_vec       0
 #define TCG_TARGET_HAS_bitsel_vec       0
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index f5d10e262a..d11efc553a 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -186,6 +186,7 @@ typedef enum {
     INSN_VORN      = 0xf2300110,
     INSN_VORR      = 0xf2200110,
     INSN_VSUB      = 0xf3000800,
+    INSN_VMUL      = 0xf2000910,
 
     INSN_VABS      = 0xf3b10300,
     INSN_VMVN      = 0xf3b00580,
@@ -2371,6 +2372,7 @@ static int tcg_target_op_def(TCGOpcode op)
         return C_O1_I1(w, w);
     case INDEX_op_dup2_vec:
     case INDEX_op_add_vec:
+    case INDEX_op_mul_vec:
     case INDEX_op_sub_vec:
     case INDEX_op_xor_vec:
         return C_O1_I2(w, w, w);
@@ -2735,6 +2737,9 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_add_vec:
         tcg_out_vreg3(s, INSN_VADD, q, vece, a0, a1, a2);
         return;
+    case INDEX_op_mul_vec:
+        tcg_out_vreg3(s, INSN_VMUL, q, vece, a0, a1, a2);
+        return;
     case INDEX_op_sub_vec:
         tcg_out_vreg3(s, INSN_VSUB, q, vece, a0, a1, a2);
         return;
@@ -2851,6 +2856,7 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
         return 1;
     case INDEX_op_abs_vec:
     case INDEX_op_cmp_vec:
+    case INDEX_op_mul_vec:
     case INDEX_op_neg_vec:
         return vece < MO_64;
     default:
-- 
2.25.1


