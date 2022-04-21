Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F144750A71A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:29:01 +0200 (CEST)
Received: from localhost ([::1]:35930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhac1-0001L0-4B
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhZrU-0007bM-Qh
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:40:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhZrS-00031x-Ot
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:40:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650559254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e9FTh4vfv/GgbNQswxIE8TxUTsMT5oPy9yAbKIDSzqM=;
 b=A1tKBnRp85UZFisHQ+PIJAIQF1JYej5B00xmZq9RFTxJ0M1Cbtnx8ujB0sqVpPtrLwgse8
 sYvUNWPPdtJQvbRmQKqc4SeKqGfYs4yUR7tdp2QJRk6A7fiAdvz37YUJqW03dKbWCacH7W
 /ZyaHY2RTt2JXlTWTxFw3L4Rp3i7BEY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169--WBq93zNO9qKB8boRb7HOw-1; Thu, 21 Apr 2022 12:40:52 -0400
X-MC-Unique: -WBq93zNO9qKB8boRb7HOw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E80786B8A1
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 16:40:52 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A925640D016E;
 Thu, 21 Apr 2022 16:40:51 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	peterx@redhat.com,
	berrange@redhat.com
Subject: [PULL 02/18] tests: support QTEST_TRACE env variable
Date: Thu, 21 Apr 2022 17:40:27 +0100
Message-Id: <20220421164043.209703-3-dgilbert@redhat.com>
In-Reply-To: <20220421164043.209703-1-dgilbert@redhat.com>
References: <20220421164043.209703-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

When debugging failing qtests it is useful to be able to turn on trace
output to stderr. The QTEST_TRACE env variable contents get injected
as a '-trace <str>' command line arg

Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220310171821.3724080-4-berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tests/qtest/libqtest.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 7b5890dcc4..ac89b80d11 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -259,6 +259,9 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
     gchar *qmp_socket_path;
     gchar *command;
     const char *qemu_binary = qtest_qemu_binary();
+    const char *trace = g_getenv("QTEST_TRACE");
+    g_autofree char *tracearg = trace ?
+        g_strdup_printf("-trace %s ", trace) : g_strdup("");
 
     s = g_new(QTestState, 1);
 
@@ -281,14 +284,15 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
 
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
2.35.1


