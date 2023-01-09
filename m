Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2866621C3
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 10:39:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEoQH-0003sg-BD; Mon, 09 Jan 2023 04:26:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoQC-0003rK-U1
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:26:25 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoQ9-0005PJ-2c
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:26:23 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso8496918wms.5
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 01:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C4lODMUw+lyok56lujGJxoUDao4pczQAdswQ0O0cpMg=;
 b=oVaG40X9uyUOx9UUHZBCdaeCM60vWva8ltHNIrb56BBxPg7i+UHcg5FKI4rtoMmPXF
 RszLmhvvCIuGPE5iYcHNceYLJjxM2pNophquikiBYImDuir2dymRUVD6vVVuP6Humu1c
 sP2SJuIBTwTqH1oQkv8Ds1zL1Mk0bxyXXk87I40ietdugNtdB8++0F25RQc+03mGE5cX
 bwaun/TjHDZuyBPAHeSv8sBTdLBN3wHjs9Z21fEaeMb1rx0DYZ1vK4myRmBuaHa6/onO
 dK582rHo0weYqgZYSsVoPjf35GiobTiwDzi8NNcvF4G7qbm+1zpmuJ5cFrRC+xmvojcU
 qSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C4lODMUw+lyok56lujGJxoUDao4pczQAdswQ0O0cpMg=;
 b=RqCLyI7/oUWPF0aHxo8ZkgK2yxZAEx8qSEkbyESXBOR+y2jlVhGrJXz5DZweAqnD8B
 Hh3pambuWIlRYo/xSuekkgFJEoXXwq0QdX2WMVVx7SjSlWucmorkcEuGY4QZb0noxxDi
 CvHBVcwsngQ7Zmi4hUcbpxk/dic4bpVbYcfLlgjHM/2ZZCd6sfPLUH98OGNdnAOqurll
 RbWzf1kYHraHA2ANzQH5zTV6L/iMWWnevb9w3l+mFyY64Yq9zHKEFnFqAU1s3NOe4BdS
 xBXugV6PL1CV7Vv8tVyDoeljrOpSy4BcmmIRbQyJmzCvwauLbKQdfnoHJjV/rgYQqywi
 oMow==
X-Gm-Message-State: AFqh2kosWHDqzyN1A+L6Buxs6OAY0hXVOQT17n4vu+JveUFDSCsijCSE
 ZN92n5mMhILPTedA4yzMLfEAyZGvOOQr5Jph
X-Google-Smtp-Source: AMrXdXugNuxz61cqqab8vDIrIufdrsegLLWRh6MmlhW/ilBcquvzylAtKorC56SfPPAZrMSr39x6dg==
X-Received: by 2002:a05:600c:3b2a:b0:3d9:f42c:56d0 with SMTP id
 m42-20020a05600c3b2a00b003d9f42c56d0mr678594wms.16.1673256379435; 
 Mon, 09 Jan 2023 01:26:19 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c358900b003cffd3c3d6csm11493507wmq.12.2023.01.09.01.26.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 01:26:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/9] hw: Convert simple devices from SysBus to QDev
Date: Mon,  9 Jan 2023 10:26:08 +0100
Message-Id: <20230109092617.80224-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

Various simple devices (usually GPIO related) don't access
the 'system bus': no IRQ lines / memory regions exposed via
the SysBus API, no memory region mapped.

To reduce complexity, remove the sysbus onion layer from
these devices.

Introduce the qdev_create_simple() helper similar to the
pattern used for other device creation helpers:

 $ git grep _create_simple include/
 include/hw/i2c/i2c.h:175:I2CSlave *i2c_slave_create_simple(I2CBus *bus, const char *name, uint8_t addr);
 include/hw/isa/isa.h:86:ISADevice *isa_create_simple(ISABus *bus, const char *name);
 include/hw/misc/led.h:93:LEDState *led_create_simple(Object *parentobj,
 include/hw/pci/pci.h:735:PCIDevice *pci_create_simple_multifunction(PCIBus *bus, int devfn,
 include/hw/pci/pci.h:738:PCIDevice *pci_create_simple(PCIBus *bus, int devfn, const char *name);
 include/hw/sysbus.h:100:static inline DeviceState *sysbus_create_simple(const char *name,
 include/hw/usb.h:505:USBDevice *usb_create_simple(USBBus *bus, const char *name);

Based-on: <20230109084121.72138-1-philmd@linaro.org>
          "hw/i2c/bitbang_i2c: Housekeeping"

Philippe Mathieu-Daudé (9):
  hw/arm/musicpal: Remove unused dummy MemoryRegion
  qdev: Add qdev_create_simple() helper
  hw/i2c/bitbang_i2c: Convert TYPE_GPIO_I2C from SysBus to QDev
  hw/arm/tosa: Convert TYPE_TOSA_MISC_GPIO from SysBus to QDev
  hw/arm/palm: Convert TYPE_PALM_MISC_GPIO from SysBus to QDev
  hw/arm/musicpal: Convert TYPE_MUSICPAL_KEY from SysBus to QDev
  hw/arm/spitz: Convert TYPE_SPITZ_KEYBOARD from SysBus to QDev
  hw/arm/tosa: Convert TYPE_SPITZ_MISC_GPIO from SysBus to QDev
  hw/i386/kvm: Convert TYPE_KVM_CLOCK from SysBus to QDev

 hw/arm/musicpal.c      | 12 ++++--------
 hw/arm/palm.c          |  9 ++-------
 hw/arm/spitz.c         | 18 ++++++++++++------
 hw/arm/tosa.c          |  9 ++-------
 hw/core/qdev.c         |  9 +++++++++
 hw/i2c/bitbang_i2c.c   |  5 ++---
 hw/i386/kvm/clock.c    |  6 +++---
 include/hw/qdev-core.h | 11 +++++++++++
 8 files changed, 45 insertions(+), 34 deletions(-)

-- 
2.38.1


