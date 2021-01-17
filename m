Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 268FC2F94DC
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 20:29:06 +0100 (CET)
Received: from localhost ([::1]:47882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1DjU-00012C-Nf
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 14:29:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1DfS-0007aH-4Q; Sun, 17 Jan 2021 14:24:54 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1DfQ-0004xA-GL; Sun, 17 Jan 2021 14:24:53 -0500
Received: by mail-wr1-x42d.google.com with SMTP id d13so14416630wrc.13;
 Sun, 17 Jan 2021 11:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F8qCNXZtPekis67hGa+ueKXZTEHHyBdE0u5HnMX1Wj0=;
 b=aY9yoYBvccEwHQQuFjtH4qM2Egwvr5pC619dstatdykra3nnpHBvtBooP/AjZdXmim
 scMFbQZkn1G01Tq4+gTmlUzenvdMStM4pbrfvcIDnOCS/cns1RvsVEC+gav/hJO8Lxy/
 STA3bh88X1sxN19ePfyrgqmoidJIEg4kwiCCYNra1GKeyeiExGQg4VP9GjogUBYxMsGN
 vVGexD3c+sZJ3k2nJSooHeCVe4xdNr7OheX5XYZCMRXIRzAgxmUTBpB8btKFGVaqRqlH
 Vnkou7CD34IRq3wP/9fijtv+Zvl/3+1huIPieC/Sko869W8S3LBZgxitWCQqt/pBVk7p
 Seew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=F8qCNXZtPekis67hGa+ueKXZTEHHyBdE0u5HnMX1Wj0=;
 b=nDWpsSc4PVnQ0tATlvewKxSmxqFnBwbE2f1gBoHHiA8drhhOm1nN4MdjPmkZaWPEwe
 OAl0MYWLK5MeP76xjkcONwAO9O7IsXA0Km/55gxK+9I3DSDuUfTOYXdG0j8cYzeomj69
 1DriQwVPZQCcaOkh96mO1pN1yADkVIz6eY9YextGYen13RwT9ekmIHQVO5OpWgZO9c2I
 Ln4B20mwOwBYRK780HfSuk3sqaSXtsGkiRvZDrga5LIYvxnDYOw48jZ8fJGSEpur3Y47
 Q+RWEcj8bwpMFla4DZgV/y+4RWvbNTI2eP7PdKp48j9FUz2EzWoJQcMi2wrPq67yM43V
 URWg==
X-Gm-Message-State: AOAM533U+qZwB2Qx5bS4Yq5iar1EEXmWja909Xu707Uz/9bmcrW7VIhc
 9i2j27FWMVUlmB+irZy3WD8=
X-Google-Smtp-Source: ABdhPJwqdje/upgYSv+MB4kKgkx6Xo3O4sJdAzqnxt+SxFbe/F3MKmD2DPpUVh82CVSHiiYN8mukNA==
X-Received: by 2002:adf:f18a:: with SMTP id h10mr23998266wro.244.1610911490374; 
 Sun, 17 Jan 2021 11:24:50 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id u16sm13058661wrn.68.2021.01.17.11.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 11:24:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v2 00/20] hw: Mark the device with no migratable fields
Date: Sun, 17 Jan 2021 20:24:26 +0100
Message-Id: <20210117192446.23753-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Joel Stanley <joel@jms.id.au>, Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v1:=0D
- Tried to address Dave and Daniel comments=0D
- Added Peter R-b=0D
- Handle GPEX device=0D
=0D
This is a proof-of-concept after chatting with Peter Maydell=0D
on IRC last year.=0D
=0D
Introduce the vmstate_no_state_to_migrate structure, and=0D
a reference to it: vmstate_qdev_no_state_to_migrate.=0D
Use this reference in devices with no fields to migrate.=0D
=0D
This is useful to catch devices missing vmstate, such:=0D
- ads7846=0D
- mcf-uart=0D
- mcf-fec=0D
- versatile_i2c=0D
- ...=0D
=0D
v1: https://www.mail-archive.com/qemu-devel@nongnu.org/msg719788.html=0D
=0D
Philippe Mathieu-Daud=C3=A9 (20):=0D
  migration/vmstate: Restrict vmstate_dummy to user-mode=0D
  hw/core/qdev: Add vmstate_qdev_no_state_to_migrate=0D
  hw/arm/armv7m: Mark the device with no migratable fields=0D
  hw/arm/aspeed_soc: Mark the device with no migratable fields=0D
  hw/arm/bcm283x: Mark devices with no migratable fields=0D
  hw/arm/msf2-soc: Mark the device with no migratable fields=0D
  hw/core/split-irq: Mark the device with no migratable fields=0D
  hw/cpu/a9mpcore: Mark the device with no migratable fields=0D
  hw/cpu/cluster: Mark the device with no migratable fields=0D
  hw/usb/hcd-ohci: Mark the device with no migratable fields=0D
  hw/intc/arm_gicv2m: Mark the device with no migratable fields=0D
  hw/misc/armsse-cpuid: Mark the device with no migratable fields=0D
  hw/misc/iotkit-sysinfo: Mark the device with no migratable fields=0D
  hw/misc/unimp: Mark the device with no migratable fields=0D
  hw/nubus/mac-nubus-bridge: Mark the device with no migratable fields=0D
  hw/sparc64/sun4u: Mark devices with no migratable fields=0D
  hw/pci-host/gpex: Mark device with no migratable fields=0D
  hw/core/qdev: Display warning for devices missing migration state=0D
  stubs/vmstate: Add VMSTATE_END_OF_LIST to vmstate_user_mode_cpu_dummy=0D
  migration/vmstate: Simplify vmstate for user-mode CPU=0D
=0D
 configure                    | 10 ++++++++++=0D
 meson.build                  |  1 +=0D
 hw/usb/hcd-ohci.h            |  2 ++=0D
 include/hw/arm/bcm2836.h     |  5 +++--=0D
 include/hw/arm/msf2-soc.h    | 11 ++++++-----=0D
 include/hw/core/cpu.h        |  2 +-=0D
 include/hw/cpu/a9mpcore.h    |  3 ++-=0D
 include/hw/qdev-core.h       |  2 ++=0D
 include/migration/vmstate.h  |  2 +-=0D
 hw/arm/armv7m.c              |  1 +=0D
 hw/arm/aspeed_soc.c          |  1 +=0D
 hw/arm/bcm2835_peripherals.c |  1 +=0D
 hw/arm/bcm2836.c             |  1 +=0D
 hw/arm/msf2-soc.c            |  1 +=0D
 hw/core/qdev.c               |  8 ++++++++=0D
 hw/core/split-irq.c          |  1 +=0D
 hw/cpu/a9mpcore.c            |  1 +=0D
 hw/cpu/cluster.c             |  1 +=0D
 hw/intc/arm_gicv2m.c         |  2 ++=0D
 hw/misc/armsse-cpuid.c       |  1 +=0D
 hw/misc/iotkit-sysinfo.c     |  1 +=0D
 hw/misc/unimp.c              |  1 +=0D
 hw/nubus/mac-nubus-bridge.c  |  1 +=0D
 hw/pci-host/gpex.c           |  1 +=0D
 hw/sparc64/sun4u.c           |  6 +++++-=0D
 hw/usb/hcd-ohci.c            |  1 +=0D
 migration/vmstate.c          |  7 +++++++=0D
 stubs/vmstate.c              |  7 ++++++-=0D
 28 files changed, 70 insertions(+), 12 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

