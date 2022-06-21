Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 042DC55342E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 16:08:34 +0200 (CEST)
Received: from localhost ([::1]:51664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3eYS-0004qT-KU
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 10:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3eVS-0002tT-32
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 10:05:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3eVO-0008WD-Pi
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 10:05:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655820322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8TdNZZXtj2QIM3kSedxEwP9rkjospgZwtmzzqjlIALQ=;
 b=T/gQhfGiynIVVjrTu/uMCrnaxoyjEIDulLmUCQSwhQe8khm2Lvez82hZ6y9nf+7d0FoQWi
 zku/ie3RIlWaqgKhu+wekQCWZ0lyv27qOCl5CyqOXbxfXzmwG1wpRAC4D0wrXOqDno1zHP
 89tqeWjYYHyg8I6NFHycHwC8eFQb/qM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-68PDCP9uNDO3Tm4f0SWk3A-1; Tue, 21 Jun 2022 10:05:19 -0400
X-MC-Unique: 68PDCP9uNDO3Tm4f0SWk3A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9EEB91C18277;
 Tue, 21 Jun 2022 14:05:18 +0000 (UTC)
Received: from secure.laptop (unknown [10.39.192.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F2B02166B29;
 Tue, 21 Jun 2022 14:05:12 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH 1/5] multifd: Create property multifd-sync-each-iteration
Date: Tue, 21 Jun 2022 16:05:03 +0200
Message-Id: <20220621140507.1246-2-quintela@redhat.com>
In-Reply-To: <20220621140507.1246-1-quintela@redhat.com>
References: <20220621140507.1246-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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

We used to synchronize all channels at the end of each RAM section
sent.  That is not needed, so preparing to only synchronize once every
full round in latests patches.

Notice that we initialize the property as true.  We will change the
default when we introduce the new mechanism.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.h |  6 ++++++
 hw/core/machine.c     |  1 +
 migration/migration.c | 10 ++++++++++
 3 files changed, 17 insertions(+)

diff --git a/migration/migration.h b/migration/migration.h
index 485d58b95f..70dae24516 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -332,6 +332,11 @@ struct MigrationState {
      * This save hostname when out-going migration starts
      */
     char *hostname;
+    /*
+     * Synchronize channels after each iteration.
+     * We used to do that on the past, but it is suboptimal.
+     */
+    bool multifd_sync_each_iteration;
 };
 
 void migrate_set_state(int *state, int old_state, int new_state);
@@ -374,6 +379,7 @@ int migrate_multifd_channels(void);
 MultiFDCompression migrate_multifd_compression(void);
 int migrate_multifd_zlib_level(void);
 int migrate_multifd_zstd_level(void);
+bool migrate_multifd_sync_each_iteration(void);
 
 #ifdef CONFIG_LINUX
 bool migrate_use_zero_copy_send(void);
diff --git a/hw/core/machine.c b/hw/core/machine.c
index a673302cce..c8a60917e0 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -43,6 +43,7 @@
 GlobalProperty hw_compat_7_0[] = {
     { "arm-gicv3-common", "force-8-bit-prio", "on" },
     { "nvme-ns", "eui64-default", "on"},
+    { "migration", "multifd-sync-each-iteration", "on"},
 };
 const size_t hw_compat_7_0_len = G_N_ELEMENTS(hw_compat_7_0);
 
diff --git a/migration/migration.c b/migration/migration.c
index 31739b2af9..3f79df0b70 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2540,6 +2540,13 @@ bool migrate_use_multifd(void)
     return s->enabled_capabilities[MIGRATION_CAPABILITY_MULTIFD];
 }
 
+bool migrate_multifd_sync_each_iteration(void)
+{
+    MigrationState *s = migrate_get_current();
+
+    return s->multifd_sync_each_iteration;
+}
+
 bool migrate_pause_before_switchover(void)
 {
     MigrationState *s;
@@ -4274,6 +4281,9 @@ static Property migration_properties[] = {
     DEFINE_PROP_SIZE("announce-step", MigrationState,
                       parameters.announce_step,
                       DEFAULT_MIGRATE_ANNOUNCE_STEP),
+    /* We will change to false when we introduce the new mechanism */
+    DEFINE_PROP_BOOL("multifd-sync-each-iteration", MigrationState,
+                      multifd_sync_each_iteration, true),
 
     /* Migration capabilities */
     DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
-- 
2.34.1


