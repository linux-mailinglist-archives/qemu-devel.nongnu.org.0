Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE1463BFAF
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 13:05:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozzLY-000806-Dt; Tue, 29 Nov 2022 07:04:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ozzLP-0007xE-Ty
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 07:04:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ozzLM-0002FQ-W9
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 07:04:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669723447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CAdle4g5CCMNqOqQR86hoGfyErhNQCAtfZJ1Q4Djxzs=;
 b=KKxg8i1xdR1nxLnEdIBDxN2gzi4xFmtLd8J14xel9SlEaP7I/H9Y0XPS2gp1DPWzM3wW32
 YysVDERE11F4Mc8dT7BUbDbXrXak4eziOIZypq7iqbFWG/P6vwI0wlnAQUmWM6ePEg1Uyh
 i3yER3GDdZccVEVeB42hW+WnRgbQcDY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-RlPWdFWgM_Wjcm51fwrNWw-1; Tue, 29 Nov 2022 07:04:04 -0500
X-MC-Unique: RlPWdFWgM_Wjcm51fwrNWw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7275185A7A8;
 Tue, 29 Nov 2022 12:04:03 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2622F2166B2D;
 Tue, 29 Nov 2022 12:04:03 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 2/2] migration: Perform vmsd structure check during tests
Date: Tue, 29 Nov 2022 13:03:58 +0100
Message-Id: <20221129120358.16452-3-quintela@redhat.com>
In-Reply-To: <20221129120358.16452-1-quintela@redhat.com>
References: <20221129120358.16452-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Perform a check on vmsd structures during test runs in the hope
of catching any missing terminators and other simple screwups.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/savevm.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/migration/savevm.c b/migration/savevm.c
index 3ad81359ab..e6c3fc6614 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -66,6 +66,7 @@
 #include "net/announce.h"
 #include "qemu/yank.h"
 #include "yank_functions.h"
+#include "sysemu/qtest.h"
 
 const unsigned int postcopy_ram_discard_version;
 
@@ -804,6 +805,42 @@ void unregister_savevm(VMStateIf *obj, const char *idstr, void *opaque)
     }
 }
 
+/*
+ * Perform some basic checks on vmsd's at registration
+ * time.
+ */
+static void vmstate_check(const VMStateDescription *vmsd)
+{
+    const VMStateField *field = vmsd->fields;
+    const VMStateDescription **subsection = vmsd->subsections;
+
+    if (field) {
+        while (field->name) {
+            if (field->flags & (VMS_STRUCT | VMS_VSTRUCT)) {
+                /* Recurse to sub structures */
+                vmstate_check(field->vmsd);
+            }
+            /* Carry on */
+            field++;
+        }
+        /* Check for the end of field list canary */
+        if (field->flags != VMS_END) {
+            error_report("VMSTATE not ending with VMS_END: %s", vmsd->name);
+            g_assert_not_reached();
+        }
+    }
+
+    while (subsection && *subsection) {
+        /*
+         * The name of a subsection should start with the name of the
+         * current object.
+         */
+        assert(!strncmp(vmsd->name, (*subsection)->name, strlen(vmsd->name)));
+        vmstate_check(*subsection);
+        subsection++;
+    }
+}
+
 int vmstate_register_with_alias_id(VMStateIf *obj, uint32_t instance_id,
                                    const VMStateDescription *vmsd,
                                    void *opaque, int alias_id,
@@ -849,6 +886,11 @@ int vmstate_register_with_alias_id(VMStateIf *obj, uint32_t instance_id,
     } else {
         se->instance_id = instance_id;
     }
+
+    /* Perform a recursive sanity check during the test runs */
+    if (qtest_enabled()) {
+        vmstate_check(vmsd);
+    }
     assert(!se->compat || se->instance_id == 0);
     savevm_state_handler_insert(se);
     return 0;
-- 
2.38.1


