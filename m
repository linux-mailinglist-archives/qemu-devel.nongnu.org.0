Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF7063BFAC
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 13:05:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozzLZ-00081l-FU; Tue, 29 Nov 2022 07:04:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ozzLM-0007x2-3k
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 07:04:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ozzLK-0002FC-Er
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 07:04:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669723444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vJC6rD1rMTbnmUdrTWSBJ+RfNQMIjV7oilTjYfhpvkw=;
 b=BBuoejw/Pvaf7rKWjudZBqgOLkg5gOfAW3DUNAIZ/ulKCd2IPClft4lkWJ1giSjOXOMvrO
 4c+VoaQQjt8zek8kswTIPX7PByvFk/5Oxi9AFE5uWW8G2KROAyQ2038lBDlkHFFHNTeZtc
 ouXsOdOKDB5n4NHENQ7vYzazOrlf78U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-ulmwP2RwPqmFYd31FG08vA-1; Tue, 29 Nov 2022 07:04:03 -0500
X-MC-Unique: ulmwP2RwPqmFYd31FG08vA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6DBE88646B;
 Tue, 29 Nov 2022 12:04:02 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F12D62166B2D;
 Tue, 29 Nov 2022 12:04:01 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 1/2] migration: Add canary to VMSTATE_END_OF_LIST
Date: Tue, 29 Nov 2022 13:03:57 +0100
Message-Id: <20221129120358.16452-2-quintela@redhat.com>
In-Reply-To: <20221129120358.16452-1-quintela@redhat.com>
References: <20221129120358.16452-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

We fairly regularly forget VMSTATE_END_OF_LIST markers off descriptions;
given that the current check is only for ->name being NULL, sometimes
we get unlucky and the code apparently works and no one spots the error.

Explicitly add a flag, VMS_END that should be set, and assert it is
set during the traversal.

Note: This can't go in until we update the copy of vmstate.h in slirp.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/migration/vmstate.h | 7 ++++++-
 migration/savevm.c          | 1 +
 migration/vmstate.c         | 2 ++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index ad24aa1934..527ead2831 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -147,6 +147,9 @@ enum VMStateFlags {
      * VMStateField.struct_version_id to tell which version of the
      * structure we are referencing to use. */
     VMS_VSTRUCT           = 0x8000,
+
+    /* Marker for end of list */
+    VMS_END = 0x10000
 };
 
 typedef enum {
@@ -1161,7 +1164,9 @@ extern const VMStateInfo vmstate_info_qlist;
     VMSTATE_UNUSED_BUFFER(_test, 0, _size)
 
 #define VMSTATE_END_OF_LIST()                                         \
-    {}
+    {                     \
+        .flags = VMS_END, \
+    }
 
 int vmstate_load_state(QEMUFile *f, const VMStateDescription *vmsd,
                        void *opaque, int version_id);
diff --git a/migration/savevm.c b/migration/savevm.c
index a0cdb714f7..3ad81359ab 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -585,6 +585,7 @@ static void dump_vmstate_vmsd(FILE *out_file,
             field++;
             first = false;
         }
+        assert(field->flags == VMS_END);
         fprintf(out_file, "\n%*s]", indent, "");
     }
     if (vmsd->subsections != NULL) {
diff --git a/migration/vmstate.c b/migration/vmstate.c
index 924494bda3..83ca4c7d3e 100644
--- a/migration/vmstate.c
+++ b/migration/vmstate.c
@@ -154,6 +154,7 @@ int vmstate_load_state(QEMUFile *f, const VMStateDescription *vmsd,
         }
         field++;
     }
+    assert(field->flags == VMS_END);
     ret = vmstate_subsection_load(f, vmsd, opaque);
     if (ret != 0) {
         return ret;
@@ -408,6 +409,7 @@ int vmstate_save_state_v(QEMUFile *f, const VMStateDescription *vmsd,
         }
         field++;
     }
+    assert(field->flags == VMS_END);
 
     if (vmdesc) {
         json_writer_end_array(vmdesc);
-- 
2.38.1


