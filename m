Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C78476ACE2A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 20:34:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZGZP-0004rP-0j; Mon, 06 Mar 2023 14:32:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pZGZG-0004qd-6x
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 14:32:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pZGZE-0007zo-9M
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 14:32:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678131135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=eqKeK6J6CcknWlhalclfbafSWkzVzpdKHEhs49F/9Ao=;
 b=Wb5EaXiIPt+Yd5BRSZ5NCC3FvCfIjsUl23YlHGpkiD9X4byIcQIcsGLsg7vuoxeZ4wNI1K
 fPxYS/pvn0BqzIHRVLv7PR/ppAjJP0HiyQ65mSiDe3Smfh2voWJfzxtdPPwrEKWFgVo+iA
 BE/pqYY2P6YR33kuwD14aIFqOi/6/AU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-vdLB6IAXOaiwW8HcsaBnXg-1; Mon, 06 Mar 2023 14:32:14 -0500
X-MC-Unique: vdLB6IAXOaiwW8HcsaBnXg-1
Received: by mail-qv1-f69.google.com with SMTP id
 lt7-20020a056214570700b0057290f3623eso6069833qvb.3
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 11:32:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678131133;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eqKeK6J6CcknWlhalclfbafSWkzVzpdKHEhs49F/9Ao=;
 b=xEF8a9Pyolj5unJ/ijwBO3YX8rxf/DKH7WksR6PR3ANhblyMa3THlyddszNelwi+bF
 J1sq1T42hw9RAF1qcRO/btL212eDSvL4FOpmpvIn7oACD3vyZlRdreK15MyyTmK0NjHh
 A3/q6BCSFE3+BsFtPBCrH5NF0Z3/47eCylIs+jYSM1jCGMchyUbJDkOVsvZIbmJG2bst
 j7RgKt1nTNtdxhW4sjzHnwUkOsvvst3bY0ZzW9oL+UthWihwGETmvcc+7HLUu0niZ1CJ
 WSaH206Yn/js/EHY6kgEJ3M2mpS5muE8Oo5JwJ4EJ/ZKcsAD7oVDRbVNrr8myilXBqt/
 QDLw==
X-Gm-Message-State: AO0yUKWTmFrMq7Uck9Ms75/d1A0xEQbxVIYbHq/vLbu1decTEK5klhvR
 X2R/IOdPMjbAkcuXuttOkoz9Li7gN+SHh0HqZN60/qcJ+KE6wniKRnJ6/dYT2n9adHJp5oyNJy5
 JtemWkP9VZ5L0UsEub082HxQDp8ySNmLByhbKInAiMFYm+jNpBa9+0L3yvl1km0TNTHduTWmA
X-Received: by 2002:a0c:b24c:0:b0:57a:4600:2fd7 with SMTP id
 k12-20020a0cb24c000000b0057a46002fd7mr16171610qve.3.1678131133009; 
 Mon, 06 Mar 2023 11:32:13 -0800 (PST)
X-Google-Smtp-Source: AK7set/eKBavRM0AnnFlNSeuyPiH+wCtxMwpgNw2qiFFG5TwkxGV1PkTA+FIkqHFeRlz8W8To6A+yA==
X-Received: by 2002:a0c:b24c:0:b0:57a:4600:2fd7 with SMTP id
 k12-20020a0cb24c000000b0057a46002fd7mr16171582qve.3.1678131132710; 
 Mon, 06 Mar 2023 11:32:12 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a37aa0e000000b006bb82221013sm8043738qke.0.2023.03.06.11.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 11:32:10 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, longpeng2@huawei.com, peterx@redhat.com,
 "Michael S . Tsirkin" <mst@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: [PATCH] vhost: Drop unused eventfd_add|del hooks
Date: Mon,  6 Mar 2023 14:32:09 -0500
Message-Id: <20230306193209.516011-1-peterx@redhat.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These hooks were introduced in:

80a1ea3748 ("memory: move ioeventfd ops to MemoryListener", 2012-02-29)

But they seem to be never used.  Drop them.

Cc: Richard Henderson <rth@twiddle.net>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 hw/virtio/vhost.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index eb8c4c378c..c713dc5d9d 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1291,18 +1291,6 @@ void vhost_virtqueue_stop(struct vhost_dev *dev,
                        0, virtio_queue_get_desc_size(vdev, idx));
 }
 
-static void vhost_eventfd_add(MemoryListener *listener,
-                              MemoryRegionSection *section,
-                              bool match_data, uint64_t data, EventNotifier *e)
-{
-}
-
-static void vhost_eventfd_del(MemoryListener *listener,
-                              MemoryRegionSection *section,
-                              bool match_data, uint64_t data, EventNotifier *e)
-{
-}
-
 static int vhost_virtqueue_set_busyloop_timeout(struct vhost_dev *dev,
                                                 int n, uint32_t timeout)
 {
@@ -1457,8 +1445,6 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
         .log_sync = vhost_log_sync,
         .log_global_start = vhost_log_global_start,
         .log_global_stop = vhost_log_global_stop,
-        .eventfd_add = vhost_eventfd_add,
-        .eventfd_del = vhost_eventfd_del,
         .priority = 10
     };
 
-- 
2.39.1


