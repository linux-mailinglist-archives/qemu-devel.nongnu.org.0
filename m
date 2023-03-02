Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2A46A8B25
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 22:24:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXqNh-0000p3-TD; Thu, 02 Mar 2023 16:22:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNf-0000nu-N9
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:27 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNe-0002RM-9t
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:27 -0500
Received: by mail-ed1-x531.google.com with SMTP id o12so2402446edb.9
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 13:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677792145;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ncEOz47FvL1Wpf7gpuacRny/qph+fgoFwgfMcvHxTw0=;
 b=eNAhB8yaeO+tboY2U2yS4bNfKDsurYLRSjvY/Kr3dMt1kQ+AqQTNWWOLDFgFQZosNg
 rdGlEyfsKbG6fZoguVgk0D54Rx9y5glsgnnO7bZO38qcIwp36/ZCqnUWy3VedJh21F36
 iCCU6fcNkstFiIWXrJmJX171dADNG2Ez22AqtUvmakYX3D29VM1WswuhRqAgNjnenwtk
 kfzYHdrQ8Ek/C/SxwXWRrOPk6vm+/44l7Z4F/3bZ4KGiWjyz4Vu01EhAjLDceO3UmRLt
 40/PW0IYzG++ExjDR4RvF8S1Bb5zPw+V/cw2BSRzEb7azZm98l3oaFBWT9jlTEM8xa6K
 lOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677792145;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ncEOz47FvL1Wpf7gpuacRny/qph+fgoFwgfMcvHxTw0=;
 b=ashBIiqd6s1FyBqy70ik2fmlrvRphbPSzWRpauJmzZNW5mmSkD6DBYZMHN2u5Hefeb
 e3nu1NefkqajIO8Y/95jfhoDSksBaWYu3rgE+6GmBYU95VNYTGlNBd0455EcaEiSMn1I
 SJ31hg7qWyJHtmJiZsvV7ish0gan6IBhLuS5VdD9gn+zYqh6FqkUFodzB/z5MAcYSfel
 r5zXcA6AA0cXlmCipuMyp63NQhLfEpciAOxlMUzY40WysE8bLDiY0uzFd0xcTRIjUWR7
 eRC3JdEnynCLXAXwHgU9vdq3wuAitEhXVFKJVqn956G58X/+SPn5GkVx1m5XM5sMcWwU
 Q1HQ==
X-Gm-Message-State: AO0yUKUlPbj7T2dq9zg1aOjNPJLggUwpDdeBOg8MDcuOwMJT0lxOhgIH
 ibi4SzA2atKtIdph2b89rt4GposrjhQ=
X-Google-Smtp-Source: AK7set9y7qitZE9Ur7ztZUL2T+Lbj1/9MR7U21sMk7a+X/D3YnXsd+qImo/bBspnjfL1xAEhYc0mHg==
X-Received: by 2002:a17:906:9c90:b0:8b1:fc1a:7d19 with SMTP id
 fj16-20020a1709069c9000b008b1fc1a7d19mr12100863ejc.3.1677792144891; 
 Thu, 02 Mar 2023 13:22:24 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-092-224-150-004.92.224.pool.telefonica.de. [92.224.150.4])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709062ec400b008f89953b761sm145895eji.3.2023.03.02.13.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 13:22:24 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v8 14/23] hw/isa/piix4: Remove unused inbound ISA interrupt
 lines
Date: Thu,  2 Mar 2023 22:21:52 +0100
Message-Id: <20230302212201.224360-15-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302212201.224360-1-shentey@gmail.com>
References: <20230302212201.224360-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

The Malta board, which is the only user of PIIX4, doesn't connect to the
exported interrupt lines. PIIX3 doesn't expose such interrupt lines
either, so remove them for PIIX4 for simplicity and consistency.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-32-shentey@gmail.com>
---
 hw/isa/piix4.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index c13f68733b..a88ae859c4 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -155,12 +155,6 @@ static void piix4_request_i8259_irq(void *opaque, int irq, int level)
     qemu_set_irq(s->cpu_intr, level);
 }
 
-static void piix4_set_i8259_irq(void *opaque, int irq, int level)
-{
-    PIIX4State *s = opaque;
-    qemu_set_irq(s->isa[irq], level);
-}
-
 static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
                             unsigned int len)
 {
@@ -204,8 +198,6 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    qdev_init_gpio_in_named(DEVICE(dev), piix4_set_i8259_irq,
-                            "isa", ISA_NUM_IRQS);
     qdev_init_gpio_out_named(DEVICE(dev), &s->cpu_intr,
                              "intr", 1);
 
-- 
2.39.2


