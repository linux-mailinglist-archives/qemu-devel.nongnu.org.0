Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC5744D1FF
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 07:50:11 +0100 (CET)
Received: from localhost ([::1]:43722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml3uU-0003aV-53
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 01:50:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ml3jw-0000sq-1z
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 01:39:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ml3jt-0008GG-6Z
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 01:39:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636612752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b8spEDa3CYNdZ+VDWEhG2bwDPPSg8IVxjxOBYMsBUME=;
 b=A2VoFsy8EYtZlaxs3UAveXV9Jr+EOfIrn5iQaHpL7BCxC6c5xMzwDP6rhnRZY/YvxtuuB+
 ziohH80V563T/Bx90zSw4VV0+PDkDee/sk6884pyjezBj1gc5UVik2zZGg5R1VsZPLXdk7
 Gd78FPtrPITSrE1K5j7SM68ejQYf+j4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-p6wD8h1IMVSKtkD5gA1mHw-1; Thu, 11 Nov 2021 01:39:09 -0500
X-MC-Unique: p6wD8h1IMVSKtkD5gA1mHw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 616BA802EDA;
 Thu, 11 Nov 2021 06:39:08 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-246.pek2.redhat.com
 [10.72.13.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9E855BAE2;
 Thu, 11 Nov 2021 06:39:06 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com
Subject: [PATCH 2/2] virtio: use virtio accessor to access packed event
Date: Thu, 11 Nov 2021 14:38:54 +0800
Message-Id: <20211111063854.29060-2-jasowang@redhat.com>
In-Reply-To: <20211111063854.29060-1-jasowang@redhat.com>
References: <20211111063854.29060-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: eperezma@redhat.com, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We used to access packed descriptor event and off_wrap via
address_space_{write|read}_cached(). When we hit the cache, memcpy()
is used which is not atomic which may lead a wrong value to be read or
wrote.

This patch fixes this by switching to use
virito_{stw|lduw}_phys_cached() to make sure the access is atomic.

Fixes: 683f7665679c1 ("virtio: event suppression support for packed ring")
Cc: qemu-stable@nongnu.org
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/virtio.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 939bcbfeb9..ea7c079fb0 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -247,13 +247,10 @@ static void vring_packed_event_read(VirtIODevice *vdev,
     hwaddr off_off = offsetof(VRingPackedDescEvent, off_wrap);
     hwaddr off_flags = offsetof(VRingPackedDescEvent, flags);
 
-    address_space_read_cached(cache, off_flags, &e->flags,
-                              sizeof(e->flags));
+    e->flags = virtio_lduw_phys_cached(vdev, cache, off_flags);
     /* Make sure flags is seen before off_wrap */
     smp_rmb();
-    address_space_read_cached(cache, off_off, &e->off_wrap,
-                              sizeof(e->off_wrap));
-    virtio_tswap16s(vdev, &e->off_wrap);
+    e->off_wrap = virtio_lduw_phys_cached(vdev, cache, off_off);
     virtio_tswap16s(vdev, &e->flags);
 }
 
@@ -263,8 +260,7 @@ static void vring_packed_off_wrap_write(VirtIODevice *vdev,
 {
     hwaddr off = offsetof(VRingPackedDescEvent, off_wrap);
 
-    virtio_tswap16s(vdev, &off_wrap);
-    address_space_write_cached(cache, off, &off_wrap, sizeof(off_wrap));
+    virtio_stw_phys_cached(vdev, cache, off, off_wrap);
     address_space_cache_invalidate(cache, off, sizeof(off_wrap));
 }
 
@@ -273,8 +269,7 @@ static void vring_packed_flags_write(VirtIODevice *vdev,
 {
     hwaddr off = offsetof(VRingPackedDescEvent, flags);
 
-    virtio_tswap16s(vdev, &flags);
-    address_space_write_cached(cache, off, &flags, sizeof(flags));
+    virtio_stw_phys_cached(vdev, cache, off, flags);
     address_space_cache_invalidate(cache, off, sizeof(flags));
 }
 
-- 
2.25.1


