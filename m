Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1660760E856
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:07:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onld0-0007go-7Z; Wed, 26 Oct 2022 14:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onlcx-0007bx-Si
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 14:59:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onlcv-00072C-Ci
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 14:59:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666810784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5oyv0L+nEvVV29hQcvp+dXMvk9jfrApJ3RUgs5WhFnU=;
 b=Cs72vnPXT3EEyPBR0WJG1MFk6aFjqTF424nT0OBkTIkoQhGnlP/TkffWlGCa2rjc6QW6Gs
 msJlogmzBM/Zs+ijyxHskVePKDrlvhFx37QMiKHVnqG8KQsTOY+Kj2XDpd5ehhk5Kzvolx
 iIdObqzWTtGiIPfjMAVYQlmKYfz8s+Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-DvudP-K_MnSIoELxXC70Tg-1; Wed, 26 Oct 2022 14:59:34 -0400
X-MC-Unique: DvudP-K_MnSIoELxXC70Tg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E85BE887401;
 Wed, 26 Oct 2022 18:59:33 +0000 (UTC)
Received: from localhost (unknown [10.39.192.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23A492024CB7;
 Wed, 26 Oct 2022 18:59:32 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Thomas Huth <thuth@redhat.com>,
 integration@gluster.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Peter Xu <peterx@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, Xie Changlong <xiechanglong.d@gmail.com>,
 Jeff Cody <codyprime@gmail.com>, John Snow <jsnow@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>
Subject: [PULL 03/13] numa: call ->ram_block_removed() in
 ram_block_notifer_remove()
Date: Wed, 26 Oct 2022 14:58:36 -0400
Message-Id: <20221026185846.120544-4-stefanha@redhat.com>
In-Reply-To: <20221026185846.120544-1-stefanha@redhat.com>
References: <20221026185846.120544-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When a RAMBlockNotifier is added, ->ram_block_added() is called with all
existing RAMBlocks. There is no equivalent ->ram_block_removed() call
when a RAMBlockNotifier is removed.

The util/vfio-helpers.c code (the sole user of RAMBlockNotifier) is fine
with this asymmetry because it does not rely on RAMBlockNotifier for
cleanup. It walks its internal list of DMA mappings and unmaps them by
itself.

Future users of RAMBlockNotifier may not have an internal data structure
that records added RAMBlocks so they will need ->ram_block_removed()
callbacks.

This patch makes ram_block_notifier_remove() symmetric with respect to
callbacks. Now util/vfio-helpers.c needs to unmap remaining DMA mappings
after ram_block_notifier_remove() has been called. This is necessary
since users like block/nvme.c may create additional DMA mappings that do
not originate from the RAMBlockNotifier.

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-id: 20221013185908.1297568-4-stefanha@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/core/numa.c      | 17 +++++++++++++++++
 util/vfio-helpers.c |  5 ++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index 26d8e5f616..31e6fe1caa 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -822,6 +822,19 @@ static int ram_block_notify_add_single(RAMBlock *rb, void *opaque)
     return 0;
 }
 
+static int ram_block_notify_remove_single(RAMBlock *rb, void *opaque)
+{
+    const ram_addr_t max_size = qemu_ram_get_max_length(rb);
+    const ram_addr_t size = qemu_ram_get_used_length(rb);
+    void *host = qemu_ram_get_host_addr(rb);
+    RAMBlockNotifier *notifier = opaque;
+
+    if (host) {
+        notifier->ram_block_removed(notifier, host, size, max_size);
+    }
+    return 0;
+}
+
 void ram_block_notifier_add(RAMBlockNotifier *n)
 {
     QLIST_INSERT_HEAD(&ram_list.ramblock_notifiers, n, next);
@@ -835,6 +848,10 @@ void ram_block_notifier_add(RAMBlockNotifier *n)
 void ram_block_notifier_remove(RAMBlockNotifier *n)
 {
     QLIST_REMOVE(n, next);
+
+    if (n->ram_block_removed) {
+        qemu_ram_foreach_block(ram_block_notify_remove_single, n);
+    }
 }
 
 void ram_block_notify_add(void *host, size_t size, size_t max_size)
diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 5ba01177bf..0d1520caac 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -847,10 +847,13 @@ void qemu_vfio_close(QEMUVFIOState *s)
     if (!s) {
         return;
     }
+
+    ram_block_notifier_remove(&s->ram_notifier);
+
     for (i = 0; i < s->nr_mappings; ++i) {
         qemu_vfio_undo_mapping(s, &s->mappings[i], NULL);
     }
-    ram_block_notifier_remove(&s->ram_notifier);
+
     g_free(s->usable_iova_ranges);
     s->nb_iova_ranges = 0;
     qemu_vfio_reset(s);
-- 
2.37.3


