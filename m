Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5928660F08
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 14:23:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE99U-0005U9-Q7; Sat, 07 Jan 2023 08:22:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pE99G-0005Rh-3G
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 08:22:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pE99C-0000jk-OJ
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 08:22:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673097723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LqypaqZ2MKvMpn5Y369SVx/AAZD6zDs3O/l3ofKfcwA=;
 b=iAwhpVPcSoMxn2+2AozkyUyoPcoP8R4W1i/Lr8DWR0zmACGmvnfL8mn3j3eCdfGfGjKYUN
 jk5PB0NG+iT4OpWlwl9yDBF7//PbXlxQvvT3SZVLm4CKpItWWZrl1mjYqcKAYmn3/p2ZSh
 G5Devnfmof/SbPDJlK87SX9CCtA9IDs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-572-t1H0RW_0MKqzUewfK1WRaQ-1; Sat, 07 Jan 2023 08:21:59 -0500
X-MC-Unique: t1H0RW_0MKqzUewfK1WRaQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 fm17-20020a05600c0c1100b003d96f0a7f2eso4251268wmb.6
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 05:21:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LqypaqZ2MKvMpn5Y369SVx/AAZD6zDs3O/l3ofKfcwA=;
 b=BshBoOc93uVUbe1b5d4MxuV6BmuuOSsKEHwH6b734c8soYcMYAcQaSsh1xuV7casbL
 1U64sJef0bOJTPRcUCjunR4QUGrbgQnkcxcMcT8BCuSJ34sfjVtBYBaS2m9HqGqRnjLW
 qe8FrTpsKmCRFUsPJJhS76S+L4yO6dKCAV87SGFOGh2yhTELdNHnHYW30pyxb/KUHv9O
 fN3ZRO7k1M/ZFeb5jEIpsafhC51gu0NfARiM6OrtxLhPboGhIyGD0polUBpRk3y0r0qW
 B9exE+9riLzYZvT1+cpB/NY+3KglTqpnb63lFDvQewWwn5niXFjvi5Y2iJkizfr/3dDZ
 PbWw==
X-Gm-Message-State: AFqh2kqB9m6vvjRtlgIn9Dek3BgdtB/KMx3IBFXusun6lO5rW3P5VkSd
 Pprz286McKxBdgMjlw0fLQ3kpo8mJKrUInYzUlss0HLeb3kCQYH5w1T9PCbHzbEVTrdypvHkk4d
 +u2QFvm8g8kIVMyQemlQvo1JatneqJw+dlyYOVV93arf6tCMnDWTimLyiHQq7P+GRzms=
X-Received: by 2002:adf:d4d2:0:b0:2ba:c30a:fa51 with SMTP id
 w18-20020adfd4d2000000b002bac30afa51mr3767830wrk.34.1673097718336; 
 Sat, 07 Jan 2023 05:21:58 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv10wFazC0xDOqdHtNQ7hniYNxqjKlkdEfBdeeZARfQC0jKr7LGA/9rV/KJlS06eMzUvv1YHQ==
X-Received: by 2002:adf:d4d2:0:b0:2ba:c30a:fa51 with SMTP id
 w18-20020adfd4d2000000b002bac30afa51mr3767814wrk.34.1673097717854; 
 Sat, 07 Jan 2023 05:21:57 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a056000008a00b002683695bf97sm3821632wrx.58.2023.01.07.05.21.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 05:21:57 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/24] QEMU patches for 2022-12-21
Date: Sat,  7 Jan 2023 14:21:52 +0100
Message-Id: <20230107132153.108680-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
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
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

The following changes since commit d1852caab131ea898134fdcea8c14bc2ee75fbe9:

  Merge tag 'python-pull-request' of https://gitlab.com/jsnow/qemu into staging (2023-01-05 16:59:22 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to fb418b51b7b43c34873f4b9af3da7031b7452115:

  i386: SGX: remove deprecated member of SGXInfo (2023-01-06 00:51:02 +0100)

----------------------------------------------------------------
* Atomic memslot updates for KVM (Emanuele, David)
* Always send errors to logfile when daemonized (Greg)
* Add support for IDE CompactFlash card (Lubomir)
* First round of build system cleanups (myself)
* First round of feature removals (myself)
* Reduce "qemu/accel.h" inclusion (Philippe)

----------------------------------------------------------------
Greg Kurz (1):
      util/log: Always send errors to logfile when daemonized

Kai Huang (1):
      target/i386: Add SGX aex-notify and EDECCSSA support

Lubomir Rintel (2):
      ide: Add 8-bit data mode
      ide: Add "ide-cf" driver, a CompactFlash card

Paolo Bonzini (18):
      util/log: do not close and reopen log files when flags are turned off
      configure: remove useless write_c_skeleton
      configure: remove dead function
      configure: cleanup $cpu tests
      configure: preserve qemu-ga variables
      configure: remove backwards-compatibility and obsolete options
      meson: tweak hardening options for Windows
      meson: cleanup dummy-cpus.c rules
      tests/qapi-schema: remove Meson workaround
      configure: test all warnings
      meson: support meson 0.64 -Doptimization=plain
      meson: cleanup compiler detection
      meson: accept relative symlinks in "meson introspect --installed" data
      docs: do not talk about past removal as happening in the future
      KVM: remove support for kernel-irqchip=off
      util: remove support for hex numbers with a scaling suffix
      util: remove support -chardev tty and -chardev parport
      i386: SGX: remove deprecated member of SGXInfo

Philippe Mathieu-Daudé (2):
      typedefs: Forward-declare AccelState
      hw: Reduce "qemu/accel.h" inclusion

 accel/meson.build                               |  9 +--
 chardev/char.c                                  | 33 +---------
 configure                                       | 74 ++++++----------------
 docs/about/deprecated.rst                       | 34 ----------
 docs/about/removed-features.rst                 | 41 +++++++++++-
 docs/qdev-device-use.txt                        |  4 +-
 hw/core/machine.c                               |  1 +
 hw/i386/amd_iommu.c                             |  2 +-
 hw/i386/intel_iommu.c                           |  4 +-
 hw/i386/sgx.c                                   | 15 ++---
 hw/ide/core.c                                   | 43 ++++++++++---
 hw/ide/qdev.c                                   | 32 ++++++++++
 include/hw/boards.h                             |  1 -
 include/hw/i386/apic_internal.h                 |  2 +-
 include/hw/ide/internal.h                       |  1 +
 include/qemu/accel.h                            |  4 +-
 include/qemu/typedefs.h                         |  1 +
 meson.build                                     | 83 ++++++++++++------------
 qapi/misc-target.json                           | 12 +---
 qemu-options.hx                                 | 11 +---
 scripts/ci/org.centos/stream/8/x86_64/configure |  2 +-
 scripts/symlink-install-tree.py                 |  1 -
 target/i386/cpu-sysemu.c                        | 15 +++--
 target/i386/cpu.c                               |  4 +-
 tests/qapi-schema/meson.build                   |  6 +-
 tests/unit/test-cutils.c                        |  8 +++
 util/cutils.c                                   | 14 +----
 util/log.c                                      | 84 +++++++++++++++++--------
 28 files changed, 272 insertions(+), 269 deletions(-)
-- 
2.38.1


