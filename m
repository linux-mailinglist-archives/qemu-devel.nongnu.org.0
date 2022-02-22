Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE7C4C025F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 20:49:05 +0100 (CET)
Received: from localhost ([::1]:49194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMb9k-0003ss-4c
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 14:49:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMawN-0003Pv-2N
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:35:15 -0500
Received: from [2a00:1450:4864:20::62b] (port=34544
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMawK-00075M-W8
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:35:14 -0500
Received: by mail-ej1-x62b.google.com with SMTP id gb39so46186049ejc.1
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 11:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HbYju84CvG42z6Al6B5zdxO5OIvmYAHPnRzWM1yGA1k=;
 b=fEqeUmFNzvGcyTgPxm+ZcuZ/5PBztDqLY+3e/Jkzo4WUVfIfnstjuKYXT1Sj7JnqaE
 gKr/a0H6jSLUwk5is+R5V+tN8kH4KEuR1A9lO909JIMT7Uv/cUGJy1cuuhSY5MR0HXWL
 1fOlMhHdSs1dX5ug0j/JNAF/tV4S1GD9TU/o62m5eUqsmeOKoi/+wIMdYMtf+3M4Qa60
 lCXtLl8WmWDNynbzGBhCS+iQHnCB+NuWpO1PBcbi29tHyyNbaUG18Ao6DIyxVOxaGRPU
 9AiT4s5YYDBLFHsVO+K9NK5Gh23myUZh0c2skMjSOBtTCr+rRnvn1FbrpAdnF61/2b7i
 oYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HbYju84CvG42z6Al6B5zdxO5OIvmYAHPnRzWM1yGA1k=;
 b=O+9ssvFJi1LHEYo5syDMf+mXG39QSq6u1/nr1WbkdEcro1RIG4hLhpF/P239Y3jGeJ
 8y3HtFUOwZ6CY/2f8SvJ/9TbYcil03ALZX6DgTrVLAi5M0TRrPcCoLkpyyz6tIEQx+/Z
 BJgM7GxTP3A2TFvtFP9JAWg0qmC901LC35RI5IdIVbCoIPGwWs1XGp5J3ksVXk3kt/xm
 +5GT7vlsySp18ESVjSQzTnLIlk+Q0Ma1TSGuzRYksKoNnlqlQkQzFfEmM3FIuJ6Nrq+A
 19rIPlVP9xVOWQN+1LGxVIemAPOJ5nkhbM1jQ69WJUVXfc9ge4tf8MHJXmV7y91J69Pk
 pl8w==
X-Gm-Message-State: AOAM533cR5swbRPJdH3yLThevYmgcSlck6YRZZMJnWbyd8ypTCzZBeg4
 IXCMYlQhmpxxTXHFXUowkRSmrzk3qxQ=
X-Google-Smtp-Source: ABdhPJzu+mfE7Nfv0OpkWBsjHWENnIsSUx5sDrGroD+rPTi4jRCAubADG3TA0XqukO/Fts/qmXS++g==
X-Received: by 2002:a17:907:72c3:b0:6ce:5256:1125 with SMTP id
 du3-20020a17090772c300b006ce52561125mr20234032ejc.697.1645558511722; 
 Tue, 22 Feb 2022 11:35:11 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id i1sm766532edj.84.2022.02.22.11.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 11:35:11 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/22] hw/isa/isa-bus: Disuse isa_init_irq()
Date: Tue, 22 Feb 2022 20:34:45 +0100
Message-Id: <20220222193446.156717-22-shentey@gmail.com>
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
Cc: Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_init_irq() has become a trivial one-line wrapper for isa_get_irq().
Use the original instead such that isa_init_irq() can be removed
eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/isa-bus.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index c64a14120b..1e8c102177 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -92,8 +92,7 @@ void isa_init_irq(ISADevice *dev, qemu_irq *p, unsigned isairq)
 
 void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq)
 {
-    qemu_irq irq;
-    isa_init_irq(isadev, &irq, isairq);
+    qemu_irq irq = isa_get_irq(isadev, isairq);
     qdev_connect_gpio_out(DEVICE(isadev), gpioirq, irq);
 }
 
-- 
2.35.1


