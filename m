Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7A1583E49
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 14:05:56 +0200 (CEST)
Received: from localhost ([::1]:54150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH2H5-0007Hc-Jr
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 08:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oH2Ba-0001Mi-4v
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 08:00:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oH2BT-0001ig-Lj
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 08:00:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659009606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EDNsgNORhf5MUfZCXD5Dgxbpg5HCOhY3hdxecTLw2cA=;
 b=ZoJzAsk/ugeuaTepgpiq4ZsFV7U5JsxdEb+YANIi08DxJFVRbAeSgCgsmgiRjONXA9dKCm
 Y6S04Z7kEZyzgsQt1j/+Tp9JWOTOfY/BPpAdMaNjKF7UIGGAZC1s9gSToBEGNw2SVoH2nC
 lpGtDNxDby/BrjluKqGpmMF5AbPWtdw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-132-4RCJgOFFMG6ywvFr9K1pwg-1; Thu, 28 Jul 2022 08:00:03 -0400
X-MC-Unique: 4RCJgOFFMG6ywvFr9K1pwg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 092C7185A7A4;
 Thu, 28 Jul 2022 12:00:03 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5DB5D90A11;
 Thu, 28 Jul 2022 12:00:01 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v2 1/6] multifd: Create property
 multifd-sync-after-each-section
Date: Thu, 28 Jul 2022 13:59:52 +0200
Message-Id: <20220728115957.5554-2-quintela@redhat.com>
In-Reply-To: <20220728115957.5554-1-quintela@redhat.com>
References: <20220728115957.5554-1-quintela@redhat.com>
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

We used to synchronize all channels at the end of each RAM section
sent.  That is not needed, so preparing to only synchronize once every
full round in latests patches.

Notice that we initialize the property as true.  We will change the
default when we introduce the new mechanism.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

---

Rename each-iteration to after-each-section

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.h |  6 ++++++
 hw/core/machine.c     |  1 +
 migration/migration.c | 11 ++++++++++-
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/migration/migration.h b/migration/migration.h
index cdad8aceaa..6abd2a51f5 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -373,6 +373,11 @@ struct MigrationState {
      * This save hostname when out-going migration starts
      */
     char *hostname;
+    /*
+     * Synchronize channels after each section is sent.
+     * We used to do that on the past, but it is suboptimal.
+     */
+    bool multifd_sync_after_each_section;
 };
 
 void migrate_set_state(int *state, int old_state, int new_state);
@@ -415,6 +420,7 @@ int migrate_multifd_channels(void);
 MultiFDCompression migrate_multifd_compression(void);
 int migrate_multifd_zlib_level(void);
 int migrate_multifd_zstd_level(void);
+bool migrate_multifd_sync_after_each_section(void);
 
 #ifdef CONFIG_LINUX
 bool migrate_use_zero_copy_send(void);
diff --git a/hw/core/machine.c b/hw/core/machine.c
index a673302cce..9645a25f8f 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -43,6 +43,7 @@
 GlobalProperty hw_compat_7_0[] = {
     { "arm-gicv3-common", "force-8-bit-prio", "on" },
     { "nvme-ns", "eui64-default", "on"},
+    { "migration", "multifd-sync-after-each-section", "on"},
 };
 const size_t hw_compat_7_0_len = G_N_ELEMENTS(hw_compat_7_0);
 
diff --git a/migration/migration.c b/migration/migration.c
index e03f698a3c..ebca4f2d8a 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2592,6 +2592,13 @@ bool migrate_use_multifd(void)
     return s->enabled_capabilities[MIGRATION_CAPABILITY_MULTIFD];
 }
 
+bool migrate_multifd_sync_after_each_section(void)
+{
+    MigrationState *s = migrate_get_current();
+
+    return s->multifd_sync_after_each_section;
+}
+
 bool migrate_pause_before_switchover(void)
 {
     MigrationState *s;
@@ -4384,7 +4391,9 @@ static Property migration_properties[] = {
     DEFINE_PROP_STRING("tls-creds", MigrationState, parameters.tls_creds),
     DEFINE_PROP_STRING("tls-hostname", MigrationState, parameters.tls_hostname),
     DEFINE_PROP_STRING("tls-authz", MigrationState, parameters.tls_authz),
-
+    /* We will change to false when we introduce the new mechanism */
+    DEFINE_PROP_BOOL("multifd-sync-after-each-section", MigrationState,
+                      multifd_sync_after_each_section, true),
     /* Migration capabilities */
     DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
     DEFINE_PROP_MIG_CAP("x-rdma-pin-all", MIGRATION_CAPABILITY_RDMA_PIN_ALL),
-- 
2.37.1


