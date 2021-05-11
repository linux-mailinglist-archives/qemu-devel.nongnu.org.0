Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EE637A262
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:43:13 +0200 (CEST)
Received: from localhost ([::1]:41906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgNyy-0002Sj-Mt
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:43:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNXH-0002JL-LZ
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWs-0000pz-4z
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620720849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tEhdwlmCNfXmfkMiOXRvqawPlHLjgpOLHng3N/SsIAs=;
 b=N11Kk+8a1k3RuL/4cwPYfRacPJV9aiBKopeHxTIfEx2jp+tza2c7kZGTXCW21hQA3ocwN9
 Tl5rz0t8ett/hkFE23Fvde6x+iOhOSnQ+JfelVzoguL3ToDUZdCtLwHf+whgyUCbZvdeDs
 ixNMI/uZU052MA+ENuAcuQ0Ai65IcOw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-zIIJoHOAONeP3aqIYMqmVA-1; Tue, 11 May 2021 04:14:06 -0400
X-MC-Unique: zIIJoHOAONeP3aqIYMqmVA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A7341006C80;
 Tue, 11 May 2021 08:14:05 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE4CA62499;
 Tue, 11 May 2021 08:14:04 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/33] migration: do not restart VM after successful
 snapshot-load
Date: Tue, 11 May 2021 04:13:47 -0400
Message-Id: <20210511081350.419428-31-pbonzini@redhat.com>
In-Reply-To: <20210511081350.419428-1-pbonzini@redhat.com>
References: <20210511081350.419428-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The HMP loadvm code is calling load_snapshot rather than
qmp_snapshot_load, in order to bypass the job infrastructure.  The code
around it is almost the same, with one difference: hmp_loadvm is
restarting the VM if load_snapshot fails, qmp_snapshot_load is doing so
if load_snapshot succeeds.

Fix the bug in QMP by moving the common code to load_snapshot.

Cc: qemu-stable@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 migration/savevm.c | 16 ++++++++--------
 monitor/hmp-cmds.c |  7 +------
 2 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 52e2d72e4b..a899191cbf 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2992,6 +2992,7 @@ bool load_snapshot(const char *name, const char *vmstate,
     int ret;
     AioContext *aio_context;
     MigrationIncomingState *mis = migration_incoming_get_current();
+    int saved_vm_running  = runstate_is_running();
 
     if (!bdrv_all_can_snapshot(has_devices, devices, errp)) {
         return false;
@@ -3024,6 +3025,8 @@ bool load_snapshot(const char *name, const char *vmstate,
         return false;
     }
 
+    vm_stop(RUN_STATE_RESTORE_VM);
+
     /*
      * Flush the record/replay queue. Now the VM state is going
      * to change. Therefore we don't need to preserve its consistency
@@ -3061,13 +3064,17 @@ bool load_snapshot(const char *name, const char *vmstate,
 
     if (ret < 0) {
         error_setg(errp, "Error %d while loading VM state", ret);
-        return false;
+        goto err_restart;
     }
 
     return true;
 
 err_drain:
     bdrv_drain_all_end();
+err_restart:
+    if (saved_vm_running) {
+        vm_start();
+    }
     return false;
 }
 
@@ -3135,17 +3142,10 @@ static void snapshot_load_job_bh(void *opaque)
 {
     Job *job = opaque;
     SnapshotJob *s = container_of(job, SnapshotJob, common);
-    int orig_vm_running;
 
     job_progress_set_remaining(&s->common, 1);
 
-    orig_vm_running = runstate_is_running();
-    vm_stop(RUN_STATE_RESTORE_VM);
-
     s->ret = load_snapshot(s->tag, s->vmstate, true, s->devices, s->errp);
-    if (s->ret && orig_vm_running) {
-        vm_start();
-    }
 
     job_progress_update(&s->common, 1);
 
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 0ad5b77477..a39436c8cb 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1127,15 +1127,10 @@ void hmp_balloon(Monitor *mon, const QDict *qdict)
 
 void hmp_loadvm(Monitor *mon, const QDict *qdict)
 {
-    int saved_vm_running  = runstate_is_running();
     const char *name = qdict_get_str(qdict, "name");
     Error *err = NULL;
 
-    vm_stop(RUN_STATE_RESTORE_VM);
-
-    if (!load_snapshot(name, NULL, false, NULL, &err) && saved_vm_running) {
-        vm_start();
-    }
+    load_snapshot(name, NULL, false, NULL, &err);
     hmp_handle_error(mon, err);
 }
 
-- 
2.26.2



