Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1761F65B76D
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 22:37:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCST8-0008Er-IG; Mon, 02 Jan 2023 16:35:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pCST7-0008DD-Bt
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 16:35:41 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pCST5-000593-NI
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 16:35:41 -0500
Received: by mail-ej1-x636.google.com with SMTP id kw15so69155220ejc.10
 for <qemu-devel@nongnu.org>; Mon, 02 Jan 2023 13:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ThcfWkzyxbomQpjRZA7dc6wiEsJYQ4EhFUJkZuMYNh4=;
 b=l3DiR+ii5Hfw71WDsiNsQdM2zwr5EVsEEAGGOTU6ym+YOnTFgyDMg9p3kAGMFm2Uf/
 aQS0jZyQnqxtYSMIPattFYbm1mdsvpSJ/GGsEEd5HhYrEEeJ6+2Fu38VF4NsSG6Y21lK
 AHtxfwQOcsVklKIdAlVyxuFr1pmDQodVdZJhWtiAToFJemLAUAaz3oFSXvJAQTBCumzf
 fXIh9eI0mnzZ2IHGNbfvZOC7FxHI11aH6DYlMAaKv7fdbr/Awo02oZHlRFHMG503UjCZ
 k9Rxs77JgBKr5BTE3jl29v3+IbSrFZHhEs8IwI6z+tCMLssBEMwiOSRQih7t0fPjl1kG
 WoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ThcfWkzyxbomQpjRZA7dc6wiEsJYQ4EhFUJkZuMYNh4=;
 b=eAlGTIRl591ALl+QhMRhsKikrmIoP0/K/fbX0BfhpnXMIGLI6+oNPAYXaaWILKwmqp
 naz96mxvk1kjzPxRA8Dg7pLB0057Vi3fKaeCOCeBgEz/le7L8aBgXDAHT0lSdVLFtz6H
 s34gFKDcyXkTmkzvPm+BPOINWd9yC6TusY0XU1AiihbBDCgQNmfkJU377zOaKnYDeSVj
 j9gqOQ5Xb+ofdv03DZ+CpDrd3HaerfIf9v4c8sEk8FZcknfhsff0whT7wNrvgmuQmeoO
 YPAG37maBXLbJhAwvXnsBTAkquUyPhrC0eDtKY2QsnSG4EaIPK4KSs8zKQUudA+je+jp
 W7rA==
X-Gm-Message-State: AFqh2kq4g6SRqV/hE3IXBI833fsM+XtHH7xtX6WVv0RNO8HNeKoNgB3N
 t2nJBW9PicWP8H3Y0uSptu5IeP++7qQ=
X-Google-Smtp-Source: AMrXdXurMjYiz5Hum/Tzox9GBdNJ4/Pvd6hcKQmZX141+8/hdih4/lbxpie9ZEO4sSmtCYEFcdoKug==
X-Received: by 2002:a17:907:3ea1:b0:7c1:7f84:10ac with SMTP id
 hs33-20020a1709073ea100b007c17f8410acmr61151091ejc.33.1672695338100; 
 Mon, 02 Jan 2023 13:35:38 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a17090631cb00b0084c465709b7sm10583826ejf.74.2023.01.02.13.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 13:35:37 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 0/6] Resolve TYPE_PIIX3_XEN_DEVICE
Date: Mon,  2 Jan 2023 22:34:58 +0100
Message-Id: <20230102213504.14646-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x636.google.com
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
Testing done:=0D
None, because I don't know how to conduct this properly :(=0D
=0D
Based-on: <20221221170003.2929-1-shentey@gmail.com>=0D
          "[PATCH v4 00/30] Consolidate PIIX south bridges"=0D
=0D
Bernhard Beschow (6):=0D
  include/hw/xen/xen: Make xen_piix3_set_irq() generic and rename it=0D
  hw/isa/piix: Reuse piix3_realize() in piix3_xen_realize()=0D
  hw/isa/piix: Wire up Xen PCI IRQ handling outside of PIIX3=0D
  hw/isa/piix: Avoid Xen-specific variant of piix_write_config()=0D
  hw/isa/piix: Resolve redundant k->config_write assignments=0D
  hw/isa/piix: Resolve redundant TYPE_PIIX3_XEN_DEVICE=0D
=0D
 hw/i386/pc_piix.c             | 34 ++++++++++++++++--=0D
 hw/i386/xen/xen-hvm.c         |  9 +++--=0D
 hw/isa/piix.c                 | 66 +----------------------------------=0D
 include/hw/southbridge/piix.h |  1 -=0D
 include/hw/xen/xen.h          |  2 +-=0D
 stubs/xen-hw-stub.c           |  2 +-=0D
 6 files changed, 40 insertions(+), 74 deletions(-)=0D
=0D
-- =0D
2.39.0=0D
=0D

