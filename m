Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9805F074D
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 11:13:34 +0200 (CEST)
Received: from localhost ([::1]:45508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeC5N-0000KR-OV
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 05:13:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oeC2i-0004MY-JZ
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 05:10:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oeC2c-0003pq-7H
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 05:10:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664529040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=T0jgP09LfpSzBXKjiZg8fAIgz6hPSXhw+ukZL04fLwU=;
 b=LsglMs6nyKYHan/EUHx67eDLoUmpFvDH4HL1bWXUZ+keGmNNvEeHgp56tljlQ9tSVuc0Jw
 dNtNXfE8x1NtvlAVyN/IcZ+0wdURZfiqsXAmq5gCWlElirmFK2aWUsI1rAxihE8YSvZI6a
 qqMmnIHdlMj0aRA719xDJdqT6+NBWiE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-519-V7XSulx2OU-lU3ZzsU2Euw-1; Fri, 30 Sep 2022 05:10:38 -0400
X-MC-Unique: V7XSulx2OU-lU3ZzsU2Euw-1
Received: by mail-ej1-f71.google.com with SMTP id
 hq17-20020a1709073f1100b00782f9d252f4so1602784ejc.11
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 02:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=T0jgP09LfpSzBXKjiZg8fAIgz6hPSXhw+ukZL04fLwU=;
 b=ibUCMvqMori+MeW9dga5/SV/FjoliVtqyvWMpDSjJT3+9BGMe0+3x13vVjBgKcVd32
 w7ECKYIzlYxHvVEjgyLznpwIF8WyRj8VJgby3Az8AMDsvF3fvEsXfLypdEE0kM22chfo
 eqN503e1hQ5d0Cea2jIAlzq9RLbQAmPgLxwmSyvhD6ajdKe9ONCGPj64p7zMwtZ6qLSi
 M+LDBhglFHcptjwfICcRxQPzGDwCad1sFywhNza5ol345yzj7YqQFP+cE1aknlZBwYGs
 8EbItHtw1iQZwWW+KIr25joYnc6hB+v3wLNIXv7O2+P58V+9qTKbopIHY6JuhYQuxGcl
 JnGQ==
X-Gm-Message-State: ACrzQf16dv8tvZeeQzswgEp3pjMNjTpsepRzmmE0OAO2W+R/Wov+G3Hf
 0UcPqDF9DfU9IIhcrxkxHPpXrXUvLM6+qBYw1U/1aKd9vkaYcp6YGtWJT2SxYHDCC6Y4Po1zwa2
 RQDmfsBDOG732ZSZCbeTmjp8fdjLEImEw+9OP5zyQEnBOq2QmFw5c1kuD+wib+ygilvw=
X-Received: by 2002:a17:907:6d89:b0:783:5465:908 with SMTP id
 sb9-20020a1709076d8900b0078354650908mr6104541ejc.26.1664529036753; 
 Fri, 30 Sep 2022 02:10:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5r9h/uz2KbHq3f1wAMzzoP+G4Ev8FkN2MsP2fseQmKGGxof9YxeoNbU6kkLHf2SNmkIOqJuA==
X-Received: by 2002:a17:907:6d89:b0:783:5465:908 with SMTP id
 sb9-20020a1709076d8900b0078354650908mr6104518ejc.26.1664529036283; 
 Fri, 30 Sep 2022 02:10:36 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 cw11-20020a056402228b00b0044657ecfbb5sm1351007edb.13.2022.09.30.02.10.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 02:10:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/15] x86 + misc changes for 2022-09-29
Date: Fri, 30 Sep 2022 11:10:32 +0200
Message-Id: <20220930091033.34379-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

for you to fetch changes up to 2ddea14f66caa3cb0986ff66ce66b9faeeb54f0b:

  x86: re-initialize RNG seed when selecting kernel (2022-09-30 09:53:58 +0200)

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

v1->v2:
$ git range-diff origin/master 1750b7328bd0cf98875df189e9664980db07c692 2ddea14f66caa3cb0986ff66ce66b9faeeb54f0b
 1:  e935b73508 =  1:  e935b73508 x86: return modified setup_data only if read as memory, not as file
 2:  eebb38a563 =  2:  eebb38a563 x86: use typedef for SetupData struct
 3:  763a2828bf =  3:  763a2828bf x86: reinitialize RNG seed on system reboot
 4:  ffe2d2382e =  4:  ffe2d2382e x86: re-enable rng seeding via SetupData
 5:  2fc7eb6897 =  5:  2fc7eb6897 qboot: rebuild based on latest commit
 6:  7089977a24 =  6:  7089977a24 configure: do not invoke as/ld directly for pc-bios/optionrom
 7:  5433af7697 =  7:  5433af7697 watchdog: remove -watchdog option
 8:  0e902f59c1 =  8:  0e902f59c1 ui: fix path to dbus-display1.h
 -:  ---------- >  9:  3b18f4492f meson: -display dbus and CFI are incompatible
 9:  4518e4db3d ! 10:  6099673423 meson: require 0.61.3
    @@ meson.build: endif
     -  .require(enable_modules,
     -           error_message: '-display dbus requires --enable-modules') \
        .require(gdbus_codegen.found(),
    -            error_message: '-display dbus requires gdbus-codegen') \
    +            error_message: gdbus_codegen_error.format('-display dbus')) \
        .require(opengl.found() and gbm.found(),
     
      ## qga/meson.build ##
10:  b7c7a36331 = 11:  d8bc336bfe meson: multiple names can be passed to dependency()
11:  0aaf08e2f1 = 12:  c35cc0a23a configure, meson: move C++ compiler detection to meson.build
12:  48c5c87318 = 13:  5d9c2dca2b configure, meson: move linker flag detection to meson
13:  aec4f65878 = 14:  57095542b7 target/i386/kvm: fix kvmclock_current_nsec: Assertion `time.tsc_timestamp <= migration_tsc' failed
14:  1750b7328b = 15:  2ddea14f66 x86: re-initialize RNG seed when selecting kernel


