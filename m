Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B16BF66479B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 18:43:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFHjX-0003nj-P2; Tue, 10 Jan 2023 11:44:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHjS-0003iO-JD
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:44:14 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHjQ-000670-2S
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:44:13 -0500
Received: by mail-wr1-x435.google.com with SMTP id d17so12433012wrs.2
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CPwog7s6qoO9BZW8ROM2vT1B0KSgnjrgal2QWFXh9rY=;
 b=AGJDF0/SUFvufs1KEMv/KU+dp1USHFJlRTapZjtO7A2qyyMYd3LSwiz0z+CHHSGbok
 l0aaswSGgU12VI0HRB0ZVa9v8t5xDbrI2JT0o6xCfGqZI7RsmmlZno7ixVzwe6sJ1H6F
 OE/njecxvVUKH/pM0Tv5d0bKvCxCLL+jzato49dThhQCzSeQwz5Ewupx9Eu/U3sMgNBR
 d3+WWqmfh702tbR1qwTgkIVOgDVEHW64jPUp83jICNVeqnCKCjSoPiRV6iqkDpUCv1UH
 sSsVoHTLBmHhc26Bk/+cJ0dHTw1oGhy3kTguPsqt+w5MP5v35tytGIJDauHbrVN3qnvS
 g7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CPwog7s6qoO9BZW8ROM2vT1B0KSgnjrgal2QWFXh9rY=;
 b=Uyd9WVd7YESj9Twzol6yP29euqahGqFzHUQBcm5dCcvRc/ELRM12U4B9gWx7XsZGjJ
 bBArHWJ4YF+6QId/T2UDeBTfHQqj64zg1MYI6O+sv4Pb92dpt2oXcbAMmj+cQvRFA99A
 X6ACqctotW6mTlh4EFf+GUK+VhTYbzTTbiEqpODIgpY6okNSene1a1vwQ6tpgLe30yfy
 +uWfDpXJISsdgRrPxR/snN0KODu0hs7B98DsTE/uZuFcZeSTZWFgchPgnXdOfoexH60x
 zIE/HUqbRj1k1P7Rqe99f9FvhzjkncKsYFRoMQ2WaqkOpDaQGXnFQArRhu8cDiamq6uH
 FrPw==
X-Gm-Message-State: AFqh2koEFFTEa5XeOSomtL4hx9Ukn8rMUO+vCEnAA5+cjceGv5i6DlGy
 gtAH9q1yoEHAPPlLg+Rtd4wkkYgBqWJEP8Gh
X-Google-Smtp-Source: AMrXdXujrrKV7oxT7ZtJAwu9boVQVIvovlhTXC0OmpCTNWW4WpL7amxPolhtBmYRXJp2JPlwlH2lqg==
X-Received: by 2002:a05:6000:148:b0:2bb:dc79:17dc with SMTP id
 r8-20020a056000014800b002bbdc7917dcmr7276080wrx.19.1673369050311; 
 Tue, 10 Jan 2023 08:44:10 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a5d44d2000000b002368f6b56desm13995150wrr.18.2023.01.10.08.44.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 08:44:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 Rob Herring <robh@kernel.org>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Beniamino Galvani <b.galvani@gmail.com>
Subject: [PATCH 00/18] hw/arm: Move various objects to softmmu_ss to build
 them once (part 1)
Date: Tue, 10 Jan 2023 17:43:48 +0100
Message-Id: <20230110164406.94366-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

This series unifies various objects from libqemu-arm-softmmu.fa.p
and libqemu-aarch64-softmmu.fa.p into libcommon.fa.p.

So instead of building each object twice, one for 32-bit ARM ARM
and another for 64-bit Aarch64, hardware-related objects are built
once.

Part #1 is the low hanging fruits :) Also I cut the series under
20 patches to ease review digestion.

The overall logic is to only access ARMCPU as opaque pointer when
possible. This way we don't depend on the (target/arm/) "cpu.h"
header which contains target-specific definitions and forces units
to be added in Meson's arm_ss[] specific source set.

In order to reduce use of "target/arm/cpu.h" by hardware units,
we split the hardware-facing definitions in the new "hw/arm/cpu.h"
header.

Finally, instead of using object_initialize() on the full ARMCPU
variable, we use object_new(TYPE ARM_CPU). Since QOM types are
registered with their class/instance size, we don't need to provide
sizeof(ARMCPU) to allocate the object.

