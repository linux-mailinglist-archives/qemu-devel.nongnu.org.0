Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C1A2CA98C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 18:26:27 +0100 (CET)
Received: from localhost ([::1]:34458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk9Q2-0004yA-QZ
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 12:26:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kk9J3-0004WE-C9
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:19:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kk9Iv-00026U-WA
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:19:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606843145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xQsk4aU2S6fS9emJc8LulVfAiFWlQSRNUCFZoIRN760=;
 b=ZrZD/5l82dImRs7nRXzw7suIOIyf+sGm/Dg8QnAT3YXKpl+g7Gy4N9ApGNtR3gf2C9gLrZ
 u5cXcuFubx4zq/e5iZ6SQJaLdyoTqloanT4nAFRJ/5ZdJiz8KNtoTHXEemdkPD1Ki9/cuR
 UvNydhhMAQ7V6+0EVqEhzmaqoKsbX48=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-kh1sh8o2NGeE27UgBLNUNg-1; Tue, 01 Dec 2020 12:19:01 -0500
X-MC-Unique: kh1sh8o2NGeE27UgBLNUNg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F292D805BE0;
 Tue,  1 Dec 2020 17:18:59 +0000 (UTC)
Received: from fedora.redhat.com (ovpn-115-4.ams2.redhat.com [10.36.115.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C0125D9C2;
 Tue,  1 Dec 2020 17:18:57 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/23] tests/docker: add script for automating container
 refresh
Date: Tue,  1 Dec 2020 17:18:14 +0000
Message-Id: <20201201171825.2243775-13-berrange@redhat.com>
In-Reply-To: <20201201171825.2243775-1-berrange@redhat.com>
References: <20201201171825.2243775-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/docker/dockerfiles/refresh | 53 ++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100755 tests/docker/dockerfiles/refresh

diff --git a/tests/docker/dockerfiles/refresh b/tests/docker/dockerfiles/refresh
new file mode 100755
index 0000000000..b1d99963e9
--- /dev/null
+++ b/tests/docker/dockerfiles/refresh
@@ -0,0 +1,53 @@
+#!/usr/bin/python3
+#
+# Re-generate container recipes
+#
+# This script uses the "lcitool" available from
+#
+#   https://gitlab.com/libvirt/libvirt-ci
+#
+# Copyright (c) 2020 Red Hat Inc.
+#
+# This work is licensed under the terms of the GNU GPL, version 2
+# or (at your option) any later version. See the COPYING file in
+# the top-level directory.
+
+import sys
+import os
+import subprocess
+
+if len(sys.argv) != 2:
+   print("syntax: %s PATH-TO-LCITOOL" % sys.argv[0], file=sys.stderr)
+   sys.exit(1)
+
+lcitool_path=sys.argv[1]
+
+def atomic_write(filename, content):
+   try:
+      with open(filename + ".tmp", "w") as fp:
+         print(content, file=fp, end="")
+         os.replace(filename + ".tmp", filename)
+   except Exception as ex:
+      os.unlink(filename + ".tmp")
+      raise
+
+def generate_image(filename, host, cross=None, trailer=None):
+   print("Generate %s" % filename)
+   args = [lcitool_path, "dockerfile"]
+   if cross is not None:
+      args.extend(["--cross", cross])
+   args.extend([host, "qemu"])
+   lcitool=subprocess.run(args, capture_output=True)
+
+   if lcitool.returncode != 0:
+      raise Exception("Failed to generate %s: %s" % (filename, lcitool.stderr))
+
+   content = lcitool.stdout.decode("utf8")
+   if trailer is not None:
+      content += trailer
+   atomic_write(filename, content)
+
+try:
+   pass
+except Exception as ex:
+   print(str(ex), file=sys.stderr)
-- 
2.28.0


