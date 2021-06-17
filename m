Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 118033AB00D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:45:23 +0200 (CEST)
Received: from localhost ([::1]:51218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltoaQ-0007mm-3F
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:45:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNE-0002gx-WC
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:46 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:41664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNC-00064r-Qa
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:44 -0400
Received: by mail-ej1-x634.google.com with SMTP id ho18so8720092ejc.8
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=52yK9tDksrAnMSuBE9k75TLafvWVHLG9kcmE/+mL6v8=;
 b=uPGZouCc1370kKoTE7lCT4N/fWC5VVMfNgl3VKSiu6sO9bWm01uVphDjGVzeY/Sj9f
 onW1Fbg8ZfSeF85GcxItnl2UUZl2dBH4+m5MXZnoSIbZUGE0W4S3cFh7BLPb+YqI7xs2
 IYt3alX7xXJuooUZMHvKdE78RdLR2LanhpLYUu4CwCNcgTFk+pEC0n5wsXEbFEm/3EMF
 YSctoAv4UO4Kaz6k9A6QmTNlmmNcNGmXhQGgbtne5WuBMVytHh5r9ykCrqczV2Kw8qgU
 BYgpRZ22O6lXrPftQsJt0Aq36YuOPuVGidpDbZUOEASS2b0KMiPXpIEAoaO2c8t0hziX
 SvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=52yK9tDksrAnMSuBE9k75TLafvWVHLG9kcmE/+mL6v8=;
 b=WQjEqJuGESX5XnVAENh9CkMKGoYGt3/JIP43QHxjA6gLYaO6KJsoB+L2pNOAoTsObC
 L0O5CTJL9aWzCLc7Nj0CH61GkSvnVl1liuq9KTRYh+WTiBL+5gUr8XfaEv2k7ca9lURL
 kqR/0YkfpI312UojAb3y6vAMJNzt8K34gnR712btDt1GOlw7YdVal9ow4FbXk8agpeH0
 gwO4WrkD8kybHilSBe7tM2Ti/KrsAat8rsrVX7yvVpmu7lBx7QkEq6K9RVtO0gMUu99j
 fyTECF01gr6JhSd0LGwEht01hNKAcQOoDF33gNqmbumklbaJRMvdXDKaw3/JAYzOR+Nq
 zJKQ==
X-Gm-Message-State: AOAM531QOeOUyqxPDCKEGoJDtSIc0s72z9yiTXvDKKbanThFKXy6zDty
 qmfZ+loQebGpGqZnRP4AVVl8+dEsAB0=
X-Google-Smtp-Source: ABdhPJzLFTEuhQgEg+s5piM8r/6XyM7qGYdehbzJG8SPSgyMINrEJZEoSZp/MY24NE+gVw108PJ/VQ==
X-Received: by 2002:a17:907:2636:: with SMTP id
 aq22mr4305925ejc.48.1623922301466; 
 Thu, 17 Jun 2021 02:31:41 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:31:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/45] esp: handle non-DMA transfers from the target one byte
 at a time
Date: Thu, 17 Jun 2021 11:30:58 +0200
Message-Id: <20210617093134.900014-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
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

The initial implementation of non-DMA transfers was based upon analysis of traces
from the MacOS toolbox ROM for handling unaligned reads but missed one key
aspect - during a non-DMA transfer from the target, the bus service interrupt
should be raised for every single byte received from the bus and not just at either
the end of the transfer or when the FIFO is full.

