Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 630896534FF
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 18:22:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p82UC-0003lN-4o; Wed, 21 Dec 2022 12:02:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82Sx-0002v6-MP; Wed, 21 Dec 2022 12:01:15 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82Sw-0008HK-3O; Wed, 21 Dec 2022 12:01:15 -0500
Received: by mail-ed1-x533.google.com with SMTP id i15so22911628edf.2;
 Wed, 21 Dec 2022 09:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cyIaDXUUe1E2lKeSs+MY3/RWeIYYGkm/0q2/wOL9FL0=;
 b=aXHF47hZj9Haqt45GRxcxshqdGcALxMj7MFxCUBb2fdHt8DsG6VgyZu8OkhsljHz11
 I78nTxM86aaJPlfJzdoyEEn9wuhkuf9sFeBvdFMskv+I9FiKPqxFux0OFNhCoTg0P10S
 rv8LLNRUDt5KVYnf2x8siNYKqsMXybq6RI9qW3hz0MFl556Fslmh5I2OugvhIvPsFfrB
 6CeCUGsZCYVEn9MIuz17Ppi9CcRb3Q03DZnmDxPsQhA/fmMdnl+HG0oJI3p5RxSykqS0
 P4V05jt9hEtQb3BKspLDWjul/HKM9Ft23sNB0sc8FiUTf9Jz3qrH33FUq1+CZpb6gDY8
 SprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyIaDXUUe1E2lKeSs+MY3/RWeIYYGkm/0q2/wOL9FL0=;
 b=iniGRBh2RDPlguyWWiJDO10fLAgcH8zA1CtER2ZoHOd4v9BYvwNLN9fNLV+CzDd9v/
 3IoUaASJo6EhStbf3IVfFVS68JMfZRI5x5QyAojQv71fNNQ54C//xrQlCRu5spl2GHuN
 DiK3u6RP1wRk8T9kq5h8f4TGvPNE37l16PVq5t1ttznbyTYYE0sGVn54igESJyT0qPsb
 zchdQySiF+bW8FGFVZlA1O2g7YZH2c+P9KJ9iNRSEVTiN7v3kZduzGZowrfOS42aBUNg
 qenOdtMWfTBmYNyHe6cJrsjmZlW5C5n3e6M3gW67/SpMdzq/PDDg/8W3BX3H6CvQR0Gr
 AbSw==
X-Gm-Message-State: AFqh2kpIwNlZTnV11TTpex8R+uRFripkvhIHT6gtsUIKApnEw/Veq6kz
 b2HMzzctFLONMJW+wZ8VGKObkwAuTQA=
X-Google-Smtp-Source: AMrXdXugOWJsoanxsdB7XqqV5gvPxzsFlPMFlyBa2a/fjh6zcaNjFHAlRuIGumdMehouuNlDQFea5A==
X-Received: by 2002:a05:6402:3224:b0:467:e9a5:77c4 with SMTP id
 g36-20020a056402322400b00467e9a577c4mr2461403eda.14.1671642071666; 
 Wed, 21 Dec 2022 09:01:11 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-092-224-051-061.92.224.pool.telefonica.de. [92.224.51.61])
 by smtp.gmail.com with ESMTPSA id
 n14-20020aa7db4e000000b0047466e46662sm7204019edt.39.2022.12.21.09.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 09:01:11 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 21/30] hw/isa/piix4: Remove unused inbound ISA interrupt
 lines
Date: Wed, 21 Dec 2022 17:59:54 +0100
Message-Id: <20221221170003.2929-22-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221170003.2929-1-shentey@gmail.com>
References: <20221221170003.2929-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x533.google.com
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
exported interrupt lines. PIIX3 doesn't expose such intterupt lines
either, so remove them for PIIX4 for simplicity and consistency.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-32-shentey@gmail.com>
---
 hw/isa/piix4.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index de4133f573..9edaa5de3e 100644
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
2.39.0


