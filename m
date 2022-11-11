Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCBF625D93
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 15:55:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otVRV-00072h-6P; Fri, 11 Nov 2022 09:55:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otVRQ-00070Q-3l
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:55:38 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otVRO-0007wV-9S
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 09:55:35 -0500
Received: by mail-wr1-x431.google.com with SMTP id cl5so6774281wrb.9
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 06:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WoZbi8cBi0LVCbzA0Uq6PcCFe6as0+0Acm3KpJ2Ojms=;
 b=jpsC3gPX5+MYUptuUh/tqIybCkjJ9D5uJn51W9HcY2BkEzqY28ljh00uEGxKyyJGgb
 i8j46bASZGtcvcYAiaXoe70ou/KLn0Gd+h6NhB1qVD6vN7cboTbglFBv/MsKZXq+BWrv
 HNTc/EoqC67yFe2FqXVASC+FYkXVqE6xcmLMk6aCLGcy0gwy8IGououEv2EG21kySjUR
 pYz8Ik0md6J+ECO2VS1XHnSh1X/JY3qCaK22fYGkftRii4Cd/Ol6r/0vSsB+yUIHpnI6
 ZU+VgX1w1yv+iyP7H0axs5VjbEL02zjdeGaNP5jRbSNzP1jySpZoA1OuOtbupYTd5U5/
 kkmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WoZbi8cBi0LVCbzA0Uq6PcCFe6as0+0Acm3KpJ2Ojms=;
 b=RbpW2Qx9FttWdayg+4wsR7+V199xb8jNrPme7SPNBQi2uD5uU/bE3txQrVLL1GoirT
 fblxWjX/nKu5ZLpNQxGZFlYwAo0Lyv6HGMAzhkx7ZSOlr1e0qQmRMvjLdO2mTBTBccsw
 Frzg9NgYyLmZ4ZHjtc4UHODRXlqWI9JFZ2cllYykt2ytdEnNcsIMxLnY8DSwzBvjiIOd
 9+3JgFDMSvmNBncub4JGWUTTMBZS1rm9AiJZRSvj6TULOsd4Y/KC030izuVqyMQTMZY3
 Y3SMIIcfSIofXCgLaSKgIA/XKfDuYYdgYZPJtsjK8HSXEz4/yFuLNX/ZvaPCKOCncoXF
 5+3w==
X-Gm-Message-State: ANoB5pme3CwREj1aOX//P+LUmhV9lmwrIvfzCHC9ZE+FaHr9V42sACGm
 3uCx5Nuq0LDLh++JH/ps3CK0uA==
X-Google-Smtp-Source: AA0mqf4uX+NMiru4erPFaSdQXF5Jws8EFZoTC6nsT90KadRof9/++qTITr9SUP7GtVX1iJOpM/wUjA==
X-Received: by 2002:adf:fa02:0:b0:23e:245b:edf1 with SMTP id
 m2-20020adffa02000000b0023e245bedf1mr1386538wrr.142.1668178531526; 
 Fri, 11 Nov 2022 06:55:31 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a05600c46cc00b003b4ac05a8a4sm11740228wmo.27.2022.11.11.06.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 06:55:30 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F3CAA1FFB7;
 Fri, 11 Nov 2022 14:55:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH for 7.2-rc1 v2 00/12] testing, docs, plugins, arm pre-PR
Date: Fri, 11 Nov 2022 14:55:17 +0000
Message-Id: <20221111145529.4020801-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

Hi,

This is my pre-PR series for the pull request I'm going to send on
Monday in time for Tuesday tagging of rc1. Anything not reviewed will
get dropped from the PR (which probably includes the GICD_IIDR which
was just an annoyance I noticed while debugging Xen for another
series). The following still need review:

 - hw/intc: add implementation of GICD_IIDR to Arm GIC
 - gitlab: integrate coverage report (1 acks, 1 sobs)
 - tests/plugins: add a new vcpu state tracking plugin
 - tests/docker: allow user to override check target

Alex Bennée (9):
  tests/avocado: improve behaviour waiting for login prompts
  tests/docker: allow user to override check target
  docs/devel: add a maintainers section to development process
  docs/devel: make language a little less code centric
  docs/devel: simplify the minimal checklist
  docs/devel: try and improve the language around patch review
  tests/plugins: add a new vcpu state tracking plugin
  gitlab: integrate coverage report
  hw/intc: add implementation of GICD_IIDR to Arm GIC

Cédric Le Goater (1):
  tests/avocado/machine_aspeed.py: Reduce noise on the console for SDK
    tests

Peter Maydell (1):
  tests/avocado: Raise timeout for
    boot_linux.py:BootLinuxPPC64.test_pseries_tcg

Stefan Weil (1):
  Run docker probe only if docker or podman are available

 docs/devel/code-of-conduct.rst           |   2 +
 docs/devel/index-process.rst             |   1 +
 docs/devel/maintainers.rst               | 106 ++++++++++++++++
 docs/devel/submitting-a-patch.rst        | 101 +++++++++------
 docs/devel/submitting-a-pull-request.rst |  12 +-
 configure                                |   2 +-
 hw/intc/arm_gic.c                        |  44 ++++---
 tests/plugin/vcpu.c                      | 153 +++++++++++++++++++++++
 .gitlab-ci.d/buildtest.yml               |  12 +-
 tests/avocado/avocado_qemu/__init__.py   |  89 ++++++++++++-
 tests/avocado/boot_linux.py              |   2 +-
 tests/avocado/machine_aspeed.py          |  17 ++-
 tests/docker/Makefile.include            |   2 +
 tests/docker/common.rc                   |   6 +-
 tests/plugin/meson.build                 |   2 +-
 15 files changed, 480 insertions(+), 71 deletions(-)
 create mode 100644 docs/devel/maintainers.rst
 create mode 100644 tests/plugin/vcpu.c

-- 
2.34.1


