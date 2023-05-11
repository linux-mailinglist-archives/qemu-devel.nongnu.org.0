Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAAB6FEA5C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 05:56:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwxOM-0007be-Qo; Wed, 10 May 2023 23:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pwxOJ-0007bA-Kl
 for qemu-devel@nongnu.org; Wed, 10 May 2023 23:54:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pwxOG-0005LH-EL
 for qemu-devel@nongnu.org; Wed, 10 May 2023 23:54:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683777291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uSmDYX0uCXiSE6x8VrNHfsXcbHA8rEa/ltorMg1xxKw=;
 b=OTKfb20bhZD5+JpUzmZPxEfV4HvBpDJ9Mm+/X0bpNJ4bk+zl6Mh/4B4ovYckrtNhdrTuE3
 2FFWp4VUWjzL9n6NAtOtgvb0XssMe5r69q52+7irM0Vm6FYxHYAXzAYnUdURabY262bz/9
 7zT0L70wdA7nY9sZtofmjKspgZvtpN0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-uFO6roNENj-3TxNanQdWtQ-1; Wed, 10 May 2023 23:54:48 -0400
X-MC-Unique: uFO6roNENj-3TxNanQdWtQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 744D53C0F229;
 Thu, 11 May 2023 03:54:47 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9B1440C2076;
 Thu, 11 May 2023 03:54:46 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Roth <michael.roth@amd.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 14/27] python: add vendor.py utility
Date: Wed, 10 May 2023 23:54:22 -0400
Message-Id: <20230511035435.734312-15-jsnow@redhat.com>
In-Reply-To: <20230511035435.734312-1-jsnow@redhat.com>
References: <20230511035435.734312-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a teeny-tiny script that just downloads any packages we want to
vendor from PyPI and stores them in qemu.git/python/wheels/. If I'm hit
by a meteor, it'll be easy to replicate what I have done in order to
udpate the vendored source.

We don't really care which python runs it; it exists as a meta-utility
with no external dependencies and we won't package or install it. It
will be monitored by the linters/type checkers, though; so it's
guaranteed safe on python 3.6+.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/scripts/vendor.py | 74 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100755 python/scripts/vendor.py

diff --git a/python/scripts/vendor.py b/python/scripts/vendor.py
new file mode 100755
index 0000000000..23708430ea
--- /dev/null
+++ b/python/scripts/vendor.py
@@ -0,0 +1,74 @@
+#!/usr/bin/env python3
+"""
+vendor - QEMU python vendoring utility
+
+usage: vendor [-h]
+
+QEMU python vendoring utility
+
+options:
+  -h, --help  show this help message and exit
+"""
+
+# Copyright (C) 2023 Red Hat, Inc.
+#
+# Authors:
+#  John Snow <jsnow@redhat.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later. See the COPYING file in the top-level directory.
+
+import argparse
+import os
+from pathlib import Path
+import subprocess
+import sys
+import tempfile
+
+
+def main() -> int:
+    """Run the vendoring utility. See module-level docstring."""
+    loud = False
+    if os.environ.get("DEBUG") or os.environ.get("V"):
+        loud = True
+
+    # No options or anything for now, but I guess
+    # you'll figure that out when you run --help.
+    parser = argparse.ArgumentParser(
+        prog="vendor",
+        description="QEMU python vendoring utility",
+    )
+    parser.parse_args()
+
+    packages = {
+        "meson==0.61.5":
+        "58c2ddb5f885da0e929f15d89f38d8a7d97f981f56815bcba008414f8511f59a",
+    }
+
+    vendor_dir = Path(__file__, "..", "..", "wheels").resolve()
+
+    with tempfile.NamedTemporaryFile(mode="w", encoding="utf-8") as file:
+        for dep_spec, checksum in packages.items():
+            file.write(f"{dep_spec} --hash=sha256:{checksum}")
+        file.flush()
+
+        cli_args = [
+            "pip",
+            "download",
+            "--dest",
+            str(vendor_dir),
+            "--require-hashes",
+            "-r",
+            file.name,
+        ]
+        if loud:
+            cli_args.append("-v")
+
+        print(" ".join(cli_args))
+        subprocess.run(cli_args, check=True)
+
+    return 0
+
+
+if __name__ == "__main__":
+    sys.exit(main())
-- 
2.40.0


