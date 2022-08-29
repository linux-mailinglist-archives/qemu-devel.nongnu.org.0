Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E045A4B91
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 14:23:48 +0200 (CEST)
Received: from localhost ([::1]:39920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSdnp-0003XV-BN
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 08:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oSdk9-0001Mp-PY
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 08:19:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oSdk4-0003i1-Et
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 08:19:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661775587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=e8FBC/8nTzHUfU7MAS7VxgdlRDVbGqlt7GwD2njbvmM=;
 b=E7oILLjA03tFGsoYudSNJd2hVFIcOY9KmR2W2t3fJ90YON9Q9rcXEsl007a6dKt4wiwFK0
 1r+I+XUtLL8Ch71s5d6F92YMMlRtHAUAUMWf48soWY8k0rm1rhQfe9VdVUSP1dKuhhfnFt
 ByG31uUeNPkde3x34gnYJJPYQFYrcrw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-HRzRClKDMMa7IwVGuwm1sw-1; Mon, 29 Aug 2022 08:19:43 -0400
X-MC-Unique: HRzRClKDMMa7IwVGuwm1sw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A552F1C14B66;
 Mon, 29 Aug 2022 12:19:43 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71926C15BB3;
 Mon, 29 Aug 2022 12:19:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH] tests/avocado/migration: Get find_free_port() from the ports
Date: Mon, 29 Aug 2022 14:19:39 +0200
Message-Id: <20220829121939.209329-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

In upstream Avocado, the find_free_port() function is not available
from "network" anymore, but must be used via "ports", see:

 https://github.com/avocado-framework/avocado/commit/22fc98c6ff76cc55c48

To be able to update to a newer Avocado version later, let's use
the new way for accessing the find_free_port() function here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/migration.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/avocado/migration.py b/tests/avocado/migration.py
index 584d6ef53f..4b25680c50 100644
--- a/tests/avocado/migration.py
+++ b/tests/avocado/migration.py
@@ -14,7 +14,7 @@
 from avocado_qemu import QemuSystemTest
 from avocado import skipUnless
 
-from avocado.utils import network
+from avocado.utils.network import ports
 from avocado.utils import wait
 from avocado.utils.path import find_command
 
@@ -57,7 +57,7 @@ def do_migrate(self, dest_uri, src_uri=None):
         self.assert_migration(source_vm, dest_vm)
 
     def _get_free_port(self):
-        port = network.find_free_port()
+        port = ports.find_free_port()
         if port is None:
             self.cancel('Failed to find a free port')
         return port
-- 
2.31.1


