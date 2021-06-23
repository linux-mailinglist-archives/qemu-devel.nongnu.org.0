Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8083B2002
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 20:06:02 +0200 (CEST)
Received: from localhost ([::1]:36742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw7GD-0005De-VA
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 14:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lw7B0-0005Y3-QR; Wed, 23 Jun 2021 14:00:38 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lw7Az-0002xs-32; Wed, 23 Jun 2021 14:00:38 -0400
Received: by mail-wr1-x434.google.com with SMTP id d11so3675054wrm.0;
 Wed, 23 Jun 2021 11:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wuPZLEVYUrQdXTkPJv2jf1ea0rvX6sfWext/yABBJds=;
 b=MPoE+BWr5y2ja5lmBeA3MKMcx0IyHNTPYMcSn9W40i8FP/uND7IAC1pewfMbFtV+Zz
 nPd3BPCim6q1liFJHmzjDf4gDa5tXqBggj7mvjbds/MAS6SuXh9IeC6FP5dLK00k6R57
 zXOZr2xXtT1NzJcZ9CIBSJUggvgteyK5R93djY7ZmR+Z0ESCZfHeCbTkLuW6RZ2sCCt2
 467b4ioL75pqniUW/0oqdsQg6vSzERMjgdamXuUwo8EE1KEcAa6W+bDrxWTsuHTI8xsp
 UXG6qZ70BJVShcAvgC80xaZ153cpQUJERiNF4ejizP1tEPSiGPRFZuKH+rKeynGrgZ2d
 8grA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wuPZLEVYUrQdXTkPJv2jf1ea0rvX6sfWext/yABBJds=;
 b=HwLWWXq8RH/g4RHd+vqhWIP5B2g9j67tyXlLC1D7mju5DKuv/bGZXuO0eCu9ZSnfFn
 5nov0+qBTbXstWSJ6errX8j4dB+RF4YDToaryq6M7p9Ei0+fMSYEeV+tMRfrbohFMxm4
 OIX60xfRCgdpAqpirBTr2RZSRP2pB+87qXNojpRyR+KvNyNxTZrcWNy2ZZ4JgrwqV5lu
 en2nQfS4veAY775ahNilNYc0YX5jDMMGyeVc0Vv8ob2cz1V3W8ZI3JKTG8GJNA1MuZ6+
 6koC98S2oVoHR0/na6nz/RQjY+OyeNH1YTd15+XqzvAFwPK5yRzEG5sz5ZX1axMQu4Em
 /Mbg==
X-Gm-Message-State: AOAM531tagNCDjIPeavAdI/OJoJWZQqlGwiuIvd0gLjUy9PH9AhnaYSp
 TCksB78gICa5IXM+Ca/+ACKRjea3u3LxXw==
X-Google-Smtp-Source: ABdhPJytKYE/ndk82eb538DHXDtsimtqeVvRgEQWWj62ddHRP9AGU9hZ2tnYI3h0Ub0Zx5vQ+YYdQA==
X-Received: by 2002:a05:6000:1281:: with SMTP id
 f1mr1496755wrx.137.1624471234904; 
 Wed, 23 Jun 2021 11:00:34 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id l16sm6821283wmj.47.2021.06.23.11.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 11:00:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/9] hw/sd: Extract address_in_range() helper,
 log invalid accesses
Date: Wed, 23 Jun 2021 20:00:14 +0200
Message-Id: <20210623180021.898286-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623180021.898286-1-f4bug@amsat.org>
References: <20210623180021.898286-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Tom Yan <tom.ty89@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Warner Losh <imp@bsdimp.com>
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


