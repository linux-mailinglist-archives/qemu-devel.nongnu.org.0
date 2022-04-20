Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2B6508AD5
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:32:52 +0200 (CEST)
Received: from localhost ([::1]:40274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBNz-00047q-R8
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:32:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAPl-0002X7-MG
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:30:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAPf-0005Jn-8S
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:30:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650461429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eUNI1XSAV5gX/R+KaqJZeNj9KrNAvJgjl6B4P+47rcI=;
 b=J0uI27VevBZhFvXePaqYTYcpAC7jNZUq2ec7gUh9Ztsgpu1hlFIgjEzOHHsLY+zOfCCQud
 agVENJ7gVknn573TpGBM4JO3z8jCRk1uPVWlnOLP7/gbKtTGKXtaf0+utlgUVg0HL8En50
 B30K+zjNv1erY9la5XXKm41g1vMeaS0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-JBvctNCUPpWCqzZ4EM_k_w-1; Wed, 20 Apr 2022 09:30:25 -0400
X-MC-Unique: JBvctNCUPpWCqzZ4EM_k_w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 768E186B8A3
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 13:30:25 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2128357233C;
 Wed, 20 Apr 2022 13:30:23 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 33/41] tests: move libqtest.c under libqos/
Date: Wed, 20 Apr 2022 17:26:16 +0400
Message-Id: <20220420132624.2439741-34-marcandre.lureau@redhat.com>
In-Reply-To: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Since commit a2ce7dbd917 ("meson: convert tests/qtest to meson"),
libqtest.h is under libqos/ directory. Let's move the .c along with it.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 docs/devel/qtest.rst                | 4 ++--
 tests/qtest/{ => libqos}/libqtest.c | 4 ++--
 tests/qtest/libqos/meson.build      | 2 +-
 tests/unit/meson.build              | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename tests/qtest/{ => libqos}/libqtest.c (99%)

diff --git a/docs/devel/qtest.rst b/docs/devel/qtest.rst
index c3dceb6c8a1d..a9a6b0a7466b 100644
--- a/docs/devel/qtest.rst
+++ b/docs/devel/qtest.rst
@@ -18,8 +18,8 @@ QTest cases can be executed with
 
    make check-qtest
 
-The QTest library is implemented by ``tests/qtest/libqtest.c`` and the API is
-defined in ``tests/qtest/libqtest.h``.
+The QTest library is implemented by ``tests/qtest/libqos/libqtest.c`` and the API is
+defined in ``tests/qtest/libqos/libqtest.h``.
 
 Consider adding a new QTest case when you are introducing a new virtual
 hardware, or extending one if you are adding functionalities to an existing
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqos/libqtest.c
similarity index 99%
rename from tests/qtest/libqtest.c
rename to tests/qtest/libqos/libqtest.c
index 2b9bdb947d6f..9097329ce435 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqos/libqtest.c
@@ -20,7 +20,7 @@
 #include <sys/wait.h>
 #include <sys/un.h>
 
-#include "libqos/libqtest.h"
+#include "libqtest.h"
 #include "qemu/ctype.h"
 #include "qemu/cutils.h"
 #include "qapi/error.h"
@@ -268,7 +268,7 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
     /* It's possible that if an earlier test run crashed it might
      * have left a stale unix socket lying around. Delete any
      * stale old socket to avoid spurious test failures with
-     * tests/libqtest.c:70:init_socket: assertion failed (ret != -1): (-1 != -1)
+     * libqtest.c:70:init_socket: assertion failed (ret != -1): (-1 != -1)
      */
     unlink(socket_path);
     unlink(qmp_socket_path);
diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.build
index e988d1579172..0c172f27533a 100644
--- a/tests/qtest/libqos/meson.build
+++ b/tests/qtest/libqos/meson.build
@@ -1,4 +1,4 @@
-libqos_srcs = files('../libqtest.c',
+libqos_srcs = files('libqtest.c',
         'qgraph.c',
         'qos_external.c',
         'pci.c',
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index ab01e00f12cf..188b0ea80c37 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -154,7 +154,7 @@ if have_system
 endif
 
 if have_ga and targetos == 'linux'
-  tests += {'test-qga': ['../qtest/libqtest.c']}
+  tests += {'test-qga': ['../qtest/libqos/libqtest.c']}
   test_deps += {'test-qga': qga}
 endif
 
-- 
2.35.1.693.g805e0a68082a


