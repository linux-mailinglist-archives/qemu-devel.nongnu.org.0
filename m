Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D63B9301EAF
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 21:20:28 +0100 (CET)
Received: from localhost ([::1]:55036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3ls3-0003Dq-Uk
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 15:20:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3ljR-0002e1-4s; Sun, 24 Jan 2021 15:11:34 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:33072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l3ljO-00084u-Le; Sun, 24 Jan 2021 15:11:32 -0500
Received: by mail-wm1-x32b.google.com with SMTP id s24so9464207wmj.0;
 Sun, 24 Jan 2021 12:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3OV8FpQZtMbRiEAI7cX2EJJqHF9nxbFO5bHAtKy6CfY=;
 b=NpDTGNL/AzYCZoKUGexgB8dX0uunkeWCcLYE/C4jiThfcpWwnAnjECmhbHlF8tLNok
 pzzIgepUJD3tQ9dOiOuzq29JJeqxRKgXcAl/CaohDeoKlOawkEI1nQPZHICdsA0xY+AQ
 n4a93QNMaipbO7Aj4yszU6dKMysAQ1E7Y+IBs08ADZVsk2C+ZSTEYcspyEGvSjf6tuOl
 +VYWaruzePlMu4XyhLyxI8sleGDgW5A956+Z25w38gD/m4W/BBHkM+jUZ1TKh3wIvkqI
 nwDDu7XsiKWZpPeX1bTqE5lh6Lgiy/qEdVR7mXCWDGJ+IHCkW3v7Is6hNY2dlT9DDBtV
 oTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3OV8FpQZtMbRiEAI7cX2EJJqHF9nxbFO5bHAtKy6CfY=;
 b=T7voFDn27tQSh8Uo8m+vUZ5X6axFR+7nrid3x1FUVmo4ujp0bAXIuNFS9ncg44TLu8
 LtFMK0tUrHXcebK2XoVCK4GxjeSl2YQJV6AHnIMYsjimX2JTBq8FYcWiBa262tfr5irc
 10BqiYVKZHOdyVFuQcL+MM5wjVXZoH1/TZcKOoOF8H8LXJwxKoGdg1CqcwpVN+JqoPR7
 ec0oYqQ9LPtoM9LCmqQRKBrE6QvEXmMg3QDLACd+lKxZ6uo2ZB3j7eJoW6PUTh5dKcy3
 opM73RGGhuvyOvri838xmHNzQn+5PlcfJe9p/DIEcwCmzuYSwfB2z1L++ncuWkjTvatP
 5zDg==
X-Gm-Message-State: AOAM532xJj0mRmsHg+E+2Yi1V9XvMbzLTmMUh9+AWmyjVTO6LC0XIi7W
 TSHcs4p5OD9dEEiMjSsKYIodp5p7rms=
X-Google-Smtp-Source: ABdhPJzDDAUB+fwZ4Yl99wsa964gZ0JCgpqH9JOe/5o7skqBv8bzj7bsOp0so/RDd/5CJqKAmt+Yyg==
X-Received: by 2002:a1c:9c84:: with SMTP id f126mr2977629wme.152.1611519088363; 
 Sun, 24 Jan 2021 12:11:28 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id q6sm17856903wmj.32.2021.01.24.12.11.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 12:11:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/9] util: Add CRC16 (CCITT) calculation routines
Date: Sun, 24 Jan 2021 21:11:01 +0100
Message-Id: <20210124201106.2602238-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210124201106.2602238-1-f4bug@amsat.org>
References: <20210124201106.2602238-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Import CRC16 calculation routines from Linux kernel v5.10:

  include/linux/crc-ccitt.h
  lib/crc-ccitt.c

to QEMU:

  include/qemu/crc-ccitt.h
  util/crc-ccitt.c

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20210123104016.17485-7-bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: Restrict compilation to system emulation]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/qemu/crc-ccitt.h |  33 ++++++++++
 util/crc-ccitt.c         | 127 +++++++++++++++++++++++++++++++++++++++
 util/meson.build         |   1 +
 3 files changed, 161 insertions(+)
 create mode 100644 include/qemu/crc-ccitt.h
 create mode 100644 util/crc-ccitt.c

