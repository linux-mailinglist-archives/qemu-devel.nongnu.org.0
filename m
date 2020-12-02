Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A612CBA9B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:34:24 +0100 (CET)
Received: from localhost ([::1]:42652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkPSp-0007sQ-Fp
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:34:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO45-0003x4-3F
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO3m-0004iw-Jf
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606899865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qsnar4ub5kolFMrFarobPp0+6aVtrtC/dJ8hwXjykvI=;
 b=enYtSxy+2kgRgO4cGNEtmIQBEmjVTMS7AdtEAscZpRBUKhuGsisRB5kXUU0zl/T4kvchrf
 lHkE7lX/gIfRq2hzAVRunotkIsNzdyYQPSRt1YeY821J0L9TIPL4/YfLbn2S4OrMqFrSen
 eqkVUWpQqE7MbY+fhU7uRIyJrEZXEt4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-PMhXnnpmMRacInk4UbiqUA-1; Wed, 02 Dec 2020 04:04:21 -0500
X-MC-Unique: PMhXnnpmMRacInk4UbiqUA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 639DB9248B7;
 Wed,  2 Dec 2020 09:03:48 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7A326085A;
 Wed,  2 Dec 2020 09:03:47 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/28] qom: do not modify QDict argument in
 user_creatable_add_dict
Date: Wed,  2 Dec 2020 04:02:55 -0500
Message-Id: <20201202090305.4129317-19-pbonzini@redhat.com>
In-Reply-To: <20201202090305.4129317-1-pbonzini@redhat.com>
References: <20201202090305.4129317-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

-object will process its QDicts in two steps, first for the "early" objects and
then for the "late" objects.  If qom-type is removed by the "early" pass, the
late pass fails.  So just create a shallow copy of the QDict in
user_creatable_add_dict.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qom/object_interfaces.h |  2 +-
 qom/object_interfaces.c         | 11 +++++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/qom/object_interfaces.h b/include/qom/object_interfaces.h
index abb23eaea3..ed0d7d663b 100644
--- a/include/qom/object_interfaces.h
+++ b/include/qom/object_interfaces.h
@@ -102,7 +102,7 @@ Object *user_creatable_add_type(const char *type, const char *id,
  *
  * Returns: %true on success, %false on failure.
  */
-bool user_creatable_add_dict(QDict *qdict, bool keyval, Error **errp);
+bool user_creatable_add_dict(const QDict *qdict, bool keyval, Error **errp);
 
 /**
  * user_creatable_add_opts:
diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index f7dcdf18e2..80814ae7b5 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -106,24 +106,25 @@ out:
     return obj;
 }
 
-bool user_creatable_add_dict(QDict *qdict, bool keyval, Error **errp)
+bool user_creatable_add_dict(const QDict *dict, bool keyval, Error **errp)
 {
     Visitor *v;
-    Object *obj;
+    Object *obj = NULL;
+    QDict *qdict = qdict_clone_shallow(dict);
     g_autofree char *type = NULL;
     g_autofree char *id = NULL;
 
     type = g_strdup(qdict_get_try_str(qdict, "qom-type"));
     if (!type) {
         error_setg(errp, QERR_MISSING_PARAMETER, "qom-type");
-        return false;
+        goto out;
     }
     qdict_del(qdict, "qom-type");
 
     id = g_strdup(qdict_get_try_str(qdict, "id"));
     if (!id) {
         error_setg(errp, QERR_MISSING_PARAMETER, "id");
-        return false;
+        goto out;
     }
     qdict_del(qdict, "id");
 
@@ -135,6 +136,8 @@ bool user_creatable_add_dict(QDict *qdict, bool keyval, Error **errp)
     obj = user_creatable_add_type(type, id, qdict, v, errp);
     visit_free(v);
     object_unref(obj);
+out:
+    qobject_unref(qdict);
     return !!obj;
 }
 
-- 
2.26.2



