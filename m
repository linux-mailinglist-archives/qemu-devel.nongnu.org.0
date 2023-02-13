Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1076694398
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 11:56:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRWVT-0006U8-Fb; Mon, 13 Feb 2023 05:56:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRWVN-0006Sl-Ts
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:56:17 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRWVK-0003aA-48
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:56:15 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so8679415wms.1
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 02:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=raV0KiEdUxZP0ur5EgHPSdYoubiTbJ4MlXHagjDERa8=;
 b=zLs3DYU6IGMJMlChZB36agCw+oJVZbMergcdYIhKwqc1CSdH6KXt0pe1EwT1763wgB
 ox1aZRo8mXo2yKxVQaSK9prWzM7YXvzRH3WAA2yEXjek1Kb+FZPGjhYo7EjDpqijw+3/
 VWfSF+oXfSeIWcdjL1Ii2QBpccY/5F1fV/J9ULqR7jevSfUf1MdT7TvfKzgijAYXUBVz
 ZKVEYdP9KGRHzhvUiJTFEvShss4em6nIVTirX6V7kJC0RFCL6RzCImR2Vu7hkqpbDD7T
 R9jW8d6R/mwUysrAu/22Si2cBShpGcGI5AAkpqX0mvu70fkHFOpqI4iSonZlEiFzuf7N
 KqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=raV0KiEdUxZP0ur5EgHPSdYoubiTbJ4MlXHagjDERa8=;
 b=kp7eaKR9g9aklbm+xet2PqJmCLJ6/aoRMsBUttBwwrcMJyeNXqVuhNioV1ncQy0Y+C
 N3rTXgMjOZi+33fl+p0JhRZfMHHkvm0MdmrgizMhFmw+b46wpcQuXLgWPMgUW/H2Fwib
 CpRUM56PP3Ul5SAqu315qFd1ZtckGwYxuOZsm2IL+2KfB4HR7iU6toQKQwAo+TeTUJ1X
 4YSWZRaHXci5PXcPCYfWpZbev1oerWS/DJvMhmKH855gEmufHmTVPiZldHmTH1ZjoJ3W
 on6IpYyNDL2jL263orjYYTgl80ZUEVQciWiEVbOFDoLvRAxuW30EJJIIPWdTGP5FZu3h
 zOXg==
X-Gm-Message-State: AO0yUKUpoUTQnNcCO86DX1QTYZFsJr3PJLhiv+yH8WlEymd9MmHiqkVs
 eo2NCP9EDvQEkHhYZahR74c2bqu58rWirbJR
X-Google-Smtp-Source: AK7set9aCRuN6m8/MSFwiBu5YiSWol378m0UUhGW6ANOeZpYGxZWs3FbMy8lBYFZRbnsZri6OQcvGw==
X-Received: by 2002:a05:600c:3088:b0:3df:f860:3089 with SMTP id
 g8-20020a05600c308800b003dff8603089mr20936578wmn.32.1676285771988; 
 Mon, 13 Feb 2023 02:56:11 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a1c544e000000b003db06493ee7sm17516726wmi.47.2023.02.13.02.56.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 02:56:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 0/3] qdev: Introduce QDEV_DECLARE_DEV_BUS_TYPES() macro
Date: Mon, 13 Feb 2023 11:56:06 +0100
Message-Id: <20230213105609.6173-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

Experiment after discussing with Thomas around qdev_get_parent_bus:
https://lore.kernel.org/qemu-devel/ad356f64-dca0-8117-d22a-a530e620ddb0@redhat.com/

When a QDev plug on a QBus, we'll always use qdev_get_parent_bus()
at least once with this type. Why not provide a consistent defined
macro instead of:
 1/ adding an inlined helper such usb_bus_from_device()
    or scsi_bus_from_device() with different type checks,
 2/ open-code calls to qdev_get_parent_bus() with unsafe casts
?

This RFC series introduce a QDev-equivalent of QOM DECLARE_TYPES
macro, to be used with a (device, bus) tuple, and declaring the
equivalent device_GET_BUS() macro.

hw/usb/ is converted as an example.

Philippe Mathieu-Daudé (3):
  hw/qdev: Introduce QDEV_DECLARE_DEV_BUS_TYPES() macro
  hw/usb: Declare QOM macros using QDEV_DECLARE_DEV_BUS_TYPES()
  hw/usb: Use USB_DEVICE_GET_BUS() macro

 hw/usb/bus.c           | 10 +++++-----
 hw/usb/core.c          |  6 +++---
 hw/usb/dev-hub.c       |  4 ++--
 hw/usb/dev-serial.c    | 10 +++++-----
 hw/usb/hcd-xhci.c      |  2 +-
 include/hw/qdev-core.h | 28 ++++++++++++++++++++++++++++
 include/hw/usb.h       | 13 ++++---------
 7 files changed, 48 insertions(+), 25 deletions(-)

-- 
2.38.1


