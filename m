Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 659F469C779
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:16:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2H9-0007LX-GJ; Mon, 20 Feb 2023 04:16:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2GR-0006fM-LA
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:15:15 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2GP-00048C-Bm
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:15:15 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 j2-20020a05600c1c0200b003e1e754657aso449056wms.2
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ASv37aA7sKpH0SiC90y10yVDUKs+omkkQozWOU0yUgc=;
 b=cP2VdLnyazYynhs8JhILPzR/RjhnqJ45T5QWbihxAeY4iHAfYFLgYN59+R+7J6sLha
 g/2tiWt6UGdjk2t7J5NQ5IDTRo1OM5au8swo4svbLJfF9i8uhMSOP8uqkeS1VLe4+OQ3
 kFxkQN2sSfN8mOX2U+NMPwdLNSfKJlJjkqTTHZ4b75jxQT6OCbA7TxyuIVfoCAQQ0CyF
 jJQrJozvV22PzQfsblNUCNbXvMtQvmPfYc0fqvcBb/0zQZu0TQHIYFhfdAKxkQCYaSum
 1ZJOCkT14TUUerI/fClO/BTxiomfzed7j7mKCaYGLyaWUHWyVbjDxrvyleHTUHsIuJSz
 QZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ASv37aA7sKpH0SiC90y10yVDUKs+omkkQozWOU0yUgc=;
 b=uqKYBL9QVFdHb9WDPy4qcyEhZQk42e1MIBrKPN9wrf1MNTdTVk2Zd3T+ID5wp0mxe2
 +hXgP0s8J/uuncRKRogK/KQJmuDPSl2LPZ47LzJFURdMCnyVrhfxdv9A4r7Zq1BeKUKj
 3ihE9Oi0uwPr1pBIr3r3DOcIFi1JtfPt1Ix61PTKDfn13LzR1dF4mAe3+SnLkK2vofax
 EhJwl1eVIN/DeUvuKN3MKXYNHZE8KiBGmwsKGjhC3h7W20SuVqX05cI56x0kW+tqH3/+
 ktqsW9osgtQrOypuC3aHSb5RKJ1ffrJ7gcoxou7T+B5wWqI4HcfiwCWdeThRptxpkCZn
 X0+g==
X-Gm-Message-State: AO0yUKWTZ8hGQI5xwlqufys7EO83bszC73HY0NMlgVgpjnh0G8hvPWIc
 lF00jDNs1YrkjTsYbgjvUBxBkXk5CjrayMDm
X-Google-Smtp-Source: AK7set+daUq3Te3R8g+LsgnDff8XTo463rbG3kjhCqvJQFwxInOrcc0KHrrzY5Sx/kl5rvhZ83K61A==
X-Received: by 2002:a05:600c:4393:b0:3e2:8f1:7684 with SMTP id
 e19-20020a05600c439300b003e208f17684mr11281360wmn.33.1676884511504; 
 Mon, 20 Feb 2023 01:15:11 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a1c7714000000b003dc3f3d77e3sm507650wmi.7.2023.02.20.01.15.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:15:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 14/24] hw/ide: Rename ide_exec_cmd() -> ide_bus_exec_cmd()
Date: Mon, 20 Feb 2023 10:13:48 +0100
Message-Id: <20230220091358.17038-15-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

ide_exec_cmd() operates on a IDEBus; rename it as
ide_bus_exec_cmd() to emphasize its first argument
is a IDEBus.

Mechanical change using:

  $ sed -i -e 's/ide_exec_cmd/ide_bus_exec_cmd/g' \
        $(git grep -wl ide_exec_cmd)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230215112712.23110-14-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/ide/ahci.c             | 2 +-
 hw/ide/core.c             | 6 +++---
 hw/ide/trace-events       | 2 +-
 include/hw/ide/internal.h | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 430961d73b..7f67fb3119 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1269,7 +1269,7 @@ static void handle_reg_h2d_fis(AHCIState *s, int port,
     cmd->status = 0;
 
     /* We're ready to process the command in FIS byte 2. */
-    ide_exec_cmd(&s->dev[port].port, cmd_fis[2]);
+    ide_bus_exec_cmd(&s->dev[port].port, cmd_fis[2]);
 }
 
 static int handle_cmd(AHCIState *s, int port, uint8_t slot)
diff --git a/hw/ide/core.c b/hw/ide/core.c
index 5897411b95..1be0731d1a 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -1327,7 +1327,7 @@ void ide_ioport_write(void *opaque, uint32_t addr, uint32_t val)
     case ATA_IOPORT_WR_COMMAND:
         ide_clear_hob(bus);
         qemu_irq_lower(bus->irq);
-        ide_exec_cmd(bus, val);
+        ide_bus_exec_cmd(bus, val);
         break;
     }
 }
@@ -2123,13 +2123,13 @@ static bool ide_cmd_permitted(IDEState *s, uint32_t cmd)
         && (ide_cmd_table[cmd].flags & (1u << s->drive_kind));
 }
 
-void ide_exec_cmd(IDEBus *bus, uint32_t val)
+void ide_bus_exec_cmd(IDEBus *bus, uint32_t val)
 {
     IDEState *s;
     bool complete;
 
     s = idebus_active_if(bus);
-    trace_ide_exec_cmd(bus, s, val);
+    trace_ide_bus_exec_cmd(bus, s, val);
 
     /* ignore commands to non existent slave */
     if (s != bus->ifs && !s->blk) {
diff --git a/hw/ide/trace-events b/hw/ide/trace-events
index 15d7921f15..a394c05710 100644
--- a/hw/ide/trace-events
+++ b/hw/ide/trace-events
@@ -12,7 +12,7 @@ ide_data_writew(uint32_t addr, uint32_t val, void *bus, void *s)
 ide_data_readl(uint32_t addr, uint32_t val, void *bus, void *s)                    "IDE PIO rd @ 0x%"PRIx32" (Data: Long); val 0x%08"PRIx32"; bus %p; IDEState %p"
 ide_data_writel(uint32_t addr, uint32_t val, void *bus, void *s)                   "IDE PIO wr @ 0x%"PRIx32" (Data: Long); val 0x%08"PRIx32"; bus %p; IDEState %p"
 # misc
-ide_exec_cmd(void *bus, void *state, uint32_t cmd) "IDE exec cmd: bus %p; state %p; cmd 0x%02x"
+ide_bus_exec_cmd(void *bus, void *state, uint32_t cmd) "IDE exec cmd: bus %p; state %p; cmd 0x%02x"
 ide_cancel_dma_sync_buffered(void *fn, void *req) "invoking cb %p of buffered request %p with -ECANCELED"
 ide_cancel_dma_sync_remaining(void) "draining all remaining requests"
 ide_sector_read(int64_t sector_num, int nsectors) "sector=%"PRId64" nsectors=%d"
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index cc95cd47a0..11a4931ef9 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -622,7 +622,7 @@ int ide_init_ioport(IDEBus *bus, ISADevice *isa, int iobase, int iobase2);
 void ide_bus_set_irq(IDEBus *bus);
 void ide_bus_register_restart_cb(IDEBus *bus);
 
-void ide_exec_cmd(IDEBus *bus, uint32_t val);
+void ide_bus_exec_cmd(IDEBus *bus, uint32_t val);
 
 void ide_transfer_start(IDEState *s, uint8_t *buf, int size,
                         EndTransferFunc *end_transfer_func);
-- 
2.38.1


