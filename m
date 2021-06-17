Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 215C53AAFEC
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:39:11 +0200 (CEST)
Received: from localhost ([::1]:55610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltoUQ-0000Jo-4L
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNF-0002hD-3g
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:46 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:42768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoND-00065M-H3
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:44 -0400
Received: by mail-ej1-x62f.google.com with SMTP id di5so2498042ejc.9
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jAqjWDErtnLGwFchY0uK4XqmiFgGys4roy5kdJRxfio=;
 b=V3FS0kO0PUCa3afO+1c26gtBDff5rM19odHbkkSQrlrJ82rr3qiJalJhBmfKP2IYLG
 vsDO1Aaf3TmXXWIqtz2AvGmSvuGbBFyzHk9x8XZ6TvkeKhnKZZUxxtqLWyMx2frpPkVm
 9TY8eJCjPgj8d1UBzhhOYuTKRLSCUyl1YowT4+bFYkUZBFA3JbC07O5zqXT/L4aDtr5a
 hEnLhgLiFw1cui3XuUdZ/Fik8rGE6HV1QWaemZSZ20cXfu60YZct/eIXa7Q37r3CeWPb
 tuwUNbHXn6ETAjxmr5hjM0n+YGFs1w2nB/LDh/lO6aqnGJStlAeoAjUC6LwELQ7UUWAQ
 qmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jAqjWDErtnLGwFchY0uK4XqmiFgGys4roy5kdJRxfio=;
 b=F1CpOdkCRG+0vDHkB4dqhbvOlUcgVHsmk37ypbPO0SGXNlbb4X6UDTShjfsgVQY9Ry
 +bIupZRejZzYbJ6aXzU7v2RmwZXQQW5+muLHbwh7BWFs4ruAL5EObHrmQEh9b5UGE3f1
 yhEvUeoZdsY0xRaFkFPVqcOJdiboz05IlcsgihkmRkFoP4dmONoL17MF1WUDMBZyBgWG
 OircIwhS3hEAXc+CA/HZky2anWA+jaK/he2ZKXEdQVjgGh6IrK69S/F1yR/KQSAwdnXP
 ZYVDNG1S69m0NYLvyWqv2hUxO6vCC7iVtHTemW9cQ0qQw+tqFZmcNSk2NeE5bNLpMIxS
 1Vkw==
X-Gm-Message-State: AOAM532lf+BpGX+LwWkGpXmKbXFsXIwetQ3YryrpDPfZ8SOAtYnd7MWt
 BaAYEmbjapwL5dk6gRu6OcntxUIpnCY=
X-Google-Smtp-Source: ABdhPJzOoXZMzhEvfZNVxI1dqEgB0uWM82s+DSy1CV+0IcaE+0INqCO8Zl+PCg6buehcnJDjYqqiVQ==
X-Received: by 2002:a17:907:9047:: with SMTP id
 az7mr4257080ejc.4.1623922302164; 
 Thu, 17 Jun 2021 02:31:42 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:31:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/45] esp: ensure PDMA write transfers are flushed from the
 FIFO to the target immediately
Date: Thu, 17 Jun 2021 11:30:59 +0200
Message-Id: <20210617093134.900014-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

After each PDMA write transfer the MacOS CDROM driver waits until the FIFO is empty
(i.e. its contents have been written out to the SCSI bus) by polling the FIFO count
register until it reads 0. This doesn't work with the current PDMA write
implementation which waits until either the FIFO is full or the transfer is complete
before invoking the PDMA callback to process the FIFO contents.

Change the PDMA write transfer logic so that the PDMA callback is invoked after each
PDMA write to transfer the FIFO contents to the target buffer immediately, and hence
avoid getting stuck in the FIFO count register polling loop.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20210519100803.10293-4-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/esp.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index a0dab319f2..8e314ef156 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -338,9 +338,9 @@ static void do_cmd(ESPState *s)
 
 static void satn_pdma_cb(ESPState *s)
 {
-    s->do_cmd = 0;
-    if (!fifo8_is_empty(&s->cmdfifo)) {
+    if (!esp_get_tc(s) && !fifo8_is_empty(&s->cmdfifo)) {
         s->cmdfifo_cdb_offset = 1;
+        s->do_cmd = 0;
         do_cmd(s);
     }
 }
@@ -369,12 +369,9 @@ static void handle_satn(ESPState *s)
 
 static void s_without_satn_pdma_cb(ESPState *s)
 {
-    uint32_t len;
-
-    s->do_cmd = 0;
-    len = fifo8_num_used(&s->cmdfifo);
-    if (len) {
+    if (!esp_get_tc(s) && !fifo8_is_empty(&s->cmdfifo)) {
         s->cmdfifo_cdb_offset = 0;
+        s->do_cmd = 0;
         do_busid_cmd(s, 0);
     }
 }
@@ -403,8 +400,7 @@ static void handle_s_without_atn(ESPState *s)
 
 static void satn_stop_pdma_cb(ESPState *s)
 {
-    s->do_cmd = 0;
-    if (!fifo8_is_empty(&s->cmdfifo)) {
+    if (!esp_get_tc(s) && !fifo8_is_empty(&s->cmdfifo)) {
         trace_esp_handle_satn_stop(fifo8_num_used(&s->cmdfifo));
         s->do_cmd = 1;
         s->cmdfifo_cdb_offset = 1;
@@ -493,6 +489,11 @@ static void do_dma_pdma_cb(ESPState *s)
     uint32_t n;
 
     if (s->do_cmd) {
+        /* Ensure we have received complete command after SATN and stop */
+        if (esp_get_tc(s) || fifo8_is_empty(&s->cmdfifo)) {
+            return;
+        }
+
         s->ti_size = 0;
         s->do_cmd = 0;
         do_cmd(s);
@@ -1220,7 +1221,6 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
 {
     SysBusESPState *sysbus = opaque;
     ESPState *s = ESP(&sysbus->esp);
-    uint32_t dmalen;
 
     trace_esp_pdma_write(size);
 
@@ -1233,10 +1233,7 @@ static void sysbus_esp_pdma_write(void *opaque, hwaddr addr,
         esp_pdma_write(s, val);
         break;
     }
-    dmalen = esp_get_tc(s);
-    if (dmalen == 0 || fifo8_num_free(&s->fifo) < 2) {
-        s->pdma_cb(s);
-    }
+    s->pdma_cb(s);
 }
 
 static uint64_t sysbus_esp_pdma_read(void *opaque, hwaddr addr,
-- 
2.31.1



