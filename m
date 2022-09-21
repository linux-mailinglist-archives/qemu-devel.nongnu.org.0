Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B1D5C03D6
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 18:14:48 +0200 (CEST)
Received: from localhost ([::1]:41064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob2N5-0006Jv-1V
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 12:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob2Gm-0003SI-RO
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 12:08:17 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob2Gd-0000c9-AL
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 12:08:15 -0400
Received: by mail-wr1-x42f.google.com with SMTP id g3so10616327wrq.13
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 09:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=pDn5RPMk8SKFxSHbcigTFwa5JSJ57O7ZbLa0GB78pE8=;
 b=IDVcjqx73+t6mmx1YImQweOcm5LDNBPy4Eh/EcQ6XEVe7SJ/B385HAxrHIk+LU5FT/
 rEs3yjWZcoQgKorPdOFsJ2fr+CwFd6ObuSPK4eyQ3kJYthiUtIJ90mIS6A+N6gWszaGT
 yqlSLhuJL9iocQyJJ+I0zR1H0SnmkWuGLxzsYoz/rgJvoJvEw3aIXYNgxkMi1duSmCVi
 UowphKxvkisGbapG8yNgZdx7Nqa2SCLJBtmBgocVr0Ni1Ewv3BKo/XPxVH2E+A74pXej
 F5vsu88yLXMz3wXCEKm4D5Vw03TX1tgTCUYI4wuuYL6zEhscOktcvAY1n7J6MSQPwjuX
 76tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=pDn5RPMk8SKFxSHbcigTFwa5JSJ57O7ZbLa0GB78pE8=;
 b=kvnqeejhOVTai2WfCVhX/y+SwFyLBXGkNM34H6Q5XTHsSJ6zKc3Yt8CSGh71K9bMU/
 z+laQfLs5lZQEN6rTuti1qp7bnhptUZnu2usZ7JnmxNPtcLmVkPdC5PyV5kRa1Fvza4L
 T3GX46qkCrBOdMMJrTeMJckNG8X2oxQnXt8/iZr5zhu3+ZrbToXBxAyP19q4f3Ij5Rbo
 LPlozIdnauairCgQ/iO5GTmXUdu7NRMfWBO4pJpB6JIjijiLqxu9SzaLm7MPxzGIqwsV
 gV9n2PkmwjAEdm3Aq4JXjNmKDfgFqcjCBoXIVKU3WLiZeFottGpIwel4nVaq+6kw+ORW
 1z2A==
X-Gm-Message-State: ACrzQf0uHzNoS/+8Ja4Mu3EajVLO9equ49391Xt+REZdf90hQ00HzxCI
 hCw2DRU8LQXgfW0kl+RiawM4yNTQH+dSKA==
X-Google-Smtp-Source: AMsMyM74sWVz/dyUIV56/xuPWlDiK51wVGzf3OkVx1epY8DmJeUKFyCAKQQbAIVMglZhOMy7tFb5qg==
X-Received: by 2002:a5d:6c62:0:b0:22a:2f59:cb7d with SMTP id
 r2-20020a5d6c62000000b0022a2f59cb7dmr17602134wrz.405.1663776485580; 
 Wed, 21 Sep 2022 09:08:05 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a5d48ce000000b0022afbd02c69sm3130088wrs.56.2022.09.21.09.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 09:08:03 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1AE511FFB7;
 Wed, 21 Sep 2022 17:08:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 00/10] plugins/next (disas, monitor, docs, execlog)
Date: Wed, 21 Sep 2022 17:07:51 +0100
Message-Id: <20220921160801.1490125-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

It has been a while since I last posted the state of my plugins queue.
These are mostly small cleanups and documentation tweaks. I also did a
little bit of tidying up in the disas interface.

The following still need review:

 - docs/devel: document the test plugins
 - contrib/plugins: reset skip when matching in execlog
 - docs/devel: move API to end of tcg-plugins.rst
 - docs/devel: clean-up qemu invocations in tcg-plugins
 - tests/tcg: add memory-sve test for aarch64

Alex Bennée (9):
  monitor: expose monitor_puts to rest of code
  disas: generalise plugin_printf and use for monitor_disas
  disas: use result of ->read_memory_func
  tests/tcg: add memory-sve test for aarch64
  plugins: extend execlog to filter matches
  docs/devel: clean-up qemu invocations in tcg-plugins
  docs/devel: move API to end of tcg-plugins.rst
  contrib/plugins: reset skip when matching in execlog
  docs/devel: document the test plugins

Richard Henderson (1):
  plugins: Assert mmu_idx in range before use in qemu_plugin_get_hwaddr

 docs/devel/tcg-plugins.rst                | 175 +++++++++++++++++++---
 docs/devel/writing-monitor-commands.rst   |   2 +-
 include/monitor/monitor.h                 |   1 +
 monitor/monitor-internal.h                |   1 -
 block/monitor/block-hmp-cmds.c            |  10 +-
 contrib/plugins/execlog.c                 |  99 ++++++++++--
 disas.c                                   |  43 +++---
 disas/capstone.c                          |  73 +++++----
 hw/misc/mos6522.c                         |   2 +-
 monitor/hmp-cmds.c                        |   8 +-
 monitor/hmp.c                             |   2 +-
 plugins/api.c                             |   2 +
 target/i386/helper.c                      |   2 +-
 tests/tcg/aarch64/Makefile.softmmu-target |   7 +
 tests/tcg/aarch64/system/boot.S           |   3 +-
 15 files changed, 336 insertions(+), 94 deletions(-)

-- 
2.34.1


