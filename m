Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A36EA6D14A2
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 03:05:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi39H-0003C7-0X; Thu, 30 Mar 2023 21:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <38jAmZAcKChU59769y319916z.x97Bz7F-yzGz689818F.9C1@flex--komlodi.bounces.google.com>)
 id 1pi39D-0003BG-U5
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 21:01:43 -0400
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <38jAmZAcKChU59769y319916z.x97Bz7F-yzGz689818F.9C1@flex--komlodi.bounces.google.com>)
 id 1pi39A-0006a4-Vx
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 21:01:42 -0400
Received: by mail-pl1-x649.google.com with SMTP id
 kw3-20020a170902f90300b001a274ccf620so3418151plb.8
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 18:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680224498;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=W+83e2X8nmqbmp/dPoWAi4L1ZZKNh/hKp43ZTipBcnk=;
 b=n/MuMUdSwIhZqi8OKNfVwTpyc58h8oIDaW/LOme0Uf4nANCgtyHzhEWAZUwkdpchcS
 vb152yK4+UE+/cuva63kTsV11wqsWzjOPSp2oq0l1MIEeeMm3y5y2BKTS90hvQhko8A5
 xr5NQaR7xJndKx194fXuEf5R+rUZCRdu4fxcAFnXcQMM281vrDUNtpZLfg7IKFqxbM7M
 pOOsGAiu5x20PL8fKKUUdJFZFH/Ie19Bt0x37lVfhuQ/DtC9ECsyBuuOPec4jeb7jY2O
 f5/6DuTIFP2oPyHRO5VHdJ7omQMeEDY2bA3/7+iNETDTgpDNetU3Gi4rRFJM5QIx+J2H
 zqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680224498;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W+83e2X8nmqbmp/dPoWAi4L1ZZKNh/hKp43ZTipBcnk=;
 b=xVeBbZPkn9NEOHB10EWQXFXJ0FszbCsq1pM9ETcjsmP+LLc0yv3xX5Fwc5zdDGLq21
 5qvi6+7ZGgksNDb3mQH/v66R1DAqZn1nBTfImwmxafUCrnCIWMb9KgNTpM3l2syg5s8d
 gjmq9Hl8EKGf097bPMvb3yDPZI+N1CBxzdy8//vr+Ox/K5MV/N1fDJ47g2DsWOvXKf7v
 idaDtEpVnFMg7IpCqcN6DeflnYfHZh3pOaN+VJOnwA+Fakn0g+HjxWMXOZzVfu2UVY4f
 Nc5XIB8E6SZ0zYKiykW6VQMWJvy2XZaT+nFeruUn/hUVPQM6dYNBWKfr4jTk5w6d73H+
 Z1xA==
X-Gm-Message-State: AAQBX9dZ47ZVXm7wo2jmAYs7ZcvP08JJUBzCgVO72AkDEayLN6DETD5o
 rl0EdUtEavnsudhLM6HFqDrEK+XKe0nWXXwR/i/7H/jplFQy6gr28Y2ON/zYqjMLvtEPsrkmer7
 SnSH/HK/X8kcKC3OzMPV4NiXr0tY7LgqhIVBGXuJ6X753zlP6G4tMXda0+TA6E3s=
X-Google-Smtp-Source: AKy350ZJ8Nx73Xg/qgmf8CbS+jW0J1leSk4+adSOg1J3YoaXgcqgpP3LcUzxJswhjVxIQ5weVX3/ZWI2Dc0o
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a17:903:2282:b0:1a0:428c:1dae with SMTP id
 b2-20020a170903228200b001a0428c1daemr9737193plh.5.1680224498553; Thu, 30 Mar
 2023 18:01:38 -0700 (PDT)
Date: Fri, 31 Mar 2023 01:01:18 +0000
In-Reply-To: <20230331010131.1412571-1-komlodi@google.com>
Mime-Version: 1.0
References: <20230331010131.1412571-1-komlodi@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230331010131.1412571-4-komlodi@google.com>
Subject: [PATCH 03/16] hw/i3c/aspeed_i3c: Add more register fields
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: venture@google.com, komlodi@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=38jAmZAcKChU59769y319916z.x97Bz7F-yzGz689818F.9C1@flex--komlodi.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_75_100=0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

