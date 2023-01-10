Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E45664639
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 17:36:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFH62-0003Bc-VE; Tue, 10 Jan 2023 11:03:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5X-0002xw-PR
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5V-000506-R2
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:02:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673366577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=o8VkzGSDqIFT4ezOaSOmMtenUavesd23RZesPhReEq0=;
 b=TjWqFpLppbwqSA3vBemHkZRJuomlCAZh0niDE3QNB+1nc7J0P6FeMOS/w1kVl0crbeSqyH
 K6UV7s9wY6AlKXTd0dwH5OHlc7LkbwamcvjpYGw2+G8+r49RTk9oV9mI3QKwbRcXYruJAS
 MgETWXfi5t02UhOubx9xVvqOZ6QpAxE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-231-nGnw5kbuN3ecqhsTTzJb3w-1; Tue, 10 Jan 2023 11:02:41 -0500
X-MC-Unique: nGnw5kbuN3ecqhsTTzJb3w-1
Received: by mail-wm1-f72.google.com with SMTP id
 c66-20020a1c3545000000b003d355c13229so9217769wma.0
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:02:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o8VkzGSDqIFT4ezOaSOmMtenUavesd23RZesPhReEq0=;
 b=j6GP6+8NBp1aCJ+lbh7evqydhlb00EjVBQwJoQqM/J8fMXoKK7XTN8qtpi0wUd4vGv
 Yz/hHiR9GeuaHy+Zq3gzUHv9SdTtNC8OIrarBNd1zPU3w0Rxsqxd2dsPlPtAjhoRctoB
 UbaBsdspaPmDiuh904+A8KjMawn25AJiFxxf+iGn9WZEgCLxz7C6Y3WdKVFv9Tqe5cTV
 6glIKlvKoCn5cRuj88JW/L9up1yLaNTolxdD5JkLcASo4gbmWLShBV6x1GCgtwRcpqAd
 keNnRYaSLaWiPYGX7wVJN2Vl55gumA+kNf9fV00QuJKWg6VOJYB74HE/GaTnp7ip7h0S
 1r3w==
X-Gm-Message-State: AFqh2koYhTf/9OVIJUeButgRC3uQRuh2sJGzZl5CG+NZxLkqQbt3RKNR
 Bnrx6yHSrnOV6s5SYmKUGAB936/oo7FQELvJeN2J7n1H12k5Q5ybvHCnSEAaWBT2aaDi/BgkPSk
 J6V/H5XeYXgTNTGk2QX8YI8T+ZF02qX5RkorhOcwnc1WWg7W5cSKKbRBrZ+9Y57NaA8c=
X-Received: by 2002:a05:600c:b92:b0:3d9:779e:9788 with SMTP id
 fl18-20020a05600c0b9200b003d9779e9788mr40947420wmb.37.1673366556308; 
 Tue, 10 Jan 2023 08:02:36 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs5UXx1pS3B9xVQecN8JFQLdxRCLkL3EERVVqFmg8fdaQYGKQ5M6J9tY7Gwjr6dOWFCrBhd4g==
X-Received: by 2002:a05:600c:b92:b0:3d9:779e:9788 with SMTP id
 fl18-20020a05600c0b9200b003d9779e9788mr40947377wmb.37.1673366555877; 
 Tue, 10 Jan 2023 08:02:35 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a05600c3b9700b003cf71b1f66csm17687033wms.0.2023.01.10.08.02.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:02:35 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/29] Misc patches for 2023-01-10
Date: Tue, 10 Jan 2023 17:02:04 +0100
Message-Id: <20230110160233.339771-1-pbonzini@redhat.com>
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

The following changes since commit 3d83b78285d6e96636130f7d449fd02e2d4deee0:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2023-01-08 14:27:40 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to cd78f1d264c1ac7dfd7fa50abce0dec71a1f41ac:

  configure: remove backwards-compatibility code (2023-01-09 16:54:56 +0100)

----------------------------------------------------------------
* Atomic memslot updates for KVM (Emanuele, David)
* libvhost-user/libvduse warnings fixes (Marcel)
* i386 TCG fixes (Joe, myself)
* Remove compilation errors when -Werror=maybe-uninitialized (Eric)
* fix GLIB_VERSION for cross-compilation (Paolo)

----------------------------------------------------------------
Daniel P. Berrangé (8):
      gitlab: remove redundant setting of PKG_CONFIG_PATH
      disas: add G_GNUC_PRINTF to gstring_printf
      hw/xen: use G_GNUC_PRINTF/SCANF for various functions
      tools/virtiofsd: add G_GNUC_PRINTF for logging functions
      util/error: add G_GNUC_PRINTF for various functions
      tests: add G_GNUC_PRINTF for various functions
      enforce use of G_GNUC_PRINTF attributes
      hw/display: avoid creating empty loadable modules

