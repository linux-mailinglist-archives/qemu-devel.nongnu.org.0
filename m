Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4DC414E3E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 18:40:50 +0200 (CEST)
Received: from localhost ([::1]:36740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT5If-0000di-BA
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 12:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mT4yr-0007jD-AN
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 12:20:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mT4yo-0000dn-Qz
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 12:20:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632327617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1lqAmhYOfqA4rnTNpzJDoCXhwIm0tgwIW69+uoJ6iSY=;
 b=Ak8ktG2RV1E05r/NGrSuT4K44n0DDzT3Ig6GIV95YIUZ8C4xbaw9ySRTcylUGLsvi7NLIc
 ZGRK1AmLtBjjx1WBJPo4STTClwELP2kTVAwTsbQvgiKTI5FktbseGi0MGQdslgZBSIIKum
 WzWUISpvnPEWojJZ82EzBDvVJuQgteY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-bsN8iyseM5ifMTK_IrU2iA-1; Wed, 22 Sep 2021 12:20:16 -0400
X-MC-Unique: bsN8iyseM5ifMTK_IrU2iA-1
Received: by mail-qk1-f197.google.com with SMTP id
 h4-20020a05620a244400b004334ede5036so10823183qkn.13
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 09:20:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1lqAmhYOfqA4rnTNpzJDoCXhwIm0tgwIW69+uoJ6iSY=;
 b=u8DoeufAphusL6fZT7lTQG/yGWkSXiSyeMU1jQqPYMraKs/cTHEvxVlSXjZtxRSD1M
 ueJitdOgaNI+UZGzM0pz1MRaDi4RKUXKFU43uLEje0GP6qguoM4ztPEPnxKl7ABIEk7V
 o3Hq/tWRVaugafXWVkDeaZ14KlIN4MuEGZCyLst1tyIn5SEZMVv/rcO8jMTNrysMy42m
 9JYvPIESEtqBKY3Av8DOdWPHCoIQM1spXy1CnkT2gosv0ICKY1Z1bfMhQwECMYPpiaZf
 MtPfTFqU1xbpkej+HjNwtn3EE0sZy+I2sau9pnUNFI2JfHFx4QIWN5+HcX97x0jIxaMp
 nkPQ==
X-Gm-Message-State: AOAM530ejqRiYcQaW52FSgg6wMG7AM1UUp6NOun6tCyRYbP4+Uqk2eWn
 KjHJ+Ll+YFXonILAXj/7iFG6hOMfNL2ikKXdHy0AXZdIcZTFJqf8VzbaY9e/QJE8kFEgqxlMxGu
 Kkm6XeVFM2+JrA4q53sYRwPftmcOf3RiiM5Qh0te7WHdePO3/Y0T66pKvzYc9ig5q
X-Received: by 2002:a37:747:: with SMTP id 68mr55483qkh.526.1632327615731;
 Wed, 22 Sep 2021 09:20:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYNLuS8P9WbH4x4Frw/tBir01OxR8g38esnwbAf5Zv2z4DI5BzGbnH156SioV/ETAJIBbaaw==
X-Received: by 2002:a37:747:: with SMTP id 68mr55451qkh.526.1632327615453;
 Wed, 22 Sep 2021 09:20:15 -0700 (PDT)
Received: from t490s.redhat.com ([2607:fea8:56a2:9100::d3ec])
 by smtp.gmail.com with ESMTPSA id z186sm2094811qke.59.2021.09.22.09.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 09:20:14 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] migration: Add migrate_add_blocker_internal()
Date: Wed, 22 Sep 2021 12:20:08 -0400
Message-Id: <20210922162009.125622-3-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210922162009.125622-1-peterx@redhat.com>
References: <20210922162009.125622-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
 Markus Armbruster <armbru@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An internal version that removes -only-migratable implications.  It can be used
for temporary migration blockers like dump-guest-memory.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
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
index 6f7177daa0..d6207c53f0 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2039,15 +2039,8 @@ void migrate_init(MigrationState *s)
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
@@ -2060,6 +2053,18 @@ int migrate_add_blocker(Error *reason, Error **errp)
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
2.31.1


