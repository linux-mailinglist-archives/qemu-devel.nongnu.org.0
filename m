Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C27933A8148
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 15:47:03 +0200 (CEST)
Received: from localhost ([::1]:53474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9PC-0000yv-Mp
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 09:47:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Hd-0005ix-1i
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:13 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:46970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Hb-0002ia-CN
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:12 -0400
Received: by mail-ej1-x634.google.com with SMTP id he7so22428951ejc.13
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 06:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=40tvBB6URa68U82HNrc5Kt1uj3mSzO0kOZWEskGJLok=;
 b=nu/h5zXrh6+a5aQB/FFKfvgsh/2qbAX+c1t1VM6XlWc9nbLi9rHA/xxWWhQlG+Wzgy
 fSiPobIIYL1FrEGewE2bf4qh+g8bN9ooJlF54c/U3o2I+JViziLqgQtqNR1+DWCznGvf
 gieqqyh40o0myxzSRiIc8o4FNc6lGaLo/q2iALOO9WIkqCXq0VzkAJc5AxePHvJpO9bl
 k/CFiOMz8A4b3I4YLxSZueVoyb1dumBK6qu0QFjuiaybsfM8RhRZmBHxWfSm7vX9Fc4w
 t1z5wemHN3fokEZeSFRXj1Sp5ea/rPBSWaMjEdnXONn55ctOxN12e+/62YggCYKjNMGb
 6b6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=40tvBB6URa68U82HNrc5Kt1uj3mSzO0kOZWEskGJLok=;
 b=F9rt6znl7jN4l0fcvh6t1+UFV7XOmovJEzvVrrAjGa4PxDrFDBfxaHcDbtbtcThl5O
 3GD8TGPGJ817KkED+88lyOrR4uVenwUNrQz58vAjwZUxIWjBa64KvAyOZGcZRlGSGBDa
 l7ZTDZGk92DvFYsD1a8HVd7aMQG+mXM+yN+hGIGvK5whzCJ5OB1P0XhoMKYIicTSxqJN
 WV2EmAq7KZIVF1hfC8gRhIlFbYQvcPvEv/tc+0coknOXg4pu130gCRtjjcCh9IaV4+61
 CSXl9l3lWA9mJE8AFVkoF6DXf+kvPMIb/wweOVgPgz/vdwlCSGkxln8k2beRVey/gHV5
 ZpSA==
X-Gm-Message-State: AOAM530G1lgkQqKETnEVoDaZ32Hv6OqAvJ9HAAKmtvGPBcMlTBYgcZtH
 ZrNmlUPLAzowqoywZj/NmVTdOXH746c=
X-Google-Smtp-Source: ABdhPJwSVLyKLJkRLw2dbMsrTPFQAddsFrT61qmdwjxzvidKkjEOE5d8p/KrlL2OFTUGeRsVSSyycg==
X-Received: by 2002:a17:907:7b91:: with SMTP id
 ne17mr21564553ejc.58.1623764349996; 
 Tue, 15 Jun 2021 06:39:09 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r17sm11843769edt.33.2021.06.15.06.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 06:39:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/33] esp: correctly accumulate extended messages for PDMA
Date: Tue, 15 Jun 2021 15:38:34 +0200
Message-Id: <20210615133855.775687-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615133855.775687-1-pbonzini@redhat.com>
References: <20210615133855.775687-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
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

Commit 799d90d818 "esp: transition to message out phase after SATN and stop
command" added logic to correctly handle extended messages for DMA requests
but not for PDMA requests.

Apply the same logic in esp_do_dma() to do_dma_pdma_cb() so that extended
messages terminated with a PDMA request are accumulated correctly. This allows
the ESP device to respond correctly to the SDTR negotiation initiated by the
NetBSD ESP driver without causing errors and timeouts on boot.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20210519100803.10293-6-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/esp.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 16e4b7ead6..3e6f4094fc 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -492,9 +492,26 @@ static void do_dma_pdma_cb(ESPState *s)
         }
 
         s->ti_size = 0;
-        s->do_cmd = 0;
-        do_cmd(s);
-        esp_lower_drq(s);
+        if ((s->rregs[ESP_RSTAT] & 7) == STAT_CD) {
+            /* No command received */
+            if (s->cmdfifo_cdb_offset == fifo8_num_used(&s->cmdfifo)) {
+                return;
+            }
+
+            /* Command has been received */
+            s->do_cmd = 0;
+            do_cmd(s);
+        } else {
+            /*
+             * Extra message out bytes received: update cmdfifo_cdb_offset
+             * and then switch to commmand phase
+             */
+            s->cmdfifo_cdb_offset = fifo8_num_used(&s->cmdfifo);
+            s->rregs[ESP_RSTAT] = STAT_TC | STAT_CD;
+            s->rregs[ESP_RSEQ] = SEQ_CD;
+            s->rregs[ESP_RINTR] |= INTR_BS;
+            esp_raise_irq(s);
+        }
         return;
     }
 
-- 
2.31.1



