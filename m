Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D066BA591
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 04:28:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcHn8-0002sV-1y; Tue, 14 Mar 2023 23:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fufuyqqqqqq@gmail.com>)
 id 1pcHn5-0002s2-Bb
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 23:27:03 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fufuyqqqqqq@gmail.com>)
 id 1pcHn0-0006Gy-LR
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 23:27:03 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 k18-20020a17090a591200b0023d36e30cb5so491978pji.1
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 20:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678850817;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KoeK2QmBKq/7SoxX8fSAmS1ZrA4pzLseU14u5GSz67Y=;
 b=FSTkoRu0mC3YGU4Wyejucr2RBzYHNEQFG1yh9S+BFksDPhwk6xAQweGFBn1pZJs7H4
 TWjWRDEozYX8CsZufdvAELXUmE2v+xUQX27Y7gMA+hxxaxHrzG+Uq+dwIcKsGLAxY/SB
 0xeKHnwwB9TS3F6pJB4fH88pq5hNmLFG7Xr1fC9d2msJpiTMSlNZzpRhO5Q9o+6LMQDA
 NJxNDWOdWsGi6VefuqgbPjP0hfCD6TQqptCsUb80QzIbkj3/d7vWnJaJTAw/Ox+WvjL5
 LBvf1bK/vSAF/I3vcP5vnEm91Pk8E/SnOp4TIotLfU316volf+LhfyUcnsucFtGUjPOW
 XEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678850817;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KoeK2QmBKq/7SoxX8fSAmS1ZrA4pzLseU14u5GSz67Y=;
 b=bswB8GvW4sK+ke0E/5coqeWtS2oq+uspsTKEo0vXbDxQye8BFHMw5jAUpLfOx5TWnu
 45t2rtJY+LhwL0cqbotHla/WVXwBzFhgzfu+axmxyUXshKD2co6wybATMh6HozGBYiDx
 Y2DdlBVx+7tW/Jc8ZLUUCQMqEc6YUD3MjPyCSsF4antBE5w2eMlMJ5efNdP1kTbIuian
 GtloiTJiCPmYC8QHX4uWd1oTNHGCKHS8H2jzpzEeSZQJwFUrsBuGVEUDgw+F2HNakx9W
 +8eu3QptXBie6FcOBt4yU0pnPKjxBz0zD6wnW/0Vi0y/t/mew8weeoJDPfBEIHar/jRF
 l1qw==
X-Gm-Message-State: AO0yUKUC3TjOaIYB+CnxOmzKJvsngoR6RkrScnvlaeoEmQbT0aoZCFh0
 MMdEPwRn3EzqkVKftDocII0=
X-Google-Smtp-Source: AK7set9cmwB0LxChOT5fxnqP+SqXPbY6oM4YIaJzIW18J52UNA08on9akRT0NrPvkVmlE6X0ioSJYQ==
X-Received: by 2002:a17:90a:1d1:b0:237:2edb:d4e3 with SMTP id
 17-20020a17090a01d100b002372edbd4e3mr19600374pjd.27.1678850815973; 
 Tue, 14 Mar 2023 20:26:55 -0700 (PDT)
Received: from localhost.localdomain ([221.216.116.64])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a17090a9c0e00b0023d270929bbsm192054pjp.49.2023.03.14.20.26.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 Mar 2023 20:26:55 -0700 (PDT)
From: Yeqi Fu <fufuyqqqqqq@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Yeqi Fu <fufuyqqqqqq@gmail.com>
Subject: [PATCH] replace TABs with spaces
Date: Wed, 15 Mar 2023 11:26:49 +0800
Message-Id: <20230315032649.57568-1-fufuyqqqqqq@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=fufuyqqqqqq@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Bring the files in line with the QEMU coding style, with spaces
for indentation.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/378
Signed-off-by: Yeqi Fu <fufuyqqqqqq@gmail.com>
---
 chardev/baum.c                |   66 +-
 hw/char/parallel.c            |   24 +-
 hw/char/serial.c              |   68 +-
 hw/core/loader.c              |   42 +-
 hw/dma/etraxfs_dma.c          |  834 +++++++--------
 hw/gpio/max7310.c             |   22 +-
 hw/input/ads7846.c            |   54 +-
 hw/rtc/m48t59.c               |  150 +--
 hw/rtc/twl92230.c             |  160 +--
 hw/scsi/scsi-bus.c            |    4 +-
 hw/sd/sd.c                    |  184 ++--
 hw/watchdog/wdt_ib700.c       |    2 +-
 include/crypto/aes.h          |    8 +-
 include/crypto/desrfb.h       |   16 +-
 include/disas/dis-asm.h       |   68 +-
 include/elf.h                 | 1800 ++++++++++++++++-----------------
 include/exec/cpu-all.h        |    2 +-
 include/hw/acpi/acpi.h        |    4 +-
 include/hw/elf_ops.h          |   42 +-
 include/hw/pci/pci_bridge.h   |   10 +-
 include/hw/pcmcia.h           |   32 +-
 include/hw/scsi/scsi.h        |    2 +-
 include/hw/sd/sd.h            |    8 +-
 include/hw/virtio/virtio.h    |    2 +-
 include/qemu/bitmap.h         |   52 +-
 include/qemu/compiler.h       |    4 +-
 include/qemu/uri.h            |   32 +-
 pc-bios/optionrom/optionrom.h |  262 ++---
 softmmu/physmem.c             |    2 +-
 tests/unit/test-rcu-list.c    |    2 +-
 util/bitops.c                 |    8 +-
 util/envlist.c                |  202 ++--
 32 files changed, 2084 insertions(+), 2084 deletions(-)

diff --git a/chardev/baum.c b/chardev/baum.c
index 0a0d12661a..a1d9784d92 100644
--- a/chardev/baum.c
+++ b/chardev/baum.c
@@ -44,39 +44,39 @@
 
 #define ESC 0x1B
 
-#define BAUM_REQ_DisplayData		0x01
-#define BAUM_REQ_GetVersionNumber	0x05
-#define BAUM_REQ_GetKeys		0x08
-#define BAUM_REQ_SetMode		0x12
-#define BAUM_REQ_SetProtocol		0x15
-#define BAUM_REQ_GetDeviceIdentity	0x84
-#define BAUM_REQ_GetSerialNumber	0x8A
-
-#define BAUM_RSP_CellCount		0x01
-#define BAUM_RSP_VersionNumber		0x05
-#define BAUM_RSP_ModeSetting		0x11
-#define BAUM_RSP_CommunicationChannel	0x16
-#define BAUM_RSP_PowerdownSignal	0x17
-#define BAUM_RSP_HorizontalSensors	0x20
-#define BAUM_RSP_VerticalSensors	0x21
-#define BAUM_RSP_RoutingKeys		0x22
-#define BAUM_RSP_Switches		0x23
-#define BAUM_RSP_TopKeys		0x24
-#define BAUM_RSP_HorizontalSensor	0x25
-#define BAUM_RSP_VerticalSensor		0x26
-#define BAUM_RSP_RoutingKey		0x27
-#define BAUM_RSP_FrontKeys6		0x28
-#define BAUM_RSP_BackKeys6		0x29
-#define BAUM_RSP_CommandKeys		0x2B
-#define BAUM_RSP_FrontKeys10		0x2C
-#define BAUM_RSP_BackKeys10		0x2D
-#define BAUM_RSP_EntryKeys		0x33
-#define BAUM_RSP_JoyStick		0x34
-#define BAUM_RSP_ErrorCode		0x40
-#define BAUM_RSP_InfoBlock		0x42
-#define BAUM_RSP_DeviceIdentity		0x84
-#define BAUM_RSP_SerialNumber		0x8A
-#define BAUM_RSP_BluetoothName		0x8C
+#define BAUM_REQ_DisplayData            0x01
+#define BAUM_REQ_GetVersionNumber       0x05
+#define BAUM_REQ_GetKeys                0x08
+#define BAUM_REQ_SetMode                0x12
+#define BAUM_REQ_SetProtocol            0x15
+#define BAUM_REQ_GetDeviceIdentity      0x84
+#define BAUM_REQ_GetSerialNumber        0x8A
+
+#define BAUM_RSP_CellCount              0x01
+#define BAUM_RSP_VersionNumber          0x05
+#define BAUM_RSP_ModeSetting            0x11
+#define BAUM_RSP_CommunicationChannel   0x16
+#define BAUM_RSP_PowerdownSignal        0x17
+#define BAUM_RSP_HorizontalSensors      0x20
+#define BAUM_RSP_VerticalSensors        0x21
+#define BAUM_RSP_RoutingKeys            0x22
+#define BAUM_RSP_Switches               0x23
+#define BAUM_RSP_TopKeys                0x24
+#define BAUM_RSP_HorizontalSensor       0x25
+#define BAUM_RSP_VerticalSensor         0x26
+#define BAUM_RSP_RoutingKey             0x27
+#define BAUM_RSP_FrontKeys6             0x28
+#define BAUM_RSP_BackKeys6              0x29
+#define BAUM_RSP_CommandKeys            0x2B
+#define BAUM_RSP_FrontKeys10            0x2C
+#define BAUM_RSP_BackKeys10             0x2D
+#define BAUM_RSP_EntryKeys              0x33
+#define BAUM_RSP_JoyStick               0x34
+#define BAUM_RSP_ErrorCode              0x40
+#define BAUM_RSP_InfoBlock              0x42
+#define BAUM_RSP_DeviceIdentity         0x84
+#define BAUM_RSP_SerialNumber           0x8A
+#define BAUM_RSP_BluetoothName          0x8C
 
 #define BAUM_TL1 0x01
 #define BAUM_TL2 0x02
diff --git a/hw/char/parallel.c b/hw/char/parallel.c
index 1c9ca47820..af551e7864 100644
--- a/hw/char/parallel.c
+++ b/hw/char/parallel.c
@@ -57,22 +57,22 @@
 /*
  * These are the definitions for the Printer Status Register
  */
-#define PARA_STS_BUSY	0x80	/* Busy complement */
-#define PARA_STS_ACK	0x40	/* Acknowledge */
-#define PARA_STS_PAPER	0x20	/* Out of paper */
-#define PARA_STS_ONLINE	0x10	/* Online */
-#define PARA_STS_ERROR	0x08	/* Error complement */
-#define PARA_STS_TMOUT	0x01	/* EPP timeout */
+#define PARA_STS_BUSY   0x80    /* Busy complement */
+#define PARA_STS_ACK    0x40    /* Acknowledge */
+#define PARA_STS_PAPER  0x20    /* Out of paper */
+#define PARA_STS_ONLINE 0x10    /* Online */
+#define PARA_STS_ERROR  0x08    /* Error complement */
+#define PARA_STS_TMOUT  0x01    /* EPP timeout */
 
 /*
  * These are the definitions for the Printer Control Register
  */
-#define PARA_CTR_DIR	0x20	/* Direction (1=read, 0=write) */
-#define PARA_CTR_INTEN	0x10	/* IRQ Enable */
-#define PARA_CTR_SELECT	0x08	/* Select In complement */
-#define PARA_CTR_INIT	0x04	/* Initialize Printer complement */
-#define PARA_CTR_AUTOLF	0x02	/* Auto linefeed complement */
-#define PARA_CTR_STROBE	0x01	/* Strobe complement */
+#define PARA_CTR_DIR    0x20    /* Direction (1=read, 0=write) */
+#define PARA_CTR_INTEN  0x10    /* IRQ Enable */
+#define PARA_CTR_SELECT 0x08    /* Select In complement */
+#define PARA_CTR_INIT   0x04    /* Initialize Printer complement */
+#define PARA_CTR_AUTOLF 0x02    /* Auto linefeed complement */
+#define PARA_CTR_STROBE 0x01    /* Strobe complement */
 
 #define PARA_CTR_SIGNAL (PARA_CTR_SELECT|PARA_CTR_INIT|PARA_CTR_AUTOLF|PARA_CTR_STROBE)
 
diff --git a/hw/char/serial.c b/hw/char/serial.c
index 41b5e61977..270e1b1094 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -38,20 +38,20 @@
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 
-#define UART_LCR_DLAB	0x80	/* Divisor latch access bit */
+#define UART_LCR_DLAB   0x80    /* Divisor latch access bit */
 
-#define UART_IER_MSI	0x08	/* Enable Modem status interrupt */
-#define UART_IER_RLSI	0x04	/* Enable receiver line status interrupt */
-#define UART_IER_THRI	0x02	/* Enable Transmitter holding register int. */
-#define UART_IER_RDI	0x01	/* Enable receiver data interrupt */
+#define UART_IER_MSI    0x08    /* Enable Modem status interrupt */
+#define UART_IER_RLSI   0x04    /* Enable receiver line status interrupt */
+#define UART_IER_THRI   0x02    /* Enable Transmitter holding register int. */
+#define UART_IER_RDI    0x01    /* Enable receiver data interrupt */
 
-#define UART_IIR_NO_INT	0x01	/* No interrupts pending */
-#define UART_IIR_ID	0x06	/* Mask for the interrupt ID */
+#define UART_IIR_NO_INT 0x01    /* No interrupts pending */
+#define UART_IIR_ID     0x06    /* Mask for the interrupt ID */
 
-#define UART_IIR_MSI	0x00	/* Modem status interrupt */
-#define UART_IIR_THRI	0x02	/* Transmitter holding register empty */
-#define UART_IIR_RDI	0x04	/* Receiver data interrupt */
-#define UART_IIR_RLSI	0x06	/* Receiver line status interrupt */
+#define UART_IIR_MSI    0x00    /* Modem status interrupt */
+#define UART_IIR_THRI   0x02    /* Transmitter holding register empty */
+#define UART_IIR_RDI    0x04    /* Receiver data interrupt */
+#define UART_IIR_RLSI   0x06    /* Receiver line status interrupt */
 #define UART_IIR_CTI    0x0C    /* Character Timeout Indication */
 
 #define UART_IIR_FENF   0x80    /* Fifo enabled, but not functionning */
@@ -60,33 +60,33 @@
 /*
  * These are the definitions for the Modem Control Register
  */
-#define UART_MCR_LOOP	0x10	/* Enable loopback test mode */
-#define UART_MCR_OUT2	0x08	/* Out2 complement */
-#define UART_MCR_OUT1	0x04	/* Out1 complement */
-#define UART_MCR_RTS	0x02	/* RTS complement */
-#define UART_MCR_DTR	0x01	/* DTR complement */
+#define UART_MCR_LOOP   0x10    /* Enable loopback test mode */
+#define UART_MCR_OUT2   0x08    /* Out2 complement */
+#define UART_MCR_OUT1   0x04    /* Out1 complement */
+#define UART_MCR_RTS    0x02    /* RTS complement */
+#define UART_MCR_DTR    0x01    /* DTR complement */
 
 /*
  * These are the definitions for the Modem Status Register
  */
-#define UART_MSR_DCD	0x80	/* Data Carrier Detect */
-#define UART_MSR_RI	0x40	/* Ring Indicator */
-#define UART_MSR_DSR	0x20	/* Data Set Ready */
-#define UART_MSR_CTS	0x10	/* Clear to Send */
-#define UART_MSR_DDCD	0x08	/* Delta DCD */
-#define UART_MSR_TERI	0x04	/* Trailing edge ring indicator */
-#define UART_MSR_DDSR	0x02	/* Delta DSR */
-#define UART_MSR_DCTS	0x01	/* Delta CTS */
-#define UART_MSR_ANY_DELTA 0x0F	/* Any of the delta bits! */
-
-#define UART_LSR_TEMT	0x40	/* Transmitter empty */
-#define UART_LSR_THRE	0x20	/* Transmit-hold-register empty */
-#define UART_LSR_BI	0x10	/* Break interrupt indicator */
-#define UART_LSR_FE	0x08	/* Frame error indicator */
-#define UART_LSR_PE	0x04	/* Parity error indicator */
-#define UART_LSR_OE	0x02	/* Overrun error indicator */
-#define UART_LSR_DR	0x01	/* Receiver data ready */
-#define UART_LSR_INT_ANY 0x1E	/* Any of the lsr-interrupt-triggering status bits */
+#define UART_MSR_DCD        0x80    /* Data Carrier Detect */
+#define UART_MSR_RI         0x40    /* Ring Indicator */
+#define UART_MSR_DSR        0x20    /* Data Set Ready */
+#define UART_MSR_CTS        0x10    /* Clear to Send */
+#define UART_MSR_DDCD       0x08    /* Delta DCD */
+#define UART_MSR_TERI       0x04    /* Trailing edge ring indicator */
+#define UART_MSR_DDSR       0x02    /* Delta DSR */
+#define UART_MSR_DCTS       0x01    /* Delta CTS */
+#define UART_MSR_ANY_DELTA  0x0F    /* Any of the delta bits! */
+
+#define UART_LSR_TEMT       0x40    /* Transmitter empty */
+#define UART_LSR_THRE       0x20    /* Transmit-hold-register empty */
+#define UART_LSR_BI         0x10    /* Break interrupt indicator */
+#define UART_LSR_FE         0x08    /* Frame error indicator */
+#define UART_LSR_PE         0x04    /* Parity error indicator */
+#define UART_LSR_OE         0x02    /* Overrun error indicator */
+#define UART_LSR_DR         0x01    /* Receiver data ready */
+#define UART_LSR_INT_ANY    0x1E    /* Any of the lsr-interrupt-triggering status bits */
 
 /* Interrupt trigger levels. The byte-counts are for 16550A - in newer UARTs the byte-count for each ITL is higher. */
 
diff --git a/hw/core/loader.c b/hw/core/loader.c
index cd53235fed..695d1acb15 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -35,7 +35,7 @@
  *
  * This program is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License along
@@ -210,8 +210,8 @@ static void bswap_ahdr(struct exec *e)
 #define ZMAGIC 0413
 #define QMAGIC 0314
 #define _N_HDROFF(x) (1024 - sizeof (struct exec))
-#define N_TXTOFF(x)							\
-    (N_MAGIC(x) == ZMAGIC ? _N_HDROFF((x)) + sizeof (struct exec) :	\
+#define N_TXTOFF(x)                                                 \
+    (N_MAGIC(x) == ZMAGIC ? _N_HDROFF((x)) + sizeof (struct exec) : \
      (N_MAGIC(x) == QMAGIC ? 0 : sizeof (struct exec)))
 #define N_TXTADDR(x, target_page_size) (N_MAGIC(x) == QMAGIC ? target_page_size : 0)
 #define _N_SEGMENT_ROUND(x, target_page_size) (((x) + target_page_size - 1) & ~(target_page_size - 1))
@@ -300,10 +300,10 @@ static void *load_at(int fd, off_t offset, size_t size)
 #define ELF_CLASS   ELFCLASS32
 #include "elf.h"
 
-#define SZ		32
+#define SZ              32
 #define elf_word        uint32_t
-#define elf_sword        int32_t
-#define bswapSZs	bswap32s
+#define elf_sword       int32_t
+#define bswapSZs        bswap32s
 #include "hw/elf_ops.h"
 
 #undef elfhdr
@@ -316,16 +316,16 @@ static void *load_at(int fd, off_t offset, size_t size)
 #undef elf_sword
 #undef bswapSZs
 #undef SZ
-#define elfhdr		elf64_hdr
-#define elf_phdr	elf64_phdr
-#define elf_note	elf64_note
-#define elf_shdr	elf64_shdr
-#define elf_sym		elf64_sym
+#define elfhdr          elf64_hdr
+#define elf_phdr        elf64_phdr
+#define elf_note        elf64_note
+#define elf_shdr        elf64_shdr
+#define elf_sym         elf64_sym
 #define elf_rela        elf64_rela
 #define elf_word        uint64_t
-#define elf_sword        int64_t
-#define bswapSZs	bswap64s
-#define SZ		64
+#define elf_sword       int64_t
+#define bswapSZs        bswap64s
+#define SZ              64
 #include "hw/elf_ops.h"
 
 const char *load_elf_strerror(ssize_t error)
@@ -527,7 +527,7 @@ static void bswap_uboot_header(uboot_image_header_t *hdr)
 }
 
 
-#define ZALLOC_ALIGNMENT	16
+#define ZALLOC_ALIGNMENT    16
 
 static void *zalloc(void *x, unsigned items, unsigned size)
 {
@@ -547,13 +547,13 @@ static void zfree(void *x, void *addr)
 }
 
 
-#define HEAD_CRC	2
-#define EXTRA_FIELD	4
-#define ORIG_NAME	8
-#define COMMENT		0x10
-#define RESERVED	0xe0
+#define HEAD_CRC    2
+#define EXTRA_FIELD 4
+#define ORIG_NAME   8
+#define COMMENT     0x10
+#define RESERVED    0xe0
 
