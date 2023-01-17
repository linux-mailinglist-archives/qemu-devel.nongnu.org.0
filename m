Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80633670B4F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 23:10:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHu94-0008SC-M5; Tue, 17 Jan 2023 17:09:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu91-0008Rc-4e
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:09:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pHu8u-0007Vq-CV
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:09:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673993359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UUZ7IEP5pSFh5nYIza/rLynfjhFPN7xM5Betoe1MaDQ=;
 b=Z8gaQCpfoT/d2oeOBiN8HIAqakIGwuSgdT4exQF2h2PmZvGKwfz/N7h3fY4+GavcI9kKUB
 8Emam9NkTfnGHW/SGilrb94i5KDAwogazfymacyBp/cdsb/anxqBT/pMpvNEgNUP7h3x20
 hmkiWE+5Y85Jb1L0VJ0cknAdPcPcDM8=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-20-59T7dgVlPFWpv2aeXS48Lw-1; Tue, 17 Jan 2023 17:09:18 -0500
X-MC-Unique: 59T7dgVlPFWpv2aeXS48Lw-1
Received: by mail-vk1-f200.google.com with SMTP id
 r23-20020a1f2b17000000b003b89463c349so9730319vkr.0
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 14:09:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UUZ7IEP5pSFh5nYIza/rLynfjhFPN7xM5Betoe1MaDQ=;
 b=jLR1VIhXP5t9c8RDq0TIcMX4khhklA/Wxvtqj8yTYQsvoofmM1w0JEmELR4rsKMvhT
 ru4yAu3ZYE5QT65kmgMrS+daNA7Ejd1CTQGp1EFiG2wegethEYkYFTp24dbcYGxMmwzV
 jlPnBFo3Mc+lRVc7nI/QOvV8b19RbMH9rY37XO7HHRpYYV1h+0IxX60aFRXhjPnvQMRl
 n9DlKiE0fwIrfX2rabCRp1tKFckRZz6Ymh+9mYbFydh4cuprxa4tVKarluDJnp60AriS
 iudyOpAEvEMuB/fBBKG+bYEo9RXanPsPms/GiC2HwcayOCqXO/0w+/k9FYpRNdyh98tb
 O5Lg==
X-Gm-Message-State: AFqh2krAhlajjSZzN+53hQb2ExNc6mkx/isnbcbBr2quFdonEr76dqSe
 fPgOz5PZVR2I62Vek0Si5rLm5mycx7V47liv7T7dal+1gZunScSD18iSZ81JkcLLmImZMmP4ZGN
 Yt1Ob4g9tQitqn9DkVJt1a4Hj4+2YLeC/F8cFWsUMLJOaKCgIYI1ioECtUWz9ouxf
X-Received: by 2002:a05:6102:d8c:b0:3b5:3eaa:bb0c with SMTP id
 d12-20020a0561020d8c00b003b53eaabb0cmr3334234vst.0.1673993357001; 
 Tue, 17 Jan 2023 14:09:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt61d7edwu1Cd7yyWJItNGb1Ww3Sgejc3OY5g9PZLEJH/LTjsVsRG1nGcJI7Z97H9jtmdUwwQ==
X-Received: by 2002:a05:6102:d8c:b0:3b5:3eaa:bb0c with SMTP id
 d12-20020a0561020d8c00b003b53eaabb0cmr3334195vst.0.1673993356687; 
 Tue, 17 Jan 2023 14:09:16 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 bm16-20020a05620a199000b006e16dcf99c8sm21142978qkb.71.2023.01.17.14.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 14:09:16 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>,
 Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH RFC 00/21] migration: Support hugetlb doublemaps
Date: Tue, 17 Jan 2023 17:08:53 -0500
Message-Id: <20230117220914.2062125-1-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

Based-on: <20221213213850.1481858-1-peterx@redhat.com>
  [PATCH 0/5] migration: Fix disorder of channel creations

Trees for reference:
  https://github.com/xzpeter/linux/releases/tag/doublemap-v0.1
  https://github.com/xzpeter/qemu/releases/tag/doublemap-v0.1

This is an RFC series that only for early discussion purpose but not for
merging.

This patchset allows postcopy to work with huge pages better by migrating
huge pages in small page sizes.  It relies on a kernel feature called
"hugetlb HGM" which is currently proposed on the Linux kernel mailing list
by James Houghton, latest version v1:

https://lore.kernel.org/r/20230105101844.1893104-1-jthoughton@google.com

[PS: The kernel v1 patchset may need a few fixups to make QEMU work, which
 are all contained in the tree link provided tagged doublemap-v0.1 above]

The kernel series is still during review upstream, so the API is still not
stable.

I kept the old name of "doublemap" in this QEMU patchset to represent HGM.
With that, huge pages can be mapped with even smaller sizes than the huge
page itself.  It can drastically reduce page fault latencies during
postcopy if the guest has hugepage backed memories and make postcopy start
working with huge pages.  The average page request latency can drop from
~1sec to ~250us for 1G backed in the initial test results.

