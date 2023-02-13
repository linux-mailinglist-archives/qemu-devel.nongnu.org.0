Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9603B693CA5
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:54:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pROxD-0002Gz-7g; Sun, 12 Feb 2023 21:52:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROxB-0002GP-5N
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:52:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROx9-0006wC-LK
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:52:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676256747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kvm5CeInbbh1Y+6Wfd0BER4Em57orWCfA6AmQdkHIMQ=;
 b=AQajwcI2mSti19T/0wiK0TI/wuMnW6wUUJ3QsfHGlUZzqdeo+cDwX2kLLREyfZWDDlROV9
 o9ZT8WXclvRvMyERT5VsW6Wt9sPGH39a6Qgm4OAS0Iqeh0cGo83Mn+T83YjYvsGp0zDooq
 PPzNZUQUjN6QGcI0s9GLF2fJne6WaEo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-290-PGGPUqwkPs2VY4CxCERQdQ-1; Sun, 12 Feb 2023 21:52:25 -0500
X-MC-Unique: PGGPUqwkPs2VY4CxCERQdQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 r11-20020a5d498b000000b002c5588d962fso117791wrq.10
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:52:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kvm5CeInbbh1Y+6Wfd0BER4Em57orWCfA6AmQdkHIMQ=;
 b=VUIvFOF2oy6j8Xv2Tr2PgsC69eLcz01Rv0DvA0bBdWvOMKUkfraS4fJwj9xSHmmdun
 58BHPcJIkMKx7zqwAOHsPJGwQpH5iuiH1z41mh2ND9/ih+nW6ffINiVSwN1iaVVf1UC0
 aXUiRMlmc9wfJWCyYmOjbRh2N0eJC169Nb2H56UWnuDbVU+Drdd4qZ0x5dwU/dnvmLQZ
 xol3FAFGIS/nUyxzFhYszEjvvNsgfYWxmYSf90gqsiXvbUoSjpYC2IOVgYvGvU3X33zr
 lhFHNbE/dLw6MohmSM6bttPc3dh0eKxFUoEWj591FBRR9keqnS0Jl8PpHuN7kNF0WW16
 QVag==
X-Gm-Message-State: AO0yUKUy15wKTl5cquNf3iMSxnowobXSfkMOUXunsLE1tFEiBlRu7D5j
 /Fl44t3kbe1YQvouLzkzVZZNd2CcnvLyReDOfDL+V27T/ehSkqJ5i5auneMd77+6ZG0tBVXAa7x
 0aU2ixrTYt52dWJ57hggaSLb0bl5oeuQUcaiDAzqMEGb1uNSHecF0Ty5OSPDj+94KlCRhAuho
X-Received: by 2002:a05:6000:183:b0:2c5:52fc:ed1a with SMTP id
 p3-20020a056000018300b002c552fced1amr3039919wrx.55.1676256743347; 
 Sun, 12 Feb 2023 18:52:23 -0800 (PST)
X-Google-Smtp-Source: AK7set8QTsdZxrFsE5C/a7ia2LHZRzmFU1DHRlYMMrWGARW+rKgCWIO2I68jvndjNTBB/iIfhpmEOA==
X-Received: by 2002:a05:6000:183:b0:2c5:52fc:ed1a with SMTP id
 p3-20020a056000018300b002c552fced1amr3039900wrx.55.1676256743028; 
 Sun, 12 Feb 2023 18:52:23 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 q14-20020a5d574e000000b002bfb02153d1sm9399397wrw.45.2023.02.12.18.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:52:22 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Li Xiaohui <xiaohli@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PULL 18/22] migration/multifd: Change multifd_load_cleanup()
 signature and usage
Date: Mon, 13 Feb 2023 03:51:46 +0100
Message-Id: <20230213025150.71537-19-quintela@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213025150.71537-1-quintela@redhat.com>
References: <20230213025150.71537-1-quintela@redhat.com>
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

Since it's introduction in commit f986c3d256 ("migration: Create multifd
migration threads"), multifd_load_cleanup() never returned any value
different than 0, neither set up any error on errp.

Even though, on process_incoming_migration_bh() an if clause uses it's
return value to decide on setting autostart = false, which will never
happen.

In order to simplify the codebase, change multifd_load_cleanup() signature
to 'void multifd_load_cleanup(void)', and for every usage remove error
handling or decision made based on return value != 0.

Fixes: b5eea99ec2 ("migration: Add yank feature")
Reported-by: Li Xiaohui <xiaohli@redhat.com>
Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.h   |  2 +-
 migration/migration.c | 14 ++++----------
 migration/multifd.c   |  6 ++----
 3 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index ff3aa2e2e9..9a7e1a8826 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -16,7 +16,7 @@
 int multifd_save_setup(Error **errp);
 void multifd_save_cleanup(void);
 int multifd_load_setup(Error **errp);
-int multifd_load_cleanup(Error **errp);
+void multifd_load_cleanup(void);
 bool multifd_recv_all_channels_created(void);
 void multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
 void multifd_recv_sync_main(void);
diff --git a/migration/migration.c b/migration/migration.c
index a5c22e327d..5bf332fdd2 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -559,13 +559,7 @@ static void process_incoming_migration_bh(void *opaque)
      */
     qemu_announce_self(&mis->announce_timer, migrate_announce_params());
 
-    if (multifd_load_cleanup(&local_err) != 0) {
-        error_report_err(local_err);
-        autostart = false;
-    }
-    /* If global state section was not received or we are in running
-       state, we need to obey autostart. Any other state is set with
-       runstate_set. */
+    multifd_load_cleanup();
 
     dirty_bitmap_mig_before_vm_start();
 
@@ -665,9 +659,9 @@ fail:
     migrate_set_state(&mis->state, MIGRATION_STATUS_ACTIVE,
                       MIGRATION_STATUS_FAILED);
     qemu_fclose(mis->from_src_file);
-    if (multifd_load_cleanup(&local_err) != 0) {
-        error_report_err(local_err);
-    }
+
+    multifd_load_cleanup();
+
     exit(EXIT_FAILURE);
 }
 
diff --git a/migration/multifd.c b/migration/multifd.c
index 99a59830c8..cac8496edc 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1013,12 +1013,12 @@ static void multifd_recv_terminate_threads(Error *err)
     }
 }
 
-int multifd_load_cleanup(Error **errp)
+void multifd_load_cleanup(void)
 {
     int i;
 
     if (!migrate_use_multifd()) {
-        return 0;
+        return;
     }
     multifd_recv_terminate_threads(NULL);
     for (i = 0; i < migrate_multifd_channels(); i++) {
@@ -1058,8 +1058,6 @@ int multifd_load_cleanup(Error **errp)
     multifd_recv_state->params = NULL;
     g_free(multifd_recv_state);
     multifd_recv_state = NULL;
-
-    return 0;
 }
 
 void multifd_recv_sync_main(void)
-- 
2.39.1


