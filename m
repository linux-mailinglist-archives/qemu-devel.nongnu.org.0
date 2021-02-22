Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AEE3213FE
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 11:21:32 +0100 (CET)
Received: from localhost ([::1]:52712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE8LL-0005rQ-Gq
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 05:21:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lE8FB-00082q-2e
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 05:15:09 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:36174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lE8F9-0005JH-0n
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 05:15:08 -0500
Received: by mail-wm1-x32e.google.com with SMTP id a207so13799284wmd.1
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 02:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bgfArHb7p3k3YdV0HiKtW1aTNXdvm5THpfAW3dQ7N4A=;
 b=rJdfAWCgDqkrlaF80XIQy6mDujgHUFFyvQf1mhqilZuXUCZiRcsihGWuJk3Xo8+0hz
 /rVWpbGJ4pfXnZ0RwfLBjmAKYSg9qHy4Y47pWRNrNhpZo+qcP5/32WMfdmChvuJwSSB5
 7DivS+zFZm5SB+euetsqlOUVUobczXZ1kx7b0Rbd0tE2Dbu5objR9eDL6ubmxGjpMx7M
 OyRqDgcx/ekXU0TGOKBs76nYaItWjzsWVYtoq5jAO/ZFsw+TKuWHmQCCEWPGqljRwO8v
 lqoHzCqOaVJzssjzxTiUg9x8DpDFWEfP3avW+zOaeV1AlYVsBkuaMbDduGT8wkrCDabk
 PKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bgfArHb7p3k3YdV0HiKtW1aTNXdvm5THpfAW3dQ7N4A=;
 b=tOWputQ1bytBZlIxCumQpqUzl5XgL/2r2RWCOy9EAKspPnEIjnorOcSHmGzla5F5x+
 G2QaVkxDqc4RB4d/TQ87GBtf+/lhW+Jn7GLoBFnFMYLklL5a+xKU2VNXJk+YbpkITYn2
 +j0lhx/lYKMq7hvZX7mmRIeeilXbxIlCL6h7HgJMQEdlLzzQJdSGWpUhvnmcgvLtzogo
 oWm1JItgoaXLLID8uMAmHgDBAIndIGGG97xjuVqhABIw1YlyURFEEJmmSdLzY93wi0/d
 Ja3FQSlbqLipweUN5FeQtwSo/rbAoj6dkTdBy6tLqEhKJMugt3MtA49JnuSzAkV9uwCk
 f+Hg==
X-Gm-Message-State: AOAM533VGBK4axW0VHjRQYunog5sfzkdQYhSl/vvq3xnLj+hmNHcho3l
 1qMaxYXISRniklMGWvAeiWLM2Q==
X-Google-Smtp-Source: ABdhPJwtph261QYAD1OiIoNqelKwqqM6wbx5x8eHE7vt+NQK77g7aRasoGygJRMVAaaERm2cI4XlYA==
X-Received: by 2002:a05:600c:47c4:: with SMTP id
 l4mr19336965wmo.83.1613988905652; 
 Mon, 22 Feb 2021 02:15:05 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t11sm17165846wmb.32.2021.02.22.02.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 02:15:00 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 430E21FF91;
 Mon, 22 Feb 2021 10:14:56 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 5/6] docs/devel: update the container based tests
Date: Mon, 22 Feb 2021 10:14:54 +0000
Message-Id: <20210222101455.12640-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210222101455.12640-1-alex.bennee@linaro.org>
References: <20210222101455.12640-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This section has grown a little stale so clean-up the language and
examples for current usage:

  - refer to containers at the top
  - mention podman can also be used
  - add podman prerequisites section
  - move to using "docker-help" for online help
  - mention the registry and it's purpose
  - don't refer to out-of-date min-glib image

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>
---
 docs/devel/testing.rst | 61 +++++++++++++++++++++++++++++++-----------
 1 file changed, 46 insertions(+), 15 deletions(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 488d4e3537..e43c992f21 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -280,13 +280,17 @@ Container based tests
 Introduction
 ------------
 
-The Docker testing framework in QEMU utilizes public Docker images to build and
-test QEMU in predefined and widely accessible Linux environments.  This makes
-it possible to expand the test coverage across distros, toolchain flavors and
-library versions.
-
-Prerequisites
--------------
+The container testing framework in QEMU utilizes public images to
+build and test QEMU in predefined and widely accessible Linux
+environments. This makes it possible to expand the test coverage
+across distros, toolchain flavors and library versions. The support
+was originally written for Docker although we also support Podman as
+an alternative container runtime. Although the many of the target
+names and scripts are prefixed with "docker" the system will
+automatically run on whichever is configured.
+
+Docker Prerequisites
+--------------------
 
 Install "docker" with the system package manager and start the Docker service
 on your development machine, then make sure you have the privilege to run
@@ -316,26 +320,53 @@ Note that any one of above configurations makes it possible for the user to
 exploit the whole host with Docker bind mounting or other privileged
 operations.  So only do it on development machines.
 
+Podman Prerequisites
+--------------------
+
+Install "podman" with the system package manager.
+
+.. code::
+
+  $ sudo dnf install podman
+  $ podman ps
+
+The last command should print an empty table, to verify the system is ready.
+
 Quickstart
 ----------
 
-From source tree, type ``make docker`` to see the help. Testing can be started
-without configuring or building QEMU (``configure`` and ``make`` are done in
-the container, with parameters defined by the make target):
+From source tree, type ``make docker-help`` to see the help. Testing
+can be started without configuring or building QEMU (``configure`` and
+``make`` are done in the container, with parameters defined by the
+make target):
 
 .. code::
 
-  make docker-test-build@min-glib
+  make docker-test-build@centos7
 
-This will create a container instance using the ``min-glib`` image (the image
+This will create a container instance using the ``centos7`` image (the image
 is downloaded and initialized automatically), in which the ``test-build`` job
 is executed.
 
+Registry
+--------
+
+The QEMU project has a container registry hosted by GitLab at
+``registry.gitlab.com/qemu-project/qemu`` which will automatically be
+used to pull in pre-built layers. This avoids unnecessary strain on
+the distro archives created by multiple developers running the same
+container build steps over and over again. This can be overridden
+locally by using the ``NOCACHE`` build option:
+
+.. code::
+
+   make docker-image-debian10 NOCACHE=1
+
 Images
 ------
 
-Along with many other images, the ``min-glib`` image is defined in a Dockerfile
-in ``tests/docker/dockerfiles/``, called ``min-glib.docker``. ``make docker``
+Along with many other images, the ``centos7`` image is defined in a Dockerfile
+in ``tests/docker/dockerfiles/``, called ``centos7.docker``. ``make docker-help``
 command will list all the available images.
 
 To add a new image, simply create a new ``.docker`` file under the
@@ -355,7 +386,7 @@ QEMU.  Docker tests are the executables under ``tests/docker`` named
 library, ``tests/docker/common.rc``, which provides helpers to find the QEMU
 source and build it.
 
-The full list of tests is printed in the ``make docker`` help.
+The full list of tests is printed in the ``make docker-help`` help.
 
 Debugging a Docker test failure
 -------------------------------
-- 
2.20.1


