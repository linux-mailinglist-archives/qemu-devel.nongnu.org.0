Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CFA6C4F2D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 16:16:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf0Bl-0006Iu-JN; Wed, 22 Mar 2023 11:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pf0Bh-0006IR-AS
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:15:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pf0Bd-0006kO-Tk
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:15:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679498133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZIRxsjSeAPEoqEaAMO2fLylFErrx9aZH1ODfkMmMC08=;
 b=ALmbZFF3PN5QckegRGuDGh7AlDoZdQZ7gF/lSW2ZPU76ET8MZAIpEdvMQCuy4kzz6QUNju
 tBGi9njPRhw4nbiidd3ywjuKAMc3e9IpPqBzt3EhHapx9OBUkhMexYETOt7rRKk9LpPXt1
 Qxwj/eAG34AS4Zoivzr9DKBi98pk9vc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-355-bUmmWvStMHuEYYCQ8EDgOA-1; Wed, 22 Mar 2023 11:15:32 -0400
X-MC-Unique: bUmmWvStMHuEYYCQ8EDgOA-1
Received: by mail-ed1-f70.google.com with SMTP id
 s30-20020a508d1e000000b005005cf48a93so16322379eds.8
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 08:15:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679498131;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZIRxsjSeAPEoqEaAMO2fLylFErrx9aZH1ODfkMmMC08=;
 b=3v94VwUZ6is8PJifQQ2Mzk5wPsgXiKg0BTxSUelB5hqUYdHxpvmp1T8vDPXda4NwOP
 cQ/NxlNcKoSsxpMzZnJmlA4xGX4FKxGOENeDdfX6uzhsZgX1USeYLIS4WPeNvTX7yZLF
 QUbOzg/wuz0vL4+mT0j4/0a6e9vXS86fReOUlE/BEVVghdPQyH0jWzwGdy5tu3LQ+nN+
 gt3v56mBme6NyPejmQ+caeuPKJX09mVIhtzLq02lskLIenI1kWH197HENXSuphLTlepg
 zndDYfl1C66utfTkn/3o0w9KCuaIA5K4ICu/cTgY+nrlQbwttkiXoZ1Y++tnZUHpo9nh
 Uwlg==
X-Gm-Message-State: AO0yUKWAl1Vy+9uYG2TcVEa1TUVyc4MaSu0x5tiROjB/m9c8d/ueTasn
 mghKv8gZ/NfnM4Kcp1bTSxqpiYMrY9ixl7ykCDhCSDPsm8LWpqWTbhojqznkNxAHsXY26TRrqjK
 0p49Gd/Pqa0tWT0bytWg0Oiq2m639OEM10csDCbxeadVdUyJfSjIURy68BU99WI/TuNE5iZwH4J
 r12Q==
X-Received: by 2002:a17:906:1192:b0:92c:6fbf:28 with SMTP id
 n18-20020a170906119200b0092c6fbf0028mr7774420eja.64.1679498130885; 
 Wed, 22 Mar 2023 08:15:30 -0700 (PDT)
X-Google-Smtp-Source: AK7set+Bzmn6OoI2Y7rLlsAlWXxiQfugxaxx4qti6UyIcgPaSR4NnzPrPqM6U8SPPGhDpwAZ7mQ1xA==
X-Received: by 2002:a17:906:1192:b0:92c:6fbf:28 with SMTP id
 n18-20020a170906119200b0092c6fbf0028mr7774375eja.64.1679498130330; 
 Wed, 22 Mar 2023 08:15:30 -0700 (PDT)
Received: from [192.168.1.72] ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 hy22-20020a1709068a7600b008e53874f8d8sm7268630ejc.180.2023.03.22.08.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 08:15:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: jsnow@redhat.com,
	berrange@redhat.com,
	peter.maydell@linaro.org
Subject: [qemu-web PATCH] add post about plans for Python venvs
Date: Wed, 22 Mar 2023 16:15:29 +0100
Message-Id: <20230322151529.1020525-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

This post details the design that John Snow and I are planning for QEMU 8.1.
The purpose is to detect possible inconsistencies in the build environment,
that could happen on enterprise distros once Python 3.6 support is dropped.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 _posts/2023-03-22-python.md | 213 ++++++++++++++++++++++++++++++++++++
 1 file changed, 213 insertions(+)
 create mode 100644 _posts/2023-03-22-python.md

