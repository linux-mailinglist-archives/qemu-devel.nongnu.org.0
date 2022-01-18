Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480E24929CF
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 16:44:13 +0100 (CET)
Received: from localhost ([::1]:44044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9qeZ-0002zV-Ri
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 10:44:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n9q5p-0000SL-1E
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 10:08:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n9q5m-0006ch-V6
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 10:08:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642518494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mSqTXeGEA5FR0UobAxa0cVsfO5y4bLI6WLK1pPj15QQ=;
 b=eVTA4cc4R+KO0sI6jPuNrK4bReDWru7VDLEE+nQ1iXTNasTpB03/MDoG6ed2j5NkMB3vAz
 xkL6euDVawOTqvM+dTNYyJyw09AQ9rYJDt0B00umdfXiM4Ediwv5cS3Oa762h7WBoE+V+Z
 Ig/b83PHeh61h9bt8LdGz1r3AWrEiAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-wv3f3PgcPc6_uij8Mnv5OQ-1; Tue, 18 Jan 2022 10:08:11 -0500
X-MC-Unique: wv3f3PgcPc6_uij8Mnv5OQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D1251014509
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 15:08:10 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.195.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 507785DBA2;
 Tue, 18 Jan 2022 15:07:43 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/2] virtio-mem: Warn if a memory backend with
 "prealloc=on" is used
Date: Tue, 18 Jan 2022 16:07:11 +0100
Message-Id: <20220118150712.139953-2-david@redhat.com>
In-Reply-To: <20220118150712.139953-1-david@redhat.com>
References: <20220118150712.139953-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
memory dynamically to the guest.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-mem.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 04c223b0c9..6c337db0a7 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -765,6 +765,13 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (vmem->memdev->prealloc) {
+        warn_report("'%s' property specifies a memdev with preallocation"
+                    " enabled: %s. Instead, specify 'prealloc=on' for the"
+                    " virtio-mem device. ", VIRTIO_MEM_MEMDEV_PROP,
+                    object_get_canonical_path_component(OBJECT(vmem->memdev)));
+    }
+
     if ((nb_numa_nodes && vmem->node >= nb_numa_nodes) ||
         (!nb_numa_nodes && vmem->node)) {
         error_setg(errp, "'%s' property has value '%" PRIu32 "', which exceeds"
-- 
2.34.1


