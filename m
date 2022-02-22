Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 958524C021E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 20:40:44 +0100 (CET)
Received: from localhost ([::1]:55994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMb1f-0006FV-6e
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 14:40:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMaw4-0003JB-5h
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:34:59 -0500
Received: from [2a00:1450:4864:20::52b] (port=40712
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMaw2-0006pS-4w
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:34:55 -0500
Received: by mail-ed1-x52b.google.com with SMTP id h15so22437388edv.7
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 11:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gLpKP3ae4IkNoqIvrY2T524hEwqPWmsIQIPU25AnpwA=;
 b=D5ZKPD8+VCnji+FAwsbMnd2PNvj/OgEbvR5lIqzDYAj0Oi5O//Jyq0hBqQjRrPyzal
 8XOATj5znoaVxZP+pE1/oQhe7xh7G7aE0DxemLrc50Z5AQf/XWl5eQUpjMC3YloDTigT
 s4y9xyFrMVCnD6wAcSKpwazN6IhrjN3xM9O3GqzPxySbh0VnVC7qlK0FjT8vlU6RY7ca
 UeEP+Wqvs7JP//SfWc7felg8dBMC+qy3khgfEB9IRbbVoe+jIukvr1XUUJGZfYHgI1Ck
 ZYFn/T+gmXmuWAqrZ0SwviaqK1kJZm/K4iUc0+7jRuN7zRtsEZ7o9DC1HEA2BOY6jfEe
 9+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gLpKP3ae4IkNoqIvrY2T524hEwqPWmsIQIPU25AnpwA=;
 b=FFwHnKCQUSHkTePH4pNoddBMge8/HjZdctzAhInnK8qRPa9hOlfqBxNzn/B/LnA+9e
 J6/MSJYVSS1PSDAs1C7+PVGXX4UrVocZn17GGpzbD7M6zc1QthzqAOWkybAC2cdsEIt0
 CVuJYbnANhqP6b2pcOKNlSkucjeiJFL+VgQX+J1NbYQqJYRcGGu1YevEUBolo8gmrae8
 yvRbLqtTQ7BqIn3ZU0rrAjEnSEtA171Vh3oSF6Hi6VCecYZ/jlnE+/XQML2ybpvJGOIR
 p71s0f4N28jkQfQQ7fshq4dPbsIK5XMjxnx99DmYDIOuK8GkcBZX6DdZ+Sdn/Ssygwcl
 Mw0w==
X-Gm-Message-State: AOAM530vQRERnJ21MWj6lJonWlcpbAe7mEKRQC4m8hGd6SmDeVNI5HS9
 Zq0zDN3ZZbbPVNWssYaX4IUnJP1sZlY=
X-Google-Smtp-Source: ABdhPJxXC4nA4GGSHIftPYZTlI9bZBF2nQVX6FFGJ+xHAGPa2YYcWMv8JAUqGmMtHjlhsRsj08URiQ==
X-Received: by 2002:a05:6402:142f:b0:40d:e8eb:1dbe with SMTP id
 c15-20020a056402142f00b0040de8eb1dbemr28258085edx.421.1645558492525; 
 Tue, 22 Feb 2022 11:34:52 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id i1sm766532edj.84.2022.02.22.11.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 11:34:52 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/22] isa: Resolve unneeded IRQ attributes from ISADevice
Date: Tue, 22 Feb 2022 20:34:24 +0100
Message-Id: <20220222193446.156717-1-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
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

v2:
The newly QOM'ified devices now report an error to the user in their realize
functions if the configured IRQ number is greater than 15.

v1:
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
 hw/input/pckbd.c             | 26 +++++++++++++++++++++----
 hw/ipmi/isa_ipmi_bt.c        |  2 +-
 hw/ipmi/isa_ipmi_kcs.c       |  2 +-
 hw/isa/isa-bus.c             | 37 +-----------------------------------
 hw/isa/piix4.c               |  2 +-
 hw/net/ne2000-isa.c          |  2 +-
 hw/ppc/pnv.c                 |  5 ++++-
 hw/rtc/m48t59-isa.c          |  9 ++++++++-
 hw/rtc/mc146818rtc.c         | 13 +++++++++++--
 hw/tpm/tpm_tis_isa.c         |  2 +-
 include/hw/isa/isa.h         |  3 ---
 include/hw/rtc/mc146818rtc.h |  1 +
 tests/qemu-iotests/172.out   | 26 -------------------------
 20 files changed, 59 insertions(+), 85 deletions(-)

-- 
2.35.1


