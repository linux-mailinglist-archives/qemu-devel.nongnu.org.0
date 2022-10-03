Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB375F3786
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 23:14:12 +0200 (CEST)
Received: from localhost ([::1]:38572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofSlP-0007wg-J8
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 17:14:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ofS6y-0001V7-Ey; Mon, 03 Oct 2022 16:32:27 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:40603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ofS6w-0003wO-M2; Mon, 03 Oct 2022 16:32:24 -0400
Received: by mail-ej1-x636.google.com with SMTP id f1so7158268ejw.7;
 Mon, 03 Oct 2022 13:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=tRuCXofapoGrKWRPVlYzCza+WIgeEkPwJI2EISlGE0s=;
 b=PwdqaDqLWKDyMkYCHhkpV4biclLB7iS6iSmLUrv+oeZVlu8yh2777/O2yOrk2iPAp+
 itFfCL4lvJxqAAegevLe5OkvLv+4CrvPav4NSSWzObx04enfYi2s0JF6Zc8OhWFkwP9E
 hMIERKiM8pDbKabd5dk68aOWX+hefaE6RTOjfZZHzcLE0KhXONJPlQYMLjYKqzFzSAMQ
 1snXAilLKPitvx3e3LX0idruVaWj8GDbmd1jwhancvSlEhEHv94VOdPKiCfh7VpJ0iHm
 InRzvW2kIVgsLZ1xvFUlsNN2iJWC2U2NKUtWn0ciKMFP1ta6Nz8ONzbv8h5EKZ5+p/wp
 RJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=tRuCXofapoGrKWRPVlYzCza+WIgeEkPwJI2EISlGE0s=;
 b=p/mThMvO3roZX38bybs8GA2O8+BW/NOQXTdYeUesR9h2+hF08uhIa0015iK2GueEse
 3dbImY6v3j3iyrlwnxdxLAE2eJWK44ajSnFbUdoA0l0mza7pWIfFN8REZvEpD35IbPKc
 hgk4+GpCjPU6LpnTb2nucVSL7ug5BSRo5RnsSx03Mgavz1OoRe4yBwZdhaQpcYm1blNV
 +HFdGeCIuG+y3t3wn0xiojeQdUGFPdptOujS6CrMKgHZuWdMLq46hhKeXHDJoWnSVdVO
 nuv48WtzHHmTZt4elQ8tiqQEobL7WAJR6dykxlSgkNk9VHyyoo15It0TXD3IC3S4GYIb
 ceMA==
X-Gm-Message-State: ACrzQf3odhLZmAfPBhT5ywBX9BG1aUkK8UlYFd4MLBw33OKCFK3wM/ue
 zAbdWLdW1zzQjGgQ7NNREHjWxbHfREE=
X-Google-Smtp-Source: AMsMyM56j0RWgRtaqiD9+vwHPvD8A532K5B/zceOiod/8vy1cW7/aZBh5VWqRj3ed+6TJCu87B96IQ==
X-Received: by 2002:a17:906:7315:b0:782:66dc:4b76 with SMTP id
 di21-20020a170906731500b0078266dc4b76mr16280012ejc.751.1664829139401; 
 Mon, 03 Oct 2022 13:32:19 -0700 (PDT)
Received: from localhost.localdomain ([46.183.103.8])
 by smtp.gmail.com with ESMTPSA id
 lb9-20020a170907784900b0073ddd36ba8csm5978087ejc.145.2022.10.03.13.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 13:32:18 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 00/13] ppc/e500: Add support for two types of flash, cleanup
Date: Mon,  3 Oct 2022 22:31:29 +0200
Message-Id: <20221003203142.24355-1-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Cover letter:=0D
~~~~~~~~~~~~~=0D
=0D
This series adds support for -pflash and direct SD card access to the=0D
PPC e500 boards. The idea is to increase compatibility with "real" firmware=
=0D
images where only the bare minimum of drivers is compiled in.=0D
=0D
The series is structured as follows:=0D
=0D
Patches 1-5 perform some general cleanup which paves the way for the rest o=
f=0D
the series.=0D
=0D
Patches 6-9 add -pflash handling where memory-mapped flash can be added on=
=0D
user's behalf. That is, the flash memory region in the eLBC is only added i=
f=0D
the -pflash argument is supplied. Note that the cfi01 device model becomes=
=0D
stricter in checking the size of the emulated flash space.=0D
=0D
Patches 10-13 add a new device model - the Freescale eSDHC - to the e500=0D
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
v2:=0D
~~~=0D
Bin:=0D
- Add source for MPC8544DS platform bus' memory map in commit message.=0D
- Keep "ESDHC" in comment referring to Linux driver.=0D
- Use "qemu-system-ppc{64|32} in documentation.=0D
- Use g_autofree in device tree code.=0D
- Remove unneeded device tree properties.=0D
- Error out if pflash size doesn't fit into eLBC memory window.=0D
- Remove unused ESDHC defines.=0D
- Define macro ESDHC_WML for register offset with magic constant.=0D
- Fix some whitespace issues when adding eSDHC device to e500.=0D
=0D
Phil:=0D
- Fix tense in commit message.=0D
=0D
Bernhard Beschow (13):=0D
  hw/ppc/meson: Allow e500 boards to be enabled separately=0D
  hw/gpio/meson: Introduce dedicated config switch for hw/gpio/mpc8xxx=0D
  docs/system/ppc/ppce500: Add heading for networking chapter=0D
  hw/ppc/e500: Reduce usage of sysbus API=0D
  hw/ppc/mpc8544ds: Rename wrongly named method=0D
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
 hw/ppc/e500.c                           | 133 +++++++++++++--=0D
 hw/ppc/e500.h                           |   1 -=0D
 hw/ppc/e500plat.c                       |   1 -=0D
 hw/ppc/meson.build                      |   6 +-=0D
 hw/ppc/mpc8544ds.c                      |   9 +-=0D
 hw/sd/sdhci-internal.h                  |  20 ---=0D
 hw/sd/sdhci.c                           | 210 +++++++++++++++++++++---=0D
 include/hw/sd/sdhci.h                   |   3 +=0D
 14 files changed, 368 insertions(+), 70 deletions(-)=0D
=0D
-- =0D
2.37.3=0D
=0D

