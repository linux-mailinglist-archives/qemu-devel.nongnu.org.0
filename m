Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11776508A45
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:09:28 +0200 (CEST)
Received: from localhost ([::1]:60622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhB1L-0000c6-52
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAOr-0001EC-I9
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:29:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAOp-0004sz-Sn
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:29:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650461379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KrKn0rrZpTAa/9mQeUymbES4X4XaZ9viio3JFeAwN/o=;
 b=LXryVimCFtVriQ74re99n3HyLoClhi/un6zts3Aaglm5+mtGmp2HTLxBnoNUKL2HvIjFNb
 Q0ermiizooqJydPVU27YKaL9iuObqL241ZkEPaFpNVtpksA/vAfWVtveFC+CCGVzw/Ubar
 6TX8z9Q6vjxHVcYGmbUufE0/al2wjp8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-6mPgszclMC6X5sWIZbIOAA-1; Wed, 20 Apr 2022 09:29:38 -0400
X-MC-Unique: 6mPgszclMC6X5sWIZbIOAA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE7DF180138B;
 Wed, 20 Apr 2022 13:29:37 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C4E9145BA56;
 Wed, 20 Apr 2022 13:29:36 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 29/41] tests: run-time skip test-qga if TSAN is enabled
Date: Wed, 20 Apr 2022 17:26:12 +0400
Message-Id: <20220420132624.2439741-30-marcandre.lureau@redhat.com>
In-Reply-To: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This allows to make sure the test is still built, and gives more
accurate report details.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/unit/test-qga.c  | 7 +++++++
 tests/unit/meson.build | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
index 5cb140d1b53d..e17a288034bc 100644
--- a/tests/unit/test-qga.c
+++ b/tests/unit/test-qga.c
@@ -969,6 +969,13 @@ int main(int argc, char **argv)
     TestFixture fix;
     int ret;
 
+#ifdef QEMU_SANITIZE_THREAD
+    {
+        g_test_skip("tsan enabled, https://github.com/google/sanitizers/issues/1116");
+        return 0;
+    }
+#endif
+
     setlocale (LC_ALL, "");
     g_test_init(&argc, &argv, NULL);
     fixture_setup(&fix, NULL, NULL);
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 026e39f52025..ab01e00f12cf 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -153,7 +153,7 @@ if have_system
   endif
 endif
 
-if have_ga and targetos == 'linux' and 'CONFIG_TSAN' not in config_host
+if have_ga and targetos == 'linux'
   tests += {'test-qga': ['../qtest/libqtest.c']}
   test_deps += {'test-qga': qga}
 endif
-- 
2.35.1.693.g805e0a68082a


