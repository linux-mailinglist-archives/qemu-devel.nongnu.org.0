Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A33EC3AB01F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:48:30 +0200 (CEST)
Received: from localhost ([::1]:59702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltodR-00059F-OH
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:48:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNG-0002ht-R2
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:48 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:47099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNF-000670-45
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:46 -0400
Received: by mail-ej1-x62b.google.com with SMTP id he7so8671634ejc.13
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=40tvBB6URa68U82HNrc5Kt1uj3mSzO0kOZWEskGJLok=;
 b=Zoa7jA1KdNCb1zUJa/80mn3CKqruADOjhlyey3gqQpHtHcthslvVnPa8YyUT+T+d3v
 aGP19CfMEnZws/yJU0OffGaJZ9dGqX8xYDv7Z2uSow5/DiKOuxQkQNerqRYkTV5YAtr1
 aW23sk3YYIQpvfSJeWTNR3gTjhj6ntKXH7cvhHPfCt2YXtlurGst4JYDq9xyWvz0ne6N
 3wh/pfdSdFnbjGL0Mo8dTKbrON2yYmC313wbacxjyiYNM8WRnWEzrXxef8Nbywa7NLed
 GwVZlTVnsfy1QlWcppK2qZMajuLndsWCOKn1ej8WnqNKKHXCAMajrxHSCZEq1iGQcMHK
 j4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=40tvBB6URa68U82HNrc5Kt1uj3mSzO0kOZWEskGJLok=;
 b=cboW6mABRo7TkngciSNgchFBpGyHD5KGQ27DG3FjdbXFAcxR25zJ51GOAnsUXUJHLD
 /h6U9wQxrjMcJ9w6x0fVe/BaEIP4ZAs6hCSc9OFASlMw47jt5pQW45VkvPq845svVWxm
 nozzfCy1Kq6I1cN+wfzBkLRNnBVptrAJkTvAiBl1wveKeoa5UL9/5RqEYY0w/mV3KBp/
 iV1LmgT3q4z8SnjR9JaNkgK/dbH/woGku0vGdrbAuWTnYGA/GzjfW01oSCfQAYyIE404
 9Lr6Bu+QPJmRocABg5qVMkzpUqBFjmpwxEN56cdcppivpeuWWsWd4duM/WKvhBPlLWXX
 zqsw==
X-Gm-Message-State: AOAM5334CVTev/ekMKAz1AiHuugAgZDGyvSDB0CLqQYpB5NC11qFnhrv
 rSh4rG3lAgPkKytLuJHGbOAV/dp3iLo=
X-Google-Smtp-Source: ABdhPJxAHxi9la+9Tde5JSW7mSYcZpI0fRPur1744qrewtPvoGxxxq8ijNBpQfe5yofenidY3TAfTg==
X-Received: by 2002:a17:906:390f:: with SMTP id
 f15mr4314365eje.270.1623922303788; 
 Thu, 17 Jun 2021 02:31:43 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:31:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/45] esp: correctly accumulate extended messages for PDMA
Date: Thu, 17 Jun 2021 11:31:01 +0200
Message-Id: <20210617093134.900014-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
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



