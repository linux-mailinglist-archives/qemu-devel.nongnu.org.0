Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F7268E4C4
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 01:10:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPY0t-0005gx-7A; Tue, 07 Feb 2023 19:08:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPY0L-0005TE-PW
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 19:08:36 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPY0K-0008T8-5e
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 19:08:05 -0500
Received: by mail-wr1-x42b.google.com with SMTP id ba1so11124570wrb.5
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 16:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4tTUjj/6z5YIik+WT6J4Jq4VcPmVbs4Ch1nMrvTlVBs=;
 b=J89jpmx03GmYskJDiFaQletafQEWZIlvVTAlfawMaw2+n8iEI4EeRv+ymlv+DGhZya
 /py8QV2GO4sO1cVjfYIVsyBiABi3M94XL+zz9lp7CX8FIbZ2uUEPoP2RRbQZkLzf/wgL
 ZohZPKVT9R5pzTMm73KaptquFnH63UhvMhvV+WcT6dWiKtkW1lLyN2i673twA2SpvAMn
 tL5EglDzcDsamBYBZkb3eIJnC2mBJEI+kTCsl8Lf8sRXeea8X1H7AXtWeBCytaoh29qS
 IWnZlkYPb/0UpEh5OYDzK+VIh2lq4ueaaOy2EmqxqgTcJ7uvrST6mdcTc/LzCC+QAVtg
 sLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4tTUjj/6z5YIik+WT6J4Jq4VcPmVbs4Ch1nMrvTlVBs=;
 b=itCGlBHMi1wrrfuFISf7L4rtbLMBbflEz15We1gVyrAGx+PDT2EM8SVzx0E4aES6Jq
 p5/lcvj1Fcc98fBob9tefjLrn2zVZXlz2NJj77evMXSOum7ZULOJupejAsPk4FXbYGdw
 aQsWBRV9XglMvlL9oOYUn4yELq7+Fn2b8x1qv9+D2AsDhTxWdSDBQsBgodpeBnuDAHB0
 cT78n0OtEqdsOpHL8syM5HvVM11xB7ymfwEW9L+pMcvR3w1audTKWt1uSOgAlisK5Ggy
 QMxUfWNp/G6rV5mbnvguY3pHD+cXGqopnTD+3WWwfkmGQ+DirvxP/0pGpbl95PZ/aCC+
 6Wsw==
X-Gm-Message-State: AO0yUKU8U9rqhKd8on5D8z923GVjUniQ4tCeAEFKxV/aRt1ze7WKKGiJ
 05BClqA335HR+sri3TZpmlkcOHMnZyxMJ1Gk
X-Google-Smtp-Source: AK7set/usesVN1YANfoutF1LkvKDrFw1CQfgDgqbMqApzOvmA23RkazO3RNlGdsPFWcBb0fiTTNVvw==
X-Received: by 2002:a5d:6b88:0:b0:2c3:ea88:5e4d with SMTP id
 n8-20020a5d6b88000000b002c3ea885e4dmr4552313wrx.27.1675814882366; 
 Tue, 07 Feb 2023 16:08:02 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a05600c304a00b003db1ca20170sm230525wmh.37.2023.02.07.16.08.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Feb 2023 16:08:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/7] hw/ide: Rename ISA specific ide_init_ioport() as
 ide_init_ioport_isa()
Date: Wed,  8 Feb 2023 01:07:39 +0100
Message-Id: <20230208000743.79415-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230208000743.79415-1-philmd@linaro.org>
References: <20230208000743.79415-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

Rename ide_init_ioport() as ide_init_ioport_isa() to make
explicit it expects an ISA device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/ioport.c           | 2 +-
 hw/ide/isa.c              | 2 +-
 hw/ide/piix.c             | 4 ++--
 include/hw/ide/internal.h | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/ide/ioport.c b/hw/ide/ioport.c
index e6caa537fa..ac804a89e8 100644
--- a/hw/ide/ioport.c
+++ b/hw/ide/ioport.c
@@ -50,7 +50,7 @@ static const MemoryRegionPortio ide_portio2_list[] = {
     PORTIO_END_OF_LIST(),
 };
 
-int ide_init_ioport(IDEBus *bus, ISADevice *dev, int iobase, int iobase2)
+int ide_init_ioport_isa(IDEBus *bus, ISADevice *dev, int iobase, int iobase2)
 {
     int ret;
 
diff --git a/hw/ide/isa.c b/hw/ide/isa.c
index 8bedbd13f1..4dbd1e48b8 100644
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -74,7 +74,7 @@ static void isa_ide_realizefn(DeviceState *dev, Error **errp)
     ISAIDEState *s = ISA_IDE(dev);
 
     ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
-    ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
+    ide_init_ioport_isa(&s->bus, isadev, s->iobase, s->iobase2);
     s->irq = isa_get_irq(isadev, s->isairq);
     ide_init2(&s->bus, s->irq);
     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 267dbf37db..a587541bb2 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -140,8 +140,8 @@ static int pci_piix_init_ports(PCIIDEState *d)
 
     for (i = 0; i < 2; i++) {
         ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
-        ret = ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
-                              port_info[i].iobase2);
+        ret = ide_init_ioport_isa(&d->bus[i], NULL,
+                                  port_info[i].iobase, port_info[i].iobase2);
         if (ret) {
             return ret;
         }
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index fc0aa81a88..88a096f9df 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -628,7 +628,7 @@ int ide_init_drive(IDEState *s, BlockBackend *blk, IDEDriveKind kind,
                    int chs_trans, Error **errp);
 void ide_init2(IDEBus *bus, qemu_irq irq);
 void ide_exit(IDEState *s);
-int ide_init_ioport(IDEBus *bus, ISADevice *isa, int iobase, int iobase2);
+int ide_init_ioport_isa(IDEBus *bus, ISADevice *isa, int iobase, int iobase2);
 void ide_register_restart_cb(IDEBus *bus);
 
 void ide_exec_cmd(IDEBus *bus, uint32_t val);
-- 
2.38.1


