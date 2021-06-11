Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B77F03A418B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 13:58:57 +0200 (CEST)
Received: from localhost ([::1]:33632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrfoO-0007j1-Kg
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 07:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lrfnV-00073Y-WF
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 07:58:02 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lrfnT-0008Gc-Q1
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 07:58:01 -0400
Received: by mail-wr1-x42f.google.com with SMTP id z8so5773305wrp.12
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 04:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J4auQSqVwz21QzkhKqRsf1Ig2lM0cLgyAy9bW4kjzIY=;
 b=HXkEfLslLSy8NWd5pQ3RVIPQwS7oJ6fDTuHCs99pmItYJv6ffEg2F6fVqH1o+U4eZ6
 OvLRWOgI1JZOFASXGftHjOHTTeII8h5b5vFr7lkfd7VPjukLvgaZ0TZjiofIcqBLRSdF
 qC5fdWsIBMWBmwifJOVkxuYo6uWFQobFg0eJNsEN1rVQgANXH3Yi92uSd5ZTt08D5gQs
 mRJWwWgBvOlcrlRu2bOxRqbIDKGIw88UXfGY/DKqtxEOzyXtNzj9wmoCK1KsS7V3mR1n
 WGugsuLAYyCFCPIaqeW3fvWdV7gQxRNX6y8qGj9fgiztRcLkWSCAPydM/5IwhO1w12p2
 DIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=J4auQSqVwz21QzkhKqRsf1Ig2lM0cLgyAy9bW4kjzIY=;
 b=n/tzWEo8JFKwdbFixC8qG0dq8TtXwwqyNO7tcjjTwKq58bxFiZlUvlzQwW+jCStEgA
 sBtoXRwWUPSd3fnYKxTW01BQv8qHDCNZx2YBjaS8rQaNauG05tArfxZe2kmcBjTbGSIY
 w8/rHyLwEA2jRKcn5nuoQNHncAAHdwpL/U8BmD7iqtjRQxZ1PgVaW9WKeIRefHjDCCcR
 +mHRQfAoCGcOPszreLmXAOA4aB5KVus6z4cowAro1KroJIgUlL+e3SYua4m4M63DGqsX
 q46gME3/UTMbOpmGNtt8xcxJZ3lAT7W3bSMNOkOHQomXxFJg3GWJsdGVKgB/6Lu3NJ8t
 2umw==
X-Gm-Message-State: AOAM532FXDjaknC60mHolVhKAX1vEQ1LT2RNQ01T1Mwpf+ZeISbrRxWO
 SDe/Hs6LD3oxRZAFQPOe3RkQdj6QZVbs8g==
X-Google-Smtp-Source: ABdhPJwWjyZEgrbCn7D/PTED7+udsEEuOOd0pDrs+RLd+1FMy3MDdSpP3NTxemVrUECxca+nek1sSA==
X-Received: by 2002:adf:fa46:: with SMTP id y6mr3705487wrr.194.1623412678249; 
 Fri, 11 Jun 2021 04:57:58 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b15sm6430750wru.64.2021.06.11.04.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 04:57:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] esp: store lun coming from the MESSAGE OUT phase
Date: Fri, 11 Jun 2021 13:57:56 +0200
Message-Id: <20210611115756.662367-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: mark.cave-ayland@ilande.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The LUN is selected with an IDENTIFY message, and persists
until the next message out phase.  Instead of passing it to
do_busid_cmd, store it in ESPState.  Because do_cmd can simply
skip the message out phase if cmdfifo_cdb_offset is zero, it
can now be used for the S without ATN cases as well.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/esp.c         | 39 +++++++++++++++++++++++----------------
 hw/scsi/trace-events  |  3 ++-
 include/hw/scsi/esp.h |  1 +
 3 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 3e6f4094fc..1f1c02de79 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -221,7 +221,7 @@ static int esp_select(ESPState *s)
 
     /*
      * Note that we deliberately don't raise the IRQ here: this will be done
-     * either in do_busid_cmd() for DATA OUT transfers or by the deferred
+     * either in do_command_phase() for DATA OUT transfers or by the deferred
      * IRQ mechanism in esp_transfer_data() for DATA IN transfers
      */
     s->rregs[ESP_RINTR] |= INTR_FC;
@@ -272,24 +272,22 @@ static uint32_t get_cmd(ESPState *s, uint32_t maxlen)
     return dmalen;
 }
 
