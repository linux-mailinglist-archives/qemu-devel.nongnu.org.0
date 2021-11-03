Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D148B444487
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:18:36 +0100 (CET)
Received: from localhost ([::1]:49372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miI27-0003TX-Mh
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHos-0003De-Hp
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:04:55 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:36413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHoq-0000QL-5U
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:04:54 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 z11-20020a1c7e0b000000b0030db7b70b6bso4876381wmc.1
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rY/x7hpRoGRz0iG0A3Ugf+UYpglgMHQKbJrVC4Jydts=;
 b=MMspJ3AphYv9qWjkT0QZbj8wwzohtqp510z4dDPolwQD/TlAaIjGqDVGfdSZwxNLD1
 gQSS3DU+Vx2L8bTnGXlhLW71yIoXqARPp6w4Wx+YNDiWjUdZgnBZmTBheXEX9iaLSmQT
 Rb31IXEShrB5OGUd+Acoj37AtlJOYH08D+/+oWv2LQQfeCGYER+gvuBU7OiXWKCX0Cor
 9h5xq7k9Lk+A9cqWqqIp6ixYAKnXfHvC7fscNIcchEfhmchz6zYA/fnVG+SmPM5HIInk
 /aom3WLb9ANCZLCyrn1xn+aAks5G3r7AMWhLrbcXY+185V4MqBOrXsw3ZxSrjafvFCx7
 J9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rY/x7hpRoGRz0iG0A3Ugf+UYpglgMHQKbJrVC4Jydts=;
 b=im6T0/bhxFkKonYzKydjIZhiiDyAtY2sdnw1JNLhVktUyLNSaSDBY0AfAX0Xe2FUKo
 Z397LwHhmSG67POhq01b4zXLUSs36978OPxwzNwfGFln9lhIgAnH7ua3yfkegb6Bxt4R
 XCA0bdWNhZhoHLOL5Phq4rEEJ6bn/1wrcGWbjNkp4IetkCzOFPTEe/KPue0iUWMfoo3F
 Zxc+MtC6dcfx7xBHdxhukr5yr7p8Ris/llZBdVIX5wVHg1Wj01ffDahdPNvY7BuAds6Z
 gJMoqhSfad5nuxLQ1YWsFbnBjICwn68uTTd2SXx0R/45Qt/DEkbNOYpv0cUNHYaqk5b4
 Xc+A==
X-Gm-Message-State: AOAM5339eBuchncgflSKPUpwhI1WDR9lrfikTSn0oIkh5yMtPR3dKpve
 JYvzmUppmyYlUFlOIICxDeFJS6XUypY=
X-Google-Smtp-Source: ABdhPJz2mcWVaVtJ91Dr2L2r4ZaHZiSUonbHP4Mhho7MQfGvmByH79g3ZpgmRjmKUN1xMT4No0ENgA==
X-Received: by 2002:a1c:f319:: with SMTP id q25mr15986225wmq.33.1635951890878; 
 Wed, 03 Nov 2021 08:04:50 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h16sm2488797wrm.27.2021.11.03.08.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:04:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/27] util: Make some iova_tree parameters const
Date: Wed,  3 Nov 2021 16:04:20 +0100
Message-Id: <20211103150442.387121-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103150442.387121-1-pbonzini@redhat.com>
References: <20211103150442.387121-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

As qemu guidelines:
Unless a pointer is used to modify the pointed-to storage, give it the
"const" attribute.

In the particular case of iova_tree_find it allows to enforce what is
requested by its comment, since the compiler would shout in case of
modifying or freeing the const-qualified returned pointer.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211013182713.888753-2-eperezma@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/intel_iommu.c    |  2 +-
 include/qemu/iova-tree.h |  8 ++++----
 util/iova-tree.c         | 12 ++++++------
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 75f075547f..33a8af9191 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -1105,7 +1105,7 @@ static int vtd_page_walk_one(IOMMUTLBEvent *event, vtd_page_walk_info *info)
         .translated_addr = entry->translated_addr,
         .perm = entry->perm,
     };
