Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B413D4F3F
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 19:45:54 +0200 (CEST)
Received: from localhost ([::1]:36600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7iCG-0005FY-OL
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 13:45:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7iAd-0003ub-Cq
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 13:44:11 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:40528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7iAb-0006Py-Q6
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 13:44:11 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 z8-20020a1c4c080000b029022d4c6cfc37so6657301wmf.5
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 10:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W790QlvERPMT3GyGM+xkfX+d60Mt7d5YaSYrUzQFl4w=;
 b=gjh60luGdb6xZ7fdcgELoFGiVwEXWKy8pKSuE2i2vRtqR264aZvZS6M+uQQ9sIzIJn
 MUBgZNB9geTeE3M6VY6ZuEkLjC+WfuXQmr/lRjtSkBBHmxIjjaUk+oSSvPQMq7EU2tjU
 5/M4V45D0g5r9skQNwbotAwsSIaGbyufWERtYNhGqMbDdZQfsqGDSwCzdJjVQZ6edNbk
 lrplNZRlSFgDvIgh1FwUsp1mUwxLgmcIBGyTveX6Sfb2rsqF+iVvlheyEhKGJELMAidI
 16TQscdvu0nPu6KrTDdVjkRp6w/vHl6kOduHRt6q2+JQZqEFCORx3wuBrlSATFqZb9dH
 YEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W790QlvERPMT3GyGM+xkfX+d60Mt7d5YaSYrUzQFl4w=;
 b=dqYwtfPuyWWxfQKmt0/y6Bqqi/J/wU/mf3rEjYclTbCst9DseTS+ji+2LjiLXD24pn
 EJQlZVA+QlXgO3TZP/AED6cRipLMPl36puSk7n0J0asYyC4G/WrDlCptJukBY8zeotxV
 X/KkTXBgyZB9Uq65yWfchMseHNcxbxb11yeLUVvYhtg9HS4CzXm4zqaI+mOBFpdPR6H2
 svHvVotR9ZaNU7JTEPHbZiShxmN/EPj6LLswqTbWN240bni6pidyHCOiE8p2EuhxbUbh
 mmSrbU64U40YA3khJETy5Qr036U2KKWK3JIYosgVbz2i4JfF3Zg5gJijL9geSc9LOxBK
 CACw==
X-Gm-Message-State: AOAM5316UrjRlaOyph9tpiZWtVzNIXucPJSroXndN47T8Gv4DTyLEMbG
 kbVxsjjC6nlaQT4ZyiH5Lr8ZYpP4hbfqeQ==
X-Google-Smtp-Source: ABdhPJxvZoZr06OTrPL8MCrJS7qjKDp4Tl2XIM3MOl0Zjo5WyobpYBZznIabKf5PVOOoX7ZgUdy+CQ==
X-Received: by 2002:a7b:c111:: with SMTP id w17mr23432975wmi.163.1627235048257; 
 Sun, 25 Jul 2021 10:44:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m15sm33666655wmc.20.2021.07.25.10.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 10:44:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 1/2] accel/tcg: Don't use CF_COUNT_MASK as the max
 value of icount_decr.u16.low
Date: Sun, 25 Jul 2021 18:44:04 +0100
Message-Id: <20210725174405.24568-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210725174405.24568-1-peter.maydell@linaro.org>
References: <20210725174405.24568-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In cpu_loop_exec_tb() we were bounding the number of insns we might
try to execute in a TB using CF_COUNT_MASK.  This is incorrect,
because we can validly put up to 0xffff into icount_decr.u16.low.  In
particular, since commit 78ff82bb1b67c0d7 reduced CF_COUNT_MASK to
511 this meant that we would incorrectly only try to execute 511
instructions in a 512-instruction TB, which could result in QEMU
hanging when in icount mode.

Use the actual maximum value, which is 0xffff. (This brings this code
in to line with the similar logic in icount_prepare_for_run() in
tcg-accel-ops-icount.c.)

Fixes: 78ff82bb1b67c0d7
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/499
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 accel/tcg/cpu-exec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index fc895cf51e4..6e8dc291197 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -834,7 +834,7 @@ static inline void cpu_loop_exec_tb(CPUState *cpu, TranslationBlock *tb,
     /* Ensure global icount has gone forward */
     icount_update(cpu);
     /* Refill decrementer and continue execution.  */
-    insns_left = MIN(CF_COUNT_MASK, cpu->icount_budget);
+    insns_left = MIN(0xffff, cpu->icount_budget);
     cpu_neg(cpu)->icount_decr.u16.low = insns_left;
     cpu->icount_extra = cpu->icount_budget - insns_left;
 
-- 
2.20.1


