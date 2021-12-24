Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADDB47EE80
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 12:14:24 +0100 (CET)
Received: from localhost ([::1]:38996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0iWl-0003pW-C9
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 06:14:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1n0iUQ-00018a-TY
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 06:11:59 -0500
Received: from relay.sw.ru ([185.231.240.75]:48186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1n0iUM-0003OV-7M
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 06:11:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=znwnfv7R77s7s4VebADjDiwiaRtlNq5ELCcua3CtUrQ=; b=qgzxeCTchrPh
 Qe0CqYplG4RtpIdWr+if03+JT8Wq3O4zUoMXAf2owUmvkOSLKuN1wUS0vmItaneLLArrI6sinVxTM
 OfWyCUtFAiFMHP+M9kFwVyruX98BkMbChgRoop2kWeFyLZFmeo7q8QcFSfBD1Te8PMnLuAw2XK5tf
 3NAVg=;
Received: from [10.94.3.117] (helo=nun.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94.2)
 (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1n0iUG-004OwN-Vr; Fri, 24 Dec 2021 14:11:48 +0300
From: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, eblake@redhat.com,
 armbru@redhat.com, eduardo@habkost.net, crosa@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, nikita.lapshin@virtuozzo.com, vsementsov@virtuozzo.com,
 den@virtuozzo.com
Subject: [PATCH 2/6] migration: should_skip() implemented
Date: Fri, 24 Dec 2021 14:11:44 +0300
Message-Id: <20211224111148.345438-3-nikita.lapshin@virtuozzo.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211224111148.345438-1-nikita.lapshin@virtuozzo.com>
References: <20211224111148.345438-1-nikita.lapshin@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=nikita.lapshin@virtuozzo.com; helo=relay.sw.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For next changes it is convenient to make all decisions about
sections skipping in one function.

Signed-off-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
---
 migration/savevm.c | 42 ++++++++++++++++++++----------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index f90fdb2bdd..ba644083ab 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -943,6 +943,15 @@ static int vmstate_save(QEMUFile *f, SaveStateEntry *se,
     return vmstate_save_state(f, se->vmsd, se->opaque, vmdesc);
 }
 
+static bool should_skip(SaveStateEntry *se)
+{
+    if (se->ops->is_active && !se->ops->is_active(se->opaque)) {
+        return true;
+    }
+
+    return false;
+}
+
 /*
  * Write the header for device section (QEMU_VM_SECTION START/END/PART/FULL)
  */
@@ -1207,10 +1216,8 @@ void qemu_savevm_state_setup(QEMUFile *f)
         if (!se->ops || !se->ops->save_setup) {
             continue;
         }
-        if (se->ops->is_active) {
-            if (!se->ops->is_active(se->opaque)) {
-                continue;
-            }
+        if (should_skip(se)) {
+            continue;
         }
         save_section_header(f, se, QEMU_VM_SECTION_START);
 
@@ -1238,10 +1245,8 @@ int qemu_savevm_state_resume_prepare(MigrationState *s)
         if (!se->ops || !se->ops->resume_prepare) {
             continue;
         }
-        if (se->ops->is_active) {
-            if (!se->ops->is_active(se->opaque)) {
-                continue;
-            }
+        if (should_skip(se)) {
+            continue;
         }
         ret = se->ops->resume_prepare(s, se->opaque);
         if (ret < 0) {
@@ -1268,8 +1273,7 @@ int qemu_savevm_state_iterate(QEMUFile *f, bool postcopy)
         if (!se->ops || !se->ops->save_live_iterate) {
             continue;
         }
-        if (se->ops->is_active &&
-            !se->ops->is_active(se->opaque)) {
+        if (should_skip(se)) {
             continue;
         }
         if (se->ops->is_active_iterate &&
@@ -1336,10 +1340,8 @@ void qemu_savevm_state_complete_postcopy(QEMUFile *f)
         if (!se->ops || !se->ops->save_live_complete_postcopy) {
             continue;
         }
-        if (se->ops->is_active) {
-            if (!se->ops->is_active(se->opaque)) {
-                continue;
-            }
+        if (should_skip(se)) {
+            continue;
         }
         trace_savevm_section_start(se->idstr, se->section_id);
         /* Section type */
@@ -1373,10 +1375,8 @@ int qemu_savevm_state_complete_precopy_iterable(QEMUFile *f, bool in_postcopy)
             continue;
         }
 
-        if (se->ops->is_active) {
-            if (!se->ops->is_active(se->opaque)) {
-                continue;
-            }
+        if (should_skip(se)) {
+            continue;
         }
         trace_savevm_section_start(se->idstr, se->section_id);
 
@@ -1521,10 +1521,8 @@ void qemu_savevm_state_pending(QEMUFile *f, uint64_t threshold_size,
         if (!se->ops || !se->ops->save_live_pending) {
             continue;
         }
-        if (se->ops->is_active) {
-            if (!se->ops->is_active(se->opaque)) {
-                continue;
-            }
+        if (should_skip(se)) {
+            continue;
         }
         se->ops->save_live_pending(f, se->opaque, threshold_size,
                                    res_precopy_only, res_compatible,
-- 
2.27.0