UFFDIO_COPY doesn't support mapping huge pages in small sizes, so one major
part of this series introduced UFFDIO_CONTINUE to resolve page faults for
hugetlb mappings.

Sampled page latency histogram for 18G guest with/without doublemap
(preempt=on, single thread busy spin workload over 18G map):

Before:

@delay_us:
[64, 128)              3 |@                                                   |
[128, 256)            84 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[256, 512)            10 |@@@@@@                                              |
[512, 1K)              1 |                                                    |
[1K, 2K)               0 |                                                    |
[2K, 4K)               0 |                                                    |
[4K, 8K)               0 |                                                    |
[8K, 16K)              0 |                                                    |
[16K, 32K)             0 |                                                    |
[32K, 64K)             0 |                                                    |
[64K, 128K)            0 |                                                    |
[128K, 256K)           0 |                                                    |
[256K, 512K)           0 |                                                    |
[512K, 1M)             0 |                                                    |
[1M, 2M)              17 |@@@@@@@@@@                                          |
[2M, 4M)              21 |@@@@@@@@@@@@@                                       |
[4M, 8M)               8 |@@@@                                                |
[8M, 16M)              4 |@@                                                  |

After:

@delay_us:
[16, 32)               6 |                                                    |
[32, 64)               6 |                                                    |
[64, 128)           3117 |@@                                                  |
[128, 256)         70815 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
[256, 512)         30460 |@@@@@@@@@@@@@@@@@@@@@@                              |
[512, 1K)           1135 |                                                    |
[1K, 2K)              34 |                                                    |
[2K, 4K)              42 |                                                    |
[4K, 8K)             126 |                                                    |
[8K, 16K)             91 |                                                    |
[16K, 32K)             0 |                                                    |
[32K, 64K)             1 |                                                    |

Any early comment welcomed.  Thanks.

Peter Xu (21):
  update linux headers
  util: Include osdep.h first in util/mmap-alloc.c
  physmem: Add qemu_ram_is_hugetlb()
  madvise: Include linux/mman.h under linux-headers/
  madvise: Add QEMU_MADV_SPLIT
  madvise: Add QEMU_MADV_COLLAPSE
  ramblock: Cache file offset for file-backed ramblocks
  ramblock: Cache the length to do file mmap() on ramblocks
  ramblock: Add RAM_READONLY
  ramblock: Add ramblock_file_map()
  migration: Add hugetlb-doublemap cap
  migration: Introduce page size for-migration-only
  migration: Add migration_ram_pagesize_largest()
  migration: Map hugetlbfs ramblocks twice, and pre-allocate
  migration: Teach qemu about minor faults and doublemap
  migration: Enable doublemap with MADV_SPLIT
  migration: Rework ram discard logic for hugetlb double-map
  migration: Allow postcopy_register_shared_ufd() to fail
  migration: Add postcopy_mark_received()
  migration: Handle page faults using UFFDIO_CONTINUE
  migration: Collapse huge pages again after postcopy finished

 backends/hostmem-file.c                       |   3 +-
 hw/virtio/vhost-user.c                        |   9 +-
 include/exec/cpu-common.h                     |   3 +-
 include/exec/memory.h                         |   4 +-
 include/exec/ram_addr.h                       |   6 +-
 include/exec/ramblock.h                       |  14 +
 include/qemu/madvise.h                        |  18 ++
 include/standard-headers/drm/drm_fourcc.h     |  63 +++-
 include/standard-headers/linux/ethtool.h      |  81 ++++-
 include/standard-headers/linux/fuse.h         |  20 +-
 .../linux/input-event-codes.h                 |   4 +
 include/standard-headers/linux/pci_regs.h     |   2 +
 include/standard-headers/linux/virtio_blk.h   |  19 ++
 include/standard-headers/linux/virtio_bt.h    |   8 +
 include/standard-headers/linux/virtio_net.h   |   4 +
 linux-headers/asm-arm64/kvm.h                 |   1 +
 linux-headers/asm-generic/hugetlb_encode.h    |  26 +-
 linux-headers/asm-generic/mman-common.h       |   4 +
 linux-headers/asm-mips/mman.h                 |   4 +
 linux-headers/asm-riscv/kvm.h                 |   7 +
 linux-headers/asm-x86/kvm.h                   |  11 +-
 linux-headers/linux/kvm.h                     |  32 +-
 linux-headers/linux/psci.h                    |  14 +
 linux-headers/linux/userfaultfd.h             |   4 +
 linux-headers/linux/vfio.h                    | 278 +++++++++++++++++-
 migration/migration.c                         |  56 +++-
 migration/migration.h                         |   1 +
 migration/postcopy-ram.c                      | 228 +++++++++++---
 migration/postcopy-ram.h                      |   5 +-
 migration/ram.c                               | 165 ++++++++++-
 migration/ram.h                               |   2 +
 migration/trace-events                        |   6 +-
 qapi/migration.json                           |   7 +-
 softmmu/memory.c                              |   8 +-
 softmmu/physmem.c                             |  92 ++++--
 util/mmap-alloc.c                             |   2 +-
 36 files changed, 1051 insertions(+), 160 deletions(-)

-- 
2.37.3


