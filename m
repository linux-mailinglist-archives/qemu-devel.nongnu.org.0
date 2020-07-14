Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE4F21F37C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 16:06:46 +0200 (CEST)
Received: from localhost ([::1]:45634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvLa1-0007t7-9S
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 10:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jvLS4-0004NI-92; Tue, 14 Jul 2020 09:58:32 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:38925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jvLS2-0003SL-EG; Tue, 14 Jul 2020 09:58:31 -0400
Received: by mail-wr1-x442.google.com with SMTP id q5so21792917wru.6;
 Tue, 14 Jul 2020 06:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W0+4/XZhJEEqb40F6krDQlUM+mPLO0uytUGRIoUNtDA=;
 b=eVa22wGQBf/WW2MmnELEUYTMHFNQc4y8BDPWZy4BYWYo/pIt5Az7jzucHzwnh7PQPL
 k1foFqhijf6Q7bUBxPRC8M+oUzn5nxTbd9yHLl+TuZ8l+BWJ4dDaQOKNRY8yvnrkvLan
 w3ZhW/ASxEVAGOdlSh88B08tjgpEBeGUlp9MIvEFMhkQplpEaaNgnTGlGkVc8DpN4GbM
 lenJaB+GsgTyMaF7oj6517z+ZiVUqm3Up9AhPj4mXvRExG03q3UDhn5sQYAkvtCJn2VM
 ep4FqYfU1ympEN/DaQ4BQaQ0mNKDIt0kOWrF/ip3DSDmfNaFkCc3YEoLOewYFWoXsLmG
 IAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=W0+4/XZhJEEqb40F6krDQlUM+mPLO0uytUGRIoUNtDA=;
 b=aVW7SEVE98DHZGKPhYGPiDmK4rbQ8KdzVTyKl8y49j1ipe6Wllh5B57FiNooSEQd3g
 IvxDqwKS86iKDb7UfsebSiQvuz0wYAz1UOCfXVqj1Gj8ORqPjdG7tz9g90+PVYOTtIJM
 lci1RuXevaFgYUT0jnuzQ+A8QAY9UhJD6IUEX+Nf4HucAgiUyKA48ro0IdaIpgEdiLmI
 0ZGGJbdH5yTqScRn/pbN2GLZR3uEXINTYZD3Vvb1YozRJslQsKfCnDGy5/9y50FKhqvT
 n9J3J6T1CA/5KYMQT53fogY7pIWNykjkvG+g5Zv2+wMoMUknTBvV/LvzQSvBy7miNSFH
 P0Lg==
X-Gm-Message-State: AOAM533xgIAeHLmymABuS6AxjEF7ni9uzDec1T2PM4WyIGrz6uhWj5g3
 qIkxsPQ7jIdavfHWKE4wBgtb5mHOUmw=
X-Google-Smtp-Source: ABdhPJz6sPO3GCpRtcYHGIPZmCIo5qHlzepNW2lR+bjOR2BNEmvaeBjA5TrABDAUdoMSFyElvKtaVQ==
X-Received: by 2002:adf:bc41:: with SMTP id a1mr5545739wrh.186.1594735107880; 
 Tue, 14 Jul 2020 06:58:27 -0700 (PDT)
Received: from localhost.localdomain
 (138.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id k14sm29145343wrn.76.2020.07.14.06.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 06:58:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 9/9] hw/sd/sdcard: Do not switch to ReceivingData if address is
 invalid
Date: Tue, 14 Jul 2020 15:58:14 +0200
Message-Id: <20200714135814.19910-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200714135814.19910-1-f4bug@amsat.org>
References: <20200714135814.19910-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-stable@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only move the state machine to ReceivingData if there is no
pending error. This avoids later OOB access while processing
commands queued.

  "SD Specifications Part 1 Physical Layer Simplified Spec. v3.01"

  4.3.3 Data Read

  Read command is rejected if BLOCK_LEN_ERROR or ADDRESS_ERROR
  occurred and no data transfer is performed.

  4.3.4 Data Write

  Write command is rejected if BLOCK_LEN_ERROR or ADDRESS_ERROR
  occurred and no data transfer is performed.

WP_VIOLATION errors are not modified: the error bit is set, we
stay in receive-data state, wait for a stop command. All further
data transfer is ignored. See the check on sd->card_status at the
beginning of sd_read_data() and sd_write_data().

Fixes: CVE-2020-13253
Cc: qemu-stable@nongnu.org
Reported-by: Alexander Bulekov <alxndr@bu.edu>
Buglink: https://bugs.launchpad.net/qemu/+bug/1880822
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20200630133912.9428-6-f4bug@amsat.org>
---
 hw/sd/sd.c | 38 ++++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index f4f76f8fd2..fad9cf1ee7 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1171,13 +1171,15 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
     case 17:	/* CMD17:  READ_SINGLE_BLOCK */
         switch (sd->state) {
         case sd_transfer_state:
+
+            if (addr + sd->blk_len > sd->size) {
+                sd->card_status |= ADDRESS_ERROR;
+                return sd_r1;
+            }
+
             sd->state = sd_sendingdata_state;
             sd->data_start = addr;
             sd->data_offset = 0;
-
-            if (sd->data_start + sd->blk_len > sd->size) {
-                sd->card_status |= ADDRESS_ERROR;
-            }
             return sd_r1;
 
         default:
@@ -1188,13 +1190,15 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
     case 18:	/* CMD18:  READ_MULTIPLE_BLOCK */
         switch (sd->state) {
         case sd_transfer_state:
+
+            if (addr + sd->blk_len > sd->size) {
+                sd->card_status |= ADDRESS_ERROR;
+                return sd_r1;
+            }
+
             sd->state = sd_sendingdata_state;
             sd->data_start = addr;
             sd->data_offset = 0;
-
-            if (sd->data_start + sd->blk_len > sd->size) {
-                sd->card_status |= ADDRESS_ERROR;
-            }
             return sd_r1;
 
         default:
@@ -1234,14 +1238,17 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
             /* Writing in SPI mode not implemented.  */
             if (sd->spi)
                 break;
+
+            if (addr + sd->blk_len > sd->size) {
+                sd->card_status |= ADDRESS_ERROR;
+                return sd_r1;
+            }
+
             sd->state = sd_receivingdata_state;
             sd->data_start = addr;
             sd->data_offset = 0;
             sd->blk_written = 0;
 
-            if (sd->data_start + sd->blk_len > sd->size) {
-                sd->card_status |= ADDRESS_ERROR;
-            }
             if (sd_wp_addr(sd, sd->data_start)) {
                 sd->card_status |= WP_VIOLATION;
             }
@@ -1261,14 +1268,17 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
             /* Writing in SPI mode not implemented.  */
             if (sd->spi)
                 break;
+
+            if (addr + sd->blk_len > sd->size) {
+                sd->card_status |= ADDRESS_ERROR;
+                return sd_r1;
+            }
+
             sd->state = sd_receivingdata_state;
             sd->data_start = addr;
             sd->data_offset = 0;
             sd->blk_written = 0;
 
-            if (sd->data_start + sd->blk_len > sd->size) {
-                sd->card_status |= ADDRESS_ERROR;
-            }
             if (sd_wp_addr(sd, sd->data_start)) {
                 sd->card_status |= WP_VIOLATION;
             }
-- 
2.21.3


