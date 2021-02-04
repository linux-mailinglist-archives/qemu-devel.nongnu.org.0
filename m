Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE2D30EA32
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:31:12 +0100 (CET)
Received: from localhost ([::1]:38306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UQJ-0005x0-Tu
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:31:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tjh-0006Cl-F2
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:12 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:36058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tjd-00048r-DR
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:09 -0500
Received: by mail-pl1-x634.google.com with SMTP id e9so898042plh.3
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YQBNB7jLXwaZJSYBL0BvoU6n3wPE6zwxayv+Hpeg13U=;
 b=uXpTlARhhPLGPSnuVDZU8sjiGNGdW5EXwqXne5QuPo2m5mq4baN+1dAVNZeyRC8ldl
 gwbfi/jhdkTsxiIPppl9gDL591Gr4BIOD9+EqsoHuxnHySXDo5KdFZvHU0uExJLDOOOb
 0kTOH7fDtAkLYStcfaB3DvPYckJ9b00LKS4J6ytMQzwgH/UvGIv7fUWpTFhLkiPUxKMY
 hjRu4057ezcvufKh+gs0oId5SI9YErJR4jwz+cE6FLe89mWIpxfkuzXbYGid6rMD4M9/
 IDVjLc6m6dwHmurHvrqbM+bqL2D8CfLixz60iMciKyWoAkKXhPRLFcCl8eBqT9BxktqO
 972g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YQBNB7jLXwaZJSYBL0BvoU6n3wPE6zwxayv+Hpeg13U=;
 b=r9o0Jeau9sDbuYZLpO2MwG/c9rpkZkrzKtyvj5E7/FSYfgHk9CK2aT6KeeimjJldxM
 TKnMTcrEurEvu6UMRqhWiUYe1D72WQgBJcQwIVLvYeswb1BH+mEHcmdJHDfgMv1h1/lU
 JoS92c0HInOGlHBCcmzOYFl6HQFwHWaQsAg8kQ99eVYbwBzXCzLJxGUCxVF0+vghjI6o
 Tu/MtjwX8wsiHqbvkCbUTE91MT5lk2yMX9H4Di6ZT7jvjCR4UBxiZOz6E1Nj1GDBlj84
 lm7v179hbbV2e5gE8iZxnnyfTsBLX7cy0HR5qp245HPCQMsbNGwu1+gsf725YQg41XCT
 Lqag==
X-Gm-Message-State: AOAM531mn4Ew2O+MpbdOq8qZcBwqcUEYFC3QT7DX1sGVA7SXCrEcD9qG
 8EcIDjtcppytcVy3eNePNJo1OggtymkNELrs
X-Google-Smtp-Source: ABdhPJySFzIeHZqIVVrCLVi8EQ/TnsUOn3bhbG73BG+r3sO5lcmFTCa572TXbrSMgTzvIdDBky0yBw==
X-Received: by 2002:a17:902:70c3:b029:de:af88:f17e with SMTP id
 l3-20020a17090270c3b02900deaf88f17emr5777031plt.3.1612403224131; 
 Wed, 03 Feb 2021 17:47:04 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:47:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 64/93] tcg/tci: Improve tcg_target_call_clobber_regs
Date: Wed,  3 Feb 2021 15:44:40 -1000
Message-Id: <20210204014509.882821-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

The current setting is much too pessimistic.  Indicating only
the one or two registers that are actually assigned after a
call should avoid unnecessary movement between the register
array and the stack array.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 8d75482546..4dae09deda 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -623,8 +623,14 @@ static void tcg_target_init(TCGContext *s)
     tcg_target_available_regs[TCG_TYPE_I32] = BIT(TCG_TARGET_NB_REGS) - 1;
     /* Registers available for 64 bit operations. */
     tcg_target_available_regs[TCG_TYPE_I64] = BIT(TCG_TARGET_NB_REGS) - 1;
-    /* TODO: Which registers should be set here? */
-    tcg_target_call_clobber_regs = BIT(TCG_TARGET_NB_REGS) - 1;
+    /*
+     * The interpreter "registers" are in the local stack frame and
+     * cannot be clobbered by the called helper functions.  However,
+     * the interpreter assumes a 64-bit return value and assigns to
+     * the return value registers.
+     */
+    tcg_target_call_clobber_regs =
+        MAKE_64BIT_MASK(TCG_REG_R0, 64 / TCG_TARGET_REG_BITS);
 
     s->reserved_regs = 0;
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_CALL_STACK);
-- 
2.25.1


