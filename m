Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF85329B0BD
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 15:23:51 +0100 (CET)
Received: from localhost ([::1]:33480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXPt8-0008Uc-T0
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 10:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kXPUI-0004Ok-Sg
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 09:58:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kXPUG-0004Yf-Ux
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 09:58:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603807088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MB1ipRfRNkXChQukvt9rriPJxQdgZRtBkWvpvX32y+s=;
 b=i09TGiX4NSbuJUVVPjg2N5LRP0nOJDJBET+6K/eAYx1NnYddhbnG6PQfz9enKf5PQ+fLxR
 sFBE1h9C5rk66G6C1fMKmRW7io+BWnhRNjGov/qUlrGZtov2B0ENzMrLClaFjW9WbZpMti
 4VJdKlqEMFcsvRAjCkZrNlWjXtiPK8c=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-iDl1o-UCPiCMwBQYZ9o06A-1; Tue, 27 Oct 2020 09:58:06 -0400
X-MC-Unique: iDl1o-UCPiCMwBQYZ9o06A-1
Received: by mail-ed1-f70.google.com with SMTP id t7so743222edt.0
 for <qemu-devel@nongnu.org>; Tue, 27 Oct 2020 06:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MB1ipRfRNkXChQukvt9rriPJxQdgZRtBkWvpvX32y+s=;
 b=mrLcJul10dTVfLCP6/NkjvkG2OI8Nls/BEffFQm5nWhpIDtocM1NuBuQ5E35QcDd32
 IEOyKR1oDeqZE0/vtD/gCFzs9Kbix8IA+B6sGWR0CjxZVS2QZ+QS9p43mptWNdr9K8Ow
 RdTHnf6iOIRGvCKDXojEPSYDq6rUZpjdMItIxLQzZfIZFQR1WlAgk18XgzEmJsaP1qtW
 tpkrrSZ8UFKq4ION9I7S72/kGGzxun0oMZPyqGYnvM6Q8Zb57gL4qHJA+BjJCGHo03ZM
 ff2/+LNoWAeKNrtA+U2mu1yInzHNImHzayUDuSAlH7JgjSXEJfgnuu+AV6USqzWLolJG
 fvFQ==
X-Gm-Message-State: AOAM530IXBgNYZ8M1K6DOLK+0cf3zLgeVN2jSwlF43dC4oFkw4UTiQ0f
 6/BqygaWE3qPN265s7LS0QExLJuQVf/IGTHSsrTefP2Wq6g1LFqj2tURWKTe1/vmoWtHbPOeawP
 klBMO9dnQGRaEMqc=
X-Received: by 2002:a17:906:d89:: with SMTP id m9mr2683050eji.18.1603807084941; 
 Tue, 27 Oct 2020 06:58:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymVc4dVnOkyLbfsI+Fr2X1rcFLIDMM9dqqTlvJbktlhH+2ZQuRpkw8vcWq5D7Ppx2VxD6+VA==
X-Received: by 2002:a17:906:d89:: with SMTP id m9mr2683032eji.18.1603807084740; 
 Tue, 27 Oct 2020 06:58:04 -0700 (PDT)
Received: from x1w.redhat.com (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id 11sm1084734ejy.19.2020.10.27.06.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 06:58:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 25/25] block/nvme: Fix use of write-only doorbells page on
 Aarch64 arch
Date: Tue, 27 Oct 2020 14:55:47 +0100
Message-Id: <20201027135547.374946-26-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201027135547.374946-1-philmd@redhat.com>
References: <20201027135547.374946-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/27 01:06:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_vfio_pci_map_bar() calls mmap(), and mmap(2) states:

  'offset' must be a multiple of the page size as returned
   by sysconf(_SC_PAGE_SIZE).

In commit f68453237b9 we started to use an offset of 4K which
broke this contract on Aarch64 arch.

Fix by mapping at offset 0, and and accessing doorbells at offset=4K.

Fixes: f68453237b9 ("block/nvme: Map doorbells pages write-only")
Reported-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/nvme.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index c1c52bae44f..ff645eefe6a 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -94,6 +94,7 @@ typedef struct {
 struct BDRVNVMeState {
     AioContext *aio_context;
     QEMUVFIOState *vfio;
+    void *bar0_wo_map;
     /* Memory mapped registers */
     volatile struct {
         uint32_t sq_tail;
@@ -778,8 +779,10 @@ static int nvme_init(BlockDriverState *bs, const char *device, int namespace,
         }
     }
 
-    s->doorbells = qemu_vfio_pci_map_bar(s->vfio, 0, sizeof(NvmeBar),
-                                         NVME_DOORBELL_SIZE, PROT_WRITE, errp);
+    s->bar0_wo_map = qemu_vfio_pci_map_bar(s->vfio, 0, 0,
+                                           sizeof(NvmeBar) + NVME_DOORBELL_SIZE,
+                                           PROT_WRITE, errp);
+    s->doorbells = (void *)((uintptr_t)s->bar0_wo_map + sizeof(NvmeBar));
     if (!s->doorbells) {
         ret = -EINVAL;
         goto out;
@@ -913,8 +916,8 @@ static void nvme_close(BlockDriverState *bs)
                            &s->irq_notifier[MSIX_SHARED_IRQ_IDX],
                            false, NULL, NULL);
     event_notifier_cleanup(&s->irq_notifier[MSIX_SHARED_IRQ_IDX]);
-    qemu_vfio_pci_unmap_bar(s->vfio, 0, (void *)s->doorbells,
-                            sizeof(NvmeBar), NVME_DOORBELL_SIZE);
+    qemu_vfio_pci_unmap_bar(s->vfio, 0, s->bar0_wo_map,
+                            0, sizeof(NvmeBar) + NVME_DOORBELL_SIZE);
     qemu_vfio_close(s->vfio);
 
     g_free(s->device);
-- 
2.26.2


