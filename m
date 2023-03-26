Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA5E6C97C1
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Mar 2023 22:24:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgWtV-0001kl-PN; Sun, 26 Mar 2023 16:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pgWtR-0001k9-GS; Sun, 26 Mar 2023 16:23:09 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pgWtP-0003bz-SA; Sun, 26 Mar 2023 16:23:09 -0400
Received: by mail-lj1-x22d.google.com with SMTP id o20so3968916ljp.3;
 Sun, 26 Mar 2023 13:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679862186;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YdCK1YmxLjHTb0W4pjTT+uFHFQ5SmQxn8EiBB9hc9Tk=;
 b=RfgYpqfBVwDwgUBBxqZOiZXTUx2Sn2Xn6Ov09c6ASMImp3PQ7OyK1AzGIdBEIJsiFC
 PUnRBRiXIR+yOANryaUpIuykH6PqX2zwUHaoEzcwfZSXQ0w5hCvKHxUI60TJEc7RBwr8
 yvKvZEQu9psWVgEX2tjWms2AyaLFjluHNt2LEaKMKIabd/zhYGZSRUtZx1WQ2FTtz+CY
 thotnDOT0V37+KpWWw5x3A4c1xUJ/ajRdA6mimCN6iUyoEjkLzRgT1o24rAq9wz4IO5y
 leaKqDl3rL8k12dtOqLKNm8QdiYTz+pkG0OhTTQwq8aQbTuPPkIv8EDzh03Qmddv/wDb
 fCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679862186;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YdCK1YmxLjHTb0W4pjTT+uFHFQ5SmQxn8EiBB9hc9Tk=;
 b=S22QKbbVSXuhOaWUHRx2VXOgS03Y6kfgPOfZAZuVpgW+k/lzY+i1ddzJHmAnkAnoze
 yYY+VETm6E555ksbEXJ8i+TmQI+xM05D2DxwRzgNa0zlgca+uJ6LokejkCu6b0oA8RBj
 4yjbEB34E711MYDuvht/Z4TxcBrY/QPibJ428knH/6d1D7BuftnchH5dV4WkvAX0/HJm
 SQ1xk/ItGjXIgkfxHsKAoegaW+nOUaPgMhqA/0ds82YkloJRDYQHdqRoNI8Ljf1JG68y
 etbhAnTPFG93R+IpwPvgM58J5LmXOrALHAd0uuHTHJBN0loAfi6E2GbYWeoc+U4jjg1j
 0cxg==
X-Gm-Message-State: AO0yUKXx5o+UD6lTVwMY9pz8sQbglhIDtkhYZWCP+0nL/X79B+2II549
 Zl1AAhuEETXVSmCoVgxw9Ro=
X-Google-Smtp-Source: AK7set9DsrN++ZiZAN+AToPaTDMsF33hnnRRbrI+Jt9yKJyDHnWfcisQdkGX7u/acw88Ku56ccBWTA==
X-Received: by 2002:a05:651c:10b6:b0:2a0:3848:6b27 with SMTP id
 k22-20020a05651c10b600b002a038486b27mr4536463ljn.23.1679862185640; 
 Sun, 26 Mar 2023 13:23:05 -0700 (PDT)
Received: from penguin.lxd (213-67-202-254-no43.tbcn.telia.com.
 [213.67.202.254]) by smtp.googlemail.com with ESMTPSA id
 u3-20020a2e9f03000000b002a2b9d9429esm1427773ljk.117.2023.03.26.13.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Mar 2023 13:23:05 -0700 (PDT)
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
X-Google-Original-From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH v3 0/4] Basic Allwinner WDT emulation
Date: Sun, 26 Mar 2023 22:22:52 +0200
Message-Id: <20230326202256.22980-1-strahinja.p.jankovic@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

This patch set introduces basic emulation of Allwinner WDT.
Since WDT in both A10 and H3 is part of Timer module, the WDT
functionality is added as an overlay in the memory map.

The focus was to enable reboot functionality, so WDT interrupt handling
is not covered in this patch set.

With these patches the `reboot` command can be used for both Cubieboard
and Orangepi-PC in order to restart the system.

Also, Cubieboard avocado tests have been improved to include reboot
steps as well.

v3:
- Fixed allwinner_wdt_sun4i_can_reset_system function to use RST_EN_SUN4I_MASK

v2:
- Cleaned up WDT implementation (changes only in patch 01/04)
- Removed unnecessary checks - instead of changing enum to start from 1,
  removed if (!c->regmap[offset]) since it was conflicting enum values
- Reorganized comments

Strahinja Jankovic (4):
  hw/watchdog: Allwinner WDT emulation for system reset
  hw/arm: Add WDT to Allwinner-A10 and Cubieboard
  hw/arm: Add WDT to Allwinner-H3 and Orangepi-PC
  tests/avocado: Add reboot tests to Cubieboard

 docs/system/arm/cubieboard.rst      |   1 +
 docs/system/arm/orangepi.rst        |   1 +
 hw/arm/Kconfig                      |   2 +
 hw/arm/allwinner-a10.c              |   7 +
 hw/arm/allwinner-h3.c               |   8 +
 hw/watchdog/Kconfig                 |   4 +
 hw/watchdog/allwinner-wdt.c         | 416 ++++++++++++++++++++++++++++
 hw/watchdog/meson.build             |   1 +
 hw/watchdog/trace-events            |   7 +
 include/hw/arm/allwinner-a10.h      |   2 +
 include/hw/arm/allwinner-h3.h       |   5 +-
 include/hw/watchdog/allwinner-wdt.h | 123 ++++++++
 tests/avocado/boot_linux_console.py |  15 +-
 13 files changed, 588 insertions(+), 4 deletions(-)
 create mode 100644 hw/watchdog/allwinner-wdt.c
 create mode 100644 include/hw/watchdog/allwinner-wdt.h

-- 
2.30.2


