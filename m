Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B3D6A41BF
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 13:34:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWchp-0004gN-8R; Mon, 27 Feb 2023 07:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWchQ-0004Vd-Vk; Mon, 27 Feb 2023 07:33:50 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWchP-0008NZ-3n; Mon, 27 Feb 2023 07:33:48 -0500
Received: by mail-ed1-x52d.google.com with SMTP id da10so25185731edb.3;
 Mon, 27 Feb 2023 04:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RCfXQMzytxhUb9qt/V7R2Xt/UmJlhGiQ+uT+Hl7Ou/E=;
 b=EAzg9KU+WcRW+v7LCRX6GyiMBuhy8rPNljD/cKMWH5imei338ROtF8fs1OXnKFTF2j
 l2gPDgdk/b/4xb9HG7fC59UgcKy3VUOWqGlTN2Z7TX2rFauzXKitnskluhpTMoSKf5Sz
 RLjjz+GXXc5xHvuBvgwN8VA5xpfIXsAeTNXKYYDLjcJfTPFvDZ09VFXqWnOYW/pRkaLs
 +iuckg3z0uD4gDJQmr07oAv+nKL8PMvR1us6R3DSoa2wWtecFW/wX9OmjvEQxNf7/tLC
 fG9uunfnCNEKOkquvOirt9Yh+y8YBKjjhm8+pYWmZJw3EjJfXzAFsKgKVjytWcUVVvVp
 u2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RCfXQMzytxhUb9qt/V7R2Xt/UmJlhGiQ+uT+Hl7Ou/E=;
 b=zsB2wXFa34pfHOjVISFTG0XjphD29wjkG2604UlDNvR5qchy734AQOLBcNZfndE2dF
 44XwrTrLDgnwoy+PV8fQhgkKLbSGJTMaGLeXv6zzBMTkf4bU1JnX9Pg4oB4oVhAiDIn/
 kElvQ4/yg9RP/FyHiJhJYGPNszWqdgLWaEnwBWL6GhdDEKvBQ+IhR69B95DHh+O0qG6U
 ZeROWuYFaPttxYqCD+7x/fzfJU9VlkH0ktOyUJuIqIWz9Hvo7XLp1TCWAox+UauQnERO
 KcWsfIaELGgi190u/HuPbK8Lus9Pn2qEF4J5ZwAmqc6kFH4FK8elHMEacvPu0yJWlB3u
 fQlQ==
X-Gm-Message-State: AO0yUKU+8Av0dE3PE7qqtgZj+NWMXM7ckhhYX6uedok2tbeBJplvAtkq
 BWhqMjJ31qhmLaWf1ey/Uz1p6kRw5cU=
X-Google-Smtp-Source: AK7set+6Tq5MN94WabzkENhFXW4MwMHIZRc5SmFKa9+SAGLBZDnhqYqzQT5SVAyIR7hj/sQUu4afqg==
X-Received: by 2002:a17:906:d8c9:b0:878:7cf3:a9e7 with SMTP id
 re9-20020a170906d8c900b008787cf3a9e7mr32707072ejb.65.1677501224677; 
 Mon, 27 Feb 2023 04:33:44 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-154-008.78.55.pool.telefonica.de. [78.55.154.8])
 by smtp.gmail.com with ESMTPSA id
 oy26-20020a170907105a00b008b133f9b33dsm3092124ejb.169.2023.02.27.04.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 04:33:44 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Huacai Chen <chenhuacai@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 0/3] VT82xx PCI IRQ routing fixes
Date: Mon, 27 Feb 2023 13:33:13 +0100
Message-Id: <20230227123316.18719-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
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
v3:=0D
* Remove superfluous if statement in patch 2 (Phil)=0D
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
 hw/isa/vt82c686.c          | 41 ++++++++++++++++++++++++++++++++++++++=0D
 hw/ppc/pegasos2.c          |  6 ++++++=0D
 hw/usb/vt82c686-uhci-pci.c | 12 -----------=0D
 3 files changed, 47 insertions(+), 12 deletions(-)=0D
=0D
-- =0D
2.39.2=0D
=0D

