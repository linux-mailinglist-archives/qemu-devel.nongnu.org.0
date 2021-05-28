Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A28393BB1
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 04:53:55 +0200 (CEST)
Received: from localhost ([::1]:39886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmSdG-0004c3-US
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 22:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSKn-0004vk-LM
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:34:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSKk-0000dX-Hf
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:34:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622169285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ufZaZbXj5M+dVDg6u0ITa0DURwXc4s5/iD4fgrVfR3c=;
 b=Ahly16hHtsGuiqobRlghCE23TgvGqoI1SOJLTayVSg5i1KvBx9hK1dc1jBbKeJ/gSttgg+
 OgvxHJlGwnGN0GiE9AyJoS9Mapqc4aMq0Sfky4o3LDhcnNZiCuCePNe06VA2mbguoDUVdV
 ZOE9GviwsbiWnwJkxOCNVjB5CDtw7Vo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-_I8bGm8oMMyBQmzut1vZ_Q-1; Thu, 27 May 2021 22:34:40 -0400
X-MC-Unique: _I8bGm8oMMyBQmzut1vZ_Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76C0E107ACC7;
 Fri, 28 May 2021 02:34:39 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3FDCE17C;
 Fri, 28 May 2021 02:34:37 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/44] python: Add pipenv support
Date: Thu, 27 May 2021 22:32:03 -0400
Message-Id: <20210528023220.417057-28-jsnow@redhat.com>
In-Reply-To: <20210528023220.417057-1-jsnow@redhat.com>
References: <20210528023220.417057-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
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
Message-id: 20210527211715.394144-15-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/README.rst |  3 +++
 python/Pipfile    | 11 +++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 python/Pipfile

diff --git a/python/README.rst b/python/README.rst
index 0099646ae2f..bf9bbca979a 100644
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
2.31.1


