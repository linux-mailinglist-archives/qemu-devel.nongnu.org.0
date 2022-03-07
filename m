Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 292EC4D0680
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:27:14 +0100 (CET)
Received: from localhost ([::1]:42978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRI4f-0005Q4-81
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:27:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHuk-0001Fv-Pw
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:58 -0500
Received: from [2a00:1450:4864:20::52f] (port=39719
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHud-0005LQ-Am
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:58 -0500
Received: by mail-ed1-x52f.google.com with SMTP id g20so21168234edw.6
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 10:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yPgNYPabYfPrHmgiaz6aRfRJ5aajKfBWZckrLxCJgUQ=;
 b=V26rOgN1WYT+BDEUgLv1cfbPAp9TdWkHAvD9RBdFVIUOpFcGUmfWWjnt7P3VvVIlMy
 8j8V+oQG/LFgPBJ7CwMYScr9eW1XwYQ3yiYKLEmqgbwjfVUT+wr1ZUR02tXUeHu2+fmW
 7t1MK+O0Sp0qj3aSxP74qQDniqFmKzN4Up1aTaNxZRhB1aWmasz1IqCrN2mBk8g00Rfm
 BMZgbj1iM4GPvZojbGyHvXL9+NuXp/1kY8i4k/Na/1XHb3IBlAVkYFmYE+nJ7dHm0xYD
 IasypkxHwKJal87AMCdY8ZJRVx3zSsDt3N2WHod5KrD3LTBKTagey/RNvj+yBjA7Byl/
 awJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=yPgNYPabYfPrHmgiaz6aRfRJ5aajKfBWZckrLxCJgUQ=;
 b=liMuIaqOzZakD4zPAUPZuMI3uXQhLY49yukCfwS0GK27PEvqerUrAb7hM2b2QF018Y
 HznXpGSjZHy4SS0BPIDVN9E8B8ZVlKJRLc0i2UWQfIah3pEJADfpMKAaAcM2c0SC9TRQ
 zZ8VvinaO8KW3F+b/O5TH3O5EbyckxZxYgPUPtIt5dYWIakedGBHvs6tsLXy5NSwyQxC
 QV0V+A+MCFTpV6UoxAFOOOFaKADQ0/3tjMHkweSYy65tz63nGZgKYyP1/Mq1ArpVSzhl
 AwZ0cY/d7IvtXVgGpbiHMCqXOVGxHoYY53J5+yHfZ18wS51EhGXJ6tDwfPIMrlwPuVkj
 /11A==
X-Gm-Message-State: AOAM533X0HqHErT0WVoWUKeAAcTSzPExysexV5b809vw718K4cocJWtE
 WC0R/U3oHh48J7Dar2sbeKZ7gz/1mLk=
X-Google-Smtp-Source: ABdhPJxNVdCMMmpzwLcPMEQmkntnV5zvPmOIFFc7NmMN1z9pPIe7B6ahvYKZnQH7fdeUtqh9TBjptg==
X-Received: by 2002:a05:6402:1cc1:b0:413:2cfb:b6ca with SMTP id
 ds1-20020a0564021cc100b004132cfbb6camr12275864edb.265.1646676995541; 
 Mon, 07 Mar 2022 10:16:35 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a170906304800b006cdf8a1e146sm4983382ejd.217.2022.03.07.10.16.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 10:16:35 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/23] QEMU changes for 7.0 soft freeze
Date: Mon,  7 Mar 2022 19:16:10 +0100
Message-Id: <20220307181633.596898-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 99c53410bc9d50e556f565b0960673cccb566452:

  Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2022-02-28' into staging (2022-03-01 13:25:54 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to d170dbb84f8ed8f8c9daa359d6d95cd02fd959b7:

  gitlab-ci: do not run tests with address sanitizer (2022-03-07 17:41:51 +0100)

----------------------------------------------------------------
* whpx fixes in preparation for GDB support (Ivan)
* VSS header fixes (Marc-André)
* 5-level EPT support (Vitaly)
* AMX support (Jing Liu & Yang Zhong)
* Bundle changes to MSI routes (Longpeng)
* More precise emulation of #SS (Gareth)
* Disable TAP output for check-block
* Disable ASAN testing
----------------------------------------------------------------

Gareth Webb (1):
      target/i386: Throw a #SS when loading a non-canonical IST

Ivan Shcherbakov (2):
      whpx: Fixed reporting of the CPU context to GDB for 64-bit
      whpx: Fixed incorrect CR8/TPR synchronization

Jing Liu (5):
      x86: Fix the 64-byte boundary enumeration for extended state
      x86: Add AMX XTILECFG and XTILEDATA components
      x86: Add XFD faulting bit for state components
      x86: Add AMX CPUIDs enumeration
      x86: add support for KVM_CAP_XSAVE2 and AMX state migration

Longpeng (Mike) (2):
      kvm-irqchip: introduce new API to support route change
      kvm/msi: do explicit commit when adding msi routes

Marc-André Lureau (3):
      meson: fix generic location of vss headers
      qga/vss-win32: check old VSS SDK headers
      qga/vss: update informative message about MinGW

Maxim Levitsky (1):
      KVM: SVM: always set MSR_AMD64_TSC_RATIO to default value

Paolo Bonzini (5):
      update meson-buildoptions.sh
      target/i386: only include bits in pg_mode if they are not ignored
      linux-headers: include missing changes from 5.17
      check-block: revert TAP output and reintroduce -makecheck
      gitlab-ci: do not run tests with address sanitizer

Vitaly Kuznetsov (2):
      vmxcap: Add 5-level EPT bit
      i386: Add Icelake-Server-v6 CPU model with 5-level EPT support

Yang Zhong (1):
      x86: Grant AMX permission for guest

Zeng Guang (1):
      x86: Support XFD and AMX xsave data migration

 .gitlab-ci.d/buildtest.yml           |   2 -
 accel/kvm/kvm-all.c                  |   7 +-
 accel/stubs/kvm-stub.c               |   2 +-
 hw/misc/ivshmem.c                    |   5 +-
 hw/vfio/pci.c                        |   5 +-
 hw/virtio/virtio-pci.c               |   4 +-
 include/sysemu/kvm.h                 |  23 ++++++-
 linux-headers/asm-x86/kvm.h          |   3 +
 linux-headers/linux/kvm.h            |   4 ++
 meson.build                          |   5 +-
 qga/meson.build                      |   2 +-
 qga/vss-win32/install.cpp            |   4 ++
 qga/vss-win32/provider.cpp           |   4 ++
 qga/vss-win32/vss-common.h           |   3 +-
 scripts/kvm/vmxcap                   |   1 +
 scripts/meson-buildoptions.sh        |   2 +-
 target/i386/cpu.c                    |  84 +++++++++++++++++++++--
 target/i386/cpu.h                    |  43 +++++++++++-
 target/i386/kvm/kvm-cpu.c            |  11 +--
 target/i386/kvm/kvm.c                | 125 ++++++++++++++++++++++++++++++-----
 target/i386/kvm/kvm_i386.h           |   1 +
 target/i386/machine.c                |  46 +++++++++++++
 target/i386/tcg/seg_helper.c         |  49 +++++++++++++-
 target/i386/tcg/sysemu/excp_helper.c |  40 +----------
 target/i386/whpx/whpx-all.c          |  30 ++++++++-
 target/i386/xsave_helper.c           |  28 ++++++++
 tests/check-block.sh                 |   6 +-
 tests/qemu-iotests/check             |   6 +-
 tests/qemu-iotests/meson.build       |   1 -
 tests/qemu-iotests/testenv.py        |  30 ++++-----
 tests/qemu-iotests/testrunner.py     |  54 +++++++--------
 31 files changed, 494 insertions(+), 136 deletions(-)
-- 
2.34.1


