Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3764B9CFA
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 11:25:35 +0100 (CET)
Received: from localhost ([::1]:46182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKdyd-0001D3-E2
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 05:25:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKdte-0006bk-Gl
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 05:20:23 -0500
Received: from [2a00:1450:4864:20::632] (port=37663
 helo=mail-ej1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nKdtc-0002u2-8v
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 05:20:21 -0500
Received: by mail-ej1-x632.google.com with SMTP id bg10so6050090ejb.4
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 02:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B8P/c6Ywxh6oPDA6IWJBkTL+fvHUClnwW71KtVkO9S4=;
 b=HNj3WxvFvZvgAQvtJpLs0afTvAZgo7aonDCvm5ZDgurfyAv9Pke+opq92gxSPArBxM
 ikWyY6TGJyjIZXPQLfOehyOd7X8r7P2J/7c61LJRsYySLTB+rSxwY6E/iANW2J02UIYs
 fjEnll387ed9KefUPc1DEB1icDm7AAJIhgkaMk9yJ01uDo1f9NxlcAirS9/EJJK8cF8z
 066YSZ52HPNRHzurgn3oVff/q49F/L+tJro69DY0x+aeB2gXo1q5EMndjmY6E3uQ4zZm
 BRxaYzzepgIUp7aF+kgJ9Gb0lSTxad4uB382JnaLS7F1yXVXDC5ADZGD1PMIrUxiU3e4
 x5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B8P/c6Ywxh6oPDA6IWJBkTL+fvHUClnwW71KtVkO9S4=;
 b=1rxil+cNSEs2FwegZIuEHhPuxEobd0vZqaX7LEdV+5T971zh7+WLBaKhC8E6ofriVB
 l5SmwwBnFvAEnyQYVJA/QWrzNFsyJhIlDOPTbcDWL3hebly4vE//qTZn26DcBH8TAoMV
 uMney8uljBRANub3t2RsEUav/v3kH733wmlfd5mZIYl6ZDi3nvBsbsWILm8uAM112DIk
 p+tnPAt1OU+ycyK526dI8KQ9zi5HEZ2M4MlT/W4MPDBr22TRp3Sij+Q9QP80NtvC6eB6
 AzDj1bDeHmPpPbXI0+beeFptYcLEbtQ/smSmymOhyKJV1J3mY82l/aJJMkoAV4MTohqE
 mlOg==
X-Gm-Message-State: AOAM533njE53AyAOJzsm4Xm8j0MBJ0dCRAH3sgWvTkEAUzsxe0K8ssdM
 nTGocP20iq0GoVJalpn6GBE9hF4uH5w=
X-Google-Smtp-Source: ABdhPJxEgNKfh4R4b4g5nOhpo2bs4h5HjWXohkmj/ppDCYxeIj5nCF+LOYpXZpYlQD0Sl7EMXDxDwA==
X-Received: by 2002:a17:906:53c3:b0:6cf:742d:84de with SMTP id
 p3-20020a17090653c300b006cf742d84demr1720174ejo.576.1645093218563; 
 Thu, 17 Feb 2022 02:20:18 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-198-236.77.183.pool.telefonica.de. [77.183.198.236])
 by smtp.gmail.com with ESMTPSA id u26sm986753ejg.196.2022.02.17.02.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 02:20:18 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/7] malta: Fix PCI IRQ levels to be preserved during
 migration, cleanup
Date: Thu, 17 Feb 2022 11:19:17 +0100
Message-Id: <20220217101924.15347-1-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::632
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

Tested with [1]:

  qemu-system-mipsel -M malta -kernel vmlinux-3.2.0-4-4kc-malta -hda \
  debian_wheezy_mipsel_standard.qcow2 -append "root=/dev/sda1 console=tty0"

It was possible to log in as root and `poweroff` the machine.

[1] https://people.debian.org/~aurel32/qemu/mips/


v4:
  As suggested by BALATON Zoltan, gt64120_register() is now resolved by
    sysbus_create_simple() etc. This also fixes the nitpick pointed out by
    Philippe.

v3:
  The migration bug now gets fixed in gt64xxx_pci before any cleanup. As
    suggested by PMM the patch is based on commit e735b55a8c11.
  The code movement patch now moves the already fixed code. I might be a bit
    too conservative here by removing Philippe's Reviewed-By tag.
  As suggested by BALATON Zoltan, the redundant i8259[] attribute is now
    resolved immediately after the code movement. As a side effect, it also
    removes moved code which doesn't adhere to the coding style (local loop
    variable).
  To address BALATON Zoltan's comment and to reduce the number of required
    Reviewed-By's, only piix4_set_irq() is modified to expect own DeviceState
    paremeter. Up to v2, all remaining set_irq() functions were changed this
    way.
  The patch resolving piix4's singleton variable got split into two patches:
    One which resolves the singleton variable and one which replaces magic
    constants. The split patches should be more comprehensible.
  Suggested by BALATON Zoltan, I took a chance to resolve gt64120_register(),
    a method akin to the legacy init functions we're trying to get rid of.

v2:
  isa/piix4: Fix PCI IRQ levels to be preserved in VMState
  isa/piix4: Resolve redundant i8259[] attribute

Bernhard Beschow (7):
  hw/mips/gt64xxx_pci: Fix PCI IRQ levels to be preserved during
    migration
  malta: Move PCI interrupt handling from gt64xxx_pci to piix4
  hw/isa/piix4: Resolve redundant i8259[] attribute
  hw/isa/piix4: Pass PIIX4State as opaque parameter for piix4_set_irq()
  hw/isa/piix4: Resolve global instance variable
  hw/isa/piix4: Replace some magic IRQ constants
  hw/mips/gt64xxx_pci: Resolve gt64120_register()

 hw/isa/piix4.c                | 54 +++++++++++++++++++++--
 hw/mips/gt64xxx_pci.c         | 80 +++--------------------------------
 hw/mips/malta.c               |  7 +--
 include/hw/mips/mips.h        |  3 --
 include/hw/southbridge/piix.h |  2 -
 5 files changed, 59 insertions(+), 87 deletions(-)

-- 
2.35.1


