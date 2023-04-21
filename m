Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7736EA736
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:38:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppn8x-00083y-8Q; Fri, 21 Apr 2023 05:33:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn8u-00081u-Jd
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn8s-00030s-Bo
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682069601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=c8a1UIjdCHh3WGvt2VkXWlfJzbxCEPGqQGf49faMT50=;
 b=AEfytqD/9UWHcp03OHPO9aSQ8lCEWJ1qfCkhFpmIseVlwLIsXd7Fk8ey9Gx00S2E+zQj7K
 57HWBQFwgCnN0911DmYsNksS5Lr88GoLTeDlQ105uJbk3aJrxC9VurPAkIha3Oq4E0rg3Y
 VxuYAy9gTz+pQnonx+gQakg7hNGwFqc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-U7QPIGjnPB-TW0DQlXZPSg-1; Fri, 21 Apr 2023 05:33:19 -0400
X-MC-Unique: U7QPIGjnPB-TW0DQlXZPSg-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-50692ecb3c5so1612829a12.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 02:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682069598; x=1684661598;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c8a1UIjdCHh3WGvt2VkXWlfJzbxCEPGqQGf49faMT50=;
 b=lwBsFWQODIJIOWg/JLW6i9j8enNNqbnftRKKwBY6DU86xJpMx9MJTZCH+2Hd9r3Z/7
 K9x0AN4HdK1XbIqcOZC+l2qLwrR+7bSAc/qSkomt9VJikywv8uCY7yNzICVVdB1rzuMc
 +1hSh5UrXLvj8DWEzeNJQO2ncIPsoK3+hVt6g5fPbAJUEcXkdBudmSamlzfmJLCWB51s
 N34eHArjYWjPgk4rduOK5uR86JkLZv/BaXxrrlbGiW0gbXnjrujXxRyA05G7rIUcquUA
 ZIvqkQZ+bkCxhu+lHvzuvl7OWxOgGFrvatoJxy2Xab/442dzylIlgRnf1pRa0wuLI7Le
 Lx2A==
X-Gm-Message-State: AAQBX9dcHyP3MtB3+RWhGKudfxroOQ9VCAFobaNKWarefkZ3VJYxN25I
 HeBQlmdYzeUHx4bDZCxWJ77f5iE89w7xCZpEAXPlWvGsEN32yso9E472wTW2yc8er4Zgotsogsd
 udaGRNfZY3cTDKGFVkKxsg5GkggbQtpWOi115ObNLtikPRnRXB0unsHBgWqJ5eqs/DbPtHq1EwF
 ejsw==
X-Received: by 2002:aa7:dace:0:b0:4fb:78a0:eabe with SMTP id
 x14-20020aa7dace000000b004fb78a0eabemr4107313eds.14.1682069597788; 
 Fri, 21 Apr 2023 02:33:17 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zkru/csJe4+156C7agxnArVsDU2WhDV+Qu4hxhqD3AE5PL9XcHe0VeI9A5psAA764IP05kLw==
X-Received: by 2002:aa7:dace:0:b0:4fb:78a0:eabe with SMTP id
 x14-20020aa7dace000000b004fb78a0eabemr4107298eds.14.1682069597319; 
 Fri, 21 Apr 2023 02:33:17 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 j19-20020a17090686d300b0094f109a5b3asm1834118ejy.135.2023.04.21.02.33.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 02:33:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/25] First batch of misc patches for QEMU 8.1