-    DMAMap *mapped = iova_tree_find(as->iova_tree, &target);
+    const DMAMap *mapped = iova_tree_find(as->iova_tree, &target);
 
     if (event->type == IOMMU_NOTIFIER_UNMAP && !info->notify_unmap) {
         trace_vtd_page_walk_one_skip_unmap(entry->iova, entry->addr_mask);
diff --git a/include/qemu/iova-tree.h b/include/qemu/iova-tree.h
index b66cf93c4b..8249edd764 100644
--- a/include/qemu/iova-tree.h
+++ b/include/qemu/iova-tree.h
@@ -59,7 +59,7 @@ IOVATree *iova_tree_new(void);
  *
  * Return: 0 if succeeded, or <0 if error.
  */
-int iova_tree_insert(IOVATree *tree, DMAMap *map);
+int iova_tree_insert(IOVATree *tree, const DMAMap *map);
 
 /**
  * iova_tree_remove:
@@ -74,7 +74,7 @@ int iova_tree_insert(IOVATree *tree, DMAMap *map);
  *
  * Return: 0 if succeeded, or <0 if error.
  */
-int iova_tree_remove(IOVATree *tree, DMAMap *map);
+int iova_tree_remove(IOVATree *tree, const DMAMap *map);
 
 /**
  * iova_tree_find:
@@ -92,7 +92,7 @@ int iova_tree_remove(IOVATree *tree, DMAMap *map);
  * user is responsible to make sure the pointer is valid (say, no
  * concurrent deletion in progress).
  */
-DMAMap *iova_tree_find(IOVATree *tree, DMAMap *map);
+const DMAMap *iova_tree_find(const IOVATree *tree, const DMAMap *map);
 
 /**
  * iova_tree_find_address:
@@ -105,7 +105,7 @@ DMAMap *iova_tree_find(IOVATree *tree, DMAMap *map);
  *
  * Return: same as iova_tree_find().
  */
-DMAMap *iova_tree_find_address(IOVATree *tree, hwaddr iova);
+const DMAMap *iova_tree_find_address(const IOVATree *tree, hwaddr iova);
 
 /**
  * iova_tree_foreach:
diff --git a/util/iova-tree.c b/util/iova-tree.c
index 7990692cbd..23ea35b7a4 100644
--- a/util/iova-tree.c
+++ b/util/iova-tree.c
@@ -42,14 +42,14 @@ IOVATree *iova_tree_new(void)
     return iova_tree;
 }
 
-DMAMap *iova_tree_find(IOVATree *tree, DMAMap *map)
+const DMAMap *iova_tree_find(const IOVATree *tree, const DMAMap *map)
 {
     return g_tree_lookup(tree->tree, map);
 }
 
-DMAMap *iova_tree_find_address(IOVATree *tree, hwaddr iova)
+const DMAMap *iova_tree_find_address(const IOVATree *tree, hwaddr iova)
 {
-    DMAMap map = { .iova = iova, .size = 0 };
+    const DMAMap map = { .iova = iova, .size = 0 };
 
     return iova_tree_find(tree, &map);
 }
@@ -60,7 +60,7 @@ static inline void iova_tree_insert_internal(GTree *gtree, DMAMap *range)
     g_tree_insert(gtree, range, range);
 }
 
-int iova_tree_insert(IOVATree *tree, DMAMap *map)
+int iova_tree_insert(IOVATree *tree, const DMAMap *map)
 {
     DMAMap *new;
 
@@ -96,9 +96,9 @@ void iova_tree_foreach(IOVATree *tree, iova_tree_iterator iterator)
     g_tree_foreach(tree->tree, iova_tree_traverse, iterator);
 }
 
-int iova_tree_remove(IOVATree *tree, DMAMap *map)
+int iova_tree_remove(IOVATree *tree, const DMAMap *map)
 {
-    DMAMap *overlap;
+    const DMAMap *overlap;
 
     while ((overlap = iova_tree_find(tree, map))) {
         g_tree_remove(tree->tree, overlap);
-- 
2.31.1



