Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0FD3AE191
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 03:54:59 +0200 (CEST)
Received: from localhost ([::1]:36630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv99O-0001C2-5d
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 21:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8qH-0004IH-HY
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:35:13 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:41817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8py-0005E0-BH
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:35:13 -0400
Received: by mail-pg1-x52b.google.com with SMTP id u190so8992393pgd.8
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 18:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W7Bf8v32MRSYl5delt6pF1CYpdgvOX/1OeFQMhwwhYo=;
 b=uPo1F653pu/v64dvBtaGFaYvjNeszL19xjF1FfzQG11B6Kh45t6gXWecaco/YQQKuf
 3BCwYNAm53dsCmz47JDp4E4Njo2dYmRcLVHr/BNivtmC94WJKdTGN9ibrPrp1336jSkf
 MddRReDTEH+aahsLJB88H9XWC3ghItCVI9hjSnzmlUOkK6KlNJtnxzK6vP+Wn6E0NfPU
 n8Ehl5o7O33Ak8dIV8i0Rnslfr/N9+Zr2w0m+GAcRPWDWkTAZ/vxcLfGoYAY9Toy5/jl
 rC+MKhszn0pGpLaVTaxVliNsMdNi5+nK5y0xZav6oYaFxPTZGV3Mb+EVMKFdNdXwTCS7
 a9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W7Bf8v32MRSYl5delt6pF1CYpdgvOX/1OeFQMhwwhYo=;
 b=Ae50Xj2ry5o6WV55y3ydm6ExVzyRbAIEgizkOMBqzgYcuEiqzl8nLXujYiRDGYsBhM
 qJ7o5nKu+trAV+MA6myMZTXFfEQToz0+s8Mnfg0DP1KUbj8EKIYoHaMK0mH+Ax5m30et
 a4uGxn9FNU5AqadPYBsTLBLNIKtl0sPfwPdYpr8PpWlzJ0f97hiZv7sByuc9Fr4bdMaH
 /I60qZMa3T2mZ2fQ8J6UAdJqFEyEScZSSzhKie3s/fImWnScLdwhVCjaXeiNSeGC6ZpH
 UtC/MiVOKOCO54RA9w8ZlQALUlQ7Cx0nRL+4zlE4H+5508u1SyWB33S2CeiPdqlbyUe1
 BgcQ==
X-Gm-Message-State: AOAM530SY+csZBEGGKq+wdoiM1aWBRs1Te0fTHGCqasHHTM4wob/7604
 rXbwaF2tLu6cW5uHgN4FL1zaOZSdqq8SGw==
X-Google-Smtp-Source: ABdhPJzVL/bYWp5xLJkWHwFQyDD2XNW7G1ftZBeptpCGbwNMVPIxR4+vTxrnAxcva+xEpSG6lDexwQ==
X-Received: by 2002:a63:f19:: with SMTP id e25mr19190574pgl.278.1624239291985; 
 Sun, 20 Jun 2021 18:34:51 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s27sm1495628pfg.169.2021.06.20.18.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 18:34:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/26] target/rx: Use translator_use_goto_tb
Date: Sun, 20 Jun 2021 18:34:32 -0700
Message-Id: <20210621013439.1791385-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621013439.1791385-1-richard.henderson@linaro.org>
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just use translator_use_goto_tb directly at the one call site,
rather than maintaining a local wrapper.

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/translate.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/target/rx/translate.c b/target/rx/translate.c
index 9ea941c630..2443406de5 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -143,18 +143,9 @@ void rx_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     }
 }
 
-static bool use_goto_tb(DisasContext *dc, target_ulong dest)
-{
-    if (unlikely(dc->base.singlestep_enabled)) {
-        return false;
-    } else {
-        return true;
-    }
-}
-
 static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
 {
-    if (use_goto_tb(dc, dest)) {
+    if (translator_use_goto_tb(&dc->base, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_i32(cpu_pc, dest);
         tcg_gen_exit_tb(dc->base.tb, n);
-- 
2.25.1


