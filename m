Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F06A662576
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:24:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqxk-0008PY-AV; Mon, 09 Jan 2023 07:09:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqxF-0008OO-40
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:08:41 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqxB-0005rO-9v
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:08:39 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so8818774wms.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 04:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K+xerkULN/+oCHOR/UZd681jIze3gW+HK0vfFPjRLL0=;
 b=qahlHsWz/+/IThJg84o06q9r3YUsBmxjUb/egR7aj0ZXiQ8WOjzxUQLJSEPXZNuM9X
 tfQkQrZsDJF30nhokA9IXpK81YOt212JUhJjFPUAV0Xc9d8vEoFMuHCNyW9hwj+kA+Ka
 4pMj3+hns/azs+1ySbavSla1kkqBH1Du9dwmHJOSIhAgqWU85Uzh37PPhmnvfklR1J4B
 jd/P0Zh+jJEeE/RyB21SwqCqktqBGoF/I86x/0kyQmenurKMQdJSkY3aY6Dunei+RAwk
 rmnmZ3A/m4krg3sglQoVNVuMNedw51XZXfvVK4wzOk6cciWQkfi5K6EugGJZ1HeAx3BW
 obbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K+xerkULN/+oCHOR/UZd681jIze3gW+HK0vfFPjRLL0=;
 b=2T3O7WXQepm5ejAC938hyWqStmnbyRIpAwbDw1JshoXaWhNIuGachcU51PG0js3uUZ
 kkIP+pOoBHS0VMQ0fjnlmWDKVSg9icMiizbKwGBdMjkbc3yKiplvjhtdj62NQ6wfBOL9
 gMHZj2l5RuLwAVkFQpVqKaPelSNK+B8z6/wbE850mduqkqX+KXqdAJI6kkhVdKK5SqU7
 d8J0TOx4gv3EcNte8RmCC0MlFRLmb7bTPU+7Yk/s3ngIWZgD4uH0uN5tLKKL2kMyss/U
 HVSib3uj5ddqlUUaeG0pKBe6wMWHjQ59llhoOWiZjqXwwGNRT9qj3ClFYbQ1wU1u5ZV2
 IPqQ==
X-Gm-Message-State: AFqh2koTXlFnd5Zql/qEG39LUmmf3QCqQtivhnB+0TogJE0I0M+uZrVU
 q0tVo0RWN2J6VD1FIukYvdDGIDjq2h9AfkUQ
X-Google-Smtp-Source: AMrXdXvdK+///JZFinl6C5a2kZUNSOsmnR7I+PSsk2xN2vGFtToI92a2s+wCaYLS/x16Ltx2KF8OyA==
X-Received: by 2002:a05:600c:3545:b0:3d9:a145:9ab with SMTP id
 i5-20020a05600c354500b003d9a14509abmr26867107wmq.39.1673266115539; 
 Mon, 09 Jan 2023 04:08:35 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a05600c358300b003d1f2c3e571sm17392836wmq.33.2023.01.09.04.08.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 04:08:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 00/21] hw: Remove implicit sysbus_mmio_map() from pflash
 APIs
Date: Mon,  9 Jan 2023 13:08:12 +0100
Message-Id: <20230109120833.3330-1-philmd@linaro.org>
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

Since v1:
- Do not introduce pflash_cfi_create(), directly
  open-code pflash_cfi_register() before removing it (Peter)
- Added R-b tags

Paving the road toward heterogeneous QEMU, the limitations of
having a single machine sysbus become more apparent.

The sysbus_mmio_map() API forces the caller to map a sysbus
device to an address on the system bus (system bus here is
the root MemoryRegion returned by get_system_memory() ).

This is not practical when each core has its own address
space and group of cores have access to a part of the
peripherals.

Experimenting with the PFLASH devices. Here the fix is
quite easy: open-code the pflash_cfi_register() functions.

