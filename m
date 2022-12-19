Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C7065080D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 08:30:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Aad-0001Gt-7d; Mon, 19 Dec 2022 02:29:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1p7Aab-0001Gh-54; Mon, 19 Dec 2022 02:29:33 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1p7AaZ-00034w-0r; Mon, 19 Dec 2022 02:29:32 -0500
Received: by mail-pf1-x42e.google.com with SMTP id c7so5574826pfc.12;
 Sun, 18 Dec 2022 23:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W5XFcBsLJXOZra2PTZEJa6MWt2ilWNUKHssdz3yk9yo=;
 b=cEtiX9WTd5ENek2RBFow6XjSU9ROlKoml1PuscavqZajh1dyKB1h7XrCvR848SU2sH
 vbl4m8nc7Q0DOiljXeGnbI8ueI2fos2m6Aen/+1ISIW4swfvfPgQrp/fsQeekbbB/zjb
 twgwehwfnfoK2hjKeNoopRsOBMnUxdTw0dudEOPPUfH2KeocrLCPWC1KQmIAFvteDFZv
 iLQiazAwV9p4JUnAZ4Rzp5Ka+VmXUlY+UCVsucN90ZmQ1wIuTM5N4XpaaciPqUCXnPON
 am6j9DDH2hPV98zp5R92k5f6Q2mAJ8asMa7YGrj5WKu+VO/Aht/zCTm2mZb7RiaFqA8G
 9OQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W5XFcBsLJXOZra2PTZEJa6MWt2ilWNUKHssdz3yk9yo=;
 b=Wo//ulsdSoon21drzPY+DWIiVOvMz69aeXZUHieubLIJBP7yBM1mhOW498fp+Fso17
 uWQkCVdAXDQ0tTVfpXO5s13By95VH7wdWdpUFA9hsJ7Y9W87chB9Cg+6/xa2T1X8OWjF
 T1+CDFxUvdL5GNWB5Jt7k8y9C/vaVGBYXYJT27EYVPpgO2Vjbgviu/8xi7+IqBHTj0Xc
 mmzfx5pVVFEW93LHrCqeTUhAVZjiL2+x1SoYDcgLbn1pQd/arbo0ynNBK3nJZ2+zM5Wl
 64wAUR/edaWmvw4BcPX3z/RIIB8MzAqK3qqumEaNI6feiL5Dt8khJzbxbChSU5nP5v5M
 ERWQ==
X-Gm-Message-State: AFqh2krTR1pe5dYjNyc/Opm6fyLe7x2jpcUi55cTDhDuN9e0OjF8qFNX
 kFpG01YjxRw/aSdwRZSvTryG+lvldG/JYDXF
X-Google-Smtp-Source: AMrXdXv7f+WoA1GZcsPy5KUvl1uKMLtCk0wbm4NeAKvzMDDAeavlwe+ruye25SKrDDjE8fhZQGXiWg==
X-Received: by 2002:aa7:848f:0:b0:57e:74de:991 with SMTP id
 u15-20020aa7848f000000b0057e74de0991mr7995858pfn.15.1671434967845; 
 Sun, 18 Dec 2022 23:29:27 -0800 (PST)
Received: from fedlinux.. ([106.84.132.155]) by smtp.gmail.com with ESMTPSA id
 h12-20020a62830c000000b00577c5915138sm5765623pfe.128.2022.12.18.23.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Dec 2022 23:29:27 -0800 (PST)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: hare@suse.de, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, dmitry.fomichev@wdc.com,
 Paolo Bonzini <pbonzini@redhat.com>, damien.lemoal@opensource.wdc.com,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v14 0/8] Add support for zoned device
Date: Mon, 19 Dec 2022 15:29:11 +0800
Message-Id: <20221219072919.6204-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.38.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
example, to test zone report using qemu-io:
$ path/to/qemu-io --image-opts -n driver=zoned_host_device,filename=/dev/nullb0
-c "zrp offset nr_zones"

v14:
- address Stefan's comments of probing block sizes

v13:
- add some tracing points for new zone APIs [Dmitry]
- change error handling in zone_mgmt [Damien, Stefan]

v12:
- address review comments
  * drop BLK_ZO_RESET_ALL bit [Damien]
  * fix error messages, style, and typos[Damien, Hannes]

v11:
- address review comments
  * fix possible BLKZONED config compiling warnings [Stefan]
  * fix capacity field compiling warnings on older kernel [Stefan,Damien]

v10:
- address review comments
  * deal with the last small zone case in zone_mgmt operations [Damien]
  * handle the capacity field outdated in old kernel(before 5.9) [Damien]
  * use byte unit in block layer to be consistent with QEMU [Eric]
  * fix coding style related problems [Stefan]

v9:
- address review comments
  * specify units of zone commands requests [Stefan]
  * fix some error handling in file-posix [Stefan]
  * introduce zoned_host_devcie in the commit message [Markus]

v8:
- address review comments
  * solve patch conflicts and merge sysfs helper funcations into one patch
  * add cache.direct=on check in config

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
  file-posix: introduce helper functions for sysfs attributes
  block: add block layer APIs resembling Linux ZonedBlockDevice ioctls
  raw-format: add zone operations to pass through requests
  config: add check to block layer
  qemu-iotests: test new zone operations
  block: add some trace events for new block layer APIs
  docs/zoned-storage: add zoned device documentation

 block.c                                |  19 +
 block/block-backend.c                  | 147 ++++++++
 block/file-posix.c                     | 503 +++++++++++++++++++++++--
 block/io.c                             |  41 ++
 block/raw-format.c                     |  14 +
 block/trace-events                     |   2 +
 docs/devel/zoned-storage.rst           |  43 +++
 docs/system/qemu-block-drivers.rst.inc |   6 +
 include/block/block-common.h           |  43 +++
 include/block/block-io.h               |   7 +
 include/block/block_int-common.h       |  29 ++
 include/block/raw-aio.h                |   6 +-
 include/sysemu/block-backend-io.h      |  18 +
 meson.build                            |   4 +
 qapi/block-core.json                   |   8 +-
 qemu-io-cmds.c                         | 149 ++++++++
 tests/qemu-iotests/tests/zoned.out     |  53 +++
 tests/qemu-iotests/tests/zoned.sh      |  86 +++++
 18 files changed, 1139 insertions(+), 39 deletions(-)
 create mode 100644 docs/devel/zoned-storage.rst
 create mode 100644 tests/qemu-iotests/tests/zoned.out
 create mode 100755 tests/qemu-iotests/tests/zoned.sh

-- 
2.38.1


