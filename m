Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C85B5B9ECC
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 17:29:14 +0200 (CEST)
Received: from localhost ([::1]:49290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYqnh-00057p-GZ
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 11:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oYqkV-0007nJ-MS; Thu, 15 Sep 2022 11:25:55 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:39598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oYqkT-0007Ds-UP; Thu, 15 Sep 2022 11:25:55 -0400
Received: by mail-ej1-x635.google.com with SMTP id y17so37927524ejo.6;
 Thu, 15 Sep 2022 08:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=tOwGM0kJmcxc3eMZ5zS4awfDVRAFyP+eLZyhO+3i0is=;
 b=Zu7slcQZQYBHZQNsOxJeyGiYMLFAEMLMK9Gb9SJX0uXjtr4EHnFxWx0AtzLxPfYcEL
 W2sXKAHa84Yjr38ObK3HkHMc7z60tuy+3ylIDIAMQJLQ9ZJ+BUFUvRgG8upjqPcfgCIi
 MTOWi/f09k2Vg9TDn9hxL6sBctYF+GwX/+o9yrx4H3sJsZBiC1By4ft00tHrl60IWKck
 5p0x2QLh5vjbXYsBRbdWBumRV31pqm4hyz+Bwk9wZmL7jsNBb74QatlG9Gu4UrcSesxx
 Ta5oZ9eLYxBgpoB/jtLJ0ZTCSUoq+YUH31ob6XUM7qU9Q2QvWPXqvkFk8Wnt0kYUXc4l
 pdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=tOwGM0kJmcxc3eMZ5zS4awfDVRAFyP+eLZyhO+3i0is=;
 b=KgxeEeL5ANuQukZqZpf1d+HuRcZ+r/3CSsFlEYg8Wy5BKK7SJezo2oFS1w8W1cIwsg
 y3iezt7xr2zJvNgeCnvJKUjjCcIeXmyO7uqxJiN6ZZ4zafgRv/rFtxSolya9fNntrZAk
 8QpiEwxsMSmng0V4Y+OcZJLkVsF0gjgRXCmwuPN7jk/luyM3R/A239WMhA71fi6XMBO1
 MNXpy0NkhlzcWIyd9HK7oCHY9OS/o8E4cGwoU2+/Z6cY/CV+cGpKxki1q31ldYCn0aC9
 6ICsqUJ1yXLFUWJAdviuFPSZHqIQNWUVrIVwWRjmBaIwis7MdS9Z4Ah49/d8sAyVpI47
 edNg==
X-Gm-Message-State: ACrzQf2eKVBI1U933V06SWR2JMLOGDv17Vp3fIb9rYn/w0YyLR2oHvBY
 GNmQprMP7yq3aIdWzczW3E47535bjgg=
X-Google-Smtp-Source: AMsMyM6C84sy+I2l7eR2DDhTfO/9+TYYqBYa87kuSr1NM2syq+L5L0oyJVx7EZ9zdEZXYDoiBjBdCQ==
X-Received: by 2002:a17:907:7b94:b0:731:1b11:c241 with SMTP id
 ne20-20020a1709077b9400b007311b11c241mr373819ejc.676.1663255551146; 
 Thu, 15 Sep 2022 08:25:51 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-182-143.77.191.pool.telefonica.de. [77.191.182.143])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170906210200b00730979f568fsm9297138ejt.150.2022.09.15.08.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 08:25:50 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 qemu-ppc@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 00/11] ppc/e500: Add support for two types of flash, cleanup
Date: Thu, 15 Sep 2022 17:25:09 +0200
Message-Id: <20220915152520.21948-1-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series adds support for -pflash and direct SD card access to the=0D
PPC e500 boards. The idea is to increase compatibility with "real" firmware=
=0D
images where only the bare minimum of drivers is compiled in.=0D
=0D
The series is structured as follows:=0D
=0D
Patches 1-3 perform some general cleanup which paves the way for the rest o=
f=0D
the series.=0D
=0D
Patches 4-7 add -pflash handling where memory-mapped flash can be added on=
=0D
user's behalf. That is, the flash memory region is only added if the -pflas=
h=0D
argument is supplied. Note that the cfi01 device model becomes stricter in=
=0D
checking the size of the emulated flash space.=0D
=0D
Patches 8-11 add a new device model - the Freescale eSDHC - to the e500=0D
boards which was missing so far.=0D
=0D
User documentation is also added as the new features become available.=0D
=0D
Tesing done:=0D
* `qemu-system-ppc -M ppce500 -cpu e500mc -m 256 -kernel uImage -append=0D
"console=3DttyS0 rootwait root=3D/dev/mtdblock0 nokaslr" -drive=0D
if=3Dpflash,file=3Drootfs.ext2,format=3Draw`=0D
* `qemu-system-ppc -M ppce500 -cpu e500mc -m 256 -kernel uImage -append=0D
"console=3DttyS0 rootwait root=3D/dev/mmcblk0" -device sd-card,drive=3Dmydr=
ive -drive=0D
id=3Dmydrive,if=3Dnone,file=3Drootfs.ext2,format=3Draw`=0D
=0D
The load was created using latest Buildroot with `make=0D
qemu_ppc_e500mc_defconfig` where the rootfs was configured to be of ext2 ty=
pe.=0D
In both cases it was possible to log in and explore the root file system.=0D
=0D
Bernhard Beschow (11):=0D
  hw/ppc/meson: Allow e500 boards to be enabled separately=0D
  hw/gpio/meson: Introduce dedicated config switch for hw/gpio/mpc8xxx=0D
  docs/system/ppc/ppce500: Add heading for networking chapter=0D
  hw/ppc/mpc8544ds: Add platform bus=0D
  hw/ppc/e500: Remove if statement which is now always true=0D
  hw/block/pflash_cfi01: Error out if device length isn't a power of two=0D
  hw/ppc/e500: Implement pflash handling=0D
  hw/sd/sdhci-internal: Unexport ESDHC defines=0D
  hw/sd/sdhci: Rename ESDHC_* defines to USDHC_*=0D
  hw/sd/sdhci: Implement Freescale eSDHC device model=0D
  hw/ppc/e500: Add Freescale eSDHC to e500 boards=0D
=0D
 configs/devices/ppc-softmmu/default.mak |   3 +-=0D
 docs/system/ppc/ppce500.rst             |  28 ++++=0D
 hw/block/pflash_cfi01.c                 |   8 +-=0D
 hw/gpio/Kconfig                         |   3 +=0D
 hw/gpio/meson.build                     |   2 +-=0D
 hw/ppc/Kconfig                          |  11 ++=0D
 hw/ppc/e500.c                           | 116 +++++++++++--=0D
 hw/ppc/e500.h                           |   1 -=0D
 hw/ppc/e500plat.c                       |   1 -=0D
 hw/ppc/meson.build                      |   6 +-=0D
 hw/ppc/mpc8544ds.c                      |   5 +=0D
 hw/sd/sdhci-internal.h                  |  20 ---=0D
 hw/sd/sdhci.c                           | 212 +++++++++++++++++++++---=0D
 include/hw/sd/sdhci.h                   |   3 +=0D
 14 files changed, 349 insertions(+), 70 deletions(-)=0D
=0D
-- =0D
2.37.3=0D
=0D