-#define DEFLATED	8
+#define DEFLATED    8
 
 ssize_t gunzip(void *dst, size_t dstlen, uint8_t *src, size_t srclen)
 {
diff --git a/hw/dma/etraxfs_dma.c b/hw/dma/etraxfs_dma.c
index 0fef00c6c9..c367131e60 100644
--- a/hw/dma/etraxfs_dma.c
+++ b/hw/dma/etraxfs_dma.c
@@ -160,38 +160,38 @@ enum {
 
 enum dma_ch_state
 {
-	RST = 1,
-	STOPPED = 2,
-	RUNNING = 4
+    RST = 1,
+    STOPPED = 2,
+    RUNNING = 4
 };
 
 struct fs_dma_channel
 {
-	qemu_irq irq;
-	struct etraxfs_dma_client *client;
+    qemu_irq irq;
+    struct etraxfs_dma_client *client;
 
-	/* Internal status.  */
-	int stream_cmd_src;
-	enum dma_ch_state state;
+    /* Internal status.  */
+    int stream_cmd_src;
+    enum dma_ch_state state;
 
-	unsigned int input : 1;
-	unsigned int eol : 1;
+    unsigned int input : 1;
+    unsigned int eol : 1;
 
-	struct dma_descr_group current_g;
-	struct dma_descr_context current_c;
-	struct dma_descr_data current_d;
+    struct dma_descr_group current_g;
+    struct dma_descr_context current_c;
+    struct dma_descr_data current_d;
 
-	/* Control registers.  */
-	uint32_t regs[DMA_REG_MAX];
+    /* Control registers.  */
+    uint32_t regs[DMA_REG_MAX];
 };
 
 struct fs_dma_ctrl
 {
-	MemoryRegion mmio;
-	int nr_channels;
-	struct fs_dma_channel *channels;
+    MemoryRegion mmio;
+    int nr_channels;
+    struct fs_dma_channel *channels;
 
-        QEMUBH *bh;
+    QEMUBH *bh;
 };
 
 static void DMA_run(void *opaque);
@@ -199,72 +199,72 @@ static int channel_out_run(struct fs_dma_ctrl *ctrl, int c);
 
 static inline uint32_t channel_reg(struct fs_dma_ctrl *ctrl, int c, int reg)
 {
-	return ctrl->channels[c].regs[reg];
+    return ctrl->channels[c].regs[reg];
 }
 
 static inline int channel_stopped(struct fs_dma_ctrl *ctrl, int c)
 {
-	return channel_reg(ctrl, c, RW_CFG) & 2;
+    return channel_reg(ctrl, c, RW_CFG) & 2;
 }
 
 static inline int channel_en(struct fs_dma_ctrl *ctrl, int c)
 {
-	return (channel_reg(ctrl, c, RW_CFG) & 1)
-		&& ctrl->channels[c].client;
+    return (channel_reg(ctrl, c, RW_CFG) & 1)
+            && ctrl->channels[c].client;
 }
 
 static inline int fs_channel(hwaddr addr)
 {
-	/* Every channel has a 0x2000 ctrl register map.  */
-	return addr >> 13;
+    /* Every channel has a 0x2000 ctrl register map.  */
+    return addr >> 13;
 }
 
 #ifdef USE_THIS_DEAD_CODE
 static void channel_load_g(struct fs_dma_ctrl *ctrl, int c)
 {
-	hwaddr addr = channel_reg(ctrl, c, RW_GROUP);
+    hwaddr addr = channel_reg(ctrl, c, RW_GROUP);
 
-	/* Load and decode. FIXME: handle endianness.  */
+    /* Load and decode. FIXME: handle endianness.  */
     cpu_physical_memory_read(addr, &ctrl->channels[c].current_g,
                              sizeof(ctrl->channels[c].current_g));
 }
 
 static void dump_c(int ch, struct dma_descr_context *c)
 {
-	printf("%s ch=%d\n", __func__, ch);
-	printf("next=%x\n", c->next);
-	printf("saved_data=%x\n", c->saved_data);
-	printf("saved_data_buf=%x\n", c->saved_data_buf);
-	printf("eol=%x\n", (uint32_t) c->eol);
+    printf("%s ch=%d\n", __func__, ch);
+    printf("next=%x\n", c->next);
+    printf("saved_data=%x\n", c->saved_data);
+    printf("saved_data_buf=%x\n", c->saved_data_buf);
+    printf("eol=%x\n", (uint32_t) c->eol);
 }
 
 static void dump_d(int ch, struct dma_descr_data *d)
 {
-	printf("%s ch=%d\n", __func__, ch);
-	printf("next=%x\n", d->next);
-	printf("buf=%x\n", d->buf);
-	printf("after=%x\n", d->after);
-	printf("intr=%x\n", (uint32_t) d->intr);
-	printf("out_eop=%x\n", (uint32_t) d->out_eop);
-	printf("in_eop=%x\n", (uint32_t) d->in_eop);
-	printf("eol=%x\n", (uint32_t) d->eol);
+    printf("%s ch=%d\n", __func__, ch);
+    printf("next=%x\n", d->next);
+    printf("buf=%x\n", d->buf);
+    printf("after=%x\n", d->after);
+    printf("intr=%x\n", (uint32_t) d->intr);
+    printf("out_eop=%x\n", (uint32_t) d->out_eop);
+    printf("in_eop=%x\n", (uint32_t) d->in_eop);
+    printf("eol=%x\n", (uint32_t) d->eol);
 }
 #endif
 
 static void channel_load_c(struct fs_dma_ctrl *ctrl, int c)
 {
-	hwaddr addr = channel_reg(ctrl, c, RW_GROUP_DOWN);
+    hwaddr addr = channel_reg(ctrl, c, RW_GROUP_DOWN);
 
-	/* Load and decode. FIXME: handle endianness.  */
+    /* Load and decode. FIXME: handle endianness.  */
     cpu_physical_memory_read(addr, &ctrl->channels[c].current_c,
                              sizeof(ctrl->channels[c].current_c));
 
-	D(dump_c(c, &ctrl->channels[c].current_c));
-	/* I guess this should update the current pos.  */
-	ctrl->channels[c].regs[RW_SAVED_DATA] =
-		(uint32_t)(unsigned long)ctrl->channels[c].current_c.saved_data;
-	ctrl->channels[c].regs[RW_SAVED_DATA_BUF] =
-		(uint32_t)(unsigned long)ctrl->channels[c].current_c.saved_data_buf;
+    D(dump_c(c, &ctrl->channels[c].current_c));
+    /* I guess this should update the current pos.  */
+    ctrl->channels[c].regs[RW_SAVED_DATA] =
+        (uint32_t)(unsigned long)ctrl->channels[c].current_c.saved_data;
+    ctrl->channels[c].regs[RW_SAVED_DATA_BUF] =
+        (uint32_t)(unsigned long)ctrl->channels[c].current_c.saved_data_buf;
 }
 
 static void channel_load_d(struct fs_dma_ctrl *ctrl, int c)
@@ -303,273 +303,273 @@ static void channel_store_d(struct fs_dma_ctrl *ctrl, int c)
 
 static inline void channel_stop(struct fs_dma_ctrl *ctrl, int c)
 {
-	/* FIXME:  */
+    /* FIXME:  */
 }
 
 static inline void channel_start(struct fs_dma_ctrl *ctrl, int c)
 {
-	if (ctrl->channels[c].client)
-	{
-		ctrl->channels[c].eol = 0;
-		ctrl->channels[c].state = RUNNING;
-		if (!ctrl->channels[c].input)
-			channel_out_run(ctrl, c);
-	} else
-		printf("WARNING: starting DMA ch %d with no client\n", c);
+    if (ctrl->channels[c].client)
+    {
+        ctrl->channels[c].eol = 0;
+        ctrl->channels[c].state = RUNNING;
+        if (!ctrl->channels[c].input)
+            channel_out_run(ctrl, c);
+    } else
+        printf("WARNING: starting DMA ch %d with no client\n", c);
 
-        qemu_bh_schedule_idle(ctrl->bh);
+    qemu_bh_schedule_idle(ctrl->bh);
 }
 
 static void channel_continue(struct fs_dma_ctrl *ctrl, int c)
 {
-	if (!channel_en(ctrl, c) 
-	    || channel_stopped(ctrl, c)
-	    || ctrl->channels[c].state != RUNNING
-	    /* Only reload the current data descriptor if it has eol set.  */
-	    || !ctrl->channels[c].current_d.eol) {
-		D(printf("continue failed ch=%d state=%d stopped=%d en=%d eol=%d\n", 
-			 c, ctrl->channels[c].state,
-			 channel_stopped(ctrl, c),
-			 channel_en(ctrl,c),
-			 ctrl->channels[c].eol));
-		D(dump_d(c, &ctrl->channels[c].current_d));
-		return;
-	}
-
-	/* Reload the current descriptor.  */
-	channel_load_d(ctrl, c);
-
-	/* If the current descriptor cleared the eol flag and we had already
-	   reached eol state, do the continue.  */
-	if (!ctrl->channels[c].current_d.eol && ctrl->channels[c].eol) {
-		D(printf("continue %d ok %x\n", c,
-			 ctrl->channels[c].current_d.next));
-		ctrl->channels[c].regs[RW_SAVED_DATA] =
-			(uint32_t)(unsigned long)ctrl->channels[c].current_d.next;
-		channel_load_d(ctrl, c);
-		ctrl->channels[c].regs[RW_SAVED_DATA_BUF] =
-			(uint32_t)(unsigned long)ctrl->channels[c].current_d.buf;
-
-		channel_start(ctrl, c);
-	}
-	ctrl->channels[c].regs[RW_SAVED_DATA_BUF] =
-		(uint32_t)(unsigned long)ctrl->channels[c].current_d.buf;
+    if (!channel_en(ctrl, c)
+        || channel_stopped(ctrl, c)
+        || ctrl->channels[c].state != RUNNING
+        /* Only reload the current data descriptor if it has eol set.  */
+        || !ctrl->channels[c].current_d.eol) {
+        D(printf("continue failed ch=%d state=%d stopped=%d en=%d eol=%d\n",
+                 c, ctrl->channels[c].state,
+                 channel_stopped(ctrl, c),
+                 channel_en(ctrl,c),
+                 ctrl->channels[c].eol));
+        D(dump_d(c, &ctrl->channels[c].current_d));
+        return;
+    }
+
+    /* Reload the current descriptor.  */
+    channel_load_d(ctrl, c);
+
+    /* If the current descriptor cleared the eol flag and we had already
+       reached eol state, do the continue.  */
+    if (!ctrl->channels[c].current_d.eol && ctrl->channels[c].eol) {
+        D(printf("continue %d ok %x\n", c,
+                 ctrl->channels[c].current_d.next));
+        ctrl->channels[c].regs[RW_SAVED_DATA] =
+            (uint32_t)(unsigned long)ctrl->channels[c].current_d.next;
+        channel_load_d(ctrl, c);
+        ctrl->channels[c].regs[RW_SAVED_DATA_BUF] =
+            (uint32_t)(unsigned long)ctrl->channels[c].current_d.buf;
+
+        channel_start(ctrl, c);
+    }
+    ctrl->channels[c].regs[RW_SAVED_DATA_BUF] =
+        (uint32_t)(unsigned long)ctrl->channels[c].current_d.buf;
 }
 
 static void channel_stream_cmd(struct fs_dma_ctrl *ctrl, int c, uint32_t v)
 {
-	unsigned int cmd = v & ((1 << 10) - 1);
+    unsigned int cmd = v & ((1 << 10) - 1);
 
-	D(printf("%s ch=%d cmd=%x\n",
-		 __func__, c, cmd));
-	if (cmd & regk_dma_load_d) {
-		channel_load_d(ctrl, c);
-		if (cmd & regk_dma_burst)
-			channel_start(ctrl, c);
-	}
+    D(printf("%s ch=%d cmd=%x\n",
+             __func__, c, cmd));
+    if (cmd & regk_dma_load_d) {
+        channel_load_d(ctrl, c);
+        if (cmd & regk_dma_burst)
+            channel_start(ctrl, c);
+    }
 
-	if (cmd & regk_dma_load_c) {
-		channel_load_c(ctrl, c);
-	}
+    if (cmd & regk_dma_load_c) {
+        channel_load_c(ctrl, c);
+    }
 }
 
 static void channel_update_irq(struct fs_dma_ctrl *ctrl, int c)
 {
-	D(printf("%s %d\n", __func__, c));
-        ctrl->channels[c].regs[R_INTR] &=
-		~(ctrl->channels[c].regs[RW_ACK_INTR]);
+    D(printf("%s %d\n", __func__, c));
+    ctrl->channels[c].regs[R_INTR] &=
+        ~(ctrl->channels[c].regs[RW_ACK_INTR]);
 
-        ctrl->channels[c].regs[R_MASKED_INTR] =
-		ctrl->channels[c].regs[R_INTR]
-		& ctrl->channels[c].regs[RW_INTR_MASK];
+    ctrl->channels[c].regs[R_MASKED_INTR] =
+        ctrl->channels[c].regs[R_INTR]
+        & ctrl->channels[c].regs[RW_INTR_MASK];
 
-	D(printf("%s: chan=%d masked_intr=%x\n", __func__, 
-		 c,
-		 ctrl->channels[c].regs[R_MASKED_INTR]));
+    D(printf("%s: chan=%d masked_intr=%x\n", __func__, 
+             c,
+             ctrl->channels[c].regs[R_MASKED_INTR]));
 
-        qemu_set_irq(ctrl->channels[c].irq,
-		     !!ctrl->channels[c].regs[R_MASKED_INTR]);
+    qemu_set_irq(ctrl->channels[c].irq,
+                 !!ctrl->channels[c].regs[R_MASKED_INTR]);
 }
 
 static int channel_out_run(struct fs_dma_ctrl *ctrl, int c)
 {
-	uint32_t len;
-	uint32_t saved_data_buf;
-	unsigned char buf[2 * 1024];
-
-	struct dma_context_metadata meta;
-	bool send_context = true;
-
-	if (ctrl->channels[c].eol)
-		return 0;
-
-	do {
-		bool out_eop;
-		D(printf("ch=%d buf=%x after=%x\n",
-			 c,
-			 (uint32_t)ctrl->channels[c].current_d.buf,
-			 (uint32_t)ctrl->channels[c].current_d.after));
-
-		if (send_context) {
-			if (ctrl->channels[c].client->client.metadata_push) {
-				meta.metadata = ctrl->channels[c].current_d.md;
-				ctrl->channels[c].client->client.metadata_push(
-					ctrl->channels[c].client->client.opaque,
-					&meta);
-			}
-			send_context = false;
-		}
-
-		channel_load_d(ctrl, c);
-		saved_data_buf = channel_reg(ctrl, c, RW_SAVED_DATA_BUF);
-		len = (uint32_t)(unsigned long)
-			ctrl->channels[c].current_d.after;
-		len -= saved_data_buf;
-
-		if (len > sizeof buf)
-			len = sizeof buf;
-		cpu_physical_memory_read (saved_data_buf, buf, len);
-
-		out_eop = ((saved_data_buf + len) ==
-		           ctrl->channels[c].current_d.after) &&
-			ctrl->channels[c].current_d.out_eop;
-
-		D(printf("channel %d pushes %x %u bytes eop=%u\n", c,
-		         saved_data_buf, len, out_eop));
-
-		if (ctrl->channels[c].client->client.push) {
-                        if (len > 0) {
-				ctrl->channels[c].client->client.push(
-					ctrl->channels[c].client->client.opaque,
-					buf, len, out_eop);
-			}
-		} else {
-			printf("WARNING: DMA ch%d dataloss,"
-			       " no attached client.\n", c);
-		}
-
-		saved_data_buf += len;
-
-		if (saved_data_buf == (uint32_t)(unsigned long)
-				ctrl->channels[c].current_d.after) {
-			/* Done. Step to next.  */
-			if (ctrl->channels[c].current_d.out_eop) {
-				send_context = true;
-			}
-			if (ctrl->channels[c].current_d.intr) {
-				/* data intr.  */
-				D(printf("signal intr %d eol=%d\n",
-					len, ctrl->channels[c].current_d.eol));
-				ctrl->channels[c].regs[R_INTR] |= (1 << 2);
-				channel_update_irq(ctrl, c);
-			}
-			channel_store_d(ctrl, c);
-			if (ctrl->channels[c].current_d.eol) {
-				D(printf("channel %d EOL\n", c));
-				ctrl->channels[c].eol = 1;
-
-				/* Mark the context as disabled.  */
-				ctrl->channels[c].current_c.dis = 1;
-				channel_store_c(ctrl, c);
-
-				channel_stop(ctrl, c);
-			} else {
-				ctrl->channels[c].regs[RW_SAVED_DATA] =
-					(uint32_t)(unsigned long)ctrl->
-						channels[c].current_d.next;
-				/* Load new descriptor.  */
-				channel_load_d(ctrl, c);
-				saved_data_buf = (uint32_t)(unsigned long)
-					ctrl->channels[c].current_d.buf;
-			}
-
-			ctrl->channels[c].regs[RW_SAVED_DATA_BUF] =
-							saved_data_buf;
-			D(dump_d(c, &ctrl->channels[c].current_d));
-		}
-		ctrl->channels[c].regs[RW_SAVED_DATA_BUF] = saved_data_buf;
-	} while (!ctrl->channels[c].eol);
-	return 1;
+    uint32_t len;
+    uint32_t saved_data_buf;
+    unsigned char buf[2 * 1024];
+
+    struct dma_context_metadata meta;
+    bool send_context = true;
+
+    if (ctrl->channels[c].eol)
+        return 0;
+
+    do {
+        bool out_eop;
+        D(printf("ch=%d buf=%x after=%x\n",
+                 c,
+                 (uint32_t)ctrl->channels[c].current_d.buf,
+                 (uint32_t)ctrl->channels[c].current_d.after));
+
+        if (send_context) {
+            if (ctrl->channels[c].client->client.metadata_push) {
+                meta.metadata = ctrl->channels[c].current_d.md;
+                ctrl->channels[c].client->client.metadata_push(
+                    ctrl->channels[c].client->client.opaque,
+                    &meta);
+            }
+            send_context = false;
+        }
+
+        channel_load_d(ctrl, c);
+        saved_data_buf = channel_reg(ctrl, c, RW_SAVED_DATA_BUF);
+        len = (uint32_t)(unsigned long)
+            ctrl->channels[c].current_d.after;
+        len -= saved_data_buf;
+
+        if (len > sizeof buf)
+            len = sizeof buf;
+        cpu_physical_memory_read (saved_data_buf, buf, len);
+
+        out_eop = ((saved_data_buf + len) ==
+                   ctrl->channels[c].current_d.after) &&
+                   ctrl->channels[c].current_d.out_eop;
+
+        D(printf("channel %d pushes %x %u bytes eop=%u\n", c,
+                 saved_data_buf, len, out_eop));
+
+        if (ctrl->channels[c].client->client.push) {
+            if (len > 0) {
+                ctrl->channels[c].client->client.push(
+                    ctrl->channels[c].client->client.opaque,
+                    buf, len, out_eop);
+            }
+        } else {
+            printf("WARNING: DMA ch%d dataloss,"
+                   " no attached client.\n", c);
+        }
+
+        saved_data_buf += len;
+
+        if (saved_data_buf == (uint32_t)(unsigned long)
+                ctrl->channels[c].current_d.after) {
+            /* Done. Step to next.  */
+            if (ctrl->channels[c].current_d.out_eop) {
+                send_context = true;
+            }
+            if (ctrl->channels[c].current_d.intr) {
+                /* data intr.  */
+                D(printf("signal intr %d eol=%d\n",
+                         len, ctrl->channels[c].current_d.eol));
+                ctrl->channels[c].regs[R_INTR] |= (1 << 2);
+                channel_update_irq(ctrl, c);
+            }
+            channel_store_d(ctrl, c);
+            if (ctrl->channels[c].current_d.eol) {
+                D(printf("channel %d EOL\n", c));
+                ctrl->channels[c].eol = 1;
+
+                /* Mark the context as disabled.  */
+                ctrl->channels[c].current_c.dis = 1;
+                channel_store_c(ctrl, c);
+
+                channel_stop(ctrl, c);
+            } else {
+                ctrl->channels[c].regs[RW_SAVED_DATA] =
+                    (uint32_t)(unsigned long)ctrl->
+                        channels[c].current_d.next;
+                /* Load new descriptor.  */
+                channel_load_d(ctrl, c);
+                saved_data_buf = (uint32_t)(unsigned long)
+                    ctrl->channels[c].current_d.buf;
+            }
+
+            ctrl->channels[c].regs[RW_SAVED_DATA_BUF] =
+                            saved_data_buf;
+            D(dump_d(c, &ctrl->channels[c].current_d));
+        }
+        ctrl->channels[c].regs[RW_SAVED_DATA_BUF] = saved_data_buf;
+    } while (!ctrl->channels[c].eol);
+    return 1;
 }
 
 static int channel_in_process(struct fs_dma_ctrl *ctrl, int c, 
-			      unsigned char *buf, int buflen, int eop)
-{
-	uint32_t len;
-	uint32_t saved_data_buf;
-
-	if (ctrl->channels[c].eol == 1)
-		return 0;
-
-	channel_load_d(ctrl, c);
-	saved_data_buf = channel_reg(ctrl, c, RW_SAVED_DATA_BUF);
-	len = (uint32_t)(unsigned long)ctrl->channels[c].current_d.after;
-	len -= saved_data_buf;
-	
-	if (len > buflen)
-		len = buflen;
-
-	cpu_physical_memory_write (saved_data_buf, buf, len);
-	saved_data_buf += len;
-
-	if (saved_data_buf ==
-	    (uint32_t)(unsigned long)ctrl->channels[c].current_d.after
-	    || eop) {
-		uint32_t r_intr = ctrl->channels[c].regs[R_INTR];
-
-		D(printf("in dscr end len=%d\n", 
-			 ctrl->channels[c].current_d.after
-			 - ctrl->channels[c].current_d.buf));
-		ctrl->channels[c].current_d.after = saved_data_buf;
-
-		/* Done. Step to next.  */
-		if (ctrl->channels[c].current_d.intr) {
-			/* TODO: signal eop to the client.  */
-			/* data intr.  */
-			ctrl->channels[c].regs[R_INTR] |= 3;
-		}
-		if (eop) {
-			ctrl->channels[c].current_d.in_eop = 1;
-			ctrl->channels[c].regs[R_INTR] |= 8;
-		}
-		if (r_intr != ctrl->channels[c].regs[R_INTR])
-			channel_update_irq(ctrl, c);
-
-		channel_store_d(ctrl, c);
-		D(dump_d(c, &ctrl->channels[c].current_d));
-
-		if (ctrl->channels[c].current_d.eol) {
-			D(printf("channel %d EOL\n", c));
-			ctrl->channels[c].eol = 1;
-
-			/* Mark the context as disabled.  */
-			ctrl->channels[c].current_c.dis = 1;
-			channel_store_c(ctrl, c);
-
-			channel_stop(ctrl, c);
-		} else {
-			ctrl->channels[c].regs[RW_SAVED_DATA] =
-				(uint32_t)(unsigned long)ctrl->
-					channels[c].current_d.next;
-			/* Load new descriptor.  */
-			channel_load_d(ctrl, c);
-			saved_data_buf = (uint32_t)(unsigned long)
-				ctrl->channels[c].current_d.buf;
-		}
-	}
-
-	ctrl->channels[c].regs[RW_SAVED_DATA_BUF] = saved_data_buf;
-	return len;
+                              unsigned char *buf, int buflen, int eop)
+{
+    uint32_t len;
+    uint32_t saved_data_buf;
+
+    if (ctrl->channels[c].eol == 1)
+        return 0;
+
+    channel_load_d(ctrl, c);
+    saved_data_buf = channel_reg(ctrl, c, RW_SAVED_DATA_BUF);
+    len = (uint32_t)(unsigned long)ctrl->channels[c].current_d.after;
+    len -= saved_data_buf;
+
+    if (len > buflen)
+        len = buflen;
+
+    cpu_physical_memory_write (saved_data_buf, buf, len);
+    saved_data_buf += len;
+
+    if (saved_data_buf ==
+        (uint32_t)(unsigned long)ctrl->channels[c].current_d.after
+        || eop) {
+        uint32_t r_intr = ctrl->channels[c].regs[R_INTR];
+
+        D(printf("in dscr end len=%d\n",
+                 ctrl->channels[c].current_d.after
+                 - ctrl->channels[c].current_d.buf));
+        ctrl->channels[c].current_d.after = saved_data_buf;
+
+        /* Done. Step to next.  */
+        if (ctrl->channels[c].current_d.intr) {
+            /* TODO: signal eop to the client.  */
+            /* data intr.  */
+            ctrl->channels[c].regs[R_INTR] |= 3;
+        }
+        if (eop) {
+            ctrl->channels[c].current_d.in_eop = 1;
+            ctrl->channels[c].regs[R_INTR] |= 8;
+        }
+        if (r_intr != ctrl->channels[c].regs[R_INTR])
+            channel_update_irq(ctrl, c);
+
+        channel_store_d(ctrl, c);
+        D(dump_d(c, &ctrl->channels[c].current_d));
+
+        if (ctrl->channels[c].current_d.eol) {
+            D(printf("channel %d EOL\n", c));
+            ctrl->channels[c].eol = 1;
+
+            /* Mark the context as disabled.  */
+            ctrl->channels[c].current_c.dis = 1;
+            channel_store_c(ctrl, c);
+
+            channel_stop(ctrl, c);
+        } else {
+            ctrl->channels[c].regs[RW_SAVED_DATA] =
+                (uint32_t)(unsigned long)ctrl->
+                    channels[c].current_d.next;
+            /* Load new descriptor.  */
+            channel_load_d(ctrl, c);
+            saved_data_buf = (uint32_t)(unsigned long)
+                ctrl->channels[c].current_d.buf;
+        }
+    }
+
+    ctrl->channels[c].regs[RW_SAVED_DATA_BUF] = saved_data_buf;
+    return len;
 }
 
 static inline int channel_in_run(struct fs_dma_ctrl *ctrl, int c)
 {
-	if (ctrl->channels[c].client->client.pull) {
-		ctrl->channels[c].client->client.pull(
-			ctrl->channels[c].client->client.opaque);
-		return 1;
-	} else
-		return 0;
+    if (ctrl->channels[c].client->client.pull) {
+        ctrl->channels[c].client->client.pull(
+            ctrl->channels[c].client->client.opaque);
+        return 1;
+    } else
+        return 0;
 }
 
 static uint32_t dma_rinvalid (void *opaque, hwaddr addr)
@@ -581,33 +581,33 @@ static uint32_t dma_rinvalid (void *opaque, hwaddr addr)
 static uint64_t
 dma_read(void *opaque, hwaddr addr, unsigned int size)
 {
-        struct fs_dma_ctrl *ctrl = opaque;
-	int c;
-	uint32_t r = 0;
-
-	if (size != 4) {
-		dma_rinvalid(opaque, addr);
-	}
-
-	/* Make addr relative to this channel and bounded to nr regs.  */
-	c = fs_channel(addr);
-	addr &= 0xff;
-	addr >>= 2;
-	switch (addr)
-	{
-		case RW_STAT:
-			r = ctrl->channels[c].state & 7;
-			r |= ctrl->channels[c].eol << 5;
-			r |= ctrl->channels[c].stream_cmd_src << 8;
-			break;
-
-		default:
-			r = ctrl->channels[c].regs[addr];
-			D(printf("%s c=%d addr=" HWADDR_FMT_plx "\n",
-				  __func__, c, addr));
-			break;
-	}
-	return r;
+    struct fs_dma_ctrl *ctrl = opaque;
+    int c;
+    uint32_t r = 0;
+
+    if (size != 4) {
+        dma_rinvalid(opaque, addr);
+    }
+
+    /* Make addr relative to this channel and bounded to nr regs.  */
+    c = fs_channel(addr);
+    addr &= 0xff;
+    addr >>= 2;
+    switch (addr)
+    {
+        case RW_STAT:
+            r = ctrl->channels[c].state & 7;
+            r |= ctrl->channels[c].eol << 5;
+            r |= ctrl->channels[c].stream_cmd_src << 8;
+            break;
+
+        default:
+            r = ctrl->channels[c].regs[addr];
+            D(printf("%s c=%d addr=" HWADDR_FMT_plx "\n",
+                     __func__, c, addr));
+            break;
+    }
+    return r;
 }
 
 static void
@@ -619,133 +619,133 @@ dma_winvalid (void *opaque, hwaddr addr, uint32_t value)
 static void
 dma_update_state(struct fs_dma_ctrl *ctrl, int c)
 {
-	if (ctrl->channels[c].regs[RW_CFG] & 2)
-		ctrl->channels[c].state = STOPPED;
-	if (!(ctrl->channels[c].regs[RW_CFG] & 1))
-		ctrl->channels[c].state = RST;
+    if (ctrl->channels[c].regs[RW_CFG] & 2)
+        ctrl->channels[c].state = STOPPED;
+    if (!(ctrl->channels[c].regs[RW_CFG] & 1))
+        ctrl->channels[c].state = RST;
 }
 
 static void
 dma_write(void *opaque, hwaddr addr,
-	  uint64_t val64, unsigned int size)
+          uint64_t val64, unsigned int size)
 {
-        struct fs_dma_ctrl *ctrl = opaque;
-	uint32_t value = val64;
-	int c;
+    struct fs_dma_ctrl *ctrl = opaque;
+    uint32_t value = val64;
+    int c;
 
-	if (size != 4) {
-		dma_winvalid(opaque, addr, value);
-	}
+    if (size != 4) {
+        dma_winvalid(opaque, addr, value);
+    }
 
         /* Make addr relative to this channel and bounded to nr regs.  */
-	c = fs_channel(addr);
-        addr &= 0xff;
-        addr >>= 2;
-        switch (addr)
-	{
-		case RW_DATA:
-			ctrl->channels[c].regs[addr] = value;
-			break;
-
-		case RW_CFG:
-			ctrl->channels[c].regs[addr] = value;
-			dma_update_state(ctrl, c);
-			break;
-		case RW_CMD:
-			/* continue.  */
-			if (value & ~1)
-				printf("Invalid store to ch=%d RW_CMD %x\n",
-				       c, value);
-			ctrl->channels[c].regs[addr] = value;
-			channel_continue(ctrl, c);
-			break;
-
-		case RW_SAVED_DATA:
-		case RW_SAVED_DATA_BUF:
-		case RW_GROUP:
-		case RW_GROUP_DOWN:
-			ctrl->channels[c].regs[addr] = value;
-			break;
-
-		case RW_ACK_INTR:
-		case RW_INTR_MASK:
-			ctrl->channels[c].regs[addr] = value;
-			channel_update_irq(ctrl, c);
-			if (addr == RW_ACK_INTR)
-				ctrl->channels[c].regs[RW_ACK_INTR] = 0;
-			break;
-
-		case RW_STREAM_CMD:
-			if (value & ~1023)
-				printf("Invalid store to ch=%d "
-				       "RW_STREAMCMD %x\n",
-				       c, value);
-			ctrl->channels[c].regs[addr] = value;
-			D(printf("stream_cmd ch=%d\n", c));
-			channel_stream_cmd(ctrl, c, value);
-			break;
-
-	        default:
-			D(printf("%s c=%d " HWADDR_FMT_plx "\n",
-				__func__, c, addr));
-			break;
-        }
+    c = fs_channel(addr);
+    addr &= 0xff;
+    addr >>= 2;
+    switch (addr)
+    {
+        case RW_DATA:
+            ctrl->channels[c].regs[addr] = value;
+            break;
+
+        case RW_CFG:
+            ctrl->channels[c].regs[addr] = value;
+            dma_update_state(ctrl, c);
+            break;
+        case RW_CMD:
+            /* continue.  */
+            if (value & ~1)
+                printf("Invalid store to ch=%d RW_CMD %x\n",
+                       c, value);
+            ctrl->channels[c].regs[addr] = value;
+            channel_continue(ctrl, c);
+            break;
+
+        case RW_SAVED_DATA:
+        case RW_SAVED_DATA_BUF:
+        case RW_GROUP:
+        case RW_GROUP_DOWN:
+            ctrl->channels[c].regs[addr] = value;
+            break;
+
+        case RW_ACK_INTR:
+        case RW_INTR_MASK:
+            ctrl->channels[c].regs[addr] = value;
+            channel_update_irq(ctrl, c);
+            if (addr == RW_ACK_INTR)
+                ctrl->channels[c].regs[RW_ACK_INTR] = 0;
+            break;
+
+        case RW_STREAM_CMD:
+            if (value & ~1023)
+                printf("Invalid store to ch=%d "
+                       "RW_STREAMCMD %x\n",
+                       c, value);
+            ctrl->channels[c].regs[addr] = value;
+            D(printf("stream_cmd ch=%d\n", c));
+            channel_stream_cmd(ctrl, c, value);
+            break;
+
+        default:
+            D(printf("%s c=%d " HWADDR_FMT_plx "\n",
+                     __func__, c, addr));
+            break;
+    }
 }
 
 static const MemoryRegionOps dma_ops = {
-	.read = dma_read,
-	.write = dma_write,
-	.endianness = DEVICE_NATIVE_ENDIAN,
-	.valid = {
-		.min_access_size = 1,
-		.max_access_size = 4
-	}
+    .read = dma_read,
+    .write = dma_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 4
+    }
 };
 
 static int etraxfs_dmac_run(void *opaque)
 {
-	struct fs_dma_ctrl *ctrl = opaque;
-	int i;
-	int p = 0;
-
-	for (i = 0; 
-	     i < ctrl->nr_channels;
-	     i++)
-	{
-		if (ctrl->channels[i].state == RUNNING)
-		{
-			if (ctrl->channels[i].input) {
-				p += channel_in_run(ctrl, i);
-			} else {
-				p += channel_out_run(ctrl, i);
-			}
-		}
-	}
-	return p;
+    struct fs_dma_ctrl *ctrl = opaque;
+    int i;
+    int p = 0;
+
+    for (i = 0; 
+         i < ctrl->nr_channels;
+         i++)
+    {
+        if (ctrl->channels[i].state == RUNNING)
+        {
+            if (ctrl->channels[i].input) {
+                p += channel_in_run(ctrl, i);
+            } else {
+                p += channel_out_run(ctrl, i);
+            }
+        }
+    }
+    return p;
 }
 
 int etraxfs_dmac_input(struct etraxfs_dma_client *client, 
-		       void *buf, int len, int eop)
+                       void *buf, int len, int eop)
 {
-	return channel_in_process(client->ctrl, client->channel, 
-				  buf, len, eop);
+    return channel_in_process(client->ctrl, client->channel, 
+                              buf, len, eop);
 }
 
 /* Connect an IRQ line with a channel.  */
 void etraxfs_dmac_connect(void *opaque, int c, qemu_irq *line, int input)
 {
-	struct fs_dma_ctrl *ctrl = opaque;
-	ctrl->channels[c].irq = *line;
-	ctrl->channels[c].input = input;
+    struct fs_dma_ctrl *ctrl = opaque;
+    ctrl->channels[c].irq = *line;
+    ctrl->channels[c].input = input;
 }
 
 void etraxfs_dmac_connect_client(void *opaque, int c, 
-				 struct etraxfs_dma_client *cl)
+                                 struct etraxfs_dma_client *cl)
 {
-	struct fs_dma_ctrl *ctrl = opaque;
-	cl->ctrl = ctrl;
-	cl->channel = c;
-	ctrl->channels[c].client = cl;
+    struct fs_dma_ctrl *ctrl = opaque;
+    cl->ctrl = ctrl;
+    cl->channel = c;
+    ctrl->channels[c].client = cl;
 }
 
 
@@ -763,18 +763,18 @@ static void DMA_run(void *opaque)
 
 void *etraxfs_dmac_init(hwaddr base, int nr_channels)
 {
-	struct fs_dma_ctrl *ctrl = NULL;
+    struct fs_dma_ctrl *ctrl = NULL;
 
-	ctrl = g_malloc0(sizeof *ctrl);
+    ctrl = g_malloc0(sizeof *ctrl);
 
-        ctrl->bh = qemu_bh_new(DMA_run, ctrl);
+    ctrl->bh = qemu_bh_new(DMA_run, ctrl);
 
-	ctrl->nr_channels = nr_channels;
-	ctrl->channels = g_malloc0(sizeof ctrl->channels[0] * nr_channels);
+    ctrl->nr_channels = nr_channels;
+    ctrl->channels = g_malloc0(sizeof ctrl->channels[0] * nr_channels);
 
-	memory_region_init_io(&ctrl->mmio, NULL, &dma_ops, ctrl, "etraxfs-dma",
-			      nr_channels * 0x2000);
-	memory_region_add_subregion(get_system_memory(), base, &ctrl->mmio);
+    memory_region_init_io(&ctrl->mmio, NULL, &dma_ops, ctrl, "etraxfs-dma",
+                          nr_channels * 0x2000);
+    memory_region_add_subregion(get_system_memory(), base, &ctrl->mmio);
 
-	return ctrl;
+    return ctrl;
 }
diff --git a/hw/gpio/max7310.c b/hw/gpio/max7310.c
index 031482d939..4470cfe985 100644
--- a/hw/gpio/max7310.c
+++ b/hw/gpio/max7310.c
@@ -49,22 +49,22 @@ static uint8_t max7310_rx(I2CSlave *i2c)
     MAX7310State *s = MAX7310(i2c);
 
     switch (s->command) {
-    case 0x00:	/* Input port */
+    case 0x00:  /* Input port */
         return s->level ^ s->polarity;
 
-    case 0x01:	/* Output port */
+    case 0x01:  /* Output port */
         return s->level & ~s->direction;
 
-    case 0x02:	/* Polarity inversion */
+    case 0x02:  /* Polarity inversion */
         return s->polarity;
 
-    case 0x03:	/* Configuration */
+    case 0x03:  /* Configuration */
         return s->direction;
 
-    case 0x04:	/* Timeout */
+    case 0x04:  /* Timeout */
         return s->status;
 
-    case 0xff:	/* Reserved */
+    case 0xff:  /* Reserved */
         return 0xff;
 
     default:
@@ -95,7 +95,7 @@ static int max7310_tx(I2CSlave *i2c, uint8_t data)
     }
 
     switch (s->command) {
-    case 0x01:	/* Output port */
+    case 0x01:  /* Output port */
         for (diff = (data ^ s->level) & ~s->direction; diff;
                         diff &= ~(1 << line)) {
             line = ctz32(diff);
@@ -105,20 +105,20 @@ static int max7310_tx(I2CSlave *i2c, uint8_t data)
         s->level = (s->level & s->direction) | (data & ~s->direction);
         break;
 
-    case 0x02:	/* Polarity inversion */
+    case 0x02:  /* Polarity inversion */
         s->polarity = data;
         break;
 
-    case 0x03:	/* Configuration */
+    case 0x03:  /* Configuration */
         s->level &= ~(s->direction ^ data);
         s->direction = data;
         break;
 
-    case 0x04:	/* Timeout */
+    case 0x04:  /* Timeout */
         s->status = data;
         break;
 
-    case 0x00:	/* Input port - ignore writes */
+    case 0x00:  /* Input port - ignore writes */
         break;
     default:
         qemu_log_mask(LOG_UNIMP, "%s: Unsupported register 0x02%" PRIx8 "\n",
diff --git a/hw/input/ads7846.c b/hw/input/ads7846.c
index 1d4e04a2dc..dc0998ac79 100644
--- a/hw/input/ads7846.c
+++ b/hw/input/ads7846.c
@@ -34,28 +34,28 @@ struct ADS7846State {
 OBJECT_DECLARE_SIMPLE_TYPE(ADS7846State, ADS7846)
 
 /* Control-byte bitfields */
-#define CB_PD0		(1 << 0)
-#define CB_PD1		(1 << 1)
-#define CB_SER		(1 << 2)
-#define CB_MODE		(1 << 3)
-#define CB_A0		(1 << 4)
-#define CB_A1		(1 << 5)
-#define CB_A2		(1 << 6)
-#define CB_START	(1 << 7)
-
-#define X_AXIS_DMAX	3470
-#define X_AXIS_MIN	290
-#define Y_AXIS_DMAX	3450
-#define Y_AXIS_MIN	200
-
-#define ADS_VBAT	2000
-#define ADS_VAUX	2000
-#define ADS_TEMP0	2000
-#define ADS_TEMP1	3000
-#define ADS_XPOS(x, y)	(X_AXIS_MIN + ((X_AXIS_DMAX * (x)) >> 15))
-#define ADS_YPOS(x, y)	(Y_AXIS_MIN + ((Y_AXIS_DMAX * (y)) >> 15))
-#define ADS_Z1POS(x, y)	600
-#define ADS_Z2POS(x, y)	(600 + 6000 / ADS_XPOS(x, y))
+#define CB_PD0          (1 << 0)
+#define CB_PD1          (1 << 1)
+#define CB_SER          (1 << 2)
+#define CB_MODE         (1 << 3)
+#define CB_A0           (1 << 4)
+#define CB_A1           (1 << 5)
+#define CB_A2           (1 << 6)
+#define CB_START        (1 << 7)
+
+#define X_AXIS_DMAX     3470
+#define X_AXIS_MIN      290
+#define Y_AXIS_DMAX     3450
+#define Y_AXIS_MIN      200
+
+#define ADS_VBAT        2000
+#define ADS_VAUX        2000
+#define ADS_TEMP0       2000
+#define ADS_TEMP1       3000
+#define ADS_XPOS(x, y)  (X_AXIS_MIN + ((X_AXIS_DMAX * (x)) >> 15))
+#define ADS_YPOS(x, y)  (Y_AXIS_MIN + ((Y_AXIS_DMAX * (y)) >> 15))
+#define ADS_Z1POS(x, y) 600
+#define ADS_Z2POS(x, y) (600 + 6000 / ADS_XPOS(x, y))
 
 static void ads7846_int_update(ADS7846State *s)
 {
@@ -86,7 +86,7 @@ static uint32_t ads7846_transfer(SSIPeripheral *dev, uint32_t value)
         }
 
         if (value & CB_MODE)
-            s->output >>= 4;	/* 8 bits instead of 12 */
+            s->output >>= 4;    /* 8 bits instead of 12 */
 
         break;
     case 1:
@@ -147,10 +147,10 @@ static void ads7846_realize(SSIPeripheral *d, Error **errp)
 
     qdev_init_gpio_out(dev, &s->interrupt, 1);
 
-    s->input[0] = ADS_TEMP0;	/* TEMP0 */
-    s->input[2] = ADS_VBAT;	/* VBAT */
-    s->input[6] = ADS_VAUX;	/* VAUX */
-    s->input[7] = ADS_TEMP1;	/* TEMP1 */
+    s->input[0] = ADS_TEMP0;    /* TEMP0 */
+    s->input[2] = ADS_VBAT;     /* VBAT */
+    s->input[6] = ADS_VAUX;     /* VAUX */
+    s->input[7] = ADS_TEMP1;    /* TEMP1 */
 
     /* We want absolute coordinates */
     qemu_add_mouse_event_handler(ads7846_ts_event, s, 1,
diff --git a/hw/rtc/m48t59.c b/hw/rtc/m48t59.c
index 74345d9d90..ec3e56e84f 100644
--- a/hw/rtc/m48t59.c
+++ b/hw/rtc/m48t59.c
@@ -93,9 +93,9 @@ static void alarm_cb (void *opaque)
 
     qemu_set_irq(NVRAM->IRQ, 1);
     if ((NVRAM->buffer[0x1FF5] & 0x80) == 0 &&
-	(NVRAM->buffer[0x1FF4] & 0x80) == 0 &&
-	(NVRAM->buffer[0x1FF3] & 0x80) == 0 &&
-	(NVRAM->buffer[0x1FF2] & 0x80) == 0) {
+        (NVRAM->buffer[0x1FF4] & 0x80) == 0 &&
+        (NVRAM->buffer[0x1FF3] & 0x80) == 0 &&
+        (NVRAM->buffer[0x1FF2] & 0x80) == 0) {
         /* Repeat once a month */
         qemu_get_timedate(&tm, NVRAM->time_offset);
         tm.tm_mon++;
@@ -105,21 +105,21 @@ static void alarm_cb (void *opaque)
         }
         next_time = qemu_timedate_diff(&tm) - NVRAM->time_offset;
     } else if ((NVRAM->buffer[0x1FF5] & 0x80) != 0 &&
-	       (NVRAM->buffer[0x1FF4] & 0x80) == 0 &&
-	       (NVRAM->buffer[0x1FF3] & 0x80) == 0 &&
-	       (NVRAM->buffer[0x1FF2] & 0x80) == 0) {
+               (NVRAM->buffer[0x1FF4] & 0x80) == 0 &&
+               (NVRAM->buffer[0x1FF3] & 0x80) == 0 &&
+               (NVRAM->buffer[0x1FF2] & 0x80) == 0) {
         /* Repeat once a day */
         next_time = 24 * 60 * 60;
     } else if ((NVRAM->buffer[0x1FF5] & 0x80) != 0 &&
-	       (NVRAM->buffer[0x1FF4] & 0x80) != 0 &&
-	       (NVRAM->buffer[0x1FF3] & 0x80) == 0 &&
-	       (NVRAM->buffer[0x1FF2] & 0x80) == 0) {
+               (NVRAM->buffer[0x1FF4] & 0x80) != 0 &&
+               (NVRAM->buffer[0x1FF3] & 0x80) == 0 &&
+               (NVRAM->buffer[0x1FF2] & 0x80) == 0) {
         /* Repeat once an hour */
         next_time = 60 * 60;
     } else if ((NVRAM->buffer[0x1FF5] & 0x80) != 0 &&
-	       (NVRAM->buffer[0x1FF4] & 0x80) != 0 &&
-	       (NVRAM->buffer[0x1FF3] & 0x80) != 0 &&
-	       (NVRAM->buffer[0x1FF2] & 0x80) == 0) {
+               (NVRAM->buffer[0x1FF4] & 0x80) != 0 &&
+               (NVRAM->buffer[0x1FF3] & 0x80) != 0 &&
+               (NVRAM->buffer[0x1FF2] & 0x80) == 0) {
         /* Repeat once a minute */
         next_time = 60;
     } else {
@@ -161,13 +161,13 @@ static void watchdog_cb (void *opaque)
 
     NVRAM->buffer[0x1FF0] |= 0x80;
     if (NVRAM->buffer[0x1FF7] & 0x80) {
-	NVRAM->buffer[0x1FF7] = 0x00;
-	NVRAM->buffer[0x1FFC] &= ~0x40;
+        NVRAM->buffer[0x1FF7] = 0x00;
+        NVRAM->buffer[0x1FFC] &= ~0x40;
         /* May it be a hw CPU Reset instead ? */
         qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
     } else {
-	qemu_set_irq(NVRAM->IRQ, 1);
-	qemu_set_irq(NVRAM->IRQ, 0);
+        qemu_set_irq(NVRAM->IRQ, 1);
+        qemu_set_irq(NVRAM->IRQ, 0);
     }
 }
 
@@ -262,80 +262,80 @@ void m48t59_write(M48t59State *NVRAM, uint32_t addr, uint32_t val)
     case 0x1FF9:
     case 0x07F9:
         /* seconds (BCD) */
-	tmp = from_bcd(val & 0x7F);
-	if (tmp >= 0 && tmp <= 59) {
-	    get_time(NVRAM, &tm);
-	    tm.tm_sec = tmp;
-	    set_time(NVRAM, &tm);
-	}
+        tmp = from_bcd(val & 0x7F);
+        if (tmp >= 0 && tmp <= 59) {
+            get_time(NVRAM, &tm);
+            tm.tm_sec = tmp;
+            set_time(NVRAM, &tm);
+        }
         if ((val & 0x80) ^ (NVRAM->buffer[addr] & 0x80)) {
-	    if (val & 0x80) {
-		NVRAM->stop_time = time(NULL);
-	    } else {
-		NVRAM->time_offset += NVRAM->stop_time - time(NULL);
-		NVRAM->stop_time = 0;
-	    }
-	}
+            if (val & 0x80) {
+                NVRAM->stop_time = time(NULL);
+            } else {
+                NVRAM->time_offset += NVRAM->stop_time - time(NULL);
+                NVRAM->stop_time = 0;
+            }
+        }
         NVRAM->buffer[addr] = val & 0x80;
         break;
     case 0x1FFA:
     case 0x07FA:
         /* minutes (BCD) */
-	tmp = from_bcd(val & 0x7F);
-	if (tmp >= 0 && tmp <= 59) {
-	    get_time(NVRAM, &tm);
-	    tm.tm_min = tmp;
-	    set_time(NVRAM, &tm);
-	}
+        tmp = from_bcd(val & 0x7F);
+        if (tmp >= 0 && tmp <= 59) {
+            get_time(NVRAM, &tm);
+            tm.tm_min = tmp;
+            set_time(NVRAM, &tm);
+        }
         break;
     case 0x1FFB:
     case 0x07FB:
         /* hours (BCD) */
-	tmp = from_bcd(val & 0x3F);
-	if (tmp >= 0 && tmp <= 23) {
-	    get_time(NVRAM, &tm);
-	    tm.tm_hour = tmp;
-	    set_time(NVRAM, &tm);
-	}
+        tmp = from_bcd(val & 0x3F);
+        if (tmp >= 0 && tmp <= 23) {
+            get_time(NVRAM, &tm);
+            tm.tm_hour = tmp;
+            set_time(NVRAM, &tm);
+        }
         break;
     case 0x1FFC:
     case 0x07FC:
         /* day of the week / century */
-	tmp = from_bcd(val & 0x07);
-	get_time(NVRAM, &tm);
-	tm.tm_wday = tmp;
-	set_time(NVRAM, &tm);
+        tmp = from_bcd(val & 0x07);
+        get_time(NVRAM, &tm);
+        tm.tm_wday = tmp;
+        set_time(NVRAM, &tm);
         NVRAM->buffer[addr] = val & 0x40;
         break;
     case 0x1FFD:
     case 0x07FD:
         /* date (BCD) */
-       tmp = from_bcd(val & 0x3F);
-	if (tmp != 0) {
-	    get_time(NVRAM, &tm);
-	    tm.tm_mday = tmp;
-	    set_time(NVRAM, &tm);
-	}
+        tmp = from_bcd(val & 0x3F);
+        if (tmp != 0) {
+            get_time(NVRAM, &tm);
+            tm.tm_mday = tmp;
+            set_time(NVRAM, &tm);
+        }
         break;
     case 0x1FFE:
     case 0x07FE:
         /* month */
-	tmp = from_bcd(val & 0x1F);
-	if (tmp >= 1 && tmp <= 12) {
-	    get_time(NVRAM, &tm);
-	    tm.tm_mon = tmp - 1;
-	    set_time(NVRAM, &tm);
-	}
+        tmp = from_bcd(val & 0x1F);
+        if (tmp >= 1 && tmp <= 12) {
+            get_time(NVRAM, &tm);
+            tm.tm_mon = tmp - 1;
+            set_time(NVRAM, &tm);
+        }
         break;
     case 0x1FFF:
     case 0x07FF:
         /* year */
-	tmp = from_bcd(val);
-	if (tmp >= 0 && tmp <= 99) {
-	    get_time(NVRAM, &tm);
+        tmp = from_bcd(val);
+        if (tmp >= 0 && tmp <= 99) {
+            get_time(NVRAM, &tm);
             tm.tm_year = from_bcd(val) + NVRAM->base_year - 1900;
-	    set_time(NVRAM, &tm);
-	}
+            set_time(NVRAM, &tm);
+        }
         break;
     default:
         /* Check lock registers state */
@@ -346,7 +346,7 @@ void m48t59_write(M48t59State *NVRAM, uint32_t addr, uint32_t val)
     do_write:
         if (addr < NVRAM->size) {
             NVRAM->buffer[addr] = val & 0xFF;
-	}
+        }
         break;
     }
 }
