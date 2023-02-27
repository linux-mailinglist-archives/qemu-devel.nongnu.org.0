Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4226A43A0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:03:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe55-0001u8-D7; Mon, 27 Feb 2023 09:02:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe4O-0000mD-7d
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:39 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe4L-0007ch-HC
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:35 -0500
Received: by mail-wr1-x42b.google.com with SMTP id t15so6329142wrz.7
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=a/LUrffyQW57nzfvUKYl3CFpJsURKsL4yXJqSOTnUyw=;
 b=iY7AT3Aq+MFTlX/QpmZBttEhj4wTBY4adRx3cneP7IomS5z1VebshN8SHmQWuCqZ2l
 lzPy82vnt8hn4eDv6N1VkvkYAg8mn8H8PYJcwUTs4DNP+kc/NIG2Uq1PPumWSJ/flWNR
 JNR9KiwNs1LzZ/yOEF4fk+tpAv0qtKf1cEJHRq8R5byUH0ZMuGxy+ou7zpXqRN282Csq
 n3QJY6SttMKbwvhsvjyT1B5qbJ1lU8pwSL9F0l2PRwCR1HzMqzL5eUUEV67s+M6Cjbbz
 W416pKRG1n6C5Gz4Ve1coUYow1yMdEcH4lcyf1wzmFxkF420hAbMflVONDI3zWhKON19
 nXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a/LUrffyQW57nzfvUKYl3CFpJsURKsL4yXJqSOTnUyw=;
 b=MTJXsDu2LcBes0cIDVSccGvZSxkSR9oJLSScq1axB/1uZsS9MPBoK5/9qx60IvcoAR
 XtcVKIOJXlo+w6Tn0sJEo+4AnuQdjVKPr8/+E+xE/ZMFYLJMadVfkiOyLcFe9UoonSPN
 LCSWk/3Y4nBVKGTiMp3zqzEFnMsritPafo7a5HPGPotT4aLzO/RCQJIE83EVeVp0Ve9U
 9wwfuGwuyl+xXi7qlZCZeNymB1DCpqJz1qzzD8tVHsKB8E3ZQorIwVPEaKmGT4bmv1U6
 iQrbPuyvjAjoLkLhulA5bcpG11UF0vulb/YbJ00AsQnyPLwOy+qIOsak1yYV1cfLtZFj
 KzWw==
X-Gm-Message-State: AO0yUKU/D8/dvrIJCFH9x3KfANw/9rbpj4e8myB/3UsAVlIX6NjpweaF
 xKCjALKl6ZJ+8rE3bdD8PVnRidZ4d+ktlJXU
X-Google-Smtp-Source: AK7set/YZ43CJ8DyAKyth9/JrwvpF0DP70wdHrSvCJ+c0fLwajYt5z+oa0kU5rhBpbZkHUgQ7oSaLA==
X-Received: by 2002:adf:f1c1:0:b0:2c5:598c:14b0 with SMTP id
 z1-20020adff1c1000000b002c5598c14b0mr20196526wro.20.1677506492100; 
 Mon, 27 Feb 2023 06:01:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a5d4249000000b002c5598c14acsm7158514wrr.6.2023.02.27.06.01.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 06:01:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/25] hw/intc/armv7m_nvic: Use QOM cast CPU() macro
Date: Mon, 27 Feb 2023 14:00:57 +0000
Message-Id: <20230227140102.3712344-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227140102.3712344-1-peter.maydell@linaro.org>
References: <20230227140102.3712344-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Avoid accessing 'parent_obj' directly.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20230220115114.25237-9-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 8e289051a40..63afe1fdf58 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -578,7 +578,7 @@ static void do_armv7m_nvic_set_pending(void *opaque, int irq, bool secure,
              * which saves having to have an extra argument is_terminal
              * that we'd only use in one place.
              */
-            cpu_abort(&s->cpu->parent_obj,
+            cpu_abort(CPU(s->cpu),
                       "Lockup: can't take terminal derived exception "
                       "(original exception priority %d)\n",
                       s->vectpending_prio);
@@ -644,7 +644,7 @@ static void do_armv7m_nvic_set_pending(void *opaque, int irq, bool secure,
                  * Lockup condition due to a guest bug. We don't model
                  * Lockup, so report via cpu_abort() instead.
                  */
-                cpu_abort(&s->cpu->parent_obj,
+                cpu_abort(CPU(s->cpu),
                           "Lockup: can't escalate %d to HardFault "
                           "(current priority %d)\n", irq, running);
             }
@@ -742,7 +742,7 @@ void armv7m_nvic_set_pending_lazyfp(NVICState *s, int irq, bool secure)
              * We want to escalate to HardFault but the context the
              * FP state belongs to prevents the exception pre-empting.
              */
-            cpu_abort(&s->cpu->parent_obj,
+            cpu_abort(CPU(s->cpu),
                       "Lockup: can't escalate to HardFault during "
                       "lazy FP register stacking\n");
         }
-- 
2.34.1