diff --git a/include/qemu/crc-ccitt.h b/include/qemu/crc-ccitt.h
new file mode 100644
index 00000000000..06ee55b159b
--- /dev/null
+++ b/include/qemu/crc-ccitt.h
@@ -0,0 +1,33 @@
+/*
+ * CRC16 (CCITT) Checksum Algorithm
+ *
+ * Copyright (c) 2021 Wind River Systems, Inc.
+ *
+ * Author:
+ *   Bin Meng <bin.meng@windriver.com>
+ *
+ * From Linux kernel v5.10 include/linux/crc-ccitt.h
+ *
+ * SPDX-License-Identifier: GPL-2.0
+ */
+
+#ifndef _CRC_CCITT_H
+#define _CRC_CCITT_H
+
+extern uint16_t const crc_ccitt_table[256];
+extern uint16_t const crc_ccitt_false_table[256];
+
+extern uint16_t crc_ccitt(uint16_t crc, const uint8_t *buffer, size_t len);
+extern uint16_t crc_ccitt_false(uint16_t crc, const uint8_t *buffer, size_t len);
+
+static inline uint16_t crc_ccitt_byte(uint16_t crc, const uint8_t c)
+{
+    return (crc >> 8) ^ crc_ccitt_table[(crc ^ c) & 0xff];
+}
+
+static inline uint16_t crc_ccitt_false_byte(uint16_t crc, const uint8_t c)
+{
+    return (crc << 8) ^ crc_ccitt_false_table[(crc >> 8) ^ c];
+}
+
+#endif /* _CRC_CCITT_H */
diff --git a/util/crc-ccitt.c b/util/crc-ccitt.c
new file mode 100644
index 00000000000..b981d8ac55b
--- /dev/null
+++ b/util/crc-ccitt.c
@@ -0,0 +1,127 @@
+/*
+ * CRC16 (CCITT) Checksum Algorithm
+ *
+ * Copyright (c) 2021 Wind River Systems, Inc.
+ *
+ * Author:
+ *   Bin Meng <bin.meng@windriver.com>
+ *
+ * From Linux kernel v5.10 lib/crc-ccitt.c
+ *
+ * SPDX-License-Identifier: GPL-2.0-only
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/crc-ccitt.h"
+
+/*
+ * This mysterious table is just the CRC of each possible byte. It can be
+ * computed using the standard bit-at-a-time methods. The polynomial can
+ * be seen in entry 128, 0x8408. This corresponds to x^0 + x^5 + x^12.
+ * Add the implicit x^16, and you have the standard CRC-CCITT.
+ */
+uint16_t const crc_ccitt_table[256] = {
+    0x0000, 0x1189, 0x2312, 0x329b, 0x4624, 0x57ad, 0x6536, 0x74bf,
+    0x8c48, 0x9dc1, 0xaf5a, 0xbed3, 0xca6c, 0xdbe5, 0xe97e, 0xf8f7,
+    0x1081, 0x0108, 0x3393, 0x221a, 0x56a5, 0x472c, 0x75b7, 0x643e,
+    0x9cc9, 0x8d40, 0xbfdb, 0xae52, 0xdaed, 0xcb64, 0xf9ff, 0xe876,
+    0x2102, 0x308b, 0x0210, 0x1399, 0x6726, 0x76af, 0x4434, 0x55bd,
+    0xad4a, 0xbcc3, 0x8e58, 0x9fd1, 0xeb6e, 0xfae7, 0xc87c, 0xd9f5,
+    0x3183, 0x200a, 0x1291, 0x0318, 0x77a7, 0x662e, 0x54b5, 0x453c,
+    0xbdcb, 0xac42, 0x9ed9, 0x8f50, 0xfbef, 0xea66, 0xd8fd, 0xc974,
+    0x4204, 0x538d, 0x6116, 0x709f, 0x0420, 0x15a9, 0x2732, 0x36bb,
+    0xce4c, 0xdfc5, 0xed5e, 0xfcd7, 0x8868, 0x99e1, 0xab7a, 0xbaf3,
+    0x5285, 0x430c, 0x7197, 0x601e, 0x14a1, 0x0528, 0x37b3, 0x263a,
+    0xdecd, 0xcf44, 0xfddf, 0xec56, 0x98e9, 0x8960, 0xbbfb, 0xaa72,
+    0x6306, 0x728f, 0x4014, 0x519d, 0x2522, 0x34ab, 0x0630, 0x17b9,
+    0xef4e, 0xfec7, 0xcc5c, 0xddd5, 0xa96a, 0xb8e3, 0x8a78, 0x9bf1,
+    0x7387, 0x620e, 0x5095, 0x411c, 0x35a3, 0x242a, 0x16b1, 0x0738,
+    0xffcf, 0xee46, 0xdcdd, 0xcd54, 0xb9eb, 0xa862, 0x9af9, 0x8b70,
+    0x8408, 0x9581, 0xa71a, 0xb693, 0xc22c, 0xd3a5, 0xe13e, 0xf0b7,
+    0x0840, 0x19c9, 0x2b52, 0x3adb, 0x4e64, 0x5fed, 0x6d76, 0x7cff,
+    0x9489, 0x8500, 0xb79b, 0xa612, 0xd2ad, 0xc324, 0xf1bf, 0xe036,
+    0x18c1, 0x0948, 0x3bd3, 0x2a5a, 0x5ee5, 0x4f6c, 0x7df7, 0x6c7e,
+    0xa50a, 0xb483, 0x8618, 0x9791, 0xe32e, 0xf2a7, 0xc03c, 0xd1b5,
+    0x2942, 0x38cb, 0x0a50, 0x1bd9, 0x6f66, 0x7eef, 0x4c74, 0x5dfd,
+    0xb58b, 0xa402, 0x9699, 0x8710, 0xf3af, 0xe226, 0xd0bd, 0xc134,
+    0x39c3, 0x284a, 0x1ad1, 0x0b58, 0x7fe7, 0x6e6e, 0x5cf5, 0x4d7c,
+    0xc60c, 0xd785, 0xe51e, 0xf497, 0x8028, 0x91a1, 0xa33a, 0xb2b3,
+    0x4a44, 0x5bcd, 0x6956, 0x78df, 0x0c60, 0x1de9, 0x2f72, 0x3efb,
+    0xd68d, 0xc704, 0xf59f, 0xe416, 0x90a9, 0x8120, 0xb3bb, 0xa232,
+    0x5ac5, 0x4b4c, 0x79d7, 0x685e, 0x1ce1, 0x0d68, 0x3ff3, 0x2e7a,
+    0xe70e, 0xf687, 0xc41c, 0xd595, 0xa12a, 0xb0a3, 0x8238, 0x93b1,
+    0x6b46, 0x7acf, 0x4854, 0x59dd, 0x2d62, 0x3ceb, 0x0e70, 0x1ff9,
+    0xf78f, 0xe606, 0xd49d, 0xc514, 0xb1ab, 0xa022, 0x92b9, 0x8330,
+    0x7bc7, 0x6a4e, 0x58d5, 0x495c, 0x3de3, 0x2c6a, 0x1ef1, 0x0f78
+};
+
+/*
+ * Similar table to calculate CRC16 variant known as CRC-CCITT-FALSE
+ * Reflected bits order, does not augment final value.
+ */
+uint16_t const crc_ccitt_false_table[256] = {
+    0x0000, 0x1021, 0x2042, 0x3063, 0x4084, 0x50A5, 0x60C6, 0x70E7,
+    0x8108, 0x9129, 0xA14A, 0xB16B, 0xC18C, 0xD1AD, 0xE1CE, 0xF1EF,
+    0x1231, 0x0210, 0x3273, 0x2252, 0x52B5, 0x4294, 0x72F7, 0x62D6,
+    0x9339, 0x8318, 0xB37B, 0xA35A, 0xD3BD, 0xC39C, 0xF3FF, 0xE3DE,
+    0x2462, 0x3443, 0x0420, 0x1401, 0x64E6, 0x74C7, 0x44A4, 0x5485,
+    0xA56A, 0xB54B, 0x8528, 0x9509, 0xE5EE, 0xF5CF, 0xC5AC, 0xD58D,
+    0x3653, 0x2672, 0x1611, 0x0630, 0x76D7, 0x66F6, 0x5695, 0x46B4,
+    0xB75B, 0xA77A, 0x9719, 0x8738, 0xF7DF, 0xE7FE, 0xD79D, 0xC7BC,
+    0x48C4, 0x58E5, 0x6886, 0x78A7, 0x0840, 0x1861, 0x2802, 0x3823,
+    0xC9CC, 0xD9ED, 0xE98E, 0xF9AF, 0x8948, 0x9969, 0xA90A, 0xB92B,
+    0x5AF5, 0x4AD4, 0x7AB7, 0x6A96, 0x1A71, 0x0A50, 0x3A33, 0x2A12,
+    0xDBFD, 0xCBDC, 0xFBBF, 0xEB9E, 0x9B79, 0x8B58, 0xBB3B, 0xAB1A,
+    0x6CA6, 0x7C87, 0x4CE4, 0x5CC5, 0x2C22, 0x3C03, 0x0C60, 0x1C41,
+    0xEDAE, 0xFD8F, 0xCDEC, 0xDDCD, 0xAD2A, 0xBD0B, 0x8D68, 0x9D49,
+    0x7E97, 0x6EB6, 0x5ED5, 0x4EF4, 0x3E13, 0x2E32, 0x1E51, 0x0E70,
+    0xFF9F, 0xEFBE, 0xDFDD, 0xCFFC, 0xBF1B, 0xAF3A, 0x9F59, 0x8F78,
+    0x9188, 0x81A9, 0xB1CA, 0xA1EB, 0xD10C, 0xC12D, 0xF14E, 0xE16F,
+    0x1080, 0x00A1, 0x30C2, 0x20E3, 0x5004, 0x4025, 0x7046, 0x6067,
+    0x83B9, 0x9398, 0xA3FB, 0xB3DA, 0xC33D, 0xD31C, 0xE37F, 0xF35E,
+    0x02B1, 0x1290, 0x22F3, 0x32D2, 0x4235, 0x5214, 0x6277, 0x7256,
+    0xB5EA, 0xA5CB, 0x95A8, 0x8589, 0xF56E, 0xE54F, 0xD52C, 0xC50D,
+    0x34E2, 0x24C3, 0x14A0, 0x0481, 0x7466, 0x6447, 0x5424, 0x4405,
+    0xA7DB, 0xB7FA, 0x8799, 0x97B8, 0xE75F, 0xF77E, 0xC71D, 0xD73C,
+    0x26D3, 0x36F2, 0x0691, 0x16B0, 0x6657, 0x7676, 0x4615, 0x5634,
+    0xD94C, 0xC96D, 0xF90E, 0xE92F, 0x99C8, 0x89E9, 0xB98A, 0xA9AB,
+    0x5844, 0x4865, 0x7806, 0x6827, 0x18C0, 0x08E1, 0x3882, 0x28A3,
+    0xCB7D, 0xDB5C, 0xEB3F, 0xFB1E, 0x8BF9, 0x9BD8, 0xABBB, 0xBB9A,
+    0x4A75, 0x5A54, 0x6A37, 0x7A16, 0x0AF1, 0x1AD0, 0x2AB3, 0x3A92,
+    0xFD2E, 0xED0F, 0xDD6C, 0xCD4D, 0xBDAA, 0xAD8B, 0x9DE8, 0x8DC9,
+    0x7C26, 0x6C07, 0x5C64, 0x4C45, 0x3CA2, 0x2C83, 0x1CE0, 0x0CC1,
+    0xEF1F, 0xFF3E, 0xCF5D, 0xDF7C, 0xAF9B, 0xBFBA, 0x8FD9, 0x9FF8,
+    0x6E17, 0x7E36, 0x4E55, 0x5E74, 0x2E93, 0x3EB2, 0x0ED1, 0x1EF0
+};
+
+/**
+ * crc_ccitt - recompute the CRC (CRC-CCITT variant)
+ * for the data buffer
+ *
+ * @crc: previous CRC value
+ * @buffer: data pointer
+ * @len: number of bytes in the buffer
+ */
+uint16_t crc_ccitt(uint16_t crc, uint8_t const *buffer, size_t len)
+{
+    while (len--) {
+        crc = crc_ccitt_byte(crc, *buffer++);
+    }
+    return crc;
+}
+
+/**
+ * crc_ccitt_false - recompute the CRC (CRC-CCITT-FALSE variant)
+ * for the data buffer
+ *
+ * @crc: previous CRC value
+ * @buffer: data pointer
+ * @len: number of bytes in the buffer
+ */
+uint16_t crc_ccitt_false(uint16_t crc, uint8_t const *buffer, size_t len)
+{
+    while (len--) {
+        crc = crc_ccitt_false_byte(crc, *buffer++);
+    }
+    return crc;
+}
diff --git a/util/meson.build b/util/meson.build
index 540a605b781..3eccdbe5962 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -49,6 +49,7 @@
 endif
 
 if have_system
+  util_ss.add(files('crc-ccitt.c'))
   util_ss.add(when: 'CONFIG_GIO', if_true: [files('dbus.c'), gio])
   util_ss.add(files('yank.c'))
 endif
-- 
2.26.2


