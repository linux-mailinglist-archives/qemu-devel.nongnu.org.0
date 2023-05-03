Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9676F542A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:13:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8Xh-0003oE-0f; Wed, 03 May 2023 05:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8Xa-0003S2-HZ
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:12:50 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8XY-0005r1-HL
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:12:50 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f4000ec74aso1082905e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683105166; x=1685697166;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ayRTBxcZEO0ny3cCH5agurxRa36BAwioQy1x/Qczotk=;
 b=WOCDPI7G4rKd8vedKcXKOmrGkTjPpqANaNLh4nxj1hcvNV3oVq8U6iBYHscrsJTesK
 Xh/eYLbidVduQm6nCOjfhO7c/TPHwwJZQ5FFd+JfLMK5+0cJPnssZc8ZkIY9BrJNX0G4
 kcwYUPXBBPqP7N/SL4BenYf8g7xDrwA3ovQqs6mes2RSJI4HnOmx8NWRZU7uLKTkkeu9
 T0LtLItObNxApa4EugO8jf12evRpgXIjopbZ5MDtDIrqpEU0pbSnnuvo4nkpkeKoJpYP
 J3BnzJWBuFoK3zxxlehtnye6vpKAtW4UkSHhnJXifvBasQ0Low0rXE0pKWaolvszNvmR
 7R7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105166; x=1685697166;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ayRTBxcZEO0ny3cCH5agurxRa36BAwioQy1x/Qczotk=;
 b=MkFROoWSpf40QlbQdwr645u3gLR9qkxhWbjyAKtlJ35Xs9WuATasI4TCrUGOUtT/+m
 heUQVHCJ74tJuDPjPwfejQdfHPS0JpXpEWfmCgCzfE8q6nPaHPylgseEXJa+V5XEhQa/
 cgWFWMVueXcurPvVF0mSguY1wpQIE+5o8X5opYloe22YI6yF8O3hVMNyGqSEGrqw6fBg
 l/xL6FSF62iNLw+hq0TRwBIcklC7O7QrpmZBWuoHwyOVqls85tg5xmVQXd+mmAWBwW44
 kr9nD7Po4w69CS3eHRyMqiLPoFLh06IoqoILiWv7v9qXRhUmS4t8qzRFIUD6mNmSN5y3
 aqcA==
X-Gm-Message-State: AC+VfDz9aUaHe3pEIfreASlXOCKMnwR2wEJD0WI0uOIcsCRO/AkXUjeQ
 m4wE9HobsNZAYqk1P8vmnnY6Dw==
X-Google-Smtp-Source: ACHHUZ7j8KMEoGka+f3gdXXKxNQ3gpwAU3wII39470xP0Db7mniinpCqgnk+gWNdyrt++/rS4x1nsw==
X-Received: by 2002:a1c:7916:0:b0:3f1:952c:3c70 with SMTP id
 l22-20020a1c7916000000b003f1952c3c70mr13732471wme.40.1683105165990; 
 Wed, 03 May 2023 02:12:45 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a05600c220a00b003f17122587bsm1257673wml.36.2023.05.03.02.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 02:12:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0B7E31FFBA;
 Wed,  3 May 2023 10:12:45 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Helge Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/22] testing/next: cirrus, docker, docs, ci, configs, gitlab
Date: Wed,  3 May 2023 10:12:22 +0100
Message-Id: <20230503091244.1450613-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

This started as trying to un-wedge the FreeBSD 13 failure by running a
restricted build but then led down a rabbit hole of getting the
--without-default-devices build to pass. Fabiano had already been down
some of this road with ARM so I've nabbed his patches here but feel
free to cherry-pick into the arch tree if needed.

There are also patches to clean up the ansible configuration (driven
via lcitool) and prepare for upgrading the s390x runner to ubuntu
22.04.

Please review.

Alex Bennée (16):
  gitlab/cirrus: reduce scope of the FreeBSD testing matrix
  tests/docker: bump the xtensa base to debian:11-slim
  docs: document breakpoint and watchpoint support
  scripts/ci: add gitlab-runner to kvm group
  hw/alpha: make E1000_PCI a hard dependency for clipper
  hw/hppa: add TULIP as a dependency for HPPA_B160L
  hw/sparc: add a TCX dependency for SUN4M machines
  hw/loongarch: add VIRTIO as a dependency for LOONGARCH_VIRT
  hw/sh4: make RTL8139 a hard dependency for RD2
  hw/mips: add VIRTIO and USB dependencies for LOONGSON3V
  hw/xtensa: add VIRTIO as dependencies for XTENSA_VIRT
  scripts/ci: clean-up the 20.04/22.04 confusion in ansible
  gitlab: add ubuntu-22.04-aarch64-without-defaults
  gitlab: enable minimal device profoile for aarch64 --disable-tcg
  tests/avocado: use http for mipsdistros.mips.com
  tests/qtest: skip bcm2835-test if no raspi3b model

Fabiano Rosas (6):
  hw/arm: Select VIRTIO_NET for virt machine
  hw/arm: Select VIRTIO_BLK for virt machine
  hw/arm: Select XLNX_USB_SUBSYS for xlnx-zcu102 machine
  hw/arm: Select GICV3_TCG for sbsa-ref machine
  hw/arm: Select e1000e for sbsa-ref machine
  hw/arm: Select VGA_PCI for sbsa-ref machine

 docs/system/gdb.rst                           |  22 ++++
 tests/qtest/bcm2835-dma-test.c                |  11 +-
 .gitlab-ci.d/cirrus.yml                       |   1 +
 .../custom-runners/ubuntu-22.04-aarch32.yml   |   2 +-
 .../custom-runners/ubuntu-22.04-aarch64.yml   |  28 ++++-
 hw/alpha/Kconfig                              |   2 +-
 hw/arm/Kconfig                                |   7 ++
 hw/hppa/Kconfig                               |   1 +
 hw/loongarch/Kconfig                          |   2 +
 hw/mips/Kconfig                               |   3 +
 hw/sh4/Kconfig                                |   2 +-
 hw/sparc/Kconfig                              |   1 +
 hw/usb/Kconfig                                |   1 -
 hw/xtensa/Kconfig                             |   2 +
 scripts/ci/setup/build-environment.yml        | 111 ++++++++++++------
 scripts/ci/setup/gitlab-runner.yml            |   1 +
 tests/avocado/replay_kernel.py                |   6 +-
 .../dockerfiles/debian-xtensa-cross.docker    |   2 +-
 18 files changed, 154 insertions(+), 51 deletions(-)

-- 
2.39.2


