Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BB04C008A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:55:25 +0100 (CET)
Received: from localhost ([::1]:60080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMZNk-0006Rl-9R
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:55:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMZ7c-0003ro-C2
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:38:44 -0500
Received: from [2a00:1450:4864:20::532] (port=35742
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMZ7a-0002pL-Ie
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:38:43 -0500
Received: by mail-ed1-x532.google.com with SMTP id bq11so17423864edb.2
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 09:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bgd958jqA3CUdC4YjY9L6ajQu0wLqK7CxsxrThFjcvE=;
 b=XOu+2S0h2IHFsTLmzqJnkthgLv7jtTN118PEa5gaxok9+uLlMVHFVz7xLbwVhumnNC
 9XFBePoF/cSyfxBSlHPU95xU+czFPE4RTJMbaIGRpCwa0kEUnm4kb0uyYDez12RRSPXy
 KzGahrJJ/SjQkcjfkWkFifgj2msm1aRWgC1DIPoCoR/JVRfdYXjVtCo3gf3m4B9J5oOw
 CPsw7XMfBTa0I2gf3sMHIlepkpE5NSPyWnr7yBTP9qoGNDtk+b2CC+uyoI3+GLT52e1I
 ekikcVWOKcrNQY+92IKVa0LBYXOacdP3HwIaDXaJJwD/MnM/nwyhEhyQtoGkJEhmQ3Yq
 iY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bgd958jqA3CUdC4YjY9L6ajQu0wLqK7CxsxrThFjcvE=;
 b=gbWFxA2hboPe0vRO+3hopbZ/X2lOwirtNSjLk9Lp9/uzfqHIKF/Z35Cbk/169ROoqO
 E7WAEb8rd8H9qIolG4V+ezQwkzi7eRS/uMT4fmlj41bd2PqYzjhriSDLEv9md9jt7GL2
 c1xE9vkJhXymiEVTEuSbH4bBb9VfR8LqHmJMDt9aep8w07HPYZMP4IKXqlOIfeAvB6fM
 uRI7hLh9cj5YOcd4nopz2X/7+W8rAnDTZbhDQDuavnnQxe6c1tuCUfz/zOumEorK/1jk
 vBptAom99Nu+YStnD4/FAHuxZ3eyUOZ0o1rZ0DLr9tOrikX7uXwrRRaj1EZIItoVoLOa
 ljgQ==
X-Gm-Message-State: AOAM531zJwhGnIh0VfJF67okS59UNvTS1lFRa1P6FJDiLHM05MthkXxy
 xtO41OgewI/Mo8k6JtxTJcSBZGebFRo=
X-Google-Smtp-Source: ABdhPJyIdAkkBrwqqgYaRe8BLA6Xq+Yan2zgE3edYNx4mu/sZgTIrX0sACUJIG7zJ8atWJUChiGoyw==
X-Received: by 2002:a05:6402:1d55:b0:412:b3ae:2904 with SMTP id
 dz21-20020a0564021d5500b00412b3ae2904mr24609055edb.294.1645551521181; 
 Tue, 22 Feb 2022 09:38:41 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id et2sm6449382ejc.101.2022.02.22.09.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:38:40 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/22] hw/input/pckbd: Disuse isa_init_irq()
Date: Tue, 22 Feb 2022 18:38:11 +0100
Message-Id: <20220222173819.76568-15-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222173819.76568-1-shentey@gmail.com>
References: <20220222173819.76568-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x532.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_init_irq() has become a trivial one-line wrapper for isa_get_irq().
Use the original instead such that isa_init_irq() can be removed
eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/input/pckbd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index e56bee87d2..3ee36baf2d 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -736,8 +736,8 @@ static void i8042_realizefn(DeviceState *dev, Error **errp)
     ISAKBDState *isa_s = I8042(dev);
     KBDState *s = &isa_s->kbd;
 
-    isa_init_irq(isadev, &s->irq_kbd, isa_s->kbd_irq);
-    isa_init_irq(isadev, &s->irq_mouse, isa_s->mouse_irq);
+    s->irq_kbd = isa_get_irq(isadev, isa_s->kbd_irq);
+    s->irq_mouse = isa_get_irq(isadev, isa_s->mouse_irq);
 
     isa_register_ioport(isadev, isa_s->io + 0, 0x60);
     isa_register_ioport(isadev, isa_s->io + 1, 0x64);
-- 
2.35.1


