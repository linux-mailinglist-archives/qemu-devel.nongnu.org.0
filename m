Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 958693937E1
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 23:21:58 +0200 (CEST)
Received: from localhost ([::1]:47758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmNS1-0007sX-LT
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 17:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmNOh-0003Co-CG
 for qemu-devel@nongnu.org; Thu, 27 May 2021 17:18:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmNOc-00009J-NY
 for qemu-devel@nongnu.org; Thu, 27 May 2021 17:18:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622150306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sGhjIgXo7uWaYdanbzxIlShB9hku8IEEb4j7ORURLmw=;
 b=h2YVCuc0qz8peMrxOFC/XZ9vKA1j4zHAEAerTBJD62ioIBIhVBf90TnKpyAvChMeeVFeUv
 lJMEpAQ+vIu7h4fMkUJYOwRWWUgYW+7xdORY7Qv6lwhTZ+sW3IG67LreB8MHoS1ZiF7DPl
 eFaogYzZFeTrMWA2oMFQ2EzY80hfw+M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-dEBYg744NA6ClpHb5msm9Q-1; Thu, 27 May 2021 17:18:22 -0400
X-MC-Unique: dEBYg744NA6ClpHb5msm9Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D588FC9A;
 Thu, 27 May 2021 21:18:21 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6DEE5D9C6;
 Thu, 27 May 2021 21:18:14 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 10/31] python: add qemu package installer
Date: Thu, 27 May 2021 17:16:54 -0400
Message-Id: <20210527211715.394144-11-jsnow@redhat.com>
In-Reply-To: <20210527211715.394144-1-jsnow@redhat.com>
References: <20210527211715.394144-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add setup.cfg and setup.py, necessary for installing a package via
pip. Add a ReST document (PACKAGE.rst) explaining the basics of what
this package is for and who to contact for more information. This
document will be used as the landing page for the package on PyPI.

List the subpackages we intend to package by name instead of using
find_namespace because find_namespace will naively also packages tests,
things it finds in the dist/ folder, etc. I could not figure out how to
modify this behavior; adding allow/deny lists to setuptools kept
changing the packaged hierarchy. This works, roll with it.

I am not yet using a pyproject.toml style package manifest, because
"editable" installs are not defined (yet?) by PEP-517/518.

I consider editable installs crucial for development, though they have
(apparently) always been somewhat poorly defined.

Pip now (19.2 and later) now supports editable installs for projects
using pyproject.toml manifests, but might require the use of the
--no-use-pep517 flag, which somewhat defeats the point. Full support for
setup.py-less editable installs was not introduced until pip 21.1.1:
https://github.com/pypa/pip/pull/9547/commits/7a95720e796a5e56481c1cc20b6ce6249c50f357

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
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
---
 python/PACKAGE.rst | 33 +++++++++++++++++++++++++++++++++
 python/setup.cfg   | 22 ++++++++++++++++++++++
 python/setup.py    | 23 +++++++++++++++++++++++
 3 files changed, 78 insertions(+)
 create mode 100644 python/PACKAGE.rst
 create mode 100644 python/setup.cfg
 create mode 100755 python/setup.py

diff --git a/python/PACKAGE.rst b/python/PACKAGE.rst
new file mode 100644
index 00000000000..1bbfe1b58e2
--- /dev/null
+++ b/python/PACKAGE.rst
@@ -0,0 +1,33 @@
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
+Please report bugs on the `QEMU issue tracker
+<https://gitlab.com/qemu-project/qemu/-/issues>`_ and tag ``@jsnow`` in
+the report.
diff --git a/python/setup.cfg b/python/setup.cfg
new file mode 100644
index 00000000000..3fa92a2e73f
--- /dev/null
+++ b/python/setup.cfg
@@ -0,0 +1,22 @@
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
+packages =
+    qemu.qmp
+    qemu.machine
+    qemu.utils
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
2.31.1


