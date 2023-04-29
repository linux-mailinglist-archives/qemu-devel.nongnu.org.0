Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B89296F24A0
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 14:20:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psjZ5-0008V4-0n; Sat, 29 Apr 2023 08:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjZ3-0008Uf-Ac
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:20:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjZ0-0005j1-WF
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:20:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682770830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7M9kcMKCqJw4//KMdFA+1tyrhURtsj0e/HkHySEkkV4=;
 b=Ep48JU9vv+snAaf8Pib8gmYoIHZG/Nmv5MADQ/Mqn7uwL28hKTX+/aYNUh5JckiwUUxCfd
 OYvt/nq/OJOwWY9RbVTYcKRKdw4O8tT6GSbsJQk3e4TutjvEHOY9dR3H+Wed7zwyoS9W5f
 AU7ZjzNOgeI7O0701nhTX4AylotYScQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-1sEKiU_BMVCUtbGRJcsbEw-1; Sat, 29 Apr 2023 08:20:27 -0400
X-MC-Unique: 1sEKiU_BMVCUtbGRJcsbEw-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-506e62603f6so645276a12.2
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 05:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682770826; x=1685362826;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7M9kcMKCqJw4//KMdFA+1tyrhURtsj0e/HkHySEkkV4=;
 b=JWsb5kGceWEp+joY6pd7Nf9/e2Xie94trje5vDpDCPMzwebaDggURk1t1XXkA6rl7I
 UM7WpPPPeex2N5vp8aWyfpP6yOkRX0hgBIaA35W2BHI1lHmDmJaeoGP8WDdPwVrXd4GX
 XutbK5SHmV9y4Qi7lk1Xkr+X85P7JHDFpw8EPA9RKJfA0Nb0XFiu6l89KX/dlmDaex4V
 Mc+xQ92UxKkOEEnaqynFjUnKwulo/DdP9hywwgnWCenDb4SaHz549Lbc/9H3xEUp8kES
 uS037n5kh9V5nd9/Jj06jh7kK1+vM4D4GsemYIcWS9ipy0VsA2kIwqeqWZWJcxZbqTEI
 elVg==
X-Gm-Message-State: AC+VfDzEX1ulllDZ4nMwb0avH/tUFQcLYlI2zqt87Z17KPDknxrXJKSF
 inqvMBSOchTD1IUdm4THYbwg2TKniLfFIiWvEKt9+OHSj0QrDcIiBQOPwcl1J8iCEhsCmFHlsgn
 ypsaKJhfzf3Jk/gogi5xHlIa8bSewi1iwe4qw7FQv8ikDtRoOItOTnffokB3a+lZuynn7WxbjlQ
 Y=
X-Received: by 2002:a17:907:318b:b0:94f:61b2:c990 with SMTP id
 xe11-20020a170907318b00b0094f61b2c990mr8451164ejb.25.1682770826279; 
 Sat, 29 Apr 2023 05:20:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4x0UhyjO17aWofVzgxNSaSGOJfYkeEHshb6VwBtRRaG1KHB+mDcIQMaCg9JWLfNau8MUMh9A==
X-Received: by 2002:a17:907:318b:b0:94f:61b2:c990 with SMTP id
 xe11-20020a170907318b00b0094f61b2c990mr8451141ejb.25.1682770825816; 
 Sat, 29 Apr 2023 05:20:25 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a17090624c600b0095707b7dd04sm11434241ejb.42.2023.04.29.05.20.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Apr 2023 05:20:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/16] Misc patches for 2023-04-29
Date: Sat, 29 Apr 2023 14:20:24 +0200
Message-Id: <20230429122024.231495-1-pbonzini@redhat.com>
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

for you to fetch changes up to 42abcc584174166342297421209932a87bdb85f1:

  cpus-common: stop using mb_set/mb_read (2023-04-29 14:19:01 +0200)

v1->v2: drop hexagon patch

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

Paolo Bonzini (2):
      tests: vhost-user-test: release mutex on protocol violation
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
 target/i386/cpu.c                            |  30 +++++--
 target/i386/cpu.h                            |  14 ++++
 target/i386/sev.c                            |  17 +++-
 tests/qtest/vhost-user-test.c                |   3 +-
 util/async.c                                 |  14 ++++
 25 files changed, 588 insertions(+), 26 deletions(-)
 create mode 100644 linux-headers/linux/const.h
 create mode 100644 linux-headers/linux/memfd.h
 create mode 100644 linux-headers/linux/nvme_ioctl.h
 create mode 100644 linux-headers/linux/stddef.h
-- 
2.40.0


