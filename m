Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 365E6536E2A
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 21:24:38 +0200 (CEST)
Received: from localhost ([::1]:60224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nv23A-00064B-Ph
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 15:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nv201-0003Pj-NA; Sat, 28 May 2022 15:21:21 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:46798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nv1zz-00021S-Uq; Sat, 28 May 2022 15:21:21 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 c9-20020a7bc009000000b0039750ec5774so4411616wmb.5; 
 Sat, 28 May 2022 12:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SQpLfrdO1EwLV7oP418pkgvZKkNvAMuSNnjxAQfX418=;
 b=pr9K+8IT23Cip8Z8ydckTMXLP9Pd0PoUy0GFeG1U51wE6t9e4CrcFYeil1LW6N2mPc
 FcFqYZv9TNSMLRaBEXvyYiskoBzWwpSDLThrl3kFzrUdqhP8TnBhcHv7juMetoMg1K7R
 3mJaDUA3mTwJAtpFJp1M4m8vOl21n5v0tENHXvHGmo6OlJm8HNpwWgWjw6ipdKw/XNtr
 42+I3ad5CPk9T46PwdqKhu2PsdsaPVb2qLbX8l7R1DiuAfKsePSKKH8AWb5RX7htO2Zt
 V7GvuKjDiBnkBua5v4qNW76Ki7GBBMsP9k1OvcrJFzEBs+QOxQruisiazSypJD764SqP
 JD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SQpLfrdO1EwLV7oP418pkgvZKkNvAMuSNnjxAQfX418=;
 b=BDPOKZlvbpTnN0PbaAyRsTVthRNQmuZCy6tw6GTSGVkY0S45OAFDW9j+sHtbmj4J83
 KLyGJPIlGltUfcnN0FZ7UnZEOQFJntQTQycDQ1qCREKZMSwYyD7exAj8lmnH1iQ/lMcC
 tEhG8Ok1DePoWgdgllTuWNCNUDz5asjo0OVUg2W3SQFXlXyR7dh7bLo7uYkfI0uZn3MF
 STatiMQTXy+wogX+9yn2Zr6fQ8NvfUyBeNadXhb+/W+N14Oo0PeEucV8AKHkyF/rMqMg
 /++6lrNLDpijOcfHJgnRc9yY/UvD0pj4pHt8Z7wlol+xPmuU0V3njxsrk+B6Qj4D1TKY
 v5Uw==
X-Gm-Message-State: AOAM5323EBh99zBACoukyLxIHUbctCfeF/7k84YpMzUTy9IFXkq99dnM
 bhpAmnqNH36jJDgvK+bpbcIO/6LOUkewa2vrhvk=
X-Google-Smtp-Source: ABdhPJyOiZ9mg8Rj7fy6O0GuA30BY8cuUPdLxN1p+JKHbwqK8vNxqV+xm7JI5pTyGXMF5ZWolbJuBQ==
X-Received: by 2002:a05:600c:a03:b0:395:bb63:b457 with SMTP id
 z3-20020a05600c0a0300b00395bb63b457mr12147443wmp.192.1653765677036; 
 Sat, 28 May 2022 12:21:17 -0700 (PDT)
Received: from osoxes.fritz.box (pd9ed79c4.dip0.t-ipconnect.de.
 [217.237.121.196]) by smtp.gmail.com with ESMTPSA id
 a21-20020a05600c069500b003942a244ed7sm5341022wmn.28.2022.05.28.12.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 May 2022 12:21:16 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 0/7] QOM'ify PIIX southbridge creation
Date: Sat, 28 May 2022 21:20:49 +0200
Message-Id: <20220528192057.30910-1-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x329.google.com
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

v3:
* Rebase onto 'hw/acpi/piix4: remove legacy piix4_pm_init() function' (Mark) [1]
* Use embedded structs for touched PCI devices (Mark)
* Fix piix4's rtc embedded struct to be initialized by
  object_initialize_child() (Peter) [2]

Testing done:

1)
`make check-avocado` for --target-list=x86_64-softmmu,mips-softmmu
Result: All pass.

2)
* `qemu-system-x86_64 -M pc -m 2G -cdrom archlinux-2022.05.01-x86_64.iso`
* `qemu-system-mipsel -M malta -kernel vmlinux-3.2.0-4-4kc-malta -hda
  debian_wheezy_mipsel_standard.qcow2 -append "root=/dev/sda1 console=tty0"`

In both cases the system booted successfully and it was possible to shut down
the system using the `poweroff` command.


v2:
* Preserve `DeviceState *` as return value of piix4_create() (Mark)
* Aggregate all type name movements into first commit (Mark)
* Have piix4 southbridge rather than malta board instantiate piix4 pm (me)

Testing done:

1)
`make check-avocado` for --target-list=x86_64-softmmu,mips-softmmu
Result: All pass.

2)
Modify pci_piix3_realize() to start with
    error_setg(errp, "This is a test");
Then start `qemu-system-x86_64 -M pc -m 1G -accel kvm -cpu host -cdrom 
archlinux-2022.05.01-x86_64.iso`.
Result: qemu-system-x86_64 aborts with: "This is a test"


v1:
The piix3 and piix4 southbridge devices still rely on create() functions which
are deprecated. This series resolves these functions piece by piece to
modernize the code.

Both devices are modified in lockstep where possible to provide more context.

Testing done:
* `qemu-system-x86_64 -M pc -m 2G -cdrom archlinux-2022.05.01-x86_64.iso`
* `qemu-system-mipsel -M malta -kernel vmlinux-3.2.0-4-4kc-malta -hda
  debian_wheezy_mipsel_standard.qcow2 -append "root=/dev/sda1 console=tty0"`

In both cases the system booted successfully and it was possible to shut down
the system using the `poweroff` command.

[1] https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg05686.html
[2] https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg01128.html

Bernhard Beschow (7):
  include/hw/southbridge/piix: Aggregate all PIIX soughbridge type names
  hw/isa/piix4: Use object_initialize_child() for embedded struct
  hw/isa/piix{3,4}: Move pci_map_irq_fn's near pci_set_irq_fn's
  hw/isa/piix{3,4}: QOM'ify PCI device creation and wiring
  hw/isa/piix{3,4}: Factor out ISABus retrieval from create() functions
  hw/isa/piix4: QOM'ify PIIX4 PM creation
  hw/isa/piix{3,4}: Inline and remove create() functions

 hw/i386/pc_piix.c             |   7 +-
 hw/isa/piix3.c                |  98 ++++++++++++++-------------
 hw/isa/piix4.c                | 120 +++++++++++++++++-----------------
 hw/mips/malta.c               |   7 +-
 include/hw/isa/isa.h          |   2 -
 include/hw/southbridge/piix.h |   6 +-
 6 files changed, 127 insertions(+), 113 deletions(-)

-- 
2.36.1


