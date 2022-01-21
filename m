Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F55495DE4
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 11:42:56 +0100 (CET)
Received: from localhost ([::1]:57358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nArNe-00072r-Ij
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 05:42:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nArHR-0003Jr-Gs; Fri, 21 Jan 2022 05:36:29 -0500
Received: from [2a00:1450:4864:20::332] (port=39639
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nArHP-0003Ke-Jt; Fri, 21 Jan 2022 05:36:29 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 o1-20020a1c4d01000000b0034d95625e1fso13528368wmh.4; 
 Fri, 21 Jan 2022 02:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7+/WXeElHlEqcJsnEIRZVtiQ/tUXGS1nhOPPYcxzZHo=;
 b=HmrRv2IPFeO+uQLT0ofixhMIIcU1hXwhqu+goDbrV+Ma23qjXSzoFLLMbaRtYowtwE
 Ojy5DSPnqgjeNKsleVufWJ+bEGSj4mNjqJbHEkFRK+q5ZpLJluBZkmkzOMANwbskcZCg
 t2lc3y7K21uAeu6Tpo0k1biJhtM2Km5UQWoL/+GhliFKfpWy+5oIApkSohAxQlUtB8TZ
 YvuMREejPGfMD1Az0xdbPYtrw5VOWq1OHXniCwGGIiVZqFBjdsh0XsQy6cygUtiwSVYA
 wa9M7lsqTmYzrwV0jTBfIAFN3AxDprNFi1dsGv9Tg+h/ZVZsu8hkz62e7cCA/SlmUCJU
 xPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=7+/WXeElHlEqcJsnEIRZVtiQ/tUXGS1nhOPPYcxzZHo=;
 b=B3ndBcpwnY4/o4BhOqRf7cNSE9ogahiPhhYfm3FUbKCjQn3YH3JgaAgJY1Cg1cZ20L
 GbwLYG3M5P2UKWoNF9V+VSCqmo4VhQtLummhrclqb54JUV3RHdL6kqffcZZnw6DnnBSA
 7Dxx+0h76E/gBCdxhYCJ8CyjCSTbgAb/YAC5DZAzkSBgA5a2+njcKLJM/PCxJbdpMl/R
 ZZPm5z5qZOTKWxM+3W/oEBWQF6gj1Ab4Ghv7qjBFXOtRVi7lBzuthYkfjF92QS3g5mir
 yC/uIEzKrPkRKcuyPT6o0xIu4i3MAdTLwMDkkLJsQ46j9buGXC2Kflic7cuDMXBdHbcI
 1Ggw==
X-Gm-Message-State: AOAM531H8iwoDo3qy4+0SYAtQHUMivopB3wqiTaVPSKwXR7dPy7GEwQL
 z7OXw7WslP/hFnM7StsxvO8k63tPmEU=
X-Google-Smtp-Source: ABdhPJxqUkiap4NfU2J2HmvClQG2KD6I3TLVw0xebCO2EMortR0FS4Xh7S+maDhF9U0vxt0sKpUptQ==
X-Received: by 2002:a7b:c4c1:: with SMTP id g1mr123562wmk.69.1642761385312;
 Fri, 21 Jan 2022 02:36:25 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 f8sm4498948wmg.44.2022.01.21.02.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 02:36:24 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yonggang Luo <luoyonggang@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 0/8] tests: Refresh lcitool submodule & remove libxml2
Date: Fri, 21 Jan 2022 11:36:15 +0100
Message-Id: <20220121103623.288054-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Missing review: Patch #2 (new)=0D
=0D
Refresh lcitool to latest and remove libxml2 (mjt).=0D
=0D
v4:=0D
- Fixed typos and cleaned checkpatch.pl (thuth)=0D
- Corrected libvirt-ci submodule URL=0D
=0D
v3:=0D
- fix 'refresh' helper to update cirrus-ci files (danpb)=0D
=0D
v2:=0D
- rebased (testing/next)=0D
- include mjt's libxml2 removal patch=0D
=0D
Michael Tokarev (1):=0D
  drop libxml2 checks since libxml is not actually used (for parallels)=0D
=0D
Philippe Mathieu-Daud=C3=A9 (7):=0D
  MAINTAINERS: Cover lcitool submodule with build test / automation=0D
  gitmodules: Correct libvirt-ci URL=0D
  tests/lcitool: Include local qemu.yml when refreshing cirrus-ci files=0D
  tests: Refresh lcitool submodule=0D
  tests/lcitool: Install libibumad to cover RDMA on Debian based distros=0D
  tests/lcitool: Remove libxml2=0D
  tests: Manually remove libxml2 on MSYS2 runners=0D
=0D
 meson.build                                     | 6 ------=0D
 .cirrus.yml                                     | 1 -=0D
 .gitlab-ci.d/cirrus/freebsd-12.vars             | 2 +-=0D
 .gitlab-ci.d/cirrus/freebsd-13.vars             | 2 +-=0D
 .gitlab-ci.d/cirrus/macos-11.vars               | 2 +-=0D
 .gitlab-ci.d/windows.yml                        | 2 --=0D
 .gitmodules                                     | 2 +-=0D
 MAINTAINERS                                     | 1 +=0D
 block/meson.build                               | 3 +--=0D
 meson_options.txt                               | 2 --=0D
 scripts/checkpatch.pl                           | 1 -=0D
 scripts/ci/org.centos/stream/8/x86_64/configure | 1 -=0D
 scripts/coverity-scan/coverity-scan.docker      | 1 -=0D
 scripts/coverity-scan/run-coverity-scan         | 2 +-=0D
 tests/docker/dockerfiles/alpine.docker          | 4 ++--=0D
 tests/docker/dockerfiles/centos8.docker         | 4 +---=0D
 tests/docker/dockerfiles/fedora.docker          | 4 +---=0D
 tests/docker/dockerfiles/opensuse-leap.docker   | 3 +--=0D
 tests/docker/dockerfiles/ubuntu1804.docker      | 4 ++--=0D
 tests/docker/dockerfiles/ubuntu2004.docker      | 4 ++--=0D
 tests/lcitool/libvirt-ci                        | 2 +-=0D
 tests/lcitool/projects/qemu.yml                 | 2 +-=0D
 tests/lcitool/refresh                           | 2 +-=0D
 23 files changed, 19 insertions(+), 38 deletions(-)=0D
=0D
-- =0D
2.34.1=0D
=0D

