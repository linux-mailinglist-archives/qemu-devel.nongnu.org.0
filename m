Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E516F4393
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:19:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptouw-0003mR-3w; Tue, 02 May 2023 08:15:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouY-0003lE-1d
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:14 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouT-00031y-Jq
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:13 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f19b9d5358so36974685e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683029705; x=1685621705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hQRtEL2yOF+gX1Dx6uIdFX10KIzBDzIucA+sbtcDAuc=;
 b=b9eQt9sQDcyCw9dr+rBWWJMT1TCnL8irKOujJINs4V5N8lOFJ5tQJph/jhKObN0/pg
 Biqg/p8MVa/mjuSElcv3hKw8DdqA2YOzedhC90oUXRwss7slz7tAHUlteRA6ODpprqpw
 C7CHluczx9BChZqSdEZNwJ6nu4vHsw2eHAyLcV3j0+vsPu7woGCFypCDa5YvaKv09jU4
 HT73Xn2Mhjju74ZAstAzHu4S4P0wVD7fz1T4nbfxheOvhNlnp3zHQH3T4FX03b4JVGRc
 E54t0XKkJ6nG8HSugK1G1NgrjaHG1KZtkMy3XtkWCfGjuTaAVmLlEqwjFyDi8vl73vlp
 afYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683029705; x=1685621705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hQRtEL2yOF+gX1Dx6uIdFX10KIzBDzIucA+sbtcDAuc=;
 b=M6uHRgQhiw+djShEt8YuyBhvMo4C24E4Ue1yceGQiVoy00/8cYnYHII0+CNIqXb/nX
 MBz3ZmCUvtLw9KrkgSHEK2VuVvIEGBFacF+HqivjCTQva9056u/0LozHTpchg9Cbr1Pz
 wbu+yfIM1+Cc1sOtJGpSjZpbn8aTG0lzFI4DQvDlawy1GHPfvE4OxfjEuIUE+Vbzdc6p
 UeQUT105n4C2m/mFViOFPIzZcrb9P6uW1M2zc3pv0DqtFAt4CKm1pSGj/wplIkq8w+gB
 lPJDgqkFZjH7Rn/vcnKsvETAVVFgJ/42FttPyGue8Lo6sZPa3s3qifV7oEjeFrOKvY6W
 Bfsg==
X-Gm-Message-State: AC+VfDzNg9s1YfEuRqJAeu3PCDQq8KG6JVfztZMHkUb8/HNZiSB2lcqg
 CIfUH+vCmtiwVdYFeDZ168S3RcgLNJ+OzlChH4s=
X-Google-Smtp-Source: ACHHUZ5MUdCiTY+o8XEGckZLUadJv8iRaV8s76yIgX1utbYg0RADgF0oeSoOI/19Elwram1S3QSu9g==
X-Received: by 2002:a7b:c8cb:0:b0:3f1:929f:60db with SMTP id
 f11-20020a7bc8cb000000b003f1929f60dbmr12199562wml.39.1683029705397; 
 Tue, 02 May 2023 05:15:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm35040330wmk.20.2023.05.02.05.15.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:15:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/35] tests/avocado: Pass parameters to migration test
Date: Tue,  2 May 2023 13:14:33 +0100
Message-Id: <20230502121459.2422303-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502121459.2422303-1-peter.maydell@linaro.org>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Fabiano Rosas <farosas@suse.de>

The migration tests are currently broken for an aarch64 host because
the tests pass no 'machine' and 'cpu' options on the QEMU command
line.

Add a separate class to each architecture so that we can specify
'machine' and 'cpu' options instead of relying on defaults.

Add a skip decorator to keep the current behavior of only running
migration tests when the qemu target matches the host architecture.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Message-id: 20230426180013.14814-10-farosas@suse.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/avocado/migration.py | 83 +++++++++++++++++++++++++++++++++++---
 1 file changed, 78 insertions(+), 5 deletions(-)

