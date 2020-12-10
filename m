Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87ED62D629D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 17:56:27 +0100 (CET)
Received: from localhost ([::1]:41462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knPEw-0007rz-IH
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 11:56:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOrj-0008Ma-5j
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:32:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOrY-0003TP-0X
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:32:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607617931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=70IyvxiTdghA2P+x8r/0EH+VVOaFEVaJwPmFwrFXF/o=;
 b=C2u+3Hq4Ig06Ids6j7LkvZ78+htQEfKc5nSEPwbn3/msyzz904yJyQxV294itKw0Zxt0FS
 O69KPPhDRgmyq9ennZ7dQt3kXE/1sjt5qyM3M6fCsWz2jXI7Sb80JYoHErA5JnEShM1dN9
 ZY5wdfcKlyj07/8zFS/Qxpx+pKCrDcE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-aJ9RKLg_N-io09jA8Jlbag-1; Thu, 10 Dec 2020 11:32:08 -0500
X-MC-Unique: aJ9RKLg_N-io09jA8Jlbag-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7761981CBF6;
 Thu, 10 Dec 2020 16:31:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 129535D9CC;
 Thu, 10 Dec 2020 16:31:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DA05A10FA0AC; Thu, 10 Dec 2020 17:31:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/13] qom: Improve {qom, device}-list-properties error messages
Date: Thu, 10 Dec 2020 17:31:29 +0100
Message-Id: <20201210163132.2919935-11-armbru@redhat.com>
In-Reply-To: <20201210163132.2919935-1-armbru@redhat.com>
References: <20201210163132.2919935-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

device-list-properties reports

    Parameter 'typename' expects device

when @typename exists, but isn't a TYPE_DEVICE.  Improve this to

    Parameter 'typename' expects a non-abstract device type

qom-list-properties reports

    Parameter 'typename' expects object

when @typename exists, but isn't a TYPE_OBJECT.  Improve this to

    Parameter 'typename' expects a QOM type

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201113082626.2725812-10-armbru@redhat.com>
---
 qom/qom-qmp-cmds.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/qom/qom-qmp-cmds.c b/qom/qom-qmp-cmds.c
index 310ab2d048..2dd233f293 100644
--- a/qom/qom-qmp-cmds.c
+++ b/qom/qom-qmp-cmds.c
@@ -138,15 +138,10 @@ ObjectPropertyInfoList *qmp_device_list_properties(const char *typename,
         return NULL;
     }
 
-    klass = object_class_dynamic_cast(klass, TYPE_DEVICE);
-    if (klass == NULL) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "typename", TYPE_DEVICE);
-        return NULL;
-    }
-
-    if (object_class_is_abstract(klass)) {
+    if (!object_class_dynamic_cast(klass, TYPE_DEVICE)
+        || object_class_is_abstract(klass)) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "typename",
-                   "non-abstract device type");
+                   "a non-abstract device type");
         return NULL;
     }
 
@@ -208,9 +203,9 @@ ObjectPropertyInfoList *qmp_qom_list_properties(const char *typename,
         return NULL;
     }
 
-    klass = object_class_dynamic_cast(klass, TYPE_OBJECT);
-    if (klass == NULL) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "typename", TYPE_OBJECT);
+    if (!object_class_dynamic_cast(klass, TYPE_OBJECT)) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "typename",
+                   "a QOM type");
         return NULL;
     }
 
-- 
2.26.2


