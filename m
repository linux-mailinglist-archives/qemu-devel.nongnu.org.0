Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 606E15268DA
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 19:58:59 +0200 (CEST)
Received: from localhost ([::1]:42642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npZZ4-0004kE-FF
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 13:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1npZVF-00088e-Br; Fri, 13 May 2022 13:55:01 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:39861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1npZVD-0004jB-4p; Fri, 13 May 2022 13:55:00 -0400
Received: by mail-ej1-x631.google.com with SMTP id bv19so17667982ejb.6;
 Fri, 13 May 2022 10:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9rqBmn8YnMTW0RKryoFkiS7PUR5rHMyOOmHYyr+GAcQ=;
 b=SDky/RnWu0N9HfsIrXM+qKZDJlEHHRq3AhyluzhAq8661m971T3Zj1Jcw1XJ5llejg
 4y1kzsgMbBRN+Mgqxgi+HzZB0XlEP0Bj1him23if9vFh2Wgd0PXStELxLyhbMiRcMyoP
 4n5lv7tzNXsTcqFFbakdluylfrtozToLUJDoJGr3io3liteYQuYV8JXV3sAiojSizDVi
 N6dLqQDyWOY9Nj+ZK8nPvDNdJEwKKMqrQ3GHn44sV8doJVg+wmc/27OJ7Lu8UvixLh8x
 CnHpqj9oFrh4TnWbKcOdD1114eMzWsiqYBNNmqnsVMZVfulZY5yZhVESJwEbs90bcg69
 fY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9rqBmn8YnMTW0RKryoFkiS7PUR5rHMyOOmHYyr+GAcQ=;
 b=5Ir9k48AY+jhNj08UIzevHalislxhKQyGG4rYDnznJMN255SqVnrTCFPgzq1zle+Pi
 Ox+yuyDuWOGrq2Gs5RN8Ltm7UKQSzC6oAQE4LZ3K2trqIk7G03Gj4hrSWdbJBQVv6TX5
 aKkYkI3qv0y7LlflmSNlDjIm9XxIn5G69c7xlB9msAmoXpgNiadLdfOlAPPygt09wHTR
 3kWHa23MZ+IAs6Me33+jmr0q5H/8EN+5Nn+ucFC+IPZucIpKzQLMoQt9S/Ickt/zApH/
 wYLkIaXSBBH9nGaHFZYGNH7XLifkNGjyjkNbOWi6lxjEvoxNORQrzOI7wD9RfLHq+dtM
 /dyQ==
X-Gm-Message-State: AOAM531P5K6aThEuPAd5RvPcUcqegB8ymbKSh4479NNnsF0uQL1yPvEw
 1t/TErvoeOzDxshtNjFYr6FlUV8yLW0=
X-Google-Smtp-Source: ABdhPJxqyv+ZYjAs3/qWavNGUywiNarkayDE/D60qjuo97gVHIwvUOgGG+I8bzX+URhr2VaUgNixXA==
X-Received: by 2002:a17:906:3e05:b0:6f3:a14a:fd3f with SMTP id
 k5-20020a1709063e0500b006f3a14afd3fmr5052223eji.640.1652464496873; 
 Fri, 13 May 2022 10:54:56 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-089-014-181-123.89.14.pool.telefonica.de. [89.14.181.123])
 by smtp.gmail.com with ESMTPSA id
 ci18-20020a170907267200b006f3ef214e3esm953874ejc.164.2022.05.13.10.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 10:54:56 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 0/6] QOM'ify PIIX southbridge creation
Date: Fri, 13 May 2022 19:54:39 +0200
Message-Id: <20220513175445.89616-1-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
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

The piix3 and piix4 southbridge devices still rely on create() functions which
are deprecated. This series resolves these functions piece by piece to
modernize the code.

Both devices are modified in lockstep where possible to provide more context.

Testing done:
* `qemu-system-x86_64 -M pc -m 2G -cdrom archlinux-2022.05.01-x86_64.iso`
* `qemu-system-mipsel -M malta -kernel vmlinux-3.2.0-4-4kc-malta -hda debian_wheezy_mipsel_standard.qcow2 -append "root=/dev/sda1 console=tty0"`

In both cases the system booted successfully and it was possible to shut down
the system using the `poweroff` command.

Bernhard Beschow (6):
  include/hw: Move TYPE_PIIX4_PCI_DEVICE to southbridge/piix.h
  hw/isa/piix{3,4}: Move pci_map_irq_fn's near pci_set_irq_fn's
  hw/isa/piix{3,4}: QOM'ify PCI device creation and wiring
  hw/isa/piix{3,4}: Factor out ISABus retrieval from create() functions
  hw/isa/piix4: Factor out SM bus initialization from create() function
  hw/isa/piix{3,4}: Inline and remove create() functions

 hw/i386/pc_piix.c             |  7 ++-
 hw/isa/piix3.c                | 98 +++++++++++++++++++----------------
 hw/isa/piix4.c                | 91 +++++++++++++-------------------
 hw/mips/malta.c               |  9 +++-
 include/hw/isa/isa.h          |  2 -
 include/hw/southbridge/piix.h |  6 +--
 6 files changed, 105 insertions(+), 108 deletions(-)

-- 
2.36.1


