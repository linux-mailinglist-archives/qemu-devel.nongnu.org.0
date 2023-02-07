Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3C268CB8F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 01:59:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPCJk-0006KC-N5; Mon, 06 Feb 2023 19:58:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPCJd-0006Er-Sj
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 19:58:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPCJc-0003q6-7o
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 19:58:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675731511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q1LoaRfWiwzrRwpeBFvBBVZ3XpJ9G+LHn1D5QvSQUWI=;
 b=dZvP1lbE8i0P1fgsFABF5Cv9hSvxqF7pixM9DUmF2+XXGw8bf8bKyZWqaL80QVSAIUnGob
 +qqgW2Upse6EAtCLK9JkT+ZRenQr0hfl2Dqdv09N253RSEOEGyT33dW7uFeqaoYIx2mXCp
 bRu2DuLE8gsEs3wXEu/0UO/SvZt9z/A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-e2cld422PqqWKO-zCUj-eA-1; Mon, 06 Feb 2023 19:58:25 -0500
X-MC-Unique: e2cld422PqqWKO-zCUj-eA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5CAF1C05AE8;
 Tue,  7 Feb 2023 00:58:24 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0A89492C3C;
 Tue,  7 Feb 2023 00:58:13 +0000 (UTC)
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
 Peter Xu <peterx@redhat.com>
Subject: [PULL 16/30] migration/ram: Factor out check for advised postcopy
Date: Tue,  7 Feb 2023 01:56:36 +0100
Message-Id: <20230207005650.1810-17-quintela@redhat.com>
In-Reply-To: <20230207005650.1810-1-quintela@redhat.com>
References: <20230207005650.1810-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: David Hildenbrand <david@redhat.com>

Let's factor out this check, to be used in virtio-mem context next.

While at it, fix a spelling error in a related comment.

Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>S
Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/migration/misc.h | 4 +++-
 migration/migration.c    | 7 +++++++
 migration/ram.c          | 8 +-------
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/include/migration/misc.h b/include/migration/misc.h
index 465906710d..8b49841016 100644
--- a/include/migration/misc.h
+++ b/include/migration/misc.h
@@ -67,8 +67,10 @@ bool migration_has_failed(MigrationState *);
 /* ...and after the device transmission */
 bool migration_in_postcopy_after_devices(MigrationState *);
 void migration_global_dump(Monitor *mon);
-/* True if incomming migration entered POSTCOPY_INCOMING_DISCARD */
+/* True if incoming migration entered POSTCOPY_INCOMING_DISCARD */
 bool migration_in_incoming_postcopy(void);
+/* True if incoming migration entered POSTCOPY_INCOMING_ADVISE */
+bool migration_incoming_postcopy_advised(void);
 /* True if background snapshot is active */
 bool migration_in_bg_snapshot(void);
 
diff --git a/migration/migration.c b/migration/migration.c
index c3ad4cd670..f321e419c7 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2126,6 +2126,13 @@ bool migration_in_incoming_postcopy(void)
     return ps >= POSTCOPY_INCOMING_DISCARD && ps < POSTCOPY_INCOMING_END;
 }
 
+bool migration_incoming_postcopy_advised(void)
+{
+    PostcopyState ps = postcopy_state_get();
+
+    return ps >= POSTCOPY_INCOMING_ADVISE && ps < POSTCOPY_INCOMING_END;
+}
+
 bool migration_in_bg_snapshot(void)
 {
     MigrationState *s = migrate_get_current();
diff --git a/migration/ram.c b/migration/ram.c
index 7f6d5efe8d..b966e148c2 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4150,12 +4150,6 @@ int ram_load_postcopy(QEMUFile *f, int channel)
     return ret;
 }
 
-static bool postcopy_is_advised(void)
-{
-    PostcopyState ps = postcopy_state_get();
-    return ps >= POSTCOPY_INCOMING_ADVISE && ps < POSTCOPY_INCOMING_END;
-}
-
 static bool postcopy_is_running(void)
 {
     PostcopyState ps = postcopy_state_get();
@@ -4226,7 +4220,7 @@ static int ram_load_precopy(QEMUFile *f)
     MigrationIncomingState *mis = migration_incoming_get_current();
     int flags = 0, ret = 0, invalid_flags = 0, len = 0, i = 0;
     /* ADVISE is earlier, it shows the source has the postcopy capability on */
-    bool postcopy_advised = postcopy_is_advised();
+    bool postcopy_advised = migration_incoming_postcopy_advised();
     if (!migrate_use_compression()) {
         invalid_flags |= RAM_SAVE_FLAG_COMPRESS_PAGE;
     }
-- 
2.39.1


