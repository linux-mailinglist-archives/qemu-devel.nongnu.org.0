Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EEB6F9ED5
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 06:56:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvsub-00014P-1B; Mon, 08 May 2023 00:55:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pvsuZ-00014A-1X; Mon, 08 May 2023 00:55:47 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pvsuW-0005R3-T2; Mon, 08 May 2023 00:55:46 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1ab05018381so38326105ad.2; 
 Sun, 07 May 2023 21:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683521742; x=1686113742;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ofALW1AHo+WkW0PNt4MDwczwSr5GqeamNljtVukVe2Q=;
 b=ZfdWV8FdaP+s9a1FhrPrSkk06j12TPdp9otLfO2esy/p4QkbpDeY9vFZ+Uh/HouOlE
 xgD0lOnok6XDMIFu6LYq+hCZbfLWOnX2CSdvfMqIzWgzJQqSleL/SS7LMGSnVldtE47Z
 xSoT1ug2MfkuYxB7HiUVLDq+k/8fHWLUMvLIrJrj+hTDOSqoFWn+/Db/dpxdsFmWE5v8
 lXdUUCZiXGdjFgvGOcFkh027JX4WrZ46r4GIaCfYHVE3IL4emx2BE9fvGEKyE3NbxPiS
 sxmQm1lxRmL0gyoA8DRDfarbB67zrGYgDZeDyJ7P4AgtqwsqsbJ/+QjZ5u3zXQXJJZPz
 NeAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683521742; x=1686113742;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ofALW1AHo+WkW0PNt4MDwczwSr5GqeamNljtVukVe2Q=;
 b=B7ToalVlfHDcYYJoJvogFG53S1xi6qiXw8lQ2XOyKRtEw0nHZTjA6G35v3+Oba8sCl
 4Z+cxlh68Sz/HlZNeh129JRc2tMrqhT06RzF9bgZWGHV1+NlSSSC6cRWIYBSBOsnEqwd
 kshTfNHLgWEf3w8QlS3QUBWN1lB7GvqvOD/ozRTTJx7U/4XhgMr1JXgF5QZfVGwSlNjX
 nx0/kxmUkXZaj77i2gKgoGEfNnFyz3lvU5OLMPGMfcfycWaNS+2rTNJq0MOnarAhVb8R
 eBpghmXAg1u8E7pZQZH3R/cetqknJB0MUU+kyhtg4b7B8ao0GotZc77rW8q/8Qzgv0gP
 eW/A==
X-Gm-Message-State: AC+VfDxY5KxU1Pj6K/Ev2Tdlb80oWM5AgQtafb9M1BGxA0VU16YBra0a
 /xX7OGQRr6VfsmF5dXhitHAvY9llbtSI4Ub1
X-Google-Smtp-Source: ACHHUZ55lOMPgsTF5o6Yr892nvZ7uLVVIVrVHlHcP+9BfzQydrG0gEyqzPBFN1uStwrsrankfWyBuA==
X-Received: by 2002:a17:902:9897:b0:1ab:253e:6906 with SMTP id
 s23-20020a170902989700b001ab253e6906mr8478575plp.67.1683521741453; 
 Sun, 07 May 2023 21:55:41 -0700 (PDT)
Received: from fedlinux.. ([106.84.128.239]) by smtp.gmail.com with ESMTPSA id
 bg12-20020a1709028e8c00b0019ef86c2574sm6007112plb.270.2023.05.07.21.55.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 21:55:40 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, dmitry.fomichev@wdc.com,
 Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 dlemoal@kernel.org, hare@suse.de,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v20 0/8] Add support for zoned device
Date: Mon,  8 May 2023 12:55:25 +0800
Message-Id: <20230508045533.175575-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x630.google.com
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

v20:
- fix more CI issues [Stefan]
- change the type of zone information fields of BlockLimits to unsigned int

v19:
- fix CI related issues [Stefan]

v18:
- use 'sudo -n' in qemuio-tests [Stefan]

v17:
- fix qemuiotests for zoned support patches [Dmitry]

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
  block/block-common: add zoned device structs
  block/file-posix: introduce helper functions for sysfs attributes
  block/block-backend: add block layer APIs resembling Linux
    ZonedBlockDevice ioctls
  block/raw-format: add zone operations to pass through requests
  block: add zoned BlockDriver check to block layer
  iotests: test new zone operations
  block: add some trace events for new block layer APIs
  docs/zoned-storage: add zoned device documentation

 block.c                                |  19 ++
 block/block-backend.c                  | 137 ++++++++
 block/file-posix.c                     | 451 +++++++++++++++++++++++--
 block/io.c                             |  41 +++
 block/raw-format.c                     |  18 +
 block/trace-events                     |   2 +
 docs/devel/index-api.rst               |   1 +
 docs/devel/zoned-storage.rst           |  43 +++
 docs/system/qemu-block-drivers.rst.inc |   6 +
 include/block/block-common.h           |  43 +++
 include/block/block-io.h               |   9 +
 include/block/block_int-common.h       |  29 ++
 include/block/raw-aio.h                |   6 +-
 include/sysemu/block-backend-io.h      |  18 +
 meson.build                            |   5 +
 qemu-io-cmds.c                         | 149 ++++++++
 tests/qemu-iotests/tests/zoned         |  89 +++++
 tests/qemu-iotests/tests/zoned.out     |  53 +++
 18 files changed, 1084 insertions(+), 35 deletions(-)
 create mode 100644 docs/devel/zoned-storage.rst
 create mode 100755 tests/qemu-iotests/tests/zoned
 create mode 100644 tests/qemu-iotests/tests/zoned.out

-- 
2.40.0


