Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E646E670B6A
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 23:11:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHu9T-00017R-82; Tue, 17 Jan 2023 17:09:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9S-000146-3S
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:09:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu9Q-0007aS-AG
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:09:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673993391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g9eBoW98vzMiN4TfhNXS6GssyAtqf8+iJR0Ats5Su2c=;
 b=Fp/+G3dCOnsOXtO9yP1Kg7yBnDLE57T5dskGYj6hJBsUQ6jvzRIIm7+9T7lV0qFsLNoNxe
 t4tmGrjo/JmbtHioXm6mMixPrF6TSu5ufRKFygr+sSKrFKLDasTznuJRPjUxttejv2aRsA
 NYHldxCdd1UElTZ9++THmlc9EA3JQIs=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-365-xJuVeRDsMuyWucsvr7tCpg-1; Tue, 17 Jan 2023 17:09:49 -0500
X-MC-Unique: xJuVeRDsMuyWucsvr7tCpg-1
Received: by mail-vk1-f199.google.com with SMTP id
 u187-20020a1fabc4000000b003ca3e899f8fso9759564vke.22
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 14:09:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g9eBoW98vzMiN4TfhNXS6GssyAtqf8+iJR0Ats5Su2c=;
 b=aVO53cswUSOXFjvNHKID45m+ASwhKvdBh1Eh4ulHiHSxgcW+yhiSUSyrFS7+B8xoo9
 4hl5thYsKXukTsAoMTlz2nfwWuosdE+flhi1DBvb04N149TQSCxc0qe/02AcsFZtM9uf
 YrFnpeJe5qk9P2hlXWvVM2v29BR2ZRiRDpO66XBaR2jbXtShAa9+6PVefiw/6m/BCr7m
 WjjLIw3ePivyAYfbZrbTiw4Jj/HM1f+z3Yae06yB/ZBcdaT2k6Fslyo5yw6HrdBMFM9+
 7j4GxtqINR1zxy4PgMwnZQ2b7wrGKc0wMKcO09SHE3rwLYkzVcSv9ytJ7FcaosIGBaIO
 ++CA==
X-Gm-Message-State: AFqh2krOyXDQD9N1pYFxriQkygm43O1bOPI617M3G1VeXWJj9w10r9g2
 hFB3MCGjDTVY1DC6FNsm45z9fXnNRjcLqijixwpWea/dJGbvcovbkjUTALqY4Brm/W1cdk1YVLO
 DcDKdqvm9Hb3zs0ZkJG+bJvzL1ywLuDhiI7VqugAVblhdYdKI1h9h2hrgdumIMMqX
X-Received: by 2002:a05:6122:18b8:b0:3e1:6412:33a5 with SMTP id
 bi56-20020a05612218b800b003e1641233a5mr2026183vkb.6.1673993388110; 
 Tue, 17 Jan 2023 14:09:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXucHZXq8j8BOqPZadj0cN/80ZzIGDEqGyQ7b9PNkGBshGZ/KYByd5gm0e84+CwTh8lyohU+nw==
X-Received: by 2002:a05:6122:18b8:b0:3e1:6412:33a5 with SMTP id
 bi56-20020a05612218b800b003e1641233a5mr2026163vkb.6.1673993387799; 
 Tue, 17 Jan 2023 14:09:47 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 bm16-20020a05620a199000b006e16dcf99c8sm21142978qkb.71.2023.01.17.14.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 14:09:46 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>,
 Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH RFC 11/21] migration: Add hugetlb-doublemap cap
Date: Tue, 17 Jan 2023 17:09:04 -0500
Message-Id: <20230117220914.2062125-12-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230117220914.2062125-1-peterx@redhat.com>
References: <20230117220914.2062125-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add a new cap to allow mapping hugetlbfs backed RAMs in small page sizes.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 48 ++++++++++++++++++++++++++++++++++++++++++-
 migration/migration.h |  1 +
 qapi/migration.json   |  7 ++++++-
 3 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 64f74534e2..b174f2af92 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -17,6 +17,7 @@
 #include "qemu/cutils.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
+#include "qemu/madvise.h"
 #include "migration/blocker.h"
 #include "exec.h"
 #include "fd.h"
@@ -62,6 +63,7 @@
 #include "sysemu/cpus.h"
 #include "yank_functions.h"
 #include "sysemu/qtest.h"
+#include "exec/ramblock.h"
 
 #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
 
@@ -1363,12 +1365,47 @@ static bool migrate_caps_check(bool *cap_list,
                    "Zero copy only available for non-compressed non-TLS multifd migration");
         return false;
     }
