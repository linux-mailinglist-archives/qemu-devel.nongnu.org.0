Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B71C84028D3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 14:31:57 +0200 (CEST)
Received: from localhost ([::1]:54066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNaGa-0005EL-Pn
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 08:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa6d-0008S2-NY
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:21:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa6c-0006vz-6S
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:21:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631017297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yhb2wO8zV56juJYIJDnx8N/SZLKEAf3mSq3zq9xR3OM=;
 b=XBM1+rV7bS1VjI4pQT2FkOTk10uvT4X++ArK4PQKW7dj9TUjeKUkKok4QU80+DVYJAzu1R
 FZwpdf+ALsAoY7AcDmiz5mmuMPXyZvgIFunQtVz4Bw467xFVFv9E1jXB1xFo//vxh7JrvB
 H/t3O/oni8H95PeAm5zxe+msXrMTnCM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-iLhSaF51OOq8_chk8L5bow-1; Tue, 07 Sep 2021 08:21:36 -0400
X-MC-Unique: iLhSaF51OOq8_chk8L5bow-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEDAB107ACFE
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 12:21:35 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6919660657;
 Tue,  7 Sep 2021 12:21:27 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [RFC v3 08/32] tests: build qapi-cabi (C ABI dump)
Date: Tue,  7 Sep 2021 16:19:19 +0400
Message-Id: <20210907121943.3498701-9-marcandre.lureau@redhat.com>
In-Reply-To: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/qapi-cabi.c |  9 +++++++++
 tests/meson.build | 13 +++++++++++--
 2 files changed, 20 insertions(+), 2 deletions(-)
 create mode 100644 tests/qapi-cabi.c

diff --git a/tests/qapi-cabi.c b/tests/qapi-cabi.c
new file mode 100644
index 0000000000..2b94edb4ab
--- /dev/null
+++ b/tests/qapi-cabi.c
@@ -0,0 +1,9 @@
+#include "qemu/osdep.h"
+
+#include "test-qapi-types.h"
+
+int main(int argc, char *argv[])
+{
+    qapi_cabi();
+    return 0;
+}
diff --git a/tests/meson.build b/tests/meson.build
index 55a7b08275..be95223d62 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -54,8 +54,17 @@ foreach o: test_qapi_files.to_list() + test_qapi_files_extra.to_list()
   test_qapi_sources += o
 endforeach
 
-libtestqapi = static_library('testqapi', sources: [genh, test_qapi_sources])
-testqapi = declare_dependency(link_with: libtestqapi, sources: [genh, test_qapi_headers])
+libtestqapi = static_library('testqapi',
+                             sources: [genh, test_qapi_sources],
+                             c_args: ['-DQAPI_CABI'])
+testqapi = declare_dependency(link_with: libtestqapi,
+                              dependencies: [qemuutil],
+                              sources: [genh, test_qapi_headers])
+
+executable('qapi-cabi',
+           files('qapi-cabi.c'),
+           dependencies: testqapi,
+           c_args: ['-DQAPI_CABI'])
 
 test_deps = {
   'test-qht-par': qht_bench,
-- 
2.33.0.113.g6c40894d24


