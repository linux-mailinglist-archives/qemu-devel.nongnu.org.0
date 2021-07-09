Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 260693C279B
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:33:17 +0200 (CEST)
Received: from localhost ([::1]:39062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1tRE-0001QW-6S
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1m1tOx-0007EM-MR; Fri, 09 Jul 2021 12:30:55 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36]:43571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1m1tOv-0002Cz-MX; Fri, 09 Jul 2021 12:30:55 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 68-20020a4a00470000b0290258a7ff4058so2401215ooh.10; 
 Fri, 09 Jul 2021 09:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:mime-version
 :content-disposition:content-transfer-encoding;
 bh=VKGwhPniryUD+R7iA2Iuagn+/VdJ/qE11zRU7yzFitA=;
 b=K4tE/03hcPGnf90lYazqs3u4W9G+UsevSHFeqmhO9YDBIqeBg0/dKkfuZOM4MxJTih
 LU/udQDTYMi7phAtMzmTmwczrtbfG0mT8+l1dw4l13Rka+Q00KLUor5oAYVoX2tqiE0K
 SpOaoP4UIEbDpHQoRAy61/rkspw+Tl+oskUaqtcV3mSw4WizMNv9nbFSCsxmfBI/4xlX
 d/q63UP9J9MlA5WU1ZXRzyMfPEfm3u6azZZ6Lug2XG/c0sz61zksvJPD+9WmcOtpmxO2
 KLjR/VBjJeU2szt24O/TvQ7F16lln2foknCBNajxGjq1iF7nd6BnugtGgVg+q/Hmvn5J
 exJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:mime-version:content-disposition:content-transfer-encoding;
 bh=VKGwhPniryUD+R7iA2Iuagn+/VdJ/qE11zRU7yzFitA=;
 b=Lmnvll7Nj7zaV+4nrWj/JUEpzx8jvgP3jSU590tfoZVv+lCRXmi994TcI2rY1LKdnI
 APJNz7Zz4/BMLAY5sPULHgn9vODLNMt2yMkamvZ+xXKdUluGZjGoJPTmoO7ytWF40zHd
 1QJ6yzbGY9Nn8eI9UlNAZI7mCt5vEoicosBr+15Pi4Xq5QbuyIqm/v8zO7fRRQdTleew
 oPoqXqCqtbM+wMQD4aNiREyo7iYTXnTU/bGuLVVF1vo5jPXiHiLwzSdc4V2HBZkyFvJN
 5Bi111Tj6GGIDXIRR7sPGhtQ+tnFxHkHhKxVGQOSvjjlq1W24UI9e9Ck3fTuuwfJ7aw4
 ZEpA==
X-Gm-Message-State: AOAM533JC8HuTLKRijqOI+QJsl5VJ2/+PRfV9Nvx/tG9jVv2QsoLNdGJ
 f5bmLeHXCtvgNwm/k/ym7A==
X-Google-Smtp-Source: ABdhPJyemTc14qt+SFW/TGStkHVcajrLTSTsqQkguFj3IyuEaOCgBWdTfj81GZUAeTmRiddrPKH1lg==
X-Received: by 2002:a4a:8241:: with SMTP id t1mr27441792oog.13.1625848250781; 
 Fri, 09 Jul 2021 09:30:50 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id p5sm1293271oip.35.2021.07.09.09.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 09:30:49 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:81c2:3042:a70b:e5b5])
 by serve.minyard.net (Postfix) with ESMTPSA id C1D7A180058;
 Fri,  9 Jul 2021 16:30:48 +0000 (UTC)
Date: Fri, 9 Jul 2021 11:30:47 -0500
From: Corey Minyard <minyard@acm.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [GIT PULL v2] I2C/IPMI bug fixes for QEMU 6.1
Message-ID: <20210709163047.GC3599@minyard.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=tcminyard@gmail.com; helo=mail-oo1-xc36.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Titus Rwantare <titusr@google.com>, Jinhua Cao <caojinhua1@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 38848ce565849e5b867a5e08022b3c755039c11a:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210616' into staging (2021-06-16 17:02:30 +0100)

are available in the Git repository at:

  https://github.com/cminyard/qemu.git tags/for-qemu-6.1-2

for you to fetch changes up to 7649086f455fe44bd076828749a93ab2a5bb0806:

  tests/qtest: add tests for MAX34451 device model (2021-07-08 14:42:00 -0500)

Changes from v1:

For the 64-bit field in the PMBus patch, use BIT_ULL for the bits to
fix compile issues on 32-bit hosts.

I updated my testing to build and test on a 32-bit host, which proved to
be a bit more challenging than I expected.  But compiled and tested
there, too.

Thank you,

-corey

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
      hw/misc: add ADM1272 device
      tests/qtest: add tests for ADM1272 device model
      hw/misc: add MAX34451 device
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


