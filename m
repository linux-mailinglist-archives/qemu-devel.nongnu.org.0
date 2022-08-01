Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFB358622E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 03:22:51 +0200 (CEST)
Received: from localhost ([::1]:43748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIK8v-0001Up-Ty
	for lists+qemu-devel@lfdr.de; Sun, 31 Jul 2022 21:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oIK6x-00083U-KW; Sun, 31 Jul 2022 21:20:48 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:34372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oIK6v-0007RG-K6; Sun, 31 Jul 2022 21:20:47 -0400
Received: by mail-pf1-x429.google.com with SMTP id f28so1024327pfk.1;
 Sun, 31 Jul 2022 18:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=3vnwPUtdS0h6IN6fwVp10O/CfmppuNgZmfS9wzs/buA=;
 b=NzFVsb8EfMwq1EMitqHBgEj83Xbb09dDH6LJlezT7j0yfNQhK0Yy5sZT95/0FX4ckm
 /TJrpPN5AfgE3cwsEK7ie/dnoNLEY8ULcEe1G2IkoZ/7y9sZYi9pijz5AG5QVphwSwKH
 xcOpy353TrAKHlCo2bRXDyOGZzeK3qI7/4L6YJlHcPjg9qexFI/g/JXv9eA3SIDcgu3O
 YQVRxVTEMB6UV4TXPGO7VrVAgdK4jCJlyNyK98lIUhTzK6Fqbi2uKCM5s9bb5MNNs0LJ
 bnVesP5IX7ro27kd3pWKN8fllpFRFSgDV0SIqoTkTe3NfzR1n5uKxFNDfnUIXO0raXs6
 lLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=3vnwPUtdS0h6IN6fwVp10O/CfmppuNgZmfS9wzs/buA=;
 b=6p7RQaekWcWWIaQlJnUjGWXq6NLI1ABsVcBIW8nb10yspg702mQodajhV2nEqdNUMA
 f+8Qs/GA0NiWVY6Dp6ih0McT4qScEb9Acu++cjOB8iuzhERhsngmAiL6TpRgj2WBUF8B
 n1TywBPjVReL/VHT9gF7fqNBcq326/+FFf8DHjrfQaUDod6mLwtjwu9LK8ht3APCKGLS
 NsNHGv7bBZecHaRjafzthYbv6FU5qQDxxTOkVbi+qro34Sgnpa0mI4YJZpUduJWlhEC9
 lBKMWwxrdAf0f+K1vuqfN+ErPJZUt5GrcSY2ubcE25ReNJMADb28NsHluvWQKor+KbFM
 cUqw==
X-Gm-Message-State: AJIora+GIl3AVZUJ9zvg/lRSZ2kp9PRhT4uP9z9tVaiup8K+oi/n1dIU
 31cucKoLZpHlMNfAQaok6fs0GnOK1z+fmAD+OY8=
X-Google-Smtp-Source: AA6agR4b+ESKygrsF3w00Pos6yqmHBESZXjg7tP9NtBk7XLQDcuat/LrM9cdfFm3H+9QH8Zxi/nSQA==
X-Received: by 2002:a17:902:988b:b0:16e:cdf5:aaea with SMTP id
 s11-20020a170902988b00b0016ecdf5aaeamr8348606plp.137.1659316831055; 
 Sun, 31 Jul 2022 18:20:31 -0700 (PDT)
Received: from localhost.localdomain ([123.147.246.222])
 by smtp.gmail.com with ESMTPSA id
 145-20020a621897000000b0052aaff953aesm7078074pfy.115.2022.07.31.18.20.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 31 Jul 2022 18:20:30 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, dmitry.fomichev@wdc.com, hare@suse.de,
 stefanha@redhat.com, mst@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org, fam@euphon.net, kwolf@redhat.com, hreitz@redhat.com,
 eblake@redhat.com, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v5 00/11] Add support for zoned device
Date: Mon,  1 Aug 2022 09:20:15 +0800
Message-Id: <20220801012015.4902-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Zoned Block Devices (ZBDs) devide the LBA space to block regions called zones
that are larger than the LBA size. It can only allow sequential writes, which
reduces write amplification in SSD, leading to higher throughput and increased
capacity. More details about ZBDs can be found at:

