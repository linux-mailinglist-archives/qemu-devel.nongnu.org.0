Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AFF6FC3DD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 12:28:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwKZk-0004d7-MW; Tue, 09 May 2023 06:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1pwKZi-0004co-Mf
 for qemu-devel@nongnu.org; Tue, 09 May 2023 06:28:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1pwKZg-0004IX-Sz
 for qemu-devel@nongnu.org; Tue, 09 May 2023 06:28:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683628083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=aun1KAgJ/l5D5MV62EXw45ViiDxztOnV6C0HWjcONJw=;
 b=Rf99g+4qYb7gumJnN43Q9tkI3Pw4UI7DZGNTOlY/3Mka4XIuVBbsHDAKDz9Jj1Oj+VOis9
 vMZXp2Fhhy6t0c4CpxTPg19jIHvtQvDYfc5D8FtqFb0tMVSrQlSL1rJOlFLRN40AvlnCAg
 Zi6AsQ0YEMnxlD3V6pd47thSoyz8+es=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-3cxRQIOyNRWFGGzP9BXehw-1; Tue, 09 May 2023 06:26:56 -0400
X-MC-Unique: 3cxRQIOyNRWFGGzP9BXehw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8340A2806049
 for <qemu-devel@nongnu.org>; Tue,  9 May 2023 10:26:56 +0000 (UTC)
Received: from li-e37642cc-328d-11b2-a85c-baf3c1ca8b0f.ibm.com.com (unknown
 [10.35.206.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CAC0492B00;
 Tue,  9 May 2023 10:26:55 +0000 (UTC)
From: Nir Soffer <nsoffer@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Stefan Hajnoczi" <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Nir Soffer <nsoffer@redhat.com>
Subject: [PATCH] libvhost-user: Fix update of signalled_used
Date: Tue,  9 May 2023 13:26:52 +0300
Message-Id: <20230509102652.705859-1-nsoffer@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When we check if a driver needs a signal, we compare:

- used_event: written by the driver each time it consumes an item
- new: current idx written to the used ring, updated by us
- old: last idx we signaled about

We call vring_need_event() which does:

    return (__u16)(new_idx - event_idx - 1) < (__u16)(new_idx - old);

Previously we updated signalled_used on every check, so old was always
new - 1. Because used_event cannot bigger than new_idx, this check
becomes (ignoring wrapping):

    return new_idx == event_idx + 1;

Since the driver consumes items at the same time the device produces
items, it is very likely (and seen in logs) that the driver used_event
is too far behind new_idx and we don't signal the driver.

With libblkio virtio-blk-vhost-user driver, if the driver does not get a
signal, the libblkio client can hang polling the completion fd. This
is very easy to reproduce on some machines and impossible to reproduce
on others.

Fixed by updating signalled_used only when we signal the driver.
Tested using blkio-bench and libblkio client application that used to
hang randomly without this change.

Buglink: https://gitlab.com/libblkio/libblkio/-/issues/68
Signed-off-by: Nir Soffer <nsoffer@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 8fb61e2df2..5f26d2d378 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -2382,12 +2382,11 @@ vu_queue_empty(VuDev *dev, VuVirtq *vq)
 }
 
 static bool
 vring_notify(VuDev *dev, VuVirtq *vq)
 {
-    uint16_t old, new;
-    bool v;
+    uint16_t old, new, used;
 
     /* We need to expose used array entries before checking used event. */
     smp_mb();
 
     /* Always notify when queue is empty (when feature acknowledge) */
@@ -2398,15 +2397,27 @@ vring_notify(VuDev *dev, VuVirtq *vq)
 
     if (!vu_has_feature(dev, VIRTIO_RING_F_EVENT_IDX)) {
         return !(vring_avail_flags(vq) & VRING_AVAIL_F_NO_INTERRUPT);
     }
 
-    v = vq->signalled_used_valid;
-    vq->signalled_used_valid = true;
+    if (!vq->signalled_used_valid) {
+        vq->signalled_used_valid = true;
+        vq->signalled_used = vq->used_idx;
+        return true;
+    }
+
+    used = vring_get_used_event(vq);
+    new = vq->used_idx;
     old = vq->signalled_used;
-    new = vq->signalled_used = vq->used_idx;
-    return !v || vring_need_event(vring_get_used_event(vq), new, old);
+
+    if (vring_need_event(used, new, old)) {
+        vq->signalled_used_valid = true;
+        vq->signalled_used = vq->used_idx;
+        return true;
+    }
+
+    return false;
 }
 
 static void _vu_queue_notify(VuDev *dev, VuVirtq *vq, bool sync)
 {
     if (unlikely(dev->broken) ||
-- 
2.40.1


