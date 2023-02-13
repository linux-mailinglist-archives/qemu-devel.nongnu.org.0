Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61013693C51
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:31:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRObF-0001cN-4U; Sun, 12 Feb 2023 21:29:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRObA-0001aS-3D
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:29:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROb8-00036B-IL
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:29:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676255382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qidzccTnvZWTjmehoyXsqH06VDAcPWrPLs1KbiNU6rE=;
 b=OJ0IxUkyc/kO/ekftPKtu95lYtdtzyBwQkrRhISQlpwtgr9FHbfT+b7Q5Ez8NtSDuWUgeI
 mSKRciyONQ9C9vqtkg0vmDWzm2cA9KQ8OQEPyHqqlr0HGvBdaA3R7dGQe4G2mOwbTIJ94T
 hTtCQQ+hhSYtlzqdiDVHSkM4nHwow6k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-216-0kW1QF5aOtim6ZxM40lIFQ-1; Sun, 12 Feb 2023 21:29:40 -0500
X-MC-Unique: 0kW1QF5aOtim6ZxM40lIFQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 o8-20020a05600c510800b003dfdf09ffc2so5423156wms.5
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:29:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qidzccTnvZWTjmehoyXsqH06VDAcPWrPLs1KbiNU6rE=;
 b=dUDmI0o7qZUrWTUIAb8qASNHrgNr0lWa24/3GfiAuQMzRPXtsFd+riaUU1T1MHkDNb
 dx84Z9ss9kRdUMvob/EKbkoz8vIecu9erkF+z+6GvmWmg5iZ2insKg5yhXu6orqjF5uh
 PB3wNgca8ZiyVqHWEvt54Q7rVY2iCGpYcm8GYkXzM8ykVfpcwkSlSXfSaj7guGKKTi6i
 N9v9qHuZVeQpqs10VDkZmzK609XOrxUb5xHt8ay3vnr+fJj4EBgK5pOqiffHZ+rKS2E+
 UEtevoQOnrcv9L5vK7fLOCZ2cT2mwiLvh5ghs8nojQyhOz/AehGyKaRwGnK/SFjwXFWz
 ALNg==
X-Gm-Message-State: AO0yUKUK83+POpzzUCjcYzdKaTTBPyuzubQK+neJ6lWonOPmj2Gxg7rl
 Kq30AhK5yo0mfmkiJfvVPML3i6USi0WdlsSjxRkxGpteL9YeJqOV1PY5lUXqACWrsEFnNiMjgVi
 NF0FpIUREihvdRsPMLU8OB/xK+ysuPxHcVHNTEI0qvyhOs/WJkHDVMBHeyFRzUqtNXRWpWpHK
X-Received: by 2002:a5d:6209:0:b0:2c3:ed14:8323 with SMTP id
 y9-20020a5d6209000000b002c3ed148323mr20756786wru.38.1676255378855; 
 Sun, 12 Feb 2023 18:29:38 -0800 (PST)
X-Google-Smtp-Source: AK7set9CJkfVgcqqvmA2PK8UJ3ZRBCf5Ar3fjAkw0fGNmk0DoEJTWdD9PBXp0gaOgpZ5dijRQ5W3gA==
X-Received: by 2002:a5d:6209:0:b0:2c3:ed14:8323 with SMTP id
 y9-20020a5d6209000000b002c3ed148323mr20756766wru.38.1676255378547; 
 Sun, 12 Feb 2023 18:29:38 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 v14-20020adfe28e000000b0027cb20605e3sm9290353wri.105.2023.02.12.18.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:29:37 -0800 (PST)
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
 Peter Xu <peterx@redhat.com>
Subject: [PULL 15/22] migration: Cleanup postcopy_preempt_setup()
Date: Mon, 13 Feb 2023 03:29:04 +0100
Message-Id: <20230213022911.68490-16-xxx.xx@gmail.com>
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


