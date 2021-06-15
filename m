Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D87C53A8114
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 15:43:05 +0200 (CEST)
Received: from localhost ([::1]:40768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9LM-0000yI-S0
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 09:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Hb-0005e1-1R
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:11 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:38823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9HV-0002gt-Nl
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:07 -0400
Received: by mail-ed1-x536.google.com with SMTP id t7so5973645edd.5
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 06:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=52yK9tDksrAnMSuBE9k75TLafvWVHLG9kcmE/+mL6v8=;
 b=k16ZrRDY89wZpfPBjRQfJr5fMQIoVQGqw74R/gbXVxnCCJpDShiA/EwakZO6pjMDxv
 FQ2Zeh4EyyCOiflgnOdA4bibh4+JLLKkW3yLs6onD5W4qspHAYzqD3sBZZKzIfH8uR/i
 /foMzd1+kyrFxkExWUXyt2r9mDrYNIhp/vp1r4FBfqCL06KYlWIY6wiVZnuv1ei/fQm7
 illSx6J7gXa1+C7b0k6YUcRWzWtwYcRStT4Sfa/MtlouxlJxofy4C+9uvSZT6WMPx8uA
 xwx3nEcb5qduIXLZx6UNTo3POiPfihztMWeQ37OjrUxkrs3rTICDLP+XMB4K8ejfvyFy
 +m5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=52yK9tDksrAnMSuBE9k75TLafvWVHLG9kcmE/+mL6v8=;
 b=Q1jJqX9FtYgwppiVGAJcd+JNkXj/pTIJTiH//bDi6vdWmAnjNbu6CCheUNu5Zd/bOv
 McSv9PfKqnFGrqQ88ORsrMsUT/iRPNUt7NmbkekMTyEmb18meyF8cW6VXxDxsGFx5EXT
 +puNEdYuM6UexKyVK+n1kGbb/7POTtUFCNW9JVnqs4g7V2lOoOz1aSbc37MvxTWek2N1
 18LY9IB+VAYX6KIoI/eFBFgRk5x9mbjYLldbIhx1KuLdjFx2VAlpWeTPYXnkVo0SIPTt
 0eUyUmdQ+5yxXntdCRV2rPF2B+uYhYtxWZFFxTyktxGcRie0xnyOqm5b5gUsFbcnvQK5
 /t6A==
X-Gm-Message-State: AOAM5337eNhOOgM471eRWlY9fCJt4q/2tWmg8HbQnIYKPen6nD6m39qk
 i7NS1h/3umNY/miRKVvnoswPzS+C0EE=
X-Google-Smtp-Source: ABdhPJxLHkxnwxcGFZ6X4SWgavacD8RIqEWiO/HRDrmFpT5xSzsoSZ9On5NGkNDRfj1XFoZcDdXaOg==
X-Received: by 2002:a05:6402:49a:: with SMTP id
 k26mr23328171edv.279.1623764344017; 
 Tue, 15 Jun 2021 06:39:04 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r17sm11843769edt.33.2021.06.15.06.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 06:39:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/33] esp: handle non-DMA transfers from the target one byte
 at a time
Date: Tue, 15 Jun 2021 15:38:31 +0200
Message-Id: <20210615133855.775687-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615133855.775687-1-pbonzini@redhat.com>
References: <20210615133855.775687-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
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



