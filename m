Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC4269C772
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:15:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2Fq-0005n0-1A; Mon, 20 Feb 2023 04:14:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Fn-0005lU-9q
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:14:35 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Fk-0003id-L9
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:14:34 -0500
Received: by mail-wr1-x435.google.com with SMTP id r7so163386wrz.6
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ep/ieGMZNayE9X06ftc5taHWHa+LemsYZU+KXdgMGEE=;
 b=BEYq2SwcM7Ko/Qtg515nOgnqfSctUE4pkYwordb0fLF6n6vhWQcfA8GoLMftdYevkC
 3LSdCAvnyeXfjBUnN+RFKQutgg/jwrIyuxweJxPmiRUB0qUsRqMHcTJcfZyx/OpxXfyp
 o7sqTjqMZ2uLMbJcL0L782wvcSJtlREKpwTKBWvYQaCvU8dcPBtMp07P3NzELHT8jIA/
 a4+8pyxxxuGEUe5L8O3fnbl+L144XTEsnGLOb+xBc/uWJiPyg9EV4btsqkYJyXIkgz4Z
 +baqrve1pKbRsiPMWJbtSc4TaZCbZz9IgB8pqWCyE69HPXzsdNBAK0yqb079lh4e9Y8W
 gOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ep/ieGMZNayE9X06ftc5taHWHa+LemsYZU+KXdgMGEE=;
 b=UElhwZXG6Nd5x4xztqMWp7gG7aNGPtzlR7FUcuZMVHzwD8e3gtnIkwob8yoyxyVgKj
 ikt/Mgai7kWtL4pxXkAAsxyu91t4daAGZLoOPHN9XW/UV8Zr8gHZFxBZeUZnjNvCqE9a
 iuG+hUKtwI4Gh9Pfx672ZxKS71CHJqT7fhcfH3nEPBO1lP7wepaqNxidhvG8GbCr/uMw
 nBY94K1SREnv3rkBwPZjGqM8XMw94OHdM2v5qQKw7c1zisRgRlNU0D5VtJnlJSQsphI6
 E9WG6uSehpqzA7n0kKKdz/d2AmN29pYmRbrdTVqpbkrIgdMBt12JO2bOrhf5TRRf7jyM
 wFiQ==
X-Gm-Message-State: AO0yUKUKkN9i44gmhCnIc4pwaInWMpdtV8g8iNC+H//sYWQskJ6RVF7v
 EMCMmfJb6LkeafQFDKvyJrcC9EA7Us3Ith8t
X-Google-Smtp-Source: AK7set+Nvgv/LG5W2gmS43y1+mKRxTbC1Z7E9G1pm0S8UyZ1hY4+pdcrMK3K7OEgGYjQ/NV/JLOraQ==
X-Received: by 2002:a5d:6b83:0:b0:2c5:77de:426b with SMTP id
 n3-20020a5d6b83000000b002c577de426bmr51913wrx.60.1676884471696; 
 Mon, 20 Feb 2023 01:14:31 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 a17-20020adffad1000000b002c54e26bca5sm4973762wrs.49.2023.02.20.01.14.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:14:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 06/24] hw/ide/isa: Remove intermediate ISAIDEState::irq
 variable
Date: Mon, 20 Feb 2023 10:13:40 +0100
Message-Id: <20230220091358.17038-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The intermediate ISAIDEState::irq variable just add noise, remove it.

Message-Id: <20230215112712.23110-6-philmd@linaro.org>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/isa.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/ide/isa.c b/hw/ide/isa.c
index 5c3e83a0fc..ad47e0899e 100644
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -45,7 +45,6 @@ struct ISAIDEState {
     uint32_t  iobase;
     uint32_t  iobase2;
     uint32_t  irqnum;
-    qemu_irq  irq;
 };
 
 static void isa_ide_reset(DeviceState *d)
@@ -73,8 +72,7 @@ static void isa_ide_realizefn(DeviceState *dev, Error **errp)
 
     ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
     ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
-    s->irq = isa_get_irq(isadev, s->irqnum);
-    ide_init2(&s->bus, s->irq);
+    ide_init2(&s->bus, isa_get_irq(isadev, s->irqnum));
     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
     ide_register_restart_cb(&s->bus);
 }
-- 
2.38.1


