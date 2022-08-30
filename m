Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 342065A6D71
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 21:37:04 +0200 (CEST)
Received: from localhost ([::1]:49678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT72h-0003N2-9S
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 15:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oT6U6-0002xu-HB; Tue, 30 Aug 2022 15:01:14 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:52097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oT6U1-0008Ph-CV; Tue, 30 Aug 2022 15:01:14 -0400
Received: by mail-wm1-x330.google.com with SMTP id ay12so6246833wmb.1;
 Tue, 30 Aug 2022 12:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=7olQ9Tgb+lc961uAXORKVZMZxaKChj8B4za1nKR0prQ=;
 b=gY/+sI/PHqTPTae7upZoZ99VZEqFoFKEnAW/32UtpZItFc2FobJRG2pkEeTo3S3q7N
 65kpnINFEMOznJ4ummXXFlzuO4FhsImHevWQPbM9ACQ0/gyRsa67sZcEXnif/RYViVqA
 5lHrvtPzZIZ4+IntXHbXdz8cxaS9dwLMPXUkI6D5bW5M5I9OCL55n42JhwVjzAIxYde6
 IwdK1fFNPEFlNK5IYuv5HPKB/3IUhDSYDVAenZwOChS6+3Huk+qpKHYBs0PvNeKbEczX
 4xm4FQsZ2O0T1l3I8NL9RARykSMiVYUKWsq6kpU9Cw03QoyuVyoGjvwabwB86zXFA+Yh
 T5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=7olQ9Tgb+lc961uAXORKVZMZxaKChj8B4za1nKR0prQ=;
 b=ed59xcmfLtHUZ289cRyMMAQcCEmuuIUdglpK1lDxSerl7c4fxjcZR/odDL46s5epFX
 YVX+q6bCScfjcni7uQeMTw71lZddbOFoW0+TKtABlu3QZ2/jVu3OQcacZ8rVFLe31vFe
 BSusgffKCASotg3GSNMhxCfLDEYKzBB8x/dbnEX/wxXYXcTzyw89PjxjbynUSkwe3y77
 pY+SfiIWbHaW+JhYyLqJcZWcN/owvMvwFtuoDiNicyI5l2NXvHwb79lHxjPLfOSKXaDs
 JEYPQ6koBNKpNGaAsvn3o84hG7XAZ1Wsb6FbFgmVSj7dAw6sgrnD+IQizYd/Yf1RF5oa
 2CDg==
X-Gm-Message-State: ACgBeo0nRjaLpFM6JM5LhwI1DL0x8ryEdrrQUKGXUV7/P9vmMKSIdxKo
 TN0D30CXYowFJyJh9gleyM4/wjznKAM=
X-Google-Smtp-Source: AA6agR77sXMGkGDQjs+lChhIJ0+RUMj7VkkFJ5+7ZLjHsC4wZ/qo6+wDUcX6c9nUzsaSjspgeOmKkw==
X-Received: by 2002:a05:600c:34d2:b0:3a5:afe5:3eb5 with SMTP id
 d18-20020a05600c34d200b003a5afe53eb5mr10645384wmq.122.1661886066904; 
 Tue, 30 Aug 2022 12:01:06 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adfea52000000b002206203ed3dsm9821285wrn.29.2022.08.30.12.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 12:01:06 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 00/10] Instantiate VT82xx functions in host device
Date: Tue, 30 Aug 2022 21:00:38 +0200
Message-Id: <20220830190048.67448-1-shentey@gmail.com>
X-Mailer: git-send-email 2.37.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

v2:=0D
* Keep the call to pci_ide_create_devs() in board code for consistency (Zol=
tan)=0D
* Create rtc-time alias in board rather than in south bridge code=0D
* Remove stale comments about PCI functions=0D
=0D
v1:=0D
This series instantiates all PCI functions of the VT82xx south bridges in t=
he south bridges themselves.=0D
For the IDE function this is especially important since its interrupt routi=
ng is configured in the=0D
ISA function, hence doesn't make sense to instantiate it as a "Frankenstein=
" device. The interrupt=0D
routing is currently hardcoded and changing that is currently not in the sc=
ope of this series.=0D
=0D
Testing done:=0D
* `qemu-system-ppc -machine pegasos2 -rtc base=3Dlocaltime -device ati-vga,=
guest_hwcursor=3Dtrue,romfile=3D"" -cdrom morphos-3.17.iso -kernel morphos-=
3.17/boot.img`=0D
  Boots successfully and it is possible to open games and tools.=0D
=0D
* I was unable to test the fuloong2e board even before this series since it=
 seems to be unfinished [1].=0D
  A buildroot-baked kernel [2] booted but doesn't find its root partition, =
though the issues could be in the buildroot receipt I created.=0D
=0D
[1] https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2=0D
[2] https://github.com/shentok/buildroot/commits/fuloong2e=0D
=0D
Bernhard Beschow (10):=0D
  hw/isa/vt82c686: Resolve chip-specific realize methods=0D
  hw/isa/vt82c686: Resolve unneeded attribute=0D
  hw/isa/vt82c686: Prefer pci_address_space() over get_system_memory()=0D
  hw/isa/vt82c686: Reuse errp=0D
  hw/isa/vt82c686: Instantiate IDE function in host device=0D
  hw/isa/vt82c686: Instantiate USB functions in host device=0D
  hw/isa/vt82c686: Instantiate PM function in host device=0D
  hw/isa/vt82c686: Instantiate AC97 and MC97 functions in host device=0D
  hw/isa/vt82c686: Embed RTCState in host device=0D
  hw/isa/vt82c686: Create rtc-time alias in boards instead=0D
=0D
 configs/devices/mips64el-softmmu/default.mak |   1 -=0D
 hw/isa/Kconfig                               |   1 +=0D
 hw/isa/vt82c686.c                            | 119 +++++++++++++++----=0D
 hw/mips/fuloong2e.c                          |  21 ++--=0D
 hw/ppc/Kconfig                               |   1 -=0D
 hw/ppc/pegasos2.c                            |  25 ++--=0D
 include/hw/isa/vt82c686.h                    |   2 -=0D
 7 files changed, 115 insertions(+), 55 deletions(-)=0D
=0D
-- =0D
2.37.2=0D
=0D

