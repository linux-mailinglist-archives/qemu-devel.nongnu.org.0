Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2C844234C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 23:21:06 +0100 (CET)
Received: from localhost ([::1]:36322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhffu-0004Me-2N
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 18:21:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhfUi-00071C-C7
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:09:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhfUg-0000bk-QA
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:09:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635804569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xgA8Pg4pioYTYcQYYaUz2yN31K5Rcv8HQjmwYm8rweY=;
 b=bgq7jX+NQTtYxYtOCvl4I5VmZNJHanSTgv7hSAeVoFipCxLUeqENPMPgw3LQ+2KqD4uZmX
 HhVdeSjWSRymLEU8APzg2nKzr5TujU2NLFRoyd18+ola+GPw8dntfpRo/DhkBjG8a3EwDr
 zGtFgB5BPbuwtTIM/92HyWWMHQSfc2Q=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-4UH-C1ssNYqLjB17s1JB9A-1; Mon, 01 Nov 2021 18:09:28 -0400
X-MC-Unique: 4UH-C1ssNYqLjB17s1JB9A-1
Received: by mail-wr1-f71.google.com with SMTP id
 v18-20020a5d5912000000b001815910d2c0so2363513wrd.1
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 15:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xgA8Pg4pioYTYcQYYaUz2yN31K5Rcv8HQjmwYm8rweY=;
 b=ugKHBqWyB0+phhgHtK6vZ1XQpYansh05Kda0tU1hvqFbY4AUH8lP68VQ+yCiEDDlbe
 bYCb2jH6XWaSAnS5cPDHe2cJvXP94ThpwM2TNoQqhpJyDWZeRTp0KeEVBGTzPHJnJhqM
 xKB0gsrLlBhjWwmTuq/YSfk8q1KCfWSqR2Mi9yjmZUoIyseMOndAgnjYX1D3WE4oOFiS
 eeI2XoT0IlyJxhzvM0V72fZrK87D6WXVloOxRWBiyWS/JelCsUaMB/mn/W76PV9o5/BS
 MQrmwQ1GtKzO14RF7cjQLZC7KHYeASobT9Iq3ZY1AvB7g5cAe4aiuUET+Jy+D0iRTFlK
 GPkQ==
X-Gm-Message-State: AOAM5322avIeRmsepwDITRCTPNtexYSf3hq5AxwbxFzz9rcCwY8OSm6U
 EiBqZxfDx7vMv+o167MQZXRxtf7Bg+zK0zFxSVz7+I2r0RO3Ox3LWQlSzs81ykHYuR2dN+GtfNq
 +eM2xdyFu+0EDDw96NoqsQwDyj86D3WA1j3ORB7atI8NC+5xLIeS/WcKD2tqqjzBQ/Ds=
X-Received: by 2002:adf:c70b:: with SMTP id k11mr40015428wrg.154.1635804566515; 
 Mon, 01 Nov 2021 15:09:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUrxZpRrNYU7lx4z1CYr7OY2cCtGorBz1ob+LkkuKyWgUku8HgKdZfOfBOrsPY7hoBqfW6RQ==
X-Received: by 2002:adf:c70b:: with SMTP id k11mr40015380wrg.154.1635804566314; 
 Mon, 01 Nov 2021 15:09:26 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id u16sm620998wmc.21.2021.11.01.15.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:25 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/20] migration: Add migrate_add_blocker_internal()
Date: Mon,  1 Nov 2021 23:09:01 +0100
Message-Id: <20211101220912.10039-10-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211101220912.10039-1-quintela@redhat.com>
References: <20211101220912.10039-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paul Durrant <paul@xen.org>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

An internal version that removes -only-migratable implications.  It can be used
for temporary migration blockers like dump-guest-memory.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
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
index e81e473f5a..e1c0082530 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2049,15 +2049,8 @@ void migrate_init(MigrationState *s)
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
     /* Snapshots are similar to migrations, so check RUN_STATE_SAVE_VM too. */
     if (runstate_check(RUN_STATE_SAVE_VM) || !migration_is_idle()) {
         error_propagate_prepend(errp, error_copy(reason),
@@ -2070,6 +2063,18 @@ int migrate_add_blocker(Error *reason, Error **errp)
     return 0;
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
2.33.1


