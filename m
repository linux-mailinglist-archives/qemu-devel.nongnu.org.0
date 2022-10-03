Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 202895F3645
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 21:26:59 +0200 (CEST)
Received: from localhost ([::1]:60670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofR5c-0006kG-UK
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 15:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ofQuT-0001KK-Ah
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 15:15:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ofQuJ-0001Xp-Bj
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 15:15:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664824510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tn9AqdXf2Fs2yIlUD0Cux1P58GDXC0sz8tZggJOAgFk=;
 b=dLOU2oia0dz07yKkg/dis3pOwnEdcrHNe+uiXvo3iN2DpQFVxhvjfyCIZh3ELFh9yfWt1R
 MAP8XvsGwMWnZ+j+WrSgRxBuWf8dNCuStBbTxpJoYkAnQrRj3xltoKjmMl2Bww1NNzGjm+
 pV2HHTobRC/7hXLpXn8yOaDnEe5RfT0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-618-gaNBzPDNO4WZSZCogRE-jg-1; Mon, 03 Oct 2022 15:15:08 -0400
X-MC-Unique: gaNBzPDNO4WZSZCogRE-jg-1
Received: by mail-wm1-f69.google.com with SMTP id
 v130-20020a1cac88000000b003b56eabdf04so8573866wme.7
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 12:15:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=tn9AqdXf2Fs2yIlUD0Cux1P58GDXC0sz8tZggJOAgFk=;
 b=RRwOWh1Ny98ykPF5h8X7klxxynXslzPuUTLDvOONy3oqnFZotHqdPAgHRvg4oJg27F
 4wRgUDM4TYDCSlSqciU2Julsu9vjDoH/59ICvHBHxOZhz1vw0PLAhjR/kKknCV8nSK38
 QesU4anSafZ54Adf1od7ADCbCp+EeG+IBHemouKuS2pS5q99EHzGKMuxY1DUMSrYEi/W
 g9uMtLvD1eGVeUCUNvPAQvbKISAM5X69PnDbypKSwws4uOKGbA1crl9L0HQ9UJYQqAMZ
 nnG3KRqkdAt6eAsBteKfHyBO5xx9WzXPHc5ANVSxjn3VJtKf2csMVMs4YZf4WktCyskt
 xqnA==
X-Gm-Message-State: ACrzQf0U55J/+dQqJnfd1bag4EjfULCMCdOVAFPoingmXjenQhWLyfCM
 sZaMgkoZ/Ldsp5zvHXMb5058+vErryO9ntBQul+48fIvdLD3Ikk+250Bj8LRo8IOBxw4PoFydX4
 GRqB0E7qG4mOHeby7GHNBQCuh4x/c9gCzBXQgeMBQfnUv+BNaFZis2Rf5GEzkUHV+1mo=
X-Received: by 2002:adf:a3da:0:b0:22c:d73b:38a5 with SMTP id
 m26-20020adfa3da000000b0022cd73b38a5mr13187037wrb.541.1664824507452; 
 Mon, 03 Oct 2022 12:15:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM58KY9SfDRsHa0zCFOYCuRultPnLquaWiyhywKrbtnKAcmOw3jwQCI52La/YDQ3IERKDa9CHQ==
X-Received: by 2002:adf:a3da:0:b0:22c:d73b:38a5 with SMTP id
 m26-20020adfa3da000000b0022cd73b38a5mr13187016wrb.541.1664824506903; 
 Mon, 03 Oct 2022 12:15:06 -0700 (PDT)
Received: from avogadro.local ([66.187.232.65])
 by smtp.gmail.com with ESMTPSA id
 y25-20020a1c4b19000000b003b5054c6f87sm12375700wma.21.2022.10.03.12.15.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 12:15:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 00/15] x86 + misc changes for 2022-09-29
Date: Mon,  3 Oct 2022 21:15:03 +0200
Message-Id: <20221003191504.203181-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 99d6b11b5b44d7dd64f4cb1973184e40a4a174f8:

  Merge tag 'pull-target-arm-20220922' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-09-26 13:38:26 -0400)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to cc63374a5a7c240b7d3be734ef589dabbefc7527:

  x86: re-initialize RNG seed when selecting kernel (2022-10-01 21:16:36 +0200)

----------------------------------------------------------------
* x86: re-enable rng seeding via SetupData
* x86: reinitialize RNG seed on system reboot and after kernel load
* qboot: rebuild based on latest commit
* watchdog: remove -watchdog option
* update Meson to 0.61.5, move more configure tests

----------------------------------------------------------------
Jason A. Donenfeld (5):
      x86: return modified setup_data only if read as memory, not as file
      x86: use typedef for SetupData struct
      x86: reinitialize RNG seed on system reboot
      x86: re-enable rng seeding via SetupData
      x86: re-initialize RNG seed when selecting kernel

Paolo Bonzini (9):
      qboot: rebuild based on latest commit
      configure: do not invoke as/ld directly for pc-bios/optionrom
      watchdog: remove -watchdog option
      ui: fix path to dbus-display1.h
      meson: -display dbus and CFI are incompatible
      meson: require 0.61.3
      meson: multiple names can be passed to dependency()
      configure, meson: move C++ compiler detection to meson.build
      configure, meson: move linker flag detection to meson

Ray Zhang (1):
      target/i386/kvm: fix kvmclock_current_nsec: Assertion `time.tsc_timestamp <= migration_tsc' failed

 configure                       |  97 +++-------------------------------------
 docs/about/deprecated.rst       |   5 ---
 docs/about/removed-features.rst |   5 +++
 hw/i386/microvm.c               |   2 +-
 hw/i386/pc_piix.c               |   3 +-
 hw/i386/pc_q35.c                |   3 +-
 hw/i386/x86.c                   |  70 ++++++++++++++++++++++-------
 hw/nvram/fw_cfg.c               |  12 ++---
 hw/watchdog/sbsa_gwdt.c         |   6 ---
 hw/watchdog/watchdog.c          |  43 ------------------
 hw/watchdog/wdt_aspeed.c        |   6 ---
 hw/watchdog/wdt_diag288.c       |   6 ---
 hw/watchdog/wdt_i6300esb.c      |   6 ---
 hw/watchdog/wdt_ib700.c         |   6 ---
 hw/watchdog/wdt_imx2.c          |   6 ---
 include/hw/nvram/fw_cfg.h       |  22 +++++++++
 include/sysemu/watchdog.h       |  12 -----
 meson                           |   2 +-
 meson.build                     |  74 ++++++++++++++++++++----------
 pc-bios/optionrom/Makefile      |  12 ++---
 pc-bios/qboot.rom               | Bin 65536 -> 65536 bytes
 qemu-options.hx                 |  33 +-------------
 qga/meson.build                 |   2 +-
 scripts/main.c                  |   1 +
 softmmu/vl.c                    |  16 -------
 target/i386/kvm/kvm.c           |   2 +-
 tests/qtest/dbus-display-test.c |   2 +-
 ui/dbus.h                       |   2 +-
 28 files changed, 159 insertions(+), 297 deletions(-)
 mode change 100644 => 100755 pc-bios/qboot.rom
 create mode 100644 scripts/main.c
-- 
2.37.3


