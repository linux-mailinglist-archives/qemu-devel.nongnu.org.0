Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C42686A2AFE
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 18:10:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVy2x-0001aZ-Uh; Sat, 25 Feb 2023 12:09:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pVy2w-0001a4-F4; Sat, 25 Feb 2023 12:09:18 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pVy2u-0005bB-Lf; Sat, 25 Feb 2023 12:09:18 -0500
Received: by mail-ed1-x52e.google.com with SMTP id d30so9458343eda.4;
 Sat, 25 Feb 2023 09:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S0ggo44XEF3v7ixuzuteDbv6TK2IoS4fYA4gs0/FkBc=;
 b=NBOFTxyQPK6WbgdraZJArruaciW7Be2jJCURigjL+50kYbsW3MwHgyHggTO2kE0UeN
 O/Ea9lsg14D4RtQn5VPCTUlhobRo9XuztYfFYCRB41ZWInt57c3VR0R83zURomD52Vr9
 06J7MsSCioB8JJvDlA3jsco2aZI+WFYg8JZG6mwb3IJ7tX9PuhXtS7I6yGkGs+gGfGCs
 BUKXsiGjxIKkjcoZRNR19bxVvzlBab1apf3VvwkRwSu2Dl4PmMgtVg0CkB68Qix91Svw
 oBhJyrpA/VuUSjhHKgpgIRAqbCV4Gr5PW7EWZC18eBPNcXtL9tzxuVnir/T/QG6Hds/T
 VOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S0ggo44XEF3v7ixuzuteDbv6TK2IoS4fYA4gs0/FkBc=;
 b=QuW5qd1WaDCjf9b+BMpIo3gPfcCx7HcHI/xWH8ChnkZXXZ+rva6sahA+JpgBO5NXc0
 7V9mM5Z02hjc/BVYHI4p9WjTQmc20FQdxZT2P8yQbQxVJhwrxR4mz/opjyGHlGR/vhpO
 gQgygE8i1V/09ECEbvmQJMv+CM2X7msDltkmZ7QtKm8jYqYJ6SBNwcGG9/+LGMDb6A4K
 ndS1jsgfTjy3ruc8gioqVH2lmwIzc3FlD8tiKKqMzKZUb6FMWh8/RE6NpMAb8Xf9j8BP
 djxpEu463rM4abNFfmNmHcvUut0ZJVbQ1C8oiTKxmYaoZy/gzqTBVuVsgZYSVqiGThOz
 /EGQ==
X-Gm-Message-State: AO0yUKXuSWnrbH+t1o6Phy2X1dgynVrVM3aDw3TUYc2fvVw+gGYVIUre
 2ho3ikcz0uOlsnkHGc/OoWo0IILaQ11Pyw==
X-Google-Smtp-Source: AK7set/csOE8+mhpBl6+Lq6MdpurqmU74iULxQQaa2P6Vce252SDYaHNMfNtnKhRB6ceuXEUjxJtIg==
X-Received: by 2002:a17:906:4909:b0:8af:2191:89a6 with SMTP id
 b9-20020a170906490900b008af219189a6mr24361726ejq.72.1677344953758; 
 Sat, 25 Feb 2023 09:09:13 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf06ee000578a61baa078133.dip0.t-ipconnect.de.
 [2003:fa:af06:ee00:578:a61b:aa07:8133])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a17090616c600b008d356cafaedsm989066ejd.40.2023.02.25.09.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 09:09:13 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 0/3] VT82xx PCI IRQ routing fixes
Date: Sat, 25 Feb 2023 18:08:54 +0100
Message-Id: <20230225170857.15774-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
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

This series makes PCI interrupt routing in the VIA south bridges more compl=
iant=0D
to the PCI specification. It aims to help bringing audio output support to =
the=0D
ppc/pegasos2 machine [1].=0D
=0D
v2:=0D
* Remove audio patches which were included for proof of concept=0D
=0D
Testing done with via-ac97 audio patches on top:=0D
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
[1] https://patchew.org/QEMU/cover.1677004414.git.balaton@eik.bme.hu/=0D
=0D
Bernhard Beschow (3):=0D
  hw/ppc/pegasos2: Initialize VT8231 PCI IRQ router=0D
  hw/isa/vt82c686: Implement PCI IRQ routing=0D
  hw/usb/vt82c686-uhci-pci: Use PCI IRQ routing=0D
=0D
 hw/isa/vt82c686.c          | 44 ++++++++++++++++++++++++++++++++++++++=0D
 hw/ppc/pegasos2.c          |  6 ++++++=0D
 hw/usb/vt82c686-uhci-pci.c | 12 -----------=0D
 3 files changed, 50 insertions(+), 12 deletions(-)=0D
=0D
-- =0D
2.39.2=0D
=0D

