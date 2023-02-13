Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A3B693CA0
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:54:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pROx8-0002FW-2W; Sun, 12 Feb 2023 21:52:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROx5-0002EC-L8
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:52:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROx4-0006vL-4r
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:52:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676256741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qidzccTnvZWTjmehoyXsqH06VDAcPWrPLs1KbiNU6rE=;
 b=HQ86609pgQXlg1c0uI3gnIpIsv7DeX7O/ounWS01dhJc3hCgd/SNujmmYixmCrJIgbpQmP
 wz//VxMQ1awGMroIja2iWvsfAGCZ/WJVilwo/PG7dBR8qc2q3Kn8yadaqFFZwwjgWbfZd9
 vpMBGsBsbQ1YpJg0yB/5k8VJS0D58qM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-73-cA0HfnMANy6BBEg0zU9Qyg-1; Sun, 12 Feb 2023 21:52:20 -0500
X-MC-Unique: cA0HfnMANy6BBEg0zU9Qyg-1
Received: by mail-wm1-f70.google.com with SMTP id
 n7-20020a05600c3b8700b003dc55dcb298so6055396wms.8
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:52:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qidzccTnvZWTjmehoyXsqH06VDAcPWrPLs1KbiNU6rE=;
 b=wwRr1Fli6XEqaW7Gjow8lMQDENeP3EqrpzPnQoWM7MiLWPWC5mQAorrUYTnlpc+UuZ
 qMCedrTHFdllvY9JYhwNCU3VblkbBJ5g38Ic014FDxQMAWKvb74jiANWQri9atAVprmn
 h1uv54njhwEaNDMPZLJVHVoBXptQUBktA19ELaECqQ424NlhCyvl9kl55VvkgijGPQyI
 4AxEhYCYR8CiyfcRkIQN/QzCCTz6mcmT/WX2LOK0eWjxpX7mTiG7G8vNHgwAHT8ZGX+0
 5DUe9hwMNTVYzg8Ga0o0dgRW+fu0WxOKs2vB6jJEX+dtn7aMIGEfR/D6GYRaIx1xrfxQ
 tBpw==
X-Gm-Message-State: AO0yUKXiB+uiXYpnj2ksr4FqaWRUXnx6o0YKiDWWm6t0oQUwbOX1SwDs
 K4OXyJ/jR2ppClHgCbTcsFxTDG0xwGgiQEcZyChYA+ZHDGSm/IEXSVT87+PaMELcye/FhXXNr2N
 /OSulOUrGX1Di5Opdf7RCIdqTmIj7ql7x4pOc/mCQgt9MwPK0QEuOO2OxB4oC/D2w7tHsKFoU
X-Received: by 2002:a05:600c:13c8:b0:3da:28a9:a900 with SMTP id
 e8-20020a05600c13c800b003da28a9a900mr17220619wmg.41.1676256738101; 
 Sun, 12 Feb 2023 18:52:18 -0800 (PST)
X-Google-Smtp-Source: AK7set+EYzTgrB5KOoarWsUBUvZAw0+p2uCOQEO7fo/ZJqqeP3TdCyA/erTm8FfaPSMzXf6sgOxcYA==
X-Received: by 2002:a05:600c:13c8:b0:3da:28a9:a900 with SMTP id
 e8-20020a05600c13c800b003da28a9a900mr17220600wmg.41.1676256737845; 
 Sun, 12 Feb 2023 18:52:17 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 m24-20020a05600c3b1800b003dc41a9836esm13797712wms.43.2023.02.12.18.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:52:17 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PULL 15/22] migration: Cleanup postcopy_preempt_setup()
Date: Mon, 13 Feb 2023 03:51:43 +0100
Message-Id: <20230213025150.71537-16-quintela@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213025150.71537-1-quintela@redhat.com>
References: <20230213025150.71537-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Since we just dropped the only case where postcopy_preempt_setup() can
return an error, it doesn't need a retval anymore because it never fails.
Move the preempt check to the caller, preparing it to be used elsewhere to
do nothing but as simple as kicking the async connection.

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/postcopy-ram.h | 2 +-
 migration/migration.c    | 8 ++------
 migration/postcopy-ram.c | 8 +-------
 3 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
index 25881c4127..d5604cbcf1 100644
--- a/migration/postcopy-ram.h
+++ b/migration/postcopy-ram.h
@@ -191,7 +191,7 @@ enum PostcopyChannels {
 };
 
 void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
-int postcopy_preempt_setup(MigrationState *s, Error **errp);
+void postcopy_preempt_setup(MigrationState *s);
 int postcopy_preempt_wait_channel(MigrationState *s);
 
 #endif
diff --git a/migration/migration.c b/migration/migration.c
index f242d657e8..fb0ecf5649 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -4347,12 +4347,8 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
     }
 
     /* This needs to be done before resuming a postcopy */
-    if (postcopy_preempt_setup(s, &local_err)) {
-        error_report_err(local_err);
-        migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
-                          MIGRATION_STATUS_FAILED);
-        migrate_fd_cleanup(s);
-        return;
+    if (migrate_postcopy_preempt()) {
+        postcopy_preempt_setup(s);
     }
 
     if (resume) {
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 9a9d0ecf49..de6d4a3fd4 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1629,16 +1629,10 @@ int postcopy_preempt_wait_channel(MigrationState *s)
     return s->postcopy_qemufile_src ? 0 : -1;
 }
 
-int postcopy_preempt_setup(MigrationState *s, Error **errp)
+void postcopy_preempt_setup(MigrationState *s)
 {
-    if (!migrate_postcopy_preempt()) {
-        return 0;
-    }
-
     /* Kick an async task to connect */
     socket_send_channel_create(postcopy_preempt_send_channel_new, s);
-
-    return 0;
 }
 
 static void postcopy_pause_ram_fast_load(MigrationIncomingState *mis)
-- 
2.39.1


