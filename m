Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A1A4295B9
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 19:34:43 +0200 (CEST)
Received: from localhost ([::1]:36466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZzCE-0000G1-Jz
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 13:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mZzAv-0007mr-Cr
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 13:33:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mZzAq-0008D8-JC
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 13:33:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633973594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hyaHpxE0Hm9BfkB4VyXkJuw+x0BvM88d5KiAz245sBw=;
 b=LWp6vRPwH3O0ruc1BhH15qgPDhtTZPIFj+NQFm5ooFIkgySxifGnhrBKBdMAwJd25BJq3W
 jj6U2SL0UKt3a2D7efMs5DsXP38mpiRMCKY1birzgxyK0Isxpq+x0YUvf0H97fJyXYFf8l
 rgtjCrXluQHqYGGNOuIgRrljYXqcqPg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-VKJLK3IFPoyuWXSoSHR5gQ-1; Mon, 11 Oct 2021 13:33:13 -0400
X-MC-Unique: VKJLK3IFPoyuWXSoSHR5gQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF274824FA9
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 17:33:12 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82F0D5D6D5;
 Mon, 11 Oct 2021 17:33:06 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] virtio-mem: Don't skip alignment checks when warning about
 block size
Date: Mon, 11 Oct 2021 19:33:05 +0200
Message-Id: <20211011173305.13778-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If we warn about the block size being smaller than the default, we skip
some alignment checks.

This can currently only fail on x86-64, when specifying a block size of
1 MiB, however, we detect the THP size of 2 MiB.

Fixes: 228957fea3a9 ("virtio-mem: Probe THP size to determine default block size")
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-mem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index df91e454b2..7ce9901791 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -701,7 +701,8 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
         warn_report("'%s' property is smaller than the default block size (%"
                     PRIx64 " MiB)", VIRTIO_MEM_BLOCK_SIZE_PROP,
                     virtio_mem_default_block_size(rb) / MiB);
-    } else if (!QEMU_IS_ALIGNED(vmem->requested_size, vmem->block_size)) {
+    }
+    if (!QEMU_IS_ALIGNED(vmem->requested_size, vmem->block_size)) {
         error_setg(errp, "'%s' property has to be multiples of '%s' (0x%" PRIx64
                    ")", VIRTIO_MEM_REQUESTED_SIZE_PROP,
                    VIRTIO_MEM_BLOCK_SIZE_PROP, vmem->block_size);
-- 
2.31.1


