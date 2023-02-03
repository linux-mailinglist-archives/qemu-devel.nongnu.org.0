Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB29D68A23E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 19:48:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO167-00068U-LJ; Fri, 03 Feb 2023 13:47:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pO164-00067e-K2
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:47:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pO162-0002gv-JN
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:47:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675450058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5+GyNRX2Vc2u0f01QjGFkHpzbEhjg2Zb3F7nPY2w4FY=;
 b=Km/SAbeds/dAOgbr4MPemRuf404aHmp7S4Xm6BF4yO6jlMXdbyGUphKB15p2l+8vD+kqrr
 1VJn8j2lRhmZBs+7XrjLe4ytaBZo787oiwfmVCrT9rXESElHEVZWkCVJn6mSpqaZcJY/Cs
 9G/zSnMQkEP5lilW1AvHtoK8VNHruJ8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-HamMOjc-MqqjzAEmY799rg-1; Fri, 03 Feb 2023 13:47:34 -0500
X-MC-Unique: HamMOjc-MqqjzAEmY799rg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D2FC2817237;
 Fri,  3 Feb 2023 18:47:34 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C9D42166B34;
 Fri,  3 Feb 2023 18:47:34 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH v4 2/4] [DO-NOT-MERGE]: Add some ad-hoc linting helpers.
Date: Fri,  3 Feb 2023 13:47:31 -0500
Message-Id: <20230203184733.523522-3-jsnow@redhat.com>
In-Reply-To: <20230203184733.523522-1-jsnow@redhat.com>
References: <20230203184733.523522-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

These aren't ready for upstream inclusion, because they do not properly
manage version dependencies, execution environment and so on. These are
just the tools I use in my Own Special Environment :tm: for testing and
debugging.

They've been tested only on Fedora 37 for right now, which means:

Python 3.11.1
pylint 2.14.4-3.fc37
mypy 0.982-1.fc37
isort 5.10.1-5.fc37
flake8 5.0.3-1.fc37

The python packaging work does a more exhaustive treatment and
exploration of minimum (and maximum) package requirements; the hope is
that eventually these two series will converge and these dependencies
will all be handled by configuration in qemu.git/python/.

For now, this is just a baseline under one environment to give us some
guidance.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi-lint.sh  | 29 +++++++++++++++++++++++++++++
 scripts/qapi/Makefile |  5 +++++
 2 files changed, 34 insertions(+)
 create mode 100755 scripts/qapi-lint.sh
 create mode 100644 scripts/qapi/Makefile

diff --git a/scripts/qapi-lint.sh b/scripts/qapi-lint.sh
new file mode 100755
index 00000000000..2c2f2808ca6
--- /dev/null
+++ b/scripts/qapi-lint.sh
@@ -0,0 +1,29 @@
+#!/usr/bin/env bash
+set -e
+
+if [[ -f qapi/.flake8 ]]; then
+    echo "flake8 --config=qapi/.flake8 qapi/"
+    flake8 --config=qapi/.flake8 qapi/
+fi
+if [[ -f qapi/pylintrc ]]; then
+    echo "pylint --rcfile=qapi/pylintrc qapi/"
+    pylint --rcfile=qapi/pylintrc qapi/
+fi
+if [[ -f qapi/mypy.ini ]]; then
+    echo "mypy --config-file=qapi/mypy.ini qapi/"
+    mypy --config-file=qapi/mypy.ini qapi/
+fi
+
+if [[ -f qapi/.isort.cfg ]]; then
+    pushd qapi
+    echo "isort -c ."
+    isort -c .
+    popd
+fi
+
+pushd ../bin/git
+make -j9
+make check-qapi-schema
+make docs
+make sphinxdocs
+popd
diff --git a/scripts/qapi/Makefile b/scripts/qapi/Makefile
new file mode 100644
index 00000000000..314e8a5505e
--- /dev/null
+++ b/scripts/qapi/Makefile
@@ -0,0 +1,5 @@
+check:
+	isort -c .
+	flake8 .
+	cd .. && pylint --rcfile=qapi/pylintrc qapi
+	cd .. && mypy -p qapi --config-file=qapi/mypy.ini
-- 
2.39.0