Adds the rest of the fields laid out in the AST26xx datasheet.

Signed-off-by: Joe Komlodi <komlodi@google.com>

Reviewed-by: Patrick Venture <venture@google.com>
---
 hw/i3c/aspeed_i3c.c | 260 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 248 insertions(+), 12 deletions(-)

diff --git a/hw/i3c/aspeed_i3c.c b/hw/i3c/aspeed_i3c.c
index 999978fb7d..ae247e03bb 100644
--- a/hw/i3c/aspeed_i3c.c
+++ b/hw/i3c/aspeed_i3c.c
@@ -2,6 +2,7 @@
  * ASPEED I3C Controller
  *
  * Copyright (C) 2021 ASPEED Technology Inc.
+ * Copyright (C) 2023 Google LLC
  *
  * This code is licensed under the GPL version 2 or later.  See
  * the COPYING file in the top-level directory.
@@ -20,79 +21,314 @@
 /* I3C Controller Registers */
 REG32(I3C1_REG0, 0x10)
 REG32(I3C1_REG1, 0x14)
-    FIELD(I3C1_REG1, I2C_MODE,  0,  1)
-    FIELD(I3C1_REG1, SA_EN,     15, 1)
+    FIELD(I3C1_REG1, I2C_MODE,      0,  1)
+    FIELD(I3C1_REG1, SLV_TEST_MODE, 1,  1)
+    FIELD(I3C1_REG1, ACT_MODE,      2,  2)
+    FIELD(I3C1_REG1, PENDING_INT,   4,  4)
+    FIELD(I3C1_REG1, SA,            8,  7)
+    FIELD(I3C1_REG1, SA_EN,         15, 1)
+    FIELD(I3C1_REG1, INST_ID,       16, 4)
 REG32(I3C2_REG0, 0x20)
 REG32(I3C2_REG1, 0x24)
-    FIELD(I3C2_REG1, I2C_MODE,  0,  1)
-    FIELD(I3C2_REG1, SA_EN,     15, 1)
+    FIELD(I3C2_REG1, I2C_MODE,      0,  1)
+    FIELD(I3C2_REG1, SLV_TEST_MODE, 1,  1)
+    FIELD(I3C2_REG1, ACT_MODE,      2,  2)
+    FIELD(I3C2_REG1, PENDING_INT,   4,  4)
+    FIELD(I3C2_REG1, SA,            8,  7)
+    FIELD(I3C2_REG1, SA_EN,         15, 1)
+    FIELD(I3C2_REG1, INST_ID,       16, 4)
 REG32(I3C3_REG0, 0x30)
 REG32(I3C3_REG1, 0x34)
-    FIELD(I3C3_REG1, I2C_MODE,  0,  1)
-    FIELD(I3C3_REG1, SA_EN,     15, 1)
+    FIELD(I3C3_REG1, I2C_MODE,      0,  1)
+    FIELD(I3C3_REG1, SLV_TEST_MODE, 1,  1)
+    FIELD(I3C3_REG1, ACT_MODE,      2,  2)
+    FIELD(I3C3_REG1, PENDING_INT,   4,  4)
+    FIELD(I3C3_REG1, SA,            8,  7)
+    FIELD(I3C3_REG1, SA_EN,         15, 1)
+    FIELD(I3C3_REG1, INST_ID,       16, 4)
 REG32(I3C4_REG0, 0x40)
 REG32(I3C4_REG1, 0x44)
-    FIELD(I3C4_REG1, I2C_MODE,  0,  1)
-    FIELD(I3C4_REG1, SA_EN,     15, 1)
+    FIELD(I3C4_REG1, I2C_MODE,      0,  1)
+    FIELD(I3C4_REG1, SLV_TEST_MODE, 1,  1)
+    FIELD(I3C4_REG1, ACT_MODE,      2,  2)
+    FIELD(I3C4_REG1, PENDING_INT,   4,  4)
+    FIELD(I3C4_REG1, SA,            8,  7)
+    FIELD(I3C4_REG1, SA_EN,         15, 1)
+    FIELD(I3C4_REG1, INST_ID,       16, 4)
 REG32(I3C5_REG0, 0x50)
 REG32(I3C5_REG1, 0x54)
