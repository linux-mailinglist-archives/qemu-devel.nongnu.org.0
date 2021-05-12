Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB88837EF70
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 01:18:08 +0200 (CEST)
Received: from localhost ([::1]:54136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgy7D-00038o-Sk
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 19:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgy2g-0001ZU-4d
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:13:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgy2b-00066A-K3
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:13:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620861199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DbkyiKgkxZTlGVNSXzdk6QUXJ0p3gkHt3sTWGe+uKM4=;
 b=FPh+NdC2Ap/egUTjwBa/nmeyZ9eUPZBrqjf0LjqLIvqmaAy/JMj4/NdbmD8SxX4q+Mmg8T
 rUWPUM5stwQnXPQ2yw70MQlnELLHPN5Pd0lHk/ndDngK62s3lRqL+JTxgD+c4htgC247ZU
 LJMi80mHwic11jT+dJXbh4N+nSd3PuY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-NR4ruPGqPamlN3abqUJSGA-1; Wed, 12 May 2021 19:13:16 -0400
X-MC-Unique: NR4ruPGqPamlN3abqUJSGA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59E0F801817;
 Wed, 12 May 2021 23:13:15 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD6885D736;
 Wed, 12 May 2021 23:13:13 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 08/25] python: Add pipenv support
Date: Wed, 12 May 2021 19:12:24 -0400
Message-Id: <20210512231241.2816122-9-jsnow@redhat.com>
In-Reply-To: <20210512231241.2816122-1-jsnow@redhat.com>
References: <20210512231241.2816122-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pipenv is a tool used for managing virtual environments with pinned,
explicit dependencies. It is used for precisely recreating python
virtual environments.

pipenv uses two files to do this:

(1) Pipfile, which is similar in purpose and scope to what setup.cfg
lists. It specifies the requisite minimum to get a functional
environment for using this package.

(2) Pipfile.lock, which is similar in purpose to `pip freeze >
requirements.txt`. It specifies a canonical virtual environment used for
deployment or testing. This ensures that all users have repeatable
results.

The primary benefit of using this tool is to ensure *rock solid*
repeatable CI results with a known set of packages. Although I endeavor
to support as many versions as I can, the fluid nature of the Python
toolchain often means tailoring code for fairly specific versions.

Note that pipenv is *not* required to install or use this module; this is
purely for the sake of repeatable testing by CI or developers.

Here, a "blank" pipfile is added with no dependencies, but specifies
Python 3.6 for the virtual environment.

Pipfile will specify our version minimums, while Pipfile.lock specifies
an exact loadout of packages that were known to operate correctly. This
latter file provides the real value for easy setup of container images
and CI environments.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
---
 python/README.rst |  3 +++
 python/Pipfile    | 11 +++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 python/Pipfile

diff --git a/python/README.rst b/python/README.rst
index 86364367261..e27ba0130ba 100644
--- a/python/README.rst
+++ b/python/README.rst
@@ -36,6 +36,9 @@ Files in this directory
 - ``MANIFEST.in`` is read by python setuptools, it specifies additional files
   that should be included by a source distribution.
 - ``PACKAGE.rst`` is used as the README file that is visible on PyPI.org.
+- ``Pipfile`` is used by Pipenv to generate ``Pipfile.lock``.
+- ``Pipfile.lock`` is a set of pinned package dependencies that this package
+  is tested under in our CI suite. It is used by ``make venv-check``.
 - ``README.rst`` you are here!
 - ``VERSION`` contains the PEP-440 compliant version used to describe
   this package; it is referenced by ``setup.cfg``.
diff --git a/python/Pipfile b/python/Pipfile
new file mode 100644
index 00000000000..9534830b5eb
--- /dev/null
+++ b/python/Pipfile
@@ -0,0 +1,11 @@
+[[source]]
+name = "pypi"
+url = "https://pypi.org/simple"
+verify_ssl = true
+
+[dev-packages]
+
+[packages]
+
+[requires]
+python_version = "3.6"
-- 
2.30.2


