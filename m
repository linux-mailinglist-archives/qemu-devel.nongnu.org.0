Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5E735044C
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 18:16:26 +0200 (CEST)
Received: from localhost ([::1]:43844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRdW5-0004Fd-Mp
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 12:16:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tom.ty89@gmail.com>)
 id 1lRdOl-0005I0-UW
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 12:08:51 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:34719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tom.ty89@gmail.com>)
 id 1lRdOk-00060i-5n
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 12:08:51 -0400
Received: by mail-pl1-x62d.google.com with SMTP id o2so8143546plg.1
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 09:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uCwRwcFy8sXN6q86If9ieO1YMCFBb+rzNe2mDXDGIgs=;
 b=MA0cAXanLoHvF5C18PQkipKvVFvDljnfDyOpSYIATHP+HtlDArFYUoie9c0qv6lAbb
 T8NxN1kLeK8ThD3wsK8gqYMMeNGqsNZwskLJQOeNzqb1Xc3ylQDvIhcMY60dVa28g31S
 9k6iN3yUxGR4gvDyPVQTOAG8ra5+P1uQYi+FbAJ57xrB3gt0o/G+WhvEDxVV2MGmf/3D
 nbuCYGi+hGBL6KsAxtrcx88gXbMjJSFMcPVLWEDJHq3d1ghwSdDgM20k8UAtuJ1xQ38j
 5vujt/qWPD0LeCka9bivsYQlABw4RfXxKkMpkVT49virFFtQ3HCYXFDvVd0HDYSPPTL5
 m+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uCwRwcFy8sXN6q86If9ieO1YMCFBb+rzNe2mDXDGIgs=;
 b=fC5veJyFBEUlXzifbkDQ2E66RzeVS9SbtVtrRy2pTux4sr+SjEzYVdEIgZpJViSl+1
 8VUYlN/ZJrJLrG9OEm5+6/YytMAhqkZWJ89WJzG+mkEd7ve+Bvf5bACdxxn9JEsmKhqA
 UI6+v4xOYStj/Ih+tzf6kOTLszSGL/mOx+ft11wclMATyxdHnlosIGfpvyLi9pcKoE37
 VJmWy4ggYHc+SsUbxCzb2O13jIOhjxQ++M/MCC7w9qtchesVWNj3wjqWfqULH937g6yw
 BgXMO6HsEPhheG3up4EoFra7PtvfjyYQMIjmi+WBkPaw51tdQmLsJxCUWc3iPLtkv8lB
 dAhQ==
X-Gm-Message-State: AOAM533JZxcdtoQxquvfiAuHX1Z8L9qw/GMyntZRP7+0q4MdhUcTtdSK
 kJvH7L0qCTjyRwxmW05i8sr47N5iyEM74w==
X-Google-Smtp-Source: ABdhPJx5BcruJOxnF6pbTEG59bAG6yuz5ivqX5oEHYcTswhuAzjsx2/izve+bDOnZ5Rj0MhLogUdrQ==
X-Received: by 2002:a17:902:e74e:b029:e7:1f01:c6b1 with SMTP id
 p14-20020a170902e74eb02900e71f01c6b1mr3936936plf.43.1617206927581; 
 Wed, 31 Mar 2021 09:08:47 -0700 (PDT)
Received: from archlinux.. ([161.81.68.216])
 by smtp.gmail.com with ESMTPSA id a13sm2886131pgm.43.2021.03.31.09.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 09:08:47 -0700 (PDT)
From: Tom Yan <tom.ty89@gmail.com>
To: qemu-devel@nongnu.org,
	mst@redhat.com
Subject: [PATCH 1/3] pcie_chassis: use an available slot number if not
 explicity set
Date: Thu,  1 Apr 2021 00:08:33 +0800
Message-Id: <20210331160835.160670-1-tom.ty89@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=tom.ty89@gmail.com; helo=mail-pl1-x62d.google.com
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

Currently pcie_chassis_add_slot() simply fails if the requested
slot number is already used.

Make it find and use an available slot number if the requested one
does not appear to be explicitly set (i.e. is 0). This allows slot
numbers to be enumerated automatically.

Maintain the current behaviour if the requested slot number appears
to be explicitly set (i.e. is larger than 0), in case some users do
not wish the slot numbers in actual use could be different from what
were specified (they will need to avoid using 0 though).

Also fixing an apparent mistake in pcie_chassis_find_slot_with_chassis().
The type of the slot field of PCIESlot is uint16_t, which is also what
all of its users pass to it.

Signed-off-by: Tom Yan <tom.ty89@gmail.com>
---
 hw/pci/pcie_port.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
index eb563ad435..40fd80c4da 100644
--- a/hw/pci/pcie_port.c
+++ b/hw/pci/pcie_port.c
@@ -81,7 +81,7 @@ void pcie_chassis_create(uint8_t chassis_number)
 }
 
 static PCIESlot *pcie_chassis_find_slot_with_chassis(struct PCIEChassis *c,
-                                                     uint8_t slot)
+                                                     uint16_t slot)
 {
     PCIESlot *s;
     QLIST_FOREACH(s, &c->slots, next) {
@@ -92,6 +92,28 @@ static PCIESlot *pcie_chassis_find_slot_with_chassis(struct PCIEChassis *c,
     return s;
 }
 
+static void pcie_chassis_find_avail_slot_with_chassis(struct PCIEChassis *c, struct PCIESlot *slot)
+{
+    PCIESlot *s;
+    uint16_t slot_max = 0;
+    QLIST_FOREACH(s, &c->slots, next) {
+        if (s->slot > slot_max) {
+            slot_max = s->slot;
+        }
+    }
+
+    /*
+      find an available number to use from slot->slot (inclusive) to
+      slot_max; if there is none, use slot_max+1
+    */
+    while (slot->slot <= slot_max) {
+        if (!pcie_chassis_find_slot_with_chassis(c, slot->slot)) {
+            break;
+        }
+        slot->slot++;
+    }
+}
+
 PCIESlot *pcie_chassis_find_slot(uint8_t chassis_number, uint16_t slot)
 {
     struct PCIEChassis *c;
@@ -109,7 +131,9 @@ int pcie_chassis_add_slot(struct PCIESlot *slot)
     if (!c) {
         return -ENODEV;
     }
-    if (pcie_chassis_find_slot_with_chassis(c, slot->slot)) {
+    if (!slot->slot) { // slot number not explicity set
+        pcie_chassis_find_avail_slot_with_chassis(c, slot);
+    } else if (pcie_chassis_find_slot_with_chassis(c, slot->slot)) {
         return -EBUSY;
     }
     QLIST_INSERT_HEAD(&c->slots, slot, next);
-- 
2.31.1


