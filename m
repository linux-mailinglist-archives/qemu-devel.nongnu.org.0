Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 113CE59528D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 08:32:47 +0200 (CEST)
Received: from localhost ([::1]:58640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNq85-0002sR-Ty
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 02:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oNq19-0005ac-SN; Tue, 16 Aug 2022 02:25:36 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:36694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oNq17-0003YZ-57; Tue, 16 Aug 2022 02:25:35 -0400
Received: by mail-pg1-x52a.google.com with SMTP id s206so8453258pgs.3;
 Mon, 15 Aug 2022 23:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=+Whj3vPRRmOoI4mrUxvcS0kvF7m1OJVlHH0FmB7XY1s=;
 b=ZuXqE1k6939ZpFf5BfLjgfIrxmyTZBSjJi/mNGVKCqL7qAa3VPKKzLF9rBururR8rD
 rmiRHc74NnjftDNJyU3hWz+oicrW7RERprD2xUffU7r7k2SiTCgOoIKlEFTNalJsOk/e
 91k17AXDUHDRHDF14TODhZrpTVxRuxVy7tm1/afIjCkcmXE32myJl/NV2PIfJI7zb4Ld
 4kRL84oX3YYFS7wYvftgH7GUE2YyZFLsG+usjDEmzIL7GIQXrdbniUdQzu5odkPYzuFw
 bByxxo9f4JauaHF8EhZWuXf79Ll9sNCiOGIKWrM61uG/NDFTnh91le2/Jfkv6v6dEJRE
 OHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=+Whj3vPRRmOoI4mrUxvcS0kvF7m1OJVlHH0FmB7XY1s=;
 b=kJXlSaWgbL0bxmsMJsML/yPARkAIf6LkWy7sEkK1VY48ydz8OgrRa80hRvVngq4hzq
 LyuLQntYrLlrIDIFA5RhGDnqVemZRoXMTTIkmQVrCxri9hly2WVs7CNOD4SySuvCyNW2
 acYApTrbYzWqR7dGtI0u8mih6jQR5NRSHgF0sorazi4JmIgo6/Xr50Holc4WZscoRAro
 y4C9ZQJaC2NYRncIh7c3BbUqm4FoY6bdj6kOn9HhZUpPjGbqdo6pQIA2cSef26iiIbZJ
 N+odFx6wjUWsSWIMZTfINXW2ziLNyk89a4pLBHVVGu9cPdfma2M9K1s4qcgUvBIoWxx0
 GONg==
X-Gm-Message-State: ACgBeo0wdDyPiUNf0Z6jhhh62tohLoWKvI6mKP1wDUb0upbovjJ7kJpt
 ud8l2TfEHSrRvC5TVh1kS9INQ4H0dj6kSg==
X-Google-Smtp-Source: AA6agR7C2vQQvqJHyOWlCvGpjqGiGG8aHgYprxwALL0IcgfQ+moBFvlR2+DKTTo29iCQzPm3YMOjzA==
X-Received: by 2002:a05:6a00:1786:b0:52e:625d:a08d with SMTP id
 s6-20020a056a00178600b0052e625da08dmr20137525pfg.76.1660631128850; 
 Mon, 15 Aug 2022 23:25:28 -0700 (PDT)
Received: from roots.. ([106.84.129.185]) by smtp.gmail.com with ESMTPSA id
 e15-20020a170902784f00b0016f1c1f50f4sm8082868pln.235.2022.08.15.23.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 23:25:28 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: hare@suse.de, Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 stefanha@redhat.com, Hanna Reitz <hreitz@redhat.com>,
 dmitry.fomichev@wdc.com, qemu-block@nongnu.org,
 damien.lemoal@opensource.wdc.com, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v7 0/8] Add support for zoned device
Date: Tue, 16 Aug 2022 14:25:14 +0800
Message-Id: <20220816062522.85714-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=faithilikerun@gmail.com; helo=mail-pg1-x52a.google.com
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

This patch series extend the block layer APIs with the minimum set of zoned
commands that are necessary to support zoned devices. The commands are - Report
Zones, four zone operations and Zone Append (developing).

It can be tested on a null_blk device using qemu-io or qemu-iotests. For
example, the command line for zone report using qemu-io is:
$ path/to/qemu-io --image-opts driver=zoned_host_device,filename=/dev/nullb0
-c "zrp offset nr_zones"

v7:
- address review comments
  * modify sysfs attribute helper funcations
  * move the input validation and error checking into raw_co_zone_* function
  * fix checks in config

v6:
- drop virtio-blk emulation changes
- address Stefan's review comments
  * fix CONFIG_BLKZONED configs in related functions
  * replace reading fd by g_file_get_contents() in get_sysfs_str_val()
  * rewrite documentation for zoned storage

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

Sam Li (8):
  include: add zoned device structs
  file-posix: introduce get_sysfs_str_val for device zoned model
  file-posix: introduce get_sysfs_long_val for the long sysfs attribute
  block: add block layer APIs resembling Linux ZonedBlockDevice ioctls
  raw-format: add zone operations to pass through requests
  config: add check to block layer
  qemu-iotests: test new zone operations
  docs/zoned-storage: add zoned device documentation

 block.c                                |  14 +
 block/block-backend.c                  |  50 +++
 block/file-posix.c                     | 449 +++++++++++++++++++++++--
 block/io.c                             |  41 +++
 block/raw-format.c                     |  14 +
 docs/devel/zoned-storage.rst           |  41 +++
 docs/system/qemu-block-drivers.rst.inc |   6 +
 include/block/block-common.h           |  44 ++-
 include/block/block-io.h               |  13 +
 include/block/block_int-common.h       |  30 +-
 include/block/raw-aio.h                |   6 +-
 include/sysemu/block-backend-io.h      |   6 +
 meson.build                            |   1 +
 qapi/block-core.json                   |   8 +-
 qemu-io-cmds.c                         | 143 ++++++++
 tests/qemu-iotests/tests/zoned.out     |  53 +++
 tests/qemu-iotests/tests/zoned.sh      |  86 +++++
 17 files changed, 963 insertions(+), 42 deletions(-)
 create mode 100644 docs/devel/zoned-storage.rst
 create mode 100644 tests/qemu-iotests/tests/zoned.out
 create mode 100755 tests/qemu-iotests/tests/zoned.sh

-- 
2.37.1


