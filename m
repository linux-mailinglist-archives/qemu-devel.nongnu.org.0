Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E82757E14D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 14:09:49 +0200 (CEST)
Received: from localhost ([::1]:54446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oErTY-0001ud-H8
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 08:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oErMq-00005s-5b
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 08:02:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oErMY-0006Ge-CU
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 08:02:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658491353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cNAt/9TDvnyc4cJsVRTDTFKEjNfm6Z39yfisBfBlPfc=;
 b=RJK7nz5Nlg8beBDctt9OeZOX4Ea3uauFff1lu6iFelZeDYr2PBWuqTUIQv4fyMto46AOf8
 LWelxN+yQDSp9oYfkK8U3TBM2dZ/UAhajwu78i2V1icZcRYpWf/43vnyECKK3GwFzeQEcz
 Ou912WezQh6UIc1didvice7RT3oA9Ts=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-aiMkO4ZsPu-hH_qJfTdNiA-1; Fri, 22 Jul 2022 08:02:30 -0400
X-MC-Unique: aiMkO4ZsPu-hH_qJfTdNiA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF90E381078F;
 Fri, 22 Jul 2022 12:02:29 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA6201121314;
 Fri, 22 Jul 2022 12:02:28 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-arm@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 2/3] target/s390x: display deprecation status in '-cpu help'
Date: Fri, 22 Jul 2022 13:02:23 +0100
Message-Id: <20220722120224.2311982-3-berrange@redhat.com>
In-Reply-To: <20220722120224.2311982-1-berrange@redhat.com>
References: <20220722120224.2311982-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the user queries CPU models via QMP there is a 'deprecated' flag
present, however, this is not done for the CLI '-cpu help' command.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/s390x/cpu_models.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 1a562d2801..c3a4f80633 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -334,18 +334,31 @@ const S390CPUDef *s390_find_cpu_def(uint16_t type, uint8_t gen, uint8_t ec_ga,
 static void s390_print_cpu_model_list_entry(gpointer data, gpointer user_data)
 {
     const S390CPUClass *scc = S390_CPU_CLASS((ObjectClass *)data);
+    CPUClass *cc = CPU_CLASS(scc);
     char *name = g_strdup(object_class_get_name((ObjectClass *)data));
-    const char *details = "";
+    g_autoptr(GString) details = g_string_new("");
 
     if (scc->is_static) {
-        details = "(static, migration-safe)";
-    } else if (scc->is_migration_safe) {
-        details = "(migration-safe)";
+        g_string_append(details, "static, ");
+    }
+    if (scc->is_migration_safe) {
+        g_string_append(details, "migration-safe, ");
+    }
+    if (cc->deprecation_note) {
+        g_string_append(details, "deprecated, ");
+    }
+    if (details->len) {
+        /* cull trailing ', ' */
+        g_string_truncate(details, details->len - 2);
     }
 
     /* strip off the -s390x-cpu */
     g_strrstr(name, "-" TYPE_S390_CPU)[0] = 0;
-    qemu_printf("s390 %-15s %-35s %s\n", name, scc->desc, details);
+    if (details->len) {
+        qemu_printf("s390 %-15s %-35s (%s)\n", name, scc->desc, details->str);
+    } else {
+        qemu_printf("s390 %-15s %-35s\n", name, scc->desc);
+    }
     g_free(name);
 }
 
-- 
2.36.1


