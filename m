Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CD865BEB6
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 12:11:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCfAY-0006M2-OX; Tue, 03 Jan 2023 06:09:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pCfAS-0006KD-Co
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 06:09:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pCfAQ-0005IP-SS
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 06:09:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672744154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jQ9LtivY9CR5RPIbb7tTsm7r9crWb6ab4EdtyVrUrxE=;
 b=F470SJy1Igh/jjelOV0ABzYCfokhSX5PW2iu5yHktf5sdk0sUfAwMGsG9q1u6uioedZ+Cg
 rGxKaz8PdUVQTlt73bAS+7e/LzWXhbCDXGxR0f0ii/dxUnG4l6G8avPZsCm1w/R+7ZEZJZ
 slTKToHMJ0uiATC8TsA/EiOHGsDgqnU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-goScLYm5PB20lzsaDT4X4A-1; Tue, 03 Jan 2023 06:09:10 -0500
X-MC-Unique: goScLYm5PB20lzsaDT4X4A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 430CA3810781;
 Tue,  3 Jan 2023 11:09:10 +0000 (UTC)
Received: from localhost (unknown [10.39.208.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0DC82026D4B;
 Tue,  3 Jan 2023 11:09:08 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 10/10] qtest: enable vnc-display test on win32
Date: Tue,  3 Jan 2023 15:08:14 +0400
Message-Id: <20230103110814.3726795-11-marcandre.lureau@redhat.com>
In-Reply-To: <20230103110814.3726795-1-marcandre.lureau@redhat.com>
References: <20230103110814.3726795-1-marcandre.lureau@redhat.com>
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

Now that qtest_qmp_add_client() works on win32, we can enable the VNC
test.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/qtest/vnc-display-test.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tests/qtest/vnc-display-test.c b/tests/qtest/vnc-display-test.c
index e2a9d682bb..2997edc6ec 100644
--- a/tests/qtest/vnc-display-test.c
+++ b/tests/qtest/vnc-display-test.c
@@ -34,10 +34,6 @@ static void on_vnc_auth_failure(VncConnection *self,
 static bool
 test_setup(Test *test)
 {
-#ifdef WIN32
-    g_test_skip("Not supported on Windows yet");
-    return false;
-#else
     int pair[2];
 
     test->qts = qtest_init("-vnc none -name vnc-test");
@@ -56,7 +52,6 @@ test_setup(Test *test)
 
     test->loop = g_main_loop_new(NULL, FALSE);
     return true;
-#endif
 }
 
 static void
-- 
2.39.0


