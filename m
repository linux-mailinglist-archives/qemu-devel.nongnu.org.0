Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D4B693C81
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:53:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pROwl-00028w-9i; Sun, 12 Feb 2023 21:52:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROwk-00028X-2S
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:52:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROwi-0006sP-2Q
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:52:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676256719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pC2ZnjMJdJjJjZ5Np3ZMrGQc2xmkYS+iq9hqw7xz0hw=;
 b=SAPXgYOwi6ROfef2OQQD8VAR55uvx7XKrh3/iPB+at7CgTi8mrwL7m9YLQ794AKEkC/a5i
 Wi0qnxFCv//89bQgKyC5vcS8h0l0RM660rofd5cdScAkpMvFH9S5tMdm+N460qQcyVfb0u
 XrkWN2+zXrp8QQX0dh9h+kcxE0XAP18=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-sg63KUa-Oq-P0z9mDn2tCw-1; Sun, 12 Feb 2023 21:51:56 -0500
X-MC-Unique: sg63KUa-Oq-P0z9mDn2tCw-1
Received: by mail-wm1-f71.google.com with SMTP id
 n7-20020a05600c3b8700b003dc55dcb298so6054906wms.8
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:51:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pC2ZnjMJdJjJjZ5Np3ZMrGQc2xmkYS+iq9hqw7xz0hw=;
 b=aWaM++DojhpLiX1PaZeaAOgcG+tI3uzGJjd9BDxr3Z2AwaZsS5Pl/DdSDGyOak/0gV
 vf/Kexmj5j/jrfyNYgGdc5j++yL+VNXoWkyr4r4vbbLdiACJoFzSYvIGpzeaPf8ECt3c
 XOHFIT+lsMstnnHh1NhujvbCqzfcpkQXNK5KzYpuHyGB1BTACe5WbMGFuqRYYPZoYrM/
 2V6ZMbNNt50zwFkfGfGkV/mAUZ8M/2zO9YWKNHTgfXaJwEGuGVZEVmYiwRqPHSJkR6SK
 Psn2zk1qmLTvgO4nu6DCu/uKJFKu0EFBDFNT7/x9ppGo87sqXWAO4C1pVDyofbuE56cq
 P6Lg==
X-Gm-Message-State: AO0yUKX8P9XO8R7rN++UVBWovw3pt5woKKCL6e1CUDYI3NqHrJ9mtbFQ
 F2bik82rzyFl/OsilEz+FfihBHb2yI43qI6mduwrwcMzT4ih1FpbyMRxt9yycu+H7W3l/GesACY
 gFzNtnFDFHaZPO7n8+HPXom3xouo9RDDcMHhVRXl+ik3CsxsTaSmS0oXT9WSAX2TxiPYMXzQ/
X-Received: by 2002:a5d:40cd:0:b0:2c5:58fb:fa8e with SMTP id
 b13-20020a5d40cd000000b002c558fbfa8emr1161480wrq.32.1676256712880; 
 Sun, 12 Feb 2023 18:51:52 -0800 (PST)
X-Google-Smtp-Source: AK7set+SBDVTC0JeY9Pojcu0wdzQt5TU/5D1VbnnqJ33QYdv5laHLc/Jy/D6TvzjDPPK0Q7UBYMB1g==
X-Received: by 2002:a5d:40cd:0:b0:2c5:58fb:fa8e with SMTP id
 b13-20020a5d40cd000000b002c558fbfa8emr1161461wrq.32.1676256712496; 
 Sun, 12 Feb 2023 18:51:52 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 i2-20020adfefc2000000b002c553e061fdsm2866896wrp.112.2023.02.12.18.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:51:51 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Li Xiaohui <xiaohli@redhat.com>
Subject: [PULL 00/22] Migration 20230213 patches
Date: Mon, 13 Feb 2023 03:51:28 +0100
Message-Id: <20230213025150.71537-1-quintela@redhat.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

The following changes since commit 3b33ae48ec28e1e0d1bc28a85c7423724bcb1a2c:

  Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2023-02-09 15:29:14 +0000)

are available in the Git repository at:

  https://gitlab.com/juan.quintela/qemu.git tags/migration-20230213-pull-request

for you to fetch changes up to 7b548761e5d084f2fc0fc4badebab227b51a8a84:

  ram: Document migration ram flags (2023-02-13 03:45:47 +0100)

----------------------------------------------------------------
Migration Pull request (take3)

Hi

