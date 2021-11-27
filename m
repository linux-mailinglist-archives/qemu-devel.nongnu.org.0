Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB1F45FD46
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Nov 2021 08:41:05 +0100 (CET)
Received: from localhost ([::1]:47682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqsKW-0008JG-9C
	for lists+qemu-devel@lfdr.de; Sat, 27 Nov 2021 02:41:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mqs9j-0007ng-5f
 for qemu-devel@nongnu.org; Sat, 27 Nov 2021 02:29:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mqs9f-0002DY-Sx
 for qemu-devel@nongnu.org; Sat, 27 Nov 2021 02:29:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637998191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VIuxFRuweUAeTWrB2lcanKs1mZt8Wy3ZRuUOHxLwMqQ=;
 b=SA9IjUOXyHryDZAPYBspgfCoHys+/0mE/t8gDu7VIh6o9Fee6/B9BXcirpsZUUiWVxH8GB
 eWDhJD190L3S/G61hr0xz8/FiiWexrbPf5jLvL/7y0Fj2eWHiGZ5s/wy6tV+PAtOIJOXrS
 aY8xbXkBcmEkm+jY3ZcTM5ZqjxVifq0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-7GsNcoTxPdiZh17twas-jw-1; Sat, 27 Nov 2021 02:29:49 -0500
X-MC-Unique: 7GsNcoTxPdiZh17twas-jw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC624801B01;
 Sat, 27 Nov 2021 07:29:48 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.178])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D31085BAE2;
 Sat, 27 Nov 2021 07:29:45 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, thuth@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org
Subject: [PATCH v6 3/4] virtio-iommu: Fix the domain_range end
Date: Sat, 27 Nov 2021 08:29:09 +0100
Message-Id: <20211127072910.1261824-4-eric.auger@redhat.com>
In-Reply-To: <20211127072910.1261824-1-eric.auger@redhat.com>
References: <20211127072910.1261824-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

in old times the domain range was defined by a domain_bits le32.
This was then converted into a domain_range struct. During the
upgrade the original value of '32' (bits) has been kept while
the end field now is the max value of the domain id (UINT32_MAX).
Fix that and also use UINT64_MAX for the input_range.end.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reported-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/virtio/virtio-iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 30ee09187b8..aa9c16a17b1 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -978,8 +978,8 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
     s->event_vq = virtio_add_queue(vdev, VIOMMU_DEFAULT_QUEUE_SIZE, NULL);
 
     s->config.page_size_mask = TARGET_PAGE_MASK;
-    s->config.input_range.end = -1UL;
-    s->config.domain_range.end = 32;
+    s->config.input_range.end = UINT64_MAX;
+    s->config.domain_range.end = UINT32_MAX;
     s->config.probe_size = VIOMMU_PROBE_SIZE;
 
     virtio_add_feature(&s->features, VIRTIO_RING_F_EVENT_IDX);
-- 
2.26.3


