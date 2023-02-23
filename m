Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9946A1127
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 21:24:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVI7e-0005eW-Kn; Thu, 23 Feb 2023 15:23:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pVI7a-0005d1-RB; Thu, 23 Feb 2023 15:23:20 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pVI7Y-0002GS-Tk; Thu, 23 Feb 2023 15:23:18 -0500
Received: by mail-ed1-x52b.google.com with SMTP id f13so46187482edz.6;
 Thu, 23 Feb 2023 12:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3TAEuDUMr90/4Bb3lbWVsGYMv+Kyi6kiTYvisAPc2jY=;
 b=ciV0ijTQ93PRRaEvKORGXqw0CyZ+S0ZS+9WQdt56kVWSlw3YK5HtddKOAaDzLsoovC
 +twSv8wR+/wVuv2JRrfQ+YJiOHjIKpVI3h3jUXt+33vJUq9yf96jvv34c0SoQcxMk+PD
 CWjHaKcooA5+fP8o5n5Mman6cPMXL9WgSw4cMiSgwWxgiTcavYpl7nvNdlPs7+r32Lfl
 5G5xYVmQxDADiopygg4V51JuKS6LPDT/XTPhEBhSyvYaeoeSCgblkby99n7YUwmynW07
 O6l9w2WX+xykmeqM+w5XaAH43Us5VpcW514cG0b02ncpLIzLfHLODvULzXGowvrZcdAU
 /qTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3TAEuDUMr90/4Bb3lbWVsGYMv+Kyi6kiTYvisAPc2jY=;
 b=jn7KDNVyX7nL6ZYdLXBKy92suwaMZERcZvRsATGI91N6xmBT+JDJy8Bk9c1QnyaXqc
 TummhXR62j3kiA2SmPjeVzy3l3wOtPncJY3EcpMOw0ZGIJWOoiX4VJX4/lHsluI+v/XL
 BrBFNKw2UdDQQY4Fq4aRWDZc0WkYjRTjL5azNVhkMclST9jIOYUpPnVKTpKg5PHxu1UU
 chf9UFlfhsDex8jTQOcE0HvnUKSQYU8iQPEKsCxSZHX2edvA59Wx+nROsX8rRX0e5WVa
 BNk9q/w3BEgEjUqtWU1yVYsxPvfyTafA1Me1XFT7Rw+av9mKLW50AcBqVbburNBXhGps
 VfAQ==
X-Gm-Message-State: AO0yUKWYeux1EjQS31lNrPOp+U28S595orDNT1BqIKy4Mqsji5uyDqMx
 2bCwg/yHxILPdn/BUeV+V88WCZMRn18=
X-Google-Smtp-Source: AK7set8i+gGtK2eNU8W06x3l7s84AIPmkYNh9qirr+S9/z2mfjkkrh+boDKsN9+WBrbvqPVTB8OOmA==
X-Received: by 2002:a17:907:8b86:b0:8ea:5f7d:8fec with SMTP id
 tb6-20020a1709078b8600b008ea5f7d8fecmr6716918ejc.36.1677183792819; 
 Thu, 23 Feb 2023 12:23:12 -0800 (PST)
Received: from osoxes.fritz.box (pd9ed7433.dip0.t-ipconnect.de.
 [217.237.116.51]) by smtp.gmail.com with ESMTPSA id
 jj1-20020a170907984100b008d606b1bbb1sm5200917ejc.9.2023.02.23.12.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 12:23:12 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 0/5] VT82xx PCI fixes and audio output support
Date: Thu, 23 Feb 2023 21:20:48 +0100
Message-Id: <20230223202053.117050-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
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

This series is v2 of [1] ("[PATCH 0/5] Pegasos2 fixes and audio output=0D
support"). It makes PCI interrupt routing on the VIA south bridges more=0D
compliant to the PCI specification and adds partial implementation of the=0D
via-ac97 sound part enough to get audio output working on the ppc/pegasos2=
=0D
machine.=0D
=0D
All credits for implementing AC'97 support go to Zoltan who would like this=
=0D
series to be merged for QEMU 8.0.=0D
=0D
v2:=0D
* Rework PCI IRQ routing in the VIA south bridges=0D
* Use pci_set_irq() rather than via_isa_set_irq() in via-ac97=0D
=0D
Testing done:=0D
* `make check`=0D
* `qemu-system-ppc -M pegasos2 -rtc base=3Dlocaltime -device=0D
  ati-vga,guest_hwcursor=3Dtrue,romfile=3D"" -cdrom morphos-3.17.iso -kerne=
l=0D
  morphos-3.17/boot.img`=0D
  -> There is a nice sound when the Desktop becomes visible.=0D
* `qemu-system-ppc -M pegasos2 -bios pegasos2.rom -rtc base=3Dlocaltime -de=
vice=0D
  ati-vga,guest_hwcursor=3Dtrue,romfile=3D"" -cdrom morphos-3.17.iso`=0D
  -> There is a nice sound when the Desktop becomes visible.=0D
* `qemu-system-ppc -M pegasos2 -bios pegasos2.rom -rtc base=3Dlocaltime -de=
vice=0D
  ati-vga,guest_hwcursor=3Dtrue,romfile=3D"" -cdrom morphos-3.17.iso -devic=
e=0D
  usb-mouse -device usb-kbd`=0D
  -> The machine hangs when audio is supposed to play while the mouse is mo=
ved.=0D
     This behavior can also be reproduced in v1.=0D
=0D
[1] https://lore.kernel.org/qemu-devel/cover.1677004414.git.balaton@eik.bme=
.hu/=0D
=0D
BALATON Zoltan (2):=0D
  hw/audio/ac97: Split off some definitions to a header=0D
  hw/audio/via-ac97: Basic implementation of audio playback=0D
=0D
Bernhard Beschow (3):=0D
  hw/ppc/pegasos2: Initialize VT8231 PCI IRQ router=0D
  hw/isa/vt82c686: Implement PCI IRQ routing=0D
  hw/usb/vt82c686-uhci-pci: Use PCI IRQ routing=0D
=0D
 hw/audio/ac97.h            |  65 ++++++=0D
 include/hw/isa/vt82c686.h  |  25 +++=0D
 hw/audio/ac97.c            |  43 +---=0D
 hw/audio/via-ac97.c        | 436 ++++++++++++++++++++++++++++++++++++-=0D
 hw/isa/vt82c686.c          |  46 +++-=0D
 hw/ppc/pegasos2.c          |   6 +=0D
 hw/usb/vt82c686-uhci-pci.c |  12 -=0D
 hw/audio/trace-events      |   6 +=0D
 8 files changed, 580 insertions(+), 59 deletions(-)=0D
 create mode 100644 hw/audio/ac97.h=0D
=0D
-- =0D
2.39.2=0D
=0D

