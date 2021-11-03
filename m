Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5308A443E8C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 09:48:18 +0100 (CET)
Received: from localhost ([::1]:54076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miBwP-0002GP-Eh
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 04:48:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miBv7-0000VH-Vc
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:46:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miBuN-0003JU-SV
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:46:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635929170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RTVcSwYRk8dbp7MwPIS3nc/ClGGDvA9iyBntZZqREjc=;
 b=XI1t02VyMuvV2tZj2dToA1X4Y4DEm97dYeVxoKzO/DWnl0Gn49qeTc7dsTu7dtTl++ZZwi
 gFur6zCyfPKb07cq4I/TAjyQJDhA7HxO8QvWv5Poi3ZO2pqIWeToYVwhmirbiB47vVM+Ql
 8VASlBzh7hQMtno5uQ6TFDVkyfCuCJQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-64KuU-_2P-WlZTAcYa63yQ-1; Wed, 03 Nov 2021 04:46:09 -0400
X-MC-Unique: 64KuU-_2P-WlZTAcYa63yQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 o22-20020a1c7516000000b0030d6f9c7f5fso747274wmc.1
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 01:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RTVcSwYRk8dbp7MwPIS3nc/ClGGDvA9iyBntZZqREjc=;
 b=HNNZFqZcR256XWEr5Aeggs30Y9ZpBk8LdVjNlrXCmPGLRr/xlbmXs+zxTk1N6bsY/1
 kYmCTwlLnR0gdl9onuogi4XnrW/CCsH+ZCdhq8yKWtDZOukyN17yWPNoqFH4viupiF5g
 2luO4srss8HnG0poaWH/IiHC+QKc0oPNjk76h8i3WeYSS6w/DI/S9Tj/suPNz04MZZUD
 /QvABkEXmrkDOLOgWMC8PWSFNlrzqFNOArBIC0bpEhTjuaG5O8W33N4G53kwUjSioBer
 rLm78pUIcq1LePNOLJk+DsNa+ICF0B71hYKcwbFF6wyvfkzce5VOXR/hZm2WnTk3T0Nk
 vuvg==
X-Gm-Message-State: AOAM530L9KUQOub5NN1QiHasK9gIxB9y/F3Xi8ea+YtOMQ8fx9gI2X1u
 V2eFBgUfg8E7NFRlyUO0Yuggw6vVLgpQiGpgls311gSSCMsijRn4Vdy6VKv6ORWV80D7U4jxO+e
 Toa+Wt7G0fMiaHKY3xCFRvF5tQr4BB5bzOcBHNh3XqzWVOrM4/Q68Jd1SECxBhaare9I=
X-Received: by 2002:adf:e50b:: with SMTP id j11mr47426884wrm.430.1635929168501; 
 Wed, 03 Nov 2021 01:46:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfMB1V3xTdrYIlqA6I7TVNehaZiqEwwZtzb+4m/Ds2GB9YZKM3Hu9VthodNdUZYPIcNXY8rg==
X-Received: by 2002:adf:e50b:: with SMTP id j11mr47426845wrm.430.1635929168195; 
 Wed, 03 Nov 2021 01:46:08 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id o25sm1292323wms.17.2021.11.03.01.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 01:46:07 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/11] migration: provide an error message to migration_cancel()
Date: Wed,  3 Nov 2021 09:45:55 +0100
Message-Id: <20211103084605.20027-2-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103084605.20027-1-quintela@redhat.com>
References: <20211103084605.20027-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URG_BIZ=0.573 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zhang Chen <chen.zhang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

This avoids to call migrate_get_current() in the caller function
whereas migration_cancel() already needs the pointer to the current
migration state.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.h | 2 +-
 migration/migration.c | 9 ++++++---
 migration/ram.c       | 3 +--
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index 7a5aa8c2fd..8130b703eb 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -388,7 +388,7 @@ int foreach_not_ignored_block(RAMBlockIterFunc func, void *opaque);
 void migration_make_urgent_request(void);
 void migration_consume_urgent_request(void);
 bool migration_rate_limit(void);
-void migration_cancel(void);
+void migration_cancel(const Error *error);
 
 void populate_vfio_info(MigrationInfo *info);
 
diff --git a/migration/migration.c b/migration/migration.c
index 53b9a8af96..ec3d87f0a9 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -215,8 +215,11 @@ void migration_object_init(void)
     dirty_bitmap_mig_init();
 }
 
-void migration_cancel(void)
+void migration_cancel(const Error *error)
 {
+    if (error) {
+        migrate_set_error(current_migration, error);
+    }
     migrate_fd_cancel(current_migration);
 }
 
@@ -226,7 +229,7 @@ void migration_shutdown(void)
      * Cancel the current migration - that will (eventually)
      * stop the migration using this structure
      */
-    migration_cancel();
+    migration_cancel(NULL);
     object_unref(OBJECT(current_migration));
 
     /*
@@ -2334,7 +2337,7 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
 
 void qmp_migrate_cancel(Error **errp)
 {
-    migration_cancel();
+    migration_cancel(NULL);
 }
 
 void qmp_migrate_continue(MigrationStatus state, Error **errp)
diff --git a/migration/ram.c b/migration/ram.c
index 680a5158aa..f5d39db4e4 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4323,9 +4323,8 @@ static void ram_mig_ram_block_resized(RAMBlockNotifier *n, void *host,
          * Abort and indicate a proper reason.
          */
         error_setg(&err, "RAM block '%s' resized during precopy.", rb->idstr);
-        migrate_set_error(migrate_get_current(), err);
+        migration_cancel(err);
         error_free(err);
-        migration_cancel();
     }
 
     switch (ps) {
-- 
2.33.1


