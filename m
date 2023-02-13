Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DB3693EB6
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 08:09:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRSwu-0000BP-JI; Mon, 13 Feb 2023 02:08:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSws-0000Ac-ED
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:08:26 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSwq-0001jR-01
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:08:26 -0500
Received: by mail-wm1-x329.google.com with SMTP id z13so8013938wmp.2
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 23:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lux5rTS8ete4gNLpWbokw3KelMLn0CF7PB03N10HR70=;
 b=FvqA53n3zkQfr9Jo+aypzx12tCj+waCcNC53O93elgm6I8dMe6Xdhp+vT3D8MoL7VP
 4pMzoC1GiUsFj288dr0wn5IwNCJHeTart1whkzGyhur9Y/A0a1wv9fMK7H+2R3Ev3UkR
 oNBJyVfh00eHvmIGayKWlkkSDHznBg/zLyXFMYxssyPRZREANgs/vygxzO4XiLqHKdzL
 QOkNuVgssGiVUDkQwZBf7P3J5VWpzLOd4oTLhMiblC61VGFlUQSisXDU/a2ZxTnVpfJG
 /h/PGUeUN+4NliBm/taLkBzd8eKCr4tcxPqbLdGYwypz+n8Gpqcm01yUbRucF7VCmOBZ
 VVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lux5rTS8ete4gNLpWbokw3KelMLn0CF7PB03N10HR70=;
 b=j/W34yGPwhCf82Doo4UmvhNh4W8kffuvh6QTK2T3gwwbZP2NNEo753i4xNRtwBmEsb
 B1K8Rhxvg+Ubp7KqaQkub/8X4eFSVs4Zwu04xKvJHpCGc79s8q4fuhyT9EYNJQehxcCF
 3+V5zBSsdUbp444nJJRmbmFf+bjzRWliXz4E4NbmGItMf5+DSK1ptCIu38oPNsKGK8HO
 NYSmip4aKcmjk5CzfafJDsHNyeUN6TZZg3ixPxs7zwqafFCa+RF2nUMdXAwfvke3ediA
 89VOV1A8Q/ZCm+qfHCXNUoumlCEVhpm98ICd3o8Cq5iCkPg3ttQe92Ln1vhEGfUaoCgB
 2GvQ==
X-Gm-Message-State: AO0yUKVSpV6dOroG/1ipD7PBc+wk6i2x+gHeBysx8SKAeNVFQQdGj0Jz
 qDCYwHr9thrjlw25/iIwI+R1s3/sEuODHF0C
X-Google-Smtp-Source: AK7set//BJE1zsWj+1MD3B/p0jOFwEYkKGT7rI0XQ1meOXLFD4NZ+9qKhOe/VuRd7SY8ZnkOcfjYWw==
X-Received: by 2002:a05:600c:4d09:b0:3de:db64:a56f with SMTP id
 u9-20020a05600c4d0900b003dedb64a56fmr22756503wmp.13.1676272102269; 
 Sun, 12 Feb 2023 23:08:22 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a05600c310a00b003e1e8d794e1sm3989019wmo.13.2023.02.12.23.08.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 23:08:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Li Qiang <liq3ea@163.com>, qemu-s390x@nongnu.org,
 Hu Tao <hutao@cn.fujitsu.com>, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 00/19] hw: Use QOM macros and remove DO_UPCAST() uses
Date: Mon, 13 Feb 2023 08:08:01 +0100
Message-Id: <20230213070820.76881-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

v2: Rebased

QOM housekeeping series which replace the DO_UPCAST() macro
uses by equivalent QOM ones. Also:
- Use DEVICE() macro
- Define some TYPE_xxx
- Define some type arrays using DEFINE_TYPES() macro
- Introduce abstract QOM (QDev) parent when relevant.

Based-on: <20230213070423.76428-1-philmd@linaro.org>
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


