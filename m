Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BA669D6FE
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 00:27:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUFYW-0003zB-K5; Mon, 20 Feb 2023 18:26:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYU-0003sx-Jj
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 18:26:46 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYS-0000M3-Rg
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 18:26:46 -0500
Received: by mail-pj1-x102b.google.com with SMTP id pt11so3453804pjb.1
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 15:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=16mYzaWfQJouACxZdLwovOfwLxSjOAqgX/IHmcrs7RY=;
 b=Bvk251OcJAGbyvjnVS1iUWZTpk8ZIqihTDIrgBX5pCz1tLqGdqevHp0Q/l45wce+m/
 DPx5ljItbUYNmDS6DP2/osBOX0x7jqXFe7RqxkNhadrnrJcXCLptnKxhDpq6UruPOx5z
 OiCBidO76lkBjYARUYwvXaXzl3TOC5irZQVPCxHKeT7ohuK72rbemYvwAcbOwg+dZgNc
 q1TPFDtce3xrzpm/XuSNVAY5TfRhfqliW4KPhc/edsZhL7PDpFCj87mwLGDtMoZE8/48
 X27eMTscQou9Lu/gmIY4DsTsJBaMYv3Eje8RJmuakuRkPStM4bTsIdx0YptTyzAr7dQY
 GODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=16mYzaWfQJouACxZdLwovOfwLxSjOAqgX/IHmcrs7RY=;
 b=o7+uzQZdManxgtd/MBAqWIg663IkiG1ObgNEWBR/HSuK8V+aEHN0DhepXaJyhI2Fbx
 8itGmxNVnm3SbOt6EL8hlr1DovGyNZYyckWWlIVWwy8wWgY41iCCCQhzsXIr5zdBpKCO
 ERx6r9jCVb8AWMB58bGNgjGiDuYHDohqVWHoicPzFFu4Rdn9htjhakM5jQG+uTd+2UWN
 yyN6af846xiHD4hVr+ZDKmEYT06xXeK6GvFNYXsO6PDRcNeM+aQxmDlwUwWhaQEk2OzO
 5g/K8vuZsCSxK8Xqj8d3SOIRLI6fuQM7SUPE9QBnqYBka1nlXP3Tqksbvc2ZPMUWd1Az
 MAQA==
X-Gm-Message-State: AO0yUKXQExaj+v3FDqobJvZnkihspyKLjW13tIqq0PASIYLAqK4LSR3e
 bCt8pOPTVoIxRRN5TQ9GBfq7mWVqKbPioK7TAEo=
X-Google-Smtp-Source: AK7set/JRVWiR4/gR7bCYL7RIqD3ytJmswevpXmoQFYio30vKqOo9YG3VeuUUEmvzGq6p19AwXyCfw==
X-Received: by 2002:a17:902:ba93:b0:196:6ec0:345a with SMTP id
 k19-20020a170902ba9300b001966ec0345amr4157755pls.25.1676935603520; 
 Mon, 20 Feb 2023 15:26:43 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a170902690a00b001992e74d058sm2665348plk.7.2023.02.20.15.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 15:26:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 08/21] target/arm: Adjust the order of Phys and Stage2
 ARMMMUIdx
Date: Mon, 20 Feb 2023 13:26:13 -1000
Message-Id: <20230220232626.429947-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220232626.429947-1-richard.henderson@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

It will be helpful to have ARMMMUIdx_Phys_* to be in the same
relative order as ARMSecuritySpace enumerators. This requires
the adjustment to the nstable check. While there, check for being
in secure state rather than rely on clearing the low bit making
no change to non-secure state.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 12 ++++++------
 target/arm/ptw.c | 12 +++++-------
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 1b982dc94c..c9585390d4 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2854,18 +2854,18 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_E2        = 6 | ARM_MMU_IDX_A,
     ARMMMUIdx_E3        = 7 | ARM_MMU_IDX_A,
 
-    /* TLBs with 1-1 mapping to the physical address spaces. */
-    ARMMMUIdx_Phys_NS   = 8 | ARM_MMU_IDX_A,
-    ARMMMUIdx_Phys_S    = 9 | ARM_MMU_IDX_A,
-
     /*
      * Used for second stage of an S12 page table walk, or for descriptor
      * loads during first stage of an S1 page table walk.  Note that both
      * are in use simultaneously for SecureEL2: the security state for
      * the S2 ptw is selected by the NS bit from the S1 ptw.
      */
-    ARMMMUIdx_Stage2    = 10 | ARM_MMU_IDX_A,
-    ARMMMUIdx_Stage2_S  = 11 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Stage2_S  = 8 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Stage2    = 9 | ARM_MMU_IDX_A,
+
+    /* TLBs with 1-1 mapping to the physical address spaces. */
+    ARMMMUIdx_Phys_S    = 10 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Phys_NS   = 11 | ARM_MMU_IDX_A,
 
     /*
      * These are not allocated TLBs and are used only for AT system
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 6fb72fb086..5ed5bb5039 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1410,16 +1410,14 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     descaddr |= (address >> (stride * (4 - level))) & indexmask;
     descaddr &= ~7ULL;
     nstable = extract32(tableattrs, 4, 1);
-    if (nstable) {
+    if (nstable && ptw->in_secure) {
         /*
          * Stage2_S -> Stage2 or Phys_S -> Phys_NS
-         * Assert that the non-secure idx are even, and relative order.
+         * Assert the relative order of the secure/non-secure indexes.
          */
-        QEMU_BUILD_BUG_ON((ARMMMUIdx_Phys_NS & 1) != 0);
-        QEMU_BUILD_BUG_ON((ARMMMUIdx_Stage2 & 1) != 0);
-        QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_NS + 1 != ARMMMUIdx_Phys_S);
-        QEMU_BUILD_BUG_ON(ARMMMUIdx_Stage2 + 1 != ARMMMUIdx_Stage2_S);
-        ptw->in_ptw_idx &= ~1;
+        QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_S + 1 != ARMMMUIdx_Phys_NS);
+        QEMU_BUILD_BUG_ON(ARMMMUIdx_Stage2_S + 1 != ARMMMUIdx_Stage2);
+        ptw->in_ptw_idx += 1;
         ptw->in_secure = false;
     }
     if (!S1_ptw_translate(env, ptw, descaddr, fi)) {
-- 
2.34.1


