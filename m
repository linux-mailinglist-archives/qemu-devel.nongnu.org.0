Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1B131E116
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 22:13:47 +0100 (CET)
Received: from localhost ([::1]:57954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCU8o-0001B4-RR
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 16:13:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMp-0001rf-Q3
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:12 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:45782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMn-0007ir-H5
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:11 -0500
Received: by mail-pl1-x62e.google.com with SMTP id b8so8024653plh.12
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j84CVB2/9NSVvHC05jyj/ExvjNOevKnlsYLw94URCgw=;
 b=vEpWI1fy0sP0JYLo83buVsTAoViHBAOeXv8X6MuaAUp/MFUDs9QO92JNZ7qruRFI1q
 WWqD3X/i02OBTADliHCrl/bHQyWPSz9PCpuVOlVY30/rp9e5y8tjr2jEsfSe6Y86qn0s
 +jUG4wNpKfF0rbOyuj8fxgKe//8hUIsFhg6T4AY0JZJUWjoU/f4BFPvOoFBcFdUvnv4S
 LcbfR0T+PfJ1XFxXH4AbWL1Mp6L4GnqLG/7oBauCpEPquLCe07r99um5X/Caf2RYPQUZ
 S1YpN2lB1H1H2C3DCXf6pbRPBnYG1fH5FcDyFVZIw+itgdt4OM128vKf+FrpmkLqS7fG
 uIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j84CVB2/9NSVvHC05jyj/ExvjNOevKnlsYLw94URCgw=;
 b=a36UetQt4Rl9fJIBc9BqBeeb8usBw4rsKJusks7SPs+lv+sHPSzj5DCqBDX0K8QN2R
 m+UakEN+aJHoP81L0ohiaBshx6zAU1Eu4qqi6lrbrxdy9Fn48H0TuOE2XLgScmRL7/vl
 tKxRZht+4hl5Un5MK73zj5AL7xZmp1ORewhZP1HgBfFv5FeaVsl5Hb2siqYM+0kqZDzK
 a+Z0SUrhOwKPfKkVY+kSQb72+J6HJjvy9J0nEzgXJlr9O02+rlICIsBAAEHPPmjS+vw4
 Mwdz3Igtay3RV88WoZqGu7+lNI3lMKzkdGg7gh9ij/wYMcB0T8VmJTiD7pZHkXIc5k/Y
 Z+Nw==
X-Gm-Message-State: AOAM532nxuIGRy2uX4ovUePEIH59ePIV7LHGDpm6rtbjrKT31YxLCgip
 E2hqWECihcXWKEalcx91oHfV6pXv/jgFqQ==
X-Google-Smtp-Source: ABdhPJwmkWRg/gQ7T9xCkjK8VH2dzJrPmDxpSZQI0skCTuwEQBcNHCxpiPl1CZ+aII2WM87f/UJVSA==
X-Received: by 2002:a17:90a:1082:: with SMTP id
 c2mr524226pja.183.1613593448216; 
 Wed, 17 Feb 2021 12:24:08 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id v126sm3232038pfv.163.2021.02.17.12.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:24:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 58/71] tcg/tci: Reserve r13 for a temporary
Date: Wed, 17 Feb 2021 12:20:23 -0800
Message-Id: <20210217202036.1724901-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're about to adjust the offset range on host memory ops,
and the format of branches.  Both will require a temporary.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h     | 1 +
 tcg/tci/tcg-target.c.inc | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 4df10e2e83..1558a6e44e 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -155,6 +155,7 @@ typedef enum {
     TCG_REG_R14,
     TCG_REG_R15,
 
+    TCG_REG_TMP = TCG_REG_R13,
     TCG_AREG0 = TCG_REG_R14,
     TCG_REG_CALL_STACK = TCG_REG_R15,
 } TCGReg;
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index c2d2bd24d7..b29e75425d 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -829,6 +829,7 @@ static void tcg_target_init(TCGContext *s)
         MAKE_64BIT_MASK(TCG_REG_R0, 64 / TCG_TARGET_REG_BITS);
 
     s->reserved_regs = 0;
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP);
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_CALL_STACK);
 
     /* The call arguments come first, followed by the temp storage. */
-- 
2.25.1


