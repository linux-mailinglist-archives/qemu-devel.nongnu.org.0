Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D527848C246
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 11:27:49 +0100 (CET)
Received: from localhost ([::1]:53604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7ar7-0006Ma-01
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 05:27:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n7ao4-0003b5-8F
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 05:24:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n7ao2-0002FJ-GQ
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 05:24:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641983073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Evp4Nilsy0AqNUtwVMewbR8pNHxw3p/7I0YFNusr93U=;
 b=WAvqE2JIp18Dbo5Aid/EbOpR3nJSPtsMjaKI/vvRsoQmA6eedHz4MJbhwHtBwIcTVemUaz
 9H2PdIp+jGG/M7YJnKvsYAj0uPlx35gNX9WF95H0wd2NmFHDl7u9xeqJF7VdNvqpVusWGy
 NKUvaTKjFlrtkNf1N/n7m2H10OpaGGY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-NXriNVBYOEOrTKPNyBMiyA-1; Wed, 12 Jan 2022 05:24:30 -0500
X-MC-Unique: NXriNVBYOEOrTKPNyBMiyA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 733872F48;
 Wed, 12 Jan 2022 10:24:29 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D5DD1059112;
 Wed, 12 Jan 2022 10:23:50 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, peter.maydell@linaro.org, quintela@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH] migration: Add canary to VMSTATE_END_OF_LIST
Date: Wed, 12 Jan 2022 10:23:45 +0000
Message-Id: <20220112102345.79395-1-dgilbert@redhat.com>
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
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
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

We fairly regularly forget VMSTATE_END_OF_LIST markers off descriptions;
given that the current check is only for ->name being NULL, sometimes
we get unlucky and the code apparently works and no one spots the error.

Explicitly add a flag, VMS_END that should be set, and assert it is
set during the traversal.

Note: This can't go in until we update the copy of vmstate.h in slirp.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 include/migration/vmstate.h | 7 ++++++-
 migration/vmstate.c         | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 017c03675c..b50708e57a 100644
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
@@ -1163,7 +1166,9 @@ extern const VMStateInfo vmstate_info_qlist;
     VMSTATE_UNUSED_BUFFER(_test, 0, _size)
 
 #define VMSTATE_END_OF_LIST()                                         \
-    {}
+    {                     \
+        .flags = VMS_END, \
+    }
 
 int vmstate_load_state(QEMUFile *f, const VMStateDescription *vmsd,
                        void *opaque, int version_id);
diff --git a/migration/vmstate.c b/migration/vmstate.c
index 05f87cdddc..181ba08c7d 100644
--- a/migration/vmstate.c
+++ b/migration/vmstate.c
@@ -160,6 +160,7 @@ int vmstate_load_state(QEMUFile *f, const VMStateDescription *vmsd,
         }
         field++;
     }
+    assert(field->flags == VMS_END);
     ret = vmstate_subsection_load(f, vmsd, opaque);
     if (ret != 0) {
         return ret;
@@ -413,6 +414,7 @@ int vmstate_save_state_v(QEMUFile *f, const VMStateDescription *vmsd,
         }
         field++;
     }
+    assert(field->flags == VMS_END);
 
     if (vmdesc) {
         json_writer_end_array(vmdesc);
-- 
2.34.1


