Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CA424E1BA
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 22:01:54 +0200 (CEST)
Received: from localhost ([::1]:35354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k9DEX-0002oY-Oe
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 16:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k9D8K-0008HB-J2
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 15:55:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k9D8G-0002ub-TS
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 15:55:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598039723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iv472Tg/IWNKyPux4o/KGHZT2x9lkLiYreRkrEkWN1E=;
 b=dba3tgxYTGLxknqlC7OuG6yJl+TuyRowzCfbrT3pTc97F5K/pze1kxVbdsyieUAsOs7mHJ
 +qkZtlajtuPZ9nSV6LV/z257OKD4JmY0uhUScmOTxLfu/gFTcxPo3H6BwYwfB4FALnlwLJ
 0D3+BXanWv8B/lb+KnO9qpSmeJWcG1g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-dEgzub30O66kSFU3ZSD84A-1; Fri, 21 Aug 2020 15:55:21 -0400
X-MC-Unique: dEgzub30O66kSFU3ZSD84A-1
Received: by mail-wm1-f72.google.com with SMTP id a82so1373263wmh.5
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 12:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iv472Tg/IWNKyPux4o/KGHZT2x9lkLiYreRkrEkWN1E=;
 b=VL+09MdnU2R/69k86SQYkiuqHfWB+xG0YFaGwZ3lVAav30EzK7Jc+WRK78ciqCecat
 CohFbB22xLyJyqZCT5jnAdV9o1DNUox+iMTCmmD6bUo/4GaaQzh28kcwnoPhpFYDtecb
 lvv3Obv78vMj7wE+P+xVIfYTDRdc87pwIyPYzdCKHR99fsLa+vjJQiJEFEGvk7LJwity
 4fKoK4SLWdVpqcf4D1Zf+mCOp8drUACd0lL/YZEdpCU7M7rE1x6KawyCCEoVyDvaZKTm
 hg2Hjw5/Yfuc/K1H8gtyp/1/lv1LhF8NduoSGczN5hTl7/UNB6E6409gxbqHlNuFFA0Q
 P7RA==
X-Gm-Message-State: AOAM531thcyEca8zjef9x2/xGsKPUprDlMVeKHQ26Bn5tQSnponi2lHx
 YcgHchJujMYrRSTsHlP7+jxeJJ2aojQRznicrl0C/aChs3d9r+D3drrBZhwygop5aJBiGxp0tVC
 W2FIUXHtOoyJJbok=
X-Received: by 2002:a05:6000:120c:: with SMTP id
 e12mr4031090wrx.354.1598039720103; 
 Fri, 21 Aug 2020 12:55:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwi5d2ZRS6uExby9mt6mS5NoA9Os3ZDOll6N3SqTG3MZR1YUs16h12hxbCvBioVKMR4jGe86w==
X-Received: by 2002:a05:6000:120c:: with SMTP id
 e12mr4031077wrx.354.1598039719881; 
 Fri, 21 Aug 2020 12:55:19 -0700 (PDT)
Received: from x1w.redhat.com (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id r22sm6925292wmh.45.2020.08.21.12.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 12:55:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 15/15] block/nvme: Use an array of EventNotifier
Date: Fri, 21 Aug 2020 21:53:59 +0200
Message-Id: <20200821195359.1285345-16-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200821195359.1285345-1-philmd@redhat.com>
References: <20200821195359.1285345-1-philmd@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 04:26:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In preparation of using multiple IRQ (thus multiple eventfds)
make BDRVNVMeState::irq_notifier an array (for now of a single
element, the admin queue notifier).

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/nvme.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index 1cc2e9493d0..86bfd487e2c 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -106,6 +106,12 @@ QEMU_BUILD_BUG_ON(offsetof(NVMeRegs, doorbells) != 0x1000);
 #define INDEX_ADMIN     0
 #define INDEX_IO(n)     (1 + n)
 
+/* This driver shares a single MSIX IRQ for the admin and I/O queues */
+enum {
+    MSIX_SHARED_IRQ_IDX = 0,
+    MSIX_IRQ_COUNT = 1
+};
+
 struct BDRVNVMeState {
     AioContext *aio_context;
     QEMUVFIOState *vfio;
@@ -120,7 +126,7 @@ struct BDRVNVMeState {
     /* How many uint32_t elements does each doorbell entry take. */
     size_t doorbell_scale;
     bool write_cache_supported;
-    EventNotifier irq_notifier;
+    EventNotifier irq_notifier[MSIX_IRQ_COUNT];
 
     uint64_t nsze; /* Namespace size reported by identify command */
     int nsid;      /* The namespace id to read/write data. */
@@ -631,7 +637,8 @@ static bool nvme_poll_queues(BDRVNVMeState *s)
 
 static void nvme_handle_event(EventNotifier *n)
 {
-    BDRVNVMeState *s = container_of(n, BDRVNVMeState, irq_notifier);
+    BDRVNVMeState *s = container_of(n, BDRVNVMeState,
+                                    irq_notifier[MSIX_SHARED_IRQ_IDX]);
 
     trace_nvme_handle_event(s);
     event_notifier_test_and_clear(n);
@@ -683,7 +690,8 @@ out_error:
 static bool nvme_poll_cb(void *opaque)
 {
     EventNotifier *e = opaque;
-    BDRVNVMeState *s = container_of(e, BDRVNVMeState, irq_notifier);
+    BDRVNVMeState *s = container_of(e, BDRVNVMeState,
+                                    irq_notifier[MSIX_SHARED_IRQ_IDX]);
 
     trace_nvme_poll_cb(s);
     return nvme_poll_queues(s);
@@ -705,7 +713,7 @@ static int nvme_init(BlockDriverState *bs, const char *device, int namespace,
     s->device = g_strdup(device);
     s->nsid = namespace;
     s->aio_context = bdrv_get_aio_context(bs);
-    ret = event_notifier_init(&s->irq_notifier, 0);
+    ret = event_notifier_init(&s->irq_notifier[MSIX_SHARED_IRQ_IDX], 0);
     if (ret) {
         error_setg(errp, "Failed to init event notifier");
         return ret;
@@ -784,12 +792,13 @@ static int nvme_init(BlockDriverState *bs, const char *device, int namespace,
         }
     }
 
-    ret = qemu_vfio_pci_init_irq(s->vfio, &s->irq_notifier,
+    ret = qemu_vfio_pci_init_irq(s->vfio, s->irq_notifier,
                                  VFIO_PCI_MSIX_IRQ_INDEX, errp);
     if (ret) {
         goto out;
     }
-    aio_set_event_notifier(bdrv_get_aio_context(bs), &s->irq_notifier,
+    aio_set_event_notifier(bdrv_get_aio_context(bs),
+                           &s->irq_notifier[MSIX_SHARED_IRQ_IDX],
                            false, nvme_handle_event, nvme_poll_cb);
 
     nvme_identify(bs, namespace, &local_err);
@@ -872,9 +881,10 @@ static void nvme_close(BlockDriverState *bs)
         nvme_free_queue_pair(s->queues[i]);
     }
     g_free(s->queues);
-    aio_set_event_notifier(bdrv_get_aio_context(bs), &s->irq_notifier,
+    aio_set_event_notifier(bdrv_get_aio_context(bs),
+                           &s->irq_notifier[MSIX_SHARED_IRQ_IDX],
                            false, NULL, NULL);
-    event_notifier_cleanup(&s->irq_notifier);
+    event_notifier_cleanup(&s->irq_notifier[MSIX_SHARED_IRQ_IDX]);
     qemu_vfio_pci_unmap_bar(s->vfio, 0, (void *)s->regs, 0, NVME_BAR_SIZE);
     qemu_vfio_close(s->vfio);
 
@@ -1381,7 +1391,8 @@ static void nvme_detach_aio_context(BlockDriverState *bs)
         q->completion_bh = NULL;
     }
 
-    aio_set_event_notifier(bdrv_get_aio_context(bs), &s->irq_notifier,
+    aio_set_event_notifier(bdrv_get_aio_context(bs),
+                           &s->irq_notifier[MSIX_SHARED_IRQ_IDX],
                            false, NULL, NULL);
 }
 
@@ -1391,7 +1402,7 @@ static void nvme_attach_aio_context(BlockDriverState *bs,
     BDRVNVMeState *s = bs->opaque;
 
     s->aio_context = new_context;
-    aio_set_event_notifier(new_context, &s->irq_notifier,
+    aio_set_event_notifier(new_context, &s->irq_notifier[MSIX_SHARED_IRQ_IDX],
                            false, nvme_handle_event, nvme_poll_cb);
 
     for (int i = 0; i < s->nr_queues; i++) {
-- 
2.26.2


