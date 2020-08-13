Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C63B243E5D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Aug 2020 19:33:47 +0200 (CEST)
Received: from localhost ([::1]:42286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6H6o-0000nj-Co
	for lists+qemu-devel@lfdr.de; Thu, 13 Aug 2020 13:33:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k6H3o-0005OL-C4
 for qemu-devel@nongnu.org; Thu, 13 Aug 2020 13:30:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k6H3m-0008N0-Nr
 for qemu-devel@nongnu.org; Thu, 13 Aug 2020 13:30:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597339837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yKJ+zvoMOJhIvdM3y8QfidpmXCRYP6oT8Ci2x8cZgK4=;
 b=NI6XXjrFPmR6hMQbZaZg0F3Sf2YBqZfTzzQnbAOy3K1dU/FnT7lve1heW/CwjO77CsTxYt
 yuLrVnohJe714iSdmQB+MeHYyKLtfv53hBj88NowezvW+ptlJmvKD5hPJm+MzjNeFrHCON
 SoF87YzTFstAODCdWI3yqDdChSKECP0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-LMdHuC0eO9WdTiT6NzQZ7w-1; Thu, 13 Aug 2020 13:30:36 -0400
X-MC-Unique: LMdHuC0eO9WdTiT6NzQZ7w-1
Received: by mail-wm1-f69.google.com with SMTP id v8so2193589wma.6
 for <qemu-devel@nongnu.org>; Thu, 13 Aug 2020 10:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yKJ+zvoMOJhIvdM3y8QfidpmXCRYP6oT8Ci2x8cZgK4=;
 b=CVOq6oiB/5OdufmkNuD6eSwFvbq7TCbZp8/HDLMxCN47UFodo2KKYjoUeHhS2OTjt1
 A5vy0kU0590+F2KCjaCfS/iOJ+2NVjBYBAJDBLl5oMPzCraN9203zv5Wh9MPnixs8pIM
 nlf+s8+g9aGi2zi+MQt+lYmuGdmTpS+SLuY3f4jIilHcBKc0j8205Gvovaf9n3Q7jOPC
 chckhqmp2vNixGvl3DUA0OT/3FXDRq/H1uqSF0Kp80AW7sozyUZNzAKbff6XG0MuLJ52
 8DPvWH+AfWefeLLPpKsdSq+91t6VsJ+FEspoCtGvbtsWdUBUJcft8p8Q55In+4nlg8PO
 HZUg==
X-Gm-Message-State: AOAM531PfC1NYAk7gSi6cUL+WJcmHB5BC3afMymjUgBC3fDi2w5G45++
 qXxnK//miDrlgt8kmoNPhA9SpvGPhZwyKT5BAvTNtgl0J1VXlzjIMVCytxPejLK9XK/ppSyn6hN
 TE3YtQa/TKSNWkfk=
X-Received: by 2002:adf:ed48:: with SMTP id u8mr5305159wro.64.1597339834883;
 Thu, 13 Aug 2020 10:30:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/5BLc7cWA+ODsKBfLtjJjKKL0kinxWbV8UzbJGnAm9M/YX/jkXmnknvnJ0wSVIx6a7/L5Jw==
X-Received: by 2002:adf:ed48:: with SMTP id u8mr5305131wro.64.1597339834669;
 Thu, 13 Aug 2020 10:30:34 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id x11sm10461934wrl.28.2020.08.13.10.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 10:30:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 7/7] util/vfio-helpers: Allow opening device requesting
 for multiple IRQs
Date: Thu, 13 Aug 2020 19:29:57 +0200
Message-Id: <20200813172957.8289-8-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200813172957.8289-1-philmd@redhat.com>
References: <20200813172957.8289-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 12:30:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that our helper is ready for handling multiple IRQs, let
qemu_vfio_open_pci() take an 'irq_count' argument.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/qemu/vfio-helpers.h | 2 +-
 block/nvme.c                | 5 ++++-
 util/vfio-helpers.c         | 4 ++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/include/qemu/vfio-helpers.h b/include/qemu/vfio-helpers.h
index 5c2d8ee5b3..4773b116df 100644
--- a/include/qemu/vfio-helpers.h
+++ b/include/qemu/vfio-helpers.h
@@ -16,7 +16,7 @@
 typedef struct QEMUVFIOState QEMUVFIOState;
 
 QEMUVFIOState *qemu_vfio_open_pci(const char *device, int irq_type,
-                                  Error **errp);
+                                  unsigned irq_count, Error **errp);
 void qemu_vfio_close(QEMUVFIOState *s);
 int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
                       bool temporary, uint64_t *iova_list);
diff --git a/block/nvme.c b/block/nvme.c
index a5ef571492..2d7aac3903 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -106,6 +106,9 @@ QEMU_BUILD_BUG_ON(offsetof(NVMeRegs, doorbells) != 0x1000);
 #define INDEX_ADMIN     0
 #define INDEX_IO(n)     (1 + n)
 
+/* This driver shares a single MSIX IRQ for the admin and I/O queues */
+#define MSIX_IRQ_COUNT  1
+
 struct BDRVNVMeState {
     AioContext *aio_context;
     QEMUVFIOState *vfio;
@@ -712,7 +715,7 @@ static int nvme_init(BlockDriverState *bs, const char *device, int namespace,
     }
 
     s->vfio = qemu_vfio_open_pci(device, VFIO_PCI_MSIX_IRQ_INDEX,
-                                 errp);
+                                 MSIX_IRQ_COUNT, errp);
     if (!s->vfio) {
         ret = -EINVAL;
         goto out;
diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 7a934d1a1b..36fafef0d3 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -450,12 +450,12 @@ static void qemu_vfio_open_common(QEMUVFIOState *s)
  * Open a PCI device, e.g. "0000:00:01.0".
  */
 QEMUVFIOState *qemu_vfio_open_pci(const char *device, int irq_type,
-                                  Error **errp)
+                                  unsigned irq_count, Error **errp)
 {
     int r;
     QEMUVFIOState *s = g_new0(QEMUVFIOState, 1);
 
-    r = qemu_vfio_init_pci(s, device, irq_type, 1, errp);
+    r = qemu_vfio_init_pci(s, device, irq_type, irq_count, errp);
     if (r) {
         g_free(s);
         return NULL;
-- 
2.21.3


