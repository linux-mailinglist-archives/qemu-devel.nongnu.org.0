Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB023A8130
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 15:44:12 +0200 (CEST)
Received: from localhost ([::1]:44232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9MR-0003HR-Bg
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 09:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Hb-0005e9-2Z
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:11 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:37458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9HV-0002gj-Mm
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:07 -0400
Received: by mail-ed1-x52c.google.com with SMTP id b11so51176820edy.4
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 06:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IKk9+G0JEQnt6nXX/qpy3huhzLZsQaa35Rc3qQcIYb0=;
 b=EeOpl5pNmk3suKsuF1NIA78T87rAdQrDROe3aNOL29oN9Djn99kGOleVD686CYRQlo
 R27HLb7Yru4pXnmM5XMw88giqN29AXVTZ4OEOEp1dfDSPZ7iv8XGV4IVd0hx+ikLxTUr
 52dtHSK3wtU/W0/LEtKxYot+uIsneQnmKq36vxAcPnHXgfHjHkVPPdqwChNdMb3ct6LX
 ZWyc/hhYAfMwsXME0IQWXRM40vzDVP1y/WQL05a+scUy+h3RwkXZCcfb4wpDxxW2bNPc
 NSOqYU6U0/YoAkrGfqzlNp6xWGezI/bo3qDyvQLOW6mWq88hG1QCaE007hSpdIOd6HU1
 +tUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IKk9+G0JEQnt6nXX/qpy3huhzLZsQaa35Rc3qQcIYb0=;
 b=A+6LDl3rKFDZ/M/P8KeM2ZnDwQEYXZZ0eMP1L3CUEliXWmqUazY/RKaDDd1l3KaA2n
 3paVqZNxjx4CxE9GsY9NQqIsYa9g8NaVGomlWhrxUdNCaWs6EF3AMWDadPFBz1FMlV1c
 wqDQAwkBpZGzhK+cHQeBqKK4NMUHy7UKHVFpvtPah+OjhnxiSSXMIuQNBAO1PaRGoZbn
 TEnlDHCJrC/QJGLrv/JMmdn4ykwKZY2uVqO0fYa6jMMWGOIkx8JZyrUuaA48vZaZyDj5
 G5Y773o4Pl4EP4oRBC1QbONKccgSt4Sj2Ga/ojjYoBrN0LOtVu4mU7blpKMWRmA6foc1
 Tz2g==
X-Gm-Message-State: AOAM532lu/qyQYxq2mcNKGd0yOxEK0cD4Y9alWez4qMZdx/NdDOwm33w
 ATt7UDUnrP5CyRZXZoIcphkH/PDu4t0=
X-Google-Smtp-Source: ABdhPJyXKNWTTZIRhbWSxHb/VHkid6hsppElt0wHB3U8yELLT9wNrpf7i0sEzcX2vuXaM03RtxV2iQ==
X-Received: by 2002:a05:6402:13d7:: with SMTP id
 a23mr23160068edx.120.1623764343331; 
 Tue, 15 Jun 2021 06:39:03 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r17sm11843769edt.33.2021.06.15.06.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 06:39:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/33] esp: allow non-DMA callback in esp_transfer_data()
 initial transfer
Date: Tue, 15 Jun 2021 15:38:30 +0200
Message-Id: <20210615133855.775687-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615133855.775687-1-pbonzini@redhat.com>
References: <20210615133855.775687-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
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

The current implementation only resumes DMA transfers when incoming data is
received from the target device, but this is also required for non-DMA transfers
with the next set of non-DMA changes.

Rather than duplicate the DMA/non-DMA dispatch logic in the initial transfer
section, update the code so that the initial transfer section can just
fallthrough to the main DMA/non-DMA dispatch logic.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20210519100803.10293-2-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/esp.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 18d4d56392..50757e9264 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -803,16 +803,6 @@ void esp_transfer_data(SCSIRequest *req, uint32_t len)
         s->rregs[ESP_RSTAT] |= STAT_TC;
         s->rregs[ESP_RINTR] |= INTR_BS;
         esp_raise_irq(s);
-
-        /*
-         * If data is ready to transfer and the TI command has already
-         * been executed, start DMA immediately. Otherwise DMA will start
-         * when host sends the TI command
-         */
-        if (s->ti_size && (s->rregs[ESP_CMD] == (CMD_TI | CMD_DMA))) {
-            esp_do_dma(s);
-        }
-        return;
     }
 
     if (s->ti_cmd == 0) {
@@ -826,7 +816,7 @@ void esp_transfer_data(SCSIRequest *req, uint32_t len)
         return;
     }
 
-    if (s->ti_cmd & CMD_DMA) {
+    if (s->ti_cmd == (CMD_TI | CMD_DMA)) {
         if (dmalen) {
             esp_do_dma(s);
         } else if (s->ti_size <= 0) {
@@ -837,7 +827,7 @@ void esp_transfer_data(SCSIRequest *req, uint32_t len)
             esp_dma_done(s);
             esp_lower_drq(s);
         }
-    } else {
+    } else if (s->ti_cmd == CMD_TI) {
         esp_do_nodma(s);
     }
 }
-- 
2.31.1



