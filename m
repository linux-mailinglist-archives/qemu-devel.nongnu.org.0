Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA292FA6CE
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 17:57:42 +0100 (CET)
Received: from localhost ([::1]:55178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1XqY-00076V-11
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 11:57:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1XRJ-0002Lv-BQ
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:31:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1XRF-0001Ua-M0
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:31:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610987493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+gHfaZ6j/dvuzR7oX/IMeMfZe+RXSB33GfA3YgC1AY4=;
 b=UpG6oLnckxulDezuGSx7dS2M2CnvmFRuQQASR0fbYruIUhIyZjISBMUtF4NZ+f5crdm+jx
 OKp3vgOIIGt6sMrf8uXJeLo5QXZamYDeDBD6eKH8LCA+avLMGTQ8YLcDZltkjqS1dLhH/e
 ltcav0PlFdVGkk5QMti2T8udhpaWy8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-PjsIeL9fOpmgulwuLNu3NQ-1; Mon, 18 Jan 2021 11:31:31 -0500
X-MC-Unique: PjsIeL9fOpmgulwuLNu3NQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59A4A190B2A1
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 16:31:30 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB1B71820E;
 Mon, 18 Jan 2021 16:31:29 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/25] qom: use qemu_printf to print help for user-creatable
 objects
Date: Mon, 18 Jan 2021 11:30:57 -0500
Message-Id: <20210118163113.780171-10-pbonzini@redhat.com>
In-Reply-To: <20210118163113.780171-1-pbonzini@redhat.com>
References: <20210118163113.780171-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is needed when we add help support for object_add.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qom/object_interfaces.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index 1e9ad6f08a..6c7bd025dd 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -12,6 +12,7 @@
 #include "qemu/option.h"
 #include "qapi/opts-visitor.h"
 #include "qemu/config-file.h"
+#include "qemu/qemu-print.h"
 
 bool user_creatable_complete(UserCreatable *uc, Error **errp)
 {
@@ -214,15 +215,15 @@ char *object_property_help(const char *name, const char *type,
     return g_string_free(str, false);
 }
 
-static void user_creatable_print_types(void)
+void user_creatable_print_types(void)
 {
     GSList *l, *list;
 
-    printf("List of user creatable objects:\n");
+    qemu_printf("List of user creatable objects:\n");
     list = object_class_get_list_sorted(TYPE_USER_CREATABLE, false);
     for (l = list; l != NULL; l = l->next) {
         ObjectClass *oc = OBJECT_CLASS(l->data);
-        printf("  %s\n", object_class_get_name(oc));
+        qemu_printf("  %s\n", object_class_get_name(oc));
     }
     g_slist_free(list);
 }
@@ -253,12 +254,12 @@ static bool user_creatable_print_type_properites(const char *type)
     }
     g_ptr_array_sort(array, (GCompareFunc)qemu_pstrcmp0);
     if (array->len > 0) {
-        printf("%s options:\n", type);
+        qemu_printf("%s options:\n", type);
     } else {
-        printf("There are no options for %s.\n", type);
+        qemu_printf("There are no options for %s.\n", type);
     }
     for (i = 0; i < array->len; i++) {
-        printf("%s\n", (char *)array->pdata[i]);
+        qemu_printf("%s\n", (char *)array->pdata[i]);
     }
     g_ptr_array_set_free_func(array, g_free);
     g_ptr_array_free(array, true);
-- 
2.26.2