+
+    if (cap_list[MIGRATION_CAPABILITY_HUGETLB_DOUBLEMAP]) {
+        RAMBlock *rb;
+
+        /* Check whether the platform/binary supports the new madvise()s */
+
+#if QEMU_MADV_SPLIT == QEMU_MADV_INVALID
+        error_setg(errp, "MADV_SPLIT is not supported by the QEMU binary");
+        return false;
+#endif
+
+#if QEMU_MADV_COLLAPSE == QEMU_MADV_INVALID
+        error_setg(errp, "MADV_COLLAPSE is not supported by the QEMU binary");
+        return false;
+#endif
+
+        /*
+         * Check against kernel support of MADV_SPLIT is not easy, delay
+         * that until we have all the hugetlb mappings ready on dest node,
+         * meanwhile do the best effort check here because doublemap
+         * requires the hugetlb ramblocks to be shared first.
+         */
+        RAMBLOCK_FOREACH_NOT_IGNORED(rb) {
+            if (qemu_ram_is_hugetlb(rb) && !qemu_ram_is_shared(rb)) {
+                error_setg(errp, "RAMBlock '%s' needs to be shared for doublemap",
+                           rb->idstr);
+                return false;
+            }
+        }
+    }
 #else
     if (cap_list[MIGRATION_CAPABILITY_ZERO_COPY_SEND]) {
         error_setg(errp,
                    "Zero copy currently only available on Linux");
         return false;
     }
+
+    if (cap_list[MIGRATION_CAPABILITY_HUGETLB_DOUBLEMAP]) {
+        error_setg(errp, "Hugetlb doublemap is only supported on Linux");
+        return false;
+    }
 #endif
 
     if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_PREEMPT]) {
@@ -2792,6 +2829,13 @@ bool migrate_postcopy_preempt(void)
     return s->enabled_capabilities[MIGRATION_CAPABILITY_POSTCOPY_PREEMPT];
 }
 
+bool migrate_hugetlb_doublemap(void)
+{
+    MigrationState *s = migrate_get_current();
+
+    return s->enabled_capabilities[MIGRATION_CAPABILITY_HUGETLB_DOUBLEMAP];
+}
+
 /* migration thread support */
 /*
  * Something bad happened to the RP stream, mark an error
@@ -4472,7 +4516,9 @@ static Property migration_properties[] = {
     DEFINE_PROP_MIG_CAP("x-return-path", MIGRATION_CAPABILITY_RETURN_PATH),
     DEFINE_PROP_MIG_CAP("x-multifd", MIGRATION_CAPABILITY_MULTIFD),
     DEFINE_PROP_MIG_CAP("x-background-snapshot",
-            MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT),
+                        MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT),
+    DEFINE_PROP_MIG_CAP("hugetlb-doublemap",
+                        MIGRATION_CAPABILITY_HUGETLB_DOUBLEMAP),
 #ifdef CONFIG_LINUX
     DEFINE_PROP_MIG_CAP("x-zero-copy-send",
             MIGRATION_CAPABILITY_ZERO_COPY_SEND),
diff --git a/migration/migration.h b/migration/migration.h
index 5674a13876..bbd610a2d5 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -447,6 +447,7 @@ bool migrate_use_events(void);
 bool migrate_postcopy_blocktime(void);
 bool migrate_background_snapshot(void);
 bool migrate_postcopy_preempt(void);
+bool migrate_hugetlb_doublemap(void);
 
 /* Sending on the return path - generic and then for each message type */
 void migrate_send_rp_shut(MigrationIncomingState *mis,
diff --git a/qapi/migration.json b/qapi/migration.json
index 88ecf86ac8..b23516e75e 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -477,6 +477,11 @@
 #                    will be handled faster.  This is a performance feature and
 #                    should not affect the correctness of postcopy migration.
 #                    (since 7.1)
+# @hugetlb-doublemap: If enabled, the migration process will allow postcopy
+#                     to handle page faults based on small pages even if
+#                     hugetlb is used.  This will drastically reduce page
+#                     fault latencies when hugetlb is used as the guest RAM
+#                     backends. (since 7.3)
 #
 # Features:
 # @unstable: Members @x-colo and @x-ignore-shared are experimental.
@@ -492,7 +497,7 @@
            'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
            { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
            'validate-uuid', 'background-snapshot',
-           'zero-copy-send', 'postcopy-preempt'] }
+           'zero-copy-send', 'postcopy-preempt', 'hugetlb-doublemap'] }
 
 ##
 # @MigrationCapabilityStatus:
-- 
2.37.3