https://zonedstorage.io/docs/introduction/zoned-storage

The zoned device support aims to let guests (virtual machines) access zoned
storage devices on the host (hypervisor) through a virtio-blk device. This
involves extending QEMU's block layer and virtio-blk emulation code.  In its
current status, the virtio-blk device is not aware of ZBDs but the guest sees
host-managed drives as regular drive that will runs correctly under the most
common write workloads.

This patch series extend the block layer APIs and virtio-blk emulation section
with the minimum set of zoned commands that are necessary to support zoned
devices. The commands are - Report Zones, four zone operations and Zone Append
(developing).

It can be tested on a null_blk device using qemu-io, qemu-iotests or blkzone(8)
command in the guest os. For example, the command line for zone report using
qemu-io is:

$ path/to/qemu-io --image-opts driver=zoned_host_device,filename=/dev/nullb0 -c
"zrp offset nr_zones"

To enable zoned device in the guest os, the guest kernel must have the virtio-blk
driver with ZBDs support. The link to such patches for the kernel is:
https://github.com/dmitry-fomichev/virtblk-zbd

Then, add the following options to the QEMU command line:
-blockdev node-name=drive0,driver=zoned_host_device,filename=/dev/nullb0

After the guest os booting, use blkzone(8) to test zone operations:
blkzone report -o offset -c nr_zones /dev/vda

v5:
- add zoned storage emulation to virtio-blk device
- add documentation for zoned storage
- address review comments
  * fix qemu-iotests
  * fix check to block layer
  * modify interfaces of sysfs helper functions
  * rename zoned device structs according to QEMU styles
  * reorder patches

v4:
- add virtio-blk headers for zoned device
- add configurations for zoned host device
- add zone operations for raw-format
- address review comments
  * fix memory leak bug in zone_report
  * add checks to block layers
  * fix qemu-iotests format
  * fix sysfs helper functions

v3:
- add helper functions to get sysfs attributes
- address review comments
  * fix zone report bugs
  * fix the qemu-io code path
  * use thread pool to avoid blocking ioctl() calls

v2:
- add qemu-io sub-commands
- address review comments
  * modify interfaces of APIs

v1:
- add block layer APIs resembling Linux ZoneBlockDevice ioctls

Sam Li (11):
  include: add zoned device structs
  include: import virtio_blk headers from linux with zoned storage
    support
  file-posix: introduce get_sysfs_long_val for the long sysfs attribute
  file-posix: introduce get_sysfs_str_val for device zoned model
  block: add block layer APIs resembling Linux ZonedBlockDevice ioctls
  raw-format: add zone operations to pass through requests
  config: add check to block layer
  virtio-blk: add zoned storage APIs for zoned devices
  qemu-io: add zoned block device operations.
  qemu-iotests: test new zone operations
  docs/zoned-storage: add zoned device documentation

 block.c                                     |  13 +
 block/block-backend.c                       | 139 +++++++
 block/coroutines.h                          |   6 +
 block/file-posix.c                          | 383 +++++++++++++++++++-
 block/io.c                                  |  41 +++
 block/raw-format.c                          |  14 +
 docs/devel/zoned-storage.rst                |  68 ++++
 docs/system/qemu-block-drivers.rst.inc      |   6 +
 hw/block/virtio-blk.c                       | 172 ++++++++-
 include/block/block-common.h                |  44 ++-
 include/block/block-io.h                    |  13 +
 include/block/block_int-common.h            |  35 +-
 include/block/raw-aio.h                     |   6 +-
 include/standard-headers/linux/virtio_blk.h | 118 ++++++
 include/sysemu/block-backend-io.h           |   6 +
 meson.build                                 |   1 +
 qapi/block-core.json                        |   7 +-
 qemu-io-cmds.c                              | 144 ++++++++
 tests/qemu-iotests/tests/zoned.out          |  53 +++
 tests/qemu-iotests/tests/zoned.sh           |  86 +++++
 20 files changed, 1340 insertions(+), 15 deletions(-)
 create mode 100644 docs/devel/zoned-storage.rst
 create mode 100644 tests/qemu-iotests/tests/zoned.out
 create mode 100755 tests/qemu-iotests/tests/zoned.sh

-- 
2.37.1


