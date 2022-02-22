Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C38B4C02BD
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 21:01:56 +0100 (CET)
Received: from localhost ([::1]:54768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMbMB-0001P4-4P
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 15:01:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMawI-0003MQ-OU
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:35:10 -0500
Received: from [2a00:1450:4864:20::62b] (port=44779
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMawG-00073i-KF
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:35:10 -0500
Received: by mail-ej1-x62b.google.com with SMTP id p14so45963164ejf.11
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 11:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zjmSFcMWhfofmPFxlk/r2EeC0P+Uw+dEJELYLF9MjVo=;
 b=QzdP5bVXL3QMwH6VngtYWeflY53x8h+jNGHy5y1QaLqJ/ry8j78qn45T8jZOEbBCsm
 VIKIozL+VBnAW/RF/x6yTE8rcmzam3oRs8wOqs0nXdarqnTOQPgzC/yTAKcytE8MMeDI
 o8l3Gxzr25Ylu+j1uqFiQUnEu4EGjhhfIDBcjuvesc6Wf3Tkg/thf/P9457LFIO7A+QU
 crJhwwfZNKwLb9wREFDMKp/lrA2b6qs0xSGoWOX/TQAk6dMDvKL23HsXEnhbZzQ/r0iY
 XlJbCZZskuYsQB7PeSpfnkWG6FNx6zTb7/gju/+r3RxPFa8yqqN6UUQ4xAa3qQJ/x6g8
 eIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zjmSFcMWhfofmPFxlk/r2EeC0P+Uw+dEJELYLF9MjVo=;
 b=ZBLCoOQsuomicCxdiH4Fm+Wl2fUr5gtlpxXU3/6Nu5//qnDdRP+TJ1cpDaCjVghkhj
 L1+OEIQGz63PH4MnCp0xvVdEP0eH8t0ZXIVA6GrHLsou20IT54QpTj+PnIInpj63pwjp
 zs9Hrsb8Ksa+lVqd/P3hvf5RqXebAVDx5Sk+XXNOG4Y55qgn0bR7Q4jCNO8HXWuCzDBC
 Sic0pthEMfshM5krcPsqpnbCk1JCV0u+MZKQd4rCj1/gSGhHJbzR4O+iIeBnjwDLnpjA
 qZvOiX1ZbORrvBj603/QuE/f/tZwwtd8jzA3xe3ThcYxgAGYPYy58MisZ0TyIzJX/VFO
 OaiA==
X-Gm-Message-State: AOAM532TQDi/VN+CRU27KyUQAZ3R7MFZUOTr+f60g4FCoBXZvQvbD1qe
 m98AQiWSR70EQt2GTnUyPcfjEvmarl4=
X-Google-Smtp-Source: ABdhPJwvxIIPr1fP8GJcSBBa3nrw4/aliHZcZr0+i2PGUaSwhXvTDRD1Q/AHvjnqsGicQ4lCnTC+vw==
X-Received: by 2002:a17:906:6158:b0:6ce:61d6:f243 with SMTP id
 p24-20020a170906615800b006ce61d6f243mr20249958ejl.268.1645558507321; 
 Tue, 22 Feb 2022 11:35:07 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id i1sm766532edj.84.2022.02.22.11.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 11:35:06 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/22] hw/ipmi/isa_ipmi_kcs: Disuse isa_init_irq()
Date: Tue, 22 Feb 2022 20:34:40 +0100
Message-Id: <20220222193446.156717-17-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222193446.156717-1-shentey@gmail.com>
References: <20220222193446.156717-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Bernhard Beschow <shentey@gmail.com>, Corey Minyard <minyard@acm.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_init_irq() has become a trivial one-line wrapper for isa_get_irq().
Use the original instead such that isa_init_irq() can be removed
eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ipmi/isa_ipmi_kcs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ipmi/isa_ipmi_kcs.c b/hw/ipmi/isa_ipmi_kcs.c
index 3b23ad08b3..afabb95ebe 100644
--- a/hw/ipmi/isa_ipmi_kcs.c
+++ b/hw/ipmi/isa_ipmi_kcs.c
@@ -91,7 +91,7 @@ static void ipmi_isa_realize(DeviceState *dev, Error **errp)
     }
 
     if (iik->isairq > 0) {
-        isa_init_irq(isadev, &iik->irq, iik->isairq);
+        iik->irq = isa_get_irq(isadev, iik->isairq);
         iik->kcs.use_irq = 1;
         iik->kcs.raise_irq = isa_ipmi_kcs_raise_irq;
         iik->kcs.lower_irq = isa_ipmi_kcs_lower_irq;
-- 
2.35.1


