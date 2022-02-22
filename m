Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B64994C0044
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:41:35 +0100 (CET)
Received: from localhost ([::1]:52158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMZAM-0007LR-NJ
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:41:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMZ7Q-0003J7-Ja
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:38:32 -0500
Received: from [2a00:1450:4864:20::535] (port=40917
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMZ7O-0002kh-DF
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:38:32 -0500
Received: by mail-ed1-x535.google.com with SMTP id h15so21727944edv.7
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 09:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uLE7zkddQ8lhLWvaSZxVJiXfnyCZqkzM+zwMZ+8o5bY=;
 b=pPsI/ZDVPmJZJsTizTPoEihcm9SAGv0o0ySvVCp76G3nkWCbM6RJSCkoma7dOWhbg4
 D4MazWTMKQgnB4Kvjlkf4rmJxgvZCuc5dMqHRM+/aM38aohtJFWixz79GrDT6BLt79Cm
 e77tfN1oEQn6okocMJ3pNpQRYWrx1pMCWHc6adGpsDFPmQZYUXdZ+7kUOxhHISjGl5qy
 T6CMNsSXF0bsVrh+hNWj09z8Kl9GNdp1ATmlCPKtvx6zkFqJhjXHXX6woeHJtpT39NGL
 IhRJabTzfgu8KZ3b9WcTaA9foi6PwLgkVtvXLiqJui1berhc7vqSTOdC0TY8Vi9B9IAN
 73ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uLE7zkddQ8lhLWvaSZxVJiXfnyCZqkzM+zwMZ+8o5bY=;
 b=CJaZmF6f92I8cip7p1S1zbTB7WBTU+envx/TZkLPOSjPfH2zm85TcLJTRLzAzhMR4d
 nhyDyiMnltVmzz5cXuWpY6hRTapN84TzfM3ng2wUPZsKe0jzW8LLxWO1zG4GFXWZrP/e
 6PNwk9EYOSBp5tVDqe+D9olxa3WvqivHR653KkEPtrtTxQsXAc45UbEv1GT1I6/rShJy
 rt5+c6nrs6SZaRs01MiTZ3G84zdVLaV1pqxxsWLJN7ykssNKgfbQN6723EUrw/GJzJn2
 zMWBKJ5aVnkdfofOHwRy7yYGR2IXmaT49xzjicr8KWU4TP67smDhSk0GECQKmnL0o44Q
 ZTHA==
X-Gm-Message-State: AOAM532t0NfGF8E2vj31QWfnjwi7DtkOsgnSdAqZM9d35sbzJfM2ygDJ
 a0VnHRMuZHhHvYghduQICZ6mDLIgnJ8=
X-Google-Smtp-Source: ABdhPJx5q2bJkFLFRECWdYjPZAaXm7dQaHRuCGbwl5swIq6ml/Pdq6/xX9CJbQr2m5T7FL//y73EcQ==
X-Received: by 2002:a50:cc89:0:b0:400:8f82:99e8 with SMTP id
 q9-20020a50cc89000000b004008f8299e8mr26864626edi.7.1645551508471; 
 Tue, 22 Feb 2022 09:38:28 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id et2sm6449382ejc.101.2022.02.22.09.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:38:28 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/22] isa: Resolve unneeded IRQ attributes from ISADevice
Date: Tue, 22 Feb 2022 18:37:57 +0100
Message-Id: <20220222173819.76568-1-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The IRQ attributes of ISADevice are hardcoded to support up to two IRQs per
device which creates an artificial limit. By not having the attributes in the
first place, this limitation can be avoided altogether.

The IRQ attributes are mostly used for printing ('info qtree') and there is one
user, hw/ppc/pnv, to use the attributes directly. As it turns out, the printing
is redundant if the IRQ numbers are exposed as QOM properties and hw/ppc/pnv
can be easily ported away.

The patch series is structured as follows: Patch 1-3 QOM'ify the last devices
which rely on printing their IRQ numbers via the ISADevice attributes. Patch
4 and 5 remove the last users of the ISADevice attributes such that they can be
removed in patch 6. The remainder of the patch series is cleanup.

Patch 6 turns isa_init_irq() into a trivial wrapper for isa_get_irq(). That is,
the former function becomes redundant. All users are therefore converted to use
isa_get_irq() directly. Finally, the last patch removes the now unused
isa_init_irq().

Bernhard Beschow (22):
  hw/rtc/mc146818rtc: QOM'ify IRQ number
  hw/rtc/m48t59-isa: QOM'ify IRQ number
  hw/input/pckbd: QOM'ify IRQ numbers
  hw/isa/isa-bus: Remove isabus_dev_print()
  hw/ppc/pnv: Determine ns16550's IRQ number from QOM property
  isa: Drop unused attributes from ISADevice
  hw/audio/cs4231a: Disuse isa_init_irq()
  hw/audio/gus: Disuse isa_init_irq()
  hw/audio/sb16: Disuse isa_init_irq()
  hw/block/fdc-isa: Disuse isa_init_irq()
  hw/char/parallel: Disuse isa_init_irq()
  hw/char/serial-isa: Disuse isa_init_irq()
  hw/ide/isa: Disuse isa_init_irq()
  hw/input/pckbd: Disuse isa_init_irq()
  hw/ipmi/isa_ipmi_bt: Disuse isa_init_irq()
  hw/ipmi/isa_ipmi_kcs: Disuse isa_init_irq()
  hw/isa/piix4: Disuse isa_init_irq()
  hw/net/ne2000-isa: Disuse isa_init_irq()
  hw/rtc/m48t59-isa: Disuse isa_init_irq()
  hw/tpm/tpm_tis_isa: Disuse isa_init_irq()
  hw/isa/isa-bus: Disuse isa_init_irq()
  isa: Remove unused isa_init_irq()

 hw/audio/cs4231a.c           |  2 +-
 hw/audio/gus.c               |  2 +-
 hw/audio/sb16.c              |  2 +-
 hw/block/fdc-isa.c           |  2 +-
 hw/char/parallel.c           |  2 +-
 hw/char/serial-isa.c         |  2 +-
 hw/ide/isa.c                 |  2 +-
 hw/input/pckbd.c             | 13 +++++++++----
 hw/ipmi/isa_ipmi_bt.c        |  2 +-
 hw/ipmi/isa_ipmi_kcs.c       |  2 +-
 hw/isa/isa-bus.c             | 37 +-----------------------------------
 hw/isa/piix4.c               |  2 +-
 hw/net/ne2000-isa.c          |  2 +-
 hw/ppc/pnv.c                 |  5 ++++-
 hw/rtc/m48t59-isa.c          |  4 +++-
 hw/rtc/mc146818rtc.c         |  8 ++++++--
 hw/tpm/tpm_tis_isa.c         |  2 +-
 include/hw/isa/isa.h         |  3 ---
 include/hw/rtc/mc146818rtc.h |  1 +
 tests/qemu-iotests/172.out   | 26 -------------------------
 20 files changed, 36 insertions(+), 85 deletions(-)

-- 
2.35.1


