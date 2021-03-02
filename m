Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FCE32A78E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 18:20:28 +0100 (CET)
Received: from localhost ([::1]:44144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH8h9-0008DD-FV
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 12:20:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lH8dY-0005FR-29
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:16:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lH8dW-00010P-8g
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:16:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614705399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=98F4w3i59f3Lf/F4aq4RtiPNPJjH3LDDQQIa+kWKRy0=;
 b=aeenVn6GJ1ZhVTVp7S4WblxADAI3waY1HQqjRW7ELIaXvRD3lZeKfdc0toL6jy54JcDdU3
 WGbTNmIk3Bgr/xbno483hCE6zweCshGdvngrhX5/CW9td2WSXAuHLx+Xsgf+r1JzQU20LJ
 0l3cdUn1HitxXtcVkx+ZxWTIaJN+TQ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-MaLbT-FmP5u0261udhtdmw-1; Tue, 02 Mar 2021 12:16:38 -0500
X-MC-Unique: MaLbT-FmP5u0261udhtdmw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09192107ACE6;
 Tue,  2 Mar 2021 17:16:37 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-197.ams2.redhat.com [10.36.113.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 971225D9E2;
 Tue,  2 Mar 2021 17:16:35 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qom: Check for wellformed id in user_creatable_add_type()
Date: Tue,  2 Mar 2021 18:16:23 +0100
Message-Id: <20210302171623.49709-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, armbru@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Most code paths for creating a user creatable object go through
QemuOpts, which ensures that the provided 'id' option is actually a
valid identifier.

However, there are some code paths that don't go through QemuOpts:
qemu-storage-daemon --object (since commit 8db1efd3) and QMP object-add
(since it was first introduced in commit cff8b2c6). We need to have the
same validity check for those, too.

This adds the check and makes it print the same error message as
QemuOpts on failure.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
This makes sense even without the -object QAPIfication, so no reason to
wait for v3 of that series to get this fixed.

 qom/object_interfaces.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index 1e9ad6f08a..515ca4557e 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -8,6 +8,7 @@
 #include "qapi/qobject-input-visitor.h"
 #include "qom/object_interfaces.h"
 #include "qemu/help_option.h"
+#include "qemu/id.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
 #include "qapi/opts-visitor.h"
@@ -41,11 +42,19 @@ Object *user_creatable_add_type(const char *type, const char *id,
                                 const QDict *qdict,
                                 Visitor *v, Error **errp)
 {
+    ERRP_GUARD();
     Object *obj;
     ObjectClass *klass;
     const QDictEntry *e;
     Error *local_err = NULL;
 
+    if (!id_wellformed(id)) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "id", "an identifier");
+        error_append_hint(errp, "Identifiers consist of letters, digits, "
+                          "'-', '.', '_', starting with a letter.\n");
+        return NULL;
+    }
+
     klass = object_class_by_name(type);
     if (!klass) {
         error_setg(errp, "invalid object type: %s", type);
-- 
2.29.2


