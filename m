Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0F06A4F7E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 00:05:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWmVV-0000EY-E7; Mon, 27 Feb 2023 18:02:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmVK-0007xQ-RR
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:02:01 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmVH-000160-RK
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:01:57 -0500
Received: by mail-pl1-x62b.google.com with SMTP id bh1so8468581plb.11
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 15:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BdnIrBC/vjhypfMOEhRm01STyDVGWe2QDHvXiznUOKk=;
 b=TJrGn2ZWEhXVIu936f+7Yx3wEJHuml2EvqSC2JEYKiyGyhS9x2yWfuBeZ3jw1QdLYe
 dneVW4I2ZhsYA4PHG1Zcj8gwiobVjg4TXDpht3Uw1i4RUCl2ZXnfdL+EUGfXXcsPlLtQ
 dPLkVGvVEgHyvoXPzYy3tjpmfyQRdYBnqf/tLBIwFnCFxP7J0f5wlMRu7oYm8qs2Ll/K
 KHSBML1CZlxh5TDFDjBk3kYGh8O3J+HRzyylGETkhTGGIYuuHLzPjmf1AA5w01ZovBD3
 5nDGhsJ29yezKdL2E2VZrCVdTdsXsfPZkirVbgSvjWmBBOcJbnSle6hoq+yL/bsKXBqy
 xeYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BdnIrBC/vjhypfMOEhRm01STyDVGWe2QDHvXiznUOKk=;
 b=CZlVseO0SlDVz/pfx3ajC0hXbIMg5xtY6fN83QGARjqmS5FoDgzkSmvOtSDzQupK2L
 qZz/BvyKz3NStUp9g09oipSgMDqGPe5bjAPbcXX+WxyapUUVQdthJP9IS7uGZ+0UGb8q
 OaPt5Ykcj36Srl/GhOJkox/ICO/bb474LV7OmDrbLrOyJis2uM6TMZknxvoP1fxRv0IK
 XrD24J0fAIT5rhBPeGVTda7cS0WcPhKslSyF/xta68QbxKep5eN27Db16I2MBLsXVZRh
 VwSZ2v0IyMcZBbAc0h6Yvh9IltoipBrW/wuOOpEm79EnQR0/hH9X08KWdEDB0YAOD2aE
 dDOg==
X-Gm-Message-State: AO0yUKU/xGh+nG7I01TpKIbskOQTeiypOIVJC4wiuXcfyTD67nwtfPG+
 6aA3e37wsoIfUHXx736op/5SI8Mj18USny469/A=
X-Google-Smtp-Source: AK7set9BA0ntFTNwxCf4D/xN/E2xUkFQd4BiLug6kOFhXOpeDWN4lhDjMLsea0DXAnEFYHx4zmSEKw==
X-Received: by 2002:a17:90b:1805:b0:234:b2a:8251 with SMTP id
 lw5-20020a17090b180500b002340b2a8251mr1002546pjb.0.1677538913237; 
 Mon, 27 Feb 2023 15:01:53 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a637902000000b0050301745a5dsm4406130pgc.50.2023.02.27.15.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 15:01:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-8.0 v4 17/21] target/arm: Add GPC syndrome
Date: Mon, 27 Feb 2023 13:01:18 -1000
Message-Id: <20230227230122.816702-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227230122.816702-1-richard.henderson@linaro.org>
References: <20230227230122.816702-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

The function takes the fields as filled in by
the Arm ARM pseudocode for TakeGPCException.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/syndrome.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index d27d1bc31f..62254d0e51 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -50,6 +50,7 @@ enum arm_exception_class {
     EC_SVEACCESSTRAP          = 0x19,
     EC_ERETTRAP               = 0x1a,
     EC_SMETRAP                = 0x1d,
+    EC_GPC                    = 0x1e,
     EC_INSNABORT              = 0x20,
     EC_INSNABORT_SAME_EL      = 0x21,
     EC_PCALIGNMENT            = 0x22,
@@ -247,6 +248,15 @@ static inline uint32_t syn_bxjtrap(int cv, int cond, int rm)
         (cv << 24) | (cond << 20) | rm;
 }
 
+static inline uint32_t syn_gpc(int s2ptw, int ind, int gpcsc,
+                               int cm, int s1ptw, int wnr, int fsc)
+{
+    /* TODO: FEAT_NV2 adds VNCR */
+    return (EC_GPC << ARM_EL_EC_SHIFT) | ARM_EL_IL | (s2ptw << 21)
+            | (ind << 20) | (gpcsc << 14) | (cm << 8) | (s1ptw << 7)
+            | (wnr << 6) | fsc;
+}
+
 static inline uint32_t syn_insn_abort(int same_el, int ea, int s1ptw, int fsc)
 {
     return (EC_INSNABORT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
-- 
2.34.1


