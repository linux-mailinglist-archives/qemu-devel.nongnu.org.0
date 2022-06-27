Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D44F55B829
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 09:23:48 +0200 (CEST)
Received: from localhost ([::1]:35040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5j61-0002RF-Pi
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 03:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o5izM-0003ee-EG; Mon, 27 Jun 2022 03:16:53 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:45944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o5izF-0003sh-Tl; Mon, 27 Jun 2022 03:16:48 -0400
Received: by mail-ed1-x530.google.com with SMTP id o9so11582741edt.12;
 Mon, 27 Jun 2022 00:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=onTIOnQM9FoGzoUHoGk+R6Wzcse9oKw44Zt1g1ZS5n8=;
 b=gKefXA4p5ZdPnOmhnsMNyeG382kzlLGF+SOOs8ZWURu5IupDRFLSXm2Zs2AYf+QHIT
 s86s2/2wJ9b5/eyB8JiITqgoBp4Wlp7/UHfDzkr7ZQ2BRSRWgiK5IhPzKCnszjT2Fk2h
 yKKoxb9vhv2izPL2yD4dPi8xqErna2ZeTzDnhMtXwT0iks9kikwoeur67Z/A/pSxY56E
 U/f4aOMwJmU54cWdTRFxwO4Gct7wHbnpSFd/Cy61beLBZrXaLRqgIc0txD5QgMXDa0dw
 s9ytEOjrmI75oQpUMiwFmKRRTklaGSkkRwIEBb1mtzGXu6HqRwkmmCSuraYuLQx3XS87
 2Kyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=onTIOnQM9FoGzoUHoGk+R6Wzcse9oKw44Zt1g1ZS5n8=;
 b=wK3lbBvQMtfnFalkJI0NaRMpIUWbYJ15lkLL49enA6zDjii9+nRGBG5WXxNTZVN+17
 GP0L2IaSxFDQpk+KmK982ouW2IOKK2kz1+T4mqBnOjsz5uMMIOeUGiShYPseTxFhqui5
 mEwSTM+7FL1+vnzy5Ri1dMn4UvFvI0BFC+SXjUi/Yh1aFc1Yy+/Ucfiz1vVV4AyLedve
 rWKo0t/Lub+34e+m09PpVOusI7H9XEas55onoG9jbpUyQwcymvHqgtFwaqLG1+Sowws/
 IIXlMKFPHdtPmXy9+LWEKLk84mB95lQnPo9siWA5fNB1vYXAl3RyxQBTWm41TcwbCF/Q
 dSyg==
X-Gm-Message-State: AJIora+Q9e/GPcLhE8R8M9dfuRuhL2HbdVEL0VLXxWS5aMqLXI1fP31a
 UueuQ601kdvXBHFkGgB8Bmx0JldLUerRvQ==
X-Google-Smtp-Source: AGRyM1tNmyCOV27xLOxNT+DMSmSB+u5dB5XBQ1qvUxY2lpljN4mKoETvOWhLVdIk7YsmPlLbXjM5cw==
X-Received: by 2002:a50:fb13:0:b0:435:90d1:19ca with SMTP id
 d19-20020a50fb13000000b0043590d119camr14956849edq.159.1656314203026; 
 Mon, 27 Jun 2022 00:16:43 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-183-075-191.77.183.pool.telefonica.de. [77.183.75.191])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a1709064e5000b007072dc80e06sm4593294ejw.190.2022.06.27.00.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 00:16:42 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 mark.cave-ayland@ilande.co.uk, balaton@eik.bme.hu,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [RFC PATCH 00/10] Resolve isabus global
Date: Mon, 27 Jun 2022 09:16:01 +0200
Message-Id: <20220627071611.8793-1-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x530.google.com
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

This series resolves the global "isabus" variable and is basically a v2 of =
[1].=0D
Note that the majority of the work consists of fixing ISA API calls in PIIX=
 IDE=0D
which implicitly rely on the usage of the isabus global.=0D
=0D
Rather than adding an ISABus pointer in PCIIDEState as in "v1" this series =
uses=0D
a qemu_irq array which is roughly the approach outlined in [2]. Moreover, t=
his=0D
series considers backwards compatibility for user-created PIIX IDE=0D
"Frankensten" devices by using a temporary hack. This hack can be removed a=
gain=0D
once a deprecation period of user-createable PIIX IDE devices is over. This=
=0D
deprecation wasn't announced yet but now might be a good time.=0D
=0D
Testing done:=0D
* `./qemu-system-x86_64 -M x-remote -device piix3-ide` still fails graceful=
ly with=0D
`qemu-system-x86_64: -device piix3-ide: Failed to realize piix3-ide: No suc=
h device`=0D
* `make check-avocado` doesn't report errors=0D
* Booting a live image with `./qemu-system-x86_64 -M pc` works=0D
* Booting a MIPS Malta machine [3] works=0D
=0D
[1] https://patchew.org/QEMU/20210518215545.1793947-1-philmd@redhat.com/=0D
[2] https://lists.nongnu.org/archive/html/qemu-devel/2020-03/msg01707.html=
=0D
[3] https://people.debian.org/~aurel32/qemu/mips/=0D
=0D
Bernhard Beschow (10):=0D
  hw/ide/piix: Check for presence of ISABus before using it=0D
  Revert "hw/ide: Fix crash when plugging a piix3-ide device into the=0D
    x-remote machine"=0D
  hw/i386/pc_piix: Allow for setting properties on "piix3-ide" before=0D
    realizing it=0D
  hw/ide/piix: Avoid the isabus global when wiring ISA interrupts for=0D
    internal devices=0D
  hw/isa/isa-bus: assert() if isa_get_irq() gets passed a NULL ISADevice=0D
  hw/ide/ioport: Rename ide_init_ioport() to isa_ide_init_ioport()=0D
  hw/pci/pci: Introduce pci_register_portio_list()=0D
  hw/ide/piix: Use pci_ide_init_ioport() rather than=0D
    isa_ide_init_ioport()=0D
  hw/isa: Resolve unneeded usage of isabus global=0D
  hw/isa/isa-bus: Resolve isabus global=0D
=0D
 hw/i386/pc_piix.c         |  6 +++-=0D
 hw/ide/ioport.c           | 30 +++++++++++++-------=0D
 hw/ide/isa.c              |  2 +-=0D
 hw/ide/piix.c             | 59 +++++++++++++++++++++++++++++++--------=0D
 hw/isa/isa-bus.c          | 46 ++++++++++++++----------------=0D
 hw/isa/piix4.c            |  3 ++=0D
 hw/pci/pci.c              | 18 ++++++++++++=0D
 include/hw/ide/internal.h |  3 +-=0D
 include/hw/ide/pci.h      |  2 ++=0D
 include/hw/isa/isa.h      | 15 ++++------=0D
 include/hw/pci/pci.h      | 21 ++++++++++++++=0D
 11 files changed, 147 insertions(+), 58 deletions(-)=0D
=0D
-- =0D
2.36.1=0D
=0D

