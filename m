Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C4A3F61BB
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 17:33:41 +0200 (CEST)
Received: from localhost ([::1]:41604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIYQl-0003Qi-TY
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 11:33:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIYKp-0001ze-8T
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:27:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIYKn-0006hF-KK
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:27:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629818848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FYappjBljsHSEUsiRztHl2pb1k57oy0/NHXVscrkE4o=;
 b=RUYqpT+tohGhWIguYABsepQtfGC7Xlz+lJX4NKtXsauDr0jfpVPQGzbO8gu4BT0UKX5/er
 h6ARhSneaxht5De42hDW7WrFJS7QE8mbf4gDflaFAk6EKIB0RO+MDp46zIf7kLXodRVZOV
 iYCMGo26+Pzl+gO7mmtOJVNYd9AzHes=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-aVoLCHyONMe8pOYdQakG-A-1; Tue, 24 Aug 2021 11:27:27 -0400
X-MC-Unique: aVoLCHyONMe8pOYdQakG-A-1
Received: by mail-qv1-f71.google.com with SMTP id
 u6-20020ad448660000b02903500bf28866so15069961qvy.23
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 08:27:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FYappjBljsHSEUsiRztHl2pb1k57oy0/NHXVscrkE4o=;
 b=DwvMQBVqYmKdmTX8NaiwdvTWLuOgFQLNClQQFv7k5/1GGxt56yK0xxt2oT/XkzEIXp
 OwiqOfIa71MnVlQlWJqairT8Vhcfyn8SuZnYf44lF9FnQMk3fxBkO8D4QM4iPpKPRYPe
 lnKPXwz85xIYpEngdOlZ97ZIgCv2xw7lSeAhlxlTSIsRXnCwZPZhAXa4DQ6nxru1Gw1p
 f6CG4N4wszBmfVl5D6cykbtnhc1lx5eeZKvNXQ2TkznEmXThenHd0BWbJIOiLJdKaL1v
 klAAAADxfLlasLx4RSpyDChjtUJbZi3h0UFOxvyiPoaDQEne/yJiOCGssQIPLGoUKAJV
 yS+w==
X-Gm-Message-State: AOAM5333Zezs26DDvovg/3c/6UYEFfapaU6fbkOHzjL3CBtIoAib+7pg
 CBpN3XfQhCeYCXx6I3RwWFGBtDH6oiakY6uObApkUTSfa9uaUbu7Qetk0wOqJb0kTp/i+UQP8iO
 Phg+jhO2JDswdmr1IHc9QaKYjbOUxl2tewb66SNpM98Ew3y1wKZ+tx+tJS0oeooQC
X-Received: by 2002:a05:6214:94c:: with SMTP id
 dn12mr12723463qvb.60.1629818846377; 
 Tue, 24 Aug 2021 08:27:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5IFW/rBMzanayCbhkyCOGM3zNQUAfkwgWfWSUeF51V3JounmG+82dlVJS6ue/bp2stEbV6w==
X-Received: by 2002:a05:6214:94c:: with SMTP id
 dn12mr12723433qvb.60.1629818846193; 
 Tue, 24 Aug 2021 08:27:26 -0700 (PDT)
Received: from t490s.phub.net.cable.rogers.com ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id j127sm10939754qkf.20.2021.08.24.08.27.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 08:27:25 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] migration: Add migrate_add_blocker_internal()
Date: Tue, 24 Aug 2021 11:27:20 -0400
Message-Id: <20210824152721.79747-2-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824152721.79747-1-peterx@redhat.com>
References: <20210824152721.79747-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An internal version that removes -only-migratable implications.  It can be used
for temporary migration blockers like dump-guest-memory.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/migration/blocker.h | 16 ++++++++++++++++
 migration/migration.c       | 21 +++++++++++++--------
 2 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/include/migration/blocker.h b/include/migration/blocker.h
index acd27018e9..9cebe2ba06 100644
--- a/include/migration/blocker.h
+++ b/include/migration/blocker.h
@@ -25,6 +25,22 @@
  */
 int migrate_add_blocker(Error *reason, Error **errp);
 
+/**
+ * @migrate_add_blocker_internal - prevent migration from proceeding without
+ *                                 only-migrate implications
+ *
+ * @reason - an error to be returned whenever migration is attempted
+ *
+ * @errp - [out] The reason (if any) we cannot block migration right now.
+ *
+ * @returns - 0 on success, -EBUSY on failure, with errp set.
+ *
+ * Some of the migration blockers can be temporary (e.g., for a few seconds),
+ * so it shouldn't need to conflict with "-only-migratable".  For those cases,
+ * we can call this function rather than @migrate_add_blocker().
+ */
+int migrate_add_blocker_internal(Error *reason, Error **errp);
+
 /**
  * @migrate_del_blocker - remove a blocking error from migration
  *
diff --git a/migration/migration.c b/migration/migration.c
index 041b8451a6..41429680c2 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2053,15 +2053,8 @@ void migrate_init(MigrationState *s)
     s->threshold_size = 0;
 }
 
-int migrate_add_blocker(Error *reason, Error **errp)
+int migrate_add_blocker_internal(Error *reason, Error **errp)
 {
-    if (only_migratable) {
-        error_propagate_prepend(errp, error_copy(reason),
-                                "disallowing migration blocker "
-                                "(--only-migratable) for: ");
-        return -EACCES;
-    }
-
     if (migration_is_idle()) {
         migration_blockers = g_slist_prepend(migration_blockers, reason);
         return 0;
@@ -2073,6 +2066,18 @@ int migrate_add_blocker(Error *reason, Error **errp)
     return -EBUSY;
 }
 
+int migrate_add_blocker(Error *reason, Error **errp)
+{
+    if (only_migratable) {
+        error_propagate_prepend(errp, error_copy(reason),
+                                "disallowing migration blocker "
+                                "(--only-migratable) for: ");
+        return -EACCES;
+    }
+
+    return migrate_add_blocker_internal(reason, errp);
+}
+
 void migrate_del_blocker(Error *reason)
 {
     migration_blockers = g_slist_remove(migration_blockers, reason);
-- 
2.31.1