@@ -367,34 +367,34 @@ uint32_t m48t59_read(M48t59State *NVRAM, uint32_t addr)
     switch (addr) {
     case 0x1FF0:
         /* flags register */
-	goto do_read;
+        goto do_read;
     case 0x1FF1:
         /* unused */
-	retval = 0;
+        retval = 0;
         break;
     case 0x1FF2:
         /* alarm seconds */
-	goto do_read;
+        goto do_read;
     case 0x1FF3:
         /* alarm minutes */
-	goto do_read;
+        goto do_read;
     case 0x1FF4:
         /* alarm hours */
-	goto do_read;
+        goto do_read;
     case 0x1FF5:
         /* alarm date */
-	goto do_read;
+        goto do_read;
     case 0x1FF6:
         /* interrupts */
-	goto do_read;
+        goto do_read;
     case 0x1FF7:
-	/* A read resets the watchdog */
-	set_up_watchdog(NVRAM, NVRAM->buffer[0x1FF7]);
-	goto do_read;
+        /* A read resets the watchdog */
+        set_up_watchdog(NVRAM, NVRAM->buffer[0x1FF7]);
+        goto do_read;
     case 0x1FF8:
     case 0x07F8:
         /* control */
-	goto do_read;
+        goto do_read;
     case 0x1FF9:
     case 0x07F9:
         /* seconds (BCD) */
@@ -446,7 +446,7 @@ uint32_t m48t59_read(M48t59State *NVRAM, uint32_t addr)
     do_read:
         if (addr < NVRAM->size) {
             retval = NVRAM->buffer[addr];
-	}
+        }
         break;
     }
     trace_m48txx_nvram_mem_read(addr, retval);
diff --git a/hw/rtc/twl92230.c b/hw/rtc/twl92230.c
index e8d5eda3fc..d8534dad94 100644
--- a/hw/rtc/twl92230.c
+++ b/hw/rtc/twl92230.c
@@ -112,19 +112,19 @@ static void menelaus_rtc_hz(void *opaque)
     s->rtc.alm_sec --;
     s->rtc.next += 1000;
     timer_mod(s->rtc.hz_tm, s->rtc.next);
