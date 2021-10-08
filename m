Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CF5426BD8
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 15:43:07 +0200 (CEST)
Received: from localhost ([::1]:55408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYq9S-0002bW-Ia
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 09:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mYq3Z-0002AC-Qu
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 09:37:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mYq3W-0001ot-FH
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 09:37:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633700217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yGgT9kbiIOOYyoDZ44FpoEHtcO6BD7BXDUwjNChwZ2Q=;
 b=HZa8Vz5G7Oz9qQ59bTMhoA72ZBYtaQtNzSapeaT7ZkBnYzPtQ+5LFErbItWoOnBfxN0BXL
 z6lmtbq7SvVzfHsv1GoW04tnFwMbP+Lb1J8zGW3hSaAx6+kGs9QHHU7N1TiH79JmXC42h3
 FfuWj41fZF7LB9UXW7C42jwzGb3yPlA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-f3nsLC1ZOM2tFu2Z4K9FQA-1; Fri, 08 Oct 2021 09:36:56 -0400
X-MC-Unique: f3nsLC1ZOM2tFu2Z4K9FQA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E89F18C030D;
 Fri,  8 Oct 2021 13:35:25 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.204])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79183196E2;
 Fri,  8 Oct 2021 13:35:22 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/15] qdev: Avoid using string visitor for properties
Date: Fri,  8 Oct 2021 15:34:34 +0200
Message-Id: <20211008133442.141332-8-kwolf@redhat.com>
In-Reply-To: <20211008133442.141332-1-kwolf@redhat.com>
References: <20211008133442.141332-1-kwolf@redhat.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, damien.hedde@greensocs.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 mst@redhat.com, libvir-list@redhat.com, jasowang@redhat.com,
 quintela@redhat.com, armbru@redhat.com, vsementsov@virtuozzo.com,
 lvivier@redhat.com, its@irrelevant.dk, pbonzini@redhat.com, eblake@redhat.com
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
---
 softmmu/qdev-monitor.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 0705f00846..034b999401 100644
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


