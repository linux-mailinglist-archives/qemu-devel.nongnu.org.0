Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB886535C6
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:02:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83Pd-0000D9-Aj; Wed, 21 Dec 2022 13:01:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83Pb-0000BI-5C
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:01:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83PZ-0004EF-CH
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:01:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671645708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zwZZKV4vh966FCY9aZwZiz4iMzFkGPA/wXBny1Z9G4M=;
 b=hRXVPoP2p8a7D0uXFtAbjY2QHfG7QjkYjpzYr3ACUcWvS0nYdEu5e1PpibdqVjazM/KvjX
 IAQYz2lddK33j+mNfpZELxqS62G36OLRnSWWrJIhinFdWTdlGep4a0jbJUdM0kZ9eTN9ke
 lgtVnVPOiiIUloomIxb8e1ABoHazGYk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-45-ZfaEPwmMMtedN7qilFGCpQ-1; Wed, 21 Dec 2022 13:01:46 -0500
X-MC-Unique: ZfaEPwmMMtedN7qilFGCpQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 xh12-20020a170906da8c00b007413144e87fso11078438ejb.14
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:01:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zwZZKV4vh966FCY9aZwZiz4iMzFkGPA/wXBny1Z9G4M=;
 b=ZnptVcfN2UaKDdo/woV8xWJCHKZaqiaJUtI5a9UhBpu0krVm4yh9bc84M8LI0tfdJw
 AlHbyQhOH0fJW8kSeYKmwZQj8KDikHGxi7j8QPY9CqNDMNEYOobj3Vyy2b1Md30UBrZo
 qKPn4SZq0wraKeFCbl8DV0xCFFJUHUdZE8aZHwzZ+mv/568nQCJjY1yo+sHMFIuQ6Rzj
 5cS7wkZICHqic41aT3D/blBmvz67RmRnnCNol3e2sIrncAVj96PRdWzyW4/utgb0wcE1
 98Xizuf9s1aS0clsYhq5eVnIJxNLbb4P3dDjUvxa4hIRUxm4cinDmFTNITwHkcYMC7dB
 W/aw==
X-Gm-Message-State: AFqh2kqDFpOH++El4iy+1h7H+P9/7OGLGcmwY3+ebTuDjODv5uzk2uuy
 n63+YooxAtKvDmh4yjwNN8RPIgig/tTa1pJWDP12crib1gt0AgqeXQHnZG35xkL3kCyYGF8nxnd
 SdKhCQ6McxhN7JWTwoJZL2m5ZtL/WE8xazpErQ938vZzW4ShrvmBaf31R4At6HrBG9xU=
X-Received: by 2002:a17:907:d68e:b0:7c1:37:421c with SMTP id
 wf14-20020a170907d68e00b007c10037421cmr2139324ejc.32.1671645704729; 
 Wed, 21 Dec 2022 10:01:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv7U5R/SligkL5d3AAPn+92ht6t64lzc6BI9mninWJOrXvS1iEQKSacdTbZjlJfxMDktZrG0Q==
X-Received: by 2002:a17:907:d68e:b0:7c1:37:421c with SMTP id
 wf14-20020a170907d68e00b007c10037421cmr2139298ejc.32.1671645704384; 
 Wed, 21 Dec 2022 10:01:44 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 25-20020a170906309900b007c53090d511sm7423347ejv.192.2022.12.21.10.01.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:01:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/24] QEMU patches for 2022-12-21
Date: Wed, 21 Dec 2022 19:01:17 +0100
Message-Id: <20221221180141.839616-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

The following changes since commit d038d2645acabf6f52fd61baeaa021c3ebe97714:

  Merge tag 'for-upstream' of https://repo.or.cz/qemu/kevin into staging (2022-12-16 13:26:09 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 4a4c1382c8c3fe6e25c782bfda5de753ced3f6a1:

  i386: SGX: remove deprecated member of SGXInfo (2022-12-20 15:45:45 +0100)

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

 accel/meson.build               |  9 +----
 chardev/char.c                  | 33 +---------------
 configure                       | 74 +++++++++---------------------------
 docs/about/deprecated.rst       | 34 -----------------
 docs/about/removed-features.rst | 41 ++++++++++++++++++--
 docs/qdev-device-use.txt        |  4 +-
 hw/core/machine.c               |  1 +
 hw/i386/amd_iommu.c             |  2 +-
 hw/i386/intel_iommu.c           |  4 +-
 hw/i386/sgx.c                   | 15 +++-----
 hw/ide/core.c                   | 43 ++++++++++++++++-----
 hw/ide/qdev.c                   | 32 ++++++++++++++++
 include/hw/boards.h             |  1 -
 include/hw/i386/apic_internal.h |  2 +-
 include/hw/ide/internal.h       |  1 +
 include/qemu/accel.h            |  4 +-
 include/qemu/typedefs.h         |  1 +
 meson.build                     | 83 ++++++++++++++++++++--------------------
 qapi/misc-target.json           | 12 +-----
 qemu-options.hx                 | 11 +-----
 scripts/symlink-install-tree.py |  1 -
 target/i386/cpu-sysemu.c        | 15 ++++++--
 target/i386/cpu.c               |  4 +-
 tests/qapi-schema/meson.build   |  6 +--
 tests/unit/test-cutils.c        |  8 ++++
 util/cutils.c                   | 14 ++-----
 util/log.c                      | 84 ++++++++++++++++++++++++++++-------------
 27 files changed, 271 insertions(+), 268 deletions(-)
-- 
2.38.1


