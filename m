Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC82697AB4
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 12:29:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFy3-00032H-7W; Wed, 15 Feb 2023 06:28:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFxf-0002oZ-66
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:28:31 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFxd-0003hw-D0
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:28:30 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 m20-20020a05600c3b1400b003e1e754657aso1317195wms.2
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 03:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VMQABnxD1Beh0f+S34hrwat9iJbN0H6rcMTsrC1rcF8=;
 b=yUYYI549UEBpofrzoW/TFlPj2NU061wv6P+OENpn52LHkwfbXaV9PVXu6Y+n7Yaj9G
 6hRs5q2y8YH5zBPzmqRiRdbe+8AXOOK9/KyfUAiVR0JTM0NZ0wujpEuZagIOw9+AiQZl
 GhyQU5Hc/FrOEHVx6LufTtHmRIElIS46tfbViX5kCD3/TePzuRMYDtvf9onHSYQYzfPe
 S/psxGDh2nIskiqBcporKLo4VgQKvXvWJ5EG6CRlTTIyitdLtElR+P3JI0nDRADPK4Na
 cdTrC3KMOA6KKtz3jg/LR2eSUaiW4K4UNVgqlTuQNgN/4HtCLyCaosqLtGJRpXNixmsO
 W9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VMQABnxD1Beh0f+S34hrwat9iJbN0H6rcMTsrC1rcF8=;
 b=po6StdQ1FW7Skxn55232WS/grgr1Fxer5jkkskNhPrwhBYOE94hWRhcR+Fl5mFHGcF
 bCClqXnNnaD5wNesrwmqOwoVmYHpcYBcQAihLDFl81Lx7LPOulPYS11Rwrdwe+zd/ie7
 i3xpZtLehz+vGlUfPtYpw/q28pOPbPdLeDxGERxzVrdIEsFn+D1OpzCt8H+bJJZTUPI8
 yZV10OcSxGe+4NlmXSFDmB1YrMDAyZw4I6unibiBs1CxzKvWXdjxSM9eWIbJiX8lCD1O
 qi2HABxjgK9F4b0wfx2kockf0+fyQvNusB9Sm7QhuCSZBLKaJpKaPeNHc2J/lSfSwQep
 9TfA==
X-Gm-Message-State: AO0yUKXPWyDVAZ+n6q8KLQHcRQxPVfdcjPRgQVG9njhqRk2u2NRVfvVA
 yqAd1O0BaJhx3XaTDfoECpdKwmRQwJzWHAwq
X-Google-Smtp-Source: AK7set/v2+OQonlNW5pNn4zA8Nf4YRQ1dhkGGuoic9DDwE9+Lt27TFa5VS/AqxXTIEmpkMb8M4yaTA==
X-Received: by 2002:a05:600c:30ca:b0:3df:12ac:7cc9 with SMTP id
 h10-20020a05600c30ca00b003df12ac7cc9mr1680682wmn.15.1676460507820; 
 Wed, 15 Feb 2023 03:28:27 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m32-20020a05600c3b2000b003e2066a6339sm611155wms.5.2023.02.15.03.28.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 03:28:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 15/20] hw/ide: Rename idebus_active_if() -> ide_bus_active_if()
Date: Wed, 15 Feb 2023 12:27:07 +0100
Message-Id: <20230215112712.23110-16-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215112712.23110-1-philmd@linaro.org>
References: <20230215112712.23110-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

idebus_active_if() operates on a IDEBus; rename it as
ide_bus_active_if() to emphasize its first argument
is a IDEBus.

