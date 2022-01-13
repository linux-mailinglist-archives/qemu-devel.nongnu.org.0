Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3DB48DEAC
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 21:13:45 +0100 (CET)
Received: from localhost ([::1]:46572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n86Tg-000140-4H
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 15:13:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n862F-0007yd-Hf
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 14:45:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n8624-0007Mv-LT
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 14:45:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642103110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KCTSU2dzLGocSacE7o3F9FqPrmgf/LE2Ac3aHtzm9qg=;
 b=iFUjmIpWdikxNo+InqTZUzZ0IdoM9J4hCNmUS/UkyhZGYcDiFHbJ8mRm15g3nNZDLJuykU
 AOVmlIp/7Y5yOVhR8Psog0Zj4Tk4R1nVNDB6pOpq808j4N2XzSOHZ/l8XUw6EqmVhivCbn
 AJe1EV/OYf8BS/dRToVL4qG1cjBB4tg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-H6OGdCGPMeqVA7U5YVDXrw-1; Thu, 13 Jan 2022 14:45:05 -0500
X-MC-Unique: H6OGdCGPMeqVA7U5YVDXrw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6559985B66D;
 Thu, 13 Jan 2022 19:45:04 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2851100E125;
 Thu, 13 Jan 2022 19:45:02 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, peter.maydell@linaro.org, quintela@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v2 3/3] migration: Perform vmsd structure check during tests
Date: Thu, 13 Jan 2022 19:44:52 +0000
Message-Id: <20220113194452.254011-4-dgilbert@redhat.com>
In-Reply-To: <20220113194452.254011-1-dgilbert@redhat.com>
References: <20220113194452.254011-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lsoaresp@redhat.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Perform a check on vmsd structures during test runs in the hope
of catching any missing terminators and other simple screwups.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/savevm.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/migration/savevm.c b/migration/savevm.c
index 8077393d11..97a4471220 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -66,6 +66,7 @@
 #include "net/announce.h"
 #include "qemu/yank.h"
 #include "yank_functions.h"
+#include "sysemu/qtest.h"
 
 const unsigned int postcopy_ram_discard_version;
 
@@ -839,6 +840,39 @@ void unregister_savevm(VMStateIf *obj, const char *idstr, void *opaque)
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
+        assert(field->flags == VMS_END);
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
@@ -884,6 +918,11 @@ int vmstate_register_with_alias_id(VMStateIf *obj, uint32_t instance_id,
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
2.34.1


