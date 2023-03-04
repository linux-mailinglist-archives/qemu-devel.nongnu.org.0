Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B4D6AA954
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 12:42:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYQGC-0003Tq-IN; Sat, 04 Mar 2023 06:41:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pYQG5-0003TG-Nq; Sat, 04 Mar 2023 06:41:01 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pYQG3-0008Sh-W1; Sat, 04 Mar 2023 06:41:01 -0500
Received: by mail-ed1-x52c.google.com with SMTP id o12so20144330edb.9;
 Sat, 04 Mar 2023 03:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677930056;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=06gg4nj5t96ACPHTw2gBHN9uS53R5IPT6zk8wxzhNFU=;
 b=UzVPvPSBAN0dNiy0GhdwdWBf02+6XVqYEm+q+9xVQciQ8V+CaSotPF3lIHVbeGBxrK
 hA+esXZ/ZtKP9aoWyqmsWYhN6N+bHyFCo9Cee6p9qiGtGo90X297mdz9gP6Az09OTBHD
 0dvJ4WGIQkHt3iNQQxH2kojNHqXVC3a+Ogdsjuhax2LdXeiVAJWyXw8U2nAkjHU6IYKE
 h/gfRV4HHSUK0OOFObZnTwh+16s1Sw8e26V2YmtnSwX0cOI9fQEQT+vskcWsrYBhxdDd
 MeOqyBySDTMsL7hDpyB9OOxbb8Iu6QdOudI42FNaeehAXofr0sEGppUM2ZWMZLixJmgE
 pirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677930056;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=06gg4nj5t96ACPHTw2gBHN9uS53R5IPT6zk8wxzhNFU=;
 b=4g3BuJbYDkVkke7j5PCSuNKQ3F41rlE9uCwwrd2k5qrJ7CfkeenshuwdLK7Z7Xz7sf
 hHqf0Qh+zo12CHI0yx4ljyZpY7lTeEerQ0zWw2YbU+92Kse6kcOZgyy/3vQRkHk0M6rb
 cQB31qciqw8c/iCl4GtWDfjfvWQW+ZCfR9mS6V93QwhG5ASMWD2wpuLCV8AmDmyuiLEX
 n/y8tz5KmoKQLexNqE3YZErOo4yb3pzNrAVQx7q/yoXTNaA8uJKWR21SpXKwBHO2NTVL
 U4JcBZ4aFBrwEOHXrpGgaq2mOhPepSk9wS6qP99RRrLAI9HQHLOV834Eb7XHsioAcifK
 vyCg==
X-Gm-Message-State: AO0yUKVUoPHNbaj0mBHyd0QlitcS6xLmFGHGx3CCrPp52urLHTSWnJjM
 egPwySnP/CR2To5Bbg7sywMQjFvTHpY=
X-Google-Smtp-Source: AK7set8oq/jds1IUJgmPrYtyTvvsZWTU8RWewZuoxo0eb2MzgQdC5i+9CSGtCru4zHvujv3oHVg2Yg==
X-Received: by 2002:a17:906:fd8c:b0:8f7:d5c0:c71d with SMTP id
 xa12-20020a170906fd8c00b008f7d5c0c71dmr6595282ejb.60.1677930056039; 
 Sat, 04 Mar 2023 03:40:56 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-004-175.77.183.pool.telefonica.de. [77.183.4.175])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a17090686c600b008c44438734csm1993248ejy.113.2023.03.04.03.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 03:40:55 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 0/5] Fix recent PIC -> CPU interrupt wiring regressions
Date: Sat,  4 Mar 2023 12:40:38 +0100
Message-Id: <20230304114043.121024-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
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

A recent series [1] attempted to remove some PIC -> CPU interrupt indirecti=
ons.=0D
This inadvertantly caused NULL qemu_irqs to be passed to the i8259 because =
the=0D
qemu_irqs aren't initialized at that time yet. This series provides a fix b=
y=0D
initializing the qemu_irq of the respective south bridges before they=0D
are passed to i2859_init().=0D
=0D
Furthermore -- as an optional extension -- this series also fixes some usab=
ility=0D
issues in the API for creating multifunction PCI devices.=0D
=0D
The series is structured as follows: The first three commits fix the=0D
regressions, the last two fix the public API for creating multifunction PCI=
=0D
devices.=0D
=0D
[1] https://lore.kernel.org/qemu-devel/20230302224058.43315-1-philmd@linaro=
.org/=0D
=0D
Bernhard Beschow (5):=0D
  hw/isa/vt82c686: Fix wiring of PIC -> CPU interrupt=0D
  hw/alpha/dp264: Fix wiring of PIC -> CPU interrupt=0D
  hw/ppc/prep: Fix wiring of PIC -> CPU interrupt=0D
  hw/pci/pci: Remove multifunction parameter from=0D
    pci_create_simple_multifunction()=0D
  hw/pci/pci: Remove multifunction parameter from=0D
    pci_new_multifunction()=0D
=0D
 include/hw/pci/pci.h |  4 +---=0D
 hw/alpha/dp264.c     |  8 +++++---=0D
 hw/i386/pc_piix.c    |  2 +-=0D
 hw/i386/pc_q35.c     | 10 +++++-----=0D
 hw/isa/vt82c686.c    |  3 ++-=0D
 hw/mips/boston.c     |  3 +--=0D
 hw/mips/fuloong2e.c  |  9 +++++----=0D
 hw/mips/malta.c      |  2 +-=0D
 hw/pci-host/sabre.c  |  6 ++----=0D
 hw/pci/pci.c         | 18 ++++++++++++------=0D
 hw/ppc/pegasos2.c    |  9 +++++----=0D
 hw/ppc/prep.c        |  4 +++-=0D
 hw/sparc64/sun4u.c   |  5 ++---=0D
 13 files changed, 45 insertions(+), 38 deletions(-)=0D
=0D
-- =0D
2.39.2=0D
=0D

