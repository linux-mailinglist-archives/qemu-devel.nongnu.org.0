Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1F1538F72
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 13:08:44 +0200 (CEST)
Received: from localhost ([::1]:46582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvzjv-0003bq-48
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 07:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nvzLq-0003YI-Dj
 for qemu-devel@nongnu.org; Tue, 31 May 2022 06:43:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nvzLo-0004fE-LM
 for qemu-devel@nongnu.org; Tue, 31 May 2022 06:43:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653993828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oxTASCIcBA5iquuLNS4rUrcwGQ05et4haViEzl1TLb8=;
 b=iYajH1Ds4QLoj9vj9NwTCQzyvW5F6g6Tu38pX77/MBQhIVFgZxQ9ahKCZ6Dd4n397fUo6d
 dscFkvQSLofUCnaKAF9bn5g4NnWH8gVJeIJ34/gmYVJJB8aAwVBD9djElOsdNn8onpNrrF
 j6WTPGOyOozWDKovdlVbujXf4sZUByo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464-VNIRHoQsN7yQ08XVcn900Q-1; Tue, 31 May 2022 06:43:42 -0400
X-MC-Unique: VNIRHoQsN7yQ08XVcn900Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 537B680A0B5;
 Tue, 31 May 2022 10:43:42 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70CA01131A;
 Tue, 31 May 2022 10:43:40 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v7 09/13] multifd: Add property to enable/disable zero_page
Date: Tue, 31 May 2022 12:43:14 +0200
Message-Id: <20220531104318.7494-10-quintela@redhat.com>
In-Reply-To: <20220531104318.7494-1-quintela@redhat.com>
References: <20220531104318.7494-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.h |  3 +++
 hw/core/machine.c     |  1 +
 migration/migration.c | 11 +++++++++++
 3 files changed, 15 insertions(+)

diff --git a/migration/migration.h b/migration/migration.h
index 485d58b95f..1017c1bf4a 100644
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
 
 #ifdef CONFIG_LINUX
 bool migrate_use_zero_copy_send(void);
diff --git a/hw/core/machine.c b/hw/core/machine.c
index bb0dc8f6a9..a5b5f87329 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -43,6 +43,7 @@
 
 GlobalProperty hw_compat_7_0[] = {
     { "arm-gicv3-common", "force-8-bit-prio", "on" },
+    { "migration", "multifd-zero-pages", "false" },
 };
 const size_t hw_compat_7_0_len = G_N_ELEMENTS(hw_compat_7_0);
 
diff --git a/migration/migration.c b/migration/migration.c
index 31739b2af9..224abe2555 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2540,6 +2540,15 @@ bool migrate_use_multifd(void)
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
@@ -4207,6 +4216,8 @@ static Property migration_properties[] = {
                       clear_bitmap_shift, CLEAR_BITMAP_SHIFT_DEFAULT),
 
     /* Migration parameters */
+    DEFINE_PROP_BOOL("multifd-zero-pages", MigrationState,
+                      multifd_zero_pages, true),
     DEFINE_PROP_UINT8("x-compress-level", MigrationState,
                       parameters.compress_level,
                       DEFAULT_MIGRATE_COMPRESS_LEVEL),
-- 
2.35.3


