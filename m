Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AD153C5BC
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 09:07:41 +0200 (CEST)
Received: from localhost ([::1]:38310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx1PI-0001RW-GJ
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 03:07:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nx1HU-0005g8-Dr
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 02:59:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nx1HS-0003LM-Vm
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 02:59:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654239574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r5bcGBvLaUmdTRJRcSD2ZBtxrphhpjSjepeJdlSaS3o=;
 b=H40p0OXLT9p6Vw+unRwXtQ3lFLw0wRzdzZatbUfT36r0i8KDjcCb3QJsPfMP8UqMsEK+Uq
 C1fuaBEgvImBHEffRNVYTNM8uyyA0kridMXxHvTtBUYHU6G+ex7EAO8+63Z0oBNpZwVjjq
 WVdbCxtLzF5NV0/sFlVYT7uNwX9VIgY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-W0m8mjcmOMOHyAugJWL2KQ-1; Fri, 03 Jun 2022 02:59:30 -0400
X-MC-Unique: W0m8mjcmOMOHyAugJWL2KQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF5951C06EDD;
 Fri,  3 Jun 2022 06:59:29 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C2BB2166B26;
 Fri,  3 Jun 2022 06:59:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 09/12] tests/qtest: use g_autofree for test_server_create_chr
Date: Fri,  3 Jun 2022 08:59:02 +0200
Message-Id: <20220603065905.23805-10-thuth@redhat.com>
In-Reply-To: <20220603065905.23805-1-thuth@redhat.com>
References: <20220603065905.23805-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220524154056.2896913-12-alex.bennee@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/vhost-user-test.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index a2cec87684..8bf390be20 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -524,14 +524,13 @@ static void chr_event(void *opaque, QEMUChrEvent event)
 
 static void test_server_create_chr(TestServer *server, const gchar *opt)
 {
-    gchar *chr_path;
+    g_autofree gchar *chr_path = g_strdup_printf("unix:%s%s",
+                                                 server->socket_path, opt);
     Chardev *chr;
 
-    chr_path = g_strdup_printf("unix:%s%s", server->socket_path, opt);
     chr = qemu_chr_new(server->chr_name, chr_path, server->context);
-    g_free(chr_path);
+    g_assert(chr);
 
-    g_assert_nonnull(chr);
     qemu_chr_fe_init(&server->chr, chr, &error_abort);
     qemu_chr_fe_set_handlers(&server->chr, chr_can_read, chr_read,
                              chr_event, NULL, server, server->context, true);
-- 
2.31.1


