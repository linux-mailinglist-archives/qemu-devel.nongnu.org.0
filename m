Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76568323F45
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 15:54:10 +0100 (CET)
Received: from localhost ([::1]:52234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEvYH-0003tj-Cq
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 09:54:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEvR7-0002jG-8n
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:46:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEvR3-0003nf-Gp
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:46:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614178000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j2zm2qamYNKsYNTtudWB9DrFDR64C6so6aYk0SXWUik=;
 b=g6v6WaE9hRs/oJTLnfPab05GjCLkjoi2qf92d0OxJMXFlmBe06yvVLayPNiaJEfwlAs1qb
 UveYGPkj3cWig9B4zqVC3KRmpkfKmxkHnAi7FEcKE3Vy4oAYIZnFt9MYEPkBkQad7DkwM0
 Cmcx31jwVxMvPkSagzhGsiouHlHERqQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-6i755uYMMMGY8tCISqSn0w-1; Wed, 24 Feb 2021 09:46:39 -0500
X-MC-Unique: 6i755uYMMMGY8tCISqSn0w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0597101ABBE;
 Wed, 24 Feb 2021 13:56:00 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-142.ams2.redhat.com [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CEB055D6D3;
 Wed, 24 Feb 2021 13:55:57 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/31] qom: Remove user_creatable_add_dict()
Date: Wed, 24 Feb 2021 14:52:46 +0100
Message-Id: <20210224135255.253837-23-kwolf@redhat.com>
In-Reply-To: <20210224135255.253837-1-kwolf@redhat.com>
References: <20210224135255.253837-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function is now unused and can be removed.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qom/object_interfaces.h | 18 ------------------
 qom/object_interfaces.c         | 32 --------------------------------
 2 files changed, 50 deletions(-)

diff --git a/include/qom/object_interfaces.h b/include/qom/object_interfaces.h
index 9b9938b8c0..5299603f50 100644
--- a/include/qom/object_interfaces.h
+++ b/include/qom/object_interfaces.h
@@ -86,24 +86,6 @@ Object *user_creatable_add_type(const char *type, const char *id,
                                 const QDict *qdict,
                                 Visitor *v, Error **errp);
 
-/**
- * user_creatable_add_dict:
- * @qdict: the object definition
- * @keyval: if true, use a keyval visitor for processing @qdict (i.e.
- *          assume that all @qdict values are strings); otherwise, use
- *          the normal QObject visitor (i.e. assume all @qdict values
- *          have the QType expected by the QOM object type)
- * @errp: if an error occurs, a pointer to an area to store the error
- *
- * Create an instance of the user creatable object that is defined by
- * @qdict.  The object type is taken from the QDict key 'qom-type', its
- * ID from the key 'id'. The remaining entries in @qdict are used to
- * initialize the object properties.
- *
- * Returns: %true on success, %false on failure.
- */
-bool user_creatable_add_dict(QDict *qdict, bool keyval, Error **errp);
-
 /**
  * user_creatable_add_opts:
  * @opts: the object definition
diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index b9a99c8bf4..7d8a4b77b8 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -104,38 +104,6 @@ out:
     return obj;
 }
 
-bool user_creatable_add_dict(QDict *qdict, bool keyval, Error **errp)
-{
-    Visitor *v;
-    Object *obj;
-    g_autofree char *type = NULL;
-    g_autofree char *id = NULL;
-
-    type = g_strdup(qdict_get_try_str(qdict, "qom-type"));
-    if (!type) {
-        error_setg(errp, QERR_MISSING_PARAMETER, "qom-type");
-        return false;
-    }
-    qdict_del(qdict, "qom-type");
-
-    id = g_strdup(qdict_get_try_str(qdict, "id"));
-    if (!id) {
-        error_setg(errp, QERR_MISSING_PARAMETER, "id");
-        return false;
-    }
-    qdict_del(qdict, "id");
-
-    if (keyval) {
-        v = qobject_input_visitor_new_keyval(QOBJECT(qdict));
-    } else {
-        v = qobject_input_visitor_new(QOBJECT(qdict));
-    }
-    obj = user_creatable_add_type(type, id, qdict, v, errp);
-    visit_free(v);
-    object_unref(obj);
-    return !!obj;
-}
-
 Object *user_creatable_add_opts(QemuOpts *opts, Error **errp)
 {
     Visitor *v;
-- 
2.29.2