diff --git a/tests/avocado/migration.py b/tests/avocado/migration.py
index 4b25680c50f..8b2ec0e3c4e 100644
--- a/tests/avocado/migration.py
+++ b/tests/avocado/migration.py
@@ -11,6 +11,8 @@
 
 
 import tempfile
+import os
+
 from avocado_qemu import QemuSystemTest
 from avocado import skipUnless
 
@@ -19,7 +21,7 @@
 from avocado.utils.path import find_command
 
 
-class Migration(QemuSystemTest):
+class MigrationTest(QemuSystemTest):
     """
     :avocado: tags=migration
     """
@@ -62,20 +64,91 @@ def _get_free_port(self):
             self.cancel('Failed to find a free port')
         return port
 
-
-    def test_migration_with_tcp_localhost(self):
+    def migration_with_tcp_localhost(self):
         dest_uri = 'tcp:localhost:%u' % self._get_free_port()
         self.do_migrate(dest_uri)
 
-    def test_migration_with_unix(self):
+    def migration_with_unix(self):
         with tempfile.TemporaryDirectory(prefix='socket_') as socket_path:
             dest_uri = 'unix:%s/qemu-test.sock' % socket_path
             self.do_migrate(dest_uri)
 
     @skipUnless(find_command('nc', default=False), "'nc' command not found")
-    def test_migration_with_exec(self):
+    def migration_with_exec(self):
         """The test works for both netcat-traditional and netcat-openbsd packages."""
         free_port = self._get_free_port()
         dest_uri = 'exec:nc -l localhost %u' % free_port
         src_uri = 'exec:nc localhost %u' % free_port
         self.do_migrate(dest_uri, src_uri)
+
+
+@skipUnless('aarch64' in os.uname()[4], "host != target")
+class Aarch64(MigrationTest):
+    """
+    :avocado: tags=arch:aarch64
+    :avocado: tags=machine:virt
+    :avocado: tags=cpu:max
+    """
+
+    def test_migration_with_tcp_localhost(self):
+        self.migration_with_tcp_localhost()
+
+    def test_migration_with_unix(self):
+        self.migration_with_unix()
+
+    def test_migration_with_exec(self):
+        self.migration_with_exec()
+
+
+@skipUnless('x86_64' in os.uname()[4], "host != target")
+class X86_64(MigrationTest):
+    """
+    :avocado: tags=arch:x86_64
+    :avocado: tags=machine:pc
+    :avocado: tags=cpu:qemu64
+    """
+
+    def test_migration_with_tcp_localhost(self):
+        self.migration_with_tcp_localhost()
+
+    def test_migration_with_unix(self):
+        self.migration_with_unix()
+
+    def test_migration_with_exec(self):
+        self.migration_with_exec()
+
+
+@skipUnless('ppc64le' in os.uname()[4], "host != target")
+class PPC64(MigrationTest):
+    """
+    :avocado: tags=arch:ppc64
+    :avocado: tags=machine:pseries
+    :avocado: tags=cpu:power9_v2.0
+    """
+
+    def test_migration_with_tcp_localhost(self):
+        self.migration_with_tcp_localhost()
+
+    def test_migration_with_unix(self):
+        self.migration_with_unix()
+
+    def test_migration_with_exec(self):
+        self.migration_with_exec()
+
+
+@skipUnless('s390x' in os.uname()[4], "host != target")
+class S390X(MigrationTest):
+    """
+    :avocado: tags=arch:s390x
+    :avocado: tags=machine:s390-ccw-virtio
+    :avocado: tags=cpu:qemu
+    """
+
+    def test_migration_with_tcp_localhost(self):
+        self.migration_with_tcp_localhost()
+
+    def test_migration_with_unix(self):
+        self.migration_with_unix()
+
+    def test_migration_with_exec(self):
+        self.migration_with_exec()
-- 
2.34.1


