Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2506E0120
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 23:46:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmiHN-0008ND-HO; Wed, 12 Apr 2023 17:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmiHL-0008MV-7K
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 17:45:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmiHH-0006aT-Nl
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 17:45:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681335918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4xXl3ct488HSIr4PQ2q8nI4ptvAg831yOJ2Mp5H618A=;
 b=ezWnsNqBgRuMBMPQH0k8zWCSCuzUPux6LzN40FxYr2U/2wh/YNDWnEo20AQ4K3xMe3rtVv
 s52krq9gC9R5GpHqxtXo/penhUp0LGfqifhv69G6hBZrsjRPK0KV7VZ+Kg23TNS6TSSETc
 gumsy+FFSeht6EtpRvW/p+Q7lzG/I7Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-5FnM4DV2PISLlnZtkAiTLA-1; Wed, 12 Apr 2023 17:45:15 -0400
X-MC-Unique: 5FnM4DV2PISLlnZtkAiTLA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37EE73C10EC1;
 Wed, 12 Apr 2023 21:45:15 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5F921121320;
 Wed, 12 Apr 2023 21:45:13 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Juan Quintela <quintela@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PULL 3/5] migration: Recover behavior of preempt channel creation
 for pre-7.2
Date: Wed, 12 Apr 2023 23:45:05 +0200
Message-Id: <20230412214507.19816-4-quintela@redhat.com>
In-Reply-To: <20230412214507.19816-1-quintela@redhat.com>
References: <20230412214507.19816-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

From: Peter Xu <peterx@redhat.com>

In 8.0 devel window we reworked preempt channel creation, so that there'll
be no race condition when the migration channel and preempt channel got
established in the wrong order in commit 5655aab079.

However no one noticed that the change will also be not compatible with
older qemus, majorly 7.1/7.2 versions where preempt mode started to be
supported.

Leverage the same pre-7.2 flag introduced in the previous patch to recover
the behavior hopefully before 8.0 releases, so we don't break migration
when we migrate from 8.0 to older qemu binaries.

Fixes: 5655aab079 ("migration: Postpone postcopy preempt channel to be after main")
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.h    |  7 +++++++
 migration/migration.c    |  9 +++++++++
 migration/postcopy-ram.c | 10 ++++++++--
 3 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index 67baba2184..310ae8901b 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -384,12 +384,19 @@ struct MigrationState {
      * - postcopy preempt src QEMU instance will generate an EOS message at
      *   the end of migration to shut the preempt channel on dest side.
      *
+     * - postcopy preempt channel will be created at the setup phase on src
+         QEMU.
+     *
      * When clear:
      *
      * - postcopy preempt src QEMU instance will _not_ generate an EOS
      *   message at the end of migration, the dest qemu will shutdown the
      *   channel itself.
      *
+     * - postcopy preempt channel will be created at the switching phase
+     *   from precopy -> postcopy (to avoid race condtion of misordered
+     *   creation of channels).
+     *
      * NOTE: See message-id <ZBoShWArKDPpX/D7@work-vm> on qemu-devel
      * mailing list for more information on the possible race.  Everyone
      * should probably just keep this value untouched after set by the
diff --git a/migration/migration.c b/migration/migration.c
index 37fc4fb3e2..bda4789193 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -4388,6 +4388,15 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
         }
     }
 
+    /*
+     * This needs to be done before resuming a postcopy.  Note: for newer
+     * QEMUs we will delay the channel creation until postcopy_start(), to
+     * avoid disorder of channel creations.
+     */
+    if (migrate_postcopy_preempt() && s->preempt_pre_7_2) {
+        postcopy_preempt_setup(s);
+    }
+
     if (resume) {
         /* Wakeup the main migration thread to do the recovery */
         migrate_set_state(&s->state, MIGRATION_STATUS_POSTCOPY_PAUSED,
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 263bab75ec..93f39f8e06 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1630,8 +1630,14 @@ int postcopy_preempt_establish_channel(MigrationState *s)
         return 0;
     }
 
-    /* Kick off async task to establish preempt channel */
-    postcopy_preempt_setup(s);
+    /*
+     * Kick off async task to establish preempt channel.  Only do so with
+     * 8.0+ machines, because 7.1/7.2 require the channel to be created in
+     * setup phase of migration (even if racy in an unreliable network).
+     */
+    if (!s->preempt_pre_7_2) {
+        postcopy_preempt_setup(s);
+    }
 
     /*
      * We need the postcopy preempt channel to be established before
-- 
2.39.2


