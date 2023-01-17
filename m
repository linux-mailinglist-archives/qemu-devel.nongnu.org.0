Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E158466DC44
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 12:23:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHk3V-0001Zr-JA; Tue, 17 Jan 2023 06:23:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pHk3T-0001ZD-PC
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:23:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pHk3S-0002Nl-6o
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:23:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673954581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F+8QR3ACPxtQbO5odUS29VDyufWpaVdRyoQXpR+FegQ=;
 b=Vv8qeHJug6mICd9adt93IdhQYcgTPm0VhRLfrC4UzxH93odhuLC3+cKEfVXD34Y57EtxAp
 fAjTD232JWWSzox6QuczFPKBatTc7o2kx4Vy6DmalVNrSoqfQxAKw7bEu8+3uZSAlbBsA7
 De3c18osO11NVCDekmlTK9X88qdOv/M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-lKrwu43WNVGWh_23PAcd_w-1; Tue, 17 Jan 2023 06:22:58 -0500
X-MC-Unique: lKrwu43WNVGWh_23PAcd_w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CDC6811E9C
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 11:22:58 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA23B7AE5;
 Tue, 17 Jan 2023 11:22:56 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: [PATCH v5 3/8] migration/savevm: Allow immutable device state to be
 migrated early (i.e., before RAM)
Date: Tue, 17 Jan 2023 12:22:44 +0100
Message-Id: <20230117112249.244096-4-david@redhat.com>
In-Reply-To: <20230117112249.244096-1-david@redhat.com>
References: <20230117112249.244096-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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

For virtio-mem, we want to have the plugged/unplugged state of memory
blocks available before migrating any actual RAM content, and perform
sanity checks before touching anything on the destination. This
information is immutable on the migration source while migration is active,

We want to use this information for proper preallocation support with
migration: currently, we don't preallocate memory on the migration target,
and especially with hugetlb, we can easily run out of hugetlb pages during
RAM migration and will crash (SIGBUS) instead of catching this gracefully
via preallocation.

Migrating device state via a VMSD before we start iterating is currently
impossible: the only approach that would be possible is avoiding a VMSD
and migrating state manually during save_setup(), to be restored during
load_state().

Let's allow for migrating device state via a VMSD early, during the
setup phase in qemu_savevm_state_setup(). To keep it simple, we
indicate applicable VMSD's using an "early_setup" flag.

Note that only very selected devices (i.e., ones seriously messing with
RAM setup) are supposed to make use of such early state migration.

While at it, also use a bool for the "unmigratable" member.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/migration/vmstate.h | 16 +++++++++++++++-
 migration/savevm.c          | 14 ++++++++++++++
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index ad24aa1934..64680d824e 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -178,7 +178,21 @@ struct VMStateField {
 
 struct VMStateDescription {
     const char *name;
-    int unmigratable;
+    bool unmigratable;
+    /*
+     * This VMSD describes something that should be sent during setup phase
+     * of migration. It plays similar role as save_setup() for explicitly
+     * registered vmstate entries, so it can be seen as a way to describe
+     * save_setup() in VMSD structures.
+     *
+     * Note that for now, a SaveStateEntry cannot have a VMSD and
+     * operations (e.g., save_setup()) set at the same time. Consequently,
+     * save_setup() and a VMSD with early_setup set to true are mutually
+     * exclusive. For this reason, also early_setup VMSDs are migrated in a
+     * QEMU_VM_SECTION_FULL section, while save_setup() data is migrated in
+     * a QEMU_VM_SECTION_START section.
+     */
+    bool early_setup;
     int version_id;
     int minimum_version_id;
     MigrationPriority priority;
diff --git a/migration/savevm.c b/migration/savevm.c
index ff2b8d0064..45c072050a 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1200,6 +1200,15 @@ void qemu_savevm_state_setup(QEMUFile *f)
 
     trace_savevm_state_setup();
     QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
+        if (se->vmsd && se->vmsd->early_setup) {
+            ret = vmstate_save(f, se, ms->vmdesc);
+            if (ret) {
+                qemu_file_set_error(f, ret);
+                break;
+            }
+            continue;
+        }
+
         if (!se->ops || !se->ops->save_setup) {
             continue;
         }
@@ -1402,6 +1411,11 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
     int ret;
 
     QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
+        if (se->vmsd && se->vmsd->early_setup) {
+            /* Already saved during qemu_savevm_state_setup(). */
+            continue;
+        }
+
         ret = vmstate_save(f, se, vmdesc);
         if (ret) {
             qemu_file_set_error(f, ret);
-- 
2.39.0


