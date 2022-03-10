Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F18C64D5023
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 18:23:50 +0100 (CET)
Received: from localhost ([::1]:50734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSMVy-0001Nj-1w
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 12:23:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSMR9-0002CN-Uu
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:18:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSMR8-0003b6-GG
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:18:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646932729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GCEyBD5YlxV7XdLZc3OLxbDhdxUfou5JlvKy43kyl70=;
 b=QsWwG1pnepnbY0bbDx1MnCDakQmhi3IRnEw3zuSIjR7aCo/zrRB46WVMmdDtA8A/FrMW6A
 wFc32ZvkhGkVYfL9R87eltfRTYEbcGi+kxlX7ObmdzhYuou1h7BY5XNdmgyxtoEKLIErbc
 vTUQfBRA4zaEOTpGh/PpuA29va3l670=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-baVOHLQ0OlmU2oMr9jCBnw-1; Thu, 10 Mar 2022 12:18:48 -0500
X-MC-Unique: baVOHLQ0OlmU2oMr9jCBnw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A950F801DDB
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 17:18:47 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF47E105C897;
 Thu, 10 Mar 2022 17:18:42 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/18] tests: support QTEST_TRACE env variable
Date: Thu, 10 Mar 2022 17:18:06 +0000
Message-Id: <20220310171821.3724080-4-berrange@redhat.com>
In-Reply-To: <20220310171821.3724080-1-berrange@redhat.com>
References: <20220310171821.3724080-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When debugging failing qtests it is useful to be able to turn on trace
output to stderr. The QTEST_TRACE env variable contents get injected
as a '-trace <str>' command line arg

Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/libqtest.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 41f4da4e54..a85f8a6d05 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -260,6 +260,9 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
     gchar *qmp_socket_path;
     gchar *command;
     const char *qemu_binary = qtest_qemu_binary();
+    const char *trace = g_getenv("QTEST_TRACE");
+    g_autofree char *tracearg = trace ?
+        g_strdup_printf("-trace %s ", trace) : g_strdup("");
 
     s = g_new(QTestState, 1);
 
@@ -282,14 +285,15 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
 
     qtest_add_abrt_handler(kill_qemu_hook_func, s);
 
-    command = g_strdup_printf("exec %s "
+    command = g_strdup_printf("exec %s %s"
                               "-qtest unix:%s "
                               "-qtest-log %s "
                               "-chardev socket,path=%s,id=char0 "
                               "-mon chardev=char0,mode=control "
                               "-display none "
                               "%s"
-                              " -accel qtest", qemu_binary, socket_path,
+                              " -accel qtest",
+                              qemu_binary, tracearg, socket_path,
                               getenv("QTEST_LOG") ? "/dev/fd/2" : "/dev/null",
                               qmp_socket_path,
                               extra_args ?: "");
-- 
2.34.1