Please review,

Phil.

Based-on: <20230109115316.2235-1-philmd@linaro.org>
          "hw/arm: Cleanups before pflash refactor"

Philippe Mathieu-Daudé (18):
  hw/arm: Move various units to softmmu_ss[]
  hw/arm/boot: Include missing 'exec/cpu-all.h' header
  target/arm/cpregs: Include missing 'target/arm/cpu.h' header
  hw/arm: Use full "target/arm/cpu.h" path to include target's "cpu.h"
  target/arm: Move CPU QOM type definitions to "hw/arm/cpu.h"
  target/arm: Move CPU definitions consumed by HW model to
    "hw/arm/cpu.h"
  hw/arm: Move more units to softmmu_ss[]
  hw/arm: Move units to softmmu[] by replacing "{target ->
    hw}/arm/cpu.h"
  hw/arm/armv7m: Remove 'target/arm/cpu.h' from NVIC header
  hw/arm: Move various armv7m-related units to softmmu_ss[]
  hw/arm/digic: Remove unnecessary target_long use
  hw/arm/digic: Replace object_initialize(ARMCPU) by object_new(ARMCPU)
  hw/arm/fsl-imx: Correct GPIO/GPT index in QOM tree
  hw/arm/fsl-imx25: Replace object_initialize(ARMCPU) by object_new()
  hw/arm/fsl-imx31: Replace object_initialize(ARMCPU) by object_new()
  hw/arm/fsl-imx7: Replace object_initialize(ARMCPU) by object_new()
  hw/arm/fsl-imx6: Replace object_initialize(ARMCPU) by object_new()
  hw/arm/allwinner: Replace object_initialize(ARMCPU) by object_new()

 hw/arm/allwinner-a10.c         | 10 ++--
 hw/arm/allwinner-h3.c          | 14 +++---
 hw/arm/armv7m.c                |  2 +
 hw/arm/boot.c                  |  1 +
 hw/arm/collie.c                |  1 -
 hw/arm/cubieboard.c            |  2 +-
 hw/arm/digic.c                 |  7 +--
 hw/arm/digic_boards.c          |  2 +-
 hw/arm/fsl-imx25.c             |  9 ++--
 hw/arm/fsl-imx31.c             |  9 ++--
 hw/arm/fsl-imx6.c              | 14 +++---
 hw/arm/fsl-imx6ul.c            | 12 ++---
 hw/arm/fsl-imx7.c              | 10 ++--
 hw/arm/gumstix.c               |  1 -
 hw/arm/highbank.c              |  2 +-
 hw/arm/imx25_pdk.c             |  2 +-
 hw/arm/integratorcp.c          |  2 +-
 hw/arm/kzm.c                   |  2 +-
 hw/arm/mainstone.c             |  2 +-
 hw/arm/mcimx6ul-evk.c          |  2 +-
 hw/arm/mcimx7d-sabre.c         |  2 +-
 hw/arm/meson.build             | 83 ++++++++++++++++++----------------
 hw/arm/musicpal.c              |  2 +-
 hw/arm/omap_sx1.c              |  1 -
 hw/arm/palm.c                  |  2 +-
 hw/arm/sabrelite.c             |  2 +-
 hw/arm/spitz.c                 |  2 +-
 hw/arm/strongarm.c             |  2 +-
 hw/arm/z2.c                    |  1 -
 include/hw/arm/allwinner-a10.h |  4 +-
 include/hw/arm/allwinner-h3.h  |  4 +-
 include/hw/arm/cpu.h           | 77 +++++++++++++++++++++++++++++++
 include/hw/arm/digic.h         |  4 +-
 include/hw/arm/fsl-imx25.h     |  4 +-
 include/hw/arm/fsl-imx31.h     |  4 +-
 include/hw/arm/fsl-imx6.h      |  4 +-
 include/hw/arm/fsl-imx6ul.h    |  4 +-
 include/hw/arm/fsl-imx7.h      |  4 +-
 include/hw/intc/armv7m_nvic.h  |  2 +-
 target/arm/cpregs.h            |  2 +
 target/arm/cpu-qom.h           | 28 +-----------
 target/arm/cpu.h               | 42 ++---------------
 42 files changed, 205 insertions(+), 181 deletions(-)
 create mode 100644 include/hw/arm/cpu.h

-- 
2.38.1


