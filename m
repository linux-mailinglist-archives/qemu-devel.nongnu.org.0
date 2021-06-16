Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9828E3AA64D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 23:49:22 +0200 (CEST)
Received: from localhost ([::1]:54074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltdPV-0003hf-Je
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 17:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdKB-0001wA-J1; Wed, 16 Jun 2021 17:43:52 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:43645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdK9-0006dI-UL; Wed, 16 Jun 2021 17:43:51 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 3-20020a05600c0243b029019f2f9b2b8aso2460296wmj.2; 
 Wed, 16 Jun 2021 14:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TAZ5Nd2Zr4AEdYczPbEyYCejydYTPBGPwGnfyFJKBD8=;
 b=UUTClQyfSKiErduQigqFMPUjBXPLR66bqtojXp3+yysOjLTHBaVF/QPmUI5ZPe8XRP
 /cbFelwOFeMIgo1FGUQKEIQXGP+XIXG6kRUIn/deP5Tei5fm9By4o4smUTl2awbqAd5d
 tx68XAJ3Vm/T7pDzbUPC8Eh0antKjtqdzPkO8TDu4Y5IB2wcPnX6G6fKux/Ztsy2ctoR
 T/UF8qudpKUwBBqrCRH+nik4grqwDV2rEHbjTFl0vKJwIgL5LYppTzrBx5YA9WnJv4B5
 cLuN1rYxpczJfDXrcSERrkG16RupC570IFRXZkvM42PjpzgjuisxVmh0poRfy6H9cIhj
 pjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TAZ5Nd2Zr4AEdYczPbEyYCejydYTPBGPwGnfyFJKBD8=;
 b=fvYQujrZWJpfqcP8eDW2hroUQ/MJrNG/EnCTK91tye7hD2gpaKQ9MSR/NVrkknysZI
 1MlducyQTWCDSi2QJ971oIz7p3ROZcMvul6mxWGbHIy27boOrwyxPo3uwwzr/SJt6Dmq
 yB496FhcdMysiJRolnCqUTu6PuI1g8kZ9NfxDt19TnFMi7F9tVYd+rwemhdeKot4IPP6
 qby+QPP+HTTaxsI/09erfLQS8qacm7VfiSIIuPEr+/ClXnGPR0qhsZDDpaMoq5KmcwgH
 YIMsJkZUO/AkHqlG2l3enBnE62AEo4YQM60A3ZhdVMqr9iX6+1BGVo3j6EBBmLs64/Tg
 r/Ew==
X-Gm-Message-State: AOAM530/VC0oLiY3zy12SQEQCFJaqy1ZqWKFWQjTdPDjbYQUv3zkb2Yl
 c+TTPmOrxEwwqmyAjHMB8MJFK7UUZ3iC7Q==
X-Google-Smtp-Source: ABdhPJx81R37uPFyDFSp0xtO5T1qd8QWSNDdX5nU7bG+rgnJITZQRMyPlt7DxF12szruU/54jQ8/DQ==
X-Received: by 2002:a1c:f717:: with SMTP id v23mr1130870wmh.32.1623879825923; 
 Wed, 16 Jun 2021 14:43:45 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id r6sm3328178wrt.21.2021.06.16.14.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 14:43:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/15] hw/misc/auxbus: Replace 'is_write' boolean by its
 value
Date: Wed, 16 Jun 2021 23:42:48 +0200
Message-Id: <20210616214254.2647796-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616214254.2647796-1-f4bug@amsat.org>
References: <20210616214254.2647796-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the 'is_write' boolean by directly using its value in place.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/auxbus.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index 9cc9cf3be32..d96219aef88 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -106,7 +106,6 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
     AUXReply ret = AUX_NACK;
     I2CBus *i2c_bus = aux_get_i2c_bus(bus);
     size_t i;
-    bool is_write = false;
 
     DPRINTF("request at address 0x%" PRIX32 ", command %u, len %u\n", address,
             cmd, len);
@@ -117,11 +116,10 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
      */
     case WRITE_AUX:
     case READ_AUX:
-        is_write = cmd == READ_AUX ? false : true;
         for (i = 0; i < len; i++) {
             if (!address_space_rw(&bus->aux_addr_space, address++,
                                   MEMTXATTRS_UNSPECIFIED, data++, 1,
-                                  is_write)) {
+                                  cmd == WRITE_AUX)) {
                 ret = AUX_I2C_ACK;
             } else {
                 ret = AUX_NACK;
@@ -133,19 +131,18 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
      * Classic I2C transactions..
      */
     case READ_I2C:
-        is_write = cmd == READ_I2C ? false : true;
         if (i2c_bus_busy(i2c_bus)) {
             i2c_end_transfer(i2c_bus);
         }
 
-        if (i2c_start_transfer(i2c_bus, address, !is_write)) {
+        if (i2c_start_transfer(i2c_bus, address, true)) {
             ret = AUX_I2C_NACK;
             break;
         }
 
         ret = AUX_I2C_ACK;
         while (len > 0) {
-            if (i2c_send_recv(i2c_bus, data++, is_write) < 0) {
+            if (i2c_send_recv(i2c_bus, data++, false) < 0) {
                 ret = AUX_I2C_NACK;
                 break;
             }
@@ -154,19 +151,18 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
         i2c_end_transfer(i2c_bus);
         break;
     case WRITE_I2C:
-        is_write = cmd == READ_I2C ? false : true;
         if (i2c_bus_busy(i2c_bus)) {
             i2c_end_transfer(i2c_bus);
         }
 
-        if (i2c_start_transfer(i2c_bus, address, !is_write)) {
+        if (i2c_start_transfer(i2c_bus, address, false)) {
             ret = AUX_I2C_NACK;
             break;
         }
 
         ret = AUX_I2C_ACK;
         while (len > 0) {
-            if (i2c_send_recv(i2c_bus, data++, is_write) < 0) {
+            if (i2c_send_recv(i2c_bus, data++, true) < 0) {
                 ret = AUX_I2C_NACK;
                 break;
             }
@@ -183,13 +179,12 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
      *  - We changed the address.
      */
     case WRITE_I2C_MOT:
-        is_write = cmd == READ_I2C_MOT ? false : true;
         ret = AUX_I2C_NACK;
         if (!i2c_bus_busy(i2c_bus)) {
             /*
              * No transactions started..
              */
-            if (i2c_start_transfer(i2c_bus, address, !is_write)) {
+            if (i2c_start_transfer(i2c_bus, address, false)) {
                 break;
             }
         } else if ((address != bus->last_i2c_address) ||
@@ -198,7 +193,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
              * Transaction started but we need to restart..
              */
             i2c_end_transfer(i2c_bus);
-            if (i2c_start_transfer(i2c_bus, address, !is_write)) {
+            if (i2c_start_transfer(i2c_bus, address, false)) {
                 break;
             }
         }
@@ -206,7 +201,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
         bus->last_transaction = cmd;
         bus->last_i2c_address = address;
         while (len > 0) {
-            if (i2c_send_recv(i2c_bus, data++, is_write) < 0) {
+            if (i2c_send_recv(i2c_bus, data++, true) < 0) {
                 i2c_end_transfer(i2c_bus);
                 break;
             }
@@ -217,13 +212,12 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
         }
         break;
     case READ_I2C_MOT:
-        is_write = cmd == READ_I2C_MOT ? false : true;
         ret = AUX_I2C_NACK;
         if (!i2c_bus_busy(i2c_bus)) {
             /*
              * No transactions started..
              */
-            if (i2c_start_transfer(i2c_bus, address, !is_write)) {
+            if (i2c_start_transfer(i2c_bus, address, true)) {
                 break;
             }
         } else if ((address != bus->last_i2c_address) ||
@@ -232,7 +226,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
              * Transaction started but we need to restart..
              */
             i2c_end_transfer(i2c_bus);
-            if (i2c_start_transfer(i2c_bus, address, !is_write)) {
+            if (i2c_start_transfer(i2c_bus, address, true)) {
                 break;
             }
         }
@@ -240,7 +234,7 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
         bus->last_transaction = cmd;
         bus->last_i2c_address = address;
         while (len > 0) {
-            if (i2c_send_recv(i2c_bus, data++, is_write) < 0) {
+            if (i2c_send_recv(i2c_bus, data++, false) < 0) {
                 i2c_end_transfer(i2c_bus);
                 break;
             }
-- 
2.31.1