David Hildenbrand (1):
      kvm: Atomic memslot updates

Emanuele Giuseppe Esposito (2):
      accel: introduce accelerator blocker API
      KVM: keep track of running ioctls

Eric Auger (1):
      target/i386: Remove compilation errors when -Werror=maybe-uninitialized

Joe Richey (1):
      i386: Emit correct error code for 64-bit IDT entry

Marcel Holtmann (12):
      libvhost-user: Provide _GNU_SOURCE when compiling outside of QEMU
      libvhost-user: Replace typeof with __typeof__
      libvhost-user: Cast rc variable to avoid compiler warning
      libvhost-user: Use unsigned int i for some for-loop iterations
      libvhost-user: Declare uffdio_register early to make it C90 compliant
      libvhost-user: Change dev->postcopy_ufd assignment to make it C90 compliant
      libvduse: Provide _GNU_SOURCE when compiling outside of QEMU
      libvduse: Switch to unsigned int for inuse field in struct VduseVirtq
      libvduse: Fix assignment in vring_set_avail_event
      libvhost-user: Fix assignment in vring_set_avail_event
      libvhost-user: Add extra compiler warnings
      libvduse: Add extra compiler warnings

Paolo Bonzini (4):
      configure: fix GLIB_VERSION for cross-compilation
      chardev: clean up chardev-parallel.c
      target/i386: fix operand size of unary SSE operations
      configure: remove backwards-compatibility code

 .gitlab-ci.d/crossbuild-template.yml      |   9 +-
 accel/accel-blocker.c                     | 154 ++++++++++++++++++++++++++++++
 accel/kvm/kvm-all.c                       | 108 ++++++++++++++++++---
 accel/meson.build                         |   2 +-
 chardev/char-parallel.c                   |  15 +--
 chardev/meson.build                       |   5 +-
 configure                                 |  14 +--
 disas.c                                   |   3 +-
 hw/core/cpu-common.c                      |   2 +
 hw/display/meson.build                    |  20 ++--
 hw/xen/xen-bus.c                          |   1 +
 hw/xen/xen_pvdev.c                        |   1 +
 include/hw/core/cpu.h                     |   3 +
 include/hw/xen/xen-bus-helper.h           |   6 +-
 include/hw/xen/xen-bus.h                  |   3 +-
 include/qemu/osdep.h                      |   5 -
 include/sysemu/accel-blocker.h            |  56 +++++++++++
 include/sysemu/kvm_int.h                  |   8 ++
 subprojects/libvduse/libvduse.c           |   9 +-
 subprojects/libvduse/meson.build          |   8 +-
 subprojects/libvhost-user/libvhost-user.c |  36 ++++---
 subprojects/libvhost-user/meson.build     |   8 +-
 target/i386/ops_sse.h                     |   4 +-
 target/i386/tcg/decode-new.c.inc          |  11 ++-
 target/i386/tcg/seg_helper.c              |   8 +-
 tests/qtest/ahci-test.c                   |   3 +
 tests/qtest/arm-cpu-features.c            |   1 +
 tests/qtest/erst-test.c                   |   2 +-
 tests/qtest/ide-test.c                    |   3 +-
 tests/qtest/ivshmem-test.c                |   4 +-
 tests/qtest/libqmp.c                      |   2 +-
 tests/qtest/libqos/libqos-pc.h            |   6 +-
 tests/qtest/libqos/libqos-spapr.h         |   6 +-
 tests/qtest/libqos/libqos.h               |   6 +-
 tests/qtest/libqos/virtio-9p.c            |   1 +
 tests/qtest/migration-helpers.h           |   1 +
 tests/qtest/rtas-test.c                   |   2 +-
 tests/qtest/usb-hcd-uhci-test.c           |   4 +-
 tests/unit/test-qmp-cmds.c                |  13 ++-
 tools/virtiofsd/fuse_log.c                |   1 +
 tools/virtiofsd/fuse_log.h                |   6 +-
 tools/virtiofsd/passthrough_ll.c          |   1 +
 util/error-report.c                       |   1 +
 util/error.c                              |   1 +
 util/meson.build                          |   2 +-
 45 files changed, 454 insertions(+), 111 deletions(-)
 create mode 100644 accel/accel-blocker.c
 create mode 100644 include/sysemu/accel-blocker.h
-- 
2.38.1