-    FIELD(I3C5_REG1, I2C_MODE,  0,  1)
-    FIELD(I3C5_REG1, SA_EN,     15, 1)
+    FIELD(I3C5_REG1, I2C_MODE,      0,  1)
+    FIELD(I3C5_REG1, SLV_TEST_MODE, 1,  1)
+    FIELD(I3C5_REG1, ACT_MODE,      2,  2)
+    FIELD(I3C5_REG1, PENDING_INT,   4,  4)
+    FIELD(I3C5_REG1, SA,            8,  7)
+    FIELD(I3C5_REG1, SA_EN,         15, 1)
+    FIELD(I3C5_REG1, INST_ID,       16, 4)
 REG32(I3C6_REG0, 0x60)
 REG32(I3C6_REG1, 0x64)
-    FIELD(I3C6_REG1, I2C_MODE,  0,  1)
-    FIELD(I3C6_REG1, SA_EN,     15, 1)
+    FIELD(I3C6_REG1, I2C_MODE,      0,  1)
+    FIELD(I3C6_REG1, SLV_TEST_MODE, 1,  1)
+    FIELD(I3C6_REG1, ACT_MODE,      2,  2)
+    FIELD(I3C6_REG1, PENDING_INT,   4,  4)
+    FIELD(I3C6_REG1, SA,            8,  7)
+    FIELD(I3C6_REG1, SA_EN,         15, 1)
+    FIELD(I3C6_REG1, INST_ID,       16, 4)
 
 /* I3C Device Registers */
 REG32(DEVICE_CTRL,                  0x00)
+    FIELD(DEVICE_CTRL, I3C_BROADCAST_ADDR_INC,    0, 1)
+    FIELD(DEVICE_CTRL, I2C_SLAVE_PRESENT,         7, 1)
+    FIELD(DEVICE_CTRL, HOT_JOIN_ACK_NACK_CTRL,    8, 1)
+    FIELD(DEVICE_CTRL, IDLE_CNT_MULTIPLIER,       24, 2)
+    FIELD(DEVICE_CTRL, SLV_ADAPT_TO_I2C_I3C_MODE, 27, 1)
+    FIELD(DEVICE_CTRL, DMA_HANDSHAKE_EN,          28, 1)
+    FIELD(DEVICE_CTRL, I3C_ABORT,                 29, 1)
+    FIELD(DEVICE_CTRL, I3C_RESUME,                30, 1)
+    FIELD(DEVICE_CTRL, I3C_EN,                    31, 1)
 REG32(DEVICE_ADDR,                  0x04)
+    FIELD(DEVICE_ADDR, STATIC_ADDR,         0, 7)
+    FIELD(DEVICE_ADDR, STATIC_ADDR_VALID,   15, 1)
+    FIELD(DEVICE_ADDR, DYNAMIC_ADDR,        16, 7)
+    FIELD(DEVICE_ADDR, DYNAMIC_ADDR_VALID,  15, 1)
 REG32(HW_CAPABILITY,                0x08)
+    FIELD(HW_CAPABILITY, ENTDAA,  0, 1)
+    FIELD(HW_CAPABILITY, HDR_DDR, 3, 1)
+    FIELD(HW_CAPABILITY, HDR_TS,  4, 1)
 REG32(COMMAND_QUEUE_PORT,           0x0c)
