Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBC66AE01B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 14:15:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZX9U-0003SU-Pm; Tue, 07 Mar 2023 08:14:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZX9R-0003K0-Ba
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:14:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZX9P-0000RQ-K1
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:14:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678194879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mz+GYLR5HMh4DqMM7no2jkMwl/zSjzddevZkTCY7uKY=;
 b=iijfnsOBWfEgDqf/blUbmEWLIWtU77pd9VIoEn+IdMgofM5eM0Xl8v9wHUd6lWBtAJOgvi
 7OBMNNcqEi97kuX5P/nx4Ir2o5SplXMMgEMLk8TfAJLBx0WCD2YjuHc/Xmm59/X6WaE+Id
 +BF3u0HaE76bINpRLRlQ8CmV0bl1gqQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-pMVcPFwKNDiwOQsOoXxEBA-1; Tue, 07 Mar 2023 08:14:38 -0500
X-MC-Unique: pMVcPFwKNDiwOQsOoXxEBA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2731585A588;
 Tue,  7 Mar 2023 13:14:38 +0000 (UTC)
Received: from localhost (unknown [10.39.208.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 664ED1121314;
 Tue,  7 Mar 2023 13:14:36 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Subject: [PATCH v2] qapi: give available enum values as error hint
Date: Tue,  7 Mar 2023 17:14:34 +0400
Message-Id: <20230307131434.2509895-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
Available: 'off', 'on', 'core', 'es'

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qapi/qapi-visit-core.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c
index 6c13510a2b..45e39ff533 100644
--- a/qapi/qapi-visit-core.c
+++ b/qapi/qapi-visit-core.c
@@ -392,9 +392,25 @@ static bool output_type_enum(Visitor *v, const char *name, int *obj,
     return visit_type_str(v, name, &enum_str, errp);
 }
 
+static void error_append_qapi_enum_hint(Error **errp, const QEnumLookup *lookup)
+{
+    int i;
+
+    error_append_hint(errp, "Available: ");
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


