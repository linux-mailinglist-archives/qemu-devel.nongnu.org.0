Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D343BDE43
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 22:07:38 +0200 (CEST)
Received: from localhost ([::1]:55800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0rM1-0007vc-2Y
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 16:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1m0rKZ-0005ZV-4g
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 16:06:07 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:42911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1m0rKV-0007zV-30
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 16:06:06 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 d27-20020a05683018fbb02904ae64d1b56bso2092489otf.9
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 13:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:mime-version
 :content-disposition:content-transfer-encoding;
 bh=eW50wHKOJ2uw4V8lu9xDVjhGN0TvDSRAMIxVL03m33I=;
 b=IdFNA8L8AYJKZT4xDGWyfdTi4hb20GaogNxbknbqZ80yTkIdt2+QszweMO5jP2ht8V
 I+R1DRYmIYSMD9gy7EFVZJTRQOpvdEfPllh3f2mLIkotdFh7n7F5ctQGgG4wmlfwSezN
 lCpuIiOnfo2mknrKCRKDmu8ka62c3a7J0bljy3lvlwV+f5KYEru67zaHAd/cgxk3GMA/
 2Wp0waOvFPKDVhbcxEDlhavbtJoB1gFGvNoqz8XKvuARjLr9v6VY86ZaxK5R3AtObSko
 F5eJb1WwkTYiN2JhnFm4FYwgSdDYSJkCSP31wBx5TMypSpSEHW6YAUtfj1xEewvNIBxZ
 Ak1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:mime-version:content-disposition:content-transfer-encoding;
 bh=eW50wHKOJ2uw4V8lu9xDVjhGN0TvDSRAMIxVL03m33I=;
 b=N0lqoBPMRWB+b1AbPGHR0XHk5eBdtji49sKrdflFriBLVGV36Jl4BKIOrnOt40/WVz
 Jbya8RXNayV2Pidg4pQ2OuVS3zDzCBQxxT18fwz3XeYSWDkHGA2ZYckvUX8ytEX460KD
 ++SyMr7uSOTDGHp9nGT1B9C4opgpr++3D5S2o2OckReZKtir6WpeYv81zb8EAR+IM6rI
 23KZHfdT/qQmTdzYPnYMwPS7EJ6mcXUhIDO+sXbGeS3bjvn/YssB4W6ONlIt2pAZXDJj
 HcRmxVtMXX4UYBviGBFeYpZg/AdbOJR9QFMolvSfnEJ5LVIKeNoRXX01mORNLDTCqOP/
 rnWg==
X-Gm-Message-State: AOAM533uy6ZeC3bq8ml1RkYPwfodz4RdcK6iQt1ifZ1A9RJ2LgQ7593q
 2Xx15VNAiIzQPd/EyuN68Q==
X-Google-Smtp-Source: ABdhPJxxnREA2r5opBJTXFXtd+8Bv3pbrGFa6Mh2HhQAHZcXEbd6GQ1oulRipcGNkQUKsWxSdrSN4Q==
X-Received: by 2002:a9d:5603:: with SMTP id e3mr10142043oti.178.1625601961221; 
 Tue, 06 Jul 2021 13:06:01 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id t15sm3406984oiw.16.2021.07.06.13.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 13:06:00 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:ec58:59b9:1dc0:5361])
 by serve.minyard.net (Postfix) with ESMTPSA id 67F2A180110;
 Tue,  6 Jul 2021 20:05:59 +0000 (UTC)
Date: Tue, 6 Jul 2021 15:05:58 -0500
From: Corey Minyard <minyard@acm.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [GIT PULL] I2C/IPMI bug fixes for QEMU 6.1
Message-ID: <20210706200558.GT2921206@minyard.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=tcminyard@gmail.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 38848ce565849e5b867a5e08022b3c755039c11a:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210616' into staging (2021-06-16 17:02:30 +0100)

are available in the Git repository at:

  https://github.com/cminyard/qemu.git tags/for-qemu-6.1-1

for you to fetch changes up to 7051d605e6b03259e0185dd574f760b93d15fa10:

  ipmi/sim: fix watchdog_expired data type error in IPMIBmcSim struct (2021-06-25 08:54:57 -0500)

----------------------------------------------------------------
Some qemu updates for IPMI and I2C

Move some ADC file to where they belong and move some sensors to a
sensor directory, since with new BMCs coming in lots of different
sensors should be coming in.  Keep from cluttering things up.

Add support for I2C PMBus devices.

Replace the confusing and error-prone i2c_send_recv and i2c_transfer with
specific send and receive functions.  Several errors have already been
made with these, avoid any new errors.

Fix the watchdog_expired field in the IPMI watchdog, it's not a bool,
it's a u8.  After a vmstate transfer, the new value could be wrong.

----------------------------------------------------------------
BALATON Zoltan (1):
      hw/i2c: Make i2c_start_transfer() direction argument a boolean

Corey Minyard (3):
      adc: Move the zynq-xadc file to the adc directories
      adc: Move the max111x driver to the adc directory
      sensor: Move hardware sensors from misc to a sensor directory

Jinhua Cao (1):
      ipmi/sim: fix watchdog_expired data type error in IPMIBmcSim struct

