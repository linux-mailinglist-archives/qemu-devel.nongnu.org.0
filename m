Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F7E48AEC6
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 14:46:34 +0100 (CET)
Received: from localhost ([::1]:51294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7HTt-0007Kq-MS
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 08:46:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1n7Gmq-0005CQ-Ad
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:02:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1n7Gmm-0005r5-32
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:02:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641906091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MeO/JAeVgByTv/LBgZT2Of+Su/RDJuxNK9hqAFe+UyE=;
 b=C6XhslXJPqG/Tdf6bWaff6htih5Rja+GPyEa/ZsH8hAqtTyZlOlbkqZQr+7c2j1Tk3KiAY
 mjbYYZjreCkiBbXjTFaBkeMGFbRcKUvIFXSoNcnKhvAVfitMZ8YaURlL8a3Xupk6Ya3Ctj
 FSHC2RDhTfpTFAGLrqnGvi0dcUrmwGc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-VPUlUMvXMh2nrqYVO0h4oA-1; Tue, 11 Jan 2022 08:01:28 -0500
X-MC-Unique: VPUlUMvXMh2nrqYVO0h4oA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BD4C1023F50;
 Tue, 11 Jan 2022 13:01:27 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D12A1059179;
 Tue, 11 Jan 2022 13:01:25 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 19/23] multifd: Add property to enable/disable zero_page
Date: Tue, 11 Jan 2022 14:00:20 +0100
Message-Id: <20220111130024.5392-20-quintela@redhat.com>
In-Reply-To: <20220111130024.5392-1-quintela@redhat.com>
References: <20220111130024.5392-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.h |  3 +++
 hw/core/machine.c     |  4 +++-
 migration/migration.c | 11 +++++++++++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/migration/migration.h b/migration/migration.h
index 8130b703eb..638cd89b6c 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -296,6 +296,8 @@ struct MigrationState {
      * This save hostname when out-going migration starts
      */
     char *hostname;
+    /* Use multifd channel to send zero pages */
+    bool multifd_zero_pages;
 };
 
 void migrate_set_state(int *state, int old_state, int new_state);
@@ -338,6 +340,7 @@ int migrate_multifd_channels(void);
 MultiFDCompression migrate_multifd_compression(void);
 int migrate_multifd_zlib_level(void);
 int migrate_multifd_zstd_level(void);
+bool migrate_use_multifd_zero_page(void);
 
 int migrate_use_xbzrle(void);
 uint64_t migrate_xbzrle_cache_size(void);
diff --git a/hw/core/machine.c b/hw/core/machine.c
index debcdc0e70..fc303cb707 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -37,7 +37,9 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
 
-GlobalProperty hw_compat_6_2[] = {};
+GlobalProperty hw_compat_6_2[] = {
+    { "migration", "multifd-zero-page", "false" },
+};
 const size_t hw_compat_6_2_len = G_N_ELEMENTS(hw_compat_6_2);
 
 GlobalProperty hw_compat_6_1[] = {
diff --git a/migration/migration.c b/migration/migration.c
index 0652165610..ff39f07fc5 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2502,6 +2502,15 @@ bool migrate_use_multifd(void)
     return s->enabled_capabilities[MIGRATION_CAPABILITY_MULTIFD];
 }
 
+bool migrate_use_multifd_zero_page(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->multifd_zero_pages;
+}
+
 bool migrate_pause_before_switchover(void)
 {
     MigrationState *s;
@@ -4158,6 +4167,8 @@ static Property migration_properties[] = {
                       clear_bitmap_shift, CLEAR_BITMAP_SHIFT_DEFAULT),
 
     /* Migration parameters */
+    DEFINE_PROP_BOOL("multifd-zero-pages", MigrationState,
+                      multifd_zero_pages, true),
     DEFINE_PROP_UINT8("x-compress-level", MigrationState,
                       parameters.compress_level,
                       DEFAULT_MIGRATE_COMPRESS_LEVEL),
-- 
2.34.1


