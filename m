Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4783B3146
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 16:26:41 +0200 (CEST)
Received: from localhost ([::1]:48806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwQJU-0005i0-IR
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 10:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwQFN-0005x7-2j; Thu, 24 Jun 2021 10:22:25 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:43784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwQFL-0008Gn-Fd; Thu, 24 Jun 2021 10:22:24 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 p8-20020a7bcc880000b02901dbb595a9f1so3757618wma.2; 
 Thu, 24 Jun 2021 07:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yzWkWf0NgppWHdk+Kcq3Byckt7guuXJzjXQjHJnxzrw=;
 b=VkVbepToYtfuoggzQfIqBvRAofLtNswHJE5f0nSAD0JOCgLjzIkmQ/yaydHVWt6T9G
 a9Izja+1JDdgF1rdL7jVP8g0Dq6IFfOjVVhPVv1gxv1onKOHKbhefJ4o6+3fbDT6zcbz
 TXqLewhHJkeG8JCMiRJHFgjd4RklrEdF6CHAKwMp4Owq7lRKVXt9yV3GuQk5k0MEs+Gu
 BCK1UpzCh4xrH5pyyb/rJOSAx8OOLy2IjuEz9VnkL8jfUQTELR1lfhUC+0yyahIz2V84
 NAcT5VcqDUVGIhotj6o7c4blpAcQnhkcwKfoTgCAXFfn2pV7yIFbvXOXCdUHEaoXUX08
 vubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yzWkWf0NgppWHdk+Kcq3Byckt7guuXJzjXQjHJnxzrw=;
 b=X47WLCDh1WBL6IGMI9Q8vT4YeQp0xPpku2MysNDorNwFylVATKlrDYlU6yvp0a7Cz7
 qLGAs/0U+G+Xr+SzfbQ2ZlI2FyrXNb33VQmB1FphhMOIcAneEr1bJiH126u/s6z6/2ti
 zsjvqWcaoG3N0B/+JFHsDY5v5iEjUGq2I3AzFafbJTGcikKF7n41F5In8w2R0t1cVDYs
 RlIzgGLaNgjFhY5TVR0DHAiNnr84pindLFTxBRzG5zB0SwuwXjXdO6lBGpgjwMNZgkig
 epJRcp7TVXnQhLyjSr3jZsB5YFJYmiU0MR2kLFwGio0lD+zRicq7mtS58FuJU6ZzLj+4
 dWiw==
X-Gm-Message-State: AOAM530de+VzXJKaFU4/01S9PttP6GPHencAEbYjqLvQQFWEukxuM8JI
 U/nO+Fu3gmXrVuYN2L6afqRshQtDZJHJAw==
X-Google-Smtp-Source: ABdhPJxI2gZhVXutL5R1WUFC4oiBazKhYOvmZobtprwoMbANFz9X4Z+BXJ0HfpEGZNjfiubB80ZWVw==
X-Received: by 2002:a05:600c:19d1:: with SMTP id
 u17mr4721338wmq.31.1624544541185; 
 Thu, 24 Jun 2021 07:22:21 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id k6sm3051919wms.8.2021.06.24.07.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:22:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 02/10] hw/sd: Extract address_in_range() helper,
 log invalid accesses
Date: Thu, 24 Jun 2021 16:22:01 +0200
Message-Id: <20210624142209.1193073-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624142209.1193073-1-f4bug@amsat.org>
References: <20210624142209.1193073-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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

Multiple commands have to check the address requested is valid.
Extract this code pattern as a new address_in_range() helper, and
log invalid accesses as guest errors.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 288ae059e3d..d71ec81c22a 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -937,6 +937,18 @@ static void sd_lock_command(SDState *sd)
         sd->card_status &= ~CARD_IS_LOCKED;
 }
 
+static bool address_in_range(SDState *sd, const char *desc,
+                             uint64_t addr, uint32_t length)
+{
+    if (addr + length > sd->size) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s offset %lu > card %lu [%%%u]\n",
+                      desc, addr, sd->size, length);
+        sd->card_status |= ADDRESS_ERROR;
+        return false;
+    }
+    return true;
+}
+
 static sd_rsp_type_t sd_invalid_state_for_cmd(SDState *sd, SDRequest req)
 {
     qemu_log_mask(LOG_GUEST_ERROR, "SD: CMD%i in a wrong state: %s\n",
@@ -1226,8 +1238,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         switch (sd->state) {
         case sd_transfer_state:
 
-            if (addr + sd->blk_len > sd->size) {
-                sd->card_status |= ADDRESS_ERROR;
+            if (!address_in_range(sd, "READ_BLOCK", addr, sd->blk_len)) {
                 return sd_r1;
             }
 
@@ -1272,8 +1283,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         switch (sd->state) {
         case sd_transfer_state:
 
-            if (addr + sd->blk_len > sd->size) {
-                sd->card_status |= ADDRESS_ERROR;
+            if (!address_in_range(sd, "WRITE_BLOCK", addr, sd->blk_len)) {
                 return sd_r1;
             }
 
@@ -1333,8 +1343,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
         switch (sd->state) {
         case sd_transfer_state:
-            if (addr >= sd->size) {
-                sd->card_status |= ADDRESS_ERROR;
+            if (!address_in_range(sd, "SET_WRITE_PROT", addr, 1)) {
                 return sd_r1b;
             }
 
@@ -1356,8 +1365,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
         switch (sd->state) {
         case sd_transfer_state:
-            if (addr >= sd->size) {
-                sd->card_status |= ADDRESS_ERROR;
+            if (!address_in_range(sd, "CLR_WRITE_PROT", addr, 1)) {
                 return sd_r1b;
             }
 
@@ -1832,8 +1840,8 @@ void sd_write_byte(SDState *sd, uint8_t value)
     case 25:	/* CMD25:  WRITE_MULTIPLE_BLOCK */
         if (sd->data_offset == 0) {
             /* Start of the block - let's check the address is valid */
-            if (sd->data_start + sd->blk_len > sd->size) {
-                sd->card_status |= ADDRESS_ERROR;
+            if (!address_in_range(sd, "WRITE_MULTIPLE_BLOCK",
+                                  sd->data_start, sd->blk_len)) {
                 break;
             }
             if (sd->size <= SDSC_MAX_CAPACITY) {
@@ -2005,8 +2013,8 @@ uint8_t sd_read_byte(SDState *sd)
 
     case 18:	/* CMD18:  READ_MULTIPLE_BLOCK */
         if (sd->data_offset == 0) {
-            if (sd->data_start + io_len > sd->size) {
-                sd->card_status |= ADDRESS_ERROR;
+            if (!address_in_range(sd, "READ_MULTIPLE_BLOCK",
+                                  sd->data_start, io_len)) {
                 return 0x00;
             }
             BLK_READ_BLOCK(sd->data_start, io_len);
-- 
2.31.1


