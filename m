Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A61693C5F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:32:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRObM-0001gL-6U; Sun, 12 Feb 2023 21:29:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRObK-0001g1-Ah
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:29:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRObI-00039C-N3
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:29:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676255392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1yhUeN6PMDjGLlmfRv43ztKFKB+CFUSApjprBMF/DVs=;
 b=cFRWuHbvypJNcwea3nEaFnSgPt6xDLxntEKtqETqyj4gmGrjmhYymaEzFMJd3H70tnWlsC
 qRAeHUKDbYVUNBbdmYQCdfy/4f7ZJOn+hoNVL/W6Ljonn8xdjsfmK94a8hnDfc+9eM11k9
 gCmmNrKia6BFPL3rsaPioIEL83+TZhc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-642-A61-4is6NqWlbLrrdja-vQ-1; Sun, 12 Feb 2023 21:29:51 -0500
X-MC-Unique: A61-4is6NqWlbLrrdja-vQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 e38-20020a05600c4ba600b003dc434dabbdso8365882wmp.6
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:29:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1yhUeN6PMDjGLlmfRv43ztKFKB+CFUSApjprBMF/DVs=;
 b=L25KbWWPynpJLZC99fnfbhp094oirij4oh7wQw5F39d3VoZt2O9S6e/AXO5qsYvrY1
 0k6ud9tzPORI1iPloEYEhuUsgjM4RDyiJDvuT4o2oNLbKXMJy83+hzCLIdTgQJYIDPHb
 T6qza+jaOsMXUr/B96SB5BEmEepg55XIpYq2WdaS3I7lnu+Kmxe3RiL7p4QK2/qSGr4G
 DYrVDNgAy2frGcWnRULx71achwhgd8GvJTM8HKjTpCneMnhJh6rCh36IcmDZu7LpsXFB
 CqDyGM/LcscgnybyVZmnIBxN17MpQh+wJb0hmDYAeKULyaYgWSs17JHLM/mwMHTnZZlw
 b1FA==
X-Gm-Message-State: AO0yUKXQEMSxBWC2jM75Iw8XhEGF8cX/KoyiZqh2oq70OQCkH7eb6Ikk
 QWIGrL3hY1D5qXP8UQsCuiMlO6yGumTphHQAFeVScRc92y0WHygZXWjI+V+G5WERHC3Q6e8XjZj
 d6zhtNUFJQwxvQCS3WvaLdx77ej0eQXGvky8NS3mgFatZI5sfPaLQ1300IcFAAKgI51vvK3N+
X-Received: by 2002:a05:600c:1694:b0:3de:27c3:ef13 with SMTP id
 k20-20020a05600c169400b003de27c3ef13mr17673799wmn.9.1676255389416; 
 Sun, 12 Feb 2023 18:29:49 -0800 (PST)
X-Google-Smtp-Source: AK7set8MM5ZCkie7NV7W++wxJDBegmWHyipkHejCobgGbh9/xnuobYvLzGnVHhdOuw7GmHpn5yPvNA==
X-Received: by 2002:a05:600c:1694:b0:3de:27c3:ef13 with SMTP id
 k20-20020a05600c169400b003de27c3ef13mr17673782wmn.9.1676255389180; 
 Sun, 12 Feb 2023 18:29:49 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 j40-20020a05600c1c2800b003dc4480df80sm17346274wms.34.2023.02.12.18.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:29:48 -0800 (PST)
From: Xxx Xx <quintela@redhat.com>
X-Google-Original-From: Xxx Xx <xxx.xx@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PULL 21/22] migration/multifd: Move load_cleanup inside
 incoming_state_destroy
Date: Mon, 13 Feb 2023 03:29:10 +0100
Message-Id: <20230213022911.68490-22-xxx.xx@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213022911.68490-1-xxx.xx@gmail.com>
References: <20230213022911.68490-1-xxx.xx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

From: Leonardo Bras <leobras@redhat.com>

Currently running migration_incoming_state_destroy() without first running
multifd_load_cleanup() will cause a yank error:

qemu-system-x86_64: ../util/yank.c:107: yank_unregister_instance:
Assertion `QLIST_EMPTY(&entry->yankfns)' failed.
(core dumped)

The above error happens in the target host, when multifd is being used
for precopy, and then postcopy is triggered and the migration finishes.
This will crash the VM in the target host.

To avoid that, move multifd_load_cleanup() inside
migration_incoming_state_destroy(), so that the load cleanup becomes part
of the incoming state destroying process.

Running multifd_load_cleanup() twice can become an issue, though, but the
only scenario it could be ran twice is on process_incoming_migration_bh().
So removing this extra call is necessary.

On the other hand, this multifd_load_cleanup() call happens way before the
migration_incoming_state_destroy() and having this happening before
dirty_bitmap_mig_before_vm_start() and vm_start() may be a need.

So introduce a new function multifd_load_shutdown() that will mainly stop
all multifd threads and close their QIOChannels. Then use this function
instead of multifd_load_cleanup() to make sure nothing else is received
before dirty_bitmap_mig_before_vm_start().

Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.h   | 1 +
 migration/migration.c | 4 +++-
 migration/multifd.c   | 7 +++++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 9a7e1a8826..7cfc265148 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -17,6 +17,7 @@ int multifd_save_setup(Error **errp);
 void multifd_save_cleanup(void);
 int multifd_load_setup(Error **errp);
 void multifd_load_cleanup(void);
+void multifd_load_shutdown(void);
 bool multifd_recv_all_channels_created(void);
 void multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
 void multifd_recv_sync_main(void);
diff --git a/migration/migration.c b/migration/migration.c
index 5bf332fdd2..90fca70cb7 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -315,6 +315,8 @@ void migration_incoming_state_destroy(void)
 {
     struct MigrationIncomingState *mis = migration_incoming_get_current();
 
+    multifd_load_cleanup();
+
     if (mis->to_src_file) {
         /* Tell source that we are done */
         migrate_send_rp_shut(mis, qemu_file_get_error(mis->from_src_file) != 0);
@@ -559,7 +561,7 @@ static void process_incoming_migration_bh(void *opaque)
      */
     qemu_announce_self(&mis->announce_timer, migrate_announce_params());
 
-    multifd_load_cleanup();
+    multifd_load_shutdown();
 
     dirty_bitmap_mig_before_vm_start();
 
diff --git a/migration/multifd.c b/migration/multifd.c
index 840d5814e4..5e85c3ea9b 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1013,6 +1013,13 @@ static void multifd_recv_terminate_threads(Error *err)
     }
 }
 
+void multifd_load_shutdown(void)
+{
+    if (migrate_use_multifd()) {
+        multifd_recv_terminate_threads(NULL);
+    }
+}
+
 void multifd_load_cleanup(void)
 {
     int i;
-- 
2.39.1


