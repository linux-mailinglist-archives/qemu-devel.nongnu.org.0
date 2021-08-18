Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0F83F0CD0
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:33:43 +0200 (CEST)
Received: from localhost ([::1]:49340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGSFq-0000wu-AZ
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:33:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2K-00081z-Pp
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:44 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:40602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2H-0006AR-FP
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:44 -0400
Received: by mail-pg1-x530.google.com with SMTP id y23so3480985pgi.7
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jNjyfYROdoiW+oB5URi9KU06Tz8MB4l7ljtYIqD7XFQ=;
 b=Z9SIfqyDsZYO2wu4hTqa5jTIW9YlfFmN9k5KGHHj48mrfTZD4XW5plU3ubAgwytkdG
 W05D4/qe+4j6F+PzwBEcbevbEHapr5YiG381r2rKpn5MuOaGG0MBLAp8V2iB9x0ErXUY
 fy5yxyH0pf+zFqeR0ctbqDmbrPmQ+xggiPiiVpaVfBfSglxxNDO92HoaqpT9qTk+ojn6
 KHsixE6qVvDzlQm0JXllPH0RWOr5sL7GC2hHElhWPOU2XCcJ1cjmxUCRJlZKBYl2UzBP
 xP9X7EUFHuGcGs/6SaI7LLbRDgUEKOx3pQR01oULXPo38IWwgqzVna1ox3hNEU18/d++
 1sfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jNjyfYROdoiW+oB5URi9KU06Tz8MB4l7ljtYIqD7XFQ=;
 b=ImI2M8wHs/BtMN6C6PKTwLADv8Lot6UnL4iP3nuVwuROg3LjpuirMzoN6qdkoT5DTU
 6S+gzxwV0+S0q9PWAkEjl/KzErL36oNDExDnTN9+m5h9DpQrVPmnrgY94J4yUl1iZj5A
 kFNwzK5JKxchBdCtPdF3D0buo8Q+kWJ/MRUKwWtzSS263RxJ41ttEHmlfyN1hQ4xAaE9
 iY/t8YenKv0uiKMcpbz3Hnya2zrkDkP8UULAyNBfLYORN127c5bRmoyH/Ys3EFmQM0tB
 w00ieuTO0l7yAl9VL6N2bbTzMQidS7Bg7QbI7X4oT4PHnK5z8AoKVaT/XsMa2lIjw/LX
 zF1g==
X-Gm-Message-State: AOAM533R/4n+Si1jln8vGOZHGbVgj60QR/2BiqKdAue7L1d+PtRzMnzG
 zaygSUWHhp+LcGIDxQ+a+wUF5Qj92bIzdA==
X-Google-Smtp-Source: ABdhPJzD+AEQ/r5wOQPzhiaAUCx+xAJuuzU3/18DPcad6qlHdpJQURQVdnbYAitkjRqF+RGl8rGatg==
X-Received: by 2002:a63:fe41:: with SMTP id x1mr10402085pgj.272.1629317980205; 
 Wed, 18 Aug 2021 13:19:40 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id x13sm619621pjh.30.2021.08.18.13.19.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:19:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/16] tcg/mips: Unify TCG_GUEST_BASE_REG tests
Date: Wed, 18 Aug 2021 10:19:21 -1000
Message-Id: <20210818201931.393394-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818201931.393394-1-richard.henderson@linaro.org>
References: <20210818201931.393394-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

In tcg_out_qemu_ld/st, we already check for guest_base matching int16_t.
Mirror that when setting up TCG_GUEST_BASE_REG in the prologue.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index b3a2cc88ab..4019c22f3c 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -2671,7 +2671,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     }
 
 #ifndef CONFIG_SOFTMMU
-    if (guest_base) {
+    if (guest_base != (int16_t)guest_base) {
         tcg_out_movi(s, TCG_TYPE_PTR, TCG_GUEST_BASE_REG, guest_base);
         tcg_regset_set_reg(s->reserved_regs, TCG_GUEST_BASE_REG);
     }
-- 
2.25.1