Philippe Mathieu-Daudé (14):
      hw/input/lm832x: Move lm832x_key_event() declaration to "lm832x.h"
      hw/input/lm832x: Define TYPE_LM8323 in public header
      hw/display/sm501: Simplify sm501_i2c_write() logic
      hw/display/sm501: Replace i2c_send_recv() by i2c_recv() & i2c_send()
      hw/i2c/ppc4xx_i2c: Add reference to datasheet
      hw/i2c/ppc4xx_i2c: Replace i2c_send_recv() by i2c_recv() & i2c_send()
      hw/misc/auxbus: Fix MOT/classic I2C mode
      hw/misc/auxbus: Explode READ_I2C / WRITE_I2C_MOT cases
      hw/misc/auxbus: Replace 'is_write' boolean by its value
      hw/misc/auxbus: Replace i2c_send_recv() by i2c_recv() & i2c_send()
      hw/i2c: Remove confusing i2c_send_recv()
      hw/i2c: Rename i2c_set_slave_address() -> i2c_slave_set_address()
      hw/i2c: Extract i2c_do_start_transfer() from i2c_start_transfer()
      hw/i2c: Introduce i2c_start_recv() and i2c_start_send()

Titus Rwantare (5):
      hw/i2c: add support for PMBus
      hw/sensor: add ADM1272 device
      tests/qtest: add tests for ADM1272 device model
      hw/sensor: add MAX34451 device
      tests/qtest: add tests for MAX34451 device model

 MAINTAINERS                                |   11 +-
 hw/Kconfig                                 |    1 +
 hw/adc/Kconfig                             |    3 +
 hw/{misc => adc}/max111x.c                 |    2 +-
 hw/adc/meson.build                         |    2 +
 hw/{misc => adc}/zynq-xadc.c               |    2 +-
 hw/arm/Kconfig                             |    3 +
 hw/arm/aspeed.c                            |    2 +-
 hw/arm/nseries.c                           |    5 +-
 hw/arm/pxa2xx.c                            |    2 +-
 hw/arm/spitz.c                             |    6 +-
 hw/arm/xilinx_zynq.c                       |    2 +-
 hw/display/ati.c                           |    2 +-
 hw/display/sm501.c                         |   16 +-
 hw/display/xlnx_dp.c                       |    2 +-
 hw/i2c/Kconfig                             |    4 +
 hw/i2c/core.c                              |   76 +-
 hw/i2c/imx_i2c.c                           |    2 +-
 hw/i2c/meson.build                         |    1 +
 hw/i2c/pm_smbus.c                          |    4 +-
 hw/i2c/pmbus_device.c                      | 1612 ++++++++++++++++++++++++++++
 hw/i2c/ppc4xx_i2c.c                        |   15 +-
 hw/i2c/smbus_master.c                      |   22 +-
 hw/input/lm832x.c                          |    2 +-
 hw/ipmi/ipmi_bmc_sim.c                     |    4 +-
 hw/meson.build                             |    1 +
 hw/misc/Kconfig                            |   15 -
 hw/misc/auxbus.c                           |   68 +-
 hw/misc/meson.build                        |    6 +-
 hw/sensor/Kconfig                          |   19 +
 hw/sensor/adm1272.c                        |  543 ++++++++++
 hw/{misc => sensor}/emc141x.c              |    2 +-
 hw/sensor/max34451.c                       |  775 +++++++++++++
 hw/sensor/meson.build                      |    5 +
 hw/{misc => sensor}/tmp105.c               |    2 +-
 hw/{misc => sensor}/tmp421.c               |    0
 include/hw/{misc => adc}/max111x.h         |    0
 include/hw/{misc => adc}/zynq-xadc.h       |    0
 include/hw/i2c/i2c.h                       |   46 +-
 include/hw/i2c/pmbus_device.h              |  517 +++++++++
 include/hw/input/lm832x.h                  |   28 +
 include/hw/{misc => sensor}/emc141x_regs.h |    0
 {hw/misc => include/hw/sensor}/tmp105.h    |    2 +-
 include/hw/{misc => sensor}/tmp105_regs.h  |    0
 tests/qtest/adm1272-test.c                 |  445 ++++++++
 tests/qtest/emc141x-test.c                 |    2 +-
 tests/qtest/max34451-test.c                |  336 ++++++
 tests/qtest/meson.build                    |    2 +
 tests/qtest/npcm7xx_smbus-test.c           |    2 +-
 tests/qtest/tmp105-test.c                  |    2 +-
 50 files changed, 4496 insertions(+), 125 deletions(-)
 rename hw/{misc => adc}/max111x.c (99%)
 rename hw/{misc => adc}/zynq-xadc.c (99%)
 create mode 100644 hw/i2c/pmbus_device.c
 create mode 100644 hw/sensor/Kconfig
 create mode 100644 hw/sensor/adm1272.c
 rename hw/{misc => sensor}/emc141x.c (99%)
 create mode 100644 hw/sensor/max34451.c
 create mode 100644 hw/sensor/meson.build
 rename hw/{misc => sensor}/tmp105.c (99%)
 rename hw/{misc => sensor}/tmp421.c (100%)
 rename include/hw/{misc => adc}/max111x.h (100%)
 rename include/hw/{misc => adc}/zynq-xadc.h (100%)
 create mode 100644 include/hw/i2c/pmbus_device.h
 create mode 100644 include/hw/input/lm832x.h
 rename include/hw/{misc => sensor}/emc141x_regs.h (100%)
 rename {hw/misc => include/hw/sensor}/tmp105.h (97%)
 rename include/hw/{misc => sensor}/tmp105_regs.h (100%)
 create mode 100644 tests/qtest/adm1272-test.c
 create mode 100644 tests/qtest/max34451-test.c

