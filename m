Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C08631F01B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 20:41:16 +0100 (CET)
Received: from localhost ([::1]:52152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCpAp-0005JQ-1g
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 14:41:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCoxx-0002Wr-KR
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 14:27:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCoxu-0003Rr-FF
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 14:27:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613676473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j5O0AFoUcMFdk+/23x9DeC0Czs79vDJW5fAx2sUdtSY=;
 b=f3HEGyZOsPELhyq3+FVbmLjrI+wWGCOFxSANArZNCxNXpVBnJj4l3PqHV7UQZN1ke9JQjZ
 ZNTtQxRKDDSVFZxElrTgh88WLX4gvttmrsOgG7MsvtBa981HBls1MHW78pZAdih/W9PLEu
 aIUD0cqjEvYCylvvcENDsJXAdlzBqS4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-5NhpK4aVOe-8u6VHTfhdTg-1; Thu, 18 Feb 2021 14:27:49 -0500
X-MC-Unique: 5NhpK4aVOe-8u6VHTfhdTg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75C9784E240;
 Thu, 18 Feb 2021 19:27:48 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3010860BE5;
 Thu, 18 Feb 2021 19:27:47 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 05/25] python: add qemu package installer
Date: Thu, 18 Feb 2021 14:27:13 -0500
Message-Id: <20210218192733.370968-6-jsnow@redhat.com>
In-Reply-To: <20210218192733.370968-1-jsnow@redhat.com>
References: <20210218192733.370968-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add setup.cfg and setup.py, necessary for installing a package via
pip. Add a ReST document (PACKAGE.rst) explaining the basics of what
this package is for and who to contact for more information. This
document will be used as the landing page for the package on PyPI.

I am not yet using a pyproject.toml style package manifest, because
"editable" installs are not defined (yet?) by PEP-517/518.

I consider editable installs crucial for development, though they have
(apparently) always been somewhat poorly defined.

Pip now (19.2 and later) now supports editable installs for projects
using pyproject.toml manifests, but might require the use of the
--no-use-pep517 flag, which somewhat defeats the point.

For now, while the dust settles, stick with the de-facto
setup.py/setup.cfg combination supported by setuptools. It will be worth
re-evaluating this point again in the future when our supported build
platforms all ship a fairly modern pip.

Additional reading on this matter:

https://github.com/pypa/packaging-problems/issues/256
https://github.com/pypa/pip/issues/6334
https://github.com/pypa/pip/issues/6375
https://github.com/pypa/pip/issues/6434
https://github.com/pypa/pip/issues/6438

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/PACKAGE.rst | 32 ++++++++++++++++++++++++++++++++
 python/setup.cfg   | 19 +++++++++++++++++++
 python/setup.py    | 23 +++++++++++++++++++++++
 3 files changed, 74 insertions(+)
 create mode 100644 python/PACKAGE.rst
 create mode 100644 python/setup.cfg
 create mode 100755 python/setup.py

diff --git a/python/PACKAGE.rst b/python/PACKAGE.rst
new file mode 100644
index 00000000000..0e714c87eb3
--- /dev/null
+++ b/python/PACKAGE.rst
@@ -0,0 +1,32 @@
+QEMU Python Tooling
+===================
+
+This package provides QEMU tooling used by the QEMU project to build,
+configure, and test QEMU. It is not a fully-fledged SDK and it is subject
+to change at any time.
+
+Usage
+-----
+
+The ``qemu.qmp`` subpackage provides a library for communicating with
+QMP servers. The ``qemu.machine`` subpackage offers rudimentary
+facilities for launching and managing QEMU processes. Refer to each
+package's documentation
+(``>>> help(qemu.qmp)``, ``>>> help(qemu.machine)``)
+for more information.
+
+Contributing
+------------
+
+This package is maintained by John Snow <jsnow@redhat.com> as part of
+the QEMU source tree. Contributions are welcome and follow the `QEMU
+patch submission process
+<https://wiki.qemu.org/Contribute/SubmitAPatch>`_, which involves
+sending patches to the QEMU development mailing list.
+
+John maintains a `GitLab staging branch
+<https://gitlab.com/jsnow/qemu/-/tree/python>`_, and there is an
+official `GitLab mirror <https://gitlab.com/qemu-project/qemu>`_.
+
+Please report bugs by sending a mail to qemu-devel@nongnu.org and CC
+jsnow@redhat.com.
diff --git a/python/setup.cfg b/python/setup.cfg
new file mode 100644
index 00000000000..dd71640fc2f
--- /dev/null
+++ b/python/setup.cfg
@@ -0,0 +1,19 @@
+[metadata]
+name = qemu
+maintainer = QEMU Developer Team
+maintainer_email = qemu-devel@nongnu.org
+url = https://www.qemu.org/
+download_url = https://www.qemu.org/download/
+description = QEMU Python Build, Debug and SDK tooling.
+long_description = file:PACKAGE.rst
+long_description_content_type = text/x-rst
+classifiers =
+    Development Status :: 3 - Alpha
+    License :: OSI Approved :: GNU General Public License v2 (GPLv2)
+    Natural Language :: English
+    Operating System :: OS Independent
+    Programming Language :: Python :: 3 :: Only
+
+[options]
+python_requires = >= 3.6
+packages = find_namespace:
diff --git a/python/setup.py b/python/setup.py
new file mode 100755
index 00000000000..2014f81b757
--- /dev/null
+++ b/python/setup.py
@@ -0,0 +1,23 @@
+#!/usr/bin/env python3
+"""
+QEMU tooling installer script
+Copyright (c) 2020-2021 John Snow for Red Hat, Inc.
+"""
+
+import setuptools
+import pkg_resources
+
+
+def main():
+    """
+    QEMU tooling installer
+    """
+
+    # https://medium.com/@daveshawley/safely-using-setup-cfg-for-metadata-1babbe54c108
+    pkg_resources.require('setuptools>=39.2')
+
+    setuptools.setup()
+
+
+if __name__ == '__main__':
+    main()
-- 
2.29.2


