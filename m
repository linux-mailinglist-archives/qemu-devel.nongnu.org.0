Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C07333145A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:16:29 +0100 (CET)
Received: from localhost ([::1]:47346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJUa-0000gU-3Q
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:16:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJBt-0004lG-Nq
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:57:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJBm-00008V-9e
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:57:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615222619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QK3+wvFIX6xtoJ+rW3QuK/UFcrE7WWNUGx5TZzjc3o4=;
 b=H/KuUphQke/9FiBygrmcPYjnSNoywMsSA/I/88hHfOo9umbQBbhOr7tVEpZl4PI/sVCCtn
 BR8uL7W0sowOZaEV+KNXoDwLIkcMIE1GKwq3Rd6KGR5m7xbIvpfXJf4yF4V+wVdVwBiA7b
 bOyIL5NBeIcOzRzY7Jp8bcNslAwHPmE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-cFfo1btnMiOxkcaz_AlfPA-1; Mon, 08 Mar 2021 11:56:57 -0500
X-MC-Unique: cFfo1btnMiOxkcaz_AlfPA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E480814336;
 Mon,  8 Mar 2021 16:56:56 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-100.ams2.redhat.com [10.36.112.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82BA45D9D3;
 Mon,  8 Mar 2021 16:56:53 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 21/30] qom: Remove user_creatable_add_dict()
Date: Mon,  8 Mar 2021 17:54:31 +0100
Message-Id: <20210308165440.386489-22-kwolf@redhat.com>
In-Reply-To: <20210308165440.386489-1-kwolf@redhat.com>
References: <20210308165440.386489-1-kwolf@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Acked-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
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
index d4df2334b7..02c3934329 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -113,38 +113,6 @@ out:
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


