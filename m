Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EAE6F249A
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 14:18:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psjVR-000683-7S; Sat, 29 Apr 2023 08:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVO-00067P-H6
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:16:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVL-0004sH-PF
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:16:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682770602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HcUu4zwfbldXP9pH93lYOyRM100uvR+mqw+PoELkKcU=;
 b=CGKn9b6OQRSlH8vaVHsCL6EmUr1pYr/Kb9Mq2iC8E06kyilPV+AYCJq9z/kFt4EMKikgch
 edYUhJTRKf2o6sOwHlAO0eQ8o4uJqe7TAqS+3yElik/gZriCADzNlBMRPTuwo4V0RehuO/
 Hrq65gELTw5bVMTsv9m/Ye4rPxQMhjU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-b5yKV3l3POmSn7rGq3Iv5Q-1; Sat, 29 Apr 2023 08:16:40 -0400
X-MC-Unique: b5yKV3l3POmSn7rGq3Iv5Q-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-94f5a1fa123so105581566b.0
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 05:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682770598; x=1685362598;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HcUu4zwfbldXP9pH93lYOyRM100uvR+mqw+PoELkKcU=;
 b=UltrufG8cr5JhiPhO02xydtcnzn1ZYIMvBBNRU8xzTZmQp4HftCpxA2/4nayQwla5C
 JRr9HVKu2TW4TEa+DUh5Elh52TVOcc43un3f4NXjEOeXmojAtxcineGsPbz+9L/RO6Rc
 7daBEAp4IfUQ8opvjPozPkjrIxRxe0iGsFg3W+wtOnO/7CpyMgliN3EryF4ERoJRC8CU
 KQe65bt5nYDP2nYgVnVVr+leUvvK3e6ON7GzsdP1PcaeoMlIEEI+WVypsEJIrf8wpPsu
 u/IGkE1j2wz6a4zfpZxQAwIZcorlxTCoFay2mfiMrmBMhvjP84djbXRL3SyZehVj9dzB
 bVNA==
X-Gm-Message-State: AC+VfDxz6HxpKutuVfSVR20ycumocxKAo+IgVM6nh/YCEWWESOAGomlm
 tLbPhFhPc9qCCoAw5f0e63qcf9y/NKhFsKkXeYyb1WFcHJxkn9E9xWWlK7tfsiwKpxB5cMS6UID
 b1WafBRDPNfp+ftZx06DFe/GjWx9IO1LUZ3nrpb/pZNqwC/1a1iYVnmAm6jCTZUrnkHa969U8Dc
 E=
X-Received: by 2002:a17:906:dac8:b0:94e:ff98:44a7 with SMTP id
 xi8-20020a170906dac800b0094eff9844a7mr7416684ejb.72.1682770598741; 
 Sat, 29 Apr 2023 05:16:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5mCzQZqxIkIUKT4mSEVWoHSutKXXH3y9pwhUzdZ1LeAbz21af8pV3FxQHOCtqqzRjt98CkPw==
X-Received: by 2002:a17:906:dac8:b0:94e:ff98:44a7 with SMTP id
 xi8-20020a170906dac800b0094eff9844a7mr7416675ejb.72.1682770598377; 
 Sat, 29 Apr 2023 05:16:38 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 vh7-20020a170907d38700b0094f31208918sm12292953ejc.108.2023.04.29.05.16.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Apr 2023 05:16:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/17] Misc patches for 2023-04-29
Date: Sat, 29 Apr 2023 14:16:19 +0200
Message-Id: <20230429121636.230934-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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

The following changes since commit 05d50ba2d4668d43a835c5a502efdec9b92646e6:

  Merge tag 'migration-20230427-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-04-28 08:35:06 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to f40288a1f22acbf0ff6b08c192fa993e4af935ef:

  cpus-common: stop using mb_set/mb_read (2023-04-28 15:56:42 +0200)

----------------------------------------------------------------
* Fix compilation issues under Debian 10
* Update kernel headers to 6.3rc5
* Suppress GCC13 false positive in aio_bh_poll()
* Add new x86 feature bits
* Coverity fixes
* More steps towards removing qatomic_mb_set/read
* Fix reduced-phys-bits value for AMD SEV

----------------------------------------------------------------
Cédric Le Goater (1):
      async: Suppress GCC13 false positive in aio_bh_poll()

David 'Digit' Turner (3):
      Fix libvhost-user.c compilation.
      update-linux-headers.sh: Add missing kernel headers.
      Update linux headers to v6.3rc5

Jiaxi Chen (6):
      target/i386: Add support for CMPCCXADD in CPUID enumeration
      target/i386: Add support for AMX-FP16 in CPUID enumeration
      target/i386: Add support for AVX-IFMA in CPUID enumeration
      target/i386: Add support for AVX-VNNI-INT8 in CPUID enumeration
      target/i386: Add support for AVX-NE-CONVERT in CPUID enumeration
      target/i386: Add support for PREFETCHIT0/1 in CPUID enumeration

Paolo Bonzini (3):
      tests: vhost-user-test: release mutex on protocol violation
      target/hexagon: fix = vs. == mishap
      cpus-common: stop using mb_set/mb_read

Tom Lendacky (4):
      qapi, i386/sev: Change the reduced-phys-bits value from 5 to 1
      qemu-options.hx: Update the reduced-phys-bits documentation
      i386/sev: Update checks and information related to reduced-phys-bits
      i386/cpu: Update how the EBX register of CPUID 0x8000001F is set

 cpus-common.c                                |   4 +-
 include/standard-headers/drm/drm_fourcc.h    |  12 +++
 include/standard-headers/linux/ethtool.h     |  48 ++++++++++-
 include/standard-headers/linux/fuse.h        |  45 ++++++++++-
 include/standard-headers/linux/pci_regs.h    |   1 +
 include/standard-headers/linux/vhost_types.h |   2 +
 include/standard-headers/linux/virtio_blk.h  | 105 ++++++++++++++++++++++++
 linux-headers/asm-arm64/kvm.h                |   1 +
 linux-headers/asm-x86/kvm.h                  |  34 +++++++-
 linux-headers/linux/const.h                  |  36 +++++++++
 linux-headers/linux/kvm.h                    |   9 +++
 linux-headers/linux/memfd.h                  |  39 +++++++++
 linux-headers/linux/nvme_ioctl.h             | 114 +++++++++++++++++++++++++++
 linux-headers/linux/stddef.h                 |  47 +++++++++++
 linux-headers/linux/vfio.h                   |  15 ++--
 linux-headers/linux/vhost.h                  |   8 ++
 qapi/misc-target.json                        |   2 +-
 qemu-options.hx                              |   4 +-
 scripts/update-linux-headers.sh              |   4 +-
 subprojects/libvhost-user/libvhost-user.c    |   6 ++
 target/hexagon/idef-parser/parser-helpers.c  |   2 +-
 target/i386/cpu.c                            |  30 +++++--
 target/i386/cpu.h                            |  14 ++++
 target/i386/sev.c                            |  17 +++-
 tests/qtest/vhost-user-test.c                |   3 +-
 util/async.c                                 |  14 ++++
 26 files changed, 589 insertions(+), 27 deletions(-)
 create mode 100644 linux-headers/linux/const.h
 create mode 100644 linux-headers/linux/memfd.h
 create mode 100644 linux-headers/linux/nvme_ioctl.h
 create mode 100644 linux-headers/linux/stddef.h
-- 
2.40.0


