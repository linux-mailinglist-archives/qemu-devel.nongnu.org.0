Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0742E47EE7F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 12:14:24 +0100 (CET)
Received: from localhost ([::1]:39006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0iWk-0003pr-O6
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 06:14:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1n0iUP-00018Y-GF
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 06:11:59 -0500
Received: from relay.sw.ru ([185.231.240.75]:48192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1n0iUM-0003OU-5B
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 06:11:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=npu6QCAVO0+Gg1boHLcX4oRJpIURmt5HZFLHhVTQCBE=; b=Y7e+mrjlXHs2
 U4PWuA+kcxEkAzWb7sSeivDeTC6l1S2b+TOJwW2Tt2bxPj1JOJStQairQqo08OHVBK7VrODR6Bqvb
 VmALtQHtWyVgfwSj3AXm1wBR5w7cCrQWmCZYyHFq+khFQGWFZQD+rjIloFGaKWDL0Y+CGmDVNi9KN
 4vxLA=;
Received: from [10.94.3.117] (helo=nun.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94.2)
 (envelope-from <nikita.lapshin@virtuozzo.com>)
 id 1n0iUG-004OwN-VJ; Fri, 24 Dec 2021 14:11:48 +0300
From: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, eblake@redhat.com,
 armbru@redhat.com, eduardo@habkost.net, crosa@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, nikita.lapshin@virtuozzo.com, vsementsov@virtuozzo.com,
 den@virtuozzo.com
Subject: [PATCH 1/6] migration: is_ram changed to is_iterable
Date: Fri, 24 Dec 2021 14:11:43 +0300
Message-Id: <20211224111148.345438-2-nikita.lapshin@virtuozzo.com>
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

For new migration capabilities upcoming we need to use something
like is_ram for this purpose. This member of struction is true
not only for RAM so it should be renamed.

Signed-off-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
---
 migration/savevm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 0bef031acb..f90fdb2bdd 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -248,7 +248,7 @@ typedef struct SaveStateEntry {
     const VMStateDescription *vmsd;
     void *opaque;
     CompatEntry *compat;
-    int is_ram;
+    int is_iterable;
 } SaveStateEntry;
 
 typedef struct SaveState {
@@ -797,9 +797,9 @@ int register_savevm_live(const char *idstr,
     se->ops = ops;
     se->opaque = opaque;
     se->vmsd = NULL;
-    /* if this is a live_savem then set is_ram */
+    /* if this is a live_savem then set is_iterable */
     if (ops->save_setup != NULL) {
-        se->is_ram = 1;
+        se->is_iterable = 1;
     }
 
     pstrcat(se->idstr, sizeof(se->idstr), idstr);
@@ -1625,7 +1625,7 @@ int qemu_save_device_state(QEMUFile *f)
     QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
         int ret;
 
-        if (se->is_ram) {
+        if (se->is_iterable) {
             continue;
         }
         if ((!se->ops || !se->ops->save_state) && !se->vmsd) {
@@ -2428,7 +2428,7 @@ qemu_loadvm_section_start_full(QEMUFile *f, MigrationIncomingState *mis)
     se->load_section_id = section_id;
 
     /* Validate if it is a device's state */
-    if (xen_enabled() && se->is_ram) {
+    if (xen_enabled() && se->is_iterable) {
         error_report("loadvm: %s RAM loading not allowed on Xen", idstr);
         return -EINVAL;
     }
-- 
2.27.0


