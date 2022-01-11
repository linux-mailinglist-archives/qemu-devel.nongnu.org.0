Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEE948AE01
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 13:56:58 +0100 (CET)
Received: from localhost ([::1]:36628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Ght-0004yz-RF
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 07:56:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7GS6-0003AZ-Mn
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 07:40:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7GS4-0001qT-Gz
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 07:40:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641904836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uLHtFC7j6d/HZS0sko9/4nQ9h5rCSDmvPJWEIM/koYc=;
 b=g2yNLbmT5HEiPyWoby/s68NDvzfVWGnSjLrBK6jaonn68ZUfdzSx3pkKaWvNTXCPQwWzhe
 geLTlUN/YgLdkWmP4h2TKNHbe3wW71ubE8wdhkvLscZjthRj5hphJ7LmsK4GwEs92nXvkS
 rzycQt/MCA1is8X+VAqewtnrmz2dgfE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-uxjAhufyOEaAdIAtPkYZrw-1; Tue, 11 Jan 2022 07:40:32 -0500
X-MC-Unique: uxjAhufyOEaAdIAtPkYZrw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA99F824F83;
 Tue, 11 Jan 2022 12:40:31 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C17F7B6EC;
 Tue, 11 Jan 2022 12:39:40 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] libvhost-user: Map shared RAM with MAP_NORESERVE to
 support virtio-mem with hugetlb
Date: Tue, 11 Jan 2022 13:39:39 +0100
Message-Id: <20220111123939.132659-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For fd-based shared memory, MAP_NORESERVE is only effective for hugetlb,
otherwise it's ignored. Older Linux versions that didn't support
reservation of huge pages ignored MAP_NORESERVE completely.

The first client to mmap a hugetlb fd without MAP_NORESERVE will
trigger reservation of huge pages for the whole mmapped range. There are
two cases to consider:

1) QEMU mapped RAM without MAP_NORESERVE

We're not dealing with a sparse mapping, huge pages for the whole range
have already been reserved by QEMU. An additional mmap() without
MAP_NORESERVE won't have any effect on the reservation.

2) QEMU mapped RAM with MAP_NORESERVE

We're delaing with a sparse mapping, no huge pages should be reserved.
Further mappings without MAP_NORESERVE should be avoided.

For 1), it doesn't matter if we set MAP_NORESERVE or not, so we can
simply set it. For 2), we'd be overriding QEMUs decision and trigger
reservation of huge pages, which might just fail if there are not
sufficient huge pages around. We must map with MAP_NORESERVE.

This change is required to support virtio-mem with hugetlb: a
virtio-mem device mapped into the guest physical memory corresponds to
a sparse memory mapping and QEMU maps this memory with MAP_NORESERVE.
Whenever memory in that sparse region will be accessed by the VM, QEMU
populates huge pages for the affected range by preallocating memory
and handling any preallocation errors gracefully.

So let's map shared RAM with MAP_NORESERVE. As libvhost-user only
supports Linux, there shouldn't be anything to take care of in regard of
other OS support.

Without this change, libvhost-user will fail mapping the region if there
are currently not enough huge pages to perform the reservation:
 fv_panic: libvhost-user: region mmap error: Cannot allocate memory

Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 787f4d2d4f..3b538930be 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -728,12 +728,12 @@ vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
          * accessing it before we userfault.
          */
         mmap_addr = mmap(0, dev_region->size + dev_region->mmap_offset,
-                         PROT_NONE, MAP_SHARED,
+                         PROT_NONE, MAP_SHARED | MAP_NORESERVE,
                          vmsg->fds[0], 0);
     } else {
         mmap_addr = mmap(0, dev_region->size + dev_region->mmap_offset,
-                         PROT_READ | PROT_WRITE, MAP_SHARED, vmsg->fds[0],
-                         0);
+                         PROT_READ | PROT_WRITE, MAP_SHARED | MAP_NORESERVE,
+                         vmsg->fds[0], 0);
     }
 
     if (mmap_addr == MAP_FAILED) {
@@ -878,7 +878,7 @@ vu_set_mem_table_exec_postcopy(VuDev *dev, VhostUserMsg *vmsg)
          * accessing it before we userfault
          */
         mmap_addr = mmap(0, dev_region->size + dev_region->mmap_offset,
-                         PROT_NONE, MAP_SHARED,
+                         PROT_NONE, MAP_SHARED | MAP_NORESERVE,
                          vmsg->fds[i], 0);
 
         if (mmap_addr == MAP_FAILED) {
@@ -965,7 +965,7 @@ vu_set_mem_table_exec(VuDev *dev, VhostUserMsg *vmsg)
          * mapped address has to be page aligned, and we use huge
          * pages.  */
         mmap_addr = mmap(0, dev_region->size + dev_region->mmap_offset,
-                         PROT_READ | PROT_WRITE, MAP_SHARED,
+                         PROT_READ | PROT_WRITE, MAP_SHARED | MAP_NORESERVE,
                          vmsg->fds[i], 0);
 
         if (mmap_addr == MAP_FAILED) {
-- 
2.33.1