-static void do_busid_cmd(ESPState *s, uint8_t busid)
+static void do_command_phase(ESPState *s)
 {
     uint32_t cmdlen;
     int32_t datalen;
-    int lun;
     SCSIDevice *current_lun;
     uint8_t buf[ESP_CMDFIFO_SZ];
 
-    trace_esp_do_busid_cmd(busid);
-    lun = busid & 7;
+    trace_esp_do_command_phase(s->lun);
     cmdlen = fifo8_num_used(&s->cmdfifo);
     if (!cmdlen || !s->current_dev) {
         return;
     }
     esp_fifo_pop_buf(&s->cmdfifo, buf, cmdlen);
 
-    current_lun = scsi_device_find(&s->bus, 0, s->current_dev->id, lun);
-    s->current_req = scsi_req_new(current_lun, 0, lun, buf, s);
+    current_lun = scsi_device_find(&s->bus, 0, s->current_dev->id, s->lun);
+    s->current_req = scsi_req_new(current_lun, 0, s->lun, buf, s);
     datalen = scsi_req_enqueue(s->current_req);
     s->ti_size = datalen;
     fifo8_reset(&s->cmdfifo);
@@ -316,21 +314,29 @@ static void do_busid_cmd(ESPState *s, uint8_t busid)
     }
 }
 
-static void do_cmd(ESPState *s)
+static void do_message_phase(ESPState *s)
 {
-    uint8_t busid = esp_fifo_pop(&s->cmdfifo);
-    int len;
+    if (s->cmdfifo_cdb_offset) {
+        uint8_t message = esp_fifo_pop(&s->cmdfifo);
 
-    s->cmdfifo_cdb_offset--;
+        trace_esp_do_identify(message);
+        s->lun = message & 7;
+        s->cmdfifo_cdb_offset--;
+    }
 
     /* Ignore extended messages for now */
     if (s->cmdfifo_cdb_offset) {
-        len = MIN(s->cmdfifo_cdb_offset, fifo8_num_used(&s->cmdfifo));
+        int len = MIN(s->cmdfifo_cdb_offset, fifo8_num_used(&s->cmdfifo));
         esp_fifo_pop_buf(&s->cmdfifo, NULL, len);
         s->cmdfifo_cdb_offset = 0;
     }
+}
 
-    do_busid_cmd(s, busid);
+static void do_cmd(ESPState *s)
+{
+    do_message_phase(s);
+    assert(s->cmdfifo_cdb_offset == 0);
+    do_command_phase(s);
 }
 
 static void satn_pdma_cb(ESPState *s)
@@ -369,7 +375,7 @@ static void s_without_satn_pdma_cb(ESPState *s)
     if (!esp_get_tc(s) && !fifo8_is_empty(&s->cmdfifo)) {
         s->cmdfifo_cdb_offset = 0;
         s->do_cmd = 0;
-        do_busid_cmd(s, 0);
+        do_cmd(s);
     }
 }
 
@@ -386,7 +392,7 @@ static void handle_s_without_atn(ESPState *s)
     if (cmdlen > 0) {
         s->cmdfifo_cdb_offset = 0;
         s->do_cmd = 0;
-        do_busid_cmd(s, 0);
+        do_cmd(s);
     } else if (cmdlen == 0) {
         s->do_cmd = 1;
         /* Target present, but no cmd yet - switch to command phase */
@@ -1168,7 +1174,7 @@ static int esp_post_load(void *opaque, int version_id)
 
 const VMStateDescription vmstate_esp = {
     .name = "esp",
-    .version_id = 5,
+    .version_id = 6,
     .minimum_version_id = 3,
     .post_load = esp_post_load,
     .fields = (VMStateField[]) {
@@ -1197,6 +1203,7 @@ const VMStateDescription vmstate_esp = {
         VMSTATE_FIFO8_TEST(fifo, ESPState, esp_is_version_5),
         VMSTATE_FIFO8_TEST(cmdfifo, ESPState, esp_is_version_5),
         VMSTATE_UINT8_TEST(ti_cmd, ESPState, esp_is_version_5),
+        VMSTATE_UINT8_V(lun, ESPState, 6),
         VMSTATE_END_OF_LIST()
     },
 };
diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
index 1a27e141ae..92d5b40f89 100644
--- a/hw/scsi/trace-events
+++ b/hw/scsi/trace-events
@@ -166,7 +166,8 @@ esp_dma_disable(void) "Lower enable"
 esp_pdma_read(int size) "pDMA read %u bytes"
 esp_pdma_write(int size) "pDMA write %u bytes"
 esp_get_cmd(uint32_t dmalen, int target) "len %d target %d"
-esp_do_busid_cmd(uint8_t busid) "busid 0x%x"
+esp_do_command_phase(uint8_t busid) "busid 0x%x"
+esp_do_identify(uint8_t byte) "0x%x"
 esp_handle_satn_stop(uint32_t cmdlen) "cmdlen %d"
 esp_write_response(uint32_t status) "Transfer status (status=%d)"
 esp_do_dma(uint32_t cmdlen, uint32_t len) "command len %d + %d"
diff --git a/include/hw/scsi/esp.h b/include/hw/scsi/esp.h
index aada3680b7..b1ec27612f 100644
--- a/include/hw/scsi/esp.h
+++ b/include/hw/scsi/esp.h
@@ -37,6 +37,7 @@ struct ESPState {
     SCSIRequest *current_req;
     Fifo8 cmdfifo;
     uint8_t cmdfifo_cdb_offset;
+    uint8_t lun;
     uint32_t do_cmd;
 
     bool data_in_ready;
-- 
2.31.1