diff --git a/_posts/2023-03-22-python.md b/_posts/2023-03-22-python.md
new file mode 100644
index 0000000..85e1d30
--- /dev/null
+++ b/_posts/2023-03-22-python.md
@@ -0,0 +1,213 @@
+---
+layout: post
+title:  "Preparing a consistent Python environment"
+date:   2023-03-22 13:30:00 +0000
+categories: [build, python, developers]
+---
+Building QEMU is a complex task, divided between several programs.
+configure finds the host and cross compilers that are needed to build
+emulators and firmware; Meson prepares the build environment for the
+emulators; finally, Make and ninja actually run the build steps and
+possibly the testing steps as well.
+
+In addition to compiling C code, some build steps are coded as external
+tools which are mostly written in the Python language.  These include
+processing the emulator configuration, code generators for tracepoints
+and QAPI, extensions for the Sphinx documentation tool, and the Avocado
+testing framework.  Another important tool written in Python is the
+Meson build system itself.
+
+Some of these tools are run through the `python3` executable, while others
+are invoked directly as `sphinx-build` or `meson`, and this can create
+inconsistencies.  For example, QEMU's `configure` script checks for a
+minimum version of Python and rejects too-old interpreters.  What would
+happen if code run via Sphinx or Meson used a different version?
+
+This situation has been largely hypothetical until recently; QEMU's
+Python code is already tested with a wide range of versions of the
+interpreter, and it would not be a huge issue if Sphinx used a different
+version of Python as long as both of them were supported.  This will
+change in version 8.1 of QEMU, which will bump the minimum supported
+version of Python from 3.6 to 3.8.  While all the distros that QEMU
+supports have a recent-enough interpreter, the default on RHEL8 and
+SLES15 is still version 3.6, and that is what all binaries in `/usr/bin`
+use unconditionally.
+
+As a result, even if `configure` is told to use `/usr/bin/python3.8`
+for the build, QEMU's custom Sphinx extensions would still run under
+Python 3.6.  This post will explain how to avoid this inconsistency
+and ensure that a single interpreter is used for the whole of the
+build process.  Getting there will require some familiarity with
+Python packaging, so let's start with virtual environments
+
+## Virtual environments
+
+It is surprisingly hard to find what Python interpreter a given script
+will use.  You can try to parse the first line of the script, which will
+be something like `#! /usr/bin/python3`, but that is no guarantee of
+success.  For example, on some version of Homebrew `/usr/bin/meson`
+will be a wrapper script like:
+
+```bash
+#!/bin/bash
+PYTHONPATH="/usr/local/Cellar/meson/0.55.0/lib/python3.8/site-packages" exec "/usr/local/Cellar/meson/0.55.0/libexec/bin/meson"  "$@"
+```
+
+and the actual Python shebang line will be in `/usr/local/Cellar`.
+Therefore, performing some kind of consistency check on the scripts
+is ruled out.  QEMU needs to set up a consistent environment on its own.
+
+For users who are building QEMU, the simplest way to do so would be
+to use Python virtual environments.  A virtual environment takes an
+existing Python installation but gives it a local set of Python packages.
+It also has its own `bin` directory; place it at the beginning of your
+`PATH` and you will be able to control the Python interpreter for scripts
+that begin with `#! /usr/bin/env python3`.
+
+Furthermore, when packages are installed into the virtual environment
+with `pip`, they always refer to the Python interpreter that was used to
+create the environment.  Virtual environments mostly solve the consistency
+problem at the cost of an extra `pip install` step to put QEMU's build
+dependencies into the environment.
+
+Unfortunately, this extra step has a substantial downside.  Even though
+the virtual environment can optionally refer to the base installation's
+installed packages, `pip` will always install packages from scratch
+into the virtual environment. For all Linux distributions except RHEL8
+and SLES15 this is unnecessary, and users would be happy to build QEMU
+using the versions of Meson and Sphinx included in the distribution.
+
+Even worse, `pip install` will access the Python package index (PyPI)
+over the Internet, which is often impossible on build machines that
+are sealed from the outside world.  Automated installation of PyPI
+dependencies may actually be a welcome feature, but it must also remain
+a strictly optional feature.
+
+In other words, the ideal solution would use a non-isolated virtual
+environment to be able to use system packages for the sake of Linux
+distributions; but it would also ensure that scripts (`sphinx-build`,
+`meson`, `avocado`) are placed into `bin` just like `pip install` does.
+
+## Distribution packages
+
+When it comes to packages, Python surely makes an effort to be confusing.
+The fundamental unit for *importing* code into a Python program is called
+a package; for example `os` and `sys` are two examples of a package.
+However, a program or library that is distributed on PyPI consists
+of many such "import packages": that's because while `pip` is usually
+said to be a "package installer" for Python, more precisely it installs
+"distribution packages".
+
+To add to the confusion, the term "distribution package" is often
+shortened to *either* "package" or "distribution".  And finally,
+the metadata of the distribution package remains available even after
+installation, so you may refer to "distributions" even for things that
+are already installed and are not being distributed anywhere.
+
+All this matters because distribution metadata will be the key to
+building the perfect virtual environment.  If you look at the content
+of `bin/meson` in a virtual environment, after installing the package
+with `pip`, you will see this:
+
+```python
+# -*- coding: utf-8 -*-
+import re
+import sys
+from mesonbuild.mesonmain import main
+if __name__ == '__main__':
+    sys.argv[0] = re.sub(r'(-script\.pyw|\.exe)?$', '', sys.argv[0])
+    sys.exit(main())
+```
+
+This looks a lot like automatically generated code, and in fact it
+is.  The only part that varies is the `from mesonbuild.mesonmain
+import main` line.  `pip` knew what to put in there because
+Meson's `setup.cfg` contains the following stanza:
+
+```
+[options.entry_points]
+console_scripts =
+  meson = mesonbuild.mesonmain:main
+```
+
+Similar declarations exists in Sphinx, Avocado and so on, and accessing their
+content is easy via `importlib.metadata` (available in Python 3.8+):
+
+```
+$ python3
+>>> from importlib.metadata import distribution
+>>> distribution('meson').entry_points
+[EntryPoint(name='meson', value='mesonbuild.mesonmain:main', group='console_scripts')]
+```
+
+`importlib` looks up the metadata in the running Python interpreter's
+search path; if Meson is installed under another interpreter's `site-packages`
+directory, it will not be found:
+
+```
+$ python3.8
+>>> from importlib.metadata import distribution
+>>> distribution('meson').entry_points
+Traceback (most recent call last):
+...
+importlib.metadata.PackageNotFoundError: meson
+```
+
+So finally we have a plan!  `configure` can build a non-isolated virtual
+environment, use `importlib` to check that the required packages exist
+in the base installation, and create scripts in `bin` that point to the
+right Python interpreter.  Then, it can optionally use `pip install` to
+install the missing packages.
+
+Python provides a customizable [`venv`
+module](https://docs.python.org/3/library/venv.html) to create virtual
+environments.  While this process includes a certain amount of specialized
+logic, it is easy to embed it in a subclass of `venv.EnvBuilder`.
+
+This will provide the same experience as QEMU 8.0, except that there will
+be no need for the `--meson` and `--sphinx-build`` options to the
+`configure` script.  The path to the Python interpreter is enough to
+set up all Python programs used during the build.
+
+There is only one thing left to fix...
+
+## Nesting virtual environments
+
+Remember how we started from a user that creates her own virtual
+environment before building QEMU?  _This_ usecase would not work
+anymore, because virtual environments cannot be nested.  As soon
+as `configure` creates its own virtual environment, the packages
+installed by the user are not available anymore.
+
+Fortunately, the "appearance" of a nested virtual environment is easy
+to emulate.  Detecting whether `python3` runs in a virtual environment
+is as easy as checking `sys.prefix != sys.base_prefix`; if it is,
+we need to retrieve the parent virtual environments `site-packages`
+directory:
+
+```
+>>> import sysconfig
+>>> sysconfig.get_path('purelib')
+'/home/pbonzini/my-venv/lib/python3.11/site-packages'
+```
+
+and write it to a `.pth` file in the `lib` directory of the new virtual
+environment.  The following demo shows how a distribution package in the
+parent virtual environment is available in the child as well:
+
+<script async id="asciicast-31xjLsR4KjsU9HuhOUpU08tvb" src="https://asciinema.org/a/31xjLsR4KjsU9HuhOUpU08tvb.js"></script>
+
+A small detail is that `configure`'s new virtual environment should
+copy the isolation setting of the parent.  An isolated venv can be
+detected because `sys.base_prefix in site.PREFIXES` is false.
+
+## Conclusion
+
+Right now, QEMU only provides a minimal attempt at ensuring consistency
+of the Python environment; Meson is always run using the interpreter
+that was passed to the configure script with `--python` or `$PYTHON`,
+but that's it.  Once the above technique will be implemented in QEMU 8.1,
+there will be no difference in the build experience but a wider set
+of invalid build environments will be detected.  We will merge these
+checks before dropping support for Python 3.6, so that users on older
+enterprise distributions will have a smooth transition.
-- 
2.39.2


