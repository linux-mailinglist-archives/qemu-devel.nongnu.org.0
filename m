Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 859CF4D165D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:38:44 +0100 (CET)
Received: from localhost ([::1]:33802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRYAt-0002Da-JY
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:38:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7A-0007cH-6o
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:34:52 -0500
Received: from [2a00:1450:4864:20::62d] (port=45697
 helo=mail-ej1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY78-0005ly-IU
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:34:51 -0500
Received: by mail-ej1-x62d.google.com with SMTP id qa43so38456206ejc.12
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2ExdvAzwpz1xkY6r2jK1+uxylJQMv881Sv4O/zaOhOI=;
 b=L7EPYSdF0w5WsPrRTIACnbwrrvYDW1ZEVHLh4do0MWDpPV8qobiVnbwKgh76+Lii/B
 ez6Qxp6TFTMNN6ON57efCJkXN6OfDerbnC0MoYjX+jMAGLQ4syZdNpenWcDEJsDtQIUo
 Q/wHQhff9BMx//X5JVk1cXuxM1JUV0f7o0U+D2y6Gk04SP5TkaPjgETHjKxs+Vve1Yyl
 A3I+50TVOsCF/ybvQP0eG2RszoAqebSGw72DjfeIZ7vnbeI6lwWfhTUc+o0u6qDw4dVI
 Rrk386u9E8OrKQNa4QwQabhDdIcija/yIXk4/MuuzNIuCJYPuSuJ0K6DHe4DTXdPJ07/
 9/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=2ExdvAzwpz1xkY6r2jK1+uxylJQMv881Sv4O/zaOhOI=;
 b=GCi/t94HO4/H/NBj/AVK/BI830AAqSTjlHpaKuUAkatKCtiplu+CDqycdqX+Shlxd9
 F06mPRpxFKYxYERMR7vIL1yWyBfS0T2cT7HhLEcNC7pw0qqCB6E6U7JLsPUoQX8rN5n2
 /myQMYne2qonFZkZFCdn/tgVYvSK/LiURkFVZkpW7aT5/GDBtwzdI6fnYC258f4yFAdf
 A03dhzs0IH0w3bP6sTMAbJ/0O8TSP5y3CenFYujNpqzzhWVrUPgORdmDEmfjJBGxo/PL
 LvohTvtQkdrIzMuyGvhrwCtpMCWUAXHu6Qu0v8NAzx9+kR/dwZ8x+31aScvKrsXmR8IO
 PM5Q==
X-Gm-Message-State: AOAM533M1DL9WyyefjIfsBNbsfedcQxQYH3cclrLOSj4wmYMTxgMmyfM
 dAzvc4LP3uWWPjAUiOFP+Wv4qe7+5pg=
X-Google-Smtp-Source: ABdhPJwr61XGdPJ4spkw5HAZd7g1GnuaAbf1BWP4mz9V02wmUeqHTtf6GO8taOFgaOnBOZiQMrNqyQ==
X-Received: by 2002:a17:907:8a21:b0:6d9:b0a:70c1 with SMTP id
 sc33-20020a1709078a2100b006d90b0a70c1mr12467413ejc.351.1646739288954; 
 Tue, 08 Mar 2022 03:34:48 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l2-20020aa7cac2000000b003f9b3ac68d6sm7491868edt.15.2022.03.08.03.34.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:34:48 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/22] QEMU changes for 7.0 soft freeze
Date: Tue,  8 Mar 2022 12:34:23 +0100
Message-Id: <20220308113445.859669-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
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

for you to fetch changes up to d722beb6ac1d457bfa3d7dd5bce7bcea5ea45540:

  gitlab-ci: do not run tests with address sanitizer (2022-03-08 12:34:12 +0100)

----------------------------------------------------------------
* whpx fixes in preparation for GDB support (Ivan)
* VSS header fixes (Marc-André)
* 5-level EPT support (Vitaly)
* AMX support (Jing Liu & Yang Zhong)
* Bundle changes to MSI routes (Longpeng)
* More precise emulation of #SS (Gareth)
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

Paolo Bonzini (4):
      update meson-buildoptions.sh
      target/i386: only include bits in pg_mode if they are not ignored
      linux-headers: include missing changes from 5.17
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
 26 files changed, 449 insertions(+), 84 deletions(-)
-- 
2.35.1


