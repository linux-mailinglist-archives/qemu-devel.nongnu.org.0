Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B247950DB51
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 10:37:29 +0200 (CEST)
Received: from localhost ([::1]:56196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niuDo-0007IL-Ow
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 04:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu0p-0007Hh-EI
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:24:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu0n-0002qh-Ff
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:24:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650875040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lGr5ZYYCfBjIhbaCs5pjlimDwxXJN466WQPA6PrOrAg=;
 b=UVfZBd+hFXf7yBA8qF6Fj2M94zJat09hKaZOh+j8suNNpu+WmLke+OukDaC2HfKUoqAXYX
 alXBcxVkPtvhUUMLNAIJ36Y23Pm3Xy9kDpqWWjIZXytWKqNEjCGihN1YzGvxaQrVSjUIvM
 NwUkRK4tg4baZyfwoWA/c6KJzH6LB4o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-Q3VfF7yzNLuhd0q3ew4maw-1; Mon, 25 Apr 2022 04:22:05 -0400
X-MC-Unique: Q3VfF7yzNLuhd0q3ew4maw-1
Received: by mail-wm1-f69.google.com with SMTP id
 q6-20020a1cf306000000b0038c5726365aso6872717wmq.3
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 01:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lGr5ZYYCfBjIhbaCs5pjlimDwxXJN466WQPA6PrOrAg=;
 b=jKazsCdPTPk6pfjyjFTxfToxd2tqc8kwpgHyxGGyTwCw2zeLaTjuYA8WlfZoRuIpoh
 PRiIpENY7kZIIQF4liPZWrO+8Ck/fa4NOttR4Lts0lYLNMTu09wL0isfwyEJdt/1DDCK
 RluI2lFz1s0RtJW/5gz98kl4iszVgTvwKV6VvuAty1rskaT/bF5i9q1XG/V9TaammibS
 ujX3Mv1mmJ34vKpt2D9iVnbSNLeC89wVbPdAG42PaOGd2E/KyMUENe/uo+9qum5gi4Jm
 EInnT9hn1ueT1fV/7x/z5ql4P+foFuErvEqHoH4MzcwTMZoKitiBD8YCGMi2YH51SIfA
 HfYg==
X-Gm-Message-State: AOAM531esxwTxwlwPLsFKgdj5saxrlGG7KQ9io/9cvMzNoO1dVRyFhDE
 9EaB4R91RUSUq43uFbqaX7tAycC8hDMyiC2m5IDmRjw232PT3hwmvHgDgpfwz/LOIoDo7V+qJ3F
 zjE1Lsg90nRCh2JA=
X-Received: by 2002:a05:600c:1552:b0:38e:c7a4:f056 with SMTP id
 f18-20020a05600c155200b0038ec7a4f056mr24931337wmg.183.1650874923828; 
 Mon, 25 Apr 2022 01:22:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcPaXQaRYsRK7kFr7dw0OP7er2x/iw/gGtxg/5rbUQrr/TshLfhpO+Mel3UMnOji0xaPOGxg==
X-Received: by 2002:a05:600c:1552:b0:38e:c7a4:f056 with SMTP id
 f18-20020a05600c155200b0038ec7a4f056mr24931297wmg.183.1650874923619; 
 Mon, 25 Apr 2022 01:22:03 -0700 (PDT)
Received: from wheatley.localdomain (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 r17-20020a0560001b9100b00207afaa8987sm9545597wru.27.2022.04.25.01.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 01:22:02 -0700 (PDT)
Received: from wheatley.redhat.com (wheatley.k8r.cz [127.0.0.1])
 by wheatley.localdomain (Postfix) with ESMTP id 15F3967B1B57;
 Mon, 25 Apr 2022 10:22:02 +0200 (CEST)
From: Martin Kletzander <mkletzan@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/18] hw/input/tsc210x: Extract common init code into new
 function
Date: Mon, 25 Apr 2022 10:21:45 +0200
Message-Id: <1d75877cf4cc2a38f87633ff16f9fea3e1bb0c03.1650874791.git.mkletzan@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1650874791.git.mkletzan@redhat.com>
References: <cover.1650874791.git.mkletzan@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mkletzan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This deduplicates several lines and will make future changes more
concise.

Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
---
 hw/input/tsc210x.c | 68 ++++++++++++++++------------------------------
 1 file changed, 24 insertions(+), 44 deletions(-)

diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c
index df7313db5d7f..f16a8090b7c7 100644
--- a/hw/input/tsc210x.c
+++ b/hw/input/tsc210x.c
@@ -31,6 +31,7 @@
 #include "hw/input/tsc2xxx.h"
 #include "hw/irq.h"
 #include "migration/vmstate.h"
+#include "qapi/error.h"
 
 #define TSC_DATA_REGISTERS_PAGE		0x0
 #define TSC_CONTROL_REGISTERS_PAGE	0x1
@@ -1070,20 +1071,10 @@ static const VMStateDescription vmstate_tsc2301 = {
     .fields = vmstatefields_tsc210x,
 };
 
-uWireSlave *tsc2102_init(qemu_irq pint)
+static void tsc210x_init(TSC210xState *s,
+                         const char *name,
+                         const VMStateDescription *vmsd)
 {
-    TSC210xState *s;
-
-    s = g_new0(TSC210xState, 1);
-    s->x = 160;
-    s->y = 160;
-    s->pressure = 0;
-    s->precision = s->nextprecision = 0;
-    s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, tsc210x_timer_tick, s);
-    s->pint = pint;
-    s->model = 0x2102;
-    s->name = "tsc2102";
-
     s->tr[0] = 0;
     s->tr[1] = 1;
     s->tr[2] = 1;
@@ -1105,13 +1096,29 @@ uWireSlave *tsc2102_init(qemu_irq pint)
 
     tsc210x_reset(s);
 
-    qemu_add_mouse_event_handler(tsc210x_touchscreen_event, s, 1,
-                    "QEMU TSC2102-driven Touchscreen");
+    qemu_add_mouse_event_handler(tsc210x_touchscreen_event, s, 1, name);
 
     AUD_register_card(s->name, &s->card);
 
     qemu_register_reset((void *) tsc210x_reset, s);
-    vmstate_register(NULL, 0, &vmstate_tsc2102, s);
+    vmstate_register(NULL, 0, vmsd, s);
+}
+
+uWireSlave *tsc2102_init(qemu_irq pint)
+{
+    TSC210xState *s;
+
+    s = g_new0(TSC210xState, 1);
+    s->x = 160;
+    s->y = 160;
+    s->pressure = 0;
+    s->precision = s->nextprecision = 0;
+    s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, tsc210x_timer_tick, s);
+    s->pint = pint;
+    s->model = 0x2102;
+    s->name = "tsc2102";
+
+    tsc210x_init(s, "QEMU TSC2102-driven Touchscreen", &vmstate_tsc2102);
 
     return &s->chip;
 }
