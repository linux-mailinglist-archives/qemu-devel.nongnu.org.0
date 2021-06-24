Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 902B23B313D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 16:25:41 +0200 (CEST)
Received: from localhost ([::1]:44804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwQIU-00032t-Oo
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 10:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwQFd-0006Ex-N3; Thu, 24 Jun 2021 10:22:42 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:42807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwQFb-0008Sz-9V; Thu, 24 Jun 2021 10:22:41 -0400
Received: by mail-wr1-x431.google.com with SMTP id j1so6870939wrn.9;
 Thu, 24 Jun 2021 07:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JzqeSaa2O8XzfBmvOuh3ggwx7gOwVaB9JI3bIWkBQOI=;
 b=rT+8FbYdzjYOERh5QdxCXMLZM7gJkx7gRMCjFLq7CMOWHKvrn7N/fcn1tUZJ+z2Pm3
 pVNIrANLuKwKqfHGusnFGUHliHOeYKyp2B7MZFhXKTRsb9RMHFOTBVt7lQRfwUTNTsF+
 hvoZDTkMFynlOplE8lhavYoedsHDr601JPqOk60up2jV4ALwojtAIVSz2qnt/4ihZ2UR
 wkwj5H3IAwXbSFixJOsFs+d/A+fvDKqZKk/n815PRXIm7pUhfCS7IePMpIMmHwGDgioB
 3YR/mLZBGp3B1EdFuYnjDsXgpi6a2nfFoZRU2uJAAVlycNwQllm9Jb42u5MMK9VSfBgr
 V3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JzqeSaa2O8XzfBmvOuh3ggwx7gOwVaB9JI3bIWkBQOI=;
 b=Bduju9RDx7MfhcWVZhBCIdKKBy6HNItaNZHbtMGwE0RlTZJ+rbQTF9mNPpuvT3Z50y
 4mFtTdj79syIK9llcLOpS7pNyTxd8ZJr6o9GWqpbMDHtYr/8/M73Z3Q1PfXmlQ0Q4aE/
 cyDHA2sx/wrK3WBlnwY45+GHf7m0qdK0J9UUpZ1VJcy33+pQAS8Ab6DkUZ6lpPioy6/3
 AKZQP3oOXF1FBpMkmXMD0iBmq3FW/oB6cJtwCNhvuLoxDCjsuX6b7fCxUoYxj/gfJgl5
 4QWX+P96GVXv6miMkEGs+Drbp1gnxl3yFHSZ7rVLZt6ujsqp75w73G1DqAZz95vFlLid
 uPcg==
X-Gm-Message-State: AOAM531UdpoXGKvDtaXhJsU/3S+J+Pt3zlAv5lna67l2MbnTgWwkliSn
 xwCwuRw1eKApmpdr835E/9TPzzsXLFm3mw==
X-Google-Smtp-Source: ABdhPJy2gQrbHUDzdMDCZe9VPbrEyHH+ESNy4jffUGRaycnYvqZFXBqxGLpLjdP1AgEjLd3wctgdrg==
X-Received: by 2002:a5d:6208:: with SMTP id y8mr4777971wru.386.1624544557276; 
 Thu, 24 Jun 2021 07:22:37 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id 2sm3286158wrz.87.2021.06.24.07.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:22:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 05/10] hw/sd: Add sd_cmd_illegal() handler
Date: Thu, 24 Jun 2021 16:22:04 +0200
Message-Id: <20210624142209.1193073-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624142209.1193073-1-f4bug@amsat.org>
References: <20210624142209.1193073-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: qemu-block@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Log illegal commands as GUEST_ERROR.

Note: we are logging back the SDIO commands (CMD5, CMD52-54).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 57 ++++++++++++++++++++++--------------------------------
 1 file changed, 23 insertions(+), 34 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index ce1eec0374f..0215bdb3689 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -965,6 +965,14 @@ static sd_rsp_type_t sd_invalid_state_for_cmd(SDState *sd, SDRequest req)
     return sd_illegal;
 }
 
