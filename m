Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87668693A9D
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 23:52:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRLCJ-00056j-U0; Sun, 12 Feb 2023 17:51:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLCI-00056Q-FE
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:51:50 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLCG-0003sU-OY
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:51:50 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 l21-20020a05600c1d1500b003dfe462b7e4so7687347wms.0
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 14:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kaO4XdYgX6Zo2q6n31eDlmjKIxTWt2PU37HruYCGlzo=;
 b=eAdYJNZln/ndBEo+VYULHxRBXAhEWnpd0Y+84JrfUmd523/pEX0YHTDWgNzavJU55J
 ZN3ttLu07O4h1NN6v+bBjED/9KtQfvA9hhDDGrmGDLJb9eSVmv4MAByqA4FK6hIpFRKi
 BQFclsA0K3qPn5AO/uLI68gRfmuW/eVPnLfUyIAW5Q8eYIVR7J1s6wdvG6ozdstp8w/Z
 h8GKyTn7PWAsEVW5B3wRyEbexESIjXHtDiX/TcUriu1d9bSj6nQmsSrxMEZaSz/UMFyN
 vH4SLH/+hmyM8EJkoFzjibL2aJpKweEJ0YxzvvrQTK7ppKoVmCaTPoA5xRiLY7fmZR5K
 FLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kaO4XdYgX6Zo2q6n31eDlmjKIxTWt2PU37HruYCGlzo=;
 b=2nQ/mEkeER+6s83KJ99PI0wC2ENBKmOJe7gTz9mYAAYR0/zZYoV3BeBVfxP/dQT2ai
 au/0GbsJ4pOXX+KyHDBpMkcSuLlVxQLkcETCLXbbwJG/NhbSQ6pVSK/PJTMd7GYaAa/+
 TPQr1+qaNFH8A/IvImwohmtUpeh8mtyUJw6Hlw0LQx+l2t9vvK6retcqRf/a+vJtbwbs
 osNf3OjbzraPVvIngVtZHdfWpdSlTuPY0TUiUZG3A8QqUvuu08K4Cp7tH0ijBOglKJUb
 fkSCHjgOXQMKJH6MuOkcJYc+ixEWoUmbs6yEO4TkuQ7Fzfewdtiz/jA1Nn3GP7km3vMy
 87ww==
X-Gm-Message-State: AO0yUKVAihcmeY+b+X7sphJfZOnA3aoi7PLn7ppGHLl21rdme1ud+O+4
 det0xCoVa1D6+9atf6l+Ka0U/g==
X-Google-Smtp-Source: AK7set9eDN3OD/B1s5ZBPkdSvCOBePTl+ICEV5uBk3FseaxEOovlTt9pdgIDesSUjNy/2aQW/0KTug==
X-Received: by 2002:a05:600c:1609:b0:3dc:4316:52be with SMTP id
 m9-20020a05600c160900b003dc431652bemr3139501wmn.10.1676242307271; 
 Sun, 12 Feb 2023 14:51:47 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a05600c468600b003dc36981727sm16612684wmo.14.2023.02.12.14.51.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 14:51:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Eduardo Habkost <eduardo@habkost.net>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xiaoqiang zhao <zxq_yx_007@163.com>, Hu Tao <hutao@cn.fujitsu.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Li Qiang <liq3ea@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/19] hw: Use QOM macros and remove DO_UPCAST() uses
Date: Sun, 12 Feb 2023 23:51:25 +0100
Message-Id: <20230212225144.58660-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

QOM housekeeping series which replace the DO_UPCAST() macro
uses by equivalent QOM ones. Also:
- Use DEVICE() macro
- Define some TYPE_xxx
- Define some type arrays using DEFINE_TYPES() macro
- Introduce abstract QOM (QDev) parent when relevant.

Based-on: <20230212224730.51438-1-philmd@linaro.org>
          hw/qdev: Housekeeping around qdev_get_parent_bus()

Philippe Mathieu-Daudé (19):
  hw/char/serial-pci: Replace DO_UPCAST(PCISerialState) by PCI_SERIAL()
  hw/char/serial-pci-multi: Batch register types using DEFINE_TYPES
    macro
  hw/char/serial-pci-multi: Introduce PCI_MULTISERIAL QOM abstract
    parent
  hw/char/serial-pci-multi: Factor multi_serial_class_initfn() out
  hw/char/serial-pci-multi: Replace DO_UPCAST() by PCI_MULTISERIAL()
  hw/ide/qdev: Replace DO_UPCAST(IDEDevice) by IDE_DEVICE()
  hw/ide/qdev: Replace DO_UPCAST(IDEBus) by IDE_BUS()
  hw/net/eepro100: Introduce TYPE_EEPRO100 QOM abstract parent
  hw/net/eepro100: Replace DO_UPCAST(EEPRO100State) by EEPRO100()
  hw/net/ne2000-pci: Replace DO_UPCAST(PCINE2000State) by PCI_NE2000()
  hw/net/tulip: Finish QOM conversion
  hw/pci/pci: Replace DO_UPCAST(PCIBus) by PCI_BUS()
  hw/scsi/scsi-bus: Replace DO_UPCAST(SCSIBus) by SCSI_BUS()
  hw/scsi/scsi-bus: Inline two uses of scsi_bus_from_device()
  hw/s390x/event-facility: Replace DO_UPCAST(SCLPEvent) by SCLP_EVENT()
  hw/vfio/ccw: Replace DO_UPCAST(VFIOCCWDevice) by VFIO_CCW()
  hw/usb/dev-hub: Use QOM USB_HUB() macro instead of casting
  hw/usb: Replace DO_UPCAST(USBBus) by USB_BUS()
  hw/usb: Inline usb_bus_from_device()

 hw/char/serial-pci-multi.c | 93 +++++++++++++++++++-------------------
 hw/char/serial-pci.c       |  7 ++-
 hw/ide/qdev.c              | 10 ++--
 hw/net/eepro100.c          | 46 ++++++++++++-------
 hw/net/ne2000-pci.c        | 18 +++++---
 hw/net/tulip.c             | 20 ++++----
 hw/pci/pci.c               |  2 +-
 hw/s390x/event-facility.c  |  3 +-
 hw/s390x/ipl.c             |  7 +--
 hw/scsi/scsi-bus.c         | 14 +++---
 hw/usb/bus.c               | 10 ++--
 hw/usb/core.c              |  6 +--
 hw/usb/dev-hub.c           | 10 ++--
 hw/usb/dev-serial.c        | 10 ++--
 hw/usb/hcd-xhci.c          |  2 +-
 hw/vfio/ccw.c              | 35 +++++++-------
 include/hw/scsi/scsi.h     |  5 --
 include/hw/usb.h           |  5 --
 18 files changed, 155 insertions(+), 148 deletions(-)

-- 
2.38.1


