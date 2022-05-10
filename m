Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B1652272F
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 00:48:58 +0200 (CEST)
Received: from localhost ([::1]:50112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noYf2-0004jV-P6
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 18:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1noYaM-0004de-PL
 for qemu-devel@nongnu.org; Tue, 10 May 2022 18:44:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1noYaI-0006Jb-8A
 for qemu-devel@nongnu.org; Tue, 10 May 2022 18:44:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652222641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=297XkggsqFJrCt8Cdj+dg0kFfmrKBouMvt5oU76YnFY=;
 b=fDDm0YGRWPC41nI0e4KMf8gv78npTMGVsRnvcFuKCMuo+e1/dKUPMQSqw7wAjcoc7BCzI4
 s6OSBPdVxX1fygTMIRLdPBO0NxTAQFp6oa+k4ih3iFvUkBwkhruCE+yjCEZW8sUYh6gzjB
 xXLngUIBaoXghYh12Ec+6nyVKTviOW8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-n9z07mGfNROdBdgzrkME-w-1; Tue, 10 May 2022 18:42:41 -0400
X-MC-Unique: n9z07mGfNROdBdgzrkME-w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F01A480A0B9;
 Tue, 10 May 2022 22:42:40 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C2DC400E89E;
 Tue, 10 May 2022 22:42:39 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v6 09/13] multifd: Add property to enable/disable zero_page
Date: Wed, 11 May 2022 00:42:16 +0200
Message-Id: <20220510224220.5912-10-quintela@redhat.com>
In-Reply-To: <20220510224220.5912-1-quintela@redhat.com>
References: <20220510224220.5912-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.h |  3 +++
 hw/core/machine.c     |  4 +++-
 migration/migration.c | 11 +++++++++++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/migration/migration.h b/migration/migration.h
index a863032b71..068e66ca9a 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -332,6 +332,8 @@ struct MigrationState {
      * This save hostname when out-going migration starts
      */
     char *hostname;
+    /* Use multifd channel to send zero pages */
+    bool multifd_zero_pages;
 };
 
 void migrate_set_state(int *state, int old_state, int new_state);
@@ -374,6 +376,7 @@ int migrate_multifd_channels(void);
 MultiFDCompression migrate_multifd_compression(void);
 int migrate_multifd_zlib_level(void);
 int migrate_multifd_zstd_level(void);
+bool migrate_use_multifd_zero_page(void);
 
 int migrate_use_xbzrle(void);
 uint64_t migrate_xbzrle_cache_size(void);
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 700c1e76b8..d02977d5df 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -37,7 +37,9 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
 
-GlobalProperty hw_compat_7_0[] = {};
+GlobalProperty hw_compat_7_0[] = {
+    { "migration", "multifd-zero-pages", "false" },
+};
 const size_t hw_compat_7_0_len = G_N_ELEMENTS(hw_compat_7_0);
 
 GlobalProperty hw_compat_6_2[] = {
diff --git a/migration/migration.c b/migration/migration.c
index 5a31b23bd6..7e591990ef 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2517,6 +2517,15 @@ bool migrate_use_multifd(void)
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
@@ -4164,6 +4173,8 @@ static Property migration_properties[] = {
                       clear_bitmap_shift, CLEAR_BITMAP_SHIFT_DEFAULT),
 
     /* Migration parameters */
+    DEFINE_PROP_BOOL("multifd-zero-pages", MigrationState,
+                      multifd_zero_pages, true),
     DEFINE_PROP_UINT8("x-compress-level", MigrationState,
                       parameters.compress_level,
                       DEFAULT_MIGRATE_COMPRESS_LEVEL),
-- 
2.35.1


