Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9253169808F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 17:18:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSKSj-0006fR-7R; Wed, 15 Feb 2023 11:16:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKSe-0006eP-Tn
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:16:48 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKSb-0008Al-SF
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:16:48 -0500
Received: by mail-wr1-x42f.google.com with SMTP id o15so16397516wrc.9
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 08:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LOn272OTRtfLlqe9sIpwtXqLtDHpJ0aOXtoMWMJvS/M=;
 b=xT3Rj+KtB3Bf1PZ1j0fTf1X/Y7ZFG5UVQ1AU5sRhNTi2JA507OlrXXsPlftk8RyiiL
 dO7BCeiLalS3vtQEfe7euASuC4/RkuW3gTLq7C2AQQTGu7p7FKMyCijcGSU+d0NP8042
 upk5GqSE+knrIqGGx8T08L3dAa4hsWDdtK0MVVOvyXKBuHvvoKS/nNXZIDAl9mP45Op3
 ncqzKD9oKP2Wip0PhRCYApTvB0wH/1wCHclijWQc/BoD1Wtpamb/hHtPIPAZhNBnSwgs
 WgssP1w7zT7zkMBjHePaAPDjBP6lSIyoVKKyutza89mIBxGZrEonaFBHk3skfv1r6SZ2
 C19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LOn272OTRtfLlqe9sIpwtXqLtDHpJ0aOXtoMWMJvS/M=;
 b=l9K1L+Yyh1ovlWkWYr7ZuRRBhl/m5K+S7r5ShIFrieT8axShuHtVrtuonpvIRWdlKx
 J8h3bisUJTR8QmGmHRVD9XbgKa++0nPQLg+W6btIjfj0SL/puQaX6qfG2HTCBRz2A3sr
 YrdGa8PRmSe6N1PQNkhyLCeQz8skfElRPn5g71Yrhbedcdii2BLgbW4nLN9LJRagHnMU
 DB2CtfXiUoPYBiLTJmEAWnS2rPP1EpzceEO0jPLf2FgseFC+NTB8mPRyVHVrGF/c/AKU
 qGOncIV3RYAKkQj0Ogt0OPlopVy8TrdB3Z5lg68wz0uzfbYBbIGFxIAJPELUmepn/4aU
 4UuQ==
X-Gm-Message-State: AO0yUKVnNZ/nKynsHtRbwPX3zshpylJiffVmxY1zpgBijVQcDv0djvVy
 2+Vw3F+j1e+qYmAuEWeNh+Krre1UkF9KdBTZ
X-Google-Smtp-Source: AK7set+H9xVCF2hkbAmu7XeZ1YkIES68J7aQy5tlsztf/IKZgg0kdsOr7GQA0LJDbEcXHAh7Fq3iLg==
X-Received: by 2002:adf:ed4c:0:b0:2c3:eccf:a65d with SMTP id
 u12-20020adfed4c000000b002c3eccfa65dmr2120311wro.8.1676477803583; 
 Wed, 15 Feb 2023 08:16:43 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a5d4041000000b002c546d169ddsm14285716wrp.11.2023.02.15.08.16.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 08:16:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-ppc@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 00/18] hw/ide: Untangle ISA/PCI abuses of ide_init_ioport()
Date: Wed, 15 Feb 2023 17:16:23 +0100
Message-Id: <20230215161641.32663-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

Background thread:
https://lore.kernel.org/qemu-devel/5095dffc-309b-6c72-d255-8cdaa6fd3d52@ilande.co.uk/

This series:
- contains few ISA cleanups
- exposes PIIX IDE output IRQs and wires them in parent (PC/Malta)
- renames the current ide_init_ioport() as ide_init_ioport_isa()
- adds a generic ide_init_ioport() which works with PCI devices
- remove ISA bus singleton.

This is required to proceed with more PIIX cleanups.

ide_drive_get() will be remove in a future series.

Based-on: <20230215112712.23110-1-philmd@linaro.org>
          "hw/ide: QOM/QDev housekeeping"
https://lore.kernel.org/qemu-devel/20230215112712.23110-1-philmd@linaro.org/

v1: https://lore.kernel.org/qemu-devel/20230208000743.79415-1-philmd@linaro.org/

Philippe Mathieu-Daudé (18):
  hw/isa: Rename isa_get_dma() -> isa_bus_get_dma()
  hw/isa: Factor isa_bus_get_irq() out of isa_get_irq()
  hw: Replace isa_get_irq() by isa_bus_get_irq() when ISABus is
    available
  hw/ide/piix: Expose output IRQ as properties for late object
    population
  hw/i386/pc_piix: Wire PIIX3 IDE ouput IRQs to ISA bus IRQs 14/15
  hw/isa/piix4: Wire PIIX4 IDE ouput IRQs to ISA bus IRQs 14/15
  hw/ide/piix: Ensure IDE output IRQs are wired at realization
  hw/isa: Deprecate isa_get_irq() in favor of isa_bus_get_irq()
  hw/isa: Simplify isa_address_space[_io]()
  hw/isa: Use isa_address_space_io() in isa_register_ioport()
  hw/ide: Declare ide_get_[geometry/bios_chs_trans] in
    'hw/ide/internal.h'
  hw/ide: Rename ISA specific ide_init_ioport -> ide_bus_init_ioport_isa
  hw/ide: Introduce generic ide_init_ioport()
  hw/ide/piix: Use generic ide_bus_init_ioport()
  hw/isa: Ensure isa_register_portio_list() do not get NULL ISA device
  hw/isa: Reduce 'isabus' singleton scope to isa_bus_new()
  hw/isa: Un-inline isa_bus_from_device()
  hw/isa: Remove empty ISADeviceClass structure

 hw/audio/cs4231a.c                |  5 +--
 hw/audio/gus.c                    |  5 +--
 hw/audio/sb16.c                   |  7 ++--
 hw/block/fdc-isa.c                |  5 +--
 hw/dma/i82374.c                   |  2 +-
 hw/i386/pc.c                      |  3 +-
 hw/i386/pc_piix.c                 |  8 ++++-
 hw/ide/ioport.c                   | 16 +++++++--
 hw/ide/isa.c                      |  2 +-
 hw/ide/piix.c                     | 33 ++++++++++++-------
 hw/isa/isa-bus.c                  | 55 ++++++++++++++++---------------
 hw/isa/piix4.c                    |  2 ++
 hw/rtc/m48t59-isa.c               |  2 +-
 include/hw/ide.h                  |  4 ---
 include/hw/ide/internal.h         |  7 +++-
 include/hw/ide/isa.h              |  3 ++
 include/hw/ide/pci.h              |  1 +
 include/hw/ide/piix.h             |  4 +++
 include/hw/isa/i8259_internal.h   |  2 +-
 include/hw/isa/isa.h              | 26 ++++++++-------
 include/hw/isa/superio.h          |  2 +-
 include/hw/timer/i8254.h          |  3 +-
 include/hw/timer/i8254_internal.h |  2 +-
 23 files changed, 122 insertions(+), 77 deletions(-)

-- 
2.38.1