+    FIELD(COMMAND_QUEUE_PORT, CMD_ATTR, 0, 3)
+    /* Transfer command structure */
+    FIELD(COMMAND_QUEUE_PORT, TID, 3, 4)
+    FIELD(COMMAND_QUEUE_PORT, CMD, 7, 8)
+    FIELD(COMMAND_QUEUE_PORT, CP, 15, 1)
+    FIELD(COMMAND_QUEUE_PORT, DEV_INDEX, 16, 5)
+    FIELD(COMMAND_QUEUE_PORT, SPEED, 21, 3)
+    FIELD(COMMAND_QUEUE_PORT, ROC, 26, 1)
+    FIELD(COMMAND_QUEUE_PORT, SDAP, 27, 1)
+    FIELD(COMMAND_QUEUE_PORT, RNW, 28, 1)
+    FIELD(COMMAND_QUEUE_PORT, TOC, 30, 1)
+    FIELD(COMMAND_QUEUE_PORT, PEC, 31, 1)
+    /* Transfer argument data structure */
+    FIELD(COMMAND_QUEUE_PORT, DB, 8, 8)
+    FIELD(COMMAND_QUEUE_PORT, DL, 16, 16)
+    /* Short data argument data structure */
+    FIELD(COMMAND_QUEUE_PORT, BYTE_STRB, 3, 3)
+    FIELD(COMMAND_QUEUE_PORT, BYTE0, 8, 8)
+    FIELD(COMMAND_QUEUE_PORT, BYTE1, 16, 8)
+    FIELD(COMMAND_QUEUE_PORT, BYTE2, 24, 8)
+    /* Address assignment command structure */
+    /*
+     * bits 3..21 and 26..31 are the same as the transfer command structure, or
+     * marked as reserved.
+     */
+    FIELD(COMMAND_QUEUE_PORT, DEV_COUNT, 21, 3)
 REG32(RESPONSE_QUEUE_PORT,          0x10)
+    FIELD(RESPONSE_QUEUE_PORT, DL, 0, 16)
+    FIELD(RESPONSE_QUEUE_PORT, CCCT, 16, 8)
+    FIELD(RESPONSE_QUEUE_PORT, TID, 24, 4)
+    FIELD(RESPONSE_QUEUE_PORT, ERR_STATUS, 28, 4)
 REG32(RX_TX_DATA_PORT,              0x14)
 REG32(IBI_QUEUE_STATUS,             0x18)
+    FIELD(IBI_QUEUE_STATUS, IBI_DATA_LEN,   0, 8)
+    FIELD(IBI_QUEUE_STATUS, IBI_ID,         8, 8)
+    FIELD(IBI_QUEUE_STATUS, LAST_STATUS,  24, 1)
+    FIELD(IBI_QUEUE_STATUS, ERROR,  30, 1)
+    FIELD(IBI_QUEUE_STATUS, IBI_STATUS,  31, 1)
 REG32(IBI_QUEUE_DATA,               0x18)
 REG32(QUEUE_THLD_CTRL,              0x1c)
+    FIELD(QUEUE_THLD_CTRL, CMD_BUF_EMPTY_THLD,  0, 8);
+    FIELD(QUEUE_THLD_CTRL, RESP_BUF_THLD, 8, 8);
+    FIELD(QUEUE_THLD_CTRL, IBI_DATA_THLD, 16, 8);
+    FIELD(QUEUE_THLD_CTRL, IBI_STATUS_THLD,     24, 8);
 REG32(DATA_BUFFER_THLD_CTRL,        0x20)
+    FIELD(DATA_BUFFER_THLD_CTRL, TX_BUF_THLD,   0, 3)
+    FIELD(DATA_BUFFER_THLD_CTRL, RX_BUF_THLD,   10, 3)
+    FIELD(DATA_BUFFER_THLD_CTRL, TX_START_THLD, 16, 3)
+    FIELD(DATA_BUFFER_THLD_CTRL, RX_START_THLD, 24, 3)
 REG32(IBI_QUEUE_CTRL,               0x24)
+    FIELD(IBI_QUEUE_CTRL, NOTIFY_REJECTED_HOT_JOIN,   0, 1)
+    FIELD(IBI_QUEUE_CTRL, NOTIFY_REJECTED_MASTER_REQ, 1, 1)
+    FIELD(IBI_QUEUE_CTRL, NOTIFY_REJECTED_SLAVE_IRQ,  3, 1)
 REG32(IBI_MR_REQ_REJECT,            0x2c)
 REG32(IBI_SIR_REQ_REJECT,           0x30)
 REG32(RESET_CTRL,                   0x34)
