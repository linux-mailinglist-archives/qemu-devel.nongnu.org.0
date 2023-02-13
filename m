Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B25694F98
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 19:44:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRdnp-0000qG-DN; Mon, 13 Feb 2023 13:43:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRdnk-0000p0-Rs
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:43:44 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRdni-0008NF-Gp
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:43:44 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 l21-20020a05600c1d1500b003dfe462b7e4so8901220wms.0
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 10:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+fpY7ggMSVuzHfqwQkVLkYM/Od8dMyDKmmJ3jtIIOSI=;
 b=w9/DHJD79JmYMCgspwd3aUYIlKQqmKRYXI7EeRxT7N0f1puyzk4yP/IfqEYdyVavWX
 /wm7ksTwMHauN3sqb5cm81G6oktCfCeZt5LBwXTliXxV67PAkgjKy2rlYcCqN8adcZ1W
 uIVJegQ4T463NhypAENiN3ON7CiO85T2YxVeTmN7YwjATmJpLQ/cfVBKrFI9A7J0YrgX
 ZLf5z3UkTVummQ9swOAl0ongapyYzT1QuqIWpFYxZEm2CQETk5VqfUjDgdY/XFZ0tcoo
 fC7PoAVaLavKvy6N4IG3+mWPPJjt2JCBt37gA8IXpyVu7BHjWqdA3FV8d8mvgCP4/kuZ
 vEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+fpY7ggMSVuzHfqwQkVLkYM/Od8dMyDKmmJ3jtIIOSI=;
 b=LxJYuJ0vGGjd/Rqnoez0Wu3ipeA8txWmnXzLLM4c7C8gjrYkumEPLkA+yNweihu7Gy
 gmH2rO1hnCj0u72tTlqqFQd0CFIAkwx7RU0CNgXyqAhc1L+lAWfi055CJju4hkCoJ+r7
 fo7MtKFE5rK94f9EuGY5FTwV9Sc3GZFYJoDl/9mqkzqqnBuBtK9ZuuyXfmnYY/lTTZVT
 4LfqRGBAsAZCUgILOrtUseznjuy9uXd1SBx5UUqoxaleT+gDMb3npSd8stSKCOvajl5n
 ErbyYu6EvFf2ITJ6Coh9+mqURWJSl+OFW5ScQeUr84jMtEyfTt+RBJIVmEQLMy3gwrxe
 B7sg==
X-Gm-Message-State: AO0yUKXg8Y/bsMy4DXsP5NEzFEArIamh++V1FEDu+M1ty6BF+bRDAL6I
 jz5kOkpwGTzdLPFwsksdCzvwtPGCCvDRXGl+
X-Google-Smtp-Source: AK7set+C8BmD9WSJ2JglQLrksBV4Y7mHSNJV/XcQzGNC+N1g8Gnifgm1zaX49cKemog29kM30Hp7Og==
X-Received: by 2002:a05:600c:2e8a:b0:3dc:5a70:23dc with SMTP id
 p10-20020a05600c2e8a00b003dc5a7023dcmr19179804wmn.27.1676313820556; 
 Mon, 13 Feb 2023 10:43:40 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j16-20020adfff90000000b002c55efa9cbesm1637393wrr.39.2023.02.13.10.43.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 10:43:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Hu Tao <hutao@cn.fujitsu.com>,
 Gonglei Arei <arei.gonglei@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Li Qiang <liq3ea@163.com>, Thomas Huth <thuth@redhat.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 00/14] hw: Use QOM macros and remove DO_UPCAST() uses
Date: Mon, 13 Feb 2023 19:43:24 +0100
Message-Id: <20230213184338.46712-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

v3:
- Corrected TYPE_PCI_MULTISERIAL string
- Split EEPRO100 series out:
  https://lore.kernel.org/qemu-devel/20230213101048.94519-1-philmd@linaro.org/
- Split VFIO_CCW series out:
  https://lore.kernel.org/qemu-devel/20230213170145.45666-1-philmd@linaro.org/
- Removed "Inline usb_bus_from_device()" RFC patch
v2:
- Rebased

QOM housekeeping series which replace the DO_UPCAST() macro
uses by equivalent QOM ones. Also:
- Use DEVICE() macro
- Define some TYPE_xxx
- Define some type arrays using DEFINE_TYPES() macro
- Introduce abstract QOM (QDev) parent when relevant.

Based-on: <20230213070423.76428-1-philmd@linaro.org>
          hw/qdev: Housekeeping around qdev_get_parent_bus()

Philippe Mathieu-Daudé (14):
  hw/char/serial-pci: Replace DO_UPCAST(PCISerialState) by PCI_SERIAL()
  hw/char/serial-pci-multi: Batch register types using DEFINE_TYPES
    macro
  hw/char/serial-pci-multi: Introduce PCI_MULTISERIAL QOM abstract
    parent
  hw/char/serial-pci-multi: Factor multi_serial_class_initfn() out
  hw/char/serial-pci-multi: Replace DO_UPCAST() by PCI_MULTISERIAL()
  hw/ide/qdev: Replace DO_UPCAST(IDEDevice) by IDE_DEVICE()
  hw/ide/qdev: Replace DO_UPCAST(IDEBus) by IDE_BUS()
  hw/net/ne2000-pci: Replace DO_UPCAST(PCINE2000State) by PCI_NE2000()
  hw/net/tulip: Finish QOM conversion
  hw/pci/pci: Replace DO_UPCAST(PCIBus) by PCI_BUS()
  hw/scsi/scsi-bus: Replace DO_UPCAST(SCSIBus) by SCSI_BUS()
  hw/scsi/scsi-bus: Inline two uses of scsi_bus_from_device()
  hw/usb/dev-hub: Use QOM USB_HUB() macro instead of casting
  hw/usb: Replace DO_UPCAST(USBBus) by USB_BUS()

 hw/char/serial-pci-multi.c | 93 +++++++++++++++++++-------------------
 hw/char/serial-pci.c       |  7 ++-
 hw/ide/qdev.c              | 10 ++--
 hw/net/ne2000-pci.c        | 18 +++++---
 hw/net/tulip.c             | 20 ++++----
 hw/pci/pci.c               |  2 +-
 hw/s390x/ipl.c             |  7 +--
 hw/scsi/scsi-bus.c         | 14 +++---
 hw/usb/dev-hub.c           |  6 +--
 include/hw/scsi/scsi.h     |  5 --
 include/hw/usb.h           |  2 +-
 11 files changed, 94 insertions(+), 90 deletions(-)

-- 
2.38.1


