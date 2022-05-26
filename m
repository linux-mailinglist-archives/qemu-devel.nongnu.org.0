Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D5C534770
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 02:20:50 +0200 (CEST)
Received: from localhost ([::1]:53926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu1FB-0007lW-US
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 20:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nu14p-0004M1-8Z
 for qemu-devel@nongnu.org; Wed, 25 May 2022 20:10:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nu14l-0002xe-PQ
 for qemu-devel@nongnu.org; Wed, 25 May 2022 20:10:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653523803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wsN402XJZAoBatZg2kQedJ4YAU8Sr4zCzNOUnTdZ2fo=;
 b=OoXtYlrZab35pL+PptZQqd82jffP3uOYy+EgIr1OAog+wlgnIjbLEEe+leKSXvrRhKwCR/
 uiG8VjH/bZkvUr98fF9kYaqgH6M4ZhWuCJjYAmR8DOXF474t+dCbn/K7vxY6pUtTXBegAl
 RcZ17bmbySBEV17xQG8SwFGpJHHgk9g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-n-ONPIoHNIi3v7W-mP00aA-1; Wed, 25 May 2022 20:09:59 -0400
X-MC-Unique: n-ONPIoHNIi3v7W-mP00aA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76803811E76;
 Thu, 26 May 2022 00:09:59 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73B162166B26;
 Thu, 26 May 2022 00:09:56 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH 9/9] tests: run 'device-crash-test' from tests/venv
Date: Wed, 25 May 2022 20:09:21 -0400
Message-Id: <20220526000921.1581503-10-jsnow@redhat.com>
In-Reply-To: <20220526000921.1581503-1-jsnow@redhat.com>
References: <20220526000921.1581503-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

Remove the sys.path hacking from device-crash-test, and add in a little
user-friendly message for anyone who was used to running this script
directly from the source tree.

Modify the GitLab job recipes to create the tests/venv first, then run
device-crash-test from that venv.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 .gitlab-ci.d/buildtest.yml |  8 +++++---
 scripts/device-crash-test  | 14 +++++++++++---
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index e9620c30748..fde29c35aa3 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -110,7 +110,8 @@ crash-test-debian:
     IMAGE: debian-amd64
   script:
     - cd build
-    - scripts/device-crash-test -q ./qemu-system-i386
+    - make check-venv
+    - tests/venv/bin/python3 scripts/device-crash-test -q ./qemu-system-i386
 
 build-system-fedora:
   extends: .native_build_job_template
@@ -155,8 +156,9 @@ crash-test-fedora:
     IMAGE: fedora
   script:
     - cd build
-    - scripts/device-crash-test -q ./qemu-system-ppc
-    - scripts/device-crash-test -q ./qemu-system-riscv32
+    - make check-venv
+    - tests/venv/bin/python3 scripts/device-crash-test -q ./qemu-system-ppc
+    - tests/venv/bin/python3 scripts/device-crash-test -q ./qemu-system-riscv32
 
 build-system-centos:
   extends: .native_build_job_template
diff --git a/scripts/device-crash-test b/scripts/device-crash-test
index a203b3fdea2..73bcb986937 100755
--- a/scripts/device-crash-test
+++ b/scripts/device-crash-test
@@ -33,10 +33,18 @@ import re
 import random
 import argparse
 from itertools import chain
+from pathlib import Path
 
-sys.path.append(os.path.join(os.path.dirname(__file__), '..', 'python'))
-from qemu.machine import QEMUMachine
-from qemu.qmp import ConnectError
+try:
+    from qemu.machine import QEMUMachine
+    from qemu.qmp import ConnectError
+except ModuleNotFoundError as exc:
+    path = Path(__file__).resolve()
+    print(f"Module '{exc.name}' not found.")
+    print("  Try 'make check-venv' from your build directory,")
+    print("  and then one way to run this script is like so:")
+    print(f'  > $builddir/tests/venv/bin/python3 "{path}"')
+    sys.exit(1)
 
 logger = logging.getLogger('device-crash-test')
 dbg = logger.debug
-- 
2.34.1