+    FIELD(RESET_CTRL, CORE_RESET,       0, 1)
+    FIELD(RESET_CTRL, CMD_QUEUE_RESET,  1, 1)
+    FIELD(RESET_CTRL, RESP_QUEUE_RESET, 2, 1)
+    FIELD(RESET_CTRL, TX_BUF_RESET,     3, 1)
+    FIELD(RESET_CTRL, RX_BUF_RESET,     4, 1)
+    FIELD(RESET_CTRL, IBI_QUEUE_RESET,  5, 1)
 REG32(SLV_EVENT_CTRL,               0x38)
+    FIELD(SLV_EVENT_CTRL, SLV_INTERRUPT,      0, 1)
+    FIELD(SLV_EVENT_CTRL, MASTER_INTERRUPT,   1, 1)
+    FIELD(SLV_EVENT_CTRL, HOT_JOIN_INTERRUPT, 3, 1)
+    FIELD(SLV_EVENT_CTRL, ACTIVITY_STATE,     4, 2)
+    FIELD(SLV_EVENT_CTRL, MRL_UPDATED,        6, 1)
+    FIELD(SLV_EVENT_CTRL, MWL_UPDATED,        7, 1)
 REG32(INTR_STATUS,                  0x3c)
+    FIELD(INTR_STATUS, TX_THLD,           0, 1)
+    FIELD(INTR_STATUS, RX_THLD,           1, 1)
+    FIELD(INTR_STATUS, IBI_THLD,          2, 1)
+    FIELD(INTR_STATUS, CMD_QUEUE_RDY,     3, 1)
+    FIELD(INTR_STATUS, RESP_RDY,          4, 1)
+    FIELD(INTR_STATUS, TRANSFER_ABORT,    5, 1)
+    FIELD(INTR_STATUS, CCC_UPDATED,       6, 1)
+    FIELD(INTR_STATUS, DYN_ADDR_ASSGN,    8, 1)
+    FIELD(INTR_STATUS, TRANSFER_ERR,      9, 1)
+    FIELD(INTR_STATUS, DEFSLV,            10, 1)
+    FIELD(INTR_STATUS, READ_REQ_RECV,     11, 1)
+    FIELD(INTR_STATUS, IBI_UPDATED,       12, 1)
+    FIELD(INTR_STATUS, BUSOWNER_UPDATED,  13, 1)
 REG32(INTR_STATUS_EN,               0x40)
+    FIELD(INTR_STATUS_EN, TX_THLD,          0, 1)
+    FIELD(INTR_STATUS_EN, RX_THLD,          1, 1)
+    FIELD(INTR_STATUS_EN, IBI_THLD,         2, 1)
+    FIELD(INTR_STATUS_EN, CMD_QUEUE_RDY,    3, 1)
+    FIELD(INTR_STATUS_EN, RESP_RDY,         4, 1)
+    FIELD(INTR_STATUS_EN, TRANSFER_ABORT,   5, 1)
+    FIELD(INTR_STATUS_EN, CCC_UPDATED,      6, 1)
+    FIELD(INTR_STATUS_EN, DYN_ADDR_ASSGN,   8, 1)
+    FIELD(INTR_STATUS_EN, TRANSFER_ERR,     9, 1)
+    FIELD(INTR_STATUS_EN, DEFSLV,           10, 1)
+    FIELD(INTR_STATUS_EN, READ_REQ_RECV,    11, 1)
+    FIELD(INTR_STATUS_EN, IBI_UPDATED,      12, 1)
+    FIELD(INTR_STATUS_EN, BUSOWNER_UPDATED, 13, 1)
 REG32(INTR_SIGNAL_EN,               0x44)
