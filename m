Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCE35784C6
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:06:05 +0200 (CEST)
Received: from localhost ([::1]:41554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRNr-0002Iy-SH
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDRHU-00023v-84
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:59:29 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDRHS-00039t-KY
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:59:27 -0400
Received: by mail-wr1-x433.google.com with SMTP id n12so4335839wrc.8
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 06:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4XCUImSLdHKkyI8geHYTH1ofyLU9VSFDcDRAFOqUvzE=;
 b=Uz0iQXzehnlIPq2NrFZu/wrxZjSvY5RsdfpS8Q1d7P1memboTsMpQgQG5DtlBOX0qa
 9gb5kqfRW2mfzxoC/T3tiHmLrYpHqLtLVhcYBBf1jAGTr1gLT6iPOyvqA9L1xHE7cRNT
 0VydP1nwY0901ouUYNUXwGsNz4PI0vVrJBSWWxq/28ED1pMC/5Lyvgm7Kkw09fUd0gu2
 G4bNqgUiKKcyrwizjz/hY769F5CmtQOoURkUaB9A8Q7/3dVgZnuRzhMq9XQsXN+012OI
 UGZ1D/ecpBeHfgco+renZH2+0YzaGBNEUFiYlZ3Y0Xhf8tmUqdmwA07qiXCPUgY2157C
 6+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4XCUImSLdHKkyI8geHYTH1ofyLU9VSFDcDRAFOqUvzE=;
 b=IM4OmWpYuZNQ34m/JH2CddKDh+kF39vfsKZQ5v3Zy3IaxgugYLq85ABqTBhdpjsfEH
 6tdRKZNMSO5w5QUJIIDLI2hC1Ns0sCDa5HyTig1DNgVujOupyiUAYHy38I8vuPAHzoJv
 GdLQxkCwQb6eJEYstI8MGusyIuzlPiwUXYSEoiMc6XMLgqgcameM7YE5hqvYSnJRf3uk
 eatAwcFyV8Bu4GGMfKp/82xgT1B4rxiQ9bUGNPl+QYsxtEjv6A4Nah3CSOeLhaF7wy+G
 IFAMqUmiV6Lh+0pJPE6evUhrcdbmUFUtNrFrKlk3GkdYThPHFHx9AkxZRVPpnGOgzYXM
 gAyA==
X-Gm-Message-State: AJIora9VOJ6CmGRG/46Ve5NVYBhZOv7BtgxgbQ5ZGnQPQARs9VbDNeG0
 8gtqwcUYWro1BLqpy0Z6MHEwD1tmZMxIjA==
X-Google-Smtp-Source: AGRyM1vNtlARFa0LmGUN9Yb5OJxa3G/yGPpeMK9SpyLovU3LioSTojOwhYRiWqstj1AS7zyMI92TkA==
X-Received: by 2002:a05:6000:1e04:b0:21d:7ec3:fe5a with SMTP id
 bj4-20020a0560001e0400b0021d7ec3fe5amr23319088wrb.116.1658152764826; 
 Mon, 18 Jul 2022 06:59:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 id15-20020a05600ca18f00b003a31f1edfa7sm1805798wmb.41.2022.07.18.06.59.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 06:59:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/15] hw/intc/armv7m_nvic: ICPRn must not unpend an IRQ that
 is being held high
Date: Mon, 18 Jul 2022 14:59:06 +0100
Message-Id: <20220718135920.13667-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220718135920.13667-1-peter.maydell@linaro.org>
References: <20220718135920.13667-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the M-profile Arm ARM, rule R_CVJS defines when an interrupt should
be set to the Pending state:
 A) when the input line is high and the interrupt is not Active
 B) when the input line transitions from low to high and the interrupt
    is Active
(Note that the first of these is an ongoing condition, and the
second is a point-in-time event.)

This can be rephrased as:
 1 when the line goes from low to high, set Pending
 2 when Active goes from 1 to 0, if line is high then set Pending
 3 ignore attempts to clear Pending when the line is high
   and Active is 0

where 1 covers both B and one of the "transition into condition A"
cases, 2 deals with the other "transition into condition A"
possibility, and 3 is "don't drop Pending if we're already in
condition A".  Transitions out of condition A don't affect Pending
state.

We handle case 1 in set_irq_level(). For an interrupt (as opposed
to other kinds of exception) the only place where we clear Active
is in armv7m_nvic_complete_irq(), where we handle case 2 by
checking for whether we need to re-pend the exception. For case 3,
the only places where we clear Pending state on an interrupt are in
armv7m_nvic_acknowledge_irq() (where we are setting Active so it
doesn't count) and for writes to NVIC_ICPRn.

It is the "write to NVIC_ICPRn" case that we missed: we must ignore
this if the input line is high and the interrupt is not Active.
(This required behaviour is differently and perhaps more clearly
stated in the v7M Arm ARM, which has pseudocode in section B3.4.1
that implies it.)

Reported-by: Igor Kotrasiński <i.kotrasinsk@samsung.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220628154724.3297442-1-peter.maydell@linaro.org
---
 hw/intc/armv7m_nvic.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 13df002ce4d..1f7763964c3 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2389,8 +2389,15 @@ static MemTxResult nvic_sysreg_write(void *opaque, hwaddr addr,
         startvec = 8 * (offset - 0x280) + NVIC_FIRST_IRQ; /* vector # */
 
         for (i = 0, end = size * 8; i < end && startvec + i < s->num_irq; i++) {
+            /*
+             * Note that if the input line is still held high and the interrupt
+             * is not active then rule R_CVJS requires that the Pending state
+             * remains set; in that case we mustn't let it be cleared.
+             */
             if (value & (1 << i) &&
-                (attrs.secure || s->itns[startvec + i])) {
+                (attrs.secure || s->itns[startvec + i]) &&
+                !(setval == 0 && s->vectors[startvec + i].level &&
+                  !s->vectors[startvec + i].active)) {
                 s->vectors[startvec + i].pending = setval;
             }
         }
-- 
2.25.1


