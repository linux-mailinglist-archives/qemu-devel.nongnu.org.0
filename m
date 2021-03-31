Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7005A350464
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 18:21:57 +0200 (CEST)
Received: from localhost ([::1]:54834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRdbQ-0000TG-D8
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 12:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tom.ty89@gmail.com>)
 id 1lRdOo-0005NQ-A1
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 12:08:54 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:41873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tom.ty89@gmail.com>)
 id 1lRdOl-00062F-6G
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 12:08:54 -0400
Received: by mail-pg1-x531.google.com with SMTP id m7so14519077pgj.8
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 09:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0dTuAkJ9AgOZoDf8BFgMtxpVSc4j/VUGHebO5uuGD2Y=;
 b=HPF7QNKgLPitjIbCZ3U8MzX3lo1IxeFngQexl68Ocg2UK7gZ1/PQf2y21wa5q3rNkM
 iIUH/UAvBcOB/QsFO64dIctsyO2dKJq49Rs9hHz200QdsmxHNNQfO8ByKhLHYvHQ5n6e
 YvhsRiuai82AwI5eBQ2lJEwT/WM1aFMaUqLbNG/JGFJuTqRoGJ0C2Yi0VMAWXyEMa8FK
 dFiOUGsbh7F+cIv2blx0tNTFyX3FkuR2TXvzfg+9dyzrdmY+mklZe0zOmcdbr2W2zIFF
 KmamTTdRmPT3jUN+SeX1mW1w7cBHExOGduxuzOou2k7JAsPGlDJEYN9jbxHWahXQZ6x1
 t8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0dTuAkJ9AgOZoDf8BFgMtxpVSc4j/VUGHebO5uuGD2Y=;
 b=SfhTNbkdzU9B+IpN62lwkg2Z3GfvKID3HNQ2Sjz2g3C1lLp1Li29hIFqRLoJovL9YQ
 TkOONlwQkJSkPOjCTcC0cQ4zIoGeibTsBhSBDv+blGkeXf1OPO+G1m2xayNQYnM3OjgZ
 PG/cDfideGr41WI8Z8F0O4C5tpsXcAo+tjS6X98FCOH/Xa6N0AUAu3OeWK0ckM8XlC6o
 HwkUmCQ0B67IQMFoBV107STfnagMAG3l9JLDd0GHAZUnNn0EXiOLYwkh9Pk57Y7Nkd1Z
 daNDlp1rqxrEpC7Kra1pB65H/9asRs2d8vIVhkq8A700+nCiOQnbW850EMwR5rKDqgua
 UzEw==
X-Gm-Message-State: AOAM5334zNo2xFx3KCzvlPQmGrdjVli7FTT6YZ4AlRqhvZEiit7554Qs
 6apxlfRwHmshb1UKJlDPmQtyAX7q7DLG4w==
X-Google-Smtp-Source: ABdhPJxAtKw2QqyHVTfCSOrXtkZBaX9ABzKqArzy/5ZkBmZK9P4O0lujwi1nQpXwBORXePC79cHikA==
X-Received: by 2002:a63:5f0f:: with SMTP id t15mr3841726pgb.225.1617206929479; 
 Wed, 31 Mar 2021 09:08:49 -0700 (PDT)
Received: from archlinux.. ([161.81.68.216])
 by smtp.gmail.com with ESMTPSA id a13sm2886131pgm.43.2021.03.31.09.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 09:08:48 -0700 (PDT)
From: Tom Yan <tom.ty89@gmail.com>
To: qemu-devel@nongnu.org,
	mst@redhat.com
Subject: [PATCH 2/3] pcie_chassis: add slot_max field
Date: Thu,  1 Apr 2021 00:08:34 +0800
Message-Id: <20210331160835.160670-2-tom.ty89@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210331160835.160670-1-tom.ty89@gmail.com>
References: <20210331160835.160670-1-tom.ty89@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=tom.ty89@gmail.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: marcel@redhat.com, yamahata@valinux.co.jp, Tom Yan <tom.ty89@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Keep track of the largested allocated slot number when adding slot.

Signed-off-by: Tom Yan <tom.ty89@gmail.com>
---
 hw/pci/pcie_port.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
index 40fd80c4da..1e2348250c 100644
--- a/hw/pci/pcie_port.c
+++ b/hw/pci/pcie_port.c
@@ -49,6 +49,7 @@ void pcie_port_init_reg(PCIDevice *d)
  */
 struct PCIEChassis {
     uint8_t     number;
+    uint16_t    slot_max; // largest allocated slot number
 
     QLIST_HEAD(, PCIESlot) slots;
     QLIST_ENTRY(PCIEChassis) next;
@@ -94,19 +95,11 @@ static PCIESlot *pcie_chassis_find_slot_with_chassis(struct PCIEChassis *c,
 
 static void pcie_chassis_find_avail_slot_with_chassis(struct PCIEChassis *c, struct PCIESlot *slot)
 {
-    PCIESlot *s;
-    uint16_t slot_max = 0;
-    QLIST_FOREACH(s, &c->slots, next) {
-        if (s->slot > slot_max) {
-            slot_max = s->slot;
-        }
-    }
-
     /*
       find an available number to use from slot->slot (inclusive) to
-      slot_max; if there is none, use slot_max+1
+      c->slot_max; if there is none, use c->slot_max+1
     */
-    while (slot->slot <= slot_max) {
+    while (slot->slot <= c->slot_max) {
         if (!pcie_chassis_find_slot_with_chassis(c, slot->slot)) {
             break;
         }
@@ -137,6 +130,8 @@ int pcie_chassis_add_slot(struct PCIESlot *slot)
         return -EBUSY;
     }
     QLIST_INSERT_HEAD(&c->slots, slot, next);
+    if (slot->slot > c->slot_max)
+        c->slot_max = slot->slot;
     return 0;
 }
 
-- 
2.31.1


