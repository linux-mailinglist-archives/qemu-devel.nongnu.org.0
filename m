Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EA54C0057
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:49:23 +0100 (CET)
Received: from localhost ([::1]:43720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMZHu-0003s0-9g
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:49:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nMZ7b-0003oe-Hf; Tue, 22 Feb 2022 12:38:43 -0500
Received: from [2a00:1450:4864:20::52f] (port=43728
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nMZ7Z-0002p2-Ow; Tue, 22 Feb 2022 12:38:43 -0500
Received: by mail-ed1-x52f.google.com with SMTP id m3so32749151eda.10;
 Tue, 22 Feb 2022 09:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hODc348sDBOJP+v8u2lpOm8duN5QJTp75AGojk1OzEo=;
 b=Sf8V5s84FNlq6IkY7d6Xg1SJ5oZFjOIIhp+X9luDiBPU1zSeprfQNhKgQhMcSJFQI2
 kBWew6zFigvTtAuqEC8Ye70uryIGkHQ0RjQupO0bh0/q25fqn5pu/wt9ZCGZtSP/yztT
 o8AFQ82WInhbCpZym6SRdn+GosaUll13gECzIwb+w5TiYqSanmDJlW+jPUAR6MJQSE6L
 1j8Pdxyp40DP3zvnGD6iR2juapl+gbPxzqAgrM5VaJHoI9qt9xhNjwB1J1SJuPXvQmRw
 WCnzkMhOIvdI1sEcjcdzXwVBSLuCWJajg8lP4i+8MZLyTz3kZAoE0OG2quxbQ8763AMN
 /ihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hODc348sDBOJP+v8u2lpOm8duN5QJTp75AGojk1OzEo=;
 b=3vkhvlOY0s3kS4XJzK98Z3nGTnm8K4l2ixHHhBajDR/LGEPnSb0pp0gHqOLZrvV3yz
 3/S5j+17gvUGxjr7ymVbVx/VHhkCV/qdTsDXDiEB4meYjfWoIzFLS4711QpfJ+4ZJy55
 k3oCF4Xt8E47lK50zyU7BhLlZmlBxohuFwmeaWLpV5Uv34XQ1P+20tHrYS2hkeA57sgf
 z044aKboNXfGDzmURjSvGC5yjqCDmd/Oz0VdFgvd78U6lQcB1YGeOtwAj1k/pb1KywPY
 0h27Az/B7/FrLxkWzvyurgZs27bxJg53Sean5afykYfyoq/Yn/defml9VwioeZnxUHxj
 xAGA==
X-Gm-Message-State: AOAM530HiNe1bi9SlTd0h7UNykp1Po1hCxVo5Zi+zoV7QurBmqAQIrfU
 0VpYqEo2ixnwhsmLrg94aH5fGYNoNGs=
X-Google-Smtp-Source: ABdhPJzPnYJ8otHXEdr0edxIen9UPb+si46a7yDTGlVWEXGXvnYDdq5SV9C38o49eYORBwmy+2+NCA==
X-Received: by 2002:a50:c04c:0:b0:410:b929:d658 with SMTP id
 u12-20020a50c04c000000b00410b929d658mr27593345edd.5.1645551520030; 
 Tue, 22 Feb 2022 09:38:40 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id et2sm6449382ejc.101.2022.02.22.09.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:38:39 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/22] hw/ide/isa: Disuse isa_init_irq()
Date: Tue, 22 Feb 2022 18:38:10 +0100
Message-Id: <20220222173819.76568-14-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222173819.76568-1-shentey@gmail.com>
References: <20220222173819.76568-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
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
Cc: John Snow <jsnow@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 "open list:IDE" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_init_irq() has become a trivial one-line wrapper for isa_get_irq().
Use the original instead such that isa_init_irq() can be removed
eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ide/isa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ide/isa.c b/hw/ide/isa.c
index 24bbde24c2..8bedbd13f1 100644
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -75,7 +75,7 @@ static void isa_ide_realizefn(DeviceState *dev, Error **errp)
 
     ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
     ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
-    isa_init_irq(isadev, &s->irq, s->isairq);
+    s->irq = isa_get_irq(isadev, s->isairq);
     ide_init2(&s->bus, s->irq);
     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
     ide_register_restart_cb(&s->bus);
-- 
2.35.1