Mechanical change using:

  $ sed -i -e 's/idebus_active_if/ide_bus_active_if/g' \
        $(git grep -l idebus_active_if)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/core.c             | 18 +++++++++---------
 hw/ide/macio.c            |  8 ++++----
 hw/ide/microdrive.c       |  4 ++--
 hw/ide/pci.c              |  2 +-
 include/hw/ide/internal.h |  2 +-
 5 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index fd2215c506..2d034731cf 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -1265,7 +1265,7 @@ const char *ATA_IOPORT_WR_lookup[ATA_IOPORT_WR_NUM_REGISTERS] = {
 void ide_ioport_write(void *opaque, uint32_t addr, uint32_t val)
 {
     IDEBus *bus = opaque;
-    IDEState *s = idebus_active_if(bus);
+    IDEState *s = ide_bus_active_if(bus);
     int reg_num = addr & 7;
 
     trace_ide_ioport_write(addr, ATA_IOPORT_WR_lookup[reg_num], val, bus, s);
@@ -2128,7 +2128,7 @@ void ide_bus_exec_cmd(IDEBus *bus, uint32_t val)
     IDEState *s;
     bool complete;
 
-    s = idebus_active_if(bus);
+    s = ide_bus_active_if(bus);
     trace_ide_bus_exec_cmd(bus, s, val);
 
     /* ignore commands to non existent slave */
@@ -2195,7 +2195,7 @@ const char *ATA_IOPORT_RR_lookup[ATA_IOPORT_RR_NUM_REGISTERS] = {
 uint32_t ide_ioport_read(void *opaque, uint32_t addr)
 {
     IDEBus *bus = opaque;
-    IDEState *s = idebus_active_if(bus);
+    IDEState *s = ide_bus_active_if(bus);
     uint32_t reg_num;
     int ret, hob;
 
@@ -2281,7 +2281,7 @@ uint32_t ide_ioport_read(void *opaque, uint32_t addr)
 uint32_t ide_status_read(void *opaque, uint32_t addr)
 {
     IDEBus *bus = opaque;
-    IDEState *s = idebus_active_if(bus);
+    IDEState *s = ide_bus_active_if(bus);
     int ret;
 
     if ((!bus->ifs[0].blk && !bus->ifs[1].blk) ||
@@ -2370,7 +2370,7 @@ static bool ide_is_pio_out(IDEState *s)
 void ide_data_writew(void *opaque, uint32_t addr, uint32_t val)
 {
     IDEBus *bus = opaque;
-    IDEState *s = idebus_active_if(bus);
+    IDEState *s = ide_bus_active_if(bus);
     uint8_t *p;
 
     trace_ide_data_writew(addr, val, bus, s);
@@ -2406,7 +2406,7 @@ void ide_data_writew(void *opaque, uint32_t addr, uint32_t val)
 uint32_t ide_data_readw(void *opaque, uint32_t addr)
 {
     IDEBus *bus = opaque;
-    IDEState *s = idebus_active_if(bus);
+    IDEState *s = ide_bus_active_if(bus);
     uint8_t *p;
     int ret;
 
@@ -2444,7 +2444,7 @@ uint32_t ide_data_readw(void *opaque, uint32_t addr)
 void ide_data_writel(void *opaque, uint32_t addr, uint32_t val)
 {
     IDEBus *bus = opaque;
-    IDEState *s = idebus_active_if(bus);
+    IDEState *s = ide_bus_active_if(bus);
     uint8_t *p;
 
     trace_ide_data_writel(addr, val, bus, s);
@@ -2472,7 +2472,7 @@ void ide_data_writel(void *opaque, uint32_t addr, uint32_t val)
 uint32_t ide_data_readl(void *opaque, uint32_t addr)
 {
     IDEBus *bus = opaque;
-    IDEState *s = idebus_active_if(bus);
+    IDEState *s = ide_bus_active_if(bus);
     uint8_t *p;
     int ret;
 
@@ -2711,7 +2711,7 @@ static void ide_restart_bh(void *opaque)
         return;
     }
 
-    s = idebus_active_if(bus);
+    s = ide_bus_active_if(bus);
     is_read = (bus->error_status & IDE_RETRY_READ) != 0;
 
     /* The error status must be cleared before resubmitting the request: The
diff --git a/hw/ide/macio.c b/hw/ide/macio.c
index 6be29e44bc..dca1cc9efc 100644
--- a/hw/ide/macio.c
+++ b/hw/ide/macio.c
@@ -60,7 +60,7 @@ static void pmac_ide_atapi_transfer_cb(void *opaque, int ret)
 {
     DBDMA_io *io = opaque;
     MACIOIDEState *m = io->opaque;
-    IDEState *s = idebus_active_if(&m->bus);
+    IDEState *s = ide_bus_active_if(&m->bus);
     int64_t offset;
 
     MACIO_DPRINTF("pmac_ide_atapi_transfer_cb\n");
@@ -136,7 +136,7 @@ static void pmac_ide_transfer_cb(void *opaque, int ret)
 {
     DBDMA_io *io = opaque;
     MACIOIDEState *m = io->opaque;
-    IDEState *s = idebus_active_if(&m->bus);
+    IDEState *s = ide_bus_active_if(&m->bus);
     int64_t offset;
 
     MACIO_DPRINTF("pmac_ide_transfer_cb\n");
@@ -220,7 +220,7 @@ done:
 static void pmac_ide_transfer(DBDMA_io *io)
 {
     MACIOIDEState *m = io->opaque;
-    IDEState *s = idebus_active_if(&m->bus);
+    IDEState *s = ide_bus_active_if(&m->bus);
 
     MACIO_DPRINTF("\n");
 
@@ -251,7 +251,7 @@ static void pmac_ide_transfer(DBDMA_io *io)
 static void pmac_ide_flush(DBDMA_io *io)
 {
     MACIOIDEState *m = io->opaque;
-    IDEState *s = idebus_active_if(&m->bus);
+    IDEState *s = ide_bus_active_if(&m->bus);
 
     if (s->bus->dma->aiocb) {
         blk_drain(s->blk);
diff --git a/hw/ide/microdrive.c b/hw/ide/microdrive.c
index 84452ae4ef..f1017f7333 100644
--- a/hw/ide/microdrive.c
+++ b/hw/ide/microdrive.c
@@ -250,14 +250,14 @@ static uint16_t md_common_read(PCMCIACardState *card, uint32_t at)
     case 0xd:	/* Error */
         return ide_ioport_read(&s->bus, 0x1);
     case 0xe:	/* Alternate Status */
-        ifs = idebus_active_if(&s->bus);
+        ifs = ide_bus_active_if(&s->bus);
         if (ifs->blk) {
             return ifs->status;
         } else {
             return 0;
         }
     case 0xf:	/* Device Address */
-        ifs = idebus_active_if(&s->bus);
+        ifs = ide_bus_active_if(&s->bus);
         return 0xc2 | ((~ifs->select << 2) & 0x3c);
     default:
         return ide_ioport_read(&s->bus, at);
diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index 4223f5e64d..2ddcb49b27 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -296,7 +296,7 @@ void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val)
     /* Ignore writes to SSBM if it keeps the old value */
     if ((val & BM_CMD_START) != (bm->cmd & BM_CMD_START)) {
         if (!(val & BM_CMD_START)) {
-            ide_cancel_dma_sync(idebus_active_if(bm->bus));
+            ide_cancel_dma_sync(ide_bus_active_if(bm->bus));
             bm->status &= ~BM_STATUS_DMAING;
         } else {
             bm->cur_addr = bm->addr;
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index c687282a78..c2b794150f 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -566,7 +566,7 @@ static inline uint8_t ide_dma_cmd_to_retry(uint8_t dma_cmd)
     return 0;
 }
 
-static inline IDEState *idebus_active_if(IDEBus *bus)
+static inline IDEState *ide_bus_active_if(IDEBus *bus)
 {
     return bus->ifs + bus->unit;
 }
-- 
2.38.1


