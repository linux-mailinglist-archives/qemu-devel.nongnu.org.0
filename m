Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 982C258A7D9
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 10:12:37 +0200 (CEST)
Received: from localhost ([::1]:35050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJsRg-0006BR-MP
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 04:12:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oJsDg-0002pE-PH; Fri, 05 Aug 2022 03:58:08 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:43795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oJsDb-0001uU-59; Fri, 05 Aug 2022 03:58:08 -0400
Received: by mail-pl1-x62a.google.com with SMTP id 17so1970418plj.10;
 Fri, 05 Aug 2022 00:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=JM7NORmLtOKTzDTMQ0NkqpooBuehOR+UkzZSEWfi2ME=;
 b=aN2R+qIwE10CROEF5TDNnv1jEnbPz9i80f/U+pc9C5aYItW7v+CtbpBUoHVLhtKQhX
 VqbIG5gjdTDuerlCHxo2nI/pVHT1c4jdpMpPje69oN73iVsMYOcu3nU9nB0D6e/3mD3v
 4DchZJVqM/H8YHgqe6KnaYyj5EbJDP9laNRbO+mGUz5hbdbk1usn4mavil5Qm4hs4S+T
 fQ6eLSIifK4DiyWDLU87Rda3GjteYxoC1E7gkGTOibsoRYOaL99ErUlpZ98UIT6TsNQr
 BfNrI1ATs5Ll8CNCsaS4+6AE9LolTLY9+keIq6f7xTEFlTFo8P5TBpQVRD3h0V64wIsK
 E9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=JM7NORmLtOKTzDTMQ0NkqpooBuehOR+UkzZSEWfi2ME=;
 b=JUszb2aYY8athAKwy6eXOfdIkehEpAOc1RV4V6B78j20F7wzLiY8YRaHrJmnuXhhP6
 ZD1WiFb8OqIKokFMQSL3DB+mxcofqGDQCagBjI3alnR+HU/0xud8E/kIoILVEuuIjuLU
 hw9G0miR0ohHf/III8bv2URYctY0t/WHbOiPsaoe5HQIRT3RJK/LqZQeJjJyS3RS3usR
 VRb22nZF2XTASsKwfJiSaOIjgjilbSOGyT4TedZ7HMrccJDCv9YXUvgZB9ip9Htp/ZiV
 8nj1bx+I17V0VOew63oIdZjy81/n4nO3hYJ0NIG905w4K2BDwmS9WqoQpdTucNoqYD2o
 4u3g==
X-Gm-Message-State: ACgBeo1a4W6tYB4yu5qu8w20CIXCzJrr+vNNWXvUycakgH8s+oeM4Hc/
 9C5DvS4NMICyUrUC8RhNU/atloGwadb8oA==
X-Google-Smtp-Source: AA6agR6dxQ0VISIT6ULBwKmPgK9pM6zYFKqpupFHMNM+VP1rqOL1AsdFiBLVcfub1Ib6H6bbyv+OCA==
X-Received: by 2002:a17:90a:ba11:b0:1f2:38ec:3be3 with SMTP id
 s17-20020a17090aba1100b001f238ec3be3mr6153983pjr.177.1659686280596; 
 Fri, 05 Aug 2022 00:58:00 -0700 (PDT)
Received: from roots.. ([106.84.130.246]) by smtp.gmail.com with ESMTPSA id
 z15-20020a170903018f00b0016ee708350bsm2418564plg.14.2022.08.05.00.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 00:57:59 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, hare@suse.de, Stefan Hajnoczi <stefanha@redhat.com>,
 dmitry.fomichev@wdc.com, Kevin Wolf <kwolf@redhat.com>,
 damien.lemoal@opensource.wdc.com, Eric Blake <eblake@redhat.com>,
 Fam Zheng <fam@euphon.net>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v6 0/8] Add support for zoned device
Date: Fri,  5 Aug 2022 15:57:43 +0800
Message-Id: <20220805075751.77499-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x62a.google.com
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

This patch series extend the block layer APIs with the minimum set of zoned commands that are necessary to support zoned devices. The commands are - Report Zones, four zone operations and Zone Append (developing).

It can be tested on a null_blk device using qemu-io or qemu-iotests. For example, the command line for zone report using qemu-io is:

$ path/to/qemu-io --image-opts driver=zoned_host_device,filename=/dev/nullb0 -c "zrp offset nr_zones"

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
  file-posix: introduce get_sysfs_long_val for the long sysfs attribute
  file-posix: introduce get_sysfs_str_val for device zoned model
  block: add block layer APIs resembling Linux ZonedBlockDevice ioctls
  raw-format: add zone operations to pass through requests
  config: add check to block layer
  qemu-iotests: test new zone operations
  docs/zoned-storage: add zoned device documentation

 block.c                                |  13 +
 block/block-backend.c                  |  50 +++
 block/coroutines.h                     |   6 +
 block/file-posix.c                     | 423 ++++++++++++++++++++++++-
 block/io.c                             |  41 +++
 block/raw-format.c                     |  14 +
 docs/devel/zoned-storage.rst           |  41 +++
 docs/system/qemu-block-drivers.rst.inc |   6 +
 include/block/block-common.h           |  44 ++-
 include/block/block-io.h               |  13 +
 include/block/block_int-common.h       |  35 +-
 include/block/raw-aio.h                |   6 +-
 meson.build                            |   1 +
 qapi/block-core.json                   |   8 +-
 qemu-io-cmds.c                         | 144 +++++++++
 tests/qemu-iotests/tests/zoned.out     |  53 ++++
 tests/qemu-iotests/tests/zoned.sh      |  86 +++++
 17 files changed, 964 insertions(+), 20 deletions(-)
 create mode 100644 docs/devel/zoned-storage.rst
 create mode 100644 tests/qemu-iotests/tests/zoned.out
 create mode 100755 tests/qemu-iotests/tests/zoned.sh

-- 
2.37.1


