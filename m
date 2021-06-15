Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5615B3A816F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 15:53:00 +0200 (CEST)
Received: from localhost ([::1]:46446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9Ux-0006q4-Am
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 09:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Hc-0005hE-Hu
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:12 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:42761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Ha-0002iR-RI
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:12 -0400
Received: by mail-ej1-x630.google.com with SMTP id k25so22660065eja.9
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 06:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jAqjWDErtnLGwFchY0uK4XqmiFgGys4roy5kdJRxfio=;
 b=gxOX45+k4t428q89lRvRZoGga2QWxZ+yY7hxk+rVGRDCThlmnE0wc7uH36YAadc9VH
 tsBaga6GmZ2hM6y/PonpEAkSNXL6ENLTCQAGqCbaIMGKKhrCmY6tQSUp9Ov0xNW8yyk0
 si7vdP0g8ZvEpGytN2VubFWtcPYYsdafrldQIzkYKVDSbj8pWHgV9blDlFfuuPCf9Q3K
 tquegGVmDiE3DuTNDTI/ExEnu56wP3AMpJLljpmETZ/XlZv0DXFhiW3v2i9wFAJBw3ZE
 YWRVocgJycHKGWj0dq5wGKoLyq2bLJv0zKj1In0b7Rry12V2EgAGP0A6TAZy4SapSs81
 9ymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jAqjWDErtnLGwFchY0uK4XqmiFgGys4roy5kdJRxfio=;
 b=NzTWx1/AA3qnDa/WRLjRzeTfHp6NTT6DSw++wv9Mv8LEQ5iNTrkqA8By3IM1mo2bAl
 o3Q3pnQ9eDG9Jsz9qrC/7yTjDS0JAX9x74OyFINFeNi80xZIy6LKkQNBVwEhSmJ64Hab
 ji2dQAQDcOMqWMRvP37DQcGeeSzZfOFD2GScWyhuqkZT7MFrP7X+Qzmwgjq0GkB6Y3iB
 qEX1L50co5n7x3L8nRZENZg617verkVXVt3EuhlCk/AW3HU/VjYG9pu43/1vDgZapuy1
 bGnJxKgLDgFuaZM45Uw5uN4i7fH34o2pq9R0Yi6Dr/10H43LrH5W5ad9bV+IMeAtU8Xw
 /6fw==
X-Gm-Message-State: AOAM532oo54HhBXyvVCqpWY3J2HKt2rYylur4rGxgAzdSCzzWlK13aPX
 NW/CxG60Q4C5vkrKDhE2isgTbzczOGM=
X-Google-Smtp-Source: ABdhPJyxLAQNHXgTNoUiF74HzQWABrlYZqJvVCbk/KUMwQhXCPaZrvJ4H7J9jTG+GP4xXd5yaSso2A==
X-Received: by 2002:a17:907:1b22:: with SMTP id
 mp34mr2743996ejc.408.1623764344769; 
 Tue, 15 Jun 2021 06:39:04 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r17sm11843769edt.33.2021.06.15.06.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 06:39:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/33] esp: ensure PDMA write transfers are flushed from the
 FIFO to the target immediately
Date: Tue, 15 Jun 2021 15:38:32 +0200
Message-Id: <20210615133855.775687-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615133855.775687-1-pbonzini@redhat.com>
References: <20210615133855.775687-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
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



