Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAD2633931
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 10:58:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxQ0q-0002NS-Em; Tue, 22 Nov 2022 04:56:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxQ0l-0002I1-T6
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:56:17 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxQ0k-0003YH-2k
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:56:15 -0500
Received: by mail-wr1-x430.google.com with SMTP id g12so23835625wrs.10
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 01:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=paDcNGWbM5EFPnksgTRrlaaBE9Sj+b1OBUcGOM+1DgI=;
 b=lbasTQzMJGCrYp2m2UZg5J/X2TXixAc/+/eNfDFFKV1PhfgI7K1AuB2GxV6WO/46Fa
 N+0fFVF6wuuxvq/DnSW5LMopC4re6CamcQJGNWZQhBsqWa+0FQvdSKHnObwd4MkhROHC
 MsrIE4t2HAp5PFRAyWl7nAsueyreZdpWnhmsUOKY9GcujleNLh5oAlJpghPveLXGr6zj
 O9DboEsbh0Uls55X8VzbPOxxFHJdkpU5FQBGgqp+WC6h1WdWV3VjmhPctm4Ss6SMfgK6
 KzF7gpqX/4kO5FSdS870lUPlmzwPEwkU53QdB9yRmcErSJqsnHAzV89UrASd1xIJH+e+
 GP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=paDcNGWbM5EFPnksgTRrlaaBE9Sj+b1OBUcGOM+1DgI=;
 b=de9Nz25AEjpL4gBaVUw0e6OsxaP9JwRkyhhv77GngimOs+F97ibDZzyhoywqgzDMGo
 SSgpm2cuBfYLug3ZKaGRgs/CmmDG0zRUZIbZM4ePK/9n6WrcJRcRpiuxbgo3+gKjBCRF
 u+APAizuExVv7I7pohEQn48SkLJjo3NIuKEN6mVR4JJdjXKTUIOXNe2huivxexYSopj2
 2DrRlQMS+v+kYWTLktqdsq0YmZbJPGIeDQoEH0sy3dmOU0fIyANV/jaDox4rAETcsmp+
 J7PUVrveRudEkgEXutREp8uuFiptceI8aVihYpHsUB/nnQCh7a3Kl8MZmu0MMtjwYuPf
 P+SQ==
X-Gm-Message-State: ANoB5pkMO0ByZC58vDrH0lEaPzMTR+c1T1vPqToBQlMIiG359Ip2iDnZ
 rX06c4nGsvgNuageHQs9yeHl+g==
X-Google-Smtp-Source: AA0mqf61NGA3vvHB1T7gR2d8e1DNwHmpD5r9p0IdfX+BPLSJFZIzYA7TeLfmxIquQFELKrh6IFH2GQ==
X-Received: by 2002:adf:ed8b:0:b0:241:d375:88b6 with SMTP id
 c11-20020adfed8b000000b00241d37588b6mr5942756wro.88.1669110971383; 
 Tue, 22 Nov 2022 01:56:11 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c20-20020adfa314000000b00241d21d4652sm6866507wrb.21.2022.11.22.01.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 01:56:11 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8C2AC1FFB7;
 Tue, 22 Nov 2022 09:56:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 for 7.2-rc2 00/11] testing and doc updates
Date: Tue, 22 Nov 2022 09:55:59 +0000
Message-Id: <20221122095610.3343175-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The following changes since commit 6d71357a3b651ec9db126e4862b77e13165427f5:

  rtl8139: honor large send MSS value (2022-11-21 09:28:43 -0500)

are available in the Git repository at:

  https://gitlab.com/stsquad/qemu.git tags/pull-misc-for-7.2-221122-1

for you to fetch changes up to 5544d33d4b3683861315c73eb956492ed8891ce8:

  gitlab: integrate coverage report (2022-11-22 09:52:23 +0000)

----------------------------------------------------------------
Testing and doc updates:

  - Only probe if docker or podman binaries in path
  - reduce console noise for aspeed avocado tests
  - update documents on maintainer roles and process
  - raise timeout for ppc64 avocado tests
  - integrate coverage reports into gitlab

----------------------------------------------------------------
Alex Bennée (8):
      tests/docker: allow user to override check target
      docs/devel: add a maintainers section to development process
      docs/devel: make language a little less code centric
      docs/devel: simplify the minimal checklist
      docs/devel: try and improve the language around patch review
      tests/avocado: introduce alpine virt test for CI
      tests/avocado: skip aarch64 cloud TCG tests in CI
      gitlab: integrate coverage report

Cédric Le Goater (1):
      tests/avocado/machine_aspeed.py: Reduce noise on the console for SDK tests

Peter Maydell (1):
      tests/avocado: Raise timeout for boot_linux.py:BootLinuxPPC64.test_pseries_tcg

Stefan Weil (1):
      Run docker probe only if docker or podman are available

 docs/devel/code-of-conduct.rst           |   2 +
 docs/devel/index-process.rst             |   1 +
 docs/devel/maintainers.rst               | 107 +++++++++++++++++++++++++++++++
 docs/devel/submitting-a-patch.rst        | 101 ++++++++++++++++++-----------
 docs/devel/submitting-a-pull-request.rst |  12 ++--
 configure                                |   2 +-
 .gitlab-ci.d/buildtest.yml               |  12 +++-
 MAINTAINERS                              |   2 +-
 tests/avocado/boot_linux.py              |  11 +++-
 tests/avocado/machine_aarch64_virt.py    |  46 ++++++++++++-
 tests/avocado/machine_aspeed.py          |  17 +++--
 tests/docker/Makefile.include            |   2 +
 tests/docker/common.rc                   |   6 +-
 13 files changed, 262 insertions(+), 59 deletions(-)
 create mode 100644 docs/devel/maintainers.rst

-- 
2.34.1


