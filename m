Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8B3371002
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 02:10:07 +0200 (CEST)
Received: from localhost ([::1]:59460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldMA2-0005IY-Af
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 20:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLy3-0007hP-9Q
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:43 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:51750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLxz-0000bk-H2
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:43 -0400
Received: by mail-pj1-x1036.google.com with SMTP id lp4so654008pjb.1
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=G/AvJFgKbey0zty4ZtRCdz1rAzrj3jVjanH+IuE7Hdw=;
 b=SZVLHl0J8RP59XVISabYPA/LHpHSJC9Bqp1NxXm8U9FM+uyDoT4OuS3J7X6k8ShnNJ
 4a984heEPoj4A95uemwTQ5lXymHCCss7Lu4PWVwnvJ+3YyZeCHAJbj6EfnXxxFjF0UXl
 NlJmhMhQE6P6j2VAOvfmWZoJqM25zorXtkW+876c7iw1qZJbZK8lfTzmZHkElXM466DE
 HhoKg7KymeZIIMgDLbE7cHISTfSPb3QFIfagYRguxmtDfMmElgXsOlzao7s8tXyVzzI6
 XO1DzmzC/fry7NJqSql7vSYmSmUGptkEr6BsFekg3/8AB0A/xu0Sg0KaBng5ij1NpfCc
 2vgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G/AvJFgKbey0zty4ZtRCdz1rAzrj3jVjanH+IuE7Hdw=;
 b=HPN2NMVX/DXR7RTR2l7UaX5rXWg6XZa4MuxFPuta/KkvKHE+IOi2m0hK2IHWc+A/24
 I6l3C719DEz/IwQ9+qIj3Wf69N3qvUPHm7CAotOj2PKKbKh564K3YS2eynnRnIROLWmP
 vZ8JIbHsjgJm2P9JSOpXdNQ06dViKHx6AS6lcQx+c11oBbznQBBRQs4yixrhgPQlA0bd
 rBJv85UQommeuRIwE7/BMQEazt+zlFaoyuF67FV4N40DP0oOSIreeVrfECtfj/XcB0Dp
 kfdtipwwPXmoY3T3jxtaKJBx8l/pzSBcbspR4rgL5U7XJbhVrnmy6oPWb/+SPOaUnKde
 VEhQ==
X-Gm-Message-State: AOAM5325ztucwRbBwc70yvB/xwS0sQnH3YKdhCPVib8KRn9uFiTtJePl
 HpLQ6+XynVtGxP4KNhxSfF9q4aE4Br+WLg==
X-Google-Smtp-Source: ABdhPJytQ3S12ThMUTbkjCP2qlRoFGFEokuTJXfR6Ae/T5nZUMs7Yxa/F3KmSDKjRC6LbStMDAfOmw==
X-Received: by 2002:a17:90a:a389:: with SMTP id
 x9mr27464437pjp.232.1619999858067; 
 Sun, 02 May 2021 16:57:38 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t184sm8098054pgt.32.2021.05.02.16.57.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:57:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 12/26] tcg/tci: Reserve r13 for a temporary
Date: Sun,  2 May 2021 16:57:13 -0700
Message-Id: <20210502235727.1979457-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502235727.1979457-1-richard.henderson@linaro.org>
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
index 9ab7916300..d80fec3488 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -822,6 +822,7 @@ static void tcg_target_init(TCGContext *s)
         MAKE_64BIT_MASK(TCG_REG_R0, 64 / TCG_TARGET_REG_BITS);
 
     s->reserved_regs = 0;
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP);
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_CALL_STACK);
 
     /* The call arguments come first, followed by the temp storage. */
-- 
2.25.1


