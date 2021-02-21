Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F69320B3C
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 16:04:23 +0100 (CET)
Received: from localhost ([::1]:51066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDqHW-00005r-Bs
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 10:04:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDprE-00085P-8R
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:12 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:47093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDprC-0003Kg-F0
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:11 -0500
Received: by mail-wr1-x433.google.com with SMTP id t15so16280052wrx.13
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hED45YkFX7dQQtdpVYESE6TbcISGcjER5uTihGzAYxM=;
 b=m8bcZ3L/FTfTpG9hoJr+1PuI6zyp9yMu3k0c1WE2jlwjRq+PXSMHUCufse/GGJ17nN
 HIJVJlbxWzpZvRDhCiCNGUap0Ek9E500lCiHYyDmBPR55vi6thU9RU6J9fWtUpfqluPG
 QMcJ8Z+8vSyV60j4FoWFPNvhr1JCfxi0mLxDKH9Jd50s9U1VweLZfgOF3xC3zhU8Ph+r
 RT9H5kCpjI4v3EDcv/mPpJKbKF5pucMWWayjzeFzAQsAHOo3juL8ofcDu++Oa1RAa7lE
 5ucd+m1LivUx6MFTaUgVbS3D0YftlteIQIeQYdKKt4+zmrHf4FWgPRlqhKbVT6FlB8nh
 5ZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hED45YkFX7dQQtdpVYESE6TbcISGcjER5uTihGzAYxM=;
 b=aWADWt7UMSGRr/D+/ISh0rw6fjebUhTmZV8c9XRKecrU3/BrrzsFYlXhYpFL7Oem8w
 e6SEm23MHqo4qzdCqQgUeRLNUulq/+Jjk5YqG26YJpts6TmrWB1Yl8jlEOrNmrqge9UC
 OrkSO9UMlE+LFNzdQvILLmXnXLHUrdUt6uFRr2gKUC5vtNMYn2g6T7LTooIxIuJXBlg/
 9jDOMgQZFkfTaePGsVdpa/btxpvnkUydSjJ7Y1pWMP1KvOPU5a7tJisxT4hbaGZOBb7s
 aydMIXEaJFWdga3KBw6OTil7RiN1o06nRk637g1oLzdeS7ucN066DeLObP1d0Zd8jhRx
 A35Q==
X-Gm-Message-State: AOAM530wLNUycjUXOhE0uJbbnb/EHjN89VsBy7IdL7sQF+uOFiTsQEWI
 BY5savsAAq76l5y+SKyh3QOFN6KbS9w=
X-Google-Smtp-Source: ABdhPJy1gbOXV8xT02RLql9pvOIsoCULv4x2M8OwxfKaVdEE1+EDDjSzWafw8ntHkm9X8x3u5nYk6w==
X-Received: by 2002:adf:82b3:: with SMTP id 48mr17144476wrc.22.1613918228811; 
 Sun, 21 Feb 2021 06:37:08 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b13sm24044681wrs.35.2021.02.21.06.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:37:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/43] vt82c686: Make vt82c686-pm an I/O tracing region
Date: Sun, 21 Feb 2021 15:34:20 +0100
Message-Id: <20210221143432.2468220-32-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Previously just an empty RAM region was mapped on realize, now we add
an empty io range logging access instead. I think the pm timer should
be hooked up here but not sure guests need it. PMON on fuloong2e sets
a base address but does not seem to enable region; the pegasos2
firmware pokes some regs but continues anyway so don't know if
anything would make use of these facilities. Therefore this is just a
clean up of previous state for now and not intending to fully
implement missing functionality which could be done later if some
guests need it.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <cff9b2442d3e2e1cfbdcbc2dfbb559031b4b1cc1.1610223397.git.balaton@eik.bme.hu>
[PMD: Split original patch, this is part 1/4
      (make 'vt82c686-pm' an I/O tracing region)]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c   | 26 ++++++++++++++++++++++++--
 hw/isa/trace-events |  2 ++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 9c4d1530225..7e6a07fca48 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -102,6 +102,27 @@ static void pm_write_config(PCIDevice *d, uint32_t addr, uint32_t val, int len)
     }
 }
 
+static void pm_io_write(void *op, hwaddr addr, uint64_t data, unsigned size)
+{
+    trace_via_pm_io_write(addr, data, size);
+}
+
+static uint64_t pm_io_read(void *op, hwaddr addr, unsigned size)
+{
+    trace_via_pm_io_read(addr, 0, size);
+    return 0;
+}
+
+static const MemoryRegionOps pm_io_ops = {
+    .read = pm_io_read,
+    .write = pm_io_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {
+        .min_access_size = 1,
+        .max_access_size = 1,
+    },
+};
+
 static void pm_update_sci(VT686PMState *s)
 {
     int sci_level, pmsts;
@@ -154,9 +175,10 @@ static void vt82c686b_pm_realize(PCIDevice *dev, Error **errp)
 
     apm_init(dev, &s->apm, NULL, s);
 
-    memory_region_init(&s->io, OBJECT(dev), "vt82c686-pm", 64);
+    memory_region_init_io(&s->io, OBJECT(dev), &pm_io_ops, s,
+                          "vt82c686-pm", 64);
+    memory_region_add_subregion(pci_address_space_io(dev), 0, &s->io);
     memory_region_set_enabled(&s->io, false);
-    memory_region_add_subregion(get_system_io(), 0, &s->io);
 
     acpi_pm_tmr_init(&s->ar, pm_tmr_timer, &s->io);
     acpi_pm1_evt_init(&s->ar, pm_tmr_timer, &s->io);
diff --git a/hw/isa/trace-events b/hw/isa/trace-events
index d267d3e6524..641d69eedf7 100644
--- a/hw/isa/trace-events
+++ b/hw/isa/trace-events
@@ -17,5 +17,7 @@ apm_io_write(uint8_t addr, uint8_t val) "write addr=0x%x val=0x%02x"
 # vt82c686.c
 via_isa_write(uint32_t addr, uint32_t val, int len) "addr 0x%x val 0x%x len 0x%x"
 via_pm_write(uint32_t addr, uint32_t val, int len) "addr 0x%x val 0x%x len 0x%x"
+via_pm_io_read(uint32_t addr, uint32_t val, int len) "addr 0x%x val 0x%x len 0x%x"
+via_pm_io_write(uint32_t addr, uint32_t val, int len) "addr 0x%x val 0x%x len 0x%x"
 via_superio_read(uint8_t addr, uint8_t val) "addr 0x%x val 0x%x"
 via_superio_write(uint8_t addr, uint32_t val) "addr 0x%x val 0x%x"
-- 
2.26.2


