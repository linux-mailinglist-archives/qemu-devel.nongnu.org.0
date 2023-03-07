Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2776ADD2E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:23:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVOh-0002uR-0J; Tue, 07 Mar 2023 06:22:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZVOf-0002uI-88
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:22:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZVOd-0004MK-PS
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:22:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678188138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YblXOyqD/mKjhVbFhRUL+Mwptw2cqLU0oWaGgByQrx0=;
 b=Na6BpuPjUgAm5lKFLUjM+MtnmtYsj85VQob6ebGtzHwDsrgGB7X56MDOsmrj8mHdp/503S
 7nxRNbeO4lRmqFrfMS4C7352pz1QRwSn/3Nngsb+bcnxXEbsMlw5ZxkW7yZl2tHQ8hA+Au
 Ywu9DMEA+cs9ECl/t3mhJxewvjCUkRM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-k0Uu2_stNP6DqyZu1brygA-1; Tue, 07 Mar 2023 06:22:17 -0500
X-MC-Unique: k0Uu2_stNP6DqyZu1brygA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4C7885A5A3;
 Tue,  7 Mar 2023 11:22:16 +0000 (UTC)
Received: from localhost (unknown [10.39.208.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FC8F2026D4B;
 Tue,  7 Mar 2023 11:22:15 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH] qapi: give available enum values in error string
Date: Tue,  7 Mar 2023 15:22:11 +0400
Message-Id: <20230307112212.2437449-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124;
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
qemu-system-x86_64: -display egl-headless,gl=help: Parameter 'gl' does
not accept value '' (available: 'off', 'on', 'core', 'es')

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qapi/util.h             |  1 +
 qapi/qapi-util.c                | 15 +++++++++++++++
 qapi/qapi-visit-core.c          |  7 +++++--
 tests/unit/check-qom-proplist.c |  4 ++--
 4 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/include/qapi/util.h b/include/qapi/util.h
index 81a2b13a33..a5363e595d 100644
--- a/include/qapi/util.h
+++ b/include/qapi/util.h
@@ -23,6 +23,7 @@ typedef struct QEnumLookup {
 } QEnumLookup;
 
 const char *qapi_enum_lookup(const QEnumLookup *lookup, int val);
+char *qapi_enum_available(const QEnumLookup *lookup);
 int qapi_enum_parse(const QEnumLookup *lookup, const char *buf,
                     int def, Error **errp);
 bool qapi_bool_parse(const char *name, const char *value, bool *obj,
diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
index 63596e11c5..19ba4b695a 100644
--- a/qapi/qapi-util.c
+++ b/qapi/qapi-util.c
@@ -84,6 +84,21 @@ int qapi_enum_parse(const QEnumLookup *lookup, const char *buf,
     return def;
 }
 
+char *qapi_enum_available(const QEnumLookup *lookup)
+{
+    int i;
+    GString *str = g_string_new(NULL);
+
+    for (i = 0; i < lookup->size; i++) {
+        g_string_append_printf(str, "'%s'", lookup->array[i]);
+        if (i + 1 < lookup->size) {
+            g_string_append(str, ", ");
+        }
+    }
+
+    return g_string_free(str, FALSE);
+}
+
 bool qapi_bool_parse(const char *name, const char *value, bool *obj, Error **errp)
 {
     if (g_str_equal(value, "on") ||
diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c
index 6c13510a2b..b887cbf3fd 100644
--- a/qapi/qapi-visit-core.c
+++ b/qapi/qapi-visit-core.c
@@ -404,8 +404,11 @@ static bool input_type_enum(Visitor *v, const char *name, int *obj,
 
     value = qapi_enum_parse(lookup, enum_str, -1, NULL);
     if (value < 0) {
-        error_setg(errp, "Parameter '%s' does not accept value '%s'",
-                   name ? name : "null", enum_str);
+        g_autofree char *avail = NULL;
+
+        avail = qapi_enum_available(lookup);
+        error_setg(errp, "Parameter '%s' does not accept value '%s' (available: %s)",
+                   name ? name : "null", enum_str, avail);
         return false;
     }
 
diff --git a/tests/unit/check-qom-proplist.c b/tests/unit/check-qom-proplist.c
index 79d4a8b89d..eb0b215abb 100644
--- a/tests/unit/check-qom-proplist.c
+++ b/tests/unit/check-qom-proplist.c
@@ -488,8 +488,8 @@ static void test_dummy_badenum(void)
 
     g_assert(dobj == NULL);
     g_assert(err != NULL);
-    g_assert_cmpstr(error_get_pretty(err), ==,
-                    "Parameter 'av' does not accept value 'yeti'");
+    g_assert_nonnull(strstr(error_get_pretty(err),
+                            "Parameter 'av' does not accept value 'yeti'"));
 
     g_assert(object_resolve_path_component(parent, "dummy0")
              == NULL);
-- 
2.39.2


