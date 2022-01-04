Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 961A4484413
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 16:02:47 +0100 (CET)
Received: from localhost ([::1]:39374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4lKo-0001fR-MG
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 10:02:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n4lGC-0006p2-UL
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:58:01 -0500
Received: from [2a00:1450:4864:20::531] (port=45731
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n4lGB-0004PK-0C
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:58:00 -0500
Received: by mail-ed1-x531.google.com with SMTP id j6so149435343edw.12
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 06:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I27wBkrvErk0SZk4+ho4+cLDk6/gTORqQ9WBE8KvQjY=;
 b=aQAPJGwq/f5KUU9hQ7+5e3P2lbr6yrJFF+mjXB2/wG5emZUaBLxPtaAJoLQmjim+SE
 fUnqqRUGmHCH7R1R4c2LlguSidLtD/8kEnJstaihIhjkG1S6X1jeWs2Mq4073OKCloKE
 xIUXhhpYveNcNWKpl5Ggq7AUUGYcZB2p1pz7qeDW/tmfrG573Jm43l1ZX6p+ehbZKtpt
 9j5ecsGvH1dcLhmkbTgTL/hJxvm7U2LKUW7rA9Dwn4t1LbESrQye81xbBxPL1lAVC57z
 lsKvUEwFI83tbLzqloaPStGnZkTTRC8OMKFYY/ZvXRfmpxyBMZEMj8Djl1ZveIO7jYwv
 PNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=I27wBkrvErk0SZk4+ho4+cLDk6/gTORqQ9WBE8KvQjY=;
 b=WtlkpcPVt0BVbwUgLl95FtJQKcipoTJiL8Wl954RoBEHJDA+fv61/yzSNyrfkSh8r/
 UYhawM9zuXrmupwiCuhc4w4v7uF3wLIYJDhk653Q0mV6CETo3pYHXD2f17a5DP86AARi
 0tSelMakhyb798mDYd2ys76IAv9GMreyqsPmj6yEDbn4IE5wuS1HjnbfjdTA72Dg4aUu
 eMrsy/BFN6n3g7siJ4We/rEO3nesawXXjrqcDFJoYypmER7kOaQpR74X1dqVOP3waHgc
 2oB9BUfs4QYsp5xKoe8d6FcOWIAiRh7rbEfSjxxzSwS5OaTXhPDlvFfu0rUptDZAdCfj
 pk2Q==
X-Gm-Message-State: AOAM533AW4HxWP50ratbsjsX7mIzCVOCBPD/hPWvP+r0ckTueLCRes1v
 W2b1Ji+7NGI+TvLVnqoKuBkorhKbDQw=
X-Google-Smtp-Source: ABdhPJynk9tcEEM0AN3f/7juB2FkQRHrGALUEeWP4WRVBlvfVKYdG6c4jk+qYzyV3ycqcifqXEoRDQ==
X-Received: by 2002:a05:6402:390:: with SMTP id
 o16mr47608194edv.78.1641308277207; 
 Tue, 04 Jan 2022 06:57:57 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id j21sm11475964ejj.133.2022.01.04.06.57.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 06:57:56 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 00/15] Build system and KVM changes for 2021-12-23
Date: Tue,  4 Jan 2022 15:57:34 +0100
Message-Id: <20220104145749.417387-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The following changes since commit b5a3d8bc9146ba22a25116cb748c97341bf99737:

  Merge tag 'pull-misc-20220103' of https://gitlab.com/rth7680/qemu into staging (2022-01-03 09:34:41 -0800)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to a2c137e7e00d1bfcc80a17ff8e5104d0e1de2f9a:

  tests/tcg: Fix target-specific Makefile variables path for user-mode (2022-01-04 14:08:44 +0100)

----------------------------------------------------------------
* configure and meson cleanups
* KVM_GET/SET_SREGS2 support for x86

----------------------------------------------------------------

I dropped the tricore Dockerfile change because it is still broken occasionally
with the patch.

Maxim Levitsky (1):
      KVM: use KVM_{GET|SET}_SREGS2 when supported.

Paolo Bonzini (12):
      meson: reuse common_user_inc when building files specific to user-mode emulators
      user: move common-user includes to a subdirectory of {bsd,linux}-user/
      meson: cleanup common-user/ build
      configure: simplify creation of plugin symbol list
      configure: do not set bsd_user/linux_user early
      configure, makefile: remove traces of really old files
      configure: parse --enable/--disable-strip automatically, flip default
      configure: move non-command-line variables away from command-line parsing section
      meson: build contrib/ executables after generated headers
      configure, meson: move config-poison.h to meson
      meson: add comments in the target-specific flags section
      KVM: x86: ignore interrupt_bitmap field of KVM_GET/SET_SREGS

Philippe Mathieu-Daudé (1):
      tests/tcg: Fix target-specific Makefile variables path for user-mode

Thomas Huth (1):
      block/file-posix: Simplify the XFS_IOC_DIOINFO handling

 Makefile                                           |  11 +-
 block/file-posix.c                                 |  37 ++---
 bsd-user/{ => include}/special-errno.h             |   0
 bsd-user/meson.build                               |   2 +-
 common-user/meson.build                            |   2 +-
 configure                                          | 182 +++------------------
 contrib/elf2dmp/meson.build                        |   2 +-
 contrib/ivshmem-client/meson.build                 |   2 +-
 contrib/ivshmem-server/meson.build                 |   2 +-
 contrib/rdmacm-mux/meson.build                     |   2 +-
 .../{ => include}/host/aarch64/host-signal.h       |   0
 linux-user/{ => include}/host/alpha/host-signal.h  |   0
 linux-user/{ => include}/host/arm/host-signal.h    |   0
 linux-user/{ => include}/host/i386/host-signal.h   |   0
 .../{ => include}/host/loongarch64/host-signal.h   |   0
 linux-user/{ => include}/host/mips/host-signal.h   |   0
 linux-user/{ => include}/host/ppc/host-signal.h    |   0
 linux-user/{ => include}/host/ppc64/host-signal.h  |   0
 linux-user/{ => include}/host/riscv/host-signal.h  |   0
 linux-user/{ => include}/host/s390/host-signal.h   |   0
 linux-user/{ => include}/host/s390x/host-signal.h  |   0
 linux-user/{ => include}/host/sparc/host-signal.h  |   0
 .../{ => include}/host/sparc64/host-signal.h       |   0
 linux-user/{ => include}/host/x32/host-signal.h    |   0
 linux-user/{ => include}/host/x86_64/host-signal.h |   0
 linux-user/{ => include}/special-errno.h           |   0
 linux-user/meson.build                             |   4 +-
 meson.build                                        |  33 ++--
 pc-bios/s390-ccw/Makefile                          |   2 -
 plugins/meson.build                                |  11 +-
 scripts/make-config-poison.sh                      |  16 ++
 scripts/meson-buildoptions.py                      |  21 ++-
 scripts/meson-buildoptions.sh                      |   3 +
 target/i386/cpu.h                                  |   3 +
 target/i386/kvm/kvm.c                              | 130 +++++++++++++--
 target/i386/machine.c                              |  29 ++++
 tests/tcg/Makefile.target                          |   2 +-
 37 files changed, 259 insertions(+), 237 deletions(-)
 rename bsd-user/{ => include}/special-errno.h (100%)
 rename linux-user/{ => include}/host/aarch64/host-signal.h (100%)
 rename linux-user/{ => include}/host/alpha/host-signal.h (100%)
 rename linux-user/{ => include}/host/arm/host-signal.h (100%)
 rename linux-user/{ => include}/host/i386/host-signal.h (100%)
 rename linux-user/{ => include}/host/loongarch64/host-signal.h (100%)
 rename linux-user/{ => include}/host/mips/host-signal.h (100%)
 rename linux-user/{ => include}/host/ppc/host-signal.h (100%)
 rename linux-user/{ => include}/host/ppc64/host-signal.h (100%)
 rename linux-user/{ => include}/host/riscv/host-signal.h (100%)
 rename linux-user/{ => include}/host/s390/host-signal.h (100%)
 rename linux-user/{ => include}/host/s390x/host-signal.h (100%)
 rename linux-user/{ => include}/host/sparc/host-signal.h (100%)
 rename linux-user/{ => include}/host/sparc64/host-signal.h (100%)
 rename linux-user/{ => include}/host/x32/host-signal.h (100%)
 rename linux-user/{ => include}/host/x86_64/host-signal.h (100%)
 rename linux-user/{ => include}/special-errno.h (100%)
 create mode 100755 scripts/make-config-poison.sh
-- 
2.33.1


