Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DA73BA306
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 18:02:25 +0200 (CEST)
Received: from localhost ([::1]:48064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzLcW-00060A-8l
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 12:02:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzLZU-0003A3-O2; Fri, 02 Jul 2021 11:59:17 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzLZT-0004FS-9Q; Fri, 02 Jul 2021 11:59:16 -0400
Received: by mail-wr1-x430.google.com with SMTP id m18so13065589wrv.2;
 Fri, 02 Jul 2021 08:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XI/+RLNcOZRL3x9ImO4jyG/hJF8EqE05K9qsRROWbv8=;
 b=A8Ro89JPYfcDN835ciSNyfD5YervCwIvX2gZUkgvX3W7GrfUAJbZb87jafGQjlffBo
 08LQOGdxSg8Sbz0JmwatBoD3qMYo+i0WTDzyIZwg+Jioi52DJAngNt4xO7mOM5ehlrLT
 MYZikWnTve+JI5pnPZQAW6GM+10cdiOcc4o4iF+tsr1zw47qIHuYYo7TA5AVnTH3V4Qh
 W8OickJHhaG4RSAXpb3ODJ7HMrv12eZzbXxPeGn0jXLrltrW6zCVsVsKRzxw+Ko26FIl
 9vr8fkml8wWUB2SgMQFj4SsajDNi4gULUszrD21DiUBeRy8XlO/U/i3vbu2pMdRRodmV
 W1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XI/+RLNcOZRL3x9ImO4jyG/hJF8EqE05K9qsRROWbv8=;
 b=BhEJ731u7VnBVk36lF0xFB8D1KIfxQibsVt4kjayyy192ty6TuuOY6W6bT+/KzIzGN
 JB4+qh3hl49C1g09D/iJYTEY5hg1FQkvT2miVnu6k+BpSZeJYetVrvxNvfYFubsQL1Pk
 f/IQObhiP3jLqrxQgYfzXAs57Ob8IoT5k2s88NOo2vge1UUxllsDJ50kDUY9JezwlVNN
 OH7sJNvJRRKQZGnK267AFI/ZHY6QrIaraz2WAE/oDc5SL3WV3I43GGjiOTlM9AGigrQ8
 k7Cx4hFHKai0DZ56RLF1Xpu2q93uHVYOqeqqioYf6nNhVKms3OoAjVnT+eNOhonWOCQW
 j4rQ==
X-Gm-Message-State: AOAM5339vpTv5/vk68QJ7KxAxqJ8tJcTH9mZeet9fo9tg/Dq3vyYa7aA
 HfaUJKYLWlDSTMxtKryCxb1vVFCPaBDJyQ==
X-Google-Smtp-Source: ABdhPJwtTbVVjQ1W2ll43RNguZT5N1bkrhT88ZwnatNXr0G+jwvPyvBlR30OzrV8+zWqYuw0uw7BCA==
X-Received: by 2002:adf:d1cd:: with SMTP id b13mr387631wrd.228.1625241553661; 
 Fri, 02 Jul 2021 08:59:13 -0700 (PDT)
Received: from x1w.Ascou-CH1 (pop.92-184-108-23.mobile.abo.orange.fr.
 [92.184.108.23])
 by smtp.gmail.com with ESMTPSA id p16sm3559040wrs.52.2021.07.02.08.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 08:59:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/sd: Extract address_in_range() helper,
 log invalid accesses
Date: Fri,  2 Jul 2021 17:58:59 +0200
Message-Id: <20210702155900.148665-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210702155900.148665-1-f4bug@amsat.org>
References: <20210702155900.148665-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Michael Olbrich <m.olbrich@pengutronix.de>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Multiple commands have to check the address requested is valid.
Extract this code pattern as a new address_in_range() helper, and
log invalid accesses as guest errors.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20210624142209.1193073-3-f4bug@amsat.org>
---
 hw/sd/sd.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index d8fdf84f4db..9c8dd11bad1 100644
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
 static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 {
     uint32_t rca = 0x0000;
@@ -1218,8 +1230,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         switch (sd->state) {
         case sd_transfer_state:
 
-            if (addr + sd->blk_len > sd->size) {
-                sd->card_status |= ADDRESS_ERROR;
+            if (!address_in_range(sd, "READ_BLOCK", addr, sd->blk_len)) {
                 return sd_r1;
             }
 
@@ -1264,8 +1275,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         switch (sd->state) {
         case sd_transfer_state:
 
-            if (addr + sd->blk_len > sd->size) {
-                sd->card_status |= ADDRESS_ERROR;
+            if (!address_in_range(sd, "WRITE_BLOCK", addr, sd->blk_len)) {
                 return sd_r1;
             }
 
@@ -1325,8 +1335,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
         switch (sd->state) {
         case sd_transfer_state:
-            if (addr >= sd->size) {
-                sd->card_status |= ADDRESS_ERROR;
+            if (!address_in_range(sd, "SET_WRITE_PROT", addr, 1)) {
                 return sd_r1b;
             }
 
@@ -1348,8 +1357,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
         switch (sd->state) {
         case sd_transfer_state:
-            if (addr >= sd->size) {
-                sd->card_status |= ADDRESS_ERROR;
+            if (!address_in_range(sd, "CLR_WRITE_PROT", addr, 1)) {
                 return sd_r1b;
             }
 
@@ -1826,8 +1834,8 @@ void sd_write_byte(SDState *sd, uint8_t value)
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
@@ -1999,8 +2007,8 @@ uint8_t sd_read_byte(SDState *sd)
 
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


