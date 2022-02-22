Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 108F44C026E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 20:52:28 +0100 (CET)
Received: from localhost ([::1]:57184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMbD1-0000nm-5p
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 14:52:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMawH-0003Lt-Dc
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:35:10 -0500
Received: from [2a00:1450:4864:20::62d] (port=45865
 helo=mail-ej1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMawE-00073B-UK
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:35:09 -0500
Received: by mail-ej1-x62d.google.com with SMTP id lw4so46077646ejb.12
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 11:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c6cdzjjbLoYOkQYojNxxx+ivRGMWbBCNjSa2aZRS9GE=;
 b=CMQ1xJ1rM7yYSIlFF04h4Xy3XI8Ze1qs37CxsIZ8x96l/OcBGuMZH4UjPil42ecs85
 b4LRd04bynIqM1crbSC76BPC2NujsCvLJ6VzHudiHCK6XVmvikf9C0eDkztTFg3GIRya
 wGRHepFAcsbqysbkmluQ2MmA15PUW1sbwGiGs4ZeVpz+9hdEKBc2iFGiAYprnmE0qd3q
 4R5uM6pNH2WIsT2cOIsVorIo/gdPrOOIiioqao98lpnwauT8yzeQoWpC2kXZnx+7GVGG
 OUTFjf/lirhLCWdnpuMqTHMD1E4v6qLHLuYkQ85bYcYUlUeq/G41URBXFoqC6lGUQlZz
 7Fag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c6cdzjjbLoYOkQYojNxxx+ivRGMWbBCNjSa2aZRS9GE=;
 b=CUqlP5hC6tCARDtBmaijaJtTLlMj+cnNOrhTP/DU9jt+28Wq1dDjWXgQ41gHjlIPuI
 OV7f/WXR7C9oqgTvlmDCvDl4+AkDuuA588P1TXQnDtpKl4HJ5dhqD7AT2azhprHywfju
 izsvWghvwr94+wK2rgjmGX4MGUkoOponM8aFEbWwnY7jSuiNBaml9bI1kuvO7La3xwqZ
 jTAn4PHd3TEpFm4wCC/8gUKAvJuwNuVFFToYxn22Lt/emfD+U+qll2DbjXRIPwlVHla+
 06IlOqGbOqeNfq4bSQS17E7alz0vG73dyIMjJfjislods7n1OgNeliB7+fHtFahsmD2P
 SOhw==
X-Gm-Message-State: AOAM532oAYA6yudH9sWFOx6Rl1dvYXSKHyYhQ5M+CKoiSoE8qiIKbhYA
 v/qWv4p9lJiZ82PjPP2/HLHiiVxySOw=
X-Google-Smtp-Source: ABdhPJzNxzNHpyy3+F7JHqpwPSakDAWFBLZA0PmrpwYGBB0fS4jiLQxhBIbX9ZOqyIJEvuxwAPkD6w==
X-Received: by 2002:a17:906:19c6:b0:6ce:98a4:5ee6 with SMTP id
 h6-20020a17090619c600b006ce98a45ee6mr19773735ejd.567.1645558505640; 
 Tue, 22 Feb 2022 11:35:05 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id i1sm766532edj.84.2022.02.22.11.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 11:35:05 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/22] hw/input/pckbd: Disuse isa_init_irq()
Date: Tue, 22 Feb 2022 20:34:38 +0100
Message-Id: <20220222193446.156717-15-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222193446.156717-1-shentey@gmail.com>
References: <20220222193446.156717-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
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
index 56c55c5768..4988403f7c 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -749,8 +749,8 @@ static void i8042_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
-    isa_init_irq(isadev, &s->irq_kbd, isa_s->kbd_irq);
-    isa_init_irq(isadev, &s->irq_mouse, isa_s->mouse_irq);
+    s->irq_kbd = isa_get_irq(isadev, isa_s->kbd_irq);
+    s->irq_mouse = isa_get_irq(isadev, isa_s->mouse_irq);
 
     isa_register_ioport(isadev, isa_s->io + 0, 0x60);
     isa_register_ioport(isadev, isa_s->io + 1, 0x64);
-- 
2.35.1