In this PULL request:
- Added to leonardo fixes:
Fixes: b5eea99ec2 ("migration: Add yank feature")
Reported-by: Li Xiaohui <xiaohli@redhat.com>

Please apply.

[take 2]
- rebase to latest upstream
- fix compilation of linux-user (if have_system was missing) (me)
- cleanup multifd_load_cleanup(leonardo)
- Document RAM flags (me)

Please apply.

[take 1]
This are all the reviewed patches for migration:
- AVX512 support for xbzrle (Ling Xu)
- /dev/userfaultd support (Peter Xu)
- Improve ordering of channels (Peter Xu)
- multifd cleanups (Li Zhang)
- Remove spurious files from last merge (me)
  Rebase makes that to you
- Fix mixup between state_pending_{exact,estimate} (me)
- Cache RAM size during migration (me)
- cleanup several functions (me)

Please apply.

----------------------------------------------------------------

Juan Quintela (8):
  migration: Remove spurious files
  migration: Simplify ram_find_and_save_block()
  migration: Make find_dirty_block() return a single parameter
  migration: Split ram_bytes_total_common() in two functions
  migration: Calculate ram size once
  migration: Make ram_save_target_page() a pointer
  migration: I messed state_pending_exact/estimate
  ram: Document migration ram flags

Leonardo Bras (4):
  migration/multifd: Change multifd_load_cleanup() signature and usage
  migration/multifd: Remove unnecessary assignment on
    multifd_load_cleanup()
  migration/multifd: Join all multifd threads in order to avoid leaks
  migration/multifd: Move load_cleanup inside incoming_state_destroy

Li Zhang (2):
  multifd: cleanup the function multifd_channel_connect
  multifd: Remove some redundant code

Peter Xu (6):
  linux-headers: Update to v6.1
  util/userfaultfd: Support /dev/userfaultfd
  migration: Rework multi-channel checks on URI
  migration: Cleanup postcopy_preempt_setup()
  migration: Add a semaphore to count PONGs
  migration: Postpone postcopy preempt channel to be after main

ling xu (2):
  AVX512 support for xbzrle_encode_buffer
  Update bench-code for addressing CI problem

 .../x86_64-quintela-devices.mak               |    7 -
 .../x86_64-quintela2-devices.mak              |    6 -
 meson.build                                   |   17 +
 include/standard-headers/drm/drm_fourcc.h     |   34 +-
 include/standard-headers/linux/ethtool.h      |   63 +-
 include/standard-headers/linux/fuse.h         |    6 +-
 .../linux/input-event-codes.h                 |    1 +
 include/standard-headers/linux/virtio_blk.h   |   19 +
 linux-headers/asm-generic/hugetlb_encode.h    |   26 +-
 linux-headers/asm-generic/mman-common.h       |    2 +
 linux-headers/asm-mips/mman.h                 |    2 +
 linux-headers/asm-riscv/kvm.h                 |    4 +
 linux-headers/linux/kvm.h                     |    1 +
 linux-headers/linux/psci.h                    |   14 +
 linux-headers/linux/userfaultfd.h             |    4 +
 linux-headers/linux/vfio.h                    |  142 ++
 migration/migration.h                         |   15 +-
 migration/multifd.h                           |    3 +-
 migration/postcopy-ram.h                      |    4 +-
 migration/xbzrle.h                            |    4 +
 migration/migration.c                         |  138 +-
 migration/multifd.c                           |   87 +-
 migration/postcopy-ram.c                      |   31 +-
 migration/ram.c                               |  148 +-
 migration/savevm.c                            |   56 +-
 migration/xbzrle.c                            |  124 ++
 tests/bench/xbzrle-bench.c                    |  469 ++++++
 tests/unit/test-xbzrle.c                      |   39 +-
 util/userfaultfd.c                            |   32 +
 meson_options.txt                             |    2 +
 migration/multifd.c.orig                      | 1274 -----------------
 scripts/meson-buildoptions.sh                 |    3 +
 tests/bench/meson.build                       |    6 +
 util/trace-events                             |    1 +
 34 files changed, 1278 insertions(+), 1506 deletions(-)
 delete mode 100644 configs/devices/x86_64-softmmu/x86_64-quintela-devices.mak
 delete mode 100644 configs/devices/x86_64-softmmu/x86_64-quintela2-devices.mak
 create mode 100644 tests/bench/xbzrle-bench.c
 delete mode 100644 migration/multifd.c.orig

-- 
2.39.1


