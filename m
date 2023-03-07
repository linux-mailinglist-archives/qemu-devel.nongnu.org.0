Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D836AE383
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:59:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYmS-0002Xs-Aq; Tue, 07 Mar 2023 09:59:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZYmJ-0002St-IN
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:59:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZYm2-0004oq-6h
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:58:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678201116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iRHp56z2GnSurZMklSd8OPIgMtRc3/2Sm2OHRWzboeY=;
 b=et8WLeOaYuscxmmhQfJuehDXAFE3MWltuv3P1yNcYZJElfH3/RIgpDOEqEnt4tfNCeSqD2
 BDdYrYH1BhbUlRmXNl0aQ35Na5Wbztvu6rEh0JsUesgJSFuBx5USQsHv+rBa4aTj6Q7Gcm
 FhW/A89zSg1jqD7RxvCIWJCn+39gf/M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-_vgpzzmWNKKnt6jwwoUh7w-1; Tue, 07 Mar 2023 09:58:30 -0500
X-MC-Unique: _vgpzzmWNKKnt6jwwoUh7w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 967A91C05134;
 Tue,  7 Mar 2023 14:58:30 +0000 (UTC)
Received: from localhost (unknown [10.39.208.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6505D2026D4B;
 Tue,  7 Mar 2023 14:58:28 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Subject: [PATCH v3] qapi: give available enum values as error hint
Date: Tue,  7 Mar 2023 18:58:25 +0400
Message-Id: <20230307145825.2544850-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This allows for a more pleasant user experience.

Before:
$ ./qemu-system-x86_64 -display egl-headless,gl=
qemu-system-x86_64: -display egl-headless,gl=: Parameter 'gl' does not accept value ''

After:
$ ./qemu-system-x86_64 -display egl-headless,gl=
qemu-system-x86_64: -display egl-headless,gl=: Parameter 'gl' does not accept value ''
Acceptable values are 'off', 'on', 'core', 'es'

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qapi/qapi-visit-core.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c
index 6c13510a2b..7468b8c7b8 100644
--- a/qapi/qapi-visit-core.c
+++ b/qapi/qapi-visit-core.c
@@ -392,9 +392,25 @@ static bool output_type_enum(Visitor *v, const char *name, int *obj,
     return visit_type_str(v, name, &enum_str, errp);
 }
 
+static void error_append_qapi_enum_hint(Error *const *errp, const QEnumLookup *lookup)
+{
+    int i;
+
+    error_append_hint(errp, "Acceptable values are ");
+    for (i = 0; i < lookup->size; i++) {
+        error_append_hint(errp, "'%s'", lookup->array[i]);
+        if (i + 1 < lookup->size) {
+            error_append_hint(errp, ", ");
+        }
+    }
+    error_append_hint(errp, "\n");
+}
+
+
 static bool input_type_enum(Visitor *v, const char *name, int *obj,
                             const QEnumLookup *lookup, Error **errp)
 {
+    ERRP_GUARD();
     int64_t value;
     g_autofree char *enum_str = NULL;
 
@@ -406,6 +422,7 @@ static bool input_type_enum(Visitor *v, const char *name, int *obj,
     if (value < 0) {
         error_setg(errp, "Parameter '%s' does not accept value '%s'",
                    name ? name : "null", enum_str);
+        error_append_qapi_enum_hint(errp, lookup);
         return false;
     }
 
-- 
2.39.2