-    if ((s->rtc.ctrl >> 3) & 3) {				/* EVERY */
+    if ((s->rtc.ctrl >> 3) & 3) {               /* EVERY */
         menelaus_rtc_update(s);
         if (((s->rtc.ctrl >> 3) & 3) == 1 && !s->rtc.tm.tm_sec)
-            s->status |= 1 << 8;				/* RTCTMR */
+            s->status |= 1 << 8;                /* RTCTMR */
         else if (((s->rtc.ctrl >> 3) & 3) == 2 && !s->rtc.tm.tm_min)
-            s->status |= 1 << 8;				/* RTCTMR */
+            s->status |= 1 << 8;                /* RTCTMR */
         else if (!s->rtc.tm.tm_hour)
-            s->status |= 1 << 8;				/* RTCTMR */
+            s->status |= 1 << 8;                /* RTCTMR */
     } else
-        s->status |= 1 << 8;					/* RTCTMR */
-    if ((s->rtc.ctrl >> 1) & 1) {				/* RTC_AL_EN */
+        s->status |= 1 << 8;                    /* RTCTMR */
+    if ((s->rtc.ctrl >> 1) & 1) {               /* RTC_AL_EN */
         if (s->rtc.alm_sec == 0)
-            s->status |= 1 << 9;				/* RTCALM */
+            s->status |= 1 << 9;                /* RTCALM */
         /* TODO: wake-up */
     }
     if (s->rtc.next_comp <= 0) {
@@ -140,19 +140,19 @@ static void menelaus_reset(I2CSlave *i2c)
 
     s->reg = 0x00;
 
-    s->vcore[0] = 0x0c;	/* XXX: X-loader needs 0x8c? check!  */
+    s->vcore[0] = 0x0c; /* XXX: X-loader needs 0x8c? check!  */
     s->vcore[1] = 0x05;
     s->vcore[2] = 0x02;
     s->vcore[3] = 0x0c;
     s->vcore[4] = 0x03;
-    s->dcdc[0] = 0x33;	/* Depends on wiring */
+    s->dcdc[0] = 0x33;  /* Depends on wiring */
     s->dcdc[1] = 0x03;
     s->dcdc[2] = 0x00;
     s->ldo[0] = 0x95;
     s->ldo[1] = 0x7e;
     s->ldo[2] = 0x00;
-    s->ldo[3] = 0x00;	/* Depends on wiring */
-    s->ldo[4] = 0x03;	/* Depends on wiring */
+    s->ldo[3] = 0x00;   /* Depends on wiring */
+    s->ldo[4] = 0x03;   /* Depends on wiring */
     s->ldo[5] = 0x00;
     s->ldo[6] = 0x00;
     s->ldo[7] = 0x00;
@@ -203,70 +203,70 @@ static void menelaus_gpio_set(void *opaque, int line, int level)
     }
 
     if (!s->pwrbtn_state && level) {
-        s->status |= 1 << 11;					/* PSHBTN */
+        s->status |= 1 << 11;               /* PSHBTN */
         menelaus_update(s);
     }
     s->pwrbtn_state = level;
 }
 
-#define MENELAUS_REV		0x01
-#define MENELAUS_VCORE_CTRL1	0x02
-#define MENELAUS_VCORE_CTRL2	0x03
-#define MENELAUS_VCORE_CTRL3	0x04
-#define MENELAUS_VCORE_CTRL4	0x05
-#define MENELAUS_VCORE_CTRL5	0x06
-#define MENELAUS_DCDC_CTRL1	0x07
-#define MENELAUS_DCDC_CTRL2	0x08
-#define MENELAUS_DCDC_CTRL3	0x09
-#define MENELAUS_LDO_CTRL1	0x0a
-#define MENELAUS_LDO_CTRL2	0x0b
-#define MENELAUS_LDO_CTRL3	0x0c
-#define MENELAUS_LDO_CTRL4	0x0d
-#define MENELAUS_LDO_CTRL5	0x0e
-#define MENELAUS_LDO_CTRL6	0x0f
-#define MENELAUS_LDO_CTRL7	0x10
-#define MENELAUS_LDO_CTRL8	0x11
-#define MENELAUS_SLEEP_CTRL1	0x12
-#define MENELAUS_SLEEP_CTRL2	0x13
-#define MENELAUS_DEVICE_OFF	0x14
-#define MENELAUS_OSC_CTRL	0x15
-#define MENELAUS_DETECT_CTRL	0x16
-#define MENELAUS_INT_MASK1	0x17
-#define MENELAUS_INT_MASK2	0x18
-#define MENELAUS_INT_STATUS1	0x19
-#define MENELAUS_INT_STATUS2	0x1a
-#define MENELAUS_INT_ACK1	0x1b
-#define MENELAUS_INT_ACK2	0x1c
-#define MENELAUS_GPIO_CTRL	0x1d
-#define MENELAUS_GPIO_IN	0x1e
-#define MENELAUS_GPIO_OUT	0x1f
-#define MENELAUS_BBSMS		0x20
-#define MENELAUS_RTC_CTRL	0x21
-#define MENELAUS_RTC_UPDATE	0x22
-#define MENELAUS_RTC_SEC	0x23
-#define MENELAUS_RTC_MIN	0x24
-#define MENELAUS_RTC_HR		0x25
-#define MENELAUS_RTC_DAY	0x26
-#define MENELAUS_RTC_MON	0x27
-#define MENELAUS_RTC_YR		0x28
-#define MENELAUS_RTC_WKDAY	0x29
-#define MENELAUS_RTC_AL_SEC	0x2a
-#define MENELAUS_RTC_AL_MIN	0x2b
-#define MENELAUS_RTC_AL_HR	0x2c
-#define MENELAUS_RTC_AL_DAY	0x2d
-#define MENELAUS_RTC_AL_MON	0x2e
-#define MENELAUS_RTC_AL_YR	0x2f
-#define MENELAUS_RTC_COMP_MSB	0x30
-#define MENELAUS_RTC_COMP_LSB	0x31
-#define MENELAUS_S1_PULL_EN	0x32
-#define MENELAUS_S1_PULL_DIR	0x33
-#define MENELAUS_S2_PULL_EN	0x34
-#define MENELAUS_S2_PULL_DIR	0x35
-#define MENELAUS_MCT_CTRL1	0x36
-#define MENELAUS_MCT_CTRL2	0x37
-#define MENELAUS_MCT_CTRL3	0x38
-#define MENELAUS_MCT_PIN_ST	0x39
-#define MENELAUS_DEBOUNCE1	0x3a
+#define MENELAUS_REV            0x01
+#define MENELAUS_VCORE_CTRL1    0x02
+#define MENELAUS_VCORE_CTRL2    0x03
+#define MENELAUS_VCORE_CTRL3    0x04
+#define MENELAUS_VCORE_CTRL4    0x05
+#define MENELAUS_VCORE_CTRL5    0x06
+#define MENELAUS_DCDC_CTRL1     0x07
+#define MENELAUS_DCDC_CTRL2     0x08
+#define MENELAUS_DCDC_CTRL3     0x09
+#define MENELAUS_LDO_CTRL1      0x0a
+#define MENELAUS_LDO_CTRL2      0x0b
+#define MENELAUS_LDO_CTRL3      0x0c
+#define MENELAUS_LDO_CTRL4      0x0d
+#define MENELAUS_LDO_CTRL5      0x0e
+#define MENELAUS_LDO_CTRL6      0x0f
+#define MENELAUS_LDO_CTRL7      0x10
+#define MENELAUS_LDO_CTRL8      0x11
+#define MENELAUS_SLEEP_CTRL1    0x12
+#define MENELAUS_SLEEP_CTRL2    0x13
+#define MENELAUS_DEVICE_OFF     0x14
+#define MENELAUS_OSC_CTRL       0x15
+#define MENELAUS_DETECT_CTRL    0x16
+#define MENELAUS_INT_MASK1      0x17
+#define MENELAUS_INT_MASK2      0x18
+#define MENELAUS_INT_STATUS1    0x19
+#define MENELAUS_INT_STATUS2    0x1a
+#define MENELAUS_INT_ACK1       0x1b
+#define MENELAUS_INT_ACK2       0x1c
+#define MENELAUS_GPIO_CTRL      0x1d
+#define MENELAUS_GPIO_IN        0x1e
+#define MENELAUS_GPIO_OUT       0x1f
+#define MENELAUS_BBSMS          0x20
+#define MENELAUS_RTC_CTRL       0x21
+#define MENELAUS_RTC_UPDATE     0x22
+#define MENELAUS_RTC_SEC        0x23
+#define MENELAUS_RTC_MIN        0x24
+#define MENELAUS_RTC_HR         0x25
+#define MENELAUS_RTC_DAY        0x26
+#define MENELAUS_RTC_MON        0x27
+#define MENELAUS_RTC_YR         0x28
+#define MENELAUS_RTC_WKDAY      0x29
+#define MENELAUS_RTC_AL_SEC     0x2a
+#define MENELAUS_RTC_AL_MIN     0x2b
+#define MENELAUS_RTC_AL_HR      0x2c
+#define MENELAUS_RTC_AL_DAY     0x2d
+#define MENELAUS_RTC_AL_MON     0x2e
+#define MENELAUS_RTC_AL_YR      0x2f
+#define MENELAUS_RTC_COMP_MSB   0x30
+#define MENELAUS_RTC_COMP_LSB   0x31
+#define MENELAUS_S1_PULL_EN     0x32
+#define MENELAUS_S1_PULL_DIR    0x33
+#define MENELAUS_S2_PULL_EN     0x34
+#define MENELAUS_S2_PULL_DIR    0x35
+#define MENELAUS_MCT_CTRL1      0x36
+#define MENELAUS_MCT_CTRL2      0x37
+#define MENELAUS_MCT_CTRL3      0x38
+#define MENELAUS_MCT_PIN_ST     0x39
+#define MENELAUS_DEBOUNCE1      0x3a
 
 static uint8_t menelaus_read(void *opaque, uint8_t addr)
 {
@@ -293,7 +293,7 @@ static uint8_t menelaus_read(void *opaque, uint8_t addr)
         return 0;
 
     case MENELAUS_OSC_CTRL:
-        return s->osc | (1 << 7);			/* CLK32K_GOOD */
+        return s->osc | (1 << 7);           /* CLK32K_GOOD */
 
     case MENELAUS_DETECT_CTRL:
         return s->detect;
@@ -334,9 +334,9 @@ static uint8_t menelaus_read(void *opaque, uint8_t addr)
         return to_bcd(s->rtc.tm.tm_min);
     case MENELAUS_RTC_HR:
         menelaus_rtc_update(s);
-        if ((s->rtc.ctrl >> 2) & 1)			/* MODE12_n24 */
+        if ((s->rtc.ctrl >> 2) & 1)         /* MODE12_n24 */
             return to_bcd((s->rtc.tm.tm_hour % 12) + 1) |
-                    (!!(s->rtc.tm.tm_hour >= 12) << 7);	/* PM_nAM */
+                    (!!(s->rtc.tm.tm_hour >= 12) << 7); /* PM_nAM */
         else
             return to_bcd(s->rtc.tm.tm_hour);
     case MENELAUS_RTC_DAY:
@@ -356,7 +356,7 @@ static uint8_t menelaus_read(void *opaque, uint8_t addr)
     case MENELAUS_RTC_AL_MIN:
         return to_bcd(s->rtc.alm.tm_min);
     case MENELAUS_RTC_AL_HR:
-        if ((s->rtc.ctrl >> 2) & 1)			/* MODE12_n24 */
+        if ((s->rtc.ctrl >> 2) & 1)         /* MODE12_n24 */
             return to_bcd((s->rtc.alm.tm_hour % 12) + 1) |
                     (!!(s->rtc.alm.tm_hour >= 12) << 7);/* AL_PM_nAM */
         else
@@ -541,7 +541,7 @@ static void menelaus_write(void *opaque, uint8_t addr, uint8_t value)
         break;
 
     case MENELAUS_RTC_CTRL:
-        if ((s->rtc.ctrl ^ value) & 1) {			/* RTC_EN */
+        if ((s->rtc.ctrl ^ value) & 1) {    /* RTC_EN */
             if (value & 1)
                 menelaus_rtc_start(s);
             else
@@ -603,7 +603,7 @@ static void menelaus_write(void *opaque, uint8_t addr, uint8_t value)
         default:
             fprintf(stderr, "%s: bad RTC_UPDATE value %02x\n",
                             __func__, value);
-            s->status |= 1 << 10;				/* RTCERR */
+            s->status |= 1 << 10;           /* RTCERR */
             menelaus_update(s);
         }
         s->rtc.sec_offset = qemu_timedate_diff(&tm);
@@ -615,7 +615,7 @@ static void menelaus_write(void *opaque, uint8_t addr, uint8_t value)
         s->rtc.tm.tm_min = from_bcd(value & 0x7f);
         break;
     case MENELAUS_RTC_HR:
-        s->rtc.tm.tm_hour = (s->rtc.ctrl & (1 << 2)) ?	/* MODE12_n24 */
+        s->rtc.tm.tm_hour = (s->rtc.ctrl & (1 << 2)) ?  /* MODE12_n24 */
                 MIN(from_bcd(value & 0x3f), 12) + ((value >> 7) ? 11 : -1) :
                 from_bcd(value & 0x3f);
         break;
@@ -640,7 +640,7 @@ static void menelaus_write(void *opaque, uint8_t addr, uint8_t value)
         menelaus_alm_update(s);
         break;
     case MENELAUS_RTC_AL_HR:
-        s->rtc.alm.tm_hour = (s->rtc.ctrl & (1 << 2)) ?	/* MODE12_n24 */
+        s->rtc.alm.tm_hour = (s->rtc.ctrl & (1 << 2)) ? /* MODE12_n24 */
                 MIN(from_bcd(value & 0x3f), 12) + ((value >> 7) ? 11 : -1) :
                 from_bcd(value & 0x3f);
         menelaus_alm_update(s);
@@ -792,14 +792,14 @@ static int menelaus_post_load(void *opaque, int version_id)
 {
     MenelausState *s = opaque;
 
-    if (s->rtc.ctrl & 1)					/* RTC_EN */
+    if (s->rtc.ctrl & 1)                    /* RTC_EN */
         menelaus_rtc_stop(s);
 
     s->rtc.next = s->rtc_next_vmstate;
 
     menelaus_alm_update(s);
     menelaus_update(s);
-    if (s->rtc.ctrl & 1)					/* RTC_EN */
+    if (s->rtc.ctrl & 1)                    /* RTC_EN */
         menelaus_rtc_start(s);
     return 0;
 }
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index ceceafb2cd..c97176110c 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -199,8 +199,8 @@ static void scsi_dma_restart_cb(void *opaque, bool running, RunState state)
 }
 
 static bool scsi_bus_is_address_free(SCSIBus *bus,
-				     int channel, int target, int lun,
-				     SCSIDevice **p_dev)
+                                     int channel, int target, int lun,
+                                     SCSIDevice **p_dev)
 {
     SCSIDevice *d;
 
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index da5bdd134a..77a717d355 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -342,39 +342,39 @@ static void sd_set_scr(SDState *sd)
     sd->scr[7] = 0x00;
 }
 
-#define MID	0xaa
-#define OID	"XY"
-#define PNM	"QEMU!"
-#define PRV	0x01
-#define MDT_YR	2006
-#define MDT_MON	2
+#define MID     0xaa
+#define OID     "XY"
+#define PNM     "QEMU!"
+#define PRV     0x01
+#define MDT_YR  2006
+#define MDT_MON 2
 
 static void sd_set_cid(SDState *sd)
 {
-    sd->cid[0] = MID;		/* Fake card manufacturer ID (MID) */
-    sd->cid[1] = OID[0];	/* OEM/Application ID (OID) */
+    sd->cid[0] = MID;       /* Fake card manufacturer ID (MID) */
+    sd->cid[1] = OID[0];    /* OEM/Application ID (OID) */
     sd->cid[2] = OID[1];
-    sd->cid[3] = PNM[0];	/* Fake product name (PNM) */
+    sd->cid[3] = PNM[0];    /* Fake product name (PNM) */
     sd->cid[4] = PNM[1];
     sd->cid[5] = PNM[2];
     sd->cid[6] = PNM[3];
     sd->cid[7] = PNM[4];
-    sd->cid[8] = PRV;		/* Fake product revision (PRV) */
-    sd->cid[9] = 0xde;		/* Fake serial number (PSN) */
+    sd->cid[8] = PRV;       /* Fake product revision (PRV) */
+    sd->cid[9] = 0xde;      /* Fake serial number (PSN) */
     sd->cid[10] = 0xad;
     sd->cid[11] = 0xbe;
     sd->cid[12] = 0xef;
-    sd->cid[13] = 0x00 |	/* Manufacture date (MDT) */
+    sd->cid[13] = 0x00 |    /* Manufacture date (MDT) */
         ((MDT_YR - 2000) / 10);
     sd->cid[14] = ((MDT_YR % 10) << 4) | MDT_MON;
     sd->cid[15] = (sd_crc7(sd->cid, 15) << 1) | 1;
 }
 
-#define HWBLOCK_SHIFT	9			/* 512 bytes */
-#define SECTOR_SHIFT	5			/* 16 kilobytes */
-#define WPGROUP_SHIFT	7			/* 2 megs */
-#define CMULT_SHIFT	9			/* 512 times HWBLOCK_SIZE */
-#define WPGROUP_SIZE	(1 << (HWBLOCK_SHIFT + SECTOR_SHIFT + WPGROUP_SHIFT))
+#define HWBLOCK_SHIFT   9        /* 512 bytes */
+#define SECTOR_SHIFT    5        /* 16 kilobytes */
+#define WPGROUP_SHIFT   7        /* 2 megs */
+#define CMULT_SHIFT     9        /* 512 times HWBLOCK_SIZE */
+#define WPGROUP_SIZE    (1 << (HWBLOCK_SHIFT + SECTOR_SHIFT + WPGROUP_SHIFT))
 
 static const uint8_t sd_csd_rw_mask[16] = {
     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
@@ -395,31 +395,31 @@ static void sd_set_csd(SDState *sd, uint64_t size)
     csize = (size >> (CMULT_SHIFT + hwblock_shift)) - 1;
 
     if (size <= SDSC_MAX_CAPACITY) { /* Standard Capacity SD */
-        sd->csd[0] = 0x00;	/* CSD structure */
-        sd->csd[1] = 0x26;	/* Data read access-time-1 */
-        sd->csd[2] = 0x00;	/* Data read access-time-2 */
+        sd->csd[0] = 0x00;      /* CSD structure */
+        sd->csd[1] = 0x26;      /* Data read access-time-1 */
+        sd->csd[2] = 0x00;      /* Data read access-time-2 */
         sd->csd[3] = 0x32;      /* Max. data transfer rate: 25 MHz */
-        sd->csd[4] = 0x5f;	/* Card Command Classes */
-        sd->csd[5] = 0x50 |	/* Max. read data block length */
+        sd->csd[4] = 0x5f;      /* Card Command Classes */
+        sd->csd[5] = 0x50 |     /* Max. read data block length */
             hwblock_shift;
-        sd->csd[6] = 0xe0 |	/* Partial block for read allowed */
+        sd->csd[6] = 0xe0 |     /* Partial block for read allowed */
             ((csize >> 10) & 0x03);
-        sd->csd[7] = 0x00 |	/* Device size */
+        sd->csd[7] = 0x00 |     /* Device size */
             ((csize >> 2) & 0xff);
-        sd->csd[8] = 0x3f |	/* Max. read current */
+        sd->csd[8] = 0x3f |     /* Max. read current */
             ((csize << 6) & 0xc0);
-        sd->csd[9] = 0xfc |	/* Max. write current */
+        sd->csd[9] = 0xfc |     /* Max. write current */
             ((CMULT_SHIFT - 2) >> 1);
-        sd->csd[10] = 0x40 |	/* Erase sector size */
+        sd->csd[10] = 0x40 |    /* Erase sector size */
             (((CMULT_SHIFT - 2) << 7) & 0x80) | (sectsize >> 1);
-        sd->csd[11] = 0x00 |	/* Write protect group size */
+        sd->csd[11] = 0x00 |    /* Write protect group size */
             ((sectsize << 7) & 0x80) | wpsize;
-        sd->csd[12] = 0x90 |	/* Write speed factor */
+        sd->csd[12] = 0x90 |    /* Write speed factor */
             (hwblock_shift >> 2);
-        sd->csd[13] = 0x20 |	/* Max. write data block length */
+        sd->csd[13] = 0x20 |    /* Max. write data block length */
             ((hwblock_shift << 6) & 0xc0);
-        sd->csd[14] = 0x00;	/* File format group */
-    } else {			/* SDHC */
+        sd->csd[14] = 0x00;     /* File format group */
+    } else {                    /* SDHC */
         size /= 512 * KiB;
         size -= 1;
         sd->csd[0] = 0x40;
@@ -513,7 +513,7 @@ static int sd_req_crc_validate(SDRequest *req)
     buffer[0] = 0x40 | req->cmd;
     stl_be_p(&buffer[1], req->arg);
     return 0;
-    return sd_crc7(buffer, 5) != req->crc;	/* TODO */
+    return sd_crc7(buffer, 5) != req->crc;  /* TODO */
 }
 
 static void sd_response_r1_make(SDState *sd, uint8_t *response)
@@ -851,19 +851,19 @@ static void sd_function_switch(SDState *sd, uint32_t arg)
     int i, mode, new_func;
     mode = !!(arg & 0x80000000);
 
-    sd->data[0] = 0x00;		/* Maximum current consumption */
+    sd->data[0] = 0x00;     /* Maximum current consumption */
     sd->data[1] = 0x01;
-    sd->data[2] = 0x80;		/* Supported group 6 functions */
+    sd->data[2] = 0x80;     /* Supported group 6 functions */
     sd->data[3] = 0x01;
-    sd->data[4] = 0x80;		/* Supported group 5 functions */
+    sd->data[4] = 0x80;     /* Supported group 5 functions */
     sd->data[5] = 0x01;
-    sd->data[6] = 0x80;		/* Supported group 4 functions */
+    sd->data[6] = 0x80;     /* Supported group 4 functions */
     sd->data[7] = 0x01;
-    sd->data[8] = 0x80;		/* Supported group 3 functions */
+    sd->data[8] = 0x80;     /* Supported group 3 functions */
     sd->data[9] = 0x01;
-    sd->data[10] = 0x80;	/* Supported group 2 functions */
+    sd->data[10] = 0x80;    /* Supported group 2 functions */
     sd->data[11] = 0x43;
-    sd->data[12] = 0x80;	/* Supported group 1 functions */
+    sd->data[12] = 0x80;    /* Supported group 1 functions */
     sd->data[13] = 0x03;
 
     memset(&sd->data[14], 0, 3);
@@ -1001,7 +1001,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
     switch (req.cmd) {
     /* Basic commands (Class 0 and Class 1) */
-    case 0:	/* CMD0:   GO_IDLE_STATE */
+    case 0:  /* CMD0:   GO_IDLE_STATE */
         switch (sd->state) {
         case sd_inactive_state:
             return sd->spi ? sd_r1 : sd_r0;
@@ -1013,14 +1013,14 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 1:	/* CMD1:   SEND_OP_CMD */
+    case 1:  /* CMD1:   SEND_OP_CMD */
         if (!sd->spi)
             goto bad_cmd;
 
         sd->state = sd_transfer_state;
         return sd_r1;
 
-    case 2:	/* CMD2:   ALL_SEND_CID */
+    case 2:  /* CMD2:   ALL_SEND_CID */
         if (sd->spi)
             goto bad_cmd;
         switch (sd->state) {
@@ -1033,7 +1033,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 3:	/* CMD3:   SEND_RELATIVE_ADDR */
+    case 3:  /* CMD3:   SEND_RELATIVE_ADDR */
         if (sd->spi)
             goto bad_cmd;
         switch (sd->state) {
@@ -1048,7 +1048,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 4:	/* CMD4:   SEND_DSR */
+    case 4:  /* CMD4:   SEND_DSR */
         if (sd->spi)
             goto bad_cmd;
         switch (sd->state) {
@@ -1063,7 +1063,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
     case 5: /* CMD5: reserved for SDIO cards */
         return sd_illegal;
 
-    case 6:	/* CMD6:   SWITCH_FUNCTION */
+    case 6:  /* CMD6:   SWITCH_FUNCTION */
         switch (sd->mode) {
         case sd_data_transfer_mode:
             sd_function_switch(sd, req.arg);
@@ -1077,7 +1077,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 7:	/* CMD7:   SELECT/DESELECT_CARD */
+    case 7:  /* CMD7:   SELECT/DESELECT_CARD */
         if (sd->spi)
             goto bad_cmd;
         switch (sd->state) {
@@ -1115,7 +1115,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 8:	/* CMD8:   SEND_IF_COND */
+    case 8:  /* CMD8:   SEND_IF_COND */
         if (sd->spec_version < SD_PHY_SPECv2_00_VERS) {
             break;
         }
@@ -1133,7 +1133,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         sd->vhs = req.arg;
         return sd_r7;
 
-    case 9:	/* CMD9:   SEND_CSD */
+    case 9:  /* CMD9:   SEND_CSD */
         switch (sd->state) {
         case sd_standby_state:
             if (sd->rca != rca)
@@ -1155,7 +1155,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 10:	/* CMD10:  SEND_CID */
+    case 10:  /* CMD10:  SEND_CID */
         switch (sd->state) {
         case sd_standby_state:
             if (sd->rca != rca)
@@ -1177,7 +1177,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 12:	/* CMD12:  STOP_TRANSMISSION */
+    case 12:  /* CMD12:  STOP_TRANSMISSION */
         switch (sd->state) {
         case sd_sendingdata_state:
             sd->state = sd_transfer_state;
@@ -1194,7 +1194,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 13:	/* CMD13:  SEND_STATUS */
+    case 13:  /* CMD13:  SEND_STATUS */
         switch (sd->mode) {
         case sd_data_transfer_mode:
             if (!sd->spi && sd->rca != rca) {
@@ -1208,7 +1208,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 15:	/* CMD15:  GO_INACTIVE_STATE */
+    case 15:  /* CMD15:  GO_INACTIVE_STATE */
         if (sd->spi)
             goto bad_cmd;
         switch (sd->mode) {
@@ -1225,7 +1225,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     /* Block read commands (Classs 2) */
-    case 16:	/* CMD16:  SET_BLOCKLEN */
+    case 16:  /* CMD16:  SET_BLOCKLEN */
         switch (sd->state) {
         case sd_transfer_state:
             if (req.arg > (1 << HWBLOCK_SHIFT)) {
@@ -1242,8 +1242,8 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 17:	/* CMD17:  READ_SINGLE_BLOCK */
-    case 18:	/* CMD18:  READ_MULTIPLE_BLOCK */
+    case 17:  /* CMD17:  READ_SINGLE_BLOCK */
+    case 18:  /* CMD18:  READ_MULTIPLE_BLOCK */
         switch (sd->state) {
         case sd_transfer_state:
 
@@ -1287,8 +1287,8 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     /* Block write commands (Class 4) */
-    case 24:	/* CMD24:  WRITE_SINGLE_BLOCK */
-    case 25:	/* CMD25:  WRITE_MULTIPLE_BLOCK */
+    case 24:  /* CMD24:  WRITE_SINGLE_BLOCK */
+    case 25:  /* CMD25:  WRITE_MULTIPLE_BLOCK */
         switch (sd->state) {
         case sd_transfer_state:
 
@@ -1316,7 +1316,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 26:	/* CMD26:  PROGRAM_CID */
+    case 26:  /* CMD26:  PROGRAM_CID */
         if (sd->spi)
             goto bad_cmd;
         switch (sd->state) {
@@ -1331,7 +1331,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 27:	/* CMD27:  PROGRAM_CSD */
+    case 27:  /* CMD27:  PROGRAM_CSD */
         switch (sd->state) {
         case sd_transfer_state:
             sd->state = sd_receivingdata_state;
@@ -1345,7 +1345,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     /* Write protection (Class 6) */
-    case 28:	/* CMD28:  SET_WRITE_PROT */
+    case 28:  /* CMD28:  SET_WRITE_PROT */
         if (sd->size > SDSC_MAX_CAPACITY) {
             return sd_illegal;
         }
@@ -1367,7 +1367,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 29:	/* CMD29:  CLR_WRITE_PROT */
+    case 29:  /* CMD29:  CLR_WRITE_PROT */
         if (sd->size > SDSC_MAX_CAPACITY) {
             return sd_illegal;
         }
@@ -1389,7 +1389,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 30:	/* CMD30:  SEND_WRITE_PROT */
+    case 30:  /* CMD30:  SEND_WRITE_PROT */
         if (sd->size > SDSC_MAX_CAPACITY) {
             return sd_illegal;
         }
@@ -1413,7 +1413,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     /* Erase commands (Class 5) */
-    case 32:	/* CMD32:  ERASE_WR_BLK_START */
+    case 32:  /* CMD32:  ERASE_WR_BLK_START */
         switch (sd->state) {
         case sd_transfer_state:
             sd->erase_start = req.arg;
@@ -1424,7 +1424,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 33:	/* CMD33:  ERASE_WR_BLK_END */
+    case 33:  /* CMD33:  ERASE_WR_BLK_END */
         switch (sd->state) {
         case sd_transfer_state:
             sd->erase_end = req.arg;
@@ -1435,7 +1435,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 38:	/* CMD38:  ERASE */
+    case 38:  /* CMD38:  ERASE */
         switch (sd->state) {
         case sd_transfer_state:
             if (sd->csd[14] & 0x30) {
@@ -1455,7 +1455,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     /* Lock card commands (Class 7) */
-    case 42:	/* CMD42:  LOCK_UNLOCK */
+    case 42:  /* CMD42:  LOCK_UNLOCK */
         switch (sd->state) {
         case sd_transfer_state:
             sd->state = sd_receivingdata_state;
@@ -1478,7 +1478,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         return sd_illegal;
 
     /* Application specific commands (Class 8) */
-    case 55:	/* CMD55:  APP_CMD */
+    case 55:  /* CMD55:  APP_CMD */
         switch (sd->state) {
         case sd_ready_state:
         case sd_identification_state:
@@ -1501,7 +1501,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         sd->card_status |= APP_CMD;
         return sd_r1;
 
-    case 56:	/* CMD56:  GEN_CMD */
+    case 56:  /* CMD56:  GEN_CMD */
         switch (sd->state) {
         case sd_transfer_state:
             sd->data_offset = 0;
@@ -1546,7 +1546,7 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
                              req.cmd, req.arg, sd_state_name(sd->state));
     sd->card_status |= APP_CMD;
     switch (req.cmd) {
-    case 6:	/* ACMD6:  SET_BUS_WIDTH */
+    case 6:  /* ACMD6:  SET_BUS_WIDTH */
         if (sd->spi) {
             goto unimplemented_spi_cmd;
         }
@@ -1561,7 +1561,7 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
         }
         break;
 
-    case 13:	/* ACMD13: SD_STATUS */
+    case 13:  /* ACMD13: SD_STATUS */
         switch (sd->state) {
         case sd_transfer_state:
             sd->state = sd_sendingdata_state;
@@ -1574,7 +1574,7 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
         }
         break;
 
-    case 22:	/* ACMD22: SEND_NUM_WR_BLOCKS */
+    case 22:  /* ACMD22: SEND_NUM_WR_BLOCKS */
         switch (sd->state) {
         case sd_transfer_state:
             *(uint32_t *) sd->data = sd->blk_written;
@@ -1589,7 +1589,7 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
         }
         break;
 
-    case 23:	/* ACMD23: SET_WR_BLK_ERASE_COUNT */
+    case 23:  /* ACMD23: SET_WR_BLK_ERASE_COUNT */
         switch (sd->state) {
         case sd_transfer_state:
             return sd_r1;
@@ -1599,7 +1599,7 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
         }
         break;
 
-    case 41:	/* ACMD41: SD_APP_OP_COND */
+    case 41:  /* ACMD41: SD_APP_OP_COND */
         if (sd->spi) {
             /* SEND_OP_CMD */
             sd->state = sd_transfer_state;
@@ -1641,7 +1641,7 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
 
         return sd_r3;
 
-    case 42:	/* ACMD42: SET_CLR_CARD_DETECT */
+    case 42:  /* ACMD42: SET_CLR_CARD_DETECT */
         switch (sd->state) {
         case sd_transfer_state:
             /* Bringing in the 50KOhm pull-up resistor... Done.  */
@@ -1652,7 +1652,7 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
         }
         break;
 
-    case 51:	/* ACMD51: SEND_SCR */
+    case 51:  /* ACMD51: SEND_SCR */
         switch (sd->state) {
         case sd_transfer_state:
             sd->state = sd_sendingdata_state;
@@ -1840,7 +1840,7 @@ void sd_write_byte(SDState *sd, uint8_t value)
                             sd_acmd_name(sd->current_cmd),
                             sd->current_cmd, value);
     switch (sd->current_cmd) {
-    case 24:	/* CMD24:  WRITE_SINGLE_BLOCK */
+    case 24:  /* CMD24:  WRITE_SINGLE_BLOCK */
         sd->data[sd->data_offset ++] = value;
         if (sd->data_offset >= sd->blk_len) {
             /* TODO: Check CRC before committing */
@@ -1853,7 +1853,7 @@ void sd_write_byte(SDState *sd, uint8_t value)
         }
         break;
 
-    case 25:	/* CMD25:  WRITE_MULTIPLE_BLOCK */
+    case 25:  /* CMD25:  WRITE_MULTIPLE_BLOCK */
         if (sd->data_offset == 0) {
             /* Start of the block - let's check the address is valid */
             if (!address_in_range(sd, "WRITE_MULTIPLE_BLOCK",
@@ -1890,7 +1890,7 @@ void sd_write_byte(SDState *sd, uint8_t value)
         }
         break;
 
-    case 26:	/* CMD26:  PROGRAM_CID */
+    case 26:  /* CMD26:  PROGRAM_CID */
         sd->data[sd->data_offset ++] = value;
         if (sd->data_offset >= sizeof(sd->cid)) {
             /* TODO: Check CRC before committing */
@@ -1909,7 +1909,7 @@ void sd_write_byte(SDState *sd, uint8_t value)
         }
         break;
 
-    case 27:	/* CMD27:  PROGRAM_CSD */
+    case 27:  /* CMD27:  PROGRAM_CSD */
         sd->data[sd->data_offset ++] = value;
         if (sd->data_offset >= sizeof(sd->csd)) {
             /* TODO: Check CRC before committing */
@@ -1933,7 +1933,7 @@ void sd_write_byte(SDState *sd, uint8_t value)
         }
         break;
 
-    case 42:	/* CMD42:  LOCK_UNLOCK */
+    case 42:  /* CMD42:  LOCK_UNLOCK */
         sd->data[sd->data_offset ++] = value;
         if (sd->data_offset >= sd->blk_len) {
             /* TODO: Check CRC before committing */
@@ -1944,7 +1944,7 @@ void sd_write_byte(SDState *sd, uint8_t value)
         }
         break;
 
-    case 56:	/* CMD56:  GEN_CMD */
+    case 56:  /* CMD56:  GEN_CMD */
         sd->data[sd->data_offset ++] = value;
         if (sd->data_offset >= sd->blk_len) {
             APP_WRITE_BLOCK(sd->data_start, sd->data_offset);
@@ -1996,29 +1996,29 @@ uint8_t sd_read_byte(SDState *sd)
                            sd_acmd_name(sd->current_cmd),
                            sd->current_cmd, io_len);
     switch (sd->current_cmd) {
-    case 6:	/* CMD6:   SWITCH_FUNCTION */
+    case 6:  /* CMD6:   SWITCH_FUNCTION */
         ret = sd->data[sd->data_offset ++];
 
         if (sd->data_offset >= 64)
             sd->state = sd_transfer_state;
         break;
 
-    case 9:	/* CMD9:   SEND_CSD */
-    case 10:	/* CMD10:  SEND_CID */
+    case 9:  /* CMD9:   SEND_CSD */
+    case 10:  /* CMD10:  SEND_CID */
         ret = sd->data[sd->data_offset ++];
 
         if (sd->data_offset >= 16)
             sd->state = sd_transfer_state;
         break;
 
-    case 13:	/* ACMD13: SD_STATUS */
+    case 13:  /* ACMD13: SD_STATUS */
         ret = sd->sd_status[sd->data_offset ++];
 
         if (sd->data_offset >= sizeof(sd->sd_status))
             sd->state = sd_transfer_state;
         break;
 
-    case 17:	/* CMD17:  READ_SINGLE_BLOCK */
+    case 17:  /* CMD17:  READ_SINGLE_BLOCK */
         if (sd->data_offset == 0)
             BLK_READ_BLOCK(sd->data_start, io_len);
         ret = sd->data[sd->data_offset ++];
@@ -2027,7 +2027,7 @@ uint8_t sd_read_byte(SDState *sd)
             sd->state = sd_transfer_state;
         break;
 
-    case 18:	/* CMD18:  READ_MULTIPLE_BLOCK */
+    case 18:  /* CMD18:  READ_MULTIPLE_BLOCK */
         if (sd->data_offset == 0) {
             if (!address_in_range(sd, "READ_MULTIPLE_BLOCK",
                                   sd->data_start, io_len)) {
@@ -2058,28 +2058,28 @@ uint8_t sd_read_byte(SDState *sd)
         ret = sd_tuning_block_pattern[sd->data_offset++];
         break;
 
-    case 22:	/* ACMD22: SEND_NUM_WR_BLOCKS */
+    case 22:  /* ACMD22: SEND_NUM_WR_BLOCKS */
         ret = sd->data[sd->data_offset ++];
 
         if (sd->data_offset >= 4)
             sd->state = sd_transfer_state;
         break;
 
-    case 30:	/* CMD30:  SEND_WRITE_PROT */
+    case 30:  /* CMD30:  SEND_WRITE_PROT */
         ret = sd->data[sd->data_offset ++];
 
         if (sd->data_offset >= 4)
             sd->state = sd_transfer_state;
         break;
 
-    case 51:	/* ACMD51: SEND_SCR */
+    case 51:  /* ACMD51: SEND_SCR */
         ret = sd->scr[sd->data_offset ++];
 
         if (sd->data_offset >= sizeof(sd->scr))
             sd->state = sd_transfer_state;
         break;
 
-    case 56:	/* CMD56:  GEN_CMD */
+    case 56:  /* CMD56:  GEN_CMD */
         if (sd->data_offset == 0)
             APP_READ_BLOCK(sd->data_start, sd->blk_len);
         ret = sd->data[sd->data_offset ++];
diff --git a/hw/watchdog/wdt_ib700.c b/hw/watchdog/wdt_ib700.c
index b116c3a3aa..a1750a4957 100644
--- a/hw/watchdog/wdt_ib700.c
+++ b/hw/watchdog/wdt_ib700.c
@@ -30,7 +30,7 @@
 /*#define IB700_DEBUG 1*/
 
 #ifdef IB700_DEBUG
-#define ib700_debug(fs,...)					\
+#define ib700_debug(fs,...)                                    \
     fprintf(stderr,"ib700: %s: "fs,__func__,##__VA_ARGS__)
 #else
 #define ib700_debug(fs,...)
diff --git a/include/crypto/aes.h b/include/crypto/aes.h
index ba297d6a73..822d64588c 100644
--- a/include/crypto/aes.h
+++ b/include/crypto/aes.h
@@ -18,14 +18,14 @@ typedef struct aes_key_st AES_KEY;
 #define AES_decrypt QEMU_AES_decrypt
 
 int AES_set_encrypt_key(const unsigned char *userKey, const int bits,
-	AES_KEY *key);
+                        AES_KEY *key);
 int AES_set_decrypt_key(const unsigned char *userKey, const int bits,
-	AES_KEY *key);
+                        AES_KEY *key);
 
 void AES_encrypt(const unsigned char *in, unsigned char *out,
-	const AES_KEY *key);
+                 const AES_KEY *key);
 void AES_decrypt(const unsigned char *in, unsigned char *out,
-	const AES_KEY *key);
+                 const AES_KEY *key);
 
 extern const uint8_t AES_sbox[256];
 extern const uint8_t AES_isbox[256];
diff --git a/include/crypto/desrfb.h b/include/crypto/desrfb.h
index 7ca596c387..af8d12234d 100644
--- a/include/crypto/desrfb.h
+++ b/include/crypto/desrfb.h
@@ -15,30 +15,30 @@
 
 /* d3des.h -
  *
- *	Headers and defines for d3des.c
- *	Graven Imagery, 1992.
+ * Headers and defines for d3des.c
+ * Graven Imagery, 1992.
  *
  * Copyright (c) 1988,1989,1990,1991,1992 by Richard Outerbridge
- *	(GEnie : OUTER; CIS : [71755,204])
+ * (GEnie : OUTER; CIS : [71755,204])
  */
 
-#define EN0	0	/* MODE == encrypt */
-#define DE1	1	/* MODE == decrypt */
+#define EN0 0   /* MODE == encrypt */
+#define DE1 1   /* MODE == decrypt */
 
 void deskey(unsigned char *, int);
-/*		      hexkey[8]     MODE
+/*          hexkey[8]        MODE
  * Sets the internal key register according to the hexadecimal
  * key contained in the 8 bytes of hexkey, according to the DES,
  * for encryption or decryption according to MODE.
  */
 
 void usekey(unsigned long *);
-/*		    cookedkey[32]
+/*          cookedkey[32]
  * Loads the internal key register with the data in cookedkey.
  */
 
 void des(unsigned char *, unsigned char *);
-/*		    from[8]	      to[8]
+/*       from[8]          to[8]
  * Encrypts/Decrypts (according to the key currently loaded in the
  * internal key register) one block of eight bytes at address 'from'
  * into the block at address 'to'.  They can be the same.
diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
index 32cda9ef14..2f6f91c2ee 100644
--- a/include/disas/dis-asm.h
+++ b/include/disas/dis-asm.h
@@ -188,20 +188,20 @@ enum bfd_architecture
 #define bfd_mach_alpha_ev5  0x20
 #define bfd_mach_alpha_ev6  0x30
   bfd_arch_arm,        /* Advanced Risc Machines ARM */
-#define bfd_mach_arm_unknown	0
-#define bfd_mach_arm_2		1
-#define bfd_mach_arm_2a		2
-#define bfd_mach_arm_3		3
-#define bfd_mach_arm_3M 	4
-#define bfd_mach_arm_4 		5
-#define bfd_mach_arm_4T 	6
-#define bfd_mach_arm_5 		7
-#define bfd_mach_arm_5T		8
-#define bfd_mach_arm_5TE	9
-#define bfd_mach_arm_XScale	10
-#define bfd_mach_arm_ep9312	11
-#define bfd_mach_arm_iWMMXt	12
-#define bfd_mach_arm_iWMMXt2	13
+#define bfd_mach_arm_unknown  0
+#define bfd_mach_arm_2        1
+#define bfd_mach_arm_2a       2
+#define bfd_mach_arm_3        3
+#define bfd_mach_arm_3M       4
+#define bfd_mach_arm_4        5
+#define bfd_mach_arm_4T       6
+#define bfd_mach_arm_5        7
+#define bfd_mach_arm_5T       8
+#define bfd_mach_arm_5TE      9
+#define bfd_mach_arm_XScale   10
+#define bfd_mach_arm_ep9312   11
+#define bfd_mach_arm_iWMMXt   12
+#define bfd_mach_arm_iWMMXt2  13
   bfd_arch_ns32k,      /* National Semiconductors ns32000 */
   bfd_arch_w65,        /* WDC 65816 */
   bfd_arch_tic30,      /* Texas Instruments TMS320C30 */
@@ -241,7 +241,7 @@ enum bfd_architecture
   bfd_arch_ia64,      /* HP/Intel ia64 */
 #define bfd_mach_ia64_elf64    64
 #define bfd_mach_ia64_elf32    32
-  bfd_arch_nios2,	/* Nios II */
+  bfd_arch_nios2,      /* Nios II */
 #define bfd_mach_nios2          0
 #define bfd_mach_nios2r1        1
 #define bfd_mach_nios2r2        2
@@ -269,14 +269,14 @@ typedef int (*fprintf_function)(FILE *f, const char *fmt, ...)
     G_GNUC_PRINTF(2, 3);
 
 enum dis_insn_type {
-  dis_noninsn,			/* Not a valid instruction */
-  dis_nonbranch,		/* Not a branch instruction */
-  dis_branch,			/* Unconditional branch */
-  dis_condbranch,		/* Conditional branch */
-  dis_jsr,			/* Jump to subroutine */
-  dis_condjsr,			/* Conditional jump to subroutine */
-  dis_dref,			/* Data reference instruction */
-  dis_dref2			/* Two data references in instruction */
+  dis_noninsn,          /* Not a valid instruction */
+  dis_nonbranch,        /* Not a branch instruction */
+  dis_branch,           /* Unconditional branch */
+  dis_condbranch,       /* Conditional branch */
+  dis_jsr,              /* Jump to subroutine */
+  dis_condjsr,          /* Conditional jump to subroutine */
+  dis_dref,             /* Data reference instruction */
+  dis_dref2             /* Two data references in instruction */
 };
 
 /* This struct is passed into the instruction decoding routine,
@@ -319,8 +319,8 @@ typedef struct disassemble_info {
      The top 16 bits are reserved for public use (and are documented here).
      The bottom 16 bits are for the internal use of the disassembler.  */
   unsigned long flags;
-#define INSN_HAS_RELOC	0x80000000
-#define INSN_ARM_BE32	0x00010000
+#define INSN_HAS_RELOC  0x80000000
+#define INSN_ARM_BE32   0x00010000
   PTR private_data;
 
   /* Function used to get bytes to disassemble.  MEMADDR is the
@@ -330,7 +330,7 @@ typedef struct disassemble_info {
      Returns an errno value or 0 for success.  */
   int (*read_memory_func)
     (bfd_vma memaddr, bfd_byte *myaddr, int length,
-	     struct disassemble_info *info);
+        struct disassemble_info *info);
 
   /* Function which should be called if we get an error that we can't
      recover from.  STATUS is the errno value from read_memory_func and
@@ -384,14 +384,14 @@ typedef struct disassemble_info {
      To determine whether this decoder supports this information, set
      insn_info_valid to 0, decode an instruction, then check it.  */
 
-  char insn_info_valid;		/* Branch info has been set. */
-  char branch_delay_insns;	/* How many sequential insn's will run before
-				   a branch takes effect.  (0 = normal) */
-  char data_size;		/* Size of data reference in insn, in bytes */
-  enum dis_insn_type insn_type;	/* Type of instruction */
-  bfd_vma target;		/* Target address of branch or dref, if known;
-				   zero if unknown.  */
-  bfd_vma target2;		/* Second target address for dref2 */
+  char insn_info_valid;         /* Branch info has been set. */
+  char branch_delay_insns;      /* How many sequential insn's will run before
+                                   a branch takes effect.  (0 = normal) */
+  char data_size;               /* Size of data reference in insn, in bytes */
+  enum dis_insn_type insn_type; /* Type of instruction */
+  bfd_vma target;               /* Target address of branch or dref, if known;
+                                   zero if unknown.  */
+  bfd_vma target2;              /* Second target address for dref2 */
 
   /* Command line options specific to the target disassembler.  */
   char * disassembler_options;
diff --git a/include/elf.h b/include/elf.h
index 8bf1e72720..684fed0156 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -11,25 +11,25 @@ typedef uint32_t Elf32_Word;
 /* 64-bit ELF base types. */
 typedef uint64_t Elf64_Addr;
 typedef uint16_t Elf64_Half;
-typedef int16_t	 Elf64_SHalf;
+typedef int16_t  Elf64_SHalf;
 typedef uint64_t Elf64_Off;
-typedef int32_t	 Elf64_Sword;
+typedef int32_t  Elf64_Sword;
 typedef uint32_t Elf64_Word;
 typedef uint64_t Elf64_Xword;
 typedef int64_t  Elf64_Sxword;
 
 /* These constants are for the segment types stored in the image headers */
-#define PT_NULL    0
-#define PT_LOAD    1
-#define PT_DYNAMIC 2
-#define PT_INTERP  3
-#define PT_NOTE    4
-#define PT_SHLIB   5
-#define PT_PHDR    6
-#define PT_LOOS    0x60000000
-#define PT_HIOS    0x6fffffff
-#define PT_LOPROC  0x70000000
-#define PT_HIPROC  0x7fffffff
+#define PT_NULL           0
+#define PT_LOAD           1
+#define PT_DYNAMIC        2
+#define PT_INTERP         3
+#define PT_NOTE           4
+#define PT_SHLIB          5
+#define PT_PHDR           6
+#define PT_LOOS           0x60000000
+#define PT_HIOS           0x6fffffff
+#define PT_LOPROC         0x70000000
+#define PT_HIPROC         0x7fffffff
 
 #define PT_GNU_STACK      (PT_LOOS + 0x474e551)
 #define PT_GNU_PROPERTY   (PT_LOOS + 0x474e553)
@@ -41,34 +41,34 @@ typedef int64_t  Elf64_Sxword;
 
 /* Flags in the e_flags field of the header */
 /* MIPS architecture level. */
-#define EF_MIPS_ARCH            0xf0000000
+#define EF_MIPS_ARCH          0xf0000000
 
 /* Legal values for MIPS architecture level.  */
-#define EF_MIPS_ARCH_1		0x00000000	/* -mips1 code.  */
-#define EF_MIPS_ARCH_2		0x10000000	/* -mips2 code.  */
-#define EF_MIPS_ARCH_3		0x20000000	/* -mips3 code.  */
-#define EF_MIPS_ARCH_4		0x30000000	/* -mips4 code.  */
-#define EF_MIPS_ARCH_5		0x40000000	/* -mips5 code.  */
-#define EF_MIPS_ARCH_32		0x50000000	/* MIPS32 code.  */
-#define EF_MIPS_ARCH_64		0x60000000	/* MIPS64 code.  */
-#define EF_MIPS_ARCH_32R2       0x70000000      /* MIPS32r2 code.  */
-#define EF_MIPS_ARCH_64R2       0x80000000      /* MIPS64r2 code.  */
-#define EF_MIPS_ARCH_32R6       0x90000000      /* MIPS32r6 code.  */
-#define EF_MIPS_ARCH_64R6       0xa0000000      /* MIPS64r6 code.  */
+#define EF_MIPS_ARCH_1        0x00000000      /* -mips1 code.  */
+#define EF_MIPS_ARCH_2        0x10000000      /* -mips2 code.  */
+#define EF_MIPS_ARCH_3        0x20000000      /* -mips3 code.  */
+#define EF_MIPS_ARCH_4        0x30000000      /* -mips4 code.  */
+#define EF_MIPS_ARCH_5        0x40000000      /* -mips5 code.  */
+#define EF_MIPS_ARCH_32       0x50000000      /* MIPS32 code.  */
+#define EF_MIPS_ARCH_64       0x60000000      /* MIPS64 code.  */
+#define EF_MIPS_ARCH_32R2     0x70000000      /* MIPS32r2 code.  */
+#define EF_MIPS_ARCH_64R2     0x80000000      /* MIPS64r2 code.  */
+#define EF_MIPS_ARCH_32R6     0x90000000      /* MIPS32r6 code.  */
+#define EF_MIPS_ARCH_64R6     0xa0000000      /* MIPS64r6 code.  */
 
 /* The ABI of a file. */
-#define EF_MIPS_ABI_O32		0x00001000	/* O32 ABI.  */
-#define EF_MIPS_ABI_O64		0x00002000	/* O32 extended for 64 bit.  */
-
-#define EF_MIPS_NOREORDER 0x00000001
-#define EF_MIPS_PIC       0x00000002
-#define EF_MIPS_CPIC      0x00000004
-#define EF_MIPS_ABI2		0x00000020
-#define EF_MIPS_OPTIONS_FIRST	0x00000080
-#define EF_MIPS_32BITMODE	0x00000100
-#define EF_MIPS_ABI		0x0000f000
-#define EF_MIPS_FP64      0x00000200
-#define EF_MIPS_NAN2008   0x00000400
+#define EF_MIPS_ABI_O32       0x00001000      /* O32 ABI.  */
+#define EF_MIPS_ABI_O64       0x00002000      /* O32 extended for 64 bit.  */
+
+#define EF_MIPS_NOREORDER     0x00000001
+#define EF_MIPS_PIC           0x00000002
+#define EF_MIPS_CPIC          0x00000004
+#define EF_MIPS_ABI2          0x00000020
+#define EF_MIPS_OPTIONS_FIRST 0x00000080
+#define EF_MIPS_32BITMODE     0x00000100
+#define EF_MIPS_ABI           0x0000f000
+#define EF_MIPS_FP64          0x00000200
+#define EF_MIPS_NAN2008       0x00000400
 
 /* MIPS machine variant */
 #define EF_MIPS_MACH_NONE     0x00000000  /* A standard MIPS implementation  */
@@ -129,162 +129,162 @@ typedef struct mips_elf_abiflags_v0 {
 #define ET_HIPROC 0xffff
 
 /* These constants define the various ELF target machines */
-#define EM_NONE  0
-#define EM_M32   1
-#define EM_SPARC 2
-#define EM_386   3
-#define EM_68K   4
-#define EM_88K   5
-#define EM_486   6   /* Perhaps disused */
-#define EM_860   7
+#define EM_NONE             0
+#define EM_M32              1
+#define EM_SPARC            2
+#define EM_386              3
+#define EM_68K              4
+#define EM_88K              5
+#define EM_486              6   /* Perhaps disused */
+#define EM_860              7
 
-#define EM_MIPS		8	/* MIPS R3000 (officially, big-endian only) */
+#define EM_MIPS             8   /* MIPS R3000 (officially, big-endian only) */
 
-#define EM_MIPS_RS4_BE 10	/* MIPS R4000 big-endian */
+#define EM_MIPS_RS4_BE      10  /* MIPS R4000 big-endian */
 
-#define EM_PARISC      15	/* HPPA */
+#define EM_PARISC           15  /* HPPA */
 
-#define EM_SPARC32PLUS 18	/* Sun's "v8plus" */
+#define EM_SPARC32PLUS      18  /* Sun's "v8plus" */
 
-#define EM_PPC	       20	/* PowerPC */
-#define EM_PPC64       21       /* PowerPC64 */
+#define EM_PPC              20  /* PowerPC */
+#define EM_PPC64            21  /* PowerPC64 */
 
-#define EM_ARM		40		/* ARM */
+#define EM_ARM              40  /* ARM */
 
-#define EM_SH	       42	/* SuperH */
+#define EM_SH               42  /* SuperH */
 
-#define EM_SPARCV9     43	/* SPARC v9 64-bit */
+#define EM_SPARCV9          43  /* SPARC v9 64-bit */
 
-#define EM_TRICORE      44      /* Infineon TriCore */
+#define EM_TRICORE          44  /* Infineon TriCore */
 
-#define EM_IA_64	50	/* HP/Intel IA-64 */
+#define EM_IA_64            50  /* HP/Intel IA-64 */
 
-#define EM_X86_64	62	/* AMD x86-64 */
+#define EM_X86_64           62  /* AMD x86-64 */
 
-#define EM_S390		22	/* IBM S/390 */
+#define EM_S390             22  /* IBM S/390 */
 
-#define EM_CRIS         76      /* Axis Communications 32-bit embedded processor */
+#define EM_CRIS             76  /* Axis Communications 32-bit embedded processor */
 
-#define EM_AVR          83      /* AVR 8-bit microcontroller */
+#define EM_AVR              83  /* AVR 8-bit microcontroller */
 
-#define EM_V850		87	/* NEC v850 */
+#define EM_V850             87  /* NEC v850 */
 
-#define EM_H8_300H      47      /* Hitachi H8/300H */
-#define EM_H8S          48      /* Hitachi H8S     */
-#define EM_LATTICEMICO32 138    /* LatticeMico32 */
+#define EM_H8_300H          47  /* Hitachi H8/300H */
+#define EM_H8S              48  /* Hitachi H8S     */
+#define EM_LATTICEMICO32    138 /* LatticeMico32 */
 
-#define EM_OPENRISC     92        /* OpenCores OpenRISC */
+#define EM_OPENRISC         92  /* OpenCores OpenRISC */
 
-#define EM_HEXAGON      164     /* Qualcomm Hexagon */
+#define EM_HEXAGON          164 /* Qualcomm Hexagon */
 
-#define EM_RX           173     /* Renesas RX family */
+#define EM_RX               173 /* Renesas RX family */
 
-#define EM_RISCV        243     /* RISC-V */
+#define EM_RISCV            243 /* RISC-V */
 
-#define EM_NANOMIPS     249     /* Wave Computing nanoMIPS */
+#define EM_NANOMIPS         249 /* Wave Computing nanoMIPS */
 
-#define EM_LOONGARCH    258     /* LoongArch */
+#define EM_LOONGARCH        258 /* LoongArch */
 
 /*
  * This is an interim value that we will use until the committee comes
  * up with a final number.
  */
-#define EM_ALPHA	0x9026
+#define EM_ALPHA            0x9026
 
 /* Bogus old v850 magic number, used by old tools.  */
-#define EM_CYGNUS_V850	0x9080
+#define EM_CYGNUS_V850      0x9080
 
 /*
  * This is the old interim value for S/390 architecture
  */
-#define EM_S390_OLD     0xA390
+#define EM_S390_OLD         0xA390
 
-#define EM_ALTERA_NIOS2 113     /* Altera Nios II soft-core processor */
+#define EM_ALTERA_NIOS2     113 /* Altera Nios II soft-core processor */
 
-#define EM_MICROBLAZE      189
-#define EM_MICROBLAZE_OLD  0xBAAB
+#define EM_MICROBLAZE       189
+#define EM_MICROBLAZE_OLD   0xBAAB
 
-#define EM_XTENSA   94      /* Tensilica Xtensa */
+#define EM_XTENSA           94  /* Tensilica Xtensa */
 
-#define EM_AARCH64  183
+#define EM_AARCH64          183
 
-#define EF_AVR_MACH     0x7F       /* Mask for AVR e_flags to get core type */
+#define EF_AVR_MACH         0x7F /* Mask for AVR e_flags to get core type */
 
 /* This is the info that is needed to parse the dynamic section of the file */
-#define DT_NULL		0
-#define DT_NEEDED	1
-#define DT_PLTRELSZ	2
-#define DT_PLTGOT	3
-#define DT_HASH		4
-#define DT_STRTAB	5
-#define DT_SYMTAB	6
-#define DT_RELA		7
-#define DT_RELASZ	8
-#define DT_RELAENT	9
-#define DT_STRSZ	10
-#define DT_SYMENT	11
-#define DT_INIT		12
-#define DT_FINI		13
-#define DT_SONAME	14
-#define DT_RPATH 	15
-#define DT_SYMBOLIC	16
-#define DT_REL	        17
-#define DT_RELSZ	18
-#define DT_RELENT	19
-#define DT_PLTREL	20
-#define DT_DEBUG	21
-#define DT_TEXTREL	22
-#define DT_JMPREL	23
-#define DT_BINDNOW	24
-#define DT_INIT_ARRAY	25
-#define DT_FINI_ARRAY	26
-#define DT_INIT_ARRAYSZ	27
-#define DT_FINI_ARRAYSZ	28
-#define DT_RUNPATH	29
-#define DT_FLAGS	30
-#define DT_LOOS		0x6000000d
-#define DT_HIOS		0x6ffff000
-#define DT_LOPROC	0x70000000
-#define DT_HIPROC	0x7fffffff
+#define DT_NULL         0
+#define DT_NEEDED       1
+#define DT_PLTRELSZ     2
+#define DT_PLTGOT       3
+#define DT_HASH         4
+#define DT_STRTAB       5
+#define DT_SYMTAB       6
+#define DT_RELA         7
+#define DT_RELASZ       8
+#define DT_RELAENT      9
+#define DT_STRSZ        10
+#define DT_SYMENT       11
+#define DT_INIT         12
+#define DT_FINI         13
+#define DT_SONAME       14
+#define DT_RPATH        15
+#define DT_SYMBOLIC     16
+#define DT_REL          17
+#define DT_RELSZ        18
+#define DT_RELENT       19
+#define DT_PLTREL       20
+#define DT_DEBUG        21
+#define DT_TEXTREL      22
+#define DT_JMPREL       23
+#define DT_BINDNOW      24
+#define DT_INIT_ARRAY   25
+#define DT_FINI_ARRAY   26
+#define DT_INIT_ARRAYSZ 27
+#define DT_FINI_ARRAYSZ 28
+#define DT_RUNPATH      29
+#define DT_FLAGS        30
+#define DT_LOOS         0x6000000d
+#define DT_HIOS         0x6ffff000
+#define DT_LOPROC       0x70000000
+#define DT_HIPROC       0x7fffffff
 
 /* DT_ entries which fall between DT_VALRNGLO and DT_VALRNDHI use
    the d_val field of the Elf*_Dyn structure.  I.e. they contain scalars.  */
-#define DT_VALRNGLO	0x6ffffd00
-#define DT_VALRNGHI	0x6ffffdff
+#define DT_VALRNGLO     0x6ffffd00
+#define DT_VALRNGHI     0x6ffffdff
 
 /* DT_ entries which fall between DT_ADDRRNGLO and DT_ADDRRNGHI use
    the d_ptr field of the Elf*_Dyn structure.  I.e. they contain pointers.  */
-#define DT_ADDRRNGLO	0x6ffffe00
-#define DT_ADDRRNGHI	0x6ffffeff
-
-#define	DT_VERSYM	0x6ffffff0
-#define DT_RELACOUNT	0x6ffffff9
-#define DT_RELCOUNT	0x6ffffffa
-#define DT_FLAGS_1	0x6ffffffb
-#define DT_VERDEF	0x6ffffffc
-#define DT_VERDEFNUM	0x6ffffffd
-#define DT_VERNEED	0x6ffffffe
-#define DT_VERNEEDNUM	0x6fffffff
-
-#define DT_MIPS_RLD_VERSION	0x70000001
-#define DT_MIPS_TIME_STAMP	0x70000002
-#define DT_MIPS_ICHECKSUM	0x70000003
-#define DT_MIPS_IVERSION	0x70000004
-#define DT_MIPS_FLAGS		0x70000005
-  #define RHF_NONE		  0
-  #define RHF_HARDWAY		  1
-  #define RHF_NOTPOT		  2
-#define DT_MIPS_BASE_ADDRESS	0x70000006
-#define DT_MIPS_CONFLICT	0x70000008
-#define DT_MIPS_LIBLIST		0x70000009
-#define DT_MIPS_LOCAL_GOTNO	0x7000000a
-#define DT_MIPS_CONFLICTNO	0x7000000b
-#define DT_MIPS_LIBLISTNO	0x70000010
-#define DT_MIPS_SYMTABNO	0x70000011
-#define DT_MIPS_UNREFEXTNO	0x70000012
-#define DT_MIPS_GOTSYM		0x70000013
-#define DT_MIPS_HIPAGENO	0x70000014
-#define DT_MIPS_RLD_MAP		0x70000016
+#define DT_ADDRRNGLO    0x6ffffe00
+#define DT_ADDRRNGHI    0x6ffffeff
+
+#define DT_VERSYM       0x6ffffff0
+#define DT_RELACOUNT    0x6ffffff9
+#define DT_RELCOUNT     0x6ffffffa
+#define DT_FLAGS_1      0x6ffffffb
+#define DT_VERDEF       0x6ffffffc
+#define DT_VERDEFNUM    0x6ffffffd
+#define DT_VERNEED      0x6ffffffe
+#define DT_VERNEEDNUM   0x6fffffff
+
+#define DT_MIPS_RLD_VERSION     0x70000001
+#define DT_MIPS_TIME_STAMP      0x70000002
+#define DT_MIPS_ICHECKSUM       0x70000003
+#define DT_MIPS_IVERSION        0x70000004
+#define DT_MIPS_FLAGS           0x70000005
+  #define RHF_NONE              0
+  #define RHF_HARDWAY           1
+  #define RHF_NOTPOT            2
+#define DT_MIPS_BASE_ADDRESS    0x70000006
+#define DT_MIPS_CONFLICT        0x70000008
+#define DT_MIPS_LIBLIST         0x70000009
+#define DT_MIPS_LOCAL_GOTNO     0x7000000a
+#define DT_MIPS_CONFLICTNO      0x7000000b
+#define DT_MIPS_LIBLISTNO       0x70000010
+#define DT_MIPS_SYMTABNO        0x70000011
+#define DT_MIPS_UNREFEXTNO      0x70000012
+#define DT_MIPS_GOTSYM          0x70000013
+#define DT_MIPS_HIPAGENO        0x70000014
+#define DT_MIPS_RLD_MAP         0x70000016
 
 /* This info is needed when parsing the symbol table */
 #define STB_LOCAL  0
@@ -297,61 +297,61 @@ typedef struct mips_elf_abiflags_v0 {
 #define STT_SECTION 3
 #define STT_FILE    4
 
-#define ELF_ST_BIND(x)		((x) >> 4)
-#define ELF_ST_TYPE(x)		(((unsigned int) x) & 0xf)
+#define ELF_ST_BIND(x)          ((x) >> 4)
+#define ELF_ST_TYPE(x)          (((unsigned int) x) & 0xf)
 #define ELF_ST_INFO(bind, type) (((bind) << 4) | ((type) & 0xf))
-#define ELF32_ST_BIND(x)	ELF_ST_BIND(x)
-#define ELF32_ST_TYPE(x)	ELF_ST_TYPE(x)
-#define ELF64_ST_BIND(x)	ELF_ST_BIND(x)
-#define ELF64_ST_TYPE(x)	ELF_ST_TYPE(x)
+#define ELF32_ST_BIND(x)        ELF_ST_BIND(x)
+#define ELF32_ST_TYPE(x)        ELF_ST_TYPE(x)
+#define ELF64_ST_BIND(x)        ELF_ST_BIND(x)
+#define ELF64_ST_TYPE(x)        ELF_ST_TYPE(x)
 
 /* Symbolic values for the entries in the auxiliary table
    put on the initial stack */
-#define AT_NULL   0	/* end of vector */
-#define AT_IGNORE 1	/* entry should be ignored */
-#define AT_EXECFD 2	/* file descriptor of program */
-#define AT_PHDR   3	/* program headers for program */
-#define AT_PHENT  4	/* size of program header entry */
-#define AT_PHNUM  5	/* number of program headers */
-#define AT_PAGESZ 6	/* system page size */
-#define AT_BASE   7	/* base address of interpreter */
-#define AT_FLAGS  8	/* flags */
-#define AT_ENTRY  9	/* entry point of program */
-#define AT_NOTELF 10	/* program is not ELF */
-#define AT_UID    11	/* real uid */
-#define AT_EUID   12	/* effective uid */
-#define AT_GID    13	/* real gid */
-#define AT_EGID   14	/* effective gid */
-#define AT_PLATFORM 15  /* string identifying CPU for optimizations */
-#define AT_HWCAP  16    /* arch dependent hints at CPU capabilities */
-#define AT_CLKTCK 17	/* frequency at which times() increments */
-#define AT_FPUCW  18	/* info about fpu initialization by kernel */
-#define AT_DCACHEBSIZE	19	/* data cache block size */
-#define AT_ICACHEBSIZE	20	/* instruction cache block size */
-#define AT_UCACHEBSIZE	21	/* unified cache block size */
-#define AT_IGNOREPPC	22	/* ppc only; entry should be ignored */
-#define AT_SECURE	23	/* boolean, was exec suid-like? */
-#define AT_BASE_PLATFORM 24	/* string identifying real platforms */
-#define AT_RANDOM	25	/* address of 16 random bytes */
-#define AT_HWCAP2       26      /* extension of AT_HWCAP */
-#define AT_EXECFN	31	/* filename of the executable */
-#define AT_SYSINFO	32	/* address of kernel entry point */
-#define AT_SYSINFO_EHDR	33	/* address of kernel vdso */
-#define AT_L1I_CACHESHAPE 34	/* shapes of the caches: */
-#define AT_L1D_CACHESHAPE 35	/*   bits 0-3: cache associativity.  */
-#define AT_L2_CACHESHAPE  36	/*   bits 4-7: log2 of line size.  */
-#define AT_L3_CACHESHAPE  37	/*   val&~255: cache size.  */
+#define AT_NULL             0   /* end of vector */
+#define AT_IGNORE           1   /* entry should be ignored */
+#define AT_EXECFD           2   /* file descriptor of program */
+#define AT_PHDR             3   /* program headers for program */
+#define AT_PHENT            4   /* size of program header entry */
+#define AT_PHNUM            5   /* number of program headers */
+#define AT_PAGESZ           6   /* system page size */
+#define AT_BASE             7   /* base address of interpreter */
+#define AT_FLAGS            8   /* flags */
+#define AT_ENTRY            9   /* entry point of program */
+#define AT_NOTELF           10  /* program is not ELF */
+#define AT_UID              11  /* real uid */
+#define AT_EUID             12  /* effective uid */
+#define AT_GID              13  /* real gid */
+#define AT_EGID             14  /* effective gid */
+#define AT_PLATFORM         15  /* string identifying CPU for optimizations */
+#define AT_HWCAP            16  /* arch dependent hints at CPU capabilities */
+#define AT_CLKTCK           17  /* frequency at which times() increments */
+#define AT_FPUCW            18  /* info about fpu initialization by kernel */
+#define AT_DCACHEBSIZE      19  /* data cache block size */
+#define AT_ICACHEBSIZE      20  /* instruction cache block size */
+#define AT_UCACHEBSIZE      21  /* unified cache block size */
+#define AT_IGNOREPPC        22  /* ppc only; entry should be ignored */
+#define AT_SECURE           23  /* boolean, was exec suid-like? */
+#define AT_BASE_PLATFORM    24  /* string identifying real platforms */
+#define AT_RANDOM           25  /* address of 16 random bytes */
+#define AT_HWCAP2           26  /* extension of AT_HWCAP */
+#define AT_EXECFN           31  /* filename of the executable */
+#define AT_SYSINFO          32  /* address of kernel entry point */
+#define AT_SYSINFO_EHDR     33  /* address of kernel vdso */
+#define AT_L1I_CACHESHAPE   34  /* shapes of the caches: */
+#define AT_L1D_CACHESHAPE   35  /*   bits 0-3: cache associativity.  */
+#define AT_L2_CACHESHAPE    36  /*   bits 4-7: log2 of line size.  */
+#define AT_L3_CACHESHAPE    37  /*   val&~255: cache size.  */
 
 typedef struct dynamic{
   Elf32_Sword d_tag;
   union{
-    Elf32_Sword	d_val;
-    Elf32_Addr	d_ptr;
+    Elf32_Sword d_val;
+    Elf32_Addr d_ptr;
   } d_un;
 } Elf32_Dyn;
 
 typedef struct {
-  Elf64_Sxword d_tag;		/* entry tag value */
+  Elf64_Sxword d_tag;   /* entry tag value */
   union {
     Elf64_Xword d_val;
     Elf64_Addr d_ptr;
@@ -362,72 +362,72 @@ typedef struct {
 #define ELF32_R_SYM(x) ((x) >> 8)
 #define ELF32_R_TYPE(x) ((x) & 0xff)
 
-#define ELF64_R_SYM(i)			((i) >> 32)
-#define ELF64_R_TYPE(i)			((i) & 0xffffffff)
+#define ELF64_R_SYM(i)                  ((i) >> 32)
+#define ELF64_R_TYPE(i)                 ((i) & 0xffffffff)
 #define ELF64_R_TYPE_DATA(i)            (((ELF64_R_TYPE(i) >> 8) ^ 0x00800000) - 0x00800000)
 
-#define R_386_NONE	0
-#define R_386_32	1
-#define R_386_PC32	2
-#define R_386_GOT32	3
-#define R_386_PLT32	4
-#define R_386_COPY	5
-#define R_386_GLOB_DAT	6
-#define R_386_JMP_SLOT	7
-#define R_386_RELATIVE	8
-#define R_386_GOTOFF	9
-#define R_386_GOTPC	10
-#define R_386_NUM	11
+#define R_386_NONE      0
+#define R_386_32        1
+#define R_386_PC32      2
+#define R_386_GOT32     3
+#define R_386_PLT32     4
+#define R_386_COPY      5
+#define R_386_GLOB_DAT  6
+#define R_386_JMP_SLOT  7
+#define R_386_RELATIVE  8
+#define R_386_GOTOFF    9
+#define R_386_GOTPC     10
+#define R_386_NUM       11
 /* Not a dynamic reloc, so not included in R_386_NUM.  Used in TCG.  */
-#define R_386_PC8	23
-
-#define R_MIPS_NONE		0
-#define R_MIPS_16		1
-#define R_MIPS_32		2
-#define R_MIPS_REL32		3
-#define R_MIPS_26		4
-#define R_MIPS_HI16		5
-#define R_MIPS_LO16		6
-#define R_MIPS_GPREL16		7
-#define R_MIPS_LITERAL		8
-#define R_MIPS_GOT16		9
-#define R_MIPS_PC16		10
-#define R_MIPS_CALL16		11
-#define R_MIPS_GPREL32		12
+#define R_386_PC8       23
+
+#define R_MIPS_NONE     0
+#define R_MIPS_16       1
+#define R_MIPS_32       2
+#define R_MIPS_REL32    3
+#define R_MIPS_26       4
+#define R_MIPS_HI16     5
+#define R_MIPS_LO16     6
+#define R_MIPS_GPREL16  7
+#define R_MIPS_LITERAL  8
+#define R_MIPS_GOT16    9
+#define R_MIPS_PC16     10
+#define R_MIPS_CALL16   11
+#define R_MIPS_GPREL32  12
 /* The remaining relocs are defined on Irix, although they are not
    in the MIPS ELF ABI.  */
-#define R_MIPS_UNUSED1		13
-#define R_MIPS_UNUSED2		14
-#define R_MIPS_UNUSED3		15
-#define R_MIPS_SHIFT5		16
-#define R_MIPS_SHIFT6		17
-#define R_MIPS_64		18
-#define R_MIPS_GOT_DISP		19
-#define R_MIPS_GOT_PAGE		20
-#define R_MIPS_GOT_OFST		21
+#define R_MIPS_UNUSED1  13
+#define R_MIPS_UNUSED2  14
+#define R_MIPS_UNUSED3  15
+#define R_MIPS_SHIFT5   16
+#define R_MIPS_SHIFT6   17
+#define R_MIPS_64       18
+#define R_MIPS_GOT_DISP 19
+#define R_MIPS_GOT_PAGE 20
+#define R_MIPS_GOT_OFST 21
 /*
  * The following two relocation types are specified in the MIPS ABI
  * conformance guide version 1.2 but not yet in the psABI.
  */
-#define R_MIPS_GOTHI16		22
-#define R_MIPS_GOTLO16		23
-#define R_MIPS_SUB		24
-#define R_MIPS_INSERT_A		25
-#define R_MIPS_INSERT_B		26
-#define R_MIPS_DELETE		27
-#define R_MIPS_HIGHER		28
-#define R_MIPS_HIGHEST		29
+#define R_MIPS_GOTHI16  22
+#define R_MIPS_GOTLO16  23
+#define R_MIPS_SUB      24
+#define R_MIPS_INSERT_A 25
+#define R_MIPS_INSERT_B 26
+#define R_MIPS_DELETE   27
+#define R_MIPS_HIGHER   28
+#define R_MIPS_HIGHEST  29
 /*
  * The following two relocation types are specified in the MIPS ABI
  * conformance guide version 1.2 but not yet in the psABI.
  */
-#define R_MIPS_CALLHI16		30
-#define R_MIPS_CALLLO16		31
+#define R_MIPS_CALLHI16 30
+#define R_MIPS_CALLLO16 31
 /*
  * This range is reserved for vendor specific relocations.
  */
-#define R_MIPS_LOVENDOR		100
-#define R_MIPS_HIVENDOR		127
+#define R_MIPS_LOVENDOR 100
+#define R_MIPS_HIVENDOR 127
 
 
 /* SUN SPARC specific definitions.  */
@@ -448,48 +448,48 @@ typedef struct {
 /*
  * Sparc ELF relocation types
  */
-#define	R_SPARC_NONE		0
-#define	R_SPARC_8		1
-#define	R_SPARC_16		2
-#define	R_SPARC_32		3
-#define	R_SPARC_DISP8		4
-#define	R_SPARC_DISP16		5
-#define	R_SPARC_DISP32		6
-#define	R_SPARC_WDISP30		7
-#define	R_SPARC_WDISP22		8
-#define	R_SPARC_HI22		9
-#define	R_SPARC_22		10
-#define	R_SPARC_13		11
-#define	R_SPARC_LO10		12
-#define	R_SPARC_GOT10		13
-#define	R_SPARC_GOT13		14
-#define	R_SPARC_GOT22		15
-#define	R_SPARC_PC10		16
-#define	R_SPARC_PC22		17
-#define	R_SPARC_WPLT30		18
-#define	R_SPARC_COPY		19
-#define	R_SPARC_GLOB_DAT	20
-#define	R_SPARC_JMP_SLOT	21
-#define	R_SPARC_RELATIVE	22
-#define	R_SPARC_UA32		23
-#define R_SPARC_PLT32		24
-#define R_SPARC_HIPLT22		25
-#define R_SPARC_LOPLT10		26
-#define R_SPARC_PCPLT32		27
-#define R_SPARC_PCPLT22		28
-#define R_SPARC_PCPLT10		29
-#define R_SPARC_10		30
-#define R_SPARC_11		31
-#define R_SPARC_64		32
-#define R_SPARC_OLO10           33
-#define R_SPARC_HH22            34
-#define R_SPARC_HM10            35
-#define R_SPARC_LM22            36
-#define R_SPARC_WDISP16		40
-#define R_SPARC_WDISP19		41
-#define R_SPARC_7		43
-#define R_SPARC_5		44
-#define R_SPARC_6		45
+#define R_SPARC_NONE        0
+#define R_SPARC_8           1
+#define R_SPARC_16          2
+#define R_SPARC_32          3
+#define R_SPARC_DISP8       4
+#define R_SPARC_DISP16      5
+#define R_SPARC_DISP32      6
+#define R_SPARC_WDISP30     7
+#define R_SPARC_WDISP22     8
+#define R_SPARC_HI22        9
+#define R_SPARC_22          10
+#define R_SPARC_13          11
+#define R_SPARC_LO10        12
+#define R_SPARC_GOT10       13
+#define R_SPARC_GOT13       14
+#define R_SPARC_GOT22       15
+#define R_SPARC_PC10        16
+#define R_SPARC_PC22        17
+#define R_SPARC_WPLT30      18
+#define R_SPARC_COPY        19
+#define R_SPARC_GLOB_DAT    20
+#define R_SPARC_JMP_SLOT    21
+#define R_SPARC_RELATIVE    22
+#define R_SPARC_UA32        23
+#define R_SPARC_PLT32       24
+#define R_SPARC_HIPLT22     25
+#define R_SPARC_LOPLT10     26
+#define R_SPARC_PCPLT32     27
+#define R_SPARC_PCPLT22     28
+#define R_SPARC_PCPLT10     29
+#define R_SPARC_10          30
+#define R_SPARC_11          31
+#define R_SPARC_64          32
+#define R_SPARC_OLO10       33
+#define R_SPARC_HH22        34
+#define R_SPARC_HM10        35
+#define R_SPARC_LM22        36
+#define R_SPARC_WDISP16     40
+#define R_SPARC_WDISP19     41
+#define R_SPARC_7           43
+#define R_SPARC_5           44
+#define R_SPARC_6           45
 
 /* Bits present in AT_HWCAP for ARM.  */
 
@@ -647,29 +647,29 @@ typedef struct {
 /*
  * 68k ELF relocation types
  */
-#define R_68K_NONE	0
-#define R_68K_32	1
-#define R_68K_16	2
-#define R_68K_8		3
-#define R_68K_PC32	4
-#define R_68K_PC16	5
-#define R_68K_PC8	6
-#define R_68K_GOT32	7
-#define R_68K_GOT16	8
-#define R_68K_GOT8	9
-#define R_68K_GOT32O	10
-#define R_68K_GOT16O	11
-#define R_68K_GOT8O	12
-#define R_68K_PLT32	13
-#define R_68K_PLT16	14
-#define R_68K_PLT8	15
-#define R_68K_PLT32O	16
-#define R_68K_PLT16O	17
-#define R_68K_PLT8O	18
-#define R_68K_COPY	19
-#define R_68K_GLOB_DAT	20
-#define R_68K_JMP_SLOT	21
-#define R_68K_RELATIVE	22
+#define R_68K_NONE      0
+#define R_68K_32        1
+#define R_68K_16        2
+#define R_68K_8         3
+#define R_68K_PC32      4
+#define R_68K_PC16      5
+#define R_68K_PC8       6
+#define R_68K_GOT32     7
+#define R_68K_GOT16     8
+#define R_68K_GOT8      9
+#define R_68K_GOT32O    10
+#define R_68K_GOT16O    11
+#define R_68K_GOT8O     12
+#define R_68K_PLT32     13
+#define R_68K_PLT16     14
+#define R_68K_PLT8      15
+#define R_68K_PLT32O    16
+#define R_68K_PLT16O    17
+#define R_68K_PLT8O     18
+#define R_68K_COPY      19
+#define R_68K_GLOB_DAT  20
+#define R_68K_JMP_SLOT  21
+#define R_68K_RELATIVE  22
 
 /*
  * Alpha ELF relocation types
@@ -693,7 +693,7 @@ typedef struct {
 #define R_ALPHA_GLOB_DAT        25      /* Create GOT entry */
 #define R_ALPHA_JMP_SLOT        26      /* Create PLT entry */
 #define R_ALPHA_RELATIVE        27      /* Adjust by program base */
-#define R_ALPHA_BRSGP		28
+#define R_ALPHA_BRSGP           28
 #define R_ALPHA_TLSGD           29
 #define R_ALPHA_TLS_LDM         30
 #define R_ALPHA_DTPMOD64        31
@@ -708,78 +708,78 @@ typedef struct {
 #define R_ALPHA_TPRELLO         40
 #define R_ALPHA_TPREL16         41
 
-#define SHF_ALPHA_GPREL		0x10000000
+#define SHF_ALPHA_GPREL         0x10000000
 
 
 /* PowerPC specific definitions.  */
 
 /* Processor specific flags for the ELF header e_flags field.  */
-#define EF_PPC64_ABI           0x3
+#define EF_PPC64_ABI            0x3
 
 /* PowerPC relocations defined by the ABIs */
-#define R_PPC_NONE		0
-#define R_PPC_ADDR32		1	/* 32bit absolute address */
-#define R_PPC_ADDR24		2	/* 26bit address, 2 bits ignored.  */
-#define R_PPC_ADDR16		3	/* 16bit absolute address */
-#define R_PPC_ADDR16_LO		4	/* lower 16bit of absolute address */
-#define R_PPC_ADDR16_HI		5	/* high 16bit of absolute address */
-#define R_PPC_ADDR16_HA		6	/* adjusted high 16bit */
-#define R_PPC_ADDR14		7	/* 16bit address, 2 bits ignored */
-#define R_PPC_ADDR14_BRTAKEN	8
-#define R_PPC_ADDR14_BRNTAKEN	9
-#define R_PPC_REL24		10	/* PC relative 26 bit */
-#define R_PPC_REL14		11	/* PC relative 16 bit */
-#define R_PPC_REL14_BRTAKEN	12
-#define R_PPC_REL14_BRNTAKEN	13
-#define R_PPC_GOT16		14
-#define R_PPC_GOT16_LO		15
-#define R_PPC_GOT16_HI		16
-#define R_PPC_GOT16_HA		17
-#define R_PPC_PLTREL24		18
-#define R_PPC_COPY		19
-#define R_PPC_GLOB_DAT		20
-#define R_PPC_JMP_SLOT		21
-#define R_PPC_RELATIVE		22
-#define R_PPC_LOCAL24PC		23
-#define R_PPC_UADDR32		24
-#define R_PPC_UADDR16		25
-#define R_PPC_REL32		26
-#define R_PPC_PLT32		27
-#define R_PPC_PLTREL32		28
-#define R_PPC_PLT16_LO		29
-#define R_PPC_PLT16_HI		30
-#define R_PPC_PLT16_HA		31
-#define R_PPC_SDAREL16		32
-#define R_PPC_SECTOFF		33
-#define R_PPC_SECTOFF_LO	34
-#define R_PPC_SECTOFF_HI	35
-#define R_PPC_SECTOFF_HA	36
+#define R_PPC_NONE              0
+#define R_PPC_ADDR32            1   /* 32bit absolute address */
+#define R_PPC_ADDR24            2   /* 26bit address, 2 bits ignored.  */
+#define R_PPC_ADDR16            3   /* 16bit absolute address */
+#define R_PPC_ADDR16_LO         4   /* lower 16bit of absolute address */
+#define R_PPC_ADDR16_HI         5   /* high 16bit of absolute address */
+#define R_PPC_ADDR16_HA         6   /* adjusted high 16bit */
+#define R_PPC_ADDR14            7   /* 16bit address, 2 bits ignored */
+#define R_PPC_ADDR14_BRTAKEN    8
+#define R_PPC_ADDR14_BRNTAKEN   9
+#define R_PPC_REL24             10  /* PC relative 26 bit */
+#define R_PPC_REL14             11  /* PC relative 16 bit */
+#define R_PPC_REL14_BRTAKEN     12
+#define R_PPC_REL14_BRNTAKEN    13
+#define R_PPC_GOT16             14
+#define R_PPC_GOT16_LO          15
+#define R_PPC_GOT16_HI          16
+#define R_PPC_GOT16_HA          17
+#define R_PPC_PLTREL24          18
+#define R_PPC_COPY              19
+#define R_PPC_GLOB_DAT          20
+#define R_PPC_JMP_SLOT          21
+#define R_PPC_RELATIVE          22
+#define R_PPC_LOCAL24PC         23
+#define R_PPC_UADDR32           24
+#define R_PPC_UADDR16           25
+#define R_PPC_REL32             26
+#define R_PPC_PLT32             27
+#define R_PPC_PLTREL32          28
+#define R_PPC_PLT16_LO          29
+#define R_PPC_PLT16_HI          30
+#define R_PPC_PLT16_HA          31
+#define R_PPC_SDAREL16          32
+#define R_PPC_SECTOFF           33
+#define R_PPC_SECTOFF_LO        34
+#define R_PPC_SECTOFF_HI        35
+#define R_PPC_SECTOFF_HA        36
 /* Keep this the last entry.  */
 #ifndef R_PPC_NUM
-#define R_PPC_NUM		37
+#define R_PPC_NUM               37
 #endif
 
 /* ARM specific declarations */
 
 /* Processor specific flags for the ELF header e_flags field.  */
-#define EF_ARM_RELEXEC     0x01
-#define EF_ARM_HASENTRY    0x02
-#define EF_ARM_INTERWORK   0x04
-#define EF_ARM_APCS_26     0x08
-#define EF_ARM_APCS_FLOAT  0x10
-#define EF_ARM_PIC         0x20
-#define EF_ALIGN8          0x40		/* 8-bit structure alignment is in use */
-#define EF_NEW_ABI         0x80
-#define EF_OLD_ABI         0x100
-#define EF_ARM_SOFT_FLOAT  0x200
-#define EF_ARM_VFP_FLOAT   0x400
+#define EF_ARM_RELEXEC        0x01
+#define EF_ARM_HASENTRY       0x02
+#define EF_ARM_INTERWORK      0x04
+#define EF_ARM_APCS_26        0x08
+#define EF_ARM_APCS_FLOAT     0x10
+#define EF_ARM_PIC            0x20
+#define EF_ALIGN8             0x40     /* 8-bit structure alignment is in use */
+#define EF_NEW_ABI            0x80
+#define EF_OLD_ABI            0x100
+#define EF_ARM_SOFT_FLOAT     0x200
+#define EF_ARM_VFP_FLOAT      0x400
 #define EF_ARM_MAVERICK_FLOAT 0x800
 
 /* Other constants defined in the ARM ELF spec. version B-01.  */
-#define EF_ARM_SYMSARESORTED 0x04       /* NB conflicts with EF_INTERWORK */
-#define EF_ARM_DYNSYMSUSESEGIDX 0x08    /* NB conflicts with EF_APCS26 */
-#define EF_ARM_MAPSYMSFIRST 0x10        /* NB conflicts with EF_APCS_FLOAT */
-#define EF_ARM_EABIMASK      0xFF000000
+#define EF_ARM_SYMSARESORTED    0x04   /* NB conflicts with EF_INTERWORK */
+#define EF_ARM_DYNSYMSUSESEGIDX 0x08   /* NB conflicts with EF_APCS26 */
+#define EF_ARM_MAPSYMSFIRST     0x10   /* NB conflicts with EF_APCS_FLOAT */
+#define EF_ARM_EABIMASK         0xFF000000
 
 /* Constants defined in AAELF.  */
 #define EF_ARM_BE8          0x00800000
@@ -806,46 +806,46 @@ typedef struct {
                                            addressed by the static base */
 
 /* ARM relocs.  */
-#define R_ARM_NONE		0	/* No reloc */
-#define R_ARM_PC24		1	/* PC relative 26 bit branch */
-#define R_ARM_ABS32		2	/* Direct 32 bit  */
-#define R_ARM_REL32		3	/* PC relative 32 bit */
-#define R_ARM_PC13		4
-#define R_ARM_ABS16		5	/* Direct 16 bit */
-#define R_ARM_ABS12		6	/* Direct 12 bit */
-#define R_ARM_THM_ABS5		7
-#define R_ARM_ABS8		8	/* Direct 8 bit */
-#define R_ARM_SBREL32		9
-#define R_ARM_THM_PC22		10
-#define R_ARM_THM_PC8		11
-#define R_ARM_AMP_VCALL9	12
-#define R_ARM_SWI24		13
-#define R_ARM_THM_SWI8		14
-#define R_ARM_XPC25		15
-#define R_ARM_THM_XPC22		16
-#define R_ARM_COPY		20	/* Copy symbol at runtime */
-#define R_ARM_GLOB_DAT		21	/* Create GOT entry */
-#define R_ARM_JUMP_SLOT		22	/* Create PLT entry */
-#define R_ARM_RELATIVE		23	/* Adjust by program base */
-#define R_ARM_GOTOFF		24	/* 32 bit offset to GOT */
-#define R_ARM_GOTPC		25	/* 32 bit PC relative offset to GOT */
-#define R_ARM_GOT32		26	/* 32 bit GOT entry */
-#define R_ARM_PLT32		27	/* 32 bit PLT address */
+#define R_ARM_NONE              0   /* No reloc */
+#define R_ARM_PC24              1   /* PC relative 26 bit branch */
+#define R_ARM_ABS32             2   /* Direct 32 bit  */
+#define R_ARM_REL32             3   /* PC relative 32 bit */
+#define R_ARM_PC13              4
+#define R_ARM_ABS16             5   /* Direct 16 bit */
+#define R_ARM_ABS12             6   /* Direct 12 bit */
+#define R_ARM_THM_ABS5          7
+#define R_ARM_ABS8              8   /* Direct 8 bit */
+#define R_ARM_SBREL32           9
+#define R_ARM_THM_PC22          10
+#define R_ARM_THM_PC8           11
+#define R_ARM_AMP_VCALL9        12
+#define R_ARM_SWI24             13
+#define R_ARM_THM_SWI8          14
+#define R_ARM_XPC25             15
+#define R_ARM_THM_XPC22         16
+#define R_ARM_COPY              20  /* Copy symbol at runtime */
+#define R_ARM_GLOB_DAT          21  /* Create GOT entry */
+#define R_ARM_JUMP_SLOT         22  /* Create PLT entry */
+#define R_ARM_RELATIVE          23  /* Adjust by program base */
+#define R_ARM_GOTOFF            24  /* 32 bit offset to GOT */
+#define R_ARM_GOTPC             25  /* 32 bit PC relative offset to GOT */
+#define R_ARM_GOT32             26  /* 32 bit GOT entry */
+#define R_ARM_PLT32             27  /* 32 bit PLT address */
 #define R_ARM_CALL              28
 #define R_ARM_JUMP24            29
-#define R_ARM_GNU_VTENTRY	100
-#define R_ARM_GNU_VTINHERIT	101
-#define R_ARM_THM_PC11		102	/* thumb unconditional branch */
-#define R_ARM_THM_PC9		103	/* thumb conditional branch */
-#define R_ARM_RXPC25		249
-#define R_ARM_RSBREL32		250
-#define R_ARM_THM_RPC22		251
-#define R_ARM_RREL32		252
-#define R_ARM_RABS22		253
-#define R_ARM_RPC24		254
-#define R_ARM_RBASE		255
+#define R_ARM_GNU_VTENTRY       100
+#define R_ARM_GNU_VTINHERIT     101
+#define R_ARM_THM_PC11          102 /* thumb unconditional branch */
+#define R_ARM_THM_PC9           103 /* thumb conditional branch */
+#define R_ARM_RXPC25            249
+#define R_ARM_RSBREL32          250
+#define R_ARM_THM_RPC22         251
+#define R_ARM_RREL32            252
+#define R_ARM_RABS22            253
+#define R_ARM_RPC24             254
+#define R_ARM_RBASE             255
 /* Keep this the last entry.  */
-#define R_ARM_NUM		256
+#define R_ARM_NUM               256
 
 /* ARM Aarch64 relocation types */
 #define R_AARCH64_NONE                256 /* also accepts R_ARM_NONE (0) */
@@ -975,385 +975,385 @@ typedef struct {
 #define R_AARCH64_TLS_TPREL32  1033
 
 /* s390 relocations defined by the ABIs */
-#define R_390_NONE		0	/* No reloc.  */
-#define R_390_8			1	/* Direct 8 bit.  */
-#define R_390_12		2	/* Direct 12 bit.  */
-#define R_390_16		3	/* Direct 16 bit.  */
-#define R_390_32		4	/* Direct 32 bit.  */
-#define R_390_PC32		5	/* PC relative 32 bit.	*/
-#define R_390_GOT12		6	/* 12 bit GOT offset.  */
-#define R_390_GOT32		7	/* 32 bit GOT offset.  */
-#define R_390_PLT32		8	/* 32 bit PC relative PLT address.  */
-#define R_390_COPY		9	/* Copy symbol at runtime.  */
-#define R_390_GLOB_DAT		10	/* Create GOT entry.  */
-#define R_390_JMP_SLOT		11	/* Create PLT entry.  */
-#define R_390_RELATIVE		12	/* Adjust by program base.  */
-#define R_390_GOTOFF32		13	/* 32 bit offset to GOT.	 */
-#define R_390_GOTPC		14	/* 32 bit PC rel. offset to GOT.  */
-#define R_390_GOT16		15	/* 16 bit GOT offset.  */
-#define R_390_PC16		16	/* PC relative 16 bit.	*/
-#define R_390_PC16DBL		17	/* PC relative 16 bit shifted by 1.  */
-#define R_390_PLT16DBL		18	/* 16 bit PC rel. PLT shifted by 1.  */
-#define R_390_PC32DBL		19	/* PC relative 32 bit shifted by 1.  */
-#define R_390_PLT32DBL		20	/* 32 bit PC rel. PLT shifted by 1.  */
-#define R_390_GOTPCDBL		21	/* 32 bit PC rel. GOT shifted by 1.  */
-#define R_390_64		22	/* Direct 64 bit.  */
-#define R_390_PC64		23	/* PC relative 64 bit.	*/
-#define R_390_GOT64		24	/* 64 bit GOT offset.  */
-#define R_390_PLT64		25	/* 64 bit PC relative PLT address.  */
-#define R_390_GOTENT		26	/* 32 bit PC rel. to GOT entry >> 1. */
-#define R_390_GOTOFF16		27	/* 16 bit offset to GOT. */
-#define R_390_GOTOFF64		28	/* 64 bit offset to GOT. */
-#define R_390_GOTPLT12		29	/* 12 bit offset to jump slot.	*/
-#define R_390_GOTPLT16		30	/* 16 bit offset to jump slot.	*/
-#define R_390_GOTPLT32		31	/* 32 bit offset to jump slot.	*/
-#define R_390_GOTPLT64		32	/* 64 bit offset to jump slot.	*/
-#define R_390_GOTPLTENT		33	/* 32 bit rel. offset to jump slot.  */
-#define R_390_PLTOFF16		34	/* 16 bit offset from GOT to PLT. */
-#define R_390_PLTOFF32		35	/* 32 bit offset from GOT to PLT. */
-#define R_390_PLTOFF64		36	/* 16 bit offset from GOT to PLT. */
-#define R_390_TLS_LOAD		37	/* Tag for load insn in TLS code. */
-#define R_390_TLS_GDCALL	38	/* Tag for function call in general
-                                           dynamic TLS code.  */
-#define R_390_TLS_LDCALL	39	/* Tag for function call in local
-                                           dynamic TLS code.  */
-#define R_390_TLS_GD32		40	/* Direct 32 bit for general dynamic
-                                           thread local data.  */
-#define R_390_TLS_GD64		41	/* Direct 64 bit for general dynamic
-                                           thread local data.  */
-#define R_390_TLS_GOTIE12	42	/* 12 bit GOT offset for static TLS
-                                           block offset.  */
-#define R_390_TLS_GOTIE32	43	/* 32 bit GOT offset for static TLS
-                                           block offset.  */
-#define R_390_TLS_GOTIE64	44	/* 64 bit GOT offset for static TLS
-                                           block offset.  */
-#define R_390_TLS_LDM32		45	/* Direct 32 bit for local dynamic
-                                           thread local data in LD code.  */
-#define R_390_TLS_LDM64		46	/* Direct 64 bit for local dynamic
-                                           thread local data in LD code.  */
-#define R_390_TLS_IE32		47	/* 32 bit address of GOT entry for
-                                           negated static TLS block offset.  */
-#define R_390_TLS_IE64		48	/* 64 bit address of GOT entry for
-                                           negated static TLS block offset.  */
-#define R_390_TLS_IEENT		49	/* 32 bit rel. offset to GOT entry for
-                                           negated static TLS block offset.  */
-#define R_390_TLS_LE32		50	/* 32 bit negated offset relative to
-                                           static TLS block.  */
-#define R_390_TLS_LE64		51	/* 64 bit negated offset relative to
-                                           static TLS block.  */
-#define R_390_TLS_LDO32		52	/* 32 bit offset relative to TLS
-                                           block.  */
-#define R_390_TLS_LDO64		53	/* 64 bit offset relative to TLS
-                                           block.  */
-#define R_390_TLS_DTPMOD	54	/* ID of module containing symbol.  */
-#define R_390_TLS_DTPOFF	55	/* Offset in TLS block.  */
-#define R_390_TLS_TPOFF		56	/* Negate offset in static TLS
+#define R_390_NONE              0   /* No reloc.  */
+#define R_390_8                 1   /* Direct 8 bit.  */
+#define R_390_12                2   /* Direct 12 bit.  */
+#define R_390_16                3   /* Direct 16 bit.  */
+#define R_390_32                4   /* Direct 32 bit.  */
+#define R_390_PC32              5   /* PC relative 32 bit.  */
+#define R_390_GOT12             6   /* 12 bit GOT offset.  */
+#define R_390_GOT32             7   /* 32 bit GOT offset.  */
+#define R_390_PLT32             8   /* 32 bit PC relative PLT address.  */
+#define R_390_COPY              9   /* Copy symbol at runtime.  */
+#define R_390_GLOB_DAT          10  /* Create GOT entry.  */
+#define R_390_JMP_SLOT          11  /* Create PLT entry.  */
+#define R_390_RELATIVE          12  /* Adjust by program base.  */
+#define R_390_GOTOFF32          13  /* 32 bit offset to GOT.  */
+#define R_390_GOTPC             14  /* 32 bit PC rel. offset to GOT.  */
+#define R_390_GOT16             15  /* 16 bit GOT offset.  */
+#define R_390_PC16              16  /* PC relative 16 bit.  */
+#define R_390_PC16DBL           17  /* PC relative 16 bit shifted by 1.  */
+#define R_390_PLT16DBL          18  /* 16 bit PC rel. PLT shifted by 1.  */
+#define R_390_PC32DBL           19  /* PC relative 32 bit shifted by 1.  */
+#define R_390_PLT32DBL          20  /* 32 bit PC rel. PLT shifted by 1.  */
+#define R_390_GOTPCDBL          21  /* 32 bit PC rel. GOT shifted by 1.  */
+#define R_390_64                22  /* Direct 64 bit.  */
+#define R_390_PC64              23  /* PC relative 64 bit.  */
+#define R_390_GOT64             24  /* 64 bit GOT offset.  */
+#define R_390_PLT64             25  /* 64 bit PC relative PLT address.  */
+#define R_390_GOTENT            26  /* 32 bit PC rel. to GOT entry >> 1. */
+#define R_390_GOTOFF16          27  /* 16 bit offset to GOT. */
+#define R_390_GOTOFF64          28  /* 64 bit offset to GOT. */
+#define R_390_GOTPLT12          29  /* 12 bit offset to jump slot.  */
+#define R_390_GOTPLT16          30  /* 16 bit offset to jump slot.  */
+#define R_390_GOTPLT32          31  /* 32 bit offset to jump slot.  */
+#define R_390_GOTPLT64          32  /* 64 bit offset to jump slot.  */
+#define R_390_GOTPLTENT         33  /* 32 bit rel. offset to jump slot.  */
+#define R_390_PLTOFF16          34  /* 16 bit offset from GOT to PLT. */
+#define R_390_PLTOFF32          35  /* 32 bit offset from GOT to PLT. */
+#define R_390_PLTOFF64          36  /* 16 bit offset from GOT to PLT. */
+#define R_390_TLS_LOAD          37  /* Tag for load insn in TLS code. */
+#define R_390_TLS_GDCALL        38  /* Tag for function call in general
+                                               dynamic TLS code.  */
+#define R_390_TLS_LDCALL        39  /* Tag for function call in local
+                                               dynamic TLS code.  */
+#define R_390_TLS_GD32          40  /* Direct 32 bit for general dynamic
+                                               thread local data.  */
+#define R_390_TLS_GD64          41  /* Direct 64 bit for general dynamic
+                                               thread local data.  */
+#define R_390_TLS_GOTIE12       42  /* 12 bit GOT offset for static TLS
+                                               block offset.  */
+#define R_390_TLS_GOTIE32       43  /* 32 bit GOT offset for static TLS
+                                               block offset.  */
+#define R_390_TLS_GOTIE64       44  /* 64 bit GOT offset for static TLS
+                                               block offset.  */
+#define R_390_TLS_LDM32         45  /* Direct 32 bit for local dynamic
+                                               thread local data in LD code.  */
+#define R_390_TLS_LDM64         46  /* Direct 64 bit for local dynamic
+                                               thread local data in LD code.  */
+#define R_390_TLS_IE32          47  /* 32 bit address of GOT entry for
+                                               negated static TLS block offset.  */
+#define R_390_TLS_IE64          48  /* 64 bit address of GOT entry for
+                                               negated static TLS block offset.  */
+#define R_390_TLS_IEENT         49  /* 32 bit rel. offset to GOT entry for
+                                               negated static TLS block offset.  */
+#define R_390_TLS_LE32          50  /* 32 bit negated offset relative to
+                                               static TLS block.  */
+#define R_390_TLS_LE64          51  /* 64 bit negated offset relative to
+                                               static TLS block.  */
+#define R_390_TLS_LDO32         52  /* 32 bit offset relative to TLS
+                                               block.  */
+#define R_390_TLS_LDO64         53  /* 64 bit offset relative to TLS
+                                               block.  */
+#define R_390_TLS_DTPMOD        54  /* ID of module containing symbol.  */
+#define R_390_TLS_DTPOFF        55  /* Offset in TLS block.  */
+#define R_390_TLS_TPOFF         56  /* Negate offset in static TLS
                                            block.  */
 #define R_390_20                57
 /* Keep this the last entry.  */
 #define R_390_NUM               58
 
 /* x86-64 relocation types */
-#define R_X86_64_NONE		0	/* No reloc */
-#define R_X86_64_64		1	/* Direct 64 bit  */
-#define R_X86_64_PC32		2	/* PC relative 32 bit signed */
-#define R_X86_64_GOT32		3	/* 32 bit GOT entry */
-#define R_X86_64_PLT32		4	/* 32 bit PLT address */
-#define R_X86_64_COPY		5	/* Copy symbol at runtime */
-#define R_X86_64_GLOB_DAT	6	/* Create GOT entry */
-#define R_X86_64_JUMP_SLOT	7	/* Create PLT entry */
-#define R_X86_64_RELATIVE	8	/* Adjust by program base */
-#define R_X86_64_GOTPCREL	9	/* 32 bit signed pc relative
+#define R_X86_64_NONE       0   /* No reloc */
+#define R_X86_64_64         1   /* Direct 64 bit  */
+#define R_X86_64_PC32       2   /* PC relative 32 bit signed */
+#define R_X86_64_GOT32      3   /* 32 bit GOT entry */
+#define R_X86_64_PLT32      4   /* 32 bit PLT address */
+#define R_X86_64_COPY       5   /* Copy symbol at runtime */
+#define R_X86_64_GLOB_DAT   6   /* Create GOT entry */
+#define R_X86_64_JUMP_SLOT  7   /* Create PLT entry */
+#define R_X86_64_RELATIVE   8   /* Adjust by program base */
+#define R_X86_64_GOTPCREL   9   /* 32 bit signed pc relative
                                            offset to GOT */
-#define R_X86_64_32		10	/* Direct 32 bit zero extended */
-#define R_X86_64_32S		11	/* Direct 32 bit sign extended */
-#define R_X86_64_16		12	/* Direct 16 bit zero extended */
-#define R_X86_64_PC16		13	/* 16 bit sign extended pc relative */
-#define R_X86_64_8		14	/* Direct 8 bit sign extended  */
-#define R_X86_64_PC8		15	/* 8 bit sign extended pc relative */
+#define R_X86_64_32         10  /* Direct 32 bit zero extended */
+#define R_X86_64_32S        11  /* Direct 32 bit sign extended */
+#define R_X86_64_16         12  /* Direct 16 bit zero extended */
+#define R_X86_64_PC16       13  /* 16 bit sign extended pc relative */
+#define R_X86_64_8          14  /* Direct 8 bit sign extended  */
+#define R_X86_64_PC8        15  /* 8 bit sign extended pc relative */
 
-#define R_X86_64_NUM		16
+#define R_X86_64_NUM        16
 
 /* Legal values for e_flags field of Elf64_Ehdr.  */
 
-#define EF_ALPHA_32BIT		1	/* All addresses are below 2GB */
+#define EF_ALPHA_32BIT      1   /* All addresses are below 2GB */
 
 /* HPPA specific definitions.  */
 
 /* Legal values for e_flags field of Elf32_Ehdr.  */
 
-#define EF_PARISC_TRAPNIL	0x00010000 /* Trap nil pointer dereference.  */
-#define EF_PARISC_EXT		0x00020000 /* Program uses arch. extensions. */
-#define EF_PARISC_LSB		0x00040000 /* Program expects little endian. */
-#define EF_PARISC_WIDE		0x00080000 /* Program expects wide mode.  */
-#define EF_PARISC_NO_KABP	0x00100000 /* No kernel assisted branch
+#define EF_PARISC_TRAPNIL   0x00010000 /* Trap nil pointer dereference.  */
+#define EF_PARISC_EXT       0x00020000 /* Program uses arch. extensions. */
+#define EF_PARISC_LSB       0x00040000 /* Program expects little endian. */
+#define EF_PARISC_WIDE      0x00080000 /* Program expects wide mode.  */
+#define EF_PARISC_NO_KABP   0x00100000 /* No kernel assisted branch
                                               prediction.  */
-#define EF_PARISC_LAZYSWAP	0x00400000 /* Allow lazy swapping.  */
-#define EF_PARISC_ARCH		0x0000ffff /* Architecture version.  */
+#define EF_PARISC_LAZYSWAP  0x00400000 /* Allow lazy swapping.  */
+#define EF_PARISC_ARCH      0x0000ffff /* Architecture version.  */
 
 /* Defined values for `e_flags & EF_PARISC_ARCH' are:  */
 
-#define EFA_PARISC_1_0		    0x020b /* PA-RISC 1.0 big-endian.  */
-#define EFA_PARISC_1_1		    0x0210 /* PA-RISC 1.1 big-endian.  */
-#define EFA_PARISC_2_0		    0x0214 /* PA-RISC 2.0 big-endian.  */
+#define EFA_PARISC_1_0      0x020b /* PA-RISC 1.0 big-endian.  */
+#define EFA_PARISC_1_1      0x0210 /* PA-RISC 1.1 big-endian.  */
+#define EFA_PARISC_2_0      0x0214 /* PA-RISC 2.0 big-endian.  */
 
 /* Additional section indeces.  */
 
-#define SHN_PARISC_ANSI_COMMON	0xff00	   /* Section for tenatively declared
+#define SHN_PARISC_ANSI_COMMON  0xff00   /* Section for tenatively declared
                                               symbols in ANSI C.  */
-#define SHN_PARISC_HUGE_COMMON	0xff01	   /* Common blocks in huge model.  */
+#define SHN_PARISC_HUGE_COMMON  0xff01   /* Common blocks in huge model.  */
 
 /* Legal values for sh_type field of Elf32_Shdr.  */
 
-#define SHT_PARISC_EXT		0x70000000 /* Contains product specific ext. */
-#define SHT_PARISC_UNWIND	0x70000001 /* Unwind information.  */
-#define SHT_PARISC_DOC		0x70000002 /* Debug info for optimized code. */
+#define SHT_PARISC_EXT      0x70000000 /* Contains product specific ext. */
+#define SHT_PARISC_UNWIND   0x70000001 /* Unwind information.  */
+#define SHT_PARISC_DOC      0x70000002 /* Debug info for optimized code. */
 
 /* Legal values for sh_flags field of Elf32_Shdr.  */
 
-#define SHF_PARISC_SHORT	0x20000000 /* Section with short addressing. */
-#define SHF_PARISC_HUGE		0x40000000 /* Section far from gp.  */
-#define SHF_PARISC_SBP		0x80000000 /* Static branch prediction code. */
+#define SHF_PARISC_SHORT    0x20000000 /* Section with short addressing. */
+#define SHF_PARISC_HUGE     0x40000000 /* Section far from gp.  */
+#define SHF_PARISC_SBP      0x80000000 /* Static branch prediction code. */
 
 /* Legal values for ST_TYPE subfield of st_info (symbol type).  */
 
-#define STT_PARISC_MILLICODE	13	/* Millicode function entry point.  */
+#define STT_PARISC_MILLICODE    13  /* Millicode function entry point.  */
 
-#define STT_HP_OPAQUE		(STT_LOOS + 0x1)
-#define STT_HP_STUB		(STT_LOOS + 0x2)
+#define STT_HP_OPAQUE           (STT_LOOS + 0x1)
+#define STT_HP_STUB             (STT_LOOS + 0x2)
 
 /* HPPA relocs.  */
 
-#define R_PARISC_NONE		0	/* No reloc.  */
-#define R_PARISC_DIR32		1	/* Direct 32-bit reference.  */
-#define R_PARISC_DIR21L		2	/* Left 21 bits of eff. address.  */
-#define R_PARISC_DIR17R		3	/* Right 17 bits of eff. address.  */
-#define R_PARISC_DIR17F		4	/* 17 bits of eff. address.  */
-#define R_PARISC_DIR14R		6	/* Right 14 bits of eff. address.  */
-#define R_PARISC_PCREL32	9	/* 32-bit rel. address.  */
-#define R_PARISC_PCREL21L	10	/* Left 21 bits of rel. address.  */
-#define R_PARISC_PCREL17R	11	/* Right 17 bits of rel. address.  */
-#define R_PARISC_PCREL17F	12	/* 17 bits of rel. address.  */
-#define R_PARISC_PCREL14R	14	/* Right 14 bits of rel. address.  */
-#define R_PARISC_DPREL21L	18	/* Left 21 bits of rel. address.  */
-#define R_PARISC_DPREL14R	22	/* Right 14 bits of rel. address.  */
-#define R_PARISC_GPREL21L	26	/* GP-relative, left 21 bits.  */
-#define R_PARISC_GPREL14R	30	/* GP-relative, right 14 bits.  */
-#define R_PARISC_LTOFF21L	34	/* LT-relative, left 21 bits.  */
-#define R_PARISC_LTOFF14R	38	/* LT-relative, right 14 bits.  */
-#define R_PARISC_SECREL32	41	/* 32 bits section rel. address.  */
-#define R_PARISC_SEGBASE	48	/* No relocation, set segment base.  */
-#define R_PARISC_SEGREL32	49	/* 32 bits segment rel. address.  */
-#define R_PARISC_PLTOFF21L	50	/* PLT rel. address, left 21 bits.  */
-#define R_PARISC_PLTOFF14R	54	/* PLT rel. address, right 14 bits.  */
-#define R_PARISC_LTOFF_FPTR32	57	/* 32 bits LT-rel. function pointer. */
-#define R_PARISC_LTOFF_FPTR21L	58	/* LT-rel. fct ptr, left 21 bits. */
-#define R_PARISC_LTOFF_FPTR14R	62	/* LT-rel. fct ptr, right 14 bits. */
-#define R_PARISC_FPTR64		64	/* 64 bits function address.  */
-#define R_PARISC_PLABEL32	65	/* 32 bits function address.  */
-#define R_PARISC_PCREL64	72	/* 64 bits PC-rel. address.  */
-#define R_PARISC_PCREL22F	74	/* 22 bits PC-rel. address.  */
-#define R_PARISC_PCREL14WR	75	/* PC-rel. address, right 14 bits.  */
-#define R_PARISC_PCREL14DR	76	/* PC rel. address, right 14 bits.  */
-#define R_PARISC_PCREL16F	77	/* 16 bits PC-rel. address.  */
-#define R_PARISC_PCREL16WF	78	/* 16 bits PC-rel. address.  */
-#define R_PARISC_PCREL16DF	79	/* 16 bits PC-rel. address.  */
-#define R_PARISC_DIR64		80	/* 64 bits of eff. address.  */
-#define R_PARISC_DIR14WR	83	/* 14 bits of eff. address.  */
-#define R_PARISC_DIR14DR	84	/* 14 bits of eff. address.  */
-#define R_PARISC_DIR16F		85	/* 16 bits of eff. address.  */
-#define R_PARISC_DIR16WF	86	/* 16 bits of eff. address.  */
-#define R_PARISC_DIR16DF	87	/* 16 bits of eff. address.  */
-#define R_PARISC_GPREL64	88	/* 64 bits of GP-rel. address.  */
-#define R_PARISC_GPREL14WR	91	/* GP-rel. address, right 14 bits.  */
-#define R_PARISC_GPREL14DR	92	/* GP-rel. address, right 14 bits.  */
-#define R_PARISC_GPREL16F	93	/* 16 bits GP-rel. address.  */
-#define R_PARISC_GPREL16WF	94	/* 16 bits GP-rel. address.  */
-#define R_PARISC_GPREL16DF	95	/* 16 bits GP-rel. address.  */
-#define R_PARISC_LTOFF64	96	/* 64 bits LT-rel. address.  */
-#define R_PARISC_LTOFF14WR	99	/* LT-rel. address, right 14 bits.  */
-#define R_PARISC_LTOFF14DR	100	/* LT-rel. address, right 14 bits.  */
-#define R_PARISC_LTOFF16F	101	/* 16 bits LT-rel. address.  */
-#define R_PARISC_LTOFF16WF	102	/* 16 bits LT-rel. address.  */
-#define R_PARISC_LTOFF16DF	103	/* 16 bits LT-rel. address.  */
-#define R_PARISC_SECREL64	104	/* 64 bits section rel. address.  */
-#define R_PARISC_SEGREL64	112	/* 64 bits segment rel. address.  */
-#define R_PARISC_PLTOFF14WR	115	/* PLT-rel. address, right 14 bits.  */
-#define R_PARISC_PLTOFF14DR	116	/* PLT-rel. address, right 14 bits.  */
-#define R_PARISC_PLTOFF16F	117	/* 16 bits LT-rel. address.  */
-#define R_PARISC_PLTOFF16WF	118	/* 16 bits PLT-rel. address.  */
-#define R_PARISC_PLTOFF16DF	119	/* 16 bits PLT-rel. address.  */
-#define R_PARISC_LTOFF_FPTR64	120	/* 64 bits LT-rel. function ptr.  */
-#define R_PARISC_LTOFF_FPTR14WR	123	/* LT-rel. fct. ptr., right 14 bits. */
-#define R_PARISC_LTOFF_FPTR14DR	124	/* LT-rel. fct. ptr., right 14 bits. */
-#define R_PARISC_LTOFF_FPTR16F	125	/* 16 bits LT-rel. function ptr.  */
-#define R_PARISC_LTOFF_FPTR16WF	126	/* 16 bits LT-rel. function ptr.  */
-#define R_PARISC_LTOFF_FPTR16DF	127	/* 16 bits LT-rel. function ptr.  */
-#define R_PARISC_LORESERVE	128
-#define R_PARISC_COPY		128	/* Copy relocation.  */
-#define R_PARISC_IPLT		129	/* Dynamic reloc, imported PLT */
-#define R_PARISC_EPLT		130	/* Dynamic reloc, exported PLT */
-#define R_PARISC_TPREL32	153	/* 32 bits TP-rel. address.  */
-#define R_PARISC_TPREL21L	154	/* TP-rel. address, left 21 bits.  */
-#define R_PARISC_TPREL14R	158	/* TP-rel. address, right 14 bits.  */
-#define R_PARISC_LTOFF_TP21L	162	/* LT-TP-rel. address, left 21 bits. */
-#define R_PARISC_LTOFF_TP14R	166	/* LT-TP-rel. address, right 14 bits.*/
-#define R_PARISC_LTOFF_TP14F	167	/* 14 bits LT-TP-rel. address.  */
-#define R_PARISC_TPREL64	216	/* 64 bits TP-rel. address.  */
-#define R_PARISC_TPREL14WR	219	/* TP-rel. address, right 14 bits.  */
-#define R_PARISC_TPREL14DR	220	/* TP-rel. address, right 14 bits.  */
-#define R_PARISC_TPREL16F	221	/* 16 bits TP-rel. address.  */
-#define R_PARISC_TPREL16WF	222	/* 16 bits TP-rel. address.  */
-#define R_PARISC_TPREL16DF	223	/* 16 bits TP-rel. address.  */
-#define R_PARISC_LTOFF_TP64	224	/* 64 bits LT-TP-rel. address.  */
-#define R_PARISC_LTOFF_TP14WR	227	/* LT-TP-rel. address, right 14 bits.*/
-#define R_PARISC_LTOFF_TP14DR	228	/* LT-TP-rel. address, right 14 bits.*/
-#define R_PARISC_LTOFF_TP16F	229	/* 16 bits LT-TP-rel. address.  */
-#define R_PARISC_LTOFF_TP16WF	230	/* 16 bits LT-TP-rel. address.  */
-#define R_PARISC_LTOFF_TP16DF	231	/* 16 bits LT-TP-rel. address.  */
-#define R_PARISC_HIRESERVE	255
+#define R_PARISC_NONE           0   /* No reloc.  */
+#define R_PARISC_DIR32          1   /* Direct 32-bit reference.  */
+#define R_PARISC_DIR21L         2   /* Left 21 bits of eff. address.  */
+#define R_PARISC_DIR17R         3   /* Right 17 bits of eff. address.  */
+#define R_PARISC_DIR17F         4   /* 17 bits of eff. address.  */
+#define R_PARISC_DIR14R         6   /* Right 14 bits of eff. address.  */
+#define R_PARISC_PCREL32        9   /* 32-bit rel. address.  */
+#define R_PARISC_PCREL21L       10  /* Left 21 bits of rel. address.  */
+#define R_PARISC_PCREL17R       11  /* Right 17 bits of rel. address.  */
+#define R_PARISC_PCREL17F       12  /* 17 bits of rel. address.  */
+#define R_PARISC_PCREL14R       14  /* Right 14 bits of rel. address.  */
+#define R_PARISC_DPREL21L       18  /* Left 21 bits of rel. address.  */
+#define R_PARISC_DPREL14R       22  /* Right 14 bits of rel. address.  */
+#define R_PARISC_GPREL21L       26  /* GP-relative, left 21 bits.  */
+#define R_PARISC_GPREL14R       30  /* GP-relative, right 14 bits.  */
+#define R_PARISC_LTOFF21L       34  /* LT-relative, left 21 bits.  */
+#define R_PARISC_LTOFF14R       38  /* LT-relative, right 14 bits.  */
+#define R_PARISC_SECREL32       41  /* 32 bits section rel. address.  */
+#define R_PARISC_SEGBASE        48  /* No relocation, set segment base.  */
+#define R_PARISC_SEGREL32       49  /* 32 bits segment rel. address.  */
+#define R_PARISC_PLTOFF21L      50  /* PLT rel. address, left 21 bits.  */
+#define R_PARISC_PLTOFF14R      54  /* PLT rel. address, right 14 bits.  */
+#define R_PARISC_LTOFF_FPTR32   57  /* 32 bits LT-rel. function pointer. */
+#define R_PARISC_LTOFF_FPTR21L  58  /* LT-rel. fct ptr, left 21 bits. */
+#define R_PARISC_LTOFF_FPTR14R  62  /* LT-rel. fct ptr, right 14 bits. */
+#define R_PARISC_FPTR64         64  /* 64 bits function address.  */
+#define R_PARISC_PLABEL32       65  /* 32 bits function address.  */
+#define R_PARISC_PCREL64        72  /* 64 bits PC-rel. address.  */
+#define R_PARISC_PCREL22F       74  /* 22 bits PC-rel. address.  */
+#define R_PARISC_PCREL14WR      75  /* PC-rel. address, right 14 bits.  */
+#define R_PARISC_PCREL14DR      76  /* PC rel. address, right 14 bits.  */
+#define R_PARISC_PCREL16F       77  /* 16 bits PC-rel. address.  */
+#define R_PARISC_PCREL16WF      78  /* 16 bits PC-rel. address.  */
+#define R_PARISC_PCREL16DF      79  /* 16 bits PC-rel. address.  */
+#define R_PARISC_DIR64          80  /* 64 bits of eff. address.  */
+#define R_PARISC_DIR14WR        83  /* 14 bits of eff. address.  */
+#define R_PARISC_DIR14DR        84  /* 14 bits of eff. address.  */
+#define R_PARISC_DIR16F         85  /* 16 bits of eff. address.  */
+#define R_PARISC_DIR16WF        86  /* 16 bits of eff. address.  */
+#define R_PARISC_DIR16DF        87  /* 16 bits of eff. address.  */
+#define R_PARISC_GPREL64        88  /* 64 bits of GP-rel. address.  */
+#define R_PARISC_GPREL14WR      91  /* GP-rel. address, right 14 bits.  */
+#define R_PARISC_GPREL14DR      92  /* GP-rel. address, right 14 bits.  */
+#define R_PARISC_GPREL16F       93  /* 16 bits GP-rel. address.  */
+#define R_PARISC_GPREL16WF      94  /* 16 bits GP-rel. address.  */
+#define R_PARISC_GPREL16DF      95  /* 16 bits GP-rel. address.  */
+#define R_PARISC_LTOFF64        96  /* 64 bits LT-rel. address.  */
+#define R_PARISC_LTOFF14WR      99  /* LT-rel. address, right 14 bits.  */
+#define R_PARISC_LTOFF14DR      100 /* LT-rel. address, right 14 bits.  */
+#define R_PARISC_LTOFF16F       101 /* 16 bits LT-rel. address.  */
+#define R_PARISC_LTOFF16WF      102 /* 16 bits LT-rel. address.  */
+#define R_PARISC_LTOFF16DF      103 /* 16 bits LT-rel. address.  */
+#define R_PARISC_SECREL64       104 /* 64 bits section rel. address.  */
+#define R_PARISC_SEGREL64       112 /* 64 bits segment rel. address.  */
+#define R_PARISC_PLTOFF14WR     115 /* PLT-rel. address, right 14 bits.  */
+#define R_PARISC_PLTOFF14DR     116 /* PLT-rel. address, right 14 bits.  */
+#define R_PARISC_PLTOFF16F      117 /* 16 bits LT-rel. address.  */
+#define R_PARISC_PLTOFF16WF     118 /* 16 bits PLT-rel. address.  */
+#define R_PARISC_PLTOFF16DF     119 /* 16 bits PLT-rel. address.  */
+#define R_PARISC_LTOFF_FPTR64   120 /* 64 bits LT-rel. function ptr.  */
+#define R_PARISC_LTOFF_FPTR14WR 123 /* LT-rel. fct. ptr., right 14 bits. */
+#define R_PARISC_LTOFF_FPTR14DR 124 /* LT-rel. fct. ptr., right 14 bits. */
+#define R_PARISC_LTOFF_FPTR16F  125 /* 16 bits LT-rel. function ptr.  */
+#define R_PARISC_LTOFF_FPTR16WF 126 /* 16 bits LT-rel. function ptr.  */
+#define R_PARISC_LTOFF_FPTR16DF 127 /* 16 bits LT-rel. function ptr.  */
+#define R_PARISC_LORESERVE      128
+#define R_PARISC_COPY           128 /* Copy relocation.  */
+#define R_PARISC_IPLT           129 /* Dynamic reloc, imported PLT */
+#define R_PARISC_EPLT           130 /* Dynamic reloc, exported PLT */
+#define R_PARISC_TPREL32        153 /* 32 bits TP-rel. address.  */
+#define R_PARISC_TPREL21L       154 /* TP-rel. address, left 21 bits.  */
+#define R_PARISC_TPREL14R       158 /* TP-rel. address, right 14 bits.  */
+#define R_PARISC_LTOFF_TP21L    162 /* LT-TP-rel. address, left 21 bits. */
+#define R_PARISC_LTOFF_TP14R    166 /* LT-TP-rel. address, right 14 bits.*/
+#define R_PARISC_LTOFF_TP14F    167 /* 14 bits LT-TP-rel. address.  */
+#define R_PARISC_TPREL64        216 /* 64 bits TP-rel. address.  */
+#define R_PARISC_TPREL14WR      219 /* TP-rel. address, right 14 bits.  */
+#define R_PARISC_TPREL14DR      220 /* TP-rel. address, right 14 bits.  */
+#define R_PARISC_TPREL16F       221 /* 16 bits TP-rel. address.  */
+#define R_PARISC_TPREL16WF      222 /* 16 bits TP-rel. address.  */
+#define R_PARISC_TPREL16DF      223 /* 16 bits TP-rel. address.  */
+#define R_PARISC_LTOFF_TP64     224 /* 64 bits LT-TP-rel. address.  */
+#define R_PARISC_LTOFF_TP14WR   227 /* LT-TP-rel. address, right 14 bits.*/
+#define R_PARISC_LTOFF_TP14DR   228 /* LT-TP-rel. address, right 14 bits.*/
+#define R_PARISC_LTOFF_TP16F    229 /* 16 bits LT-TP-rel. address.  */
+#define R_PARISC_LTOFF_TP16WF   230 /* 16 bits LT-TP-rel. address.  */
+#define R_PARISC_LTOFF_TP16DF   231 /* 16 bits LT-TP-rel. address.  */
+#define R_PARISC_HIRESERVE      255
 
 /* Legal values for p_type field of Elf32_Phdr/Elf64_Phdr.  */
 
-#define PT_HP_TLS		(PT_LOOS + 0x0)
-#define PT_HP_CORE_NONE		(PT_LOOS + 0x1)
-#define PT_HP_CORE_VERSION	(PT_LOOS + 0x2)
-#define PT_HP_CORE_KERNEL	(PT_LOOS + 0x3)
-#define PT_HP_CORE_COMM		(PT_LOOS + 0x4)
-#define PT_HP_CORE_PROC		(PT_LOOS + 0x5)
-#define PT_HP_CORE_LOADABLE	(PT_LOOS + 0x6)
-#define PT_HP_CORE_STACK	(PT_LOOS + 0x7)
-#define PT_HP_CORE_SHM		(PT_LOOS + 0x8)
-#define PT_HP_CORE_MMF		(PT_LOOS + 0x9)
-#define PT_HP_PARALLEL		(PT_LOOS + 0x10)
-#define PT_HP_FASTBIND		(PT_LOOS + 0x11)
-#define PT_HP_OPT_ANNOT		(PT_LOOS + 0x12)
-#define PT_HP_HSL_ANNOT		(PT_LOOS + 0x13)
-#define PT_HP_STACK		(PT_LOOS + 0x14)
-
-#define PT_PARISC_ARCHEXT	0x70000000
-#define PT_PARISC_UNWIND	0x70000001
+#define PT_HP_TLS               (PT_LOOS + 0x0)
+#define PT_HP_CORE_NONE         (PT_LOOS + 0x1)
+#define PT_HP_CORE_VERSION      (PT_LOOS + 0x2)
+#define PT_HP_CORE_KERNEL       (PT_LOOS + 0x3)
+#define PT_HP_CORE_COMM         (PT_LOOS + 0x4)
+#define PT_HP_CORE_PROC         (PT_LOOS + 0x5)
+#define PT_HP_CORE_LOADABLE     (PT_LOOS + 0x6)
+#define PT_HP_CORE_STACK        (PT_LOOS + 0x7)
+#define PT_HP_CORE_SHM          (PT_LOOS + 0x8)
+#define PT_HP_CORE_MMF          (PT_LOOS + 0x9)
+#define PT_HP_PARALLEL          (PT_LOOS + 0x10)
+#define PT_HP_FASTBIND          (PT_LOOS + 0x11)
+#define PT_HP_OPT_ANNOT         (PT_LOOS + 0x12)
+#define PT_HP_HSL_ANNOT         (PT_LOOS + 0x13)
+#define PT_HP_STACK             (PT_LOOS + 0x14)
+
+#define PT_PARISC_ARCHEXT       0x70000000
+#define PT_PARISC_UNWIND        0x70000001
 
 /* Legal values for p_flags field of Elf32_Phdr/Elf64_Phdr.  */
 
-#define PF_PARISC_SBP		0x08000000
+#define PF_PARISC_SBP           0x08000000
 
-#define PF_HP_PAGE_SIZE		0x00100000
-#define PF_HP_FAR_SHARED	0x00200000
-#define PF_HP_NEAR_SHARED	0x00400000
-#define PF_HP_CODE		0x01000000
-#define PF_HP_MODIFY		0x02000000
-#define PF_HP_LAZYSWAP		0x04000000
-#define PF_HP_SBP		0x08000000
+#define PF_HP_PAGE_SIZE         0x00100000
+#define PF_HP_FAR_SHARED        0x00200000
+#define PF_HP_NEAR_SHARED       0x00400000
+#define PF_HP_CODE              0x01000000
+#define PF_HP_MODIFY            0x02000000
+#define PF_HP_LAZYSWAP          0x04000000
+#define PF_HP_SBP               0x08000000
 
 /* IA-64 specific declarations.  */
 
 /* Processor specific flags for the Ehdr e_flags field.  */
-#define EF_IA_64_MASKOS		0x0000000f	/* os-specific flags */
-#define EF_IA_64_ABI64		0x00000010	/* 64-bit ABI */
-#define EF_IA_64_ARCH		0xff000000	/* arch. version mask */
+#define EF_IA_64_MASKOS         0x0000000f  /* os-specific flags */
+#define EF_IA_64_ABI64          0x00000010  /* 64-bit ABI */
+#define EF_IA_64_ARCH           0xff000000  /* arch. version mask */
 
 /* Processor specific values for the Phdr p_type field.  */
-#define PT_IA_64_ARCHEXT	(PT_LOPROC + 0)	/* arch extension bits */
-#define PT_IA_64_UNWIND		(PT_LOPROC + 1)	/* ia64 unwind bits */
+#define PT_IA_64_ARCHEXT        (PT_LOPROC + 0) /* arch extension bits */
+#define PT_IA_64_UNWIND         (PT_LOPROC + 1) /* ia64 unwind bits */
 
 /* Processor specific flags for the Phdr p_flags field.  */
-#define PF_IA_64_NORECOV	0x80000000	/* spec insns w/o recovery */
+#define PF_IA_64_NORECOV        0x80000000  /* spec insns w/o recovery */
 
 /* Processor specific values for the Shdr sh_type field.  */
-#define SHT_IA_64_EXT		(SHT_LOPROC + 0) /* extension bits */
-#define SHT_IA_64_UNWIND	(SHT_LOPROC + 1) /* unwind bits */
+#define SHT_IA_64_EXT           (SHT_LOPROC + 0) /* extension bits */
+#define SHT_IA_64_UNWIND        (SHT_LOPROC + 1) /* unwind bits */
 
 /* Processor specific flags for the Shdr sh_flags field.  */
-#define SHF_IA_64_SHORT		0x10000000	/* section near gp */
-#define SHF_IA_64_NORECOV	0x20000000	/* spec insns w/o recovery */
+#define SHF_IA_64_SHORT         0x10000000  /* section near gp */
+#define SHF_IA_64_NORECOV       0x20000000  /* spec insns w/o recovery */
 
 /* Processor specific values for the Dyn d_tag field.  */
-#define DT_IA_64_PLT_RESERVE	(DT_LOPROC + 0)
-#define DT_IA_64_NUM		1
+#define DT_IA_64_PLT_RESERVE    (DT_LOPROC + 0)
+#define DT_IA_64_NUM            1
 
 /* IA-64 relocations.  */
-#define R_IA64_NONE		0x00	/* none */
-#define R_IA64_IMM14		0x21	/* symbol + addend, add imm14 */
-#define R_IA64_IMM22		0x22	/* symbol + addend, add imm22 */
-#define R_IA64_IMM64		0x23	/* symbol + addend, mov imm64 */
-#define R_IA64_DIR32MSB		0x24	/* symbol + addend, data4 MSB */
-#define R_IA64_DIR32LSB		0x25	/* symbol + addend, data4 LSB */
-#define R_IA64_DIR64MSB		0x26	/* symbol + addend, data8 MSB */
-#define R_IA64_DIR64LSB		0x27	/* symbol + addend, data8 LSB */
-#define R_IA64_GPREL22		0x2a	/* @gprel(sym + add), add imm22 */
-#define R_IA64_GPREL64I		0x2b	/* @gprel(sym + add), mov imm64 */
-#define R_IA64_GPREL32MSB	0x2c	/* @gprel(sym + add), data4 MSB */
-#define R_IA64_GPREL32LSB	0x2d	/* @gprel(sym + add), data4 LSB */
-#define R_IA64_GPREL64MSB	0x2e	/* @gprel(sym + add), data8 MSB */
-#define R_IA64_GPREL64LSB	0x2f	/* @gprel(sym + add), data8 LSB */
-#define R_IA64_LTOFF22		0x32	/* @ltoff(sym + add), add imm22 */
-#define R_IA64_LTOFF64I		0x33	/* @ltoff(sym + add), mov imm64 */
-#define R_IA64_PLTOFF22		0x3a	/* @pltoff(sym + add), add imm22 */
-#define R_IA64_PLTOFF64I	0x3b	/* @pltoff(sym + add), mov imm64 */
-#define R_IA64_PLTOFF64MSB	0x3e	/* @pltoff(sym + add), data8 MSB */
-#define R_IA64_PLTOFF64LSB	0x3f	/* @pltoff(sym + add), data8 LSB */
-#define R_IA64_FPTR64I		0x43	/* @fptr(sym + add), mov imm64 */
-#define R_IA64_FPTR32MSB	0x44	/* @fptr(sym + add), data4 MSB */
-#define R_IA64_FPTR32LSB	0x45	/* @fptr(sym + add), data4 LSB */
-#define R_IA64_FPTR64MSB	0x46	/* @fptr(sym + add), data8 MSB */
-#define R_IA64_FPTR64LSB	0x47	/* @fptr(sym + add), data8 LSB */
-#define R_IA64_PCREL60B		0x48	/* @pcrel(sym + add), brl */
-#define R_IA64_PCREL21B		0x49	/* @pcrel(sym + add), ptb, call */
-#define R_IA64_PCREL21M		0x4a	/* @pcrel(sym + add), chk.s */
-#define R_IA64_PCREL21F		0x4b	/* @pcrel(sym + add), fchkf */
-#define R_IA64_PCREL32MSB	0x4c	/* @pcrel(sym + add), data4 MSB */
-#define R_IA64_PCREL32LSB	0x4d	/* @pcrel(sym + add), data4 LSB */
-#define R_IA64_PCREL64MSB	0x4e	/* @pcrel(sym + add), data8 MSB */
-#define R_IA64_PCREL64LSB	0x4f	/* @pcrel(sym + add), data8 LSB */
-#define R_IA64_LTOFF_FPTR22	0x52	/* @ltoff(@fptr(s+a)), imm22 */
-#define R_IA64_LTOFF_FPTR64I	0x53	/* @ltoff(@fptr(s+a)), imm64 */
-#define R_IA64_LTOFF_FPTR32MSB	0x54	/* @ltoff(@fptr(s+a)), data4 MSB */
-#define R_IA64_LTOFF_FPTR32LSB	0x55	/* @ltoff(@fptr(s+a)), data4 LSB */
-#define R_IA64_LTOFF_FPTR64MSB	0x56	/* @ltoff(@fptr(s+a)), data8 MSB */
-#define R_IA64_LTOFF_FPTR64LSB	0x57	/* @ltoff(@fptr(s+a)), data8 LSB */
-#define R_IA64_SEGREL32MSB	0x5c	/* @segrel(sym + add), data4 MSB */
-#define R_IA64_SEGREL32LSB	0x5d	/* @segrel(sym + add), data4 LSB */
-#define R_IA64_SEGREL64MSB	0x5e	/* @segrel(sym + add), data8 MSB */
-#define R_IA64_SEGREL64LSB	0x5f	/* @segrel(sym + add), data8 LSB */
-#define R_IA64_SECREL32MSB	0x64	/* @secrel(sym + add), data4 MSB */
-#define R_IA64_SECREL32LSB	0x65	/* @secrel(sym + add), data4 LSB */
-#define R_IA64_SECREL64MSB	0x66	/* @secrel(sym + add), data8 MSB */
-#define R_IA64_SECREL64LSB	0x67	/* @secrel(sym + add), data8 LSB */
-#define R_IA64_REL32MSB		0x6c	/* data 4 + REL */
-#define R_IA64_REL32LSB		0x6d	/* data 4 + REL */
-#define R_IA64_REL64MSB		0x6e	/* data 8 + REL */
-#define R_IA64_REL64LSB		0x6f	/* data 8 + REL */
-#define R_IA64_LTV32MSB		0x74	/* symbol + addend, data4 MSB */
-#define R_IA64_LTV32LSB		0x75	/* symbol + addend, data4 LSB */
-#define R_IA64_LTV64MSB		0x76	/* symbol + addend, data8 MSB */
-#define R_IA64_LTV64LSB		0x77	/* symbol + addend, data8 LSB */
-#define R_IA64_PCREL21BI	0x79	/* @pcrel(sym + add), 21bit inst */
-#define R_IA64_PCREL22		0x7a	/* @pcrel(sym + add), 22bit inst */
-#define R_IA64_PCREL64I		0x7b	/* @pcrel(sym + add), 64bit inst */
-#define R_IA64_IPLTMSB		0x80	/* dynamic reloc, imported PLT, MSB */
-#define R_IA64_IPLTLSB		0x81	/* dynamic reloc, imported PLT, LSB */
-#define R_IA64_COPY		0x84	/* copy relocation */
-#define R_IA64_SUB		0x85	/* Addend and symbol difference */
-#define R_IA64_LTOFF22X		0x86	/* LTOFF22, relaxable.  */
-#define R_IA64_LDXMOV		0x87	/* Use of LTOFF22X.  */
-#define R_IA64_TPREL14		0x91	/* @tprel(sym + add), imm14 */
-#define R_IA64_TPREL22		0x92	/* @tprel(sym + add), imm22 */
-#define R_IA64_TPREL64I		0x93	/* @tprel(sym + add), imm64 */
-#define R_IA64_TPREL64MSB	0x96	/* @tprel(sym + add), data8 MSB */
-#define R_IA64_TPREL64LSB	0x97	/* @tprel(sym + add), data8 LSB */
-#define R_IA64_LTOFF_TPREL22	0x9a	/* @ltoff(@tprel(s+a)), imm2 */
-#define R_IA64_DTPMOD64MSB	0xa6	/* @dtpmod(sym + add), data8 MSB */
-#define R_IA64_DTPMOD64LSB	0xa7	/* @dtpmod(sym + add), data8 LSB */
-#define R_IA64_LTOFF_DTPMOD22	0xaa	/* @ltoff(@dtpmod(sym + add)), imm22 */
-#define R_IA64_DTPREL14		0xb1	/* @dtprel(sym + add), imm14 */
-#define R_IA64_DTPREL22		0xb2	/* @dtprel(sym + add), imm22 */
-#define R_IA64_DTPREL64I	0xb3	/* @dtprel(sym + add), imm64 */
-#define R_IA64_DTPREL32MSB	0xb4	/* @dtprel(sym + add), data4 MSB */
-#define R_IA64_DTPREL32LSB	0xb5	/* @dtprel(sym + add), data4 LSB */
-#define R_IA64_DTPREL64MSB	0xb6	/* @dtprel(sym + add), data8 MSB */
-#define R_IA64_DTPREL64LSB	0xb7	/* @dtprel(sym + add), data8 LSB */
-#define R_IA64_LTOFF_DTPREL22	0xba	/* @ltoff(@dtprel(s+a)), imm22 */
+#define R_IA64_NONE             0x00    /* none */
+#define R_IA64_IMM14            0x21    /* symbol + addend, add imm14 */
+#define R_IA64_IMM22            0x22    /* symbol + addend, add imm22 */
+#define R_IA64_IMM64            0x23    /* symbol + addend, mov imm64 */
+#define R_IA64_DIR32MSB         0x24    /* symbol + addend, data4 MSB */
+#define R_IA64_DIR32LSB         0x25    /* symbol + addend, data4 LSB */
+#define R_IA64_DIR64MSB         0x26    /* symbol + addend, data8 MSB */
+#define R_IA64_DIR64LSB         0x27    /* symbol + addend, data8 LSB */
+#define R_IA64_GPREL22          0x2a    /* @gprel(sym + add), add imm22 */
+#define R_IA64_GPREL64I         0x2b    /* @gprel(sym + add), mov imm64 */
+#define R_IA64_GPREL32MSB       0x2c    /* @gprel(sym + add), data4 MSB */
+#define R_IA64_GPREL32LSB       0x2d    /* @gprel(sym + add), data4 LSB */
+#define R_IA64_GPREL64MSB       0x2e    /* @gprel(sym + add), data8 MSB */
+#define R_IA64_GPREL64LSB       0x2f    /* @gprel(sym + add), data8 LSB */
+#define R_IA64_LTOFF22          0x32    /* @ltoff(sym + add), add imm22 */
+#define R_IA64_LTOFF64I         0x33    /* @ltoff(sym + add), mov imm64 */
+#define R_IA64_PLTOFF22         0x3a    /* @pltoff(sym + add), add imm22 */
+#define R_IA64_PLTOFF64I        0x3b    /* @pltoff(sym + add), mov imm64 */
+#define R_IA64_PLTOFF64MSB      0x3e    /* @pltoff(sym + add), data8 MSB */
+#define R_IA64_PLTOFF64LSB      0x3f    /* @pltoff(sym + add), data8 LSB */
+#define R_IA64_FPTR64I          0x43    /* @fptr(sym + add), mov imm64 */
+#define R_IA64_FPTR32MSB        0x44    /* @fptr(sym + add), data4 MSB */
+#define R_IA64_FPTR32LSB        0x45    /* @fptr(sym + add), data4 LSB */
+#define R_IA64_FPTR64MSB        0x46    /* @fptr(sym + add), data8 MSB */
+#define R_IA64_FPTR64LSB        0x47    /* @fptr(sym + add), data8 LSB */
+#define R_IA64_PCREL60B         0x48    /* @pcrel(sym + add), brl */
+#define R_IA64_PCREL21B         0x49    /* @pcrel(sym + add), ptb, call */
+#define R_IA64_PCREL21M         0x4a    /* @pcrel(sym + add), chk.s */
+#define R_IA64_PCREL21F         0x4b    /* @pcrel(sym + add), fchkf */
+#define R_IA64_PCREL32MSB       0x4c    /* @pcrel(sym + add), data4 MSB */
+#define R_IA64_PCREL32LSB       0x4d    /* @pcrel(sym + add), data4 LSB */
+#define R_IA64_PCREL64MSB       0x4e    /* @pcrel(sym + add), data8 MSB */
+#define R_IA64_PCREL64LSB       0x4f    /* @pcrel(sym + add), data8 LSB */
+#define R_IA64_LTOFF_FPTR22     0x52    /* @ltoff(@fptr(s+a)), imm22 */
+#define R_IA64_LTOFF_FPTR64I    0x53    /* @ltoff(@fptr(s+a)), imm64 */
+#define R_IA64_LTOFF_FPTR32MSB  0x54    /* @ltoff(@fptr(s+a)), data4 MSB */
+#define R_IA64_LTOFF_FPTR32LSB  0x55    /* @ltoff(@fptr(s+a)), data4 LSB */
+#define R_IA64_LTOFF_FPTR64MSB  0x56    /* @ltoff(@fptr(s+a)), data8 MSB */
+#define R_IA64_LTOFF_FPTR64LSB  0x57    /* @ltoff(@fptr(s+a)), data8 LSB */
+#define R_IA64_SEGREL32MSB      0x5c    /* @segrel(sym + add), data4 MSB */
+#define R_IA64_SEGREL32LSB      0x5d    /* @segrel(sym + add), data4 LSB */
+#define R_IA64_SEGREL64MSB      0x5e    /* @segrel(sym + add), data8 MSB */
+#define R_IA64_SEGREL64LSB      0x5f    /* @segrel(sym + add), data8 LSB */
+#define R_IA64_SECREL32MSB      0x64    /* @secrel(sym + add), data4 MSB */
+#define R_IA64_SECREL32LSB      0x65    /* @secrel(sym + add), data4 LSB */
+#define R_IA64_SECREL64MSB      0x66    /* @secrel(sym + add), data8 MSB */
+#define R_IA64_SECREL64LSB      0x67    /* @secrel(sym + add), data8 LSB */
+#define R_IA64_REL32MSB         0x6c    /* data 4 + REL */
+#define R_IA64_REL32LSB         0x6d    /* data 4 + REL */
+#define R_IA64_REL64MSB         0x6e    /* data 8 + REL */
+#define R_IA64_REL64LSB         0x6f    /* data 8 + REL */
+#define R_IA64_LTV32MSB         0x74    /* symbol + addend, data4 MSB */
+#define R_IA64_LTV32LSB         0x75    /* symbol + addend, data4 LSB */
+#define R_IA64_LTV64MSB         0x76    /* symbol + addend, data8 MSB */
+#define R_IA64_LTV64LSB         0x77    /* symbol + addend, data8 LSB */
+#define R_IA64_PCREL21BI        0x79    /* @pcrel(sym + add), 21bit inst */
+#define R_IA64_PCREL22          0x7a    /* @pcrel(sym + add), 22bit inst */
+#define R_IA64_PCREL64I         0x7b    /* @pcrel(sym + add), 64bit inst */
+#define R_IA64_IPLTMSB          0x80    /* dynamic reloc, imported PLT, MSB */
+#define R_IA64_IPLTLSB          0x81    /* dynamic reloc, imported PLT, LSB */
+#define R_IA64_COPY             0x84    /* copy relocation */
+#define R_IA64_SUB              0x85    /* Addend and symbol difference */
+#define R_IA64_LTOFF22X         0x86    /* LTOFF22, relaxable.  */
+#define R_IA64_LDXMOV           0x87    /* Use of LTOFF22X.  */
+#define R_IA64_TPREL14          0x91    /* @tprel(sym + add), imm14 */
+#define R_IA64_TPREL22          0x92    /* @tprel(sym + add), imm22 */
+#define R_IA64_TPREL64I         0x93    /* @tprel(sym + add), imm64 */
+#define R_IA64_TPREL64MSB       0x96    /* @tprel(sym + add), data8 MSB */
+#define R_IA64_TPREL64LSB       0x97    /* @tprel(sym + add), data8 LSB */
+#define R_IA64_LTOFF_TPREL22    0x9a    /* @ltoff(@tprel(s+a)), imm2 */
+#define R_IA64_DTPMOD64MSB      0xa6    /* @dtpmod(sym + add), data8 MSB */
+#define R_IA64_DTPMOD64LSB      0xa7    /* @dtpmod(sym + add), data8 LSB */
+#define R_IA64_LTOFF_DTPMOD22   0xaa    /* @ltoff(@dtpmod(sym + add)), imm22 */
+#define R_IA64_DTPREL14         0xb1    /* @dtprel(sym + add), imm14 */
+#define R_IA64_DTPREL22         0xb2    /* @dtprel(sym + add), imm22 */
+#define R_IA64_DTPREL64I        0xb3    /* @dtprel(sym + add), imm64 */
+#define R_IA64_DTPREL32MSB      0xb4    /* @dtprel(sym + add), data4 MSB */
+#define R_IA64_DTPREL32LSB      0xb5    /* @dtprel(sym + add), data4 LSB */
+#define R_IA64_DTPREL64MSB      0xb6    /* @dtprel(sym + add), data8 MSB */
+#define R_IA64_DTPREL64LSB      0xb7    /* @dtprel(sym + add), data8 LSB */
+#define R_IA64_LTOFF_DTPREL22   0xba    /* @ltoff(@dtprel(s+a)), imm22 */
 
 /* RISC-V relocations.  */
 #define R_RISCV_NONE          0
@@ -1421,47 +1421,47 @@ typedef struct {
 #define EF_RISCV_TSO              0x0010
 
 typedef struct elf32_rel {
-  Elf32_Addr	r_offset;
-  Elf32_Word	r_info;
+  Elf32_Addr r_offset;
+  Elf32_Word r_info;
 } Elf32_Rel;
 
 typedef struct elf64_rel {
-  Elf64_Addr r_offset;	/* Location at which to apply the action */
-  Elf64_Xword r_info;	/* index and type of relocation */
+  Elf64_Addr r_offset;      /* Location at which to apply the action */
+  Elf64_Xword r_info;       /* index and type of relocation */
 } Elf64_Rel;
 
 typedef struct elf32_rela{
-  Elf32_Addr	r_offset;
-  Elf32_Word	r_info;
-  Elf32_Sword	r_addend;
+  Elf32_Addr r_offset;
+  Elf32_Word r_info;
+  Elf32_Sword r_addend;
 } Elf32_Rela;
 
 typedef struct elf64_rela {
-  Elf64_Addr r_offset;	/* Location at which to apply the action */
-  Elf64_Xword r_info;	/* index and type of relocation */
-  Elf64_Sxword r_addend;	/* Constant addend used to compute value */
+  Elf64_Addr r_offset;      /* Location at which to apply the action */
+  Elf64_Xword r_info;       /* index and type of relocation */
+  Elf64_Sxword r_addend;    /* Constant addend used to compute value */
 } Elf64_Rela;
 
 typedef struct elf32_sym{
-  Elf32_Word	st_name;
-  Elf32_Addr	st_value;
-  Elf32_Word	st_size;
-  unsigned char	st_info;
-  unsigned char	st_other;
-  Elf32_Half	st_shndx;
+  Elf32_Word st_name;
+  Elf32_Addr st_value;
+  Elf32_Word st_size;
+  unsigned char st_info;
+  unsigned char st_other;
+  Elf32_Half st_shndx;
 } Elf32_Sym;
 
 typedef struct elf64_sym {
-  Elf64_Word st_name;		/* Symbol name, index in string tbl */
-  unsigned char	st_info;	/* Type and binding attributes */
-  unsigned char	st_other;	/* No defined meaning, 0 */
-  Elf64_Half st_shndx;		/* Associated section index */
-  Elf64_Addr st_value;		/* Value of the symbol */
-  Elf64_Xword st_size;		/* Associated symbol size */
+  Elf64_Word st_name;       /* Symbol name, index in string tbl */
+  unsigned char st_info;    /* Type and binding attributes */
+  unsigned char st_other;   /* No defined meaning, 0 */
+  Elf64_Half st_shndx;      /* Associated section index */
+  Elf64_Addr st_value;      /* Value of the symbol */
+  Elf64_Xword st_size;      /* Associated symbol size */
 } Elf64_Sym;
 
 
-#define EI_NIDENT	16
+#define EI_NIDENT       16
 
 /* Special value for e_phnum.  This indicates that the real number of
    program headers is too large to fit into e_phnum.  Instead the real
@@ -1469,30 +1469,30 @@ typedef struct elf64_sym {
 #define PN_XNUM         0xffff
 
 typedef struct elf32_hdr{
-  unsigned char	e_ident[EI_NIDENT];
-  Elf32_Half	e_type;
-  Elf32_Half	e_machine;
-  Elf32_Word	e_version;
-  Elf32_Addr	e_entry;  /* Entry point */
-  Elf32_Off	e_phoff;
-  Elf32_Off	e_shoff;
-  Elf32_Word	e_flags;
-  Elf32_Half	e_ehsize;
-  Elf32_Half	e_phentsize;
-  Elf32_Half	e_phnum;
-  Elf32_Half	e_shentsize;
-  Elf32_Half	e_shnum;
-  Elf32_Half	e_shstrndx;
+  unsigned char e_ident[EI_NIDENT];
+  Elf32_Half e_type;
+  Elf32_Half e_machine;
+  Elf32_Word e_version;
+  Elf32_Addr e_entry;  /* Entry point */
+  Elf32_Off e_phoff;
+  Elf32_Off e_shoff;
+  Elf32_Word e_flags;
+  Elf32_Half e_ehsize;
+  Elf32_Half e_phentsize;
+  Elf32_Half e_phnum;
+  Elf32_Half e_shentsize;
+  Elf32_Half e_shnum;
+  Elf32_Half e_shstrndx;
 } Elf32_Ehdr;
 
 typedef struct elf64_hdr {
-  unsigned char	e_ident[16];		/* ELF "magic number" */
+  unsigned char e_ident[16];    /* ELF "magic number" */
   Elf64_Half e_type;
   Elf64_Half e_machine;
   Elf64_Word e_version;
-  Elf64_Addr e_entry;		/* Entry point virtual address */
-  Elf64_Off e_phoff;		/* Program header table file offset */
-  Elf64_Off e_shoff;		/* Section header table file offset */
+  Elf64_Addr e_entry;           /* Entry point virtual address */
+  Elf64_Off e_phoff;            /* Program header table file offset */
+  Elf64_Off e_shoff;            /* Section header table file offset */
   Elf64_Word e_flags;
   Elf64_Half e_ehsize;
   Elf64_Half e_phentsize;
@@ -1504,107 +1504,107 @@ typedef struct elf64_hdr {
 
 /* These constants define the permissions on sections in the program
    header, p_flags. */
-#define PF_R		0x4
-#define PF_W		0x2
-#define PF_X		0x1
+#define PF_R 0x4
+#define PF_W 0x2
+#define PF_X 0x1
 
 typedef struct elf32_phdr{
-  Elf32_Word	p_type;
-  Elf32_Off	p_offset;
-  Elf32_Addr	p_vaddr;
-  Elf32_Addr	p_paddr;
-  Elf32_Word	p_filesz;
-  Elf32_Word	p_memsz;
-  Elf32_Word	p_flags;
-  Elf32_Word	p_align;
+  Elf32_Word p_type;
+  Elf32_Off p_offset;
+  Elf32_Addr p_vaddr;
+  Elf32_Addr p_paddr;
+  Elf32_Word p_filesz;
+  Elf32_Word p_memsz;
+  Elf32_Word p_flags;
+  Elf32_Word p_align;
 } Elf32_Phdr;
 
 typedef struct elf64_phdr {
   Elf64_Word p_type;
   Elf64_Word p_flags;
-  Elf64_Off p_offset;		/* Segment file offset */
-  Elf64_Addr p_vaddr;		/* Segment virtual address */
-  Elf64_Addr p_paddr;		/* Segment physical address */
-  Elf64_Xword p_filesz;		/* Segment size in file */
-  Elf64_Xword p_memsz;		/* Segment size in memory */
-  Elf64_Xword p_align;		/* Segment alignment, file & memory */
+  Elf64_Off p_offset;       /* Segment file offset */
+  Elf64_Addr p_vaddr;       /* Segment virtual address */
+  Elf64_Addr p_paddr;       /* Segment physical address */
+  Elf64_Xword p_filesz;     /* Segment size in file */
+  Elf64_Xword p_memsz;      /* Segment size in memory */
+  Elf64_Xword p_align;      /* Segment alignment, file & memory */
 } Elf64_Phdr;
 
 /* sh_type */
-#define SHT_NULL	0
-#define SHT_PROGBITS	1
-#define SHT_SYMTAB	2
-#define SHT_STRTAB	3
-#define SHT_RELA	4
-#define SHT_HASH	5
-#define SHT_DYNAMIC	6
-#define SHT_NOTE	7
-#define SHT_NOBITS	8
-#define SHT_REL		9
-#define SHT_SHLIB	10
-#define SHT_DYNSYM	11
-#define SHT_NUM		12
-#define SHT_LOPROC	0x70000000
-#define SHT_HIPROC	0x7fffffff
-#define SHT_LOUSER	0x80000000
-#define SHT_HIUSER	0xffffffff
-#define SHT_MIPS_LIST		0x70000000
-#define SHT_MIPS_CONFLICT	0x70000002
-#define SHT_MIPS_GPTAB		0x70000003
-#define SHT_MIPS_UCODE		0x70000004
+#define SHT_NULL            0
+#define SHT_PROGBITS        1
+#define SHT_SYMTAB          2
+#define SHT_STRTAB          3
+#define SHT_RELA            4
+#define SHT_HASH            5
+#define SHT_DYNAMIC         6
+#define SHT_NOTE            7
+#define SHT_NOBITS          8
+#define SHT_REL             9
+#define SHT_SHLIB           10
+#define SHT_DYNSYM          11
+#define SHT_NUM             12
+#define SHT_LOPROC          0x70000000
+#define SHT_HIPROC          0x7fffffff
+#define SHT_LOUSER          0x80000000
+#define SHT_HIUSER          0xffffffff
+#define SHT_MIPS_LIST       0x70000000
+#define SHT_MIPS_CONFLICT   0x70000002
+#define SHT_MIPS_GPTAB      0x70000003
+#define SHT_MIPS_UCODE      0x70000004
 
 /* sh_flags */
-#define SHF_WRITE	0x1
-#define SHF_ALLOC	0x2
-#define SHF_EXECINSTR	0x4
-#define SHF_MASKPROC	0xf0000000
-#define SHF_MIPS_GPREL	0x10000000
+#define SHF_WRITE       0x1
+#define SHF_ALLOC       0x2
+#define SHF_EXECINSTR   0x4
+#define SHF_MASKPROC    0xf0000000
+#define SHF_MIPS_GPREL  0x10000000
 
 /* special section indexes */
-#define SHN_UNDEF	0
-#define SHN_LORESERVE	0xff00
-#define SHN_LOPROC	0xff00
-#define SHN_HIPROC	0xff1f
-#define SHN_ABS		0xfff1
-#define SHN_COMMON	0xfff2
-#define SHN_HIRESERVE	0xffff
-#define SHN_MIPS_ACCOMON	0xff00
+#define SHN_UNDEF           0
+#define SHN_LORESERVE       0xff00
+#define SHN_LOPROC          0xff00
+#define SHN_HIPROC          0xff1f
+#define SHN_ABS             0xfff1
+#define SHN_COMMON          0xfff2
+#define SHN_HIRESERVE       0xffff
+#define SHN_MIPS_ACCOMON    0xff00
 
 typedef struct elf32_shdr {
-  Elf32_Word	sh_name;
-  Elf32_Word	sh_type;
-  Elf32_Word	sh_flags;
-  Elf32_Addr	sh_addr;
-  Elf32_Off	sh_offset;
-  Elf32_Word	sh_size;
-  Elf32_Word	sh_link;
-  Elf32_Word	sh_info;
-  Elf32_Word	sh_addralign;
-  Elf32_Word	sh_entsize;
+  Elf32_Word sh_name;
+  Elf32_Word sh_type;
+  Elf32_Word sh_flags;
+  Elf32_Addr sh_addr;
+  Elf32_Off sh_offset;
+  Elf32_Word sh_size;
+  Elf32_Word sh_link;
+  Elf32_Word sh_info;
+  Elf32_Word sh_addralign;
+  Elf32_Word sh_entsize;
 } Elf32_Shdr;
 
 typedef struct elf64_shdr {
-  Elf64_Word sh_name;		/* Section name, index in string tbl */
-  Elf64_Word sh_type;		/* Type of section */
-  Elf64_Xword sh_flags;		/* Miscellaneous section attributes */
-  Elf64_Addr sh_addr;		/* Section virtual addr at execution */
-  Elf64_Off sh_offset;		/* Section file offset */
-  Elf64_Xword sh_size;		/* Size of section in bytes */
-  Elf64_Word sh_link;		/* Index of another section */
-  Elf64_Word sh_info;		/* Additional section information */
-  Elf64_Xword sh_addralign;	/* Section alignment */
-  Elf64_Xword sh_entsize;	/* Entry size if section holds table */
+  Elf64_Word sh_name;       /* Section name, index in string tbl */
+  Elf64_Word sh_type;       /* Type of section */
+  Elf64_Xword sh_flags;     /* Miscellaneous section attributes */
+  Elf64_Addr sh_addr;       /* Section virtual addr at execution */
+  Elf64_Off sh_offset;      /* Section file offset */
+  Elf64_Xword sh_size;      /* Size of section in bytes */
+  Elf64_Word sh_link;       /* Index of another section */
+  Elf64_Word sh_info;       /* Additional section information */
+  Elf64_Xword sh_addralign; /* Section alignment */
+  Elf64_Xword sh_entsize;   /* Entry size if section holds table */
 } Elf64_Shdr;
 
-#define	EI_MAG0		0		/* e_ident[] indexes */
-#define	EI_MAG1		1
-#define	EI_MAG2		2
-#define	EI_MAG3		3
-#define	EI_CLASS	4
-#define	EI_DATA		5
-#define	EI_VERSION	6
-#define	EI_OSABI	7
-#define	EI_PAD		8
+#define EI_MAG0     0       /* e_ident[] indexes */
+#define EI_MAG1     1
+#define EI_MAG2     2
+#define EI_MAG3     3
+#define EI_CLASS    4
+#define EI_DATA     5
+#define EI_VERSION  6
+#define EI_OSABI    7
+#define EI_PAD      8
 
 #define ELFOSABI_NONE           0       /* UNIX System V ABI */
 #define ELFOSABI_SYSV           0       /* Alias.  */
@@ -1622,53 +1622,53 @@ typedef struct elf64_shdr {
 #define ELFOSABI_ARM            97      /* ARM */
 #define ELFOSABI_STANDALONE     255     /* Standalone (embedded) application */
 
-#define	ELFMAG0		0x7f		/* EI_MAG */
-#define	ELFMAG1		'E'
-#define	ELFMAG2		'L'
-#define	ELFMAG3		'F'
-#define	ELFMAG		"\177ELF"
-#define	SELFMAG		4
+#define ELFMAG0         0x7f        /* EI_MAG */
+#define ELFMAG1         'E'
+#define ELFMAG2         'L'
+#define ELFMAG3         'F'
+#define ELFMAG          "\177ELF"
+#define SELFMAG         4
 
-#define	ELFCLASSNONE	0		/* EI_CLASS */
-#define	ELFCLASS32	1
-#define	ELFCLASS64	2
-#define	ELFCLASSNUM	3
+#define ELFCLASSNONE    0   /* EI_CLASS */
+#define ELFCLASS32      1
+#define ELFCLASS64      2
+#define ELFCLASSNUM     3
 
-#define ELFDATANONE	0		/* e_ident[EI_DATA] */
-#define ELFDATA2LSB	1
-#define ELFDATA2MSB	2
+#define ELFDATANONE     0   /* e_ident[EI_DATA] */
+#define ELFDATA2LSB     1
+#define ELFDATA2MSB     2
 
-#define EV_NONE		0		/* e_version, EI_VERSION */
-#define EV_CURRENT	1
-#define EV_NUM		2
+#define EV_NONE         0   /* e_version, EI_VERSION */
+#define EV_CURRENT      1
+#define EV_NUM          2
 
 /* Notes used in ET_CORE */
-#define NT_PRSTATUS	1
-#define NT_FPREGSET     2
-#define NT_PRFPREG	2
-#define NT_PRPSINFO	3
-#define NT_TASKSTRUCT	4
-#define NT_AUXV		6
-#define NT_PRXFPREG     0x46e62b7f      /* copied from gdb5.1/include/elf/common.h */
-#define NT_S390_PV_CPU_DATA	0x30e	/* s390 protvirt cpu dump data */
-#define NT_S390_RI_CB	0x30d		/* s390 runtime instrumentation */
-#define NT_S390_GS_CB   0x30b           /* s390 guarded storage registers */
-#define NT_S390_VXRS_HIGH 0x30a         /* s390 vector registers 16-31 */
-#define NT_S390_VXRS_LOW  0x309         /* s390 vector registers 0-15 (lower half) */
-#define NT_S390_PREFIX  0x305           /* s390 prefix register */
-#define NT_S390_CTRS    0x304           /* s390 control registers */
-#define NT_S390_TODPREG 0x303           /* s390 TOD programmable register */
-#define NT_S390_TODCMP  0x302           /* s390 TOD clock comparator register */
-#define NT_S390_TIMER   0x301           /* s390 timer register */
-#define NT_PPC_VMX       0x100          /* PowerPC Altivec/VMX registers */
-#define NT_PPC_SPE       0x101          /* PowerPC SPE/EVR registers */
-#define NT_PPC_VSX       0x102          /* PowerPC VSX registers */
-#define NT_ARM_VFP      0x400           /* ARM VFP/NEON registers */
-#define NT_ARM_TLS      0x401           /* ARM TLS register */
-#define NT_ARM_HW_BREAK 0x402           /* ARM hardware breakpoint registers */
-#define NT_ARM_HW_WATCH 0x403           /* ARM hardware watchpoint registers */
-#define NT_ARM_SYSTEM_CALL      0x404   /* ARM system call number */
-#define NT_ARM_SVE      0x405           /* ARM Scalable Vector Extension regs */
+#define NT_PRSTATUS         1
+#define NT_FPREGSET         2
+#define NT_PRFPREG          2
+#define NT_PRPSINFO         3
+#define NT_TASKSTRUCT       4
+#define NT_AUXV             6
+#define NT_PRXFPREG         0x46e62b7f  /* copied from gdb5.1/include/elf/common.h */
+#define NT_S390_PV_CPU_DATA 0x30e       /* s390 protvirt cpu dump data */
+#define NT_S390_RI_CB       0x30d       /* s390 runtime instrumentation */
+#define NT_S390_GS_CB       0x30b       /* s390 guarded storage registers */
+#define NT_S390_VXRS_HIGH   0x30a       /* s390 vector registers 16-31 */
+#define NT_S390_VXRS_LOW    0x309       /* s390 vector registers 0-15 (lower half) */
+#define NT_S390_PREFIX      0x305       /* s390 prefix register */
+#define NT_S390_CTRS        0x304       /* s390 control registers */
+#define NT_S390_TODPREG     0x303       /* s390 TOD programmable register */
+#define NT_S390_TODCMP      0x302       /* s390 TOD clock comparator register */
+#define NT_S390_TIMER       0x301       /* s390 timer register */
+#define NT_PPC_VMX          0x100       /* PowerPC Altivec/VMX registers */
+#define NT_PPC_SPE          0x101       /* PowerPC SPE/EVR registers */
+#define NT_PPC_VSX          0x102       /* PowerPC VSX registers */
+#define NT_ARM_VFP          0x400       /* ARM VFP/NEON registers */
+#define NT_ARM_TLS          0x401       /* ARM TLS register */
+#define NT_ARM_HW_BREAK     0x402       /* ARM hardware breakpoint registers */
+#define NT_ARM_HW_WATCH     0x403       /* ARM hardware watchpoint registers */
+#define NT_ARM_SYSTEM_CALL  0x404       /* ARM system call number */
+#define NT_ARM_SVE          0x405       /* ARM Scalable Vector Extension regs */
 
 /* Defined note types for GNU systems.  */
 
@@ -1701,16 +1701,16 @@ typedef struct elf64_shdr {
 
 /* Note header in a PT_NOTE section */
 typedef struct elf32_note {
-  Elf32_Word	n_namesz;	/* Name size */
-  Elf32_Word	n_descsz;	/* Content size */
-  Elf32_Word	n_type;		/* Content type */
+  Elf32_Word n_namesz;   /* Name size */
+  Elf32_Word n_descsz;   /* Content size */
+  Elf32_Word n_type;     /* Content type */
 } Elf32_Nhdr;
 
 /* Note header in a PT_NOTE section */
 typedef struct elf64_note {
-  Elf64_Word n_namesz;	/* Name size */
-  Elf64_Word n_descsz;	/* Content size */
-  Elf64_Word n_type;	/* Content type */
+  Elf64_Word n_namesz;  /* Name size */
+  Elf64_Word n_descsz;  /* Content size */
+  Elf64_Word n_type;    /* Content type */
 } Elf64_Nhdr;
 
 
@@ -1735,13 +1735,13 @@ struct elf32_fdpic_loadmap {
 #ifdef ELF_CLASS
 #if ELF_CLASS == ELFCLASS32
 
-#define elfhdr		elf32_hdr
-#define elf_phdr	elf32_phdr
-#define elf_note	elf32_note
-#define elf_shdr	elf32_shdr
-#define elf_sym		elf32_sym
-#define elf_addr_t	Elf32_Off
-#define elf_rela  elf32_rela
+#define elfhdr      elf32_hdr
+#define elf_phdr    elf32_phdr
+#define elf_note    elf32_note
+#define elf_shdr    elf32_shdr
+#define elf_sym     elf32_sym
+#define elf_addr_t  Elf32_Off
+#define elf_rela    elf32_rela
 
 #ifdef ELF_USES_RELOCA
 # define ELF_RELOC      Elf32_Rela
@@ -1751,13 +1751,13 @@ struct elf32_fdpic_loadmap {
 
 #else
 
-#define elfhdr		elf64_hdr
-#define elf_phdr	elf64_phdr
-#define elf_note	elf64_note
-#define elf_shdr	elf64_shdr
-#define elf_sym		elf64_sym
-#define elf_addr_t	Elf64_Off
-#define elf_rela  elf64_rela
+#define elfhdr      elf64_hdr
+#define elf_phdr    elf64_phdr
+#define elf_note    elf64_note
+#define elf_shdr    elf64_shdr
+#define elf_sym     elf64_sym
+#define elf_addr_t  Elf64_Off
+#define elf_rela    elf64_rela
 
 #ifdef ELF_USES_RELOCA
 # define ELF_RELOC      Elf64_Rela
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 2eb1176538..548be9c8ea 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -25,7 +25,7 @@
 #include "hw/core/cpu.h"
 #include "qemu/rcu.h"
 
-#define EXCP_INTERRUPT 	0x10000 /* async interruption */
+#define EXCP_INTERRUPT  0x10000 /* async interruption */
 #define EXCP_HLT        0x10001 /* hlt instruction reached */
 #define EXCP_DEBUG      0x10002 /* cpu stopped after a breakpoint or singlestep */
 #define EXCP_HALTED     0x10003 /* cpu is halted (waiting for external event) */
diff --git a/include/hw/acpi/acpi.h b/include/hw/acpi/acpi.h
index cc0d370745..e0e51e85b4 100644
--- a/include/hw/acpi/acpi.h
+++ b/include/hw/acpi/acpi.h
@@ -66,7 +66,7 @@
 #define ACPI_BITMASK_POWER_BUTTON_STATUS        0x0100
 #define ACPI_BITMASK_SLEEP_BUTTON_STATUS        0x0200
 #define ACPI_BITMASK_RT_CLOCK_STATUS            0x0400
-#define ACPI_BITMASK_PCIEXP_WAKE_STATUS         0x4000	/* ACPI 3.0 */
+#define ACPI_BITMASK_PCIEXP_WAKE_STATUS         0x4000  /* ACPI 3.0 */
 #define ACPI_BITMASK_WAKE_STATUS                0x8000
 
 #define ACPI_BITMASK_ALL_FIXED_STATUS           (\
@@ -84,7 +84,7 @@
 #define ACPI_BITMASK_POWER_BUTTON_ENABLE        0x0100
 #define ACPI_BITMASK_SLEEP_BUTTON_ENABLE        0x0200
 #define ACPI_BITMASK_RT_CLOCK_ENABLE            0x0400
-#define ACPI_BITMASK_PCIEXP_WAKE_DISABLE        0x4000	/* ACPI 3.0 */
+#define ACPI_BITMASK_PCIEXP_WAKE_DISABLE        0x4000  /* ACPI 3.0 */
 
 #define ACPI_BITMASK_PM1_COMMON_ENABLED         ( \
         ACPI_BITMASK_RT_CLOCK_ENABLE        | \
diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
index fbe0b1e956..dffb0e73d2 100644
--- a/include/hw/elf_ops.h
+++ b/include/hw/elf_ops.h
@@ -1,30 +1,30 @@
 static void glue(bswap_ehdr, SZ)(struct elfhdr *ehdr)
 {
-    bswap16s(&ehdr->e_type);			/* Object file type */
-    bswap16s(&ehdr->e_machine);		/* Architecture */
-    bswap32s(&ehdr->e_version);		/* Object file version */
-    bswapSZs(&ehdr->e_entry);		/* Entry point virtual address */
-    bswapSZs(&ehdr->e_phoff);		/* Program header table file offset */
-    bswapSZs(&ehdr->e_shoff);		/* Section header table file offset */
-    bswap32s(&ehdr->e_flags);		/* Processor-specific flags */
-    bswap16s(&ehdr->e_ehsize);		/* ELF header size in bytes */
-    bswap16s(&ehdr->e_phentsize);		/* Program header table entry size */
-    bswap16s(&ehdr->e_phnum);		/* Program header table entry count */
-    bswap16s(&ehdr->e_shentsize);		/* Section header table entry size */
-    bswap16s(&ehdr->e_shnum);		/* Section header table entry count */
-    bswap16s(&ehdr->e_shstrndx);		/* Section header string table index */
+    bswap16s(&ehdr->e_type);      /* Object file type */
+    bswap16s(&ehdr->e_machine);   /* Architecture */
+    bswap32s(&ehdr->e_version);   /* Object file version */
+    bswapSZs(&ehdr->e_entry);     /* Entry point virtual address */
+    bswapSZs(&ehdr->e_phoff);     /* Program header table file offset */
+    bswapSZs(&ehdr->e_shoff);     /* Section header table file offset */
+    bswap32s(&ehdr->e_flags);     /* Processor-specific flags */
+    bswap16s(&ehdr->e_ehsize);    /* ELF header size in bytes */
+    bswap16s(&ehdr->e_phentsize); /* Program header table entry size */
+    bswap16s(&ehdr->e_phnum);     /* Program header table entry count */
+    bswap16s(&ehdr->e_shentsize); /* Section header table entry size */
+    bswap16s(&ehdr->e_shnum);     /* Section header table entry count */
+    bswap16s(&ehdr->e_shstrndx);  /* Section header string table index */
 }
 
 static void glue(bswap_phdr, SZ)(struct elf_phdr *phdr)
 {
-    bswap32s(&phdr->p_type);			/* Segment type */
-    bswapSZs(&phdr->p_offset);		/* Segment file offset */
-    bswapSZs(&phdr->p_vaddr);		/* Segment virtual address */
-    bswapSZs(&phdr->p_paddr);		/* Segment physical address */
-    bswapSZs(&phdr->p_filesz);		/* Segment size in file */
-    bswapSZs(&phdr->p_memsz);		/* Segment size in memory */
-    bswap32s(&phdr->p_flags);		/* Segment flags */
-    bswapSZs(&phdr->p_align);		/* Segment alignment */
+    bswap32s(&phdr->p_type);   /* Segment type */
+    bswapSZs(&phdr->p_offset); /* Segment file offset */
+    bswapSZs(&phdr->p_vaddr);  /* Segment virtual address */
+    bswapSZs(&phdr->p_paddr);  /* Segment physical address */
+    bswapSZs(&phdr->p_filesz); /* Segment size in file */
+    bswapSZs(&phdr->p_memsz);  /* Segment size in memory */
+    bswap32s(&phdr->p_flags);  /* Segment flags */
+    bswapSZs(&phdr->p_align);  /* Segment alignment */
 }
 
 static void glue(bswap_shdr, SZ)(struct elf_shdr *shdr)
diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
index 63a7521567..68b88ec5e4 100644
--- a/include/hw/pci/pci_bridge.h
+++ b/include/hw/pci/pci_bridge.h
@@ -136,11 +136,11 @@ void pci_bridge_map_irq(PCIBridge *br, const char* bus_name,
                         pci_map_irq_fn map_irq);
 
 /* TODO: add this define to pci_regs.h in linux and then in qemu. */
-#define  PCI_BRIDGE_CTL_VGA_16BIT	0x10	/* VGA 16-bit decode */
-#define  PCI_BRIDGE_CTL_DISCARD		0x100	/* Primary discard timer */
-#define  PCI_BRIDGE_CTL_SEC_DISCARD	0x200	/* Secondary discard timer */
-#define  PCI_BRIDGE_CTL_DISCARD_STATUS	0x400	/* Discard timer status */
-#define  PCI_BRIDGE_CTL_DISCARD_SERR	0x800	/* Discard timer SERR# enable */
+#define  PCI_BRIDGE_CTL_VGA_16BIT       0x10    /* VGA 16-bit decode */
+#define  PCI_BRIDGE_CTL_DISCARD         0x100   /* Primary discard timer */
+#define  PCI_BRIDGE_CTL_SEC_DISCARD     0x200   /* Secondary discard timer */
+#define  PCI_BRIDGE_CTL_DISCARD_STATUS  0x400   /* Discard timer status */
+#define  PCI_BRIDGE_CTL_DISCARD_SERR    0x800   /* Discard timer SERR# enable */
 
 typedef struct PCIBridgeQemuCap {
     uint8_t id;     /* Standard PCI capability header field */
diff --git a/include/hw/pcmcia.h b/include/hw/pcmcia.h
index e3ba44e0bf..ab26802751 100644
--- a/include/hw/pcmcia.h
+++ b/include/hw/pcmcia.h
@@ -43,22 +43,22 @@ struct PCMCIACardClass {
     void (*io_write)(PCMCIACardState *card, uint32_t address, uint16_t value);
 };
 
-#define CISTPL_DEVICE		0x01	/* 5V Device Information Tuple */
-#define CISTPL_NO_LINK		0x14	/* No Link Tuple */
-#define CISTPL_VERS_1		0x15	/* Level 1 Version Tuple */
-#define CISTPL_JEDEC_C		0x18	/* JEDEC ID Tuple */
-#define CISTPL_JEDEC_A		0x19	/* JEDEC ID Tuple */
-#define CISTPL_CONFIG		0x1a	/* Configuration Tuple */
-#define CISTPL_CFTABLE_ENTRY	0x1b	/* 16-bit PCCard Configuration */
-#define CISTPL_DEVICE_OC	0x1c	/* Additional Device Information */
-#define CISTPL_DEVICE_OA	0x1d	/* Additional Device Information */
-#define CISTPL_DEVICE_GEO	0x1e	/* Additional Device Information */
-#define CISTPL_DEVICE_GEO_A	0x1f	/* Additional Device Information */
-#define CISTPL_MANFID		0x20	/* Manufacture ID Tuple */
-#define CISTPL_FUNCID		0x21	/* Function ID Tuple */
-#define CISTPL_FUNCE		0x22	/* Function Extension Tuple */
-#define CISTPL_END		0xff	/* Tuple End */
-#define CISTPL_ENDMARK		0xff
+#define CISTPL_DEVICE         0x01  /* 5V Device Information Tuple */
+#define CISTPL_NO_LINK        0x14  /* No Link Tuple */
+#define CISTPL_VERS_1         0x15  /* Level 1 Version Tuple */
+#define CISTPL_JEDEC_C        0x18  /* JEDEC ID Tuple */
+#define CISTPL_JEDEC_A        0x19  /* JEDEC ID Tuple */
+#define CISTPL_CONFIG         0x1a  /* Configuration Tuple */
+#define CISTPL_CFTABLE_ENTRY  0x1b  /* 16-bit PCCard Configuration */
+#define CISTPL_DEVICE_OC      0x1c  /* Additional Device Information */
+#define CISTPL_DEVICE_OA      0x1d  /* Additional Device Information */
+#define CISTPL_DEVICE_GEO     0x1e  /* Additional Device Information */
+#define CISTPL_DEVICE_GEO_A   0x1f  /* Additional Device Information */
+#define CISTPL_MANFID         0x20  /* Manufacture ID Tuple */
+#define CISTPL_FUNCID         0x21  /* Function ID Tuple */
+#define CISTPL_FUNCE          0x22  /* Function Extension Tuple */
+#define CISTPL_END            0xff  /* Tuple End */
+#define CISTPL_ENDMARK        0xff
 
 /* dscm1xxxx.c */
 PCMCIACardState *dscm1xxxx_init(DriveInfo *bdrv);
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 6ea4b64fe7..6f23a7a73e 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -8,7 +8,7 @@
 #include "qemu/notify.h"
 #include "qom/object.h"
 
-#define MAX_SCSI_DEVS	255
+#define MAX_SCSI_DEVS 255
 
 typedef struct SCSIBus SCSIBus;
 typedef struct SCSIBusInfo SCSIBusInfo;
diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index 47360ba4ee..3047adb2fc 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -77,10 +77,10 @@ typedef enum  {
 
 typedef enum {
     sd_none = -1,
-    sd_bc = 0,	/* broadcast -- no response */
-    sd_bcr,	/* broadcast with response */
-    sd_ac,	/* addressed -- no data transfer */
-    sd_adtc,	/* addressed with data transfer */
+    sd_bc = 0, /* broadcast -- no response */
+    sd_bcr,    /* broadcast with response */
+    sd_ac,     /* addressed -- no data transfer */
+    sd_adtc,   /* addressed with data transfer */
 } sd_cmd_type_t;
 
 typedef struct {
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 77c6c55929..f236e94ca6 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -29,7 +29,7 @@
  * vhost-user to advertise VHOST_USER_F_PROTOCOL_FEATURES between QEMU
  * and a vhost-user backend.
  */
-#define VIRTIO_F_BAD_FEATURE		30
+#define VIRTIO_F_BAD_FEATURE 30
 
 #define VIRTIO_LEGACY_FEATURES ((0x1ULL << VIRTIO_F_BAD_FEATURE) | \
                                 (0x1ULL << VIRTIO_F_NOTIFY_ON_EMPTY) | \
diff --git a/include/qemu/bitmap.h b/include/qemu/bitmap.h
index 3ccb00865f..97806811ee 100644
--- a/include/qemu/bitmap.h
+++ b/include/qemu/bitmap.h
@@ -22,23 +22,23 @@
  * Note that nbits should be always a compile time evaluable constant.
  * Otherwise many inlines will generate horrible code.
  *
- * bitmap_zero(dst, nbits)			*dst = 0UL
- * bitmap_fill(dst, nbits)			*dst = ~0UL
- * bitmap_copy(dst, src, nbits)			*dst = *src
- * bitmap_and(dst, src1, src2, nbits)		*dst = *src1 & *src2
- * bitmap_or(dst, src1, src2, nbits)		*dst = *src1 | *src2
- * bitmap_xor(dst, src1, src2, nbits)		*dst = *src1 ^ *src2
- * bitmap_andnot(dst, src1, src2, nbits)	*dst = *src1 & ~(*src2)
- * bitmap_complement(dst, src, nbits)		*dst = ~(*src)
- * bitmap_equal(src1, src2, nbits)		Are *src1 and *src2 equal?
+ * bitmap_zero(dst, nbits)                      *dst = 0UL
+ * bitmap_fill(dst, nbits)                      *dst = ~0UL
+ * bitmap_copy(dst, src, nbits)                 *dst = *src
+ * bitmap_and(dst, src1, src2, nbits)           *dst = *src1 & *src2
+ * bitmap_or(dst, src1, src2, nbits)            *dst = *src1 | *src2
+ * bitmap_xor(dst, src1, src2, nbits)           *dst = *src1 ^ *src2
+ * bitmap_andnot(dst, src1, src2, nbits)        *dst = *src1 & ~(*src2)
+ * bitmap_complement(dst, src, nbits)           *dst = ~(*src)
+ * bitmap_equal(src1, src2, nbits)              Are *src1 and *src2 equal?
  * bitmap_intersects(src1, src2, nbits)         Do *src1 and *src2 overlap?
- * bitmap_empty(src, nbits)			Are all bits zero in *src?
- * bitmap_full(src, nbits)			Are all bits set in *src?
- * bitmap_set(dst, pos, nbits)			Set specified bit area
- * bitmap_set_atomic(dst, pos, nbits)   Set specified bit area with atomic ops
- * bitmap_clear(dst, pos, nbits)		Clear specified bit area
+ * bitmap_empty(src, nbits)                     Are all bits zero in *src?
+ * bitmap_full(src, nbits)                      Are all bits set in *src?
+ * bitmap_set(dst, pos, nbits)                  Set specified bit area
+ * bitmap_set_atomic(dst, pos, nbits)           Set specified bit area with atomic ops
+ * bitmap_clear(dst, pos, nbits)                Clear specified bit area
  * bitmap_test_and_clear_atomic(dst, pos, nbits)    Test and clear area
- * bitmap_find_next_zero_area(buf, len, pos, n, mask)	Find bit free area
+ * bitmap_find_next_zero_area(buf, len, pos, n, mask)  Find bit free area
  * bitmap_to_le(dst, src, nbits)      Convert bitmap to little endian
  * bitmap_from_le(dst, src, nbits)    Convert bitmap from little endian
  * bitmap_copy_with_src_offset(dst, src, offset, nbits)
@@ -50,17 +50,17 @@
 /*
  * Also the following operations apply to bitmaps.
  *
- * set_bit(bit, addr)			*addr |= bit
- * clear_bit(bit, addr)			*addr &= ~bit
- * change_bit(bit, addr)		*addr ^= bit
- * test_bit(bit, addr)			Is bit set in *addr?
- * test_and_set_bit(bit, addr)		Set bit and return old value
- * test_and_clear_bit(bit, addr)	Clear bit and return old value
- * test_and_change_bit(bit, addr)	Change bit and return old value
- * find_first_zero_bit(addr, nbits)	Position first zero bit in *addr
- * find_first_bit(addr, nbits)		Position first set bit in *addr
- * find_next_zero_bit(addr, nbits, bit)	Position next zero bit in *addr >= bit
- * find_next_bit(addr, nbits, bit)	Position next set bit in *addr >= bit
+ * set_bit(bit, addr)               *addr |= bit
+ * clear_bit(bit, addr)             *addr &= ~bit
+ * change_bit(bit, addr)            *addr ^= bit
+ * test_bit(bit, addr)              Is bit set in *addr?
+ * test_and_set_bit(bit, addr)      Set bit and return old value
+ * test_and_clear_bit(bit, addr)    Clear bit and return old value
+ * test_and_change_bit(bit, addr)   Change bit and return old value
+ * find_first_zero_bit(addr, nbits) Position first zero bit in *addr
+ * find_first_bit(addr, nbits)      Position first set bit in *addr
+ * find_next_zero_bit(addr, nbits, bit) Position next zero bit in *addr >= bit
+ * find_next_bit(addr, nbits, bit)  Position next set bit in *addr >= bit
  */
 
 #define BITMAP_FIRST_WORD_MASK(start) (~0UL << ((start) & (BITS_PER_LONG - 1)))
diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index f20a76e4a2..c2f49df1f9 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -33,8 +33,8 @@
 #ifndef glue
 #define xglue(x, y) x ## y
 #define glue(x, y) xglue(x, y)
-#define stringify(s)	tostring(s)
-#define tostring(s)	#s
+#define stringify(s) tostring(s)
+#define tostring(s) #s
 #endif
 
 #ifndef likely
diff --git a/include/qemu/uri.h b/include/qemu/uri.h
index 3ad211d676..b43f35a6a6 100644
--- a/include/qemu/uri.h
+++ b/include/qemu/uri.h
@@ -59,16 +59,16 @@
  * as described in RFC 2396 but separated for further processing.
  */
 typedef struct URI {
-    char *scheme;	/* the URI scheme */
-    char *opaque;	/* opaque part */
-    char *authority;	/* the authority part */
-    char *server;	/* the server part */
-    char *user;		/* the user part */
-    int port;		/* the port number */
-    char *path;		/* the path string */
-    char *fragment;	/* the fragment identifier */
-    int  cleanup;	/* parsing potentially unclean URI */
-    char *query;	/* the query string (as it appears in the URI) */
+    char *scheme;      /* the URI scheme */
+    char *opaque;      /* opaque part */
+    char *authority;   /* the authority part */
+    char *server;      /* the server part */
+    char *user;        /* the user part */
+    int port;          /* the port number */
+    char *path;        /* the path string */
+    char *fragment;    /* the fragment identifier */
+    int cleanup;       /* parsing potentially unclean URI */
+    char *query;       /* the query string (as it appears in the URI) */
 } URI;
 
 URI *uri_new(void);
@@ -84,16 +84,16 @@ void uri_free(URI *uri);
 
 /* Single web service query parameter 'name=value'. */
 typedef struct QueryParam {
-  char *name;			/* Name (unescaped). */
-  char *value;			/* Value (unescaped). */
-  int ignore;			/* Ignore this field in qparam_get_query */
+  char *name;          /* Name (unescaped). */
+  char *value;         /* Value (unescaped). */
+  int ignore;          /* Ignore this field in qparam_get_query */
 } QueryParam;
 
 /* Set of parameters. */
 typedef struct QueryParams {
-  int n;			/* number of parameters used */
-  int alloc;			/* allocated space */
-  QueryParam *p;		/* array of parameters */
+  int n;               /* number of parameters used */
+  int alloc;           /* allocated space */
+  QueryParam *p;       /* array of parameters */
 } QueryParams;
 
 struct QueryParams *query_params_new (int init_alloc);
diff --git a/pc-bios/optionrom/optionrom.h b/pc-bios/optionrom/optionrom.h
index 8d74c0ddf3..7bcdf0eeb2 100644
--- a/pc-bios/optionrom/optionrom.h
+++ b/pc-bios/optionrom/optionrom.h
@@ -34,8 +34,8 @@
 #define FW_CFG_SETUP_SIZE       0x17
 #define FW_CFG_SETUP_DATA       0x18
 
-#define BIOS_CFG_IOPORT_CFG	0x510
-#define BIOS_CFG_IOPORT_DATA	0x511
+#define BIOS_CFG_IOPORT_CFG    0x510
+#define BIOS_CFG_IOPORT_DATA   0x511
 
 #define FW_CFG_DMA_CTL_ERROR   0x01
 #define FW_CFG_DMA_CTL_READ    0x02
@@ -49,65 +49,65 @@
 #define BIOS_CFG_DMA_ADDR_LOW   0x518
 
 /* Break the translation block flow so -d cpu shows us values */
-#define DEBUG_HERE \
-	jmp		1f;				\
-	1:
-	
+#define DEBUG_HERE              \
+        jmp         1f;         \
+        1:
+
 /*
  * Read a variable from the fw_cfg device.
- * Clobbers:	%edx
- * Out:		%eax
+ * Clobbers: %edx
+ * Out: %eax
  */
 .macro read_fw VAR
-	mov		$\VAR, %ax
-	mov		$BIOS_CFG_IOPORT_CFG, %dx
-	outw		%ax, (%dx)
-	mov		$BIOS_CFG_IOPORT_DATA, %dx
-	inb		(%dx), %al
-	shl		$8, %eax
-	inb		(%dx), %al
-	shl		$8, %eax
-	inb		(%dx), %al
-	shl		$8, %eax
-	inb		(%dx), %al
-	bswap		%eax
+        mov         $\VAR, %ax
+        mov         $BIOS_CFG_IOPORT_CFG, %dx
+        outw        %ax, (%dx)
+        mov         $BIOS_CFG_IOPORT_DATA, %dx
+        inb         (%dx), %al
+        shl         $8, %eax
+        inb         (%dx), %al
+        shl         $8, %eax
+        inb         (%dx), %al
+        shl         $8, %eax
+        inb         (%dx), %al
+        bswap       %eax
 .endm
 
 
 /*
  * Read data from the fw_cfg device using DMA.
- * Clobbers:	%edx, %eax, ADDR, SIZE, memory[%esp-16] to memory[%esp]
+ * Clobbers: %edx, %eax, ADDR, SIZE, memory[%esp-16] to memory[%esp]
  */
 .macro read_fw_dma VAR, SIZE, ADDR
         /* Address */
-	bswapl		\ADDR
-	pushl		\ADDR
+        bswapl      \ADDR
+        pushl       \ADDR
 
-	/* We only support 32 bit target addresses */
-	xorl		%eax, %eax
-	pushl		%eax
-	mov		$BIOS_CFG_DMA_ADDR_HIGH, %dx
-	outl		%eax, (%dx)
+        /* We only support 32 bit target addresses */
+        xorl        %eax, %eax
+        pushl       %eax
+        mov         $BIOS_CFG_DMA_ADDR_HIGH, %dx
+        outl        %eax, (%dx)
 
-	/* Size */
-	bswapl		\SIZE
-	pushl		\SIZE
+        /* Size */
+        bswapl      \SIZE
+        pushl       \SIZE
 
         /* Control */
-	movl		$(\VAR << 16) | (FW_CFG_DMA_CTL_READ | FW_CFG_DMA_CTL_SELECT), %eax
-	bswapl		%eax
-	pushl		%eax
-
-	movl		%esp, %eax /* Address of the struct we generated */
-	bswapl		%eax
-	mov		$BIOS_CFG_DMA_ADDR_LOW, %dx
-	outl		%eax, (%dx) /* Initiate DMA */
-
-1:  mov		(%esp), %eax /* Wait for completion */
-	bswapl		%eax
-	testl		$~FW_CFG_DMA_CTL_ERROR, %eax
-	jnz		1b
-       addl            $16, %esp
+        movl        $(\VAR << 16) | (FW_CFG_DMA_CTL_READ | FW_CFG_DMA_CTL_SELECT), %eax
+        bswapl      %eax
+        pushl       %eax
+
+        movl        %esp, %eax /* Address of the struct we generated */
+        bswapl      %eax
+        mov         $BIOS_CFG_DMA_ADDR_LOW, %dx
+        outl        %eax, (%dx) /* Initiate DMA */
+
+1:      mov         (%esp), %eax /* Wait for completion */
+        bswapl      %eax
+        testl       $~FW_CFG_DMA_CTL_ERROR, %eax
+        jnz         1b
+        addl        $16, %esp
 .endm
 
 
@@ -115,116 +115,116 @@
  * Read a blob from the fw_cfg device using DMA
  * Requires _ADDR, _SIZE and _DATA values for the parameter.
  *
- * Clobbers:	%eax, %edx, %es, %ecx, %edi and adresses %esp-20 to %esp
+ * Clobbers: %eax, %edx, %es, %ecx, %edi and adresses %esp-20 to %esp
  */
 #ifdef USE_FW_CFG_DMA
-#define read_fw_blob_dma(var) \
-	read_fw		var ## _SIZE; \
-	mov		%eax, %ecx; \
-	read_fw		var ## _ADDR; \
-	mov		%eax, %edi ;\
-	read_fw_dma	var ## _DATA, %ecx, %edi
+#define read_fw_blob_dma(var)                           \
+        read_fw         var ## _SIZE;                   \
+        mov             %eax, %ecx;                     \
+        read_fw         var ## _ADDR;                   \
+        mov             %eax, %edi ;                    \
+        read_fw_dma     var ## _DATA, %ecx, %edi
 #else
 #define read_fw_blob_dma(var) read_fw_blob(var)
 #endif
 
-#define read_fw_blob_pre(var)				\
-	read_fw		var ## _SIZE;			\
-	mov		%eax, %ecx;			\
-	mov		$var ## _DATA, %ax;		\
-	mov		$BIOS_CFG_IOPORT_CFG, %edx;	\
-	outw		%ax, (%dx);			\
-	mov		$BIOS_CFG_IOPORT_DATA, %dx;	\
-	cld
+#define read_fw_blob_pre(var)                           \
+        read_fw         var ## _SIZE;                   \
+        mov             %eax, %ecx;                     \
+        mov             $var ## _DATA, %ax;             \
+        mov             $BIOS_CFG_IOPORT_CFG, %edx;     \
+        outw            %ax, (%dx);                     \
+        mov             $BIOS_CFG_IOPORT_DATA, %dx;     \
+        cld
 
 /*
  * Read a blob from the fw_cfg device.
  * Requires _ADDR, _SIZE and _DATA values for the parameter.
  *
- * Clobbers:	%eax, %edx, %es, %ecx, %edi
+ * Clobbers: %eax, %edx, %es, %ecx, %edi
  */
-#define read_fw_blob(var)				\
-	read_fw		var ## _ADDR;			\
-	mov		%eax, %edi;			\
-	read_fw_blob_pre(var);				\
-	/* old as(1) doesn't like this insn so emit the bytes instead: \
-	rep insb	(%dx), %es:(%edi);		\
-	*/						\
-	.dc.b		0xf3,0x6c
+#define read_fw_blob(var)                               \
+        read_fw         var ## _ADDR;                   \
+        mov             %eax, %edi;                     \
+        read_fw_blob_pre(var);                          \
+        /* old as(1) doesn't like this insn so emit the bytes instead: \
+        rep insb        (%dx), %es:(%edi);              \
+        */                                              \
+        .dc.b           0xf3,0x6c
 
 /*
  * Read a blob from the fw_cfg device in forced addr32 mode.
  * Requires _ADDR, _SIZE and _DATA values for the parameter.
  *
- * Clobbers:	%eax, %edx, %es, %ecx, %edi
+ * Clobbers: %eax, %edx, %es, %ecx, %edi
  */
-#define read_fw_blob_addr32(var)			\
-	read_fw		var ## _ADDR;			\
-	mov		%eax, %edi;			\
-	read_fw_blob_pre(var);				\
-	/* old as(1) doesn't like this insn so emit the bytes instead: \
-	addr32 rep insb	(%dx), %es:(%edi);		\
-	*/						\
-	.dc.b		0x67,0xf3,0x6c
+#define read_fw_blob_addr32(var)                        \
+        read_fw         var ## _ADDR;                   \
+        mov             %eax, %edi;                     \
+        read_fw_blob_pre(var);                          \
+        /* old as(1) doesn't like this insn so emit the bytes instead: \
+        addr32 rep insb (%dx), %es:(%edi);              \
+        */                                              \
+        .dc.b           0x67,0xf3,0x6c
 
 /*
  * Read a blob from the fw_cfg device in forced addr32 mode, address is in %edi.
  * Requires _SIZE and _DATA values for the parameter.
  *
- * Clobbers:	%eax, %edx, %edi, %es, %ecx
+ * Clobbers: %eax, %edx, %edi, %es, %ecx
  */
-#define read_fw_blob_addr32_edi(var)			\
-	read_fw_blob_pre(var);				\
-	/* old as(1) doesn't like this insn so emit the bytes instead: \
-	addr32 rep insb	(%dx), %es:(%edi);		\
-	*/						\
-	.dc.b		0x67,0xf3,0x6c
-
-#define OPTION_ROM_START					\
-    .code16;						\
-    .text;						\
-	.global 	_start;				\
-    _start:;						\
-	.short		0xaa55;				\
-	.byte		(_end - _start) / 512;
-
-#define BOOT_ROM_START					\
-	OPTION_ROM_START				\
-	lret;						\
-	.org 		0x18;				\
-	.short		0;				\
-	.short		_pnph;				\
-    _pnph:						\
-	.ascii		"$PnP";				\
-	.byte		0x01;				\
-	.byte		( _pnph_len / 16 );		\
-	.short		0x0000;				\
-	.byte		0x00;				\
-	.byte		0x00;				\
-	.long		0x00000000;			\
-	.short		_manufacturer;			\
-	.short		_product;			\
-	.long		0x00000000;			\
-	.short		0x0000;				\
-	.short		0x0000;				\
-	.short		_bev;				\
-	.short		0x0000;				\
-	.short		0x0000;				\
-	.equ		_pnph_len, . - _pnph;		\
-    _bev:;						\
-	/* DS = CS */					\
-	movw		%cs, %ax;			\
-	movw		%ax, %ds;
-
-#define OPTION_ROM_END					\
-	.byte		0;				\
-	.align		512, 0;				\
+#define read_fw_blob_addr32_edi(var)                    \
+        read_fw_blob_pre(var);                          \
+        /* old as(1) doesn't like this insn so emit the bytes instead: \
+        addr32 rep insb (%dx), %es:(%edi);              \
+        */                                              \
+        .dc.b           0x67,0xf3,0x6c
+
+#define OPTION_ROM_START                                \
+    .code16;                                            \
+    .text;                                              \
+        .global         _start;                         \
+    _start:;                                            \
+        .short          0xaa55;                         \
+        .byte           (_end - _start) / 512;
+
+#define BOOT_ROM_START                                  \
+        OPTION_ROM_START                                \
+        lret;                                           \
+        .org            0x18;                           \
+        .short          0;                              \
+        .short          _pnph;                          \
+    _pnph:                                              \
+        .ascii          "$PnP";                         \
+        .byte           0x01;                           \
+        .byte           ( _pnph_len / 16 );             \
+        .short          0x0000;                         \
+        .byte           0x00;                           \
+        .byte           0x00;                           \
+        .long           0x00000000;                     \
+        .short          _manufacturer;                  \
+        .short          _product;                       \
+        .long           0x00000000;                     \
+        .short          0x0000;                         \
+        .short          0x0000;                         \
+        .short          _bev;                           \
+        .short          0x0000;                         \
+        .short          0x0000;                         \
+        .equ            _pnph_len, . - _pnph;           \
+    _bev:;                                              \
+        /* DS = CS */                                   \
+        movw            %cs, %ax;                       \
+        movw            %ax, %ds;
+
+#define OPTION_ROM_END                                  \
+        .byte           0;                              \
+        .align          512, 0;                         \
     _end:
 
-#define BOOT_ROM_END					\
-    _manufacturer:;					\
-	.asciz "QEMU";					\
-    _product:;						\
-	.asciz BOOT_ROM_PRODUCT;			\
-	OPTION_ROM_END
+#define BOOT_ROM_END                                    \
+    _manufacturer:;                                     \
+        .asciz "QEMU";                                  \
+    _product:;                                          \
+        .asciz BOOT_ROM_PRODUCT;                        \
+        OPTION_ROM_END
 
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index a6efd8e8dd..6a944a2258 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -3169,7 +3169,7 @@ int64_t address_space_cache_init(MemoryRegionCache *cache,
      * cache->xlat and the end of the section.
      */
     diff = int128_sub(cache->mrs.size,
-		      int128_make64(cache->xlat - cache->mrs.offset_within_region));
+                      int128_make64(cache->xlat - cache->mrs.offset_within_region));
     l = int128_get64(int128_min(diff, int128_make64(l)));
 
     mr = cache->mrs.mr;
diff --git a/tests/unit/test-rcu-list.c b/tests/unit/test-rcu-list.c
index 9964171da4..8f0adb8b00 100644
--- a/tests/unit/test-rcu-list.c
+++ b/tests/unit/test-rcu-list.c
@@ -151,7 +151,7 @@ static QSLIST_HEAD(, list_element) Q_list_head;
 
 #define TEST_NAME "qslist"
 #define TEST_LIST_REMOVE_RCU(el, f)                              \
-	 QSLIST_REMOVE_RCU(&Q_list_head, el, list_element, f)
+         QSLIST_REMOVE_RCU(&Q_list_head, el, list_element, f)
 
 #define TEST_LIST_INSERT_AFTER_RCU(list_el, el, f)               \
          QSLIST_INSERT_AFTER_RCU(&Q_list_head, list_el, el, f)
diff --git a/util/bitops.c b/util/bitops.c
index 3fe6b1c4f1..4b647b3eff 100644
--- a/util/bitops.c
+++ b/util/bitops.c
@@ -71,8 +71,8 @@ unsigned long find_next_bit(const unsigned long *addr, unsigned long size,
 
 found_first:
     tmp &= (~0UL >> (BITS_PER_LONG - size));
-    if (tmp == 0UL) {		/* Are any bits set? */
-        return result + size;	/* Nope. */
+    if (tmp == 0UL) {           /* Are any bits set? */
+        return result + size;   /* Nope. */
     }
 found_middle:
     return result + ctzl(tmp);
@@ -120,8 +120,8 @@ unsigned long find_next_zero_bit(const unsigned long *addr, unsigned long size,
 
 found_first:
     tmp |= ~0UL << size;
-    if (tmp == ~0UL) {	/* Are any bits zero? */
-        return result + size;	/* Nope. */
+    if (tmp == ~0UL) {          /* Are any bits zero? */
+        return result + size;   /* Nope. */
     }
 found_middle:
     return result + ctzl(~tmp);
diff --git a/util/envlist.c b/util/envlist.c
index ab5553498a..db937c0427 100644
--- a/util/envlist.c
+++ b/util/envlist.c
@@ -3,13 +3,13 @@
 #include "qemu/envlist.h"
 
 struct envlist_entry {
-	const char *ev_var;			/* actual env value */
-	QLIST_ENTRY(envlist_entry) ev_link;
+    const char *ev_var;            /* actual env value */
+    QLIST_ENTRY(envlist_entry) ev_link;
 };
 
 struct envlist {
-	QLIST_HEAD(, envlist_entry) el_entries;	/* actual entries */
-	size_t el_count;			/* number of entries */
+    QLIST_HEAD(, envlist_entry) el_entries; /* actual entries */
+    size_t el_count;                        /* number of entries */
 };
 
 static int envlist_parse(envlist_t *envlist,
@@ -21,14 +21,14 @@ static int envlist_parse(envlist_t *envlist,
 envlist_t *
 envlist_create(void)
 {
-	envlist_t *envlist;
+    envlist_t *envlist;
 
-	envlist = g_malloc(sizeof(*envlist));
+    envlist = g_malloc(sizeof(*envlist));
 
-	QLIST_INIT(&envlist->el_entries);
-	envlist->el_count = 0;
+    QLIST_INIT(&envlist->el_entries);
+    envlist->el_count = 0;
 
-	return (envlist);
+    return (envlist);
 }
 
 /*
@@ -37,18 +37,18 @@ envlist_create(void)
 void
 envlist_free(envlist_t *envlist)
 {
-	struct envlist_entry *entry;
+    struct envlist_entry *entry;
 
-	assert(envlist != NULL);
+    assert(envlist != NULL);
 
-	while (envlist->el_entries.lh_first != NULL) {
-		entry = envlist->el_entries.lh_first;
-		QLIST_REMOVE(entry, ev_link);
+    while (envlist->el_entries.lh_first != NULL) {
+        entry = envlist->el_entries.lh_first;
+        QLIST_REMOVE(entry, ev_link);
 
-		g_free((char *)entry->ev_var);
-		g_free(entry);
-	}
-	g_free(envlist);
+        g_free((char *)entry->ev_var);
+        g_free(entry);
+    }
+    g_free(envlist);
 }
 
 /*
@@ -65,7 +65,7 @@ envlist_free(envlist_t *envlist)
 int
 envlist_parse_set(envlist_t *envlist, const char *env)
 {
-	return (envlist_parse(envlist, env, &envlist_setenv));
+    return (envlist_parse(envlist, env, &envlist_setenv));
 }
 
 /*
@@ -77,7 +77,7 @@ envlist_parse_set(envlist_t *envlist, const char *env)
 int
 envlist_parse_unset(envlist_t *envlist, const char *env)
 {
-	return (envlist_parse(envlist, env, &envlist_unsetenv));
+    return (envlist_parse(envlist, env, &envlist_unsetenv));
 }
 
 /*
@@ -90,15 +90,15 @@ static int
 envlist_parse(envlist_t *envlist, const char *env,
     int (*callback)(envlist_t *, const char *))
 {
-	char *tmpenv, *envvar;
-	char *envsave = NULL;
+    char *tmpenv, *envvar;
+    char *envsave = NULL;
     int ret = 0;
     assert(callback != NULL);
 
-	if ((envlist == NULL) || (env == NULL))
-		return (EINVAL);
+    if ((envlist == NULL) || (env == NULL))
+        return (EINVAL);
 
-	tmpenv = g_strdup(env);
+    tmpenv = g_strdup(env);
     envsave = tmpenv;
 
     do {
@@ -109,7 +109,7 @@ envlist_parse(envlist_t *envlist, const char *env,
         if ((*callback)(envlist, tmpenv) != 0) {
             ret = errno;
             break;
-		}
+        }
         tmpenv = envvar + 1;
     } while (envvar != NULL);
 
@@ -126,42 +126,42 @@ envlist_parse(envlist_t *envlist, const char *env,
 int
 envlist_setenv(envlist_t *envlist, const char *env)
 {
-	struct envlist_entry *entry = NULL;
-	const char *eq_sign;
-	size_t envname_len;
-
-	if ((envlist == NULL) || (env == NULL))
-		return (EINVAL);
-
-	/* find out first equals sign in given env */
-	if ((eq_sign = strchr(env, '=')) == NULL)
-		return (EINVAL);
-	envname_len = eq_sign - env + 1;
-
-	/*
-	 * If there already exists variable with given name
-	 * we remove and release it before allocating a whole
-	 * new entry.
-	 */
-	for (entry = envlist->el_entries.lh_first; entry != NULL;
-	    entry = entry->ev_link.le_next) {
-		if (strncmp(entry->ev_var, env, envname_len) == 0)
-			break;
-	}
-
-	if (entry != NULL) {
-		QLIST_REMOVE(entry, ev_link);
-		g_free((char *)entry->ev_var);
-		g_free(entry);
-	} else {
-		envlist->el_count++;
-	}
-
-	entry = g_malloc(sizeof(*entry));
-	entry->ev_var = g_strdup(env);
-	QLIST_INSERT_HEAD(&envlist->el_entries, entry, ev_link);
-
-	return (0);
+    struct envlist_entry *entry = NULL;
+    const char *eq_sign;
+    size_t envname_len;
+
+    if ((envlist == NULL) || (env == NULL))
+        return (EINVAL);
+
+    /* find out first equals sign in given env */
+    if ((eq_sign = strchr(env, '=')) == NULL)
+        return (EINVAL);
+    envname_len = eq_sign - env + 1;
+
+    /*
+     * If there already exists variable with given name
+     * we remove and release it before allocating a whole
+     * new entry.
+     */
+    for (entry = envlist->el_entries.lh_first; entry != NULL;
+        entry = entry->ev_link.le_next) {
+        if (strncmp(entry->ev_var, env, envname_len) == 0)
+            break;
+    }
+
+    if (entry != NULL) {
+        QLIST_REMOVE(entry, ev_link);
+        g_free((char *)entry->ev_var);
+        g_free(entry);
+    } else {
+        envlist->el_count++;
+    }
+
+    entry = g_malloc(sizeof(*entry));
+    entry->ev_var = g_strdup(env);
+    QLIST_INSERT_HEAD(&envlist->el_entries, entry, ev_link);
+
+    return (0);
 }
 
 /*
@@ -171,34 +171,34 @@ envlist_setenv(envlist_t *envlist, const char *env)
 int
 envlist_unsetenv(envlist_t *envlist, const char *env)
 {
-	struct envlist_entry *entry;
-	size_t envname_len;
-
-	if ((envlist == NULL) || (env == NULL))
-		return (EINVAL);
-
-	/* env is not allowed to contain '=' */
-	if (strchr(env, '=') != NULL)
-		return (EINVAL);
-
-	/*
-	 * Find out the requested entry and remove
-	 * it from the list.
-	 */
-	envname_len = strlen(env);
-	for (entry = envlist->el_entries.lh_first; entry != NULL;
-	    entry = entry->ev_link.le_next) {
-		if (strncmp(entry->ev_var, env, envname_len) == 0)
-			break;
-	}
-	if (entry != NULL) {
-		QLIST_REMOVE(entry, ev_link);
-		g_free((char *)entry->ev_var);
-		g_free(entry);
-
-		envlist->el_count--;
-	}
-	return (0);
+    struct envlist_entry *entry;
+    size_t envname_len;
+
+    if ((envlist == NULL) || (env == NULL))
+        return (EINVAL);
+
+    /* env is not allowed to contain '=' */
+    if (strchr(env, '=') != NULL)
+        return (EINVAL);
+
+    /*
+     * Find out the requested entry and remove
+     * it from the list.
+     */
+    envname_len = strlen(env);
+    for (entry = envlist->el_entries.lh_first; entry != NULL;
+        entry = entry->ev_link.le_next) {
+        if (strncmp(entry->ev_var, env, envname_len) == 0)
+            break;
+    }
+    if (entry != NULL) {
+        QLIST_REMOVE(entry, ev_link);
+        g_free((char *)entry->ev_var);
+        g_free(entry);
+
+        envlist->el_count--;
+    }
+    return (0);
 }
 
 /*
@@ -214,19 +214,19 @@ envlist_unsetenv(envlist_t *envlist, const char *env)
 char **
 envlist_to_environ(const envlist_t *envlist, size_t *count)
 {
-	struct envlist_entry *entry;
-	char **env, **penv;
+    struct envlist_entry *entry;
+    char **env, **penv;
 
-	penv = env = g_new(char *, envlist->el_count + 1);
+    penv = env = g_new(char *, envlist->el_count + 1);
 
-	for (entry = envlist->el_entries.lh_first; entry != NULL;
-	    entry = entry->ev_link.le_next) {
-		*(penv++) = g_strdup(entry->ev_var);
-	}
-	*penv = NULL; /* NULL terminate the list */
+    for (entry = envlist->el_entries.lh_first; entry != NULL;
+        entry = entry->ev_link.le_next) {
+        *(penv++) = g_strdup(entry->ev_var);
+    }
+    *penv = NULL; /* NULL terminate the list */
 
-	if (count != NULL)
-		*count = envlist->el_count;
+    if (count != NULL)
+        *count = envlist->el_count;
 
-	return (env);
+    return (env);
 }
-- 
2.32.0 (Apple Git-132)


