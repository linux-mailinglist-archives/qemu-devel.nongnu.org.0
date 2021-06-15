Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A844F3A8152
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 15:49:18 +0200 (CEST)
Received: from localhost ([::1]:33794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9RN-0006m7-Nc
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 09:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9He-0005mo-IF
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:14 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:38695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Hc-0002kJ-S6
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:14 -0400
Received: by mail-ej1-x632.google.com with SMTP id og14so22674223ejc.5
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 06:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G80CxhJzBDhoAJSgUulDg325vJO9fD6ZEzEYxclyxvY=;
 b=Amjo16He5pZihC1BDqn2qy2u0aWah4zJEj8aoL+sudKguyl0XD1xFgQWQ2AY7LEBK2
 aXgj5cm7+slOha+oyzuikzboBglSqr/0BqzNTHPOyLPjhLZV5qn7PMYj3CRRlHXL4q1S
 HdJwaDvBXgwrHPJmpvKvo4jiRbhvG381mvT9LlVgYPyGxSv6uELq8a0xxE8vLDttTpMa
 TfCtTrA0AaDyxmZVxjud7zUxKcSN4qeROAdzjP1AzmD23DiB3PpmYS/BqVoqehmygXAN
 7OY2apZdDFSn9pvCOJ05gGZ4PLzMV6bXdHPuAqFKv2QSlo7dpsNSfmf8aGA8v2aDxTSu
 p8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=G80CxhJzBDhoAJSgUulDg325vJO9fD6ZEzEYxclyxvY=;
 b=NK0J/AKmkoDMS2cFskz7Qc3b3azaX44IZI5k2yX4azn7/hMRx09XiH2yteUfEJzK8o
 mWJq5S080WAI+PjIH70Q29faWIhBRZxaAb58oEGjCuWJ7AMWWJN8w2niUN+uEipxwseb
 zSd1EZjWJTHfbkDDhQuH+dFpoYU0JWFtlO6oda+fFEEVDD1g8ifWFxEmGncKcuXADV59
 bUq4DRw1ERrVMje5ruvWFFN9emSa+/WGh23ZmenPm7XKAd4KV557t/+xoGkjXLHaMSVn
 ba4LdpJstlAjKqkAg/5WMeV05bn44mi4mShA2jW/2Lt8d4NNfqvGbFiVMdpuW6/wpgLJ
 DCFA==
X-Gm-Message-State: AOAM530CyWtGii7U1e65odvute35DuGa1ae8VbxQD64D3Cw0SzbyaHKh
 MOUTKq8LV9YoryjgEt8LqMHBGExl2v4=
X-Google-Smtp-Source: ABdhPJzRfILg7zjHKUFQBJETU9kJwpBDMByfRkw1teSJJ5BpHfbVtWfBAGI9sUhEtfq58EQgjVCpAw==
X-Received: by 2002:a17:906:7c10:: with SMTP id
 t16mr20073820ejo.204.1623764351522; 
 Tue, 15 Jun 2021 06:39:11 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r17sm11843769edt.33.2021.06.15.06.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 06:39:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/33] esp: store lun coming from the MESSAGE OUT phase
Date: Tue, 15 Jun 2021 15:38:36 +0200
Message-Id: <20210615133855.775687-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615133855.775687-1-pbonzini@redhat.com>
References: <20210615133855.775687-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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

The LUN is selected with an IDENTIFY message, and persists
until the next message out phase.  Instead of passing it to
do_busid_cmd, store it in ESPState.  Because do_cmd can simply
skip the message out phase if cmdfifo_cdb_offset is zero, it
can now be used for the S without ATN cases as well.

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/esp.c         | 47 ++++++++++++++++++++++++++++---------------
 hw/scsi/trace-events  |  3 ++-
 include/hw/scsi/esp.h |  1 +
 3 files changed, 34 insertions(+), 17 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 8fad87be9d..4ac2114788 100644
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
@@ -1131,6 +1137,14 @@ static bool esp_is_version_5(void *opaque, int version_id)
     return version_id >= 5;
 }
 
+static bool esp_is_version_6(void *opaque, int version_id)
+{
+    ESPState *s = ESP(opaque);
+
+    version_id = MIN(version_id, s->mig_version_id);
+    return version_id >= 6;
+}
+
 int esp_pre_save(void *opaque)
 {
     ESPState *s = ESP(object_resolve_path_component(
@@ -1168,7 +1182,7 @@ static int esp_post_load(void *opaque, int version_id)
 
 const VMStateDescription vmstate_esp = {
     .name = "esp",
-    .version_id = 5,
+    .version_id = 6,
     .minimum_version_id = 3,
     .post_load = esp_post_load,
     .fields = (VMStateField[]) {
@@ -1197,6 +1211,7 @@ const VMStateDescription vmstate_esp = {
         VMSTATE_FIFO8_TEST(fifo, ESPState, esp_is_version_5),
         VMSTATE_FIFO8_TEST(cmdfifo, ESPState, esp_is_version_5),
         VMSTATE_UINT8_TEST(ti_cmd, ESPState, esp_is_version_5),
+        VMSTATE_UINT8_TEST(lun, ESPState, esp_is_version_6),
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



