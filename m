Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8814630D150
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 03:19:06 +0100 (CET)
Received: from localhost ([::1]:55790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l77l3-0000nJ-Iq
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 21:19:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77i2-0007VB-AQ
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:15:58 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:40849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77i0-0000w3-PS
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:15:58 -0500
Received: by mail-pl1-x62b.google.com with SMTP id y10so9333469plk.7
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 18:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/S1S8UJkodH9Fn5r/TRF3MeCOBnFTM9S6Ep0lCvcNE8=;
 b=qv0eFzL/bbjM2kykyYm6U5ibtnMeKX2wFgGt149kmoKf07/j6WAsRjqKxb+/2TG+mn
 20avvfAcJISdQgK7IDJIpHNCJRUcfyBIQa7oxvVRKa3Yr2mGKbUh5lKcZaajpJX+PF3B
 LPuQV43aJ2UkI8bMt9N64J0nJHCVEAU8pW40VJQVw1WuYpQPT+gEK6G/J2ve5c/P+rhF
 E14+GEyvWNyYfKAJ6bR0AcDmonDoNlnnSDghUQq8yj0D4Rq+FZ71Jp0cR0iBuld7TFMc
 vGIG0EoqXYKEV0Lb01KUjhivqj1Esosmm/XcTvl8KW35RrH7zF2Mq7M/oOj2uDpALLlC
 zOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/S1S8UJkodH9Fn5r/TRF3MeCOBnFTM9S6Ep0lCvcNE8=;
 b=cwqF4PIqxPAw6lux6PevDebFXWuI1E9msWfUhOMxeVXv8OXCguAW+pnXSPoogukJDP
 KTwyLqEPE6KogNGOxx67/vvXYq6O88XaWJyKhoTtaLXssV21GCa9R2sWz2mhMhRVDt2d
 3BRySw4KhPYQfMxxIvIPz986rHyBUlbXhszDfu2rUjFaR6OZitscAPASy60l59DyLnxh
 4w0Z7V5wO0tLeDJflUnnvikVaZvorVL768YiQl8v5Ot/pE30sMgqEUjH8qyIG+g3Z9gM
 V2x5QQY99gwdCBZzbnjE5MJKvddloiN1aAxKT56ohuM7uokMvOnc9VlQ3lRxl0QIGz3a
 gEFg==
X-Gm-Message-State: AOAM5320lL39ymUiMzg0FvBpM1A7Bv6YjqS1UVxR0T7WfIWlWLpLHlHO
 wUXmGQ2gC7RyUE9j5xtUQ3im/vEsiSM3hsjR
X-Google-Smtp-Source: ABdhPJyJSZ65jnGzr7z/0Wn1bxm3aKd9K4aXbOH3IJh1Opa/xzLqzGjDRwJV9uJUavdOSQiPUCcCVA==
X-Received: by 2002:a17:90b:124c:: with SMTP id
 gx12mr795138pjb.21.1612318555571; 
 Tue, 02 Feb 2021 18:15:55 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id x1sm270301pgj.37.2021.02.02.18.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 18:15:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/24] tcg/tci: Drop L and S constraints
Date: Tue,  2 Feb 2021 16:15:27 -1000
Message-Id: <20210203021550.375058-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203021550.375058-1-richard.henderson@linaro.org>
References: <20210203021550.375058-1-richard.henderson@linaro.org>
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are identical to the 'r' constraint.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 15981265db..9c45f5f88f 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -46,11 +46,11 @@
 # define R64    "r"
 #endif
 #if TARGET_LONG_BITS > TCG_TARGET_REG_BITS
-# define L      "L", "L"
-# define S      "S", "S"
+# define L      "r", "r"
+# define S      "r", "r"
 #else
-# define L      "L"
-# define S      "S"
+# define L      "r"
+# define S      "r"
 #endif
 
 /* TODO: documentation. */
@@ -390,8 +390,6 @@ static const char *target_parse_constraint(TCGArgConstraint *ct,
 {
     switch (*ct_str++) {
     case 'r':
-    case 'L':                   /* qemu_ld constraint */
-    case 'S':                   /* qemu_st constraint */
         ct->regs = BIT(TCG_TARGET_NB_REGS) - 1;
         break;
     default:
-- 
2.25.1


