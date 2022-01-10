Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BD0489BB2
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 15:59:53 +0100 (CET)
Received: from localhost ([::1]:40656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6w9I-0004u8-NE
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 09:59:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vqj-0001fX-Jp
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:40:41 -0500
Received: from [2a00:1450:4864:20::534] (port=45883
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n6vqh-0000Rq-Q4
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 09:40:41 -0500
Received: by mail-ed1-x534.google.com with SMTP id z22so9367190edd.12
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 06:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uXoVVnvK1OcVHaSGBBAu2Z6USEzqLPkW4UxgOiAK0Qw=;
 b=ZnntetWXyBFm0oetKD1VrST6VWjgwzPmQxUSYGZopIB410HIxe1VqjO0HIiWgR3gf4
 kocaXbEM6H//4visdIHe6BikutIvKLOKxrUEICHUSj3ekwaxTe4jcOH8gG32ln5A9mrL
 VX0We3BTyerKYSCqUV5XAFndXxKN9tis8g1BKynammh94xh6H8fmKdRZQRRgBfbSJIU8
 dXDJMMjDOL1NbJMV4bD2nuj88lGsEbft2mQAgc3Cbhha5i2wWq1zNI088hxjrEssaU3b
 YXQ20n8StVZy8lhD6COpvNdaGTerGuPiglWt52wb5oPA4YlUMc+t1QT/uX4zSU6PYpsU
 wQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=uXoVVnvK1OcVHaSGBBAu2Z6USEzqLPkW4UxgOiAK0Qw=;
 b=gUg4r9OvC8OZ1SEHKAu1bzuXfJED682T2UsLpik2KQZYOs/x57dw/hVkx/PG5bVyiQ
 ID209KWl2W2bsx0JSHLNTXhKpTWmC6lWHpYURDvJWGX79SRTUMxlBfzqPHMA8TCSmIT9
 7fI1qugIh4Wj0pWJ9TJJ9NiljeKPy99vqzo3VAw7NOrzUuZDFaQfqoxBbjObvOD9ihin
 s2LTVrBNWL5cFlQO3OxK37IkFCDdbVqssiRR2CrnF+QqF4lWMdpYWHrPClskd9GgviSp
 fJzx1pmK6Y1NDrK6jBI4ja74LeyMUM+Mp17s17RcqOZx4lw+ftjTJKVrplzvWZSK3hvs
 1Y1Q==
X-Gm-Message-State: AOAM533zkNmBOkYJ7TsHolEsgQbr723FsasI0nJV6j5euIQbS6Z/jL7c
 SkC6uaSsrJ8czNMusfO+GAW1uEkkQDE=
X-Google-Smtp-Source: ABdhPJzvyWZE7DgQMQpXOIKMQkt7R0dv9iw7pFb8oxw/DrxOTc+QLuyr+sjwcEfkzYqtQ6wOVUsQhA==
X-Received: by 2002:a05:6402:40d5:: with SMTP id
 z21mr76985578edb.166.1641825637107; 
 Mon, 10 Jan 2022 06:40:37 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k25sm2549498ejk.179.2022.01.10.06.40.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:40:36 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 00/18] Build system and KVM changes for 2021-12-23
Date: Mon, 10 Jan 2022 15:40:16 +0100
Message-Id: <20220110144034.67410-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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

The following changes since commit afe33262585565b64df706c62b4b0f6e0ad30c71:

  Merge tag 'pull-riscv-to-apply-20220108' of github.com:alistair23/qemu into staging (2022-01-07 22:09:24 -0800)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to fb714a07243a88c41002c23a24e174c5d9d40d57:

  meson: reenable filemonitor-inotify compilation (2022-01-09 17:45:02 +0100)

----------------------------------------------------------------
* configure and meson cleanups
* KVM_GET/SET_SREGS2 support for x86

----------------------------------------------------------------
Maxim Levitsky (1):
      KVM: use KVM_{GET|SET}_SREGS2 when supported.

Paolo Bonzini (14):
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
      configure: do not create roms/seabios/config.mak if SeaBIOS not present
      meson: build all modules by default

Philippe Mathieu-Daudé (1):
      tests/tcg: Fix target-specific Makefile variables path for user-mode

Thomas Huth (1):
      block/file-posix: Simplify the XFS_IOC_DIOINFO handling

Volker Rümelin (1):
      meson: reenable filemonitor-inotify compilation

 Makefile                                           |  11 +-
 block/file-posix.c                                 |  37 ++--
 bsd-user/{ => include}/special-errno.h             |   0
 bsd-user/meson.build                               |   2 +-
 common-user/meson.build                            |   2 +-
 configure                                          | 189 ++++-----------------
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
 meson.build                                        |  37 ++--
 pc-bios/s390-ccw/Makefile                          |   2 -
 plugins/meson.build                                |  13 +-
 scripts/make-config-poison.sh                      |  16 ++
 scripts/meson-buildoptions.py                      |  21 ++-
 scripts/meson-buildoptions.sh                      |   3 +
 target/i386/cpu.h                                  |   3 +
 target/i386/kvm/kvm.c                              | 130 ++++++++++++--
 target/i386/machine.c                              |  29 ++++
 tests/qtest/meson.build                            |   3 +-
 tests/tcg/Makefile.target                          |   2 +-
 tests/unit/meson.build                             |   2 +-
 util/meson.build                                   |   7 +-
 40 files changed, 275 insertions(+), 246 deletions(-)
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


