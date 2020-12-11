Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C54232D7D1B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:40:00 +0100 (CET)
Received: from localhost ([::1]:53270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmOc-0007Zn-PO
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:39:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knlxp-0007Uz-Jq
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:12:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knlxa-0003RO-CJ
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:12:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rzm7ULCEvU2Q/8iuGW0BWQhxvzIqFtlkdqA0Jt6sFXE=;
 b=ZSwGQvqBeYuirb1k+u6akX8gKBfajcx4MOuibFRH5SnJBCP7ZPYgkAtGOE7ukMudwSNPKK
 HTb6NIDXZHimkdf7XGrRogML7taUXthNo+pDREXDVA7Jq5+NVzwc9EHsQnQ0SObBiz8cyK
 BoxqMAGZNafu5aHMdpS9yjcjP9NBLng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-Jko5bT_ePOWMC1oqT2OpRQ-1; Fri, 11 Dec 2020 12:11:57 -0500
X-MC-Unique: Jko5bT_ePOWMC1oqT2OpRQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12A21107ACE3;
 Fri, 11 Dec 2020 17:11:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D58345D731;
 Fri, 11 Dec 2020 17:11:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C10AA112F01E; Fri, 11 Dec 2020 18:11:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/20] Revert "qobject: let object_property_get_str() use new
 API"
Date: Fri, 11 Dec 2020 18:11:43 +0100
Message-Id: <20201211171152.146877-12-armbru@redhat.com>
In-Reply-To: <20201211171152.146877-1-armbru@redhat.com>
References: <20201211171152.146877-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 mdroth@linux.vnet.ibm.com, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit aafb21a0b9 "qobject: let object_property_get_str() use new API"
isn't much of a simplification.  Not worth having
object_property_get_str() differ from the other
object_property_get_FOO().  Revert.

This reverts commit aafb21a0b9cea5fa0fe52e68111bb6bd13837a02.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qom/object.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/qom/object.c b/qom/object.c
index 1065355233..89f5a63211 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -1414,15 +1414,18 @@ char *object_property_get_str(Object *obj, const char *name,
                               Error **errp)
 {
     QObject *ret = object_property_get_qobject(obj, name, errp);
+    QString *qstring;
     char *retval;
 
     if (!ret) {
         return NULL;
     }
-
-    retval = g_strdup(qobject_get_try_str(ret));
-    if (!retval) {
+    qstring = qobject_to(QString, ret);
+    if (!qstring) {
         error_setg(errp, QERR_INVALID_PARAMETER_TYPE, name, "string");
+        retval = NULL;
+    } else {
+        retval = g_strdup(qstring_get_str(qstring));
     }
 
     qobject_unref(ret);
-- 
2.26.2


