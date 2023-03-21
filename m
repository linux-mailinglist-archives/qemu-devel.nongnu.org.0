Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 894206C32A2
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 14:22:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pebuu-0008WJ-7Y; Tue, 21 Mar 2023 09:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pebus-0008W7-C9
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:20:42 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pebuq-0006aj-GP
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:20:42 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 u11-20020a05600c19cb00b003edcc414997so4576227wmq.3
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 06:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679404838;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=H+njhfU5I1ySEQrTSS52Omt+xuobNchizsxwAO+DZMQ=;
 b=Aokr/gq5bpHm32hUTLHIOngXwvAZ9b8dwe9J9CUDM7uaKP28632C7BrhTi/NpR7Rks
 Tjp6feCzSshrGArBPuUJkV72++hGJuKAfJ2ewGpAOtp4zwkSbcS5jURP0/hJhn4HoBiQ
 WojpFKfztYgMq3UQnZRmoRwuLT66+HlQFlSid0BE2tkwc4r4hC9tgZ2NwLxvL65LOrp2
 XCcj5w4ORHv1/SyxYNJwm+Kdlxq6p+N7STaUYXBaRj2obBYSo/z07sYs/oz67Y/l7set
 JktXBBnQIYl1oAjUT/BemWqBZUHPL46SC2TF9oUuJEjLMWuQOeUaDu9/Y6QQ57b9ysuJ
 HRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679404838;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H+njhfU5I1ySEQrTSS52Omt+xuobNchizsxwAO+DZMQ=;
 b=398z6WRscF9h8xD7FKa4NqE36cWv2bUPeexOp+KlgNRThscLSRPK0kYSJoMqrvHwdN
 q+17d2fLFuzqS14PiNfiCBPIkHZNPw/DSyaMPg9tRFnsUnjJvKP3i1LxAXNYXdo/IqoK
 C5Ltu/62o4BhjXanr7WS/Jzoj5xhqbqXjpYP4nLqmZrT989GdoAr1bW3Xx6tOHODg5q2
 DKdoDyE+6DZgkPyq5HkwwLMSqbuRrcAkdE/P1hY2oDRZd7LE8U/haZaA7eYWerB5ivqy
 THMbJUOsClZdcuSpeRKpjVFlvja8pzt7UcO8tdjbjwJbZZdiPWZxasyiqCC+nDD3ktlZ
 HDXg==
X-Gm-Message-State: AO0yUKUiGGYCjgPN+OtODdresbIdzOodNn/QeM24lOIsG8zpYUCls4lg
 WomjL6zSYKTmbGJKoORMXIg/FoHEgVeANlnOMTc=
X-Google-Smtp-Source: AK7set+SifZkXym7OAvGid3yJpAmmyRyygOgQlY6QVgYoP6YyV7eUX9dELJWFK21OUiYXgvK8GEt9w==
X-Received: by 2002:a7b:c5cd:0:b0:3ed:3d5a:ac99 with SMTP id
 n13-20020a7bc5cd000000b003ed3d5aac99mr2515867wmk.5.1679404838607; 
 Tue, 21 Mar 2023 06:20:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j19-20020a05600c191300b003eddc6aa5fasm7897918wmq.39.2023.03.21.06.20.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 06:20:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/8] target-arm queue
Date: Tue, 21 Mar 2023 13:20:28 +0000
Message-Id: <20230321132036.1836617-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

The following changes since commit aa9e7fa4689d1becb2faf67f65aafcbcf664f1ce:

  Merge tag 'edk2-stable202302-20230320-pull-request' of https://gitlab.com/kraxel/qemu into staging (2023-03-20 13:43:35 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20230321

for you to fetch changes up to 5787d17a42f7af4bd117e5d6bfa54b1fdf93c255:

  target/arm: Don't advertise aarch64-pauth.xml to gdb (2023-03-21 13:19:08 +0000)

----------------------------------------------------------------
target-arm queue:
 * contrib/elf2dmp: Support Windows Server 2022
 * hw/char/cadence_uart: Fix guards on invalid BRGR/BDIV settings
 * target/arm: Add Neoverse-N1 IMPDEF registers
 * hw/usb/imx: Fix out of bounds access in imx_usbphy_read()
 * docs/system/arm/cpu-features.rst: Fix formatting
 * target/arm: Don't advertise aarch64-pauth.xml to gdb

----------------------------------------------------------------
Chen Baozi (1):
      target/arm: Add Neoverse-N1 registers

Guenter Roeck (1):
      hw/usb/imx: Fix out of bounds access in imx_usbphy_read()

Peter Maydell (3):
      hw/char/cadence_uart: Fix guards on invalid BRGR/BDIV settings
      docs/system/arm/cpu-features.rst: Fix formatting
      target/arm: Don't advertise aarch64-pauth.xml to gdb

Viktor Prutyanov (3):
      contrib/elf2dmp: fix code style
      contrib/elf2dmp: move PE dir search to pe_get_data_dir_entry
      contrib/elf2dmp: add PE name check and Windows Server 2022 support

 docs/system/arm/cpu-features.rst |  68 ++++++++++-------------
 contrib/elf2dmp/pe.h             | 115 ++++++++++++++++++++++-----------------
 contrib/elf2dmp/addrspace.c      |   1 +
 contrib/elf2dmp/main.c           | 108 ++++++++++++++++++++++++------------
 hw/char/cadence_uart.c           |   6 +-
 hw/usb/imx-usb-phy.c             |  19 ++++++-
 target/arm/cpu64.c               |  69 +++++++++++++++++++++++
 target/arm/gdbstub.c             |   7 +++
 8 files changed, 267 insertions(+), 126 deletions(-)

