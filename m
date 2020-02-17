Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D8C161C6F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 21:49:27 +0100 (CET)
Received: from localhost ([::1]:52734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3nKX-0006Yn-VI
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 15:49:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38184)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1j3nJT-0005XE-3r
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 15:48:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1j3nJR-0007Q9-Q9
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 15:48:19 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:33963)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1j3nJP-0007P4-Pw; Mon, 17 Feb 2020 15:48:15 -0500
Received: by mail-pg1-x541.google.com with SMTP id j4so9839552pgi.1;
 Mon, 17 Feb 2020 12:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=nJIVKmw+QNWasbVtvZYI6aeAoGBosQZFZlyMe02F2rM=;
 b=FqzOjWavgMQi5txfNRze4yjP8LSdemMG2AMNz8rgzQstqbu1tGBIpGg3TwjdzDRGzM
 EDPv/5XtKsVHYOqlZs813X8bLN8CDlGTB+q0/TSAwQ4DFd9/W4mcU7lGarnzPZZqWxnd
 JtmrTGGK5Titicd6LET/Kj/7NpzUAafe6ho9i8xa3FPKMWPR6pxTypYrUNsiyefB8zSg
 jHUxYudqZcZTC4zVj0ZeEdB9mGyDYOLC0zgOJbd5ZYgp476C1IxBBRGSKyRc5i4bS57X
 1QSRADGA3BTFZHMk7GaABI1ghNCh+TQI3JP8lVmudhmk4DLSSDv8uYhB+2D/y2i4LUSU
 BQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=nJIVKmw+QNWasbVtvZYI6aeAoGBosQZFZlyMe02F2rM=;
 b=DIckFi6FHQG5a/jvS+yfL0TO20iFZld6gStn/FeaKTDG3zjme6OKpn/rZ3tpkTzNHS
 J1uiAcwKGSXpFxEeLLZKxuemuAFFBsbCshL9+5ApNMU/NFErLqrjUtR7NY1o/LrL3yQQ
 +NfpsTreiTUFdiI3Nd3qi0z6VP/Wb6k/cIfQHgPhFU7nrBy18QZ4wa1GujQjvWumuP1q
 s71+lMHzKOZuET1il0luugaWlst741rnJ62impWgD2nk9fDy9g2hpjYin9D6YtLpSQEc
 Gjn3UZkfVeX5To3ZPAS+OUdvHPjXg1OUfH5FViDi8TduwinBRS0aBT7/mT6k4rgbmvaA
 y2eg==
X-Gm-Message-State: APjAAAX7u5dq70MIUmdkgNAlVIw2SS8ZSTwA6kVIbJ6I9HxMLvaG9h6n
 jLDqSyVt476a5uetChKy6tE=
X-Google-Smtp-Source: APXvYqwLIa5I2Dfw7PBnLFa8vY3mSNYOeIW1+L1hLIOimsLRlk59hvb1YfYvxXYzLw/h4kWl1Oh8ZA==
X-Received: by 2002:aa7:9aa5:: with SMTP id x5mr18410167pfi.131.1581972494743; 
 Mon, 17 Feb 2020 12:48:14 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id b18sm1266070pfb.116.2020.02.17.12.48.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 17 Feb 2020 12:48:14 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 0/3] arm: allwinner: Wire up USB ports
Date: Mon, 17 Feb 2020 12:48:09 -0800
Message-Id: <20200217204812.9857-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instantiate EHCI and OHCI controllers on Allwinner A10.

The first patch in the series moves the declaration of EHCISysBusState
from hcd-ohci.c to hcd-ohci.h. This lets us add the structure to
AwA10State. Similar, TYPE_SYSBUS_OHCI is moved to be able to use it
outside its driver.

The second patch introduces the ehci-sysbus property "companion-enable".
This lets us use object_property_set_bool() to enable companion mode.

The third patch instantiates EHCI and OHCI ports for Allwinner-A10
and marks the OHCI ports as companions of the respective EHCI ports.

Tested by attaching various high speed and full speed devices, and by
booting from USB drive.

v3: Rebased to master
v2: Add summary
    Rewrite to instantiate OHCI in companion mode; add patch 2/3
    Merge EHCI and OHCI instantiation into a single patch

----------------------------------------------------------------
Guenter Roeck (3):
      hw: usb: hcd-ohci: Move OHCISysBusState and TYPE_SYSBUS_OHCI to include file
      hcd-ehci: Introduce "companion-enable" sysbus property
      arm: allwinner: Wire up USB ports

 hw/arm/allwinner-a10.c         | 43 ++++++++++++++++++++++++++++++++++++++++++
 hw/usb/hcd-ehci-sysbus.c       |  2 ++
 hw/usb/hcd-ohci.c              | 15 ---------------
 hw/usb/hcd-ohci.h              | 16 ++++++++++++++++
 include/hw/arm/allwinner-a10.h |  6 ++++++
 5 files changed, 67 insertions(+), 15 deletions(-)

