Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9E93AAFE4
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:36:59 +0200 (CEST)
Received: from localhost ([::1]:47248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltoSI-000391-L0
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoND-0002g6-Sg
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:44 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:35635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNC-000645-8j
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:43 -0400
Received: by mail-ej1-x634.google.com with SMTP id gb32so550044ejc.2
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IKk9+G0JEQnt6nXX/qpy3huhzLZsQaa35Rc3qQcIYb0=;
 b=mfrHPX/zQ1fB8sTEhv3f5bKq0jV1M4temQXv6WSi7Zdr5fe6pJAVoB5di/lwYBS4Nf
 sBfqFNejRTs3npUxTPlpnFL6gOHFP4Be5f5be7JrHBtXPvZjR+K5kwD04d2y7p79KFxA
 /9Zosr3/YZicm5npk78P5tedqEqU0IvBs8VD0AquvaLYx+KjRSDciwZGkzBK02cNyQPL
 IiERUCkmpd0PNjiNnyAnbDXGkccsR0bjJZ6virvdjbux+D8UlqzGcl8teNiN0RJb+c6a
 peee4FoLXTVAo5M69fpDbSARMGRYI/CN4/FNDL6hvxBWIzGK9k0Ig9EcUoYhz2ma1SDk
 EXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IKk9+G0JEQnt6nXX/qpy3huhzLZsQaa35Rc3qQcIYb0=;
 b=CxYXoYkFTrpjuy8BNXQavX6QCbUX+qML4AaRPoRI9ddRLcAiIJJ/H8fM5c3LKCXfxd
 bBwBXrxvaq5vJ39akM3K2U9tlOrfIXtiTWIA3bNzLxwWU8jOMl48VbHTa4e5ul6m5Z4c
 ymVhC1wJhRk59LTYy6gifXPUNEfEyxhB6QGUJpaapEGRUUL8SUGs+86v95XK+1OAyZk/
 lkNJqSoojUVP2ZF9Yv0XPs1w++HdDkOmGRB+0eC+hMxq0q5woS4rsGpxZTx3cPX3S5NP
 4/OHgcNh+mAHQs9ccjM7/yTyYGEuhvVcLpXGO6Z+3kD25vfJvDpcstCpGEOiQ97E9FTf
 jCKA==
X-Gm-Message-State: AOAM530+l2rcJZpNvnw9bN8ca9XceI9+8bxHGXnKTS9/3pLD0cU84WZ/
 pXwzS3ETifpGQggoVQrCZ4uytnwJAYo=
X-Google-Smtp-Source: ABdhPJzvaKV494t5IgoTlxyFui5va+vY1r+yiOIkDyurobHForR0K8fJ5eHunRbACVBhQeusPiUUGg==
X-Received: by 2002:a17:907:1c13:: with SMTP id
 nc19mr4330808ejc.168.1623922300844; 
 Thu, 17 Jun 2021 02:31:40 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:31:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/45] esp: allow non-DMA callback in esp_transfer_data()
 initial transfer
Date: Thu, 17 Jun 2021 11:30:57 +0200
Message-Id: <20210617093134.900014-9-pbonzini@redhat.com>
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



