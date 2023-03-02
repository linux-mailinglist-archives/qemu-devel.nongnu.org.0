Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE716A8C11
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 23:43:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXrbt-0006x8-29; Thu, 02 Mar 2023 17:41:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrbp-0006wO-NM
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:41:09 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrbn-0008Ml-1t
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:41:09 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 t25-20020a1c7719000000b003eb052cc5ccso2819319wmi.4
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 14:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677796863;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2Vg5Dt0fxYxqjbPBqU25BqgXLbiKq4Pw5rFRUK025+c=;
 b=daCSfWH2+pzs+wZrPhRk1lsT4C3YwUXmmdqfRAqx3SIDL8BVC1aiXQQfi3jqyrHGgc
 3Ve8vDfh8fgj4IQ3zgFmT809MPWVeZFZVwobNcjfz0WyAKDEqCSGasLE/2rFA1JCeV/F
 KtJDULD/Bogt6/OZYJ817KPy50dAmAZnyzj9fGu+wBJJ1slFz0hxak5GT20gZJePE0n/
 WcEFREho/lhGVCwJOCdD4c/vEILfvVlcXkG90TSjeT/8zqldnKOEeyKCJPbmN8CgqzZb
 upN8rapKfU8BEFhGC/HLni6TG/jvN8HXbQFS4X4ZAtaBTyb71G/GOp6uh7ab15pHBACj
 KQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677796863;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2Vg5Dt0fxYxqjbPBqU25BqgXLbiKq4Pw5rFRUK025+c=;
 b=e9bq8nAeSTbWj6Ect3wB6aEOHPjNTgeMMwkoo3R8e/RUtgGaV9F6D93p+mWSqnP5y2
 3M6r4ucIUc1nPV/u/Cyd9ByGlCkskSQbfViwOsbiuxitE6PUPxN+L5ZgBSx2Hr3lRwpG
 7ifYRyPM9N60dvDmXvNEO+2QN0INmc/vk1GzgjfB2Zp8gugfYcYWKOljeu/wYI4XgPUT
 CyMM1BOVyz3+ihn2tiArCF9W0DFaGbjNu2TU6XM3APZPR3BHV9Kod3r3YZCdQlaOzIhq
 3p7VBIqHGjb5OWqOf3Rf04jrrJJPj0e/x3jvQLRXFQX5T7TNS2WzHP5/Uryz73inBxO1
 rXUw==
X-Gm-Message-State: AO0yUKWkTWMqW+Nk/suDeDCyrdE4BzOgEvGfPCU+apF9BtlV4P+L/0GA
 arUTCI+PhioaJcsDGHunnXUqxeh+y0K6zk5h
X-Google-Smtp-Source: AK7set/qzVb4q4hCWpFXmqkAoQyUrWGlSEswf6PVgIBVqyg4gu2jRdYRU0k1cfUfJXy5TtgyxsdllQ==
X-Received: by 2002:a05:600c:2215:b0:3e2:1368:e3a0 with SMTP id
 z21-20020a05600c221500b003e21368e3a0mr8440459wml.18.1677796863306; 
 Thu, 02 Mar 2023 14:41:03 -0800 (PST)
Received: from localhost.localdomain (43.red-95-127-39.staticip.rima-tde.net.
 [95.127.39.43]) by smtp.gmail.com with ESMTPSA id
 x8-20020a1c7c08000000b003eb2e33f327sm7211935wmc.2.2023.03.02.14.41.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Mar 2023 14:41:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 00/18] hw/ide: Untangle ISA/PCI abuses of ide_init_ioport()
Date: Thu,  2 Mar 2023 23:40:40 +0100
Message-Id: <20230302224058.43315-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

Since v2: rebased

I'm posting this series as it to not block Bernhard's PIIX
cleanup work. I don't have code change planned, but eventually
reword / improve commit descriptions.

Tested commit after commit to be sure it is bisectable. Sadly
this was before Zoltan & Thomas report a problem with commit
bb98e0f59c ("hw/isa/vt82c686: Remove intermediate IRQ forwarder").

Background thread:
https://lore.kernel.org/qemu-devel/5095dffc-309b-6c72-d255-8cdaa6fd3d52@ilande.co.uk/

Philippe Mathieu-Daudé (18):
  hw/ide/piix: Expose output IRQ as properties for late object
    population
  hw/ide/piix: Allow using PIIX3-IDE as standalone PCI function
  hw/i386/pc_piix: Wire PIIX3 IDE ouput IRQs to ISA bus IRQs 14/15
  hw/isa/piix4: Wire PIIX4 IDE ouput IRQs to ISA bus IRQs 14/15
  hw/ide: Rename ISA specific ide_init_ioport -> ide_bus_init_ioport_isa
  hw/ide/piix: Ensure IDE output IRQs are wired at realization
  hw/isa: Deprecate isa_get_irq() in favor of isa_bus_get_irq()
  hw/ide: Introduce generic ide_init_ioport()
  hw/ide/piix: Use generic ide_bus_init_ioport()
  hw/isa: Ensure isa_register_portio_list() do not get NULL ISA device
  hw/isa: Simplify isa_address_space[_io]()
  hw/isa: Reduce 'isabus' singleton scope to isa_bus_new()
  exec/ioport: Factor portio_list_register_flush_coalesced() out
  exec/ioport: Factor portio_list_register() out
  hw/southbridge/piix: Use OBJECT_DECLARE_SIMPLE_TYPE() macro
  hw/isa/piix: Batch register QOM types using DEFINE_TYPES() macro
  hw/isa/piix: Unify QOM type name of PIIX ISA function
  hw/isa/piix: Unify PIIX-ISA QOM type names using qdev aliases

 hw/audio/adlib.c              |  4 +--
 hw/display/qxl.c              |  7 ++--
 hw/display/vga.c              |  9 +++--
 hw/dma/i82374.c               |  7 ++--
 hw/i386/pc_piix.c             | 13 +++++---
 hw/ide/ioport.c               | 15 +++++++--
 hw/ide/isa.c                  |  2 +-
 hw/ide/piix.c                 | 54 +++++++++++++++++++++++-------
 hw/isa/isa-bus.c              | 36 ++++++++------------
 hw/isa/piix3.c                | 63 +++++++++++++++--------------------
 hw/isa/piix4.c                | 12 ++++---
 hw/mips/malta.c               |  2 +-
 hw/watchdog/wdt_ib700.c       |  4 +--
 include/exec/ioport.h         | 15 +++++----
 include/hw/ide/internal.h     |  3 +-
 include/hw/ide/isa.h          |  3 ++
 include/hw/ide/piix.h         |  4 +++
 include/hw/isa/isa.h          |  3 +-
 include/hw/southbridge/piix.h | 14 ++++----
 softmmu/ioport.c              | 48 +++++++++++++++++++-------
 softmmu/qdev-monitor.c        |  3 ++
 21 files changed, 190 insertions(+), 131 deletions(-)

-- 
2.38.1