+static sd_rsp_type_t sd_cmd_illegal(SDState *sd, SDRequest req)
+{
+    qemu_log_mask(LOG_GUEST_ERROR, "%s: Unknown CMD%i\n",
+                  sd->proto->name, req.cmd);
+
+    return sd_illegal;
+}
+
 static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 {
     uint32_t rca = 0x0000;
@@ -1017,15 +1025,10 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 1:	/* CMD1:   SEND_OP_CMD */
-        if (!sd->spi)
-            goto bad_cmd;
-
         sd->state = sd_transfer_state;
         return sd_r1;
 
     case 2:	/* CMD2:   ALL_SEND_CID */
-        if (sd->spi)
-            goto bad_cmd;
         switch (sd->state) {
         case sd_ready_state:
             sd->state = sd_identification_state;
@@ -1037,8 +1040,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 3:	/* CMD3:   SEND_RELATIVE_ADDR */
-        if (sd->spi)
-            goto bad_cmd;
         switch (sd->state) {
         case sd_identification_state:
         case sd_standby_state:
@@ -1052,8 +1053,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 4:	/* CMD4:   SEND_DSR */
-        if (sd->spi)
-            goto bad_cmd;
         switch (sd->state) {
         case sd_standby_state:
             break;
@@ -1063,9 +1062,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 5: /* CMD5: reserved for SDIO cards */
-        return sd_illegal;
-
     case 6:	/* CMD6:   SWITCH_FUNCTION */
         switch (sd->mode) {
         case sd_data_transfer_mode:
@@ -1081,8 +1077,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 7:	/* CMD7:   SELECT/DESELECT_CARD */
-        if (sd->spi)
-            goto bad_cmd;
         switch (sd->state) {
         case sd_standby_state:
             if (sd->rca != rca)
@@ -1212,8 +1206,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 15:	/* CMD15:  GO_INACTIVE_STATE */
-        if (sd->spi)
-            goto bad_cmd;
         switch (sd->mode) {
         case sd_data_transfer_mode:
             if (sd->rca != rca)
@@ -1320,8 +1312,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 26:	/* CMD26:  PROGRAM_CID */
-        if (sd->spi)
-            goto bad_cmd;
         switch (sd->state) {
         case sd_transfer_state:
             sd->state = sd_receivingdata_state;
@@ -1466,15 +1456,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         }
         break;
 
-    case 52 ... 54:
-        /* CMD52, CMD53, CMD54: reserved for SDIO cards
-         * (see the SDIO Simplified Specification V2.0)
-         * Handle as illegal command but do not complain
-         * on stderr, as some OSes may use these in their
-         * probing for presence of an SDIO card.
-         */
-        return sd_illegal;
-
     /* Application specific commands (Class 8) */
     case 55:	/* CMD55:  APP_CMD */
         switch (sd->state) {
@@ -1515,19 +1496,12 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 58:    /* CMD58:   READ_OCR (SPI) */
-        if (!sd->spi) {
-            goto bad_cmd;
-        }
         return sd_r3;
 
     case 59:    /* CMD59:   CRC_ON_OFF (SPI) */
-        if (!sd->spi) {
-            goto bad_cmd;
-        }
         return sd_r1;
 
     default:
-    bad_cmd:
         qemu_log_mask(LOG_GUEST_ERROR, "SD: Unknown CMD%i\n", req.cmd);
         return sd_illegal;
     }
@@ -2114,10 +2088,25 @@ void sd_enable(SDState *sd, bool enable)
 
 static const SDProto sd_proto_spi = {
     .name = "SPI",
+    .cmd = {
+        [2 ... 4]   = sd_cmd_illegal,
+        [5]         = sd_cmd_illegal,
+        [7]         = sd_cmd_illegal,
+        [15]        = sd_cmd_illegal,
+        [26]        = sd_cmd_illegal,
+        [52 ... 54] = sd_cmd_illegal,
+    },
 };
 
 static const SDProto sd_proto_sd = {
     .name = "SD",
+    .cmd = {
+        [1]         = sd_cmd_illegal,
+        [5]         = sd_cmd_illegal,
+        [52 ... 54] = sd_cmd_illegal,
+        [58]        = sd_cmd_illegal,
+        [59]        = sd_cmd_illegal,
+    },
 };
 
 static void sd_instance_init(Object *obj)
-- 
2.31.1