+    FIELD(INTR_SIGNAL_EN, TX_THLD,          0, 1)
+    FIELD(INTR_SIGNAL_EN, RX_THLD,          1, 1)
+    FIELD(INTR_SIGNAL_EN, IBI_THLD,         2, 1)
+    FIELD(INTR_SIGNAL_EN, CMD_QUEUE_RDY,    3, 1)
+    FIELD(INTR_SIGNAL_EN, RESP_RDY,         4, 1)
+    FIELD(INTR_SIGNAL_EN, TRANSFER_ABORT,   5, 1)
+    FIELD(INTR_SIGNAL_EN, CCC_UPDATED,      6, 1)
+    FIELD(INTR_SIGNAL_EN, DYN_ADDR_ASSGN,   8, 1)
+    FIELD(INTR_SIGNAL_EN, TRANSFER_ERR,     9, 1)
+    FIELD(INTR_SIGNAL_EN, DEFSLV,           10, 1)
+    FIELD(INTR_SIGNAL_EN, READ_REQ_RECV,    11, 1)
+    FIELD(INTR_SIGNAL_EN, IBI_UPDATED,      12, 1)
+    FIELD(INTR_SIGNAL_EN, BUSOWNER_UPDATED, 13, 1)
 REG32(INTR_FORCE,                   0x48)
+    FIELD(INTR_FORCE, TX_THLD,          0, 1)
+    FIELD(INTR_FORCE, RX_THLD,          1, 1)
+    FIELD(INTR_FORCE, IBI_THLD,         2, 1)
+    FIELD(INTR_FORCE, CMD_QUEUE_RDY,    3, 1)
+    FIELD(INTR_FORCE, RESP_RDY,         4, 1)
+    FIELD(INTR_FORCE, TRANSFER_ABORT,   5, 1)
+    FIELD(INTR_FORCE, CCC_UPDATED,      6, 1)
+    FIELD(INTR_FORCE, DYN_ADDR_ASSGN,   8, 1)
+    FIELD(INTR_FORCE, TRANSFER_ERR,     9, 1)
+    FIELD(INTR_FORCE, DEFSLV,           10, 1)
+    FIELD(INTR_FORCE, READ_REQ_RECV,    11, 1)
+    FIELD(INTR_FORCE, IBI_UPDATED,      12, 1)
+    FIELD(INTR_FORCE, BUSOWNER_UPDATED, 13, 1)
 REG32(QUEUE_STATUS_LEVEL,           0x4c)
+    FIELD(QUEUE_STATUS_LEVEL, CMD_QUEUE_EMPTY_LOC,  0, 8)
+    FIELD(QUEUE_STATUS_LEVEL, RESP_BUF_BLR,         8, 8)
+    FIELD(QUEUE_STATUS_LEVEL, IBI_BUF_BLR,          16, 8)
+    FIELD(QUEUE_STATUS_LEVEL, IBI_STATUS_CNT,       24, 5)
 REG32(DATA_BUFFER_STATUS_LEVEL,     0x50)
+    FIELD(DATA_BUFFER_STATUS_LEVEL, TX_BUF_EMPTY_LOC, 0, 8)
+    FIELD(DATA_BUFFER_STATUS_LEVEL, RX_BUF_BLR,       16, 8)
 REG32(PRESENT_STATE,                0x54)
+    FIELD(PRESENT_STATE, SCL_LINE_SIGNAL_LEVEL, 0, 1)
+    FIELD(PRESENT_STATE, SDA_LINE_SIGNAL_LEVEL, 1, 1)
+    FIELD(PRESENT_STATE, CURRENT_MASTER,        2, 1)
+    FIELD(PRESENT_STATE, CM_TFR_STATUS,         8, 6)
+    FIELD(PRESENT_STATE, CM_TFR_ST_STATUS,      16, 6)
+    FIELD(PRESENT_STATE, CMD_TID,               24, 4)
 REG32(CCC_DEVICE_STATUS,            0x58)
+    FIELD(CCC_DEVICE_STATUS, PENDING_INTR,      0, 4)
+    FIELD(CCC_DEVICE_STATUS, PROTOCOL_ERR,      4, 2)
+    FIELD(CCC_DEVICE_STATUS, ACTIVITY_MODE,     6, 2)
+    FIELD(CCC_DEVICE_STATUS, UNDER_ERR,         8, 1)
+    FIELD(CCC_DEVICE_STATUS, SLV_BUSY,          9, 1)
+    FIELD(CCC_DEVICE_STATUS, OVERFLOW_ERR,      10, 1)
+    FIELD(CCC_DEVICE_STATUS, DATA_NOT_READY,    11, 1)
+    FIELD(CCC_DEVICE_STATUS, BUFFER_NOT_AVAIL,  12, 1)
 REG32(DEVICE_ADDR_TABLE_POINTER,    0x5c)
     FIELD(DEVICE_ADDR_TABLE_POINTER, DEPTH, 16, 16)
     FIELD(DEVICE_ADDR_TABLE_POINTER, ADDR,  0,  16)
 REG32(DEV_CHAR_TABLE_POINTER,       0x60)
