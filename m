Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4023133DA51
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 18:11:08 +0100 (CET)
Received: from localhost ([::1]:49588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMDDn-00088O-5S
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 13:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMD8s-0002pC-IM
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:06:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMD8p-00059W-3T
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:06:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615914358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wixz/ZlkgWaQe3e9oIX6YCooqd0DTUywAT8TgdI5heU=;
 b=aHihyfOIYjzHq1+Bo4bpOym0XZ2UnSIa2nAWyGKkD/6R4FdcyJkKrc7hvR0QNxLCFPGkWd
 exAXAP+jOEChwpVV+0sZVvh/Cz/QNrwdzqEu4HnXMlHmh0NwpjI6+W1DObF2sGckX0AJZU
 isCW1BBjBjJpia4AOQ8EDM9iIZLLjWY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-XQtd5wopNGubDnZtLysAxg-1; Tue, 16 Mar 2021 13:05:56 -0400
X-MC-Unique: XQtd5wopNGubDnZtLysAxg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 392C4800FF0;
 Tue, 16 Mar 2021 17:05:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 67A801B426;
 Tue, 16 Mar 2021 17:05:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2FB4B1126898; Tue, 16 Mar 2021 18:05:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/11] qapi: Implement deprecated-output=hide for QMP
 introspection
Date: Tue, 16 Mar 2021 18:05:47 +0100
Message-Id: <20210316170551.3911643-8-armbru@redhat.com>
In-Reply-To: <20210316170551.3911643-1-armbru@redhat.com>
References: <20210316170551.3911643-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This policy suppresses deprecated bits in output, and thus permits
"testing the future".  Implement it for QMP command query-qmp-schema:
suppress information on deprecated commands, events and object type
members, i.e. anything that has the special feature flag "deprecated".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210312153210.2810514-7-armbru@redhat.com>
---
 monitor/qmp-cmds-control.c | 71 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/monitor/qmp-cmds-control.c b/monitor/qmp-cmds-control.c
index 25afd0867f..bcfccc4ac4 100644
--- a/monitor/qmp-cmds-control.c
+++ b/monitor/qmp-cmds-control.c
@@ -158,6 +158,74 @@ EventInfoList *qmp_query_events(Error **errp)
     return ev_list;
 }
 
+static void *split_off_generic_list(void *list,
+                                    bool (*splitp)(void *elt),
+                                    void **part)
+{
+    GenericList *keep = NULL, **keep_tailp = &keep;
+    GenericList *split = NULL, **split_tailp = &split;
+    GenericList *tail;
+
+    for (tail = list; tail; tail = tail->next) {
+        if (splitp(tail)) {
+            *split_tailp = tail;
+            split_tailp = &tail->next;
+        } else {
+            *keep_tailp = tail;
+            keep_tailp = &tail->next;
+        }
+    }
+
+    *keep_tailp = *split_tailp = NULL;
+    *part = split;
+    return keep;
+}
+
+static bool is_in(const char *s, strList *list)
+{
+    strList *tail;
+
+    for (tail = list; tail; tail = tail->next) {
+        if (!strcmp(tail->value, s)) {
+            return true;
+        }
+    }
+    return false;
+}
+
+static bool is_entity_deprecated(void *link)
+{
+    return is_in("deprecated", ((SchemaInfoList *)link)->value->features);
+}
+
+static bool is_member_deprecated(void *link)
+{
+    return is_in("deprecated",
+                 ((SchemaInfoObjectMemberList *)link)->value->features);
+}
+
+static SchemaInfoList *zap_deprecated(SchemaInfoList *schema)
+{
+    void *to_zap;
+    SchemaInfoList *tail;
+    SchemaInfo *ent;
+
+    schema = split_off_generic_list(schema, is_entity_deprecated, &to_zap);
+    qapi_free_SchemaInfoList(to_zap);
+
+    for (tail = schema; tail; tail = tail->next) {
+        ent = tail->value;
+        if (ent->meta_type == SCHEMA_META_TYPE_OBJECT) {
+            ent->u.object.members
+                = split_off_generic_list(ent->u.object.members,
+                                         is_member_deprecated, &to_zap);
+            qapi_free_SchemaInfoObjectMemberList(to_zap);
+        }
+    }
+
+    return schema;
+}
+
 SchemaInfoList *qmp_query_qmp_schema(Error **errp)
 {
     QObject *obj = qobject_from_qlit(&qmp_schema_qlit);
@@ -171,5 +239,8 @@ SchemaInfoList *qmp_query_qmp_schema(Error **errp)
     qobject_unref(obj);
     visit_free(v);
 
+    if (compat_policy.deprecated_output == COMPAT_POLICY_OUTPUT_HIDE) {
+        return zap_deprecated(schema);
+    }
     return schema;
 }
-- 
2.26.2


