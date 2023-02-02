Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D94C6883B9
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 17:09:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNc7x-0008MX-Pw; Thu, 02 Feb 2023 11:07:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNc7u-0008HT-Ls
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 11:07:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNc7s-00059f-BD
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 11:07:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675354071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3H2e5YeH5/21K34UaegkcQcfDpUz2GgM6q4M95PjxcQ=;
 b=a5rXRL6xvphlMCz5T9fAWANtdqIy9XUVJu6eac5q+lBQWtkXAJ+xYCwa1M5h0t2SoNu720
 iBiyOpi3J4QUSJoPCRiip48AqX8vxtAQz9z6V8Ai36W/NLtP0HO/1cYWw1Q8EK5uDXPrlP
 EjJ0Wkvv/Td4ZRatTc+4jw/odW/Uj7s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-PV_VloGmMz24_vCkcarOsQ-1; Thu, 02 Feb 2023 11:07:47 -0500
X-MC-Unique: PV_VloGmMz24_vCkcarOsQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66DB58828C0;
 Thu,  2 Feb 2023 16:07:46 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DBF051E5;
 Thu,  2 Feb 2023 16:07:41 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Eric Farman <farman@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-s390x@nongnu.org, Peter Xu <peterx@redhat.com>
Subject: [PULL 12/26] migration/savevm: Move more savevm handling into
 vmstate_save()
Date: Thu,  2 Feb 2023 17:06:26 +0100
Message-Id: <20230202160640.2300-13-quintela@redhat.com>
In-Reply-To: <20230202160640.2300-1-quintela@redhat.com>
References: <20230202160640.2300-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: David Hildenbrand <david@redhat.com>

Let's move more code into vmstate_save(), reducing code duplication and
preparing for reuse of vmstate_save() in qemu_savevm_state_setup(). We
have to move vmstate_save() to make the compiler happy.

We'll now also trace from qemu_save_device_state(), triggering the same
tracepoints as previously called from
qemu_savevm_state_complete_precopy_non_iterable() only. Note that
qemu_save_device_state() ignores iterable device state, such as RAM,
and consequently doesn't trigger some other trace points (e.g.,
trace_savevm_state_setup()).

Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/savevm.c | 79 ++++++++++++++++++++++------------------------
 1 file changed, 37 insertions(+), 42 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index e1caa3ea7c..3e3631652e 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -898,17 +898,6 @@ static void vmstate_save_old_style(QEMUFile *f, SaveStateEntry *se,
     }
 }
 
-static int vmstate_save(QEMUFile *f, SaveStateEntry *se,
-                        JSONWriter *vmdesc)
-{
-    trace_vmstate_save(se->idstr, se->vmsd ? se->vmsd->name : "(old)");
-    if (!se->vmsd) {
-        vmstate_save_old_style(f, se, vmdesc);
-        return 0;
-    }
-    return vmstate_save_state(f, se->vmsd, se->opaque, vmdesc);
-}
-
 /*
  * Write the header for device section (QEMU_VM_SECTION START/END/PART/FULL)
  */
@@ -942,6 +931,43 @@ static void save_section_footer(QEMUFile *f, SaveStateEntry *se)
     }
 }
 
+static int vmstate_save(QEMUFile *f, SaveStateEntry *se, JSONWriter *vmdesc)
+{
+    int ret;
+
+    if ((!se->ops || !se->ops->save_state) && !se->vmsd) {
+        return 0;
+    }
+    if (se->vmsd && !vmstate_save_needed(se->vmsd, se->opaque)) {
+        trace_savevm_section_skip(se->idstr, se->section_id);
+        return 0;
+    }
+
+    trace_savevm_section_start(se->idstr, se->section_id);
+    save_section_header(f, se, QEMU_VM_SECTION_FULL);
+    if (vmdesc) {
+        json_writer_start_object(vmdesc, NULL);
+        json_writer_str(vmdesc, "name", se->idstr);
+        json_writer_int64(vmdesc, "instance_id", se->instance_id);
+    }
+
+    trace_vmstate_save(se->idstr, se->vmsd ? se->vmsd->name : "(old)");
+    if (!se->vmsd) {
+        vmstate_save_old_style(f, se, vmdesc);
+    } else {
+        ret = vmstate_save_state(f, se->vmsd, se->opaque, vmdesc);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    trace_savevm_section_end(se->idstr, se->section_id, 0);
+    save_section_footer(f, se);
+    if (vmdesc) {
+        json_writer_end_object(vmdesc);
+    }
+    return 0;
+}
 /**
  * qemu_savevm_command_send: Send a 'QEMU_VM_COMMAND' type element with the
  *                           command and associated data.
@@ -1375,31 +1401,11 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
     json_writer_int64(vmdesc, "page_size", qemu_target_page_size());
     json_writer_start_array(vmdesc, "devices");
     QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
-
-        if ((!se->ops || !se->ops->save_state) && !se->vmsd) {
-            continue;
-        }
-        if (se->vmsd && !vmstate_save_needed(se->vmsd, se->opaque)) {
-            trace_savevm_section_skip(se->idstr, se->section_id);
-            continue;
-        }
-
-        trace_savevm_section_start(se->idstr, se->section_id);
-
-        json_writer_start_object(vmdesc, NULL);
-        json_writer_str(vmdesc, "name", se->idstr);
-        json_writer_int64(vmdesc, "instance_id", se->instance_id);
-
-        save_section_header(f, se, QEMU_VM_SECTION_FULL);
         ret = vmstate_save(f, se, vmdesc);
         if (ret) {
             qemu_file_set_error(f, ret);
             return ret;
         }
-        trace_savevm_section_end(se->idstr, se->section_id, 0);
-        save_section_footer(f, se);
-
-        json_writer_end_object(vmdesc);
     }
 
     if (inactivate_disks) {
@@ -1618,21 +1624,10 @@ int qemu_save_device_state(QEMUFile *f)
         if (se->is_ram) {
             continue;
         }
-        if ((!se->ops || !se->ops->save_state) && !se->vmsd) {
-            continue;
-        }
-        if (se->vmsd && !vmstate_save_needed(se->vmsd, se->opaque)) {
-            continue;
-        }
-
-        save_section_header(f, se, QEMU_VM_SECTION_FULL);
-
         ret = vmstate_save(f, se, NULL);
         if (ret) {
             return ret;
         }
-
-        save_section_footer(f, se);
     }
 
     qemu_put_byte(f, QEMU_VM_EOF);
-- 
2.39.1


