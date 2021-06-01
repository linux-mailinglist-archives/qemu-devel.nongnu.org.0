Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 677E7397628
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:10:28 +0200 (CEST)
Received: from localhost ([::1]:59250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo62B-0001T0-Ga
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:10:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tV-0002Nf-HM
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:25 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:38553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tT-0002Zu-0S
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:25 -0400
Received: by mail-il1-x131.google.com with SMTP id j30so13205796ila.5
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 08:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UosV5sxdXxQ2MSx1gwFbY/FjcVzrPmGhgqIDG9KDNZ0=;
 b=Ll0e12CpMMptDL1gM7CF+afLF1vVfk6ReC45/3/O4P/FwnkzTRUY4HkVkcbDdC9dhw
 WLjS3w/qY6dH9JI7/nMgCOltzkXYI2yedDz8VbB28+7hBb14lpNo+30Epa6NKbG4tg7P
 6p+qJg8MgJs/fSMz14ZG+h422KzGA6DO3aGK8Ynj5haqNyDzaHcpc9NCHtfqY33mTtJ7
 bwh0OpWQ7cbQKVhuMOQQv0KgHeRWPo+YTuqoL7OExaTwvAU5GQMu7CMf9Zw/3Eaz1N6W
 NMelgvbIl0JLSMqhQ9wxnfRUGtzZuNbudsDCtOQ/r4u/UF7fCHVIPiKBjoKkLsECJqUS
 D27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UosV5sxdXxQ2MSx1gwFbY/FjcVzrPmGhgqIDG9KDNZ0=;
 b=DBG3jI8dwD4d3yEGLdmiqvzW4rUfVH66sH+mn9RMibycwrt4gjQTO6E+WX3w7KdmSG
 drcjiGBKS1gM2hyFjZM7mzwMX7C3X5yr/wJU63Twom0iUc7t0r41G+LSEWsT6FTeqC2I
 n4Lf0cOoUlBHE6W5SATjnWi+fltUFmPxd3ewAswY+Xrl3vR8bdOlcLMM7YE7cBhwBcV5
 vK2P6RfoJ4ShF0KZpzi7GsJzzb+yrq112wskffZzhcVxJcwll9fHqiDcJu5l5DNAQsLk
 8Kiw7zhn3e25Ovc7C34DmuAYZQCSkkDXN6mVM4ADAnJaQ3hgTEtXpq8WW/4WCE58Uabm
 Zkyg==
X-Gm-Message-State: AOAM533tP5hXzv7nwIQ8iXGnMhA1pZ8etg4j1JcYPv5cbQDDO+Sjcopq
 REtyVO7Yh2fHO07LAKT7MtPrdz+RFfAagj8w
X-Google-Smtp-Source: ABdhPJweFHnP4X4Oth3kHomlAlk5dAxADgxHXVwz+gND3Io8bXRNHUpsiqnK6OBoWlPZvGQ/RtKdxQ==
X-Received: by 2002:a92:c842:: with SMTP id b2mr5494036ilq.172.1622559681937; 
 Tue, 01 Jun 2021 08:01:21 -0700 (PDT)
Received: from localhost.localdomain
 ([2607:fb90:806c:3e8a:9cf0:b3be:5e07:b99f])
 by smtp.gmail.com with ESMTPSA id f8sm4109909ilj.37.2021.06.01.08.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 08:01:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 09/27] tcg/tci: Improve tcg_target_call_clobber_regs
Date: Tue,  1 Jun 2021 08:00:48 -0700
Message-Id: <20210601150106.12761-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601150106.12761-1-richard.henderson@linaro.org>
References: <20210601150106.12761-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x131.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current setting is much too pessimistic.  Indicating only
the one or two registers that are actually assigned after a
call should avoid unnecessary movement between the register
array and the stack array.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index ee6cdfec71..fb7c927fdf 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -812,8 +812,14 @@ static void tcg_target_init(TCGContext *s)
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