Adjust the non-DMA code accordingly so that esp_do_nodma() is called for every byte
received from the target. This also includes special handling for managing the change
from DATA IN to STATUS phase as this needs to occur when the final byte is read out
from the FIFO, and not at the end of the transfer of the last byte into the FIFO.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20210519100803.10293-3-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/esp.c | 72 +++++++++++++++++++++++++++++++++++----------------
 1 file changed, 50 insertions(+), 22 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 50757e9264..a0dab319f2 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -739,20 +739,17 @@ static void esp_do_nodma(ESPState *s)
         s->async_len -= len;
         s->ti_size += len;
     } else {
-        len = MIN(s->ti_size, s->async_len);
-        len = MIN(len, fifo8_num_free(&s->fifo));
-        fifo8_push_all(&s->fifo, s->async_buf, len);
-        s->async_buf += len;
-        s->async_len -= len;
-        s->ti_size -= len;
+        if (fifo8_is_empty(&s->fifo)) {
+            fifo8_push(&s->fifo, s->async_buf[0]);
+            s->async_buf++;
+            s->async_len--;
+            s->ti_size--;
+        }
     }
 
     if (s->async_len == 0) {
         scsi_req_continue(s->current_req);
-
-        if (to_device || s->ti_size == 0) {
-            return;
-        }
+        return;
     }
 
     s->rregs[ESP_RINTR] |= INTR_BS;
@@ -762,20 +759,37 @@ static void esp_do_nodma(ESPState *s)
 void esp_command_complete(SCSIRequest *req, size_t resid)
 {
     ESPState *s = req->hba_private;
+    int to_device = ((s->rregs[ESP_RSTAT] & 7) == STAT_DO);
 
     trace_esp_command_complete();
-    if (s->ti_size != 0) {
-        trace_esp_command_complete_unexpected();
+
+    /*
+     * Non-DMA transfers from the target will leave the last byte in
+     * the FIFO so don't reset ti_size in this case
+     */
+    if (s->dma || to_device) {
+        if (s->ti_size != 0) {
+            trace_esp_command_complete_unexpected();
+        }
+        s->ti_size = 0;
     }
-    s->ti_size = 0;
+
     s->async_len = 0;
     if (req->status) {
         trace_esp_command_complete_fail();
     }
     s->status = req->status;
-    s->rregs[ESP_RSTAT] = STAT_ST;
-    esp_dma_done(s);
-    esp_lower_drq(s);
+
+    /*
+     * If the transfer is finished, switch to status phase. For non-DMA
+     * transfers from the target the last byte is still in the FIFO
+     */
+    if (s->ti_size == 0) {
+        s->rregs[ESP_RSTAT] = STAT_TC | STAT_ST;
+        esp_dma_done(s);
+        esp_lower_drq(s);
+    }
+
     if (s->current_req) {
         scsi_req_unref(s->current_req);
         s->current_req = NULL;
@@ -894,6 +908,17 @@ uint64_t esp_reg_read(ESPState *s, uint32_t saddr)
             qemu_log_mask(LOG_UNIMP, "esp: PIO data read not implemented\n");
             s->rregs[ESP_FIFO] = 0;
         } else {
+            if ((s->rregs[ESP_RSTAT] & 0x7) == STAT_DI) {
+                if (s->ti_size) {
+                    esp_do_nodma(s);
+                } else {
+                    /*
+                     * The last byte of a non-DMA transfer has been read out
+                     * of the FIFO so switch to status phase
+                     */
+                    s->rregs[ESP_RSTAT] = STAT_TC | STAT_ST;
+                }
+            }
             s->rregs[ESP_FIFO] = esp_fifo_pop(&s->fifo);
         }
         val = s->rregs[ESP_FIFO];
@@ -952,15 +977,18 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
     case ESP_FIFO:
         if (s->do_cmd) {
             esp_fifo_push(&s->cmdfifo, val);
+
+            /*
+             * If any unexpected message out/command phase data is
+             * transferred using non-DMA, raise the interrupt
+             */
+            if (s->rregs[ESP_CMD] == CMD_TI) {
+                s->rregs[ESP_RINTR] |= INTR_BS;
+                esp_raise_irq(s);
+            }
         } else {
             esp_fifo_push(&s->fifo, val);
         }
-
-        /* Non-DMA transfers raise an interrupt after every byte */
-        if (s->rregs[ESP_CMD] == CMD_TI) {
-            s->rregs[ESP_RINTR] |= INTR_FC | INTR_BS;
-            esp_raise_irq(s);
-        }
         break;
     case ESP_CMD:
         s->rregs[saddr] = val;
-- 
2.31.1