Date: Fri, 21 Apr 2023 11:32:51 +0200
Message-Id: <20230421093316.17941-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit 2d82c32b2ceaca3dc3da5e36e10976f34bfcb598:

  Open 8.1 development tree (2023-04-20 10:05:25 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 5f9efbbcf6fc77e583254389124437d981ad76b9:

  tests: lcitool: Switch to OpenSUSE Leap 15.4 (2023-04-20 11:17:36 +0200)

----------------------------------------------------------------
* Optional use of Meson wrap for slirp
* Coverity fixes
* Avoid -Werror=maybe-uninitialized
* Mark coroutine QMP command functions as coroutine_fn
* Mark functions that suspend as coroutine_mixed_fn
* target/i386: Fix SGX CPUID leaf
* First batch of qatomic_mb_read() removal
* Small atomic.rst improvement
* NBD cleanup
* Update libvirt-ci submodule

----------------------------------------------------------------
Akihiko Odaki (1):
      configure: Avoid -Werror=maybe-uninitialized

Marc-André Lureau (3):
      mtest2make.py: teach suite name that are just "PROJECT"
      build-sys: prevent meson from downloading wrapped subprojects
      build-sys: add slirp.wrap

Paolo Bonzini (16):
      nvme: remove constant argument to tracepoint
      vnc: avoid underflow when accessing user-provided address
      tests: bios-tables-test: replace memset with initializer
      lasi: fix RTC migration
      coverity: update COMPONENTS.md
      target/mips: tcg: detect out-of-bounds accesses to cpu_gpr and cpu_gpr_hi
      qapi-gen: mark coroutine QMP command functions as coroutine_fn
      io: mark mixed functions that can suspend
      migration: mark mixed functions that can suspend
      monitor: mark mixed functions that can suspend
      block-backend: remove qatomic_mb_read()
      postcopy-ram: do not use qatomic_mb_read
      qemu-coroutine: remove qatomic_mb_read()
      docs: explain effect of smp_read_barrier_depends() on modern architectures
      nbd: a BlockExport always has a BlockBackend
      coverity: unify Fedora dockerfiles

Peter Krempa (2):
      tests: libvirt-ci: Update to commit '2fa24dce8bc'
      tests: lcitool: Switch to OpenSUSE Leap 15.4

Peter Maydell (2):
      target/i386: Avoid unreachable variable declaration in mmu_translate()
      configure: Honour cross-prefix when finding ObjC compiler

Yang Zhong (1):
      target/i386: Change wrong XFRM value in SGX CPUID leaf

 .gitignore                                         |   2 +
 block/block-backend.c                              |   4 +-
 configure                                          |  40 ++--
 docs/devel/atomics.rst                             |  11 +-
 hw/misc/lasi.c                                     |   4 +-
 hw/nvme/ctrl.c                                     |   4 +-
 hw/nvme/trace-events                               |   2 +-
 include/hw/misc/lasi.h                             |   3 +-
 include/io/channel.h                               |  78 +++----
 include/migration/qemu-file-types.h                |   4 +-
 include/qapi/qmp/dispatch.h                        |   4 +-
 io/channel.c                                       |  78 +++----
 migration/postcopy-ram.c                           |   2 +-
 migration/qemu-file.c                              |  14 +-
 migration/qemu-file.h                              |   6 +-
 nbd/server.c                                       |  14 +-
 qapi/qmp-dispatch.c                                |   4 +-
 scripts/coverity-scan/COMPONENTS.md                |  11 +-
 scripts/coverity-scan/coverity-scan.docker         | 250 ++++++++++++---------
 scripts/mtest2make.py                              |   9 +-
 scripts/qapi/commands.py                           |  33 ++-
 subprojects/slirp.wrap                             |   6 +
 target/i386/cpu.c                                  |   4 +-
 target/i386/tcg/sysemu/excp_helper.c               |   2 +-
 target/mips/tcg/translate.c                        |   4 +
 tests/docker/dockerfiles/centos8.docker            |   1 -
 tests/docker/dockerfiles/debian-amd64-cross.docker |   4 +-
 tests/docker/dockerfiles/debian-arm64-cross.docker |   4 +-
 tests/docker/dockerfiles/debian-armel-cross.docker |   4 +-
 tests/docker/dockerfiles/debian-armhf-cross.docker |   4 +-
 .../dockerfiles/debian-mips64el-cross.docker       |   4 +-
 .../docker/dockerfiles/debian-mipsel-cross.docker  |   4 +-
 .../docker/dockerfiles/debian-ppc64el-cross.docker |   4 +-
 tests/docker/dockerfiles/debian-s390x-cross.docker |   4 +-
 tests/docker/dockerfiles/fedora-win32-cross.docker |   5 +-
 tests/docker/dockerfiles/fedora-win64-cross.docker |   5 +-
 tests/docker/dockerfiles/fedora.docker             |   5 +-
 tests/docker/dockerfiles/opensuse-leap.docker      |   5 +-
 tests/lcitool/libvirt-ci                           |   2 +-
 tests/lcitool/mappings.yml                         |  36 +--
 tests/lcitool/refresh                              |   2 +-
 ...{opensuse-leap-153.yml => opensuse-leap-15.yml} |   0
 tests/qtest/bios-tables-test.c                     | 123 ++++------
 ui/vnc.c                                           |   2 +-
 util/qemu-coroutine.c                              |  10 +-
 45 files changed, 425 insertions(+), 396 deletions(-)
 create mode 100644 subprojects/slirp.wrap
 rename tests/lcitool/targets/{opensuse-leap-153.yml => opensuse-leap-15.yml} (100%)
-- 
2.40.0