+    FIELD(DEV_CHAR_TABLE_POINTER, P_DEV_CHAR_TABLE_START_ADDR,  0, 12)
+    FIELD(DEV_CHAR_TABLE_POINTER, DEV_CHAR_TABLE_DEPTH,         12, 7)
+    FIELD(DEV_CHAR_TABLE_POINTER, PRESENT_DEV_CHAR_TABLE_INDEX, 19, 3)
 REG32(VENDOR_SPECIFIC_REG_POINTER,  0x6c)
+    FIELD(VENDOR_SPECIFIC_REG_POINTER, P_VENDOR_REG_START_ADDR, 0, 16)
 REG32(SLV_MIPI_PID_VALUE,           0x70)
 REG32(SLV_PID_VALUE,                0x74)
+    FIELD(SLV_PID_VALUE, SLV_PID_DCR, 0, 12)
+    FIELD(SLV_PID_VALUE, SLV_INST_ID, 12, 4)
+    FIELD(SLV_PID_VALUE, SLV_PART_ID, 16, 16)
 REG32(SLV_CHAR_CTRL,                0x78)
+    FIELD(SLV_CHAR_CTRL, BCR,     0, 8)
+    FIELD(SLV_CHAR_CTRL, DCR,     8, 8)
+    FIELD(SLV_CHAR_CTRL, HDR_CAP, 16, 8)
 REG32(SLV_MAX_LEN,                  0x7c)
+    FIELD(SLV_MAX_LEN, MWL, 0, 16)
+    FIELD(SLV_MAX_LEN, MRL, 16, 16)
 REG32(MAX_READ_TURNAROUND,          0x80)
 REG32(MAX_DATA_SPEED,               0x84)
 REG32(SLV_DEBUG_STATUS,             0x88)
 REG32(SLV_INTR_REQ,                 0x8c)
+    FIELD(SLV_INTR_REQ, SIR,      0, 1)
+    FIELD(SLV_INTR_REQ, SIR_CTRL, 1, 2)
+    FIELD(SLV_INTR_REQ, MIR,      3, 1)
+    FIELD(SLV_INTR_REQ, IBI_STS,  8, 2)
+REG32(SLV_TSX_SYMBL_TIMING,         0x90)
+    FIELD(SLV_TSX_SYMBL_TIMING, SLV_TSX_SYMBL_CNT, 0, 6)
 REG32(DEVICE_CTRL_EXTENDED,         0xb0)
+    FIELD(DEVICE_CTRL_EXTENDED, MODE, 0, 2)
+    FIELD(DEVICE_CTRL_EXTENDED, REQMST_ACK_CTRL, 3, 1)
 REG32(SCL_I3C_OD_TIMING,            0xb4)
+    FIELD(SCL_I3C_OD_TIMING, I3C_OD_LCNT, 0, 8)
+    FIELD(SCL_I3C_OD_TIMING, I3C_OD_HCNT, 16, 8)
 REG32(SCL_I3C_PP_TIMING,            0xb8)
+    FIELD(SCL_I3C_PP_TIMING, I3C_PP_LCNT, 0, 8)
+    FIELD(SCL_I3C_PP_TIMING, I3C_PP_HCNT, 16, 8)
 REG32(SCL_I2C_FM_TIMING,            0xbc)
 REG32(SCL_I2C_FMP_TIMING,           0xc0)
+    FIELD(SCL_I2C_FMP_TIMING, I2C_FMP_LCNT, 0, 16)
+    FIELD(SCL_I2C_FMP_TIMING, I2C_FMP_HCNT, 16, 8)
 REG32(SCL_EXT_LCNT_TIMING,          0xc8)
 REG32(SCL_EXT_TERMN_LCNT_TIMING,    0xcc)
 REG32(BUS_FREE_TIMING,              0xd4)
 REG32(BUS_IDLE_TIMING,              0xd8)
