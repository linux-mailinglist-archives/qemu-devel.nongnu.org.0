Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B210A6980B4
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 17:19:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSKUA-00005Z-2N; Wed, 15 Feb 2023 11:18:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKTn-000895-Uo
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:18:00 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKTl-0008Pz-9V
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:17:59 -0500
Received: by mail-wr1-x42d.google.com with SMTP id r2so19707658wrv.7
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 08:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LaRrQzpsNkq8chPrf481OHT2Dybo/sVF5goX8elaTUo=;
 b=gJNplsGCi34nC2PeByIpDMB8+tuLAp2G4wxiI3bsCguEMb/czRkttBHvVTkSX0Hk4I
 yFYzKSrojVj4lP/PQ67R28TntPZj93ZRLsg4F5JU7xhNJAfeqebtfuqnURrsFstOB9QL
 QeTaoPJYg9FuoQ9M72dGoIhdi6mHTQESUDj2AHwfmqQtXfGi1+T+vqJiCIcHZw9aLRax
 rVgcsidolO3SU0DDRs/6jPvdtSRZuqSriY19q+W/1e8IYxoVX2QrwKWuQIOEp3L/p+kt
 Z9OkBELz5verOI4fauLVlpA1QF3s+zA9oXs5COyccSoLpHf6t/uk78WIQP5BbwmYaM+Y
 ZtPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LaRrQzpsNkq8chPrf481OHT2Dybo/sVF5goX8elaTUo=;
 b=Px+TzQHDphLw3INW1MmrxTAkIP4xctIRu2sF3So56hcK8y2/6fnnEEa1Y4iSX6naTW
 YzfQbBEp+on0OpRwCLCAP07eEc/rFIpKEwviXDbJQ8bH/KxciYPo+OfiQztwWCn3bkTN
 3Dl2saI3qS2pVdj2yrk9niO2nqrchdLFBQUmNJffR24jxAzouoFuxRTbSAApypqCFLaS
 h3lnh/KyIdt2XRngu7/RNdt7hX9chb31bdhMttoNrcIfvqvo45GBtL6iBJROqyauFQUe
 +qCW1asm7i+4J51xxMRNxtPShokFvEcugFG9bgkwHTmPGK1KNq/ELaIpngHBVD/et6/N
 Ywjg==
X-Gm-Message-State: AO0yUKWSfJRzfqXC9PEkkATigjNqnY9Y5G08LhNPicU9ZMoW8YMrfi/j
 kFxQ2dRHS6RFIujS58kmjjhBd6d4nzjmcOlk
X-Google-Smtp-Source: AK7set8B2zcT3QCwyKSmYN1yREr6EGOYKpFrMnSwhqZsyKm4nQBr6EayOSr+KZo4kC16gTDsdTct1Q==
X-Received: by 2002:a5d:6aca:0:b0:2c5:588f:84a0 with SMTP id
 u10-20020a5d6aca000000b002c5588f84a0mr2223236wrw.3.1676477874767; 
 Wed, 15 Feb 2023 08:17:54 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m32-20020a05600c3b2000b003e2066a6339sm1521491wms.5.2023.02.15.08.17.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 08:17:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-ppc@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v2 13/18] hw/ide: Introduce generic ide_init_ioport()
Date: Wed, 15 Feb 2023 17:16:36 +0100
Message-Id: <20230215161641.32663-14-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215161641.32663-1-philmd@linaro.org>
References: <20230215161641.32663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

Add ide_init_ioport() which is not restricted to the ISA bus.
(Next commit will use it for a PCI device).

Inspired-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/ioport.c           | 12 ++++++++++--
 include/hw/ide/internal.h |  2 ++
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/hw/ide/ioport.c b/hw/ide/ioport.c
index d869f8018a..1d4711dd91 100644
--- a/hw/ide/ioport.c
+++ b/hw/ide/ioport.c
@@ -46,8 +46,6 @@ int ide_bus_init_ioport_isa(IDEBus *bus, ISADevice *dev,
 {
     int ret;
 
-    /* ??? Assume only ISA and PCI configurations, and that the PCI-ISA
-       bridge has been setup properly to always register with ISA.  */
     ret = isa_register_portio_list(dev, &bus->portio_list,
                                    iobase, ide_portio_list, bus, "ide");
 
@@ -58,3 +56,13 @@ int ide_bus_init_ioport_isa(IDEBus *bus, ISADevice *dev,
 
     return ret;
 }
+
+void ide_bus_init_ioport(IDEBus *bus, Object *owner, MemoryRegion *io,
+                         int iobase, int iobase2)
+{
+    portio_list_init(&bus->portio_list, owner, ide_portio_list, bus, "ide");
+    portio_list_add(&bus->portio_list, io, iobase);
+
+    portio_list_init(&bus->portio2_list, owner, ide_portio2_list, bus, "ide");
+    portio_list_add(&bus->portio2_list, io, iobase2);
+}
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index d3b7fdc504..6967ca13e0 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -617,6 +617,8 @@ int ide_init_drive(IDEState *s, BlockBackend *blk, IDEDriveKind kind,
                    uint32_t cylinders, uint32_t heads, uint32_t secs,
                    int chs_trans, Error **errp);
 void ide_exit(IDEState *s);
+void ide_bus_init_ioport(IDEBus *bus, Object *owner, MemoryRegion *io,
+                         int iobase, int iobase2);
 void ide_bus_init_output_irq(IDEBus *bus, qemu_irq irq_out);
 void ide_bus_set_irq(IDEBus *bus);
 void ide_bus_register_restart_cb(IDEBus *bus);
-- 
2.38.1


