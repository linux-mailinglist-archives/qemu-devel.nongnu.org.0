Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF3062C885
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 19:57:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovNZp-00028Y-Ce; Wed, 16 Nov 2022 13:56:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1ovNZX-00027m-2A
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 13:55:44 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1ovNZV-0002nf-3u
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 13:55:42 -0500
Received: by mail-ej1-x62e.google.com with SMTP id t25so46343416ejb.8
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 10:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FQattdL2J4mR6Q8hbgYra2AkL5fITkiLjOIsjdl5p58=;
 b=kn5Ur8JGrDskYECTxQiwd/KrkEK3IpKrB37z5w+9jprBkJLcPYNh+hRpcU0KvdO2Nh
 dpqfEnL0wAjtHgtMBWef/Qv9Yz5myvG3x5RA9ZclUaO+RaVtSuH1+o9Ho3FFFfts79QT
 lcdfMV+mWPeq/IBgF0NjODchtQTNzRHz5MJhw06/JWjjvn50E7VIQ1O+mnx/NlnkAY0E
 ZrqqFimcTi9gG3vQOC+wE4RbzTCZbPydPH6t3HyUFZA1bD3HrAeC0/wXbCxkuJmBJNsF
 h3dkC8z4SWOCWqZAMqH0Q1x2kxwfn0P8xUDv8h1SUAFXV2o9qj0r52qSPob3TdDGFU5c
 dVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FQattdL2J4mR6Q8hbgYra2AkL5fITkiLjOIsjdl5p58=;
 b=44oXYO4W0hf4c9MFS+2GMLl4ATAcxBDsTUj7JzE8KYsJZ9VNrgvOqlRmHQZ9P77a2M
 0Nn2Yo5VcJiacVSkkAyZY70a6FGysTt00bP1BlYLuu3fcnpil08++NjDg4iPH1YkHcga
 QYcqfCpr99dSb8z6MhZ5nfzGl9YOPvaiPAFhoOG8uvwuKjpJDXIRzMRXQL04OsXNWaHc
 JAvB9xtASJj15cz+k+hNHUeU/RTK8x5W+PSehsfQu6G39euDC56vUB56YD9/wNjsHM3o
 BDGVnD8HmRo9IR4joG4OgQu1+Q7QDcQLa++7zocCK9AaHuD3DEzqyLQ9xVpAjZaCLZm/
 BnJA==
X-Gm-Message-State: ANoB5pnySu4De6lI9L73Y6alp0brdLBqwhufVhbLurRYihtv1E1ldxFT
 9wHqg6///6KYFSGFPzIyqjf3JwmVjMc=
X-Google-Smtp-Source: AA0mqf7KfYDZ0sQQgFeFkJRI+sWIpw+sUN0YZQjfgce0idQl+vmv1UvoO79qhAtbmFn4QCKDz5q/6w==
X-Received: by 2002:a17:907:c246:b0:78d:3863:e555 with SMTP id
 tj6-20020a170907c24600b0078d3863e555mr18862395ejc.438.1668624938389; 
 Wed, 16 Nov 2022 10:55:38 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-013-007-153.77.13.pool.telefonica.de. [77.13.7.153])
 by smtp.gmail.com with ESMTPSA id
 de30-20020a1709069bde00b0073d796a1043sm7135444ejc.123.2022.11.16.10.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 10:55:37 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
Subject: [RFC PATCH 0/3] Decouple INTx-to-LNKx routing from south bridges
Date: Wed, 16 Nov 2022 19:54:57 +0100
Message-Id: <20221116185500.84019-1-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
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

During my PIIX consolidation work [1] I've noticed that both PIIX models ha=
ve=0D
quite different pci_slot_get_pirq() implementations. These functions seem t=
o=0D
map PCI INTx pins to input pins of a programmable interrupt router which is=
=0D
AFAIU board-specific. IOW, board-specific assumptions are baked into the de=
vice=0D
models which prevent e.g. the whole PIIX4 south bridge to be reusable in th=
e PC=0D
machine.=0D
=0D
In this series, I've moved the pci_slot_get_pirq() implementations into the=
ir=0D
respective boards. This required a hack, however, thus this RFC. The issue =
is=0D
that pci_slot_get_pirq() can only be assigned using pci_bus_irqs() which al=
so=0D
wants a pci_set_irq_fn. That function is in turn device-specific.=0D
=0D
Futhermore, the issue does not only affect PIIX but also the VIA south brid=
ges=0D
as demonstrated in the last patch. Any advice for an upstreamable solution =
would=0D
be highly appreciated.=0D
=0D
Testing done:=0D
* `make check`=0D
* `make check-avocado`=0D
* `qemu-system-ppc -machine pegasos2 -rtc base=3Dlocaltime -device ati-vga,=
guest_hwcursor=3Dtrue,romfile=3D"" -cdrom morphos-3.17.iso -kernel morphos-=
3.17/boot.img -serial stdio`=0D
* `qemu-system-mips64el -M malta -kernel vmlinux-3.2.0-4-5kc-malta -hda deb=
ian_wheezy_mipsel_standard.qcow2 -append "root=3D/dev/sda1 console=3DttyS0"=
`=0D
* `qemu-system-x86_64 -M pc -m 2G -cdrom manjaro-kde-21.3.2-220704-linux515=
.iso`=0D
=0D
Thanks,=0D
Bernhard=0D
=0D
[1] https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg03941.html=
=0D
=0D
Bernhard Beschow (3):=0D
  hw/isa/piix3: Decouple INTx-to-LNKx routing which is board-specific=0D
  hw/isa/piix4: Decouple INTx-to-LNKx routing which is board-specific=0D
  hw/isa/vt82c686: Implement PIRQ routing=0D
=0D
 hw/i386/pc_piix.c | 17 +++++++++++++++++=0D
 hw/isa/piix3.c    | 16 +++-------------=0D
 hw/isa/piix4.c    | 28 ++--------------------------=0D
 hw/isa/vt82c686.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++=0D
 hw/mips/malta.c   | 29 +++++++++++++++++++++++++++++=0D
 5 files changed, 97 insertions(+), 39 deletions(-)=0D
=0D
-- =0D
2.38.1=0D
=0D

