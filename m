Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 211B86A2134
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 19:10:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVcVF-00055M-MZ; Fri, 24 Feb 2023 13:09:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVcVD-00053x-Pj
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 13:09:03 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVcVA-0004nh-Du
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 13:09:03 -0500
Received: by mail-wr1-x42b.google.com with SMTP id l25so46957wrb.3
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 10:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qIIsq0Xrg0m3fO3Ehu1wN9TU58SKwM0UZQDW7mIlMRU=;
 b=A1MLAb+IE5d9WkK74jNJ6DwjNv5a1PMBxtCFzY5GGhs6ustvVw/gl8ek1OsUTgREWS
 6XZ/i+0/PTcWLPup77xNbmQNWcDx0CPMOyLWmcyTlFZ3vjkhPTiPpGhjfjJ1FdpJOyTd
 5TXW8vOI+tNa9D88UV51gXqYKYH6XJbQeNeHlIUbYj8HRiWaHlaka8YkE0hjKsbPE6wP
 lLN3XNjLB2s5tNlQvFGhv6WYdZp/z8gFvZYEMh07cte2uJBqITyHRIjvOZWpwOLlV/D/
 +RsCgF7+hU8FQdEwG+n5DNGP/p9zsSJC7vQLzCAx/2N+ScAzDl8Wh8FBv1B4VT5C714/
 AdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qIIsq0Xrg0m3fO3Ehu1wN9TU58SKwM0UZQDW7mIlMRU=;
 b=SggvpppP2p4PYV0luGHojLLj8FbKkaIZUdpLpj8zBR6WrRII3OVmYGZaHjMfCo7V7K
 wCLQOM9jRqX3XmkOa3IcBtSfo1c63UxX5Mdi8kZUkZ2wpIjadmLBYhVp/6fmbSIvhF5I
 ZaNnYSJyzua4Y6m07IVV47jHpyIIrekZcrWWSWg0nvm9iTJN+DtWXZ+fAWwVdiXFfM9z
 wwQq4PzdQV5FPL9Qe3cm4j7p0vEDYT1B5FGUtbZS38Cgj9euJ0xKKBPrDKEK3aGkjMTK
 bo9jv975AQYTzO7+Gva7O3firxJr86ssfCkXRQSyBkWVLiUjnIerFMgrgoKuG7ms+Ug3
 aCpA==
X-Gm-Message-State: AO0yUKUJMyBNA0BIonaecyRVCP0QrI0z9nUVY5UzlqNbskahozsUr5LO
 c/Xdl4EVvtN5cmngcLRLfpee4A==
X-Google-Smtp-Source: AK7set/VYHQd3dikFPYbS9RI01pHDa8oOcPcRgB9bmvOVRTq+v/lpy7YqiCRNCTG2onmsJE8bCbJfA==
X-Received: by 2002:a05:6000:1cd:b0:2c5:8575:c37 with SMTP id
 t13-20020a05600001cd00b002c585750c37mr14832663wrx.66.1677262138378; 
 Fri, 24 Feb 2023 10:08:58 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a1c544d000000b003e208cec49bsm8971006wmi.3.2023.02.24.10.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 10:08:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 98F121FFB7;
 Fri, 24 Feb 2023 18:08:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Beraldo Leal <bleal@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Ed Maste <emaste@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Hanna Reitz <hreitz@redhat.com>,
 Bandan Das <bsd@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Subject: [PATCH 0/7] testing/next: docker.py removal and kaniko updates
Date: Fri, 24 Feb 2023 18:08:50 +0000
Message-Id: <20230224180857.1050220-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This series attempts to remove our dependence on the docker.py script
and build things directly with the appropriate tool. I've been
noodling around with how we build images on gitlab to see if they can
cache better because the normal case should be we don't need to
rebuild everything if the upstream distro hasn't updated its package
list.

Anyway what do people think?

Alex Bennée (7):
  configure: expose the direct container command
  tests/dockerfiles: unify debian-toolchain references
  tests/lcitool: append user setting stanza to dockerfiles
  tests/docker: add USER stanzas to non-lci images
  tests/docker: use direct RUNC call to build containers
  tests/docker: use direct RUNC call to run test jobs
  tests/gitlab: use kaniko to build images

 configure                                     |  3 +++
 .gitlab-ci.d/cirrus/freebsd-12.vars           |  5 ++++
 .gitlab-ci.d/cirrus/freebsd-13.vars           |  5 ++++
 .gitlab-ci.d/cirrus/macos-12.vars             |  5 ++++
 .gitlab-ci.d/container-template.yml           | 23 +++++++---------
 tests/docker/Makefile.include                 | 27 +++++++++++--------
 tests/docker/dockerfiles/alpine.docker        |  5 ++++
 tests/docker/dockerfiles/centos8.docker       |  5 ++++
 .../dockerfiles/debian-all-test-cross.docker  |  5 ++++
 .../dockerfiles/debian-alpha-cross.docker     |  5 ++++
 .../dockerfiles/debian-amd64-cross.docker     |  5 ++++
 tests/docker/dockerfiles/debian-amd64.docker  |  5 ++++
 .../dockerfiles/debian-arm64-cross.docker     |  5 ++++
 .../dockerfiles/debian-armel-cross.docker     |  5 ++++
 .../dockerfiles/debian-armhf-cross.docker     |  5 ++++
 .../dockerfiles/debian-hexagon-cross.docker   |  5 ++++
 .../dockerfiles/debian-hppa-cross.docker      |  5 ++++
 .../dockerfiles/debian-loongarch-cross.docker |  5 ++++
 .../dockerfiles/debian-m68k-cross.docker      |  5 ++++
 .../dockerfiles/debian-mips-cross.docker      |  5 ++++
 .../dockerfiles/debian-mips64-cross.docker    |  5 ++++
 .../dockerfiles/debian-mips64el-cross.docker  |  5 ++++
 .../dockerfiles/debian-mipsel-cross.docker    |  5 ++++
 tests/docker/dockerfiles/debian-native.docker |  5 ++++
 .../debian-powerpc-test-cross.docker          |  6 ++++-
 .../dockerfiles/debian-ppc64el-cross.docker   |  5 ++++
 .../dockerfiles/debian-riscv64-cross.docker   |  5 ++++
 .../debian-riscv64-test-cross.docker          |  5 ++++
 .../dockerfiles/debian-s390x-cross.docker     |  5 ++++
 .../dockerfiles/debian-sh4-cross.docker       |  5 ++++
 .../dockerfiles/debian-sparc64-cross.docker   |  5 ++++
 .../dockerfiles/debian-toolchain.docker       |  9 +++++--
 .../dockerfiles/debian-tricore-cross.docker   |  5 ++++
 .../dockerfiles/debian-xtensa-cross.docker    |  5 ++++
 .../dockerfiles/fedora-cris-cross.docker      |  5 ++++
 .../dockerfiles/fedora-i386-cross.docker      |  5 ++++
 .../dockerfiles/fedora-win32-cross.docker     |  5 ++++
 .../dockerfiles/fedora-win64-cross.docker     |  5 ++++
 tests/docker/dockerfiles/fedora.docker        |  5 ++++
 tests/docker/dockerfiles/opensuse-leap.docker |  5 ++++
 tests/docker/dockerfiles/python.docker        |  5 ++++
 tests/docker/dockerfiles/ubuntu2004.docker    |  5 ++++
 tests/docker/dockerfiles/ubuntu2204.docker    |  5 ++++
 tests/lcitool/refresh                         | 11 +++++++-
 44 files changed, 240 insertions(+), 29 deletions(-)

-- 
2.39.1


