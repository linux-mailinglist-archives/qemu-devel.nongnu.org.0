Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BDE697ABB
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 12:29:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFxZ-0002Mm-4R; Wed, 15 Feb 2023 06:28:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFxU-0002GE-Q3
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:28:20 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFxS-0003Uj-Sw
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:28:20 -0500
Received: by mail-wr1-x430.google.com with SMTP id k3so11157536wrv.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 03:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U9n13Foi0ErQ6OC7/roMBYkEn0qpFSwKmzmZdhfgQDc=;
 b=dID64q3o2VmeIpcwtQair1pKubKZ+5w2qL2zzN/M+gryqcUu/blGLLnTsIl0/kcaag
 BkBbsECdYNmrBTwU6PV1/TpqBYjeXb7gOUailOMBrG1qdrmyjnIJC5ApwGpewK4hBRXz
 ZAib58+S4olQJ0yPKqrqhlC12hd4Jg1IHQCK7KpLdb7Y5Dx0rPwb1WczS2vzLZMMaawt
 J2d3nHaxbiphF8tiWh05UOgFmEuvcf6374UG1NpxI1Rx5utpP0nYtaTb2TDtfRssnc6e
 pZ7rpmk2K61Z8aFvBk6NWjG5S06i21LzhXlDUsaiJtJyZmdGpWNegNuFy6sGuax3OEUc
 dh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U9n13Foi0ErQ6OC7/roMBYkEn0qpFSwKmzmZdhfgQDc=;
 b=R1diIjMSewGKtA9KN/39QpViEWJk31u120SMBmLg6lDYsgyuiCW1vOwwwEsLxrHpsG
 dZI8SmUUj12KvwDZ+14uDEcFmArdd+uKsPEnTWzZvupdZegAYmGHu/NI6sjcL9Kyoibc
 uNE+MlfUNDgMsN2IsNPm1A4r1Z0bstiaRLLo60sOgXlgVWWhoUQW+nrxnxeZbTs4Xv5P
 nxYSqr+WoqQtZp3qcRWoA41TnP4XrIMY0LkShHBxFh7A/Xi1EHApd2BZsFIH/29OgrXa
 cLZRou5wfCakwKxGmkS6Ma+PPDPpfTppasM/40s0guGrtuX6thTB845wtDcglTuCUIvJ
 5fTw==
X-Gm-Message-State: AO0yUKVz1YdTkp8Q3P5xPO/Hmpuoj0rEZWVOItEGk3ocNgSazeGSrEe/
 Sq9lWO2u/IAGwkn87hU6KSLCn0pV/5keRBcl
X-Google-Smtp-Source: AK7set9FFrJWbH4143pXW6ycUg9/FJ4CNqj9X12n9D4otzR1oPbIJykxOYrZqVeQJwEPcEN8CAgKoA==
X-Received: by 2002:adf:cc8d:0:b0:2c4:57d3:396 with SMTP id
 p13-20020adfcc8d000000b002c457d30396mr1404115wrj.40.1676460497834; 
 Wed, 15 Feb 2023 03:28:17 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 a1-20020adff7c1000000b002c54a2037d1sm13207148wrq.75.2023.02.15.03.28.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 03:28:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 13/20] hw/ide: Rename ide_exec_cmd() -> ide_bus_exec_cmd()
Date: Wed, 15 Feb 2023 12:27:05 +0100
Message-Id: <20230215112712.23110-14-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215112712.23110-1-philmd@linaro.org>
References: <20230215112712.23110-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

ide_exec_cmd() operates on a IDEBus; rename it as
ide_bus_exec_cmd() to emphasize its first argument
is a IDEBus.

Mechanical change using:

  $ sed -i -e 's/ide_exec_cmd/ide_bus_exec_cmd/g' \
        $(git grep -wl ide_exec_cmd)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