+    FIELD(BUS_IDLE_TIMING, BUS_IDLE_TIME, 0, 20)
 REG32(I3C_VER_ID,                   0xe0)
 REG32(I3C_VER_TYPE,                 0xe4)
 REG32(EXTENDED_CAPABILITY,          0xe8)
+    FIELD(EXTENDED_CAPABILITY, APP_IF_MODE,       0, 2)
+    FIELD(EXTENDED_CAPABILITY, APP_IF_DATA_WIDTH, 2, 2)
+    FIELD(EXTENDED_CAPABILITY, OPERATION_MODE,    4, 2)
+    FIELD(EXTENDED_CAPABILITY, CLK_PERIOD,        8, 6)
 REG32(SLAVE_CONFIG,                 0xec)
+    FIELD(SLAVE_CONFIG, DMA_EN,     0, 1)
+    FIELD(SLAVE_CONFIG, HJ_CAP,     0, 1)
+    FIELD(SLAVE_CONFIG, CLK_PERIOD, 2, 14)
+/* Device characteristic table fields */
+REG32(DEVICE_CHARACTERISTIC_TABLE_LOC1, 0x200)
+REG32(DEVICE_CHARACTERISTIC_TABLE_LOC_SECONDARY, 0x200)
+    FIELD(DEVICE_CHARACTERISTIC_TABLE_LOC_SECONDARY, DYNAMIC_ADDR, 0, 8)
+    FIELD(DEVICE_CHARACTERISTIC_TABLE_LOC_SECONDARY, DCR, 8, 8)
+    FIELD(DEVICE_CHARACTERISTIC_TABLE_LOC_SECONDARY, BCR, 16, 8)
+    FIELD(DEVICE_CHARACTERISTIC_TABLE_LOC_SECONDARY, STATIC_ADDR, 24, 8)
+REG32(DEVICE_CHARACTERISTIC_TABLE_LOC2, 0x204)
+    FIELD(DEVICE_CHARACTERISTIC_TABLE_LOC2, MSB_PID, 0, 16)
+REG32(DEVICE_CHARACTERISTIC_TABLE_LOC3, 0x208)
+    FIELD(DEVICE_CHARACTERISTIC_TABLE_LOC3, DCR, 0, 8)
+    FIELD(DEVICE_CHARACTERISTIC_TABLE_LOC3, BCR, 8, 8)
+REG32(DEVICE_CHARACTERISTIC_TABLE_LOC4, 0x20c)
+    FIELD(DEVICE_CHARACTERISTIC_TABLE_LOC4, DEV_DYNAMIC_ADDR, 0, 8)
+/* Dev addr table fields */
+REG32(DEVICE_ADDR_TABLE_LOC1, 0x280)
+    FIELD(DEVICE_ADDR_TABLE_LOC1, DEV_STATIC_ADDR, 0, 7)
+    FIELD(DEVICE_ADDR_TABLE_LOC1, IBI_PEC_EN, 11, 1)
+    FIELD(DEVICE_ADDR_TABLE_LOC1, IBI_WITH_DATA, 12, 1)
+    FIELD(DEVICE_ADDR_TABLE_LOC1, SIR_REJECT, 13, 1)
+    FIELD(DEVICE_ADDR_TABLE_LOC1, MR_REJECT, 14, 1)
+    FIELD(DEVICE_ADDR_TABLE_LOC1, DEV_DYNAMIC_ADDR, 16, 8)
+    FIELD(DEVICE_ADDR_TABLE_LOC1, IBI_ADDR_MASK, 24, 2)
+    FIELD(DEVICE_ADDR_TABLE_LOC1, DEV_NACK_RETRY_CNT, 29, 2)
+    FIELD(DEVICE_ADDR_TABLE_LOC1, LEGACY_I2C_DEVICE, 31, 1)
 
 static const uint32_t ast2600_i3c_device_resets[ASPEED_I3C_DEVICE_NR_REGS] = {
     [R_HW_CAPABILITY]               = 0x000e00bf,
-- 
2.40.0.348.gf938b09366-goog


