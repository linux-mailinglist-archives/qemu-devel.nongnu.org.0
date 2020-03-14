Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA541185617
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Mar 2020 18:28:51 +0100 (CET)
Received: from localhost ([::1]:46734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDAag-0000wr-Bd
	for lists+qemu-devel@lfdr.de; Sat, 14 Mar 2020 13:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42896)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1jDAZZ-0007oN-OD
 for qemu-devel@nongnu.org; Sat, 14 Mar 2020 13:27:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1jDAZY-0005AL-Nt
 for qemu-devel@nongnu.org; Sat, 14 Mar 2020 13:27:41 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:37642)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1jDAZY-00052P-II; Sat, 14 Mar 2020 13:27:40 -0400
Received: by mail-pg1-x543.google.com with SMTP id a32so6072310pga.4;
 Sat, 14 Mar 2020 10:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=3Wr1iKY+3+Cwn9cBDpqiD25J8x1QXx5pF5dgf5Mmwr8=;
 b=TvZa+8/uX6LVj++QGlIRcVw/HWoQqHrP/tl5FsO7x3QPXD0Png4zeuDY6vV1j5wXIc
 /XRDZBeg1jZxseIgZA2SvAnBsspusKQW0PFlbrYn0DewXAGKeLwzmfi4fqNNGg8zE7Eu
 ZoSdALnhttf9C0mnafW56jfANWYAPVUbH6clkfp5i3O9Fn+ZRdkD6zSXrQa88b+eSy0G
 SIdYlNuFNjzPApv7axU6Y10PA5w44B/FqowemM1e4lgvVLu7vQFr8qVj1mULcRSJc2o+
 3WusOZqcFnXAf6hE7qw03aXkpQNcBX78AHGJDqFVZ2TIjt+rfNFrUUAl7bxXyln+Udup
 F0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=3Wr1iKY+3+Cwn9cBDpqiD25J8x1QXx5pF5dgf5Mmwr8=;
 b=dmmq5O6yVDRT9ccfJOEo6InIiLFMsCBAhTIpeHFUAhjYp9WoVsy8Er9KRd7sAquPny
 uu8Yz87KlIDZQ6yI3b/QE58VQrjqKrCDAhnm1Hq5bNicfGnpq1b79qC/emzVhYGY744Y
 pB75L22S61JPo3yNZNZXBADthuPF5PMNagv48ffAp7qLn4KGzJZh5edzxMM3Z0CFF/zR
 JCh3YRWtEcDZCRIMDyFfTtMEcEicfY/wA6ulF9Hula5O5DFILErS3kufy4RveBCu0k3v
 ZANhP5Dj8V2PHTjOnhYKSjhPYfhg0kjBdRWMnf3e5YE6hQtmualtq3G/Q+9xzuQoIJUL
 eEsg==
X-Gm-Message-State: ANhLgQ3Gh83RRZMh7Wd6mJJ9KfY3aodBayqR7xgS0mGX6q6ayhBa6MSb
 OUztMeWTsL7kr9UiZ3Th5Sw=
X-Google-Smtp-Source: ADFU+vuB/OZDKxYu4r4LW3AHL9m4y3WVqXMVFJuQ9ftl7kvfNOt91m2APoE5zJ+5Hv/ojRsSpSV9AQ==
X-Received: by 2002:a63:c042:: with SMTP id z2mr18695934pgi.160.1584206859137; 
 Sat, 14 Mar 2020 10:27:39 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id g5sm11126496pfo.192.2020.03.14.10.27.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 14 Mar 2020 10:27:38 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 0/8] hw/arm: Implement i.MX watchdog support
Date: Sat, 14 Mar 2020 10:27:28 -0700
Message-Id: <20200314172736.24528-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-devel@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current i.MX watchdog implementation only supports resets.
This patch series implements the full watchdog, including optional
pretimeout support.

Notable changes:
- The existing i.MX watchdog emulation (which only emulates syste resets)
  is moved from hw/misc to hw/watchdog and renamed to match the naming
  convention in hw/watchdog (patch 1/8).
- Full watchdog support is implemented in patch 2/8.
- The watchdog is wired up for i.MX25 and i.MX31 emulations (patch 3/8 and
  4/8).
- The watchdog interrupt (for pretimeout support) is connected for
  i.MX6, i.MX6UL, and i.MX7 emulations (patch 5/8, 6/8, and 8/8).
- For i.MX7, various devices are wired up as unimplemented
  devices (patch 7/8). This was necessary to avoid crashes when
  booting recent Linux kernels.

The code was tested with all available emulations.

----------------------------------------------------------------
Guenter Roeck (8):
      hw: Move i.MX watchdog driver to hw/watchdog
      hw/watchdog: Implement full i.MX watchdog support
      hw/arm/fsl-imx25: Wire up watchdog
      hw/arm/fsl-imx31: Wire up watchdog
      hw/arm/fsl-imx6: Connect watchdog interrupts
      hw/arm/fsl-imx6ul: Connect watchdog interrupts
      hw/arm/fsl-imx7: Instantiate various unimplemented devices
      hw/arm/fsl-imx7: Connect watchdog interrupts

 MAINTAINERS                    |   2 +
 hw/arm/fsl-imx25.c             |  10 ++
 hw/arm/fsl-imx31.c             |   6 +
 hw/arm/fsl-imx6.c              |   9 ++
 hw/arm/fsl-imx6ul.c            |  10 ++
 hw/arm/fsl-imx7.c              |  35 ++++++
 hw/misc/Makefile.objs          |   1 -
 hw/misc/imx2_wdt.c             |  90 --------------
 hw/watchdog/Kconfig            |   5 +
 hw/watchdog/Makefile.objs      |   1 +
 hw/watchdog/wdt_imx2.c         | 262 +++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/fsl-imx25.h     |   5 +
 include/hw/arm/fsl-imx31.h     |   4 +
 include/hw/arm/fsl-imx6.h      |   2 +-
 include/hw/arm/fsl-imx6ul.h    |   2 +-
 include/hw/arm/fsl-imx7.h      |  23 +++-
 include/hw/misc/imx2_wdt.h     |  33 ------
 include/hw/watchdog/wdt_imx2.h |  78 ++++++++++++
 18 files changed, 451 insertions(+), 127 deletions(-)
 delete mode 100644 hw/misc/imx2_wdt.c
 create mode 100644 hw/watchdog/wdt_imx2.c
 delete mode 100644 include/hw/misc/imx2_wdt.h
 create mode 100644 include/hw/watchdog/wdt_imx2.h

