Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEA56B3BF6
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 11:25:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paZv8-0007pp-JV; Fri, 10 Mar 2023 05:24:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1paZv6-0007pQ-Mr; Fri, 10 Mar 2023 05:24:16 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1paZv4-0002QA-DD; Fri, 10 Mar 2023 05:24:16 -0500
Received: by mail-pf1-x429.google.com with SMTP id z11so3311443pfh.4;
 Fri, 10 Mar 2023 02:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678443851;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mSSuRKTFf+s8ItL3+s2EzORzObQsqg8j7Y0TV6imd+c=;
 b=W8/fcBmPz5fQLeFmkJ3t5gOkZCqqRwSWwL7LB/UcL1FKAutVWmAQYOOTYJVC34ZUbZ
 /pZVeaKO2wZ1MCa7D6mc7H9WVNBmepilt7Bgrk5VNj6ne8riY17GvQxZs3N66Wa2RNeX
 aXRfjYuE+zk/+ddNQHEd+h7rhnC11ErftmpjYa/p3fv7VGqPowSlnJ/eQHXMAmdC5ltC
 GsiA1wIPmFgfHf8Ni6CvQZLMh31JpxQRDNj1pfiYIkBPVVSPeb11OzK33GP7HOO0ELop
 /RVxvCdpLTxYksMdb8Zo+usxhPKGf2mG3JF8NjtjJ3DuE/r1tac8ueYImmsnx2yS3M3V
 hp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678443851;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mSSuRKTFf+s8ItL3+s2EzORzObQsqg8j7Y0TV6imd+c=;
 b=pUegKo+S7fHv0Pj++2WTkoDhmMwDQERUJiTnDq7sS8YeYJ3tCkBUYJVeiHm4KGoh0U
 ycVwW/UPktNyW36FDl9mJsdJ6oSJ31qCZxH7z9XN2kW8k1SyfvPXL37hge5pu8k0UhTV
 sL/4Z9yZGA7b9PTzRSd3WrYYCBrcqjBZ+nCTmr11u/iEkkBAQZLGYClW7urFATaupgC0
 uGn4cB3off04t/B6o+zGL+MfTb/CGpLooJYJS0gAIobvKgWXsTmurjO5rOqMZjNd8Qaj
 lclpX55bjXfG3TvNN/gaZnQbUsjvFazhatACqTQ8OWop/KS7CxOOcdSeDm5oygHBscim
 S/zA==
X-Gm-Message-State: AO0yUKU/zo1jS0GYyoPy9pTk9Dsh6Y3l5ptmmv3jh4kCCfitfmHzRCSC
 3pS4QvLZSpNTht0E6pM2E7VtpKvBflEPgxKQN4o=
X-Google-Smtp-Source: AK7set9Ch/S/HtJJ80bVqt303EaRxYUAJs3e23nvlOBrCy1iTNEv9AaYA5kzYJ3x759flac2Ed37yA==
X-Received: by 2002:a05:6a00:2403:b0:5a8:1866:7cfe with SMTP id
 z3-20020a056a00240300b005a818667cfemr1433278pfh.17.1678443850589; 
 Fri, 10 Mar 2023 02:24:10 -0800 (PST)
Received: from fedlinux.. ([106.84.129.9]) by smtp.gmail.com with ESMTPSA id
 f8-20020a63f748000000b005030113f46dsm1008719pgk.37.2023.03.10.02.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 02:24:10 -0800 (PST)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, damien.lemoal@opensource.wdc.com, hare@suse.de,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 dmitry.fomichev@wdc.com, Thomas Huth <thuth@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v16 0/8] Add support for zoned device
Date: Fri, 10 Mar 2023 18:23:55 +0800
Message-Id: <20230310102403.61347-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-x429.google.com
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
Zones, four zone operations and Zone Append.

There has been a debate on whethre introducing new zoned_host_device BlockDriver
specifically for zoned devices. In the end, it's been decided to stick to
existing host_device BlockDriver interface by only adding new zoned operations
inside it. The benefit of that is to avoid further changes - one example is
command line syntax - to the applications like Libvirt using QEMU zoned
emulation.

It can be tested on a null_blk device using qemu-io or qemu-iotests. For
example, to test zone report using qemu-io:
$ path/to/qemu-io --image-opts -n driver=host_device,filename=/dev/nullb0
-c "zrp offset nr_zones"

v16:
- update zoned_host device name to host_device [Stefan]
- fix probing zoned device blocksizes [Stefan]
- Use empty fields instead of changing struct size of BlkRwCo [Kevin, Stefan]

v15:
- drop zoned_host_device BlockDriver
- add zoned device option to host_device driver instead of introducing a new
  zoned_host_device BlockDriver [Stefan]

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

 block.c                                |  19 ++
 block/block-backend.c                  | 133 ++++++++
 block/file-posix.c                     | 446 +++++++++++++++++++++++--
 block/io.c                             |  41 +++
 block/raw-format.c                     |  18 +
 block/trace-events                     |   2 +
 docs/devel/zoned-storage.rst           |  43 +++
 docs/system/qemu-block-drivers.rst.inc |   6 +
 include/block/block-common.h           |  43 +++
 include/block/block-io.h               |   9 +
 include/block/block_int-common.h       |  29 ++
 include/block/raw-aio.h                |   6 +-
 include/sysemu/block-backend-io.h      |  18 +
 meson.build                            |   4 +
 qemu-io-cmds.c                         | 149 +++++++++
 tests/qemu-iotests/tests/zoned.out     |  53 +++
 tests/qemu-iotests/tests/zoned.sh      |  86 +++++
 17 files changed, 1068 insertions(+), 37 deletions(-)
 create mode 100644 docs/devel/zoned-storage.rst
 create mode 100644 tests/qemu-iotests/tests/zoned.out
 create mode 100755 tests/qemu-iotests/tests/zoned.sh

-- 
2.39.2


