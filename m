Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F5D6314C2
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Nov 2022 16:08:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owlu2-0002HR-IG; Sun, 20 Nov 2022 10:06:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1owlu0-0002Gj-8K; Sun, 20 Nov 2022 10:06:36 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1owlty-0001x0-ID; Sun, 20 Nov 2022 10:06:35 -0500
Received: by mail-ed1-x532.google.com with SMTP id s12so13107363edd.5;
 Sun, 20 Nov 2022 07:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iFXOKlp0SyW2/quDQLXPdvOqIsDId/um2sWE130FuUA=;
 b=j4WZTinfWmrq/rVZq4czb8CXWrLF7NMmg1iw+pbfl9w8aCgEAa9HKyLe9QprNVt1C3
 qSGQVlig3ZUwlx2lXcE4e93CY4oGN5wSTCgRg5JiiMBqfjx9lsFCrJ75ENal90xisUQS
 ZWY9astIIqJsKwFt7LYv4IebBge15DcXT21mrDl559MuJWUqPG9tyEw0tbUAScbBn4zk
 x+mjs9VPa55oaW/wVsY4rCyLMxctoAdMMLkUVD94jna4uxelNnLj9jT4Vkc4x5twa1oO
 jrAJ+Rhn0S6Cqfbyq87kBjgCLmqL5iEIZRtlTUZ25+GTStUNslLorI1h6V01iDXJtlCM
 6JpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iFXOKlp0SyW2/quDQLXPdvOqIsDId/um2sWE130FuUA=;
 b=b5trYKmywHq/zN21EOJfmW0Vsvp1lFSaRcSjDlS0VfqZ/p1RKTgB6gr4yfpFvg9R84
 s+LvpPFKxoAa+KTsr3ooH7weYoIIgiYBWq9pC3gnw8VtYVqd2zGxiNnmsXMqa3z6ZDRI
 DDHq/pt7VMHI4K8QJloeRp1ndScUo+q0tQQCiBewsQ9A2d3kPwOGZjpSNi3JTM4SwmR5
 07vqJzmzmWWHfO6iI8moN82ocmaDOrtF00StB+7NELcekakUGg2C4/5SHmRsqHAcoUaQ
 vsKzZVplxf5rA5uqLlV9rBnEEnwAiWcr6fZ6RUQbzgpAP84WjzBmQlAnE/tUzrvNKnqy
 ucYg==
X-Gm-Message-State: ANoB5pn/1zC4W5TaBbNT5is0CjryaqZIDyJ7KufHwjmtOetueU/RuX81
 YgncHjSaZ9qvhmO/xw0jOFphOsWpcXQ=
X-Google-Smtp-Source: AA0mqf480RWkJumJA4jfoShY0TA8yCEnh4W3mO33/50WpFCh5/tBP3dIoU1ox8T6EEesc5PsfoLM0A==
X-Received: by 2002:aa7:dd04:0:b0:457:d794:f5ee with SMTP id
 i4-20020aa7dd04000000b00457d794f5eemr986505edv.227.1668956791699; 
 Sun, 20 Nov 2022 07:06:31 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-013-067-205.77.13.pool.telefonica.de. [77.13.67.205])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a1709061daa00b007b2a3cad2cfsm4026785ejh.132.2022.11.20.07.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 07:06:31 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 0/3] Decouple INTx-to-LNKx routing from south bridges
Date: Sun, 20 Nov 2022 16:05:47 +0100
Message-Id: <20221120150550.63059-1-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x532.google.com
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

v1:=0D
=3D=3D=3D=0D
=0D
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
This series first factors out pci_bus_map_irqs() from pci_bus_irqs() which=
=0D
then allowes for moving the two board-specific PIIX pci_slot_get_pirq()=0D
funtions into their respective boards. With these changes, the PIIX4 south=
=0D
bridge could eventually become an alternative to the PIIX3-Frankenstein=0D
solution in the PC machine.=0D
=0D
v2:=0D
=3D=3D=3D=0D
* Remove RFC tag from whole series=0D
* New patch to split pci_bus_irqs()=0D
* Remove VT82xx patch which was just a demonstration=0D
=0D
Testing done:=0D
* `make check`=0D
* `make check-avocado`=0D
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
  hw/pci/pci: Factor out pci_bus_map_irqs() from pci_bus_irqs()=0D
  hw/isa/piix3: Decouple INTx-to-LNKx routing which is board-specific=0D
  hw/isa/piix4: Decouple INTx-to-LNKx routing which is board-specific=0D
=0D
 hw/i386/pc_piix.c       | 16 ++++++++++++++++=0D
 hw/i386/pc_q35.c        |  4 ++--=0D
 hw/isa/piix3.c          | 17 ++---------------=0D
 hw/isa/piix4.c          | 27 +--------------------------=0D
 hw/mips/malta.c         | 28 ++++++++++++++++++++++++++++=0D
 hw/pci-host/raven.c     |  3 ++-=0D
 hw/pci-host/versatile.c |  3 ++-=0D
 hw/pci/pci.c            | 12 +++++++++---=0D
 hw/remote/machine.c     |  3 ++-=0D
 include/hw/pci/pci.h    |  3 ++-=0D
 10 files changed, 66 insertions(+), 50 deletions(-)=0D
=0D
-- =0D
2.38.1=0D
=0D

