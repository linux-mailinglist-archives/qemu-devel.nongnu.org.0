Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6808368CB9A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 02:01:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPCLs-0003mz-Fh; Mon, 06 Feb 2023 20:00:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPCKy-0003QH-LB
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 20:00:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPCKn-00044M-KA
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 19:59:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675731585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AEZrsqZsmcl/2XNXsBwuDppqhKVGTnKg5/u2lNXA0Nk=;
 b=XhLA2dsXaob2GqHSaHkEg0XIhEcSl8GsHy97teU0UZWYHkON8rF+jJhG/lvSgGPt0hmP6K
 GXB/ca3ar18ER7bbcl98kq8gJwU+gv0g0GA5FfD7VPdanCzoVMpjpHlS/bJmOALO/7z0bG
 PlDEDWzEeDen6DSoAC5KaBUThqaUC2s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-IiZIEu_7NP-yOeYctboWbw-1; Mon, 06 Feb 2023 19:59:40 -0500
X-MC-Unique: IiZIEu_7NP-yOeYctboWbw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C70AB185A794;
 Tue,  7 Feb 2023 00:59:38 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0EBAA492C3C;
 Tue,  7 Feb 2023 00:59:33 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 John Snow <jsnow@redhat.com>, David Hildenbrand <david@redhat.com>,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Blake <eblake@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Jiang Jiacheng <jiangjiacheng@huawei.com>
Subject: [PULL 30/30] migration: save/delete migration thread info
Date: Tue,  7 Feb 2023 01:56:50 +0100
Message-Id: <20230207005650.1810-31-quintela@redhat.com>
In-Reply-To: <20230207005650.1810-1-quintela@redhat.com>
References: <20230207005650.1810-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Jiang Jiacheng <jiangjiacheng@huawei.com>

To support query migration thread infomation, save and delete
thread(live_migration and multifdsend) information at thread
creation and finish.

Signed-off-by: Jiang Jiacheng <jiangjiacheng@huawei.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c | 5 +++++
 migration/multifd.c   | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index 66c74f8e17..7a14aa98d8 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -58,6 +58,7 @@
 #include "net/announce.h"
 #include "qemu/queue.h"
 #include "multifd.h"
+#include "threadinfo.h"
 #include "qemu/yank.h"
 #include "sysemu/cpus.h"
 #include "yank_functions.h"
@@ -4028,10 +4029,13 @@ static void qemu_savevm_wait_unplug(MigrationState *s, int old_state,
 static void *migration_thread(void *opaque)
 {
     MigrationState *s = opaque;
+    MigrationThread *thread = NULL;
     int64_t setup_start = qemu_clock_get_ms(QEMU_CLOCK_HOST);
     MigThrError thr_error;
     bool urgent = false;
 
+    thread = MigrationThreadAdd("live_migration", qemu_get_thread_id());
+
     rcu_register_thread();
 
     object_ref(OBJECT(s));
@@ -4108,6 +4112,7 @@ static void *migration_thread(void *opaque)
     migration_iteration_finish(s);
     object_unref(OBJECT(s));
     rcu_unregister_thread();
+    MigrationThreadDel(thread);
     return NULL;
 }
 
diff --git a/migration/multifd.c b/migration/multifd.c
index 437bf6f808..b7ad7002e0 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -24,6 +24,7 @@
 #include "qemu-file.h"
 #include "trace.h"
 #include "multifd.h"
+#include "threadinfo.h"
 
 #include "qemu/yank.h"
 #include "io/channel-socket.h"
@@ -649,10 +650,13 @@ int multifd_send_sync_main(QEMUFile *f)
 static void *multifd_send_thread(void *opaque)
 {
     MultiFDSendParams *p = opaque;
+    MigrationThread *thread = NULL;
     Error *local_err = NULL;
     int ret = 0;
     bool use_zero_copy_send = migrate_use_zero_copy_send();
 
+    thread = MigrationThreadAdd(p->name, qemu_get_thread_id());
+
     trace_multifd_send_thread_start(p->id);
     rcu_register_thread();
 
@@ -762,6 +766,7 @@ out:
     qemu_mutex_unlock(&p->mutex);
 
     rcu_unregister_thread();
+    MigrationThreadDel(thread);
     trace_multifd_send_thread_end(p->id, p->num_packets, p->total_normal_pages);
 
     return NULL;
-- 
2.39.1


