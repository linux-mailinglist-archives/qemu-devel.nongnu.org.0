Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D948549B6B5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 15:46:24 +0100 (CET)
Received: from localhost ([::1]:39048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCN5T-0000u0-DF
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 09:46:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nCMKd-0000Js-Na
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 08:58:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nCMKQ-0002hz-22
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 08:57:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643119060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MKVdDpmsiD0N08grHKgnsOW9qzZBzzpOjdkj/yG8Onk=;
 b=faNi+g0R9kHiHSBRrGkBZ+gnZIRjprgygt8OUoph6NKrXBDqZowJ8QTFQLtCsRgGR8MlB3
 FZ9nphXkpxmzlowoKf5anf8hAlZXYq8rn+Zh+26JKKuHK6ZFrKwQxmSoSB+w7BeTDTg74O
 +hMZulpV2clxkE6Cpk+LbqOL+tg6ENo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-OFUL0MytMoy7TKJcp9hE9w-1; Tue, 25 Jan 2022 08:57:39 -0500
X-MC-Unique: OFUL0MytMoy7TKJcp9hE9w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CC7F1018720
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 13:57:38 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41F5D2377B;
 Tue, 25 Jan 2022 13:57:37 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] virtio-mem: Fail if a memory backend with
 "prealloc=on" is specified
Date: Tue, 25 Jan 2022 14:57:33 +0100
Message-Id: <20220125135734.134928-2-david@redhat.com>
In-Reply-To: <20220125135734.134928-1-david@redhat.com>
References: <20220125135734.134928-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Michal Privoznik <mprivozn@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"prealloc=on" for the memory backend does not work as expected, as
virtio-mem will simply discard all preallocated memory immediately again.
In the best case, it's an expensive NOP. In the worst case, it's an
unexpected allocation error.

Instead, "prealloc=on" should be specified for the virtio-mem device only,
such that virtio-mem will try preallocating memory before plugging
memory dynamically to the guest. Fail if such a memory backend is
provided.

Tested-by: Michal Privoznik <mprivozn@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-mem.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index f55dcf61f2..b7bad6ef96 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -773,6 +773,12 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
         error_setg(errp, "'%s' property specifies an unsupported memdev",
                    VIRTIO_MEM_MEMDEV_PROP);
         return;
+    } else if (vmem->memdev->prealloc) {
+        error_setg(errp, "'%s' property specifies a memdev with preallocation"
+                   " enabled: %s. Instead, specify 'prealloc=on' for the"
+                   " virtio-mem device. ", VIRTIO_MEM_MEMDEV_PROP,
+                   object_get_canonical_path_component(OBJECT(vmem->memdev)));
+        return;
     }
 
     if ((nb_numa_nodes && vmem->node >= nb_numa_nodes) ||
-- 
2.34.1


