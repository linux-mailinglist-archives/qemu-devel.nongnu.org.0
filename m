Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A787265D672
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 15:46:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD51T-0005Fj-2s; Wed, 04 Jan 2023 09:45:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pD51C-0005Ev-EN
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:45:26 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pD51A-0002oB-Tf
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:45:26 -0500
Received: by mail-wr1-x429.google.com with SMTP id s9so1187842wru.13
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 06:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8AWtfe719mk9eM2p93lKeuen7Jx5n1pIewca97MBqdc=;
 b=OwFsjrcMxKj1s4H/fotfYoCBwsygaVEcANDEtkGKlRyfBhRTz2OCJEfvXLHdpvGD7x
 1UEQXKL/fkPiuknoLjoM5DN7aY70nsceK2OJjfdaAgw9ncTN9zqwANYNKuVh9/VYPIav
 Gxa5DzQLOhl4wRP4fdUdJRo0/0J+NooIx+ufMBgihzp8h8ReOBqkfcMdo5OIuU7w6C1T
 xeIFvIeZUCH0v04IqmRX6RWe7b9aT6myshNL5uBQppaZzdT6fjevlsqcM0Ali9GqYGyM
 3aA5vHjcTLoKc3+eO5xe3fGq8g9ZH0qb1jafzvK3ILB8i4T2FQ5zM5m/u/LZkPbBN/GS
 +UMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8AWtfe719mk9eM2p93lKeuen7Jx5n1pIewca97MBqdc=;
 b=hXwbEv+gPUBRPJIUAfkJKRNJEoq/RD7VeMMExPLyhweA9nOHrOS21JmDg9LgAFhhW5
 m1yDeO7tq8YPJCxWGM+f/wRLqutiNMFNkmZffuvZT6B5CvWzjLXFkrSDQWkYbyPS2wBV
 tLw5tOpEbyOkQRx/TDOJtPpI6JsYrZvVGyHitpE2GJKFYNN3iQ+4ENyBZSJwhMmiPAiN
 GQiKcNOhAr4k3tkU99bCXMttn8gJe6FfQX53bn4BpvHMxbwlfALxJDRqcu9UyqdxITKl
 lo2oo+JGrOQPbs8aV1Km954rznLGuh+ojicOW4I9mtF2BFnUmqSdOMV/tGJMY1BImK9B
 Objw==
X-Gm-Message-State: AFqh2koRAkPyMt8BPgX2+jEA0q941lJT7RVesGaZYl1dl1GhcUpjcwYN
 +j74KrUW6Dp4KeJdz3jl79BhZ9WyLMlpmw==
X-Google-Smtp-Source: AMrXdXvIETTxnaRaRvm9hcFDe31cy8g3McWj56E8OyCHBH1xc4SjLtjj5azN8me5MaQQNXaIHCKkjw==
X-Received: by 2002:a5d:5e81:0:b0:244:e704:df2c with SMTP id
 ck1-20020a5d5e81000000b00244e704df2cmr34565713wrb.57.1672843522692; 
 Wed, 04 Jan 2023 06:45:22 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a5d594a000000b0028663fc8f4csm21168241wri.30.2023.01.04.06.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 06:45:22 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Chuck Zmudzinski <brchuckz@aol.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 0/6] Resolve TYPE_PIIX3_XEN_DEVICE
Date: Wed,  4 Jan 2023 15:44:31 +0100
Message-Id: <20230104144437.27479-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x429.google.com
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

This series first renders TYPE_PIIX3_XEN_DEVICE redundant and finally remov=
es=0D
it. The motivation is to 1/ decouple PIIX from Xen and 2/ to make Xen in th=
e PC=0D
machine agnostic to the precise southbridge being used. 2/ will become=0D
particularily interesting once PIIX4 becomes usable in the PC machine, avoi=
ding=0D
the "Frankenstein" use of PIIX4_ACPI in PIIX3.=0D
=0D
v2:=0D
- xen_piix3_set_irq() is already generic. Just rename it. (Chuck)=0D
=0D
Testing done:=0D
None, because I don't know how to conduct this properly :(=0D
=0D
Based-on: <20221221170003.2929-1-shentey@gmail.com>=0D
          "[PATCH v4 00/30] Consolidate PIIX south bridges"=0D
=0D
Bernhard Beschow (6):=0D
  include/hw/xen/xen: Rename xen_piix3_set_irq() to xen_intx_set_irq()=0D
  hw/isa/piix: Reuse piix3_realize() in piix3_xen_realize()=0D
  hw/isa/piix: Wire up Xen PCI IRQ handling outside of PIIX3=0D
  hw/isa/piix: Avoid Xen-specific variant of piix_write_config()=0D
  hw/isa/piix: Resolve redundant k->config_write assignments=0D
  hw/isa/piix: Resolve redundant TYPE_PIIX3_XEN_DEVICE=0D
=0D
 hw/i386/pc_piix.c             | 34 ++++++++++++++++--=0D
 hw/i386/xen/xen-hvm.c         |  2 +-=0D
 hw/isa/piix.c                 | 66 +----------------------------------=0D
 include/hw/southbridge/piix.h |  1 -=0D
 include/hw/xen/xen.h          |  2 +-=0D
 stubs/xen-hw-stub.c           |  2 +-=0D
 6 files changed, 35 insertions(+), 72 deletions(-)=0D
=0D
-- =0D
2.39.0=0D
=0D

