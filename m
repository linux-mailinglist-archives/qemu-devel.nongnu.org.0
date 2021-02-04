Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B08E30EA79
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:55:53 +0100 (CET)
Received: from localhost ([::1]:51056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UoC-0002Pp-Af
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:55:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TsA-0008Tw-KI
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:55:55 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:38900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Ts9-0006kr-2r
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:55:54 -0500
Received: by mail-pj1-x1031.google.com with SMTP id l18so836523pji.3
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j84CVB2/9NSVvHC05jyj/ExvjNOevKnlsYLw94URCgw=;
 b=ZuUkcMSw6Kg/ha7AJdzh+FWdLdVkv2o9xXbKFKN0HE8XiQkild0h2Z0tiK+ng4Aar1
 a4vxG/5pw0H4ZhQ+qqwq5CzYe5frfwzEc6ajirzRwRc/pYUexUauY1+gC3dfNSk2JRg/
 obGic6BWE9i6VvYrzBi2U31coZGZ+EN85yOucLX0OAuSURKCRvf1AsxqDUE85PCJrOJN
 4+AsXE2bx+mszqugC5IRKwnobORGkjY0G0QuEDp1FC7rEdRqpvJmWBATGHDSDbdJD6Mj
 XEjQoxzg0rl3oQ2BE2TnN30K6+enHp1td/Wf/4UdGTOk4zkxNsUPxzTnIAfrPO85fBjj
 sENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j84CVB2/9NSVvHC05jyj/ExvjNOevKnlsYLw94URCgw=;
 b=ELZcMMMMMEuj69lZDtUCh9hk118tFSK4LLCbiFxKtqu4CvVaQt7FdsfXu7IPaf2xCw
 0aw3zZOLmVf12gjuL/L+Isw+KergMHoNDCkYSJzHxw1XaH+ZPYzlZqtizvzIkiYevJgx
 1LP21UipQXXXUWNhMW3Ae1410aqWE43HAFPHmlV10oQIg952EQbjz3fX8w+FPxKdBvRN
 LogIxjJ/XYQMDL66NOrIWE1z5yN1mLL3qWPrhZv9y+WtuRlcYdOBmJ5e9mLMPWtJUUgz
 d0QqfHiu6b0ZHf4XXQfUIEDyRXt3Ls8qG29w4Y3zklNh09ps+oHFpTkDwtCHMvAE/q2q
 4sxA==
X-Gm-Message-State: AOAM5326nIw1nQLVXHUujvhujOHnBYwmncIVYxAs43PmxcgD57RcaYtR
 /vPWfv0YDH1UvmXgwtW/9St31m4ZjWQAm0Il
X-Google-Smtp-Source: ABdhPJxDBf2xjHm4YXcc4fZdX9fLTSX8aUQTzEEaErQ5GRLBKGexrMDnQ6hFzuOqqtnBINvs3308gQ==
X-Received: by 2002:a17:90a:4dc1:: with SMTP id
 r1mr5967650pjl.12.1612403751853; 
 Wed, 03 Feb 2021 17:55:51 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id 78sm3588463pfx.127.2021.02.03.17.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:55:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 83/93] tcg/tci: Reserve r13 for a temporary
Date: Wed,  3 Feb 2021 15:55:48 -1000
Message-Id: <20210204015548.885449-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: sw@weilnetz.de
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