Since we were touching the PFLASH API, we restricted the
PFlashCFI0X structures to their models. The API now deals
with a generic qdev pointer (DeviceState*).

Please review,

Phil.

Based-on: <20230109115316.2235-1-philmd@linaro.org>
          "hw/arm: Cleanups before pflash refactor"
Based-on: <20230109120154.2868-1-philmd@linaro.org>
          "hw/misc: Cleanups around PFLASH use"

Philippe Mathieu-Daudé (21):
  hw/block: Rename TYPE_PFLASH_CFI02 'width' property as 'device-width'
  hw/block: Pass DeviceState to pflash_cfi01_get_blk()
  hw/block: Use pflash_cfi01_get_blk() in pflash_cfi01_legacy_drive()
  hw/block: Pass DeviceState to pflash_cfi01_get_memory()
  hw/arm: Use generic DeviceState instead of PFlashCFI01
  hw/loongarch: Use generic DeviceState instead of PFlashCFI01
  hw/riscv: Use generic DeviceState instead of PFlashCFI01
  hw/i386: Use generic DeviceState instead of PFlashCFI01
  hw/xtensa: Use generic DeviceState instead of PFlashCFI01
  hw/sh4: Open-code pflash_cfi02_register()
  hw/arm/digic: Open-code pflash_cfi02_register()
  hw/arm/musicpal: Open-code pflash_cfi02_register()
  hw/arm/xilinx_zynq: Open-code pflash_cfi02_register()
  hw/block: Remove unused pflash_cfi02_register()
  hw/block: Make PFlashCFI02 QOM declaration internal
  hw/arm: Open-code pflash_cfi01_register()
  hw/microblaze: Open-code pflash_cfi01_register()
  hw/mips: Open-code pflash_cfi01_register()
  hw/ppc: Open-code pflash_cfi01_register()
  hw/block: Remove unused pflash_cfi01_register()
  hw/block: Make PFlashCFI01 QOM declaration internal

 hw/arm/collie.c                          | 16 ++++++---
 hw/arm/digic_boards.c                    | 26 ++++++++++----
 hw/arm/gumstix.c                         | 32 +++++++++++++----
 hw/arm/mainstone.c                       | 19 +++++++---
 hw/arm/musicpal.c                        | 21 +++++++----
 hw/arm/omap_sx1.c                        | 31 +++++++++++-----
 hw/arm/sbsa-ref.c                        |  8 ++---
 hw/arm/versatilepb.c                     | 18 +++++++---
 hw/arm/vexpress.c                        | 10 +++---
 hw/arm/virt.c                            |  6 ++--
 hw/arm/xilinx_zynq.c                     | 20 ++++++++---
 hw/arm/z2.c                              | 17 +++++++--
 hw/block/pflash_cfi01.c                  | 45 ++++++------------------
 hw/block/pflash_cfi02.c                  | 40 ++-------------------
 hw/i386/pc_sysfw.c                       |  6 ++--
 hw/loongarch/virt.c                      |  9 +++--
 hw/microblaze/petalogix_ml605_mmu.c      | 18 ++++++----
 hw/microblaze/petalogix_s3adsp1800_mmu.c | 16 ++++++---
 hw/mips/malta.c                          | 18 ++++++----
 hw/ppc/e500.c                            |  2 +-
 hw/ppc/sam460ex.c                        | 19 +++++++---
 hw/ppc/virtex_ml507.c                    | 15 ++++++--
 hw/riscv/virt.c                          |  7 ++--
 hw/sh4/r2d.c                             | 21 ++++++++---
 hw/xtensa/xtfpga.c                       |  6 ++--
 include/hw/arm/virt.h                    |  3 +-
 include/hw/block/flash.h                 | 37 ++-----------------
 include/hw/i386/pc.h                     |  3 +-
 include/hw/loongarch/virt.h              |  3 +-
 include/hw/riscv/virt.h                  |  3 +-
 30 files changed, 276 insertions(+), 219 deletions(-)

-- 
2.38.1


