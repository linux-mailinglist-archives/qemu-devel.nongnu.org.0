Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B5A6FE12B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:08:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwlPX-00075K-QR; Wed, 10 May 2023 11:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwlPD-0006qu-Ll
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:07:03 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwlPB-0001VZ-CE
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:07:03 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3064099f9b6so4759477f8f.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683731219; x=1686323219;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FmaATaURdWtXPFfTLAiHf4fq56aqPCzIZj7tGr/NqSE=;
 b=QgQX99YkeW4PPFIGHOqKMKHl0UdCFGxAU1SvaxvfbEbMVKzYs9jqKh9g9Z2YYAcK43
 snKpRIhJKfR9p15HMLd7h6SPwkU3/mLQVc660nYinYsD4QIe8ytgxlakO+8Kgtopv0fJ
 ZODPxxfW/sXFng87cx7UQUfXgmc8piKJDcJrYY7LosDJ/3eCkzUb8gX/rneNpwYcbAoQ
 YvWU2aN3I+F7ldLaDdU5UqAqRPP025jG71LbYDV3SKEhGk1/Yq0JYdkaGRp72e3PENBf
 9Z32tjWhtFn5GGAeiZNzz6B8GwmnN13y74F7TbPICJJSA/ofAhkfC47lq/28vO41glu/
 LvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683731220; x=1686323220;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FmaATaURdWtXPFfTLAiHf4fq56aqPCzIZj7tGr/NqSE=;
 b=G1KSYcmUj33NlyiU1lVPttE+G/mphdfNgOT8Fjjsj+iN46hlRhTyov7GbRCj7yass6
 wxn1YcwhpxmJfFfCm2pIPsKEovYndF7EIQvmtRFmBal/iNFzbb3mnJRo0seYeJQPSgIi
 gEbns8kbac/CqJeUeZvKx9096OTpCBnqrdTINtVWH3TAtfNPSB8z3YnuareHCgXgrHkV
 Q4cEYcSEpkeP1VGUtu9SGlLn6Vq2JVZnYV5gYeYxwELfQKuDzsxUP5zpyjojNo8ReEBS
 hJ2N+ouLizv+xD/Aq4BjJqHPFB4/Oke/IwbuFcoyrQE6llFFs1LsWOQs81eGPQiwG8B1
 yxQA==
X-Gm-Message-State: AC+VfDz88veeilO1YvFG2HXwFhhyKF1vfxF3TWynb8G0QG2VAOl+0Cdr
 SokKf2Mdg2LsSTbKgaYVjU1eorlHJ68l0ik9w/d5dg==
X-Google-Smtp-Source: ACHHUZ4BkKnkvpxBbtJqztLckAy5E99cnKqg0z2uwsI9zO2U40u/5rgUShivhZf2i4HWs5hHqDirVQ==
X-Received: by 2002:adf:e74b:0:b0:307:a8e8:ca80 with SMTP id
 c11-20020adfe74b000000b00307a8e8ca80mr4495461wrn.18.1683731219697; 
 Wed, 10 May 2023 08:06:59 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a5d4c42000000b003063db8f45bsm17578370wrt.23.2023.05.10.08.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 08:06:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AC6A21FFBB;
 Wed, 10 May 2023 16:06:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 0/8] testing and misc (docker, docs, ci scripts, gitlab, avocado,
 Kconfig)
Date: Wed, 10 May 2023 16:06:50 +0100
Message-Id: <20230510150658.1399087-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit 568992e3440f11897e209bf676aa5b93251385fa:

  Merge tag 'pull-qapi-2023-05-09-v2' of https://repo.or.cz/qemu/armbru into staging (2023-05-10 13:11:29 +0100)

are available in the Git repository at:

  https://gitlab.com/stsquad/qemu.git tags/pull-testing-updates-100523-1

for you to fetch changes up to b9353acfd7ae1fc59a64b9aea34bd77a415751d1:

  hw/arm: Select XLNX_USB_SUBSYS for xlnx-zcu102 machine (2023-05-10 16:02:58 +0100)

----------------------------------------------------------------
Testing updates:

  - fix up xtensa docker container base to current Debian
  - document breakpoint and watchpoint support
  - clean up the ansible scripts for Ubuntu 22.04
  - add a minimal device profile
  - drop https on mipsdistros URL
  - fix Kconfig bug for XLNX_VERSAL

----------------------------------------------------------------
Alex Bennée (7):
      tests/docker: bump the xtensa base to debian:11-slim
      docs: document breakpoint and watchpoint support
      scripts/ci: add gitlab-runner to kvm group
      scripts/ci: clean-up the 20.04/22.04 confusion in ansible
      gitlab: add ubuntu-22.04-aarch64-without-defaults
      gitlab: enable minimal device profile for aarch64 --disable-tcg
      tests/avocado: use http for mipsdistros.mips.com

Fabiano Rosas (1):
      hw/arm: Select XLNX_USB_SUBSYS for xlnx-zcu102 machine

 docs/system/gdb.rst                                |  22 ++++
 .../custom-runners/ubuntu-22.04-aarch32.yml        |   2 +-
 .../custom-runners/ubuntu-22.04-aarch64.yml        |  28 +++++-
 hw/arm/Kconfig                                     |   1 +
 hw/usb/Kconfig                                     |   1 -
 scripts/ci/setup/build-environment.yml             | 111 ++++++++++++++-------
 scripts/ci/setup/gitlab-runner.yml                 |   1 +
 tests/avocado/replay_kernel.py                     |   6 +-
 .../docker/dockerfiles/debian-xtensa-cross.docker  |   2 +-
 9 files changed, 131 insertions(+), 43 deletions(-)

-- 
2.39.2