@@ -1132,34 +1139,7 @@ uWireSlave *tsc2301_init(qemu_irq penirq, qemu_irq kbirq, qemu_irq dav)
     s->model = 0x2301;
     s->name = "tsc2301";
 
-    s->tr[0] = 0;
-    s->tr[1] = 1;
-    s->tr[2] = 1;
-    s->tr[3] = 0;
-    s->tr[4] = 1;
-    s->tr[5] = 0;
-    s->tr[6] = 1;
-    s->tr[7] = 0;
-
-    s->chip.opaque = s;
-    s->chip.send = (void *) tsc210x_write;
-    s->chip.receive = (void *) tsc210x_read;
-
-    s->codec.opaque = s;
-    s->codec.tx_swallow = (void *) tsc210x_i2s_swallow;
-    s->codec.set_rate = (void *) tsc210x_i2s_set_rate;
-    s->codec.in.fifo = s->in_fifo;
-    s->codec.out.fifo = s->out_fifo;
-
-    tsc210x_reset(s);
-
-    qemu_add_mouse_event_handler(tsc210x_touchscreen_event, s, 1,
-                    "QEMU TSC2301-driven Touchscreen");
-
-    AUD_register_card(s->name, &s->card);
-
-    qemu_register_reset((void *) tsc210x_reset, s);
-    vmstate_register(NULL, 0, &vmstate_tsc2301, s);
+    tsc210x_init(s, "QEMU TSC2301-driven Touchscreen", &vmstate_tsc2301);
 
     return &s->chip;
 }
-- 
2.35.1


