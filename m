Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF633D3D8A
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 18:26:19 +0200 (CEST)
Received: from localhost ([::1]:55996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6y0A-0008FH-6g
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 12:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6xvu-0008Vj-VU
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:21:54 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6xvt-0000mD-3G
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:21:54 -0400
Received: by mail-wr1-x429.google.com with SMTP id l4so2971169wrs.4
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 09:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jtp3KRCI/WqcQZFgyWlDzbbEg7X9yExcchTvn/7fMB4=;
 b=uSG0rBN/5LXC/+w1ZA/oKc31355sHypP072dMWPEcK4OgXmO011TftO+3pbQkY/PvO
 z7Jfz3V+MrN/s2fVLple/sxHVBo0fkUmxwUX9VuqmeCxEyAL1M7BkR8ReOTFK9TYTanb
 kUlxsevFG+DOuKRwOuhneofW3mRH7YfmuGlOE4z+sT1wQ8+L3ce5Du4PrPj1GMeO1pB+
 wq5ORlNkHjY8mtl/ry9jZZBCdjxx/ozNAX2zVTzrjpaxlyy0kKdA+PvlslJMxgDi7rK+
 DbCFmlwBMmCKeHMDlC+XXM8MLUu1NbgISjiKcrJGWiuqfMQwDKqKeizA/0gP05w9pz9r
 cpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jtp3KRCI/WqcQZFgyWlDzbbEg7X9yExcchTvn/7fMB4=;
 b=DspiabZuvo4wXn1xLb4VfPsrwjpF3fQg4zeukG4zxhIzr3suWTCgncYUuhFf1Fkfme
 sxIP1uMk9cof2vOSyJEr9uLjVyVe6Pp330U85spi+HEppUzm9booHNEAGQF1uyAVb4TV
 2IAXwEatfGeKeKSW18MuriZVfPgMWL70kJDhmHwzmtLfu6J1huogsFC1Y5a7b272ffc9
 X9cfOdui4v3NmHA62VOuNTSl2B93+dihARfkv1WetwqmUBEi+QG16lqJ+Ui/T7aZ/PQZ
 4zTq4ekfv5fjiefZlIXZvPpUAZJ2TD4XiRj4F5RoW3kelNIVg94P9KO2Hqp0YII6A48c
 TRmw==
X-Gm-Message-State: AOAM531OGk6VBkfexci+KwjYbWJHxpBGzthF/Qvpq9GAUvPWMaHlDsjF
 C0wqtHDvJjZS6NXTBqFw1LtTVA==
X-Google-Smtp-Source: ABdhPJxUJhizYLBzeg6sqLQe0ETFttIB8ezMd1EIAeqZxlUyIHF56Thde9JeA31gfndQEtBoUUPQZQ==
X-Received: by 2002:a5d:53c5:: with SMTP id a5mr6264256wrw.15.1627057311454;
 Fri, 23 Jul 2021 09:21:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm5721416wmi.33.2021.07.23.09.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 09:21:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.1 4/6] hw/intc/armv7m_nvic: ISCR.ISRPENDING is set for
 non-enabled pending interrupts
Date: Fri, 23 Jul 2021 17:21:44 +0100
Message-Id: <20210723162146.5167-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723162146.5167-1-peter.maydell@linaro.org>
References: <20210723162146.5167-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The ISCR.ISRPENDING bit is set when an external interrupt is pending.
This is true whether that external interrupt is enabled or not.
This means that we can't use 's->vectpending == 0' as a shortcut to
"ISRPENDING is zero", because s->vectpending indicates only the
highest priority pending enabled interrupt.

Remove the incorrect optimization so that if there is no pending
enabled interrupt we fall through to scanning through the whole
interrupt array.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 94fe00235af..2aba2136822 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -127,15 +127,14 @@ static bool nvic_isrpending(NVICState *s)
 {
     int irq;
 
-    /* We can shortcut if the highest priority pending interrupt
-     * happens to be external or if there is nothing pending.
+    /*
+     * We can shortcut if the highest priority pending interrupt
+     * happens to be external; if not we need to check the whole
+     * vectors[] array.
      */
     if (s->vectpending > NVIC_FIRST_IRQ) {
         return true;
     }
-    if (s->vectpending == 0) {
-        return false;
-    }
 
     for (irq = NVIC_FIRST_IRQ; irq < s->num_irq; irq++) {
         if (s->vectors[irq].pending) {
-- 
2.20.1


