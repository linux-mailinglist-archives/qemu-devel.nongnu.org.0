Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E85142F64F
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 16:53:52 +0200 (CEST)
Received: from localhost ([::1]:55144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbOal-0008H2-Cy
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 10:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mbOVu-0000Ia-Tl
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 10:48:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mbOVt-0001nP-82
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 10:48:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634309328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cRCZlNtkutYPPN8MGG4zTDGFwViY+cRpkYXx35fSry0=;
 b=hFRnfhNOd6pIb3Nlud8LQ7BAr9141//2cFjTIdSlX/uy/URJI2Xtln/gwhytG8FSUWBaeU
 Z/+TPLnVgkDTm+02zw0tijb0j2kKIIxIGBbdH0hs4gaolZjBl1RwEb17S1bQNk1mhT0zuh
 hYzrndBL+X5K3Uz7WF1WEKZPeUxe8l0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-Jbro4qwbM_SyTeWbs58_jw-1; Fri, 15 Oct 2021 10:48:47 -0400
X-MC-Unique: Jbro4qwbM_SyTeWbs58_jw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23CAD801ADA
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 14:48:46 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DB2F19739;
 Fri, 15 Oct 2021 14:48:45 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/15] qdev: Avoid using string visitor for properties
Date: Fri, 15 Oct 2021 16:46:32 +0200
Message-Id: <20211015144640.198044-8-kwolf@redhat.com>
In-Reply-To: <20211015144640.198044-1-kwolf@redhat.com>
References: <20211015144640.198044-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only thing the string visitor adds compared to a keyval visitor is
list support. git grep for 'visit_start_list' and 'visit.*List' shows
that devices don't make use of this.

In a world with a QAPIfied command line interface, the keyval visitor is
used to parse the command line. In order to make sure that no devices
start using this feature that would make backwards compatibility harder,
just switch away from object_property_parse(), which internally uses the
string visitor, to a keyval visitor and object_property_set().

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20211008133442.141332-8-kwolf@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Tested-by: Peter Krempa <pkrempa@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 softmmu/qdev-monitor.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 3df99ce9fc..672f87ed4f 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -28,6 +28,8 @@
 #include "qapi/qmp/dispatch.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
+#include "qapi/qmp/qstring.h"
+#include "qapi/qobject-input-visitor.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
 #include "qemu/help_option.h"
@@ -198,16 +200,28 @@ static int set_property(void *opaque, const char *name, const char *value,
                         Error **errp)
 {
     Object *obj = opaque;
+    QString *val;
+    Visitor *v;
+    int ret;
 
     if (strcmp(name, "driver") == 0)
         return 0;
     if (strcmp(name, "bus") == 0)
         return 0;
 
-    if (!object_property_parse(obj, name, value, errp)) {
-        return -1;
+    val = qstring_from_str(value);
+    v = qobject_input_visitor_new_keyval(QOBJECT(val));
+
+    if (!object_property_set(obj, name, v, errp)) {
+        ret = -1;
+        goto out;
     }
-    return 0;
+
+    ret = 0;
+out:
+    visit_free(v);
+    qobject_unref(val);
+    return ret;
 }
 
 static const char *find_typename_by_alias(const char *alias)
-- 
2.31.1


