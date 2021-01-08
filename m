Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8392EF4F4
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 16:38:45 +0100 (CET)
Received: from localhost ([::1]:56328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxtqe-000647-6s
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 10:38:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtoS-0004Nu-EK
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:28 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:35885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtoQ-0002pZ-Rv
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:28 -0500
Received: by mail-wr1-x42c.google.com with SMTP id t16so9438236wra.3
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 07:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9+vWx3FqtrO6G+H4ty7no9j/6Y8/B4v8DIST+CCoA8U=;
 b=wTppJBwLhe3wao62eCltjTkNFIwMZfJgdoAkxZL08MB8Uwxr2QJLQM+Ehxx4oDs2dI
 7rgkqEMAJBBKj+POVXHEDpjWoy0AaUYbTzMeeWjLfYOP54vS+/W2ioYnLh53GjZUu+z3
 fO3+5LbEUrA9MwH5GQV+ItBsthWeR0JP44ufQp+bSRXiHWsvoS3dOEroHQnS6Adu+Kwh
 TtuhYCb1K88xKL31KC3q1cqeWBpT/po740jxs4XJTiGLutEOx4wbqqe2OLtFM7UTv8O0
 Yl5Nimv1/IqWRIKOrjI5eKTLsu31XivPmLin7dM/NU8rxyH/+C4sMn5AWzWSEKhvYU0v
 1ybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9+vWx3FqtrO6G+H4ty7no9j/6Y8/B4v8DIST+CCoA8U=;
 b=C1a4k9+O5pHwi5MThEiAimsO5bcILTZ+e5ut0d35cAF9OhidY8OAxwZM5ejZA4rUcC
 WJ16BmENE9F++rLDVA4O9FpFK78EXj1gVh1MCTxRq7qHezaxPopK2SIrg1C7Y+boQ0qC
 zllJRwjZtv4VjjYzhDQwADwX8q5YESWBFUXReSAyFNqE7PJggH2Ap3sq6RjZZQzuxnBg
 1l+xyZONGbJRKXpxCr1POCuNTh3GTfR8ekBLkOysUndq7Hj5iX5up6dWDHzGOUvNySd7
 QZJ1+X5v3OHq5n6qUM64WBJXo2+9CT+OzXbkcT0hQJdzK35nvOCmzySK2kU/tjAcTLmp
 K7/w==
X-Gm-Message-State: AOAM530qCz+m8rEkDu6tvPq7YjJhmNN2SACYhoQBjwj/R04G9+/gi2EP
 sHgBuwANw1GPz60nYppck6yYHa/mcboEVA==
X-Google-Smtp-Source: ABdhPJzGyCgAvHx4/ekXEVcHlRi19S/uAKumSxuVy5uJgnpaHnWjTx2MkWy6yhBSUo/pbxNEBNMy/Q==
X-Received: by 2002:adf:ee4a:: with SMTP id w10mr4098184wro.81.1610120185000; 
 Fri, 08 Jan 2021 07:36:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f9sm15887572wrw.81.2021.01.08.07.36.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 07:36:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/23] intc/arm_gic: Fix gic_irq_signaling_enabled() for vCPUs
Date: Fri,  8 Jan 2021 15:35:59 +0000
Message-Id: <20210108153621.3868-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108153621.3868-1-peter.maydell@linaro.org>
References: <20210108153621.3868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Correct the indexing into s->cpu_ctlr for vCPUs.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc.michel@greensocs.com>
Message-id: 20201214222154.3480243-2-edgar.iglesias@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index c60dc6b5e6e..af41e2fb448 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -141,6 +141,8 @@ static inline void gic_get_best_virq(GICState *s, int cpu,
 static inline bool gic_irq_signaling_enabled(GICState *s, int cpu, bool virt,
                                     int group_mask)
 {
+    int cpu_iface = virt ? (cpu + GIC_NCPU) : cpu;
+
     if (!virt && !(s->ctlr & group_mask)) {
         return false;
     }
@@ -149,7 +151,7 @@ static inline bool gic_irq_signaling_enabled(GICState *s, int cpu, bool virt,
         return false;
     }
 
-    if (!(s->cpu_ctlr[cpu] & group_mask)) {
+    if (!(s->cpu_ctlr[cpu_iface] & group_mask)) {
         return false;
     }
 
-- 
2.20.1


