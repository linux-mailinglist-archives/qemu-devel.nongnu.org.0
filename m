Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 068C85B4444
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Sep 2022 07:33:53 +0200 (CEST)
Received: from localhost ([::1]:54136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWt7m-0007fe-NM
	for lists+qemu-devel@lfdr.de; Sat, 10 Sep 2022 01:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oWt2f-00025p-K8; Sat, 10 Sep 2022 01:28:33 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:40678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oWt2d-0004mk-ND; Sat, 10 Sep 2022 01:28:33 -0400
Received: by mail-pg1-x535.google.com with SMTP id r17so3402119pgr.7;
 Fri, 09 Sep 2022 22:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=5IW5MtHzslbZXmgAtdcBXkBGAZ75vQqwIN53ydIfh+U=;
 b=E28UkgiUAin4pLpwixrwy5/r0dRLgH3q0CyVmoZr4/xortkW+txY0X5faE2vH0iPj0
 oU1LXvNRu5gNv6iujqT+QOuEQ/10rTFvHUvmcqk9O4S1so9GxnYc8Buy+xWDrqqTccaa
 gjOfFhXHJecHEPTcub+YHNY6sRx/AMs1rrtnikz+hU2emOXVwHKqExbJyRoOk5nynFfV
 CbNfj0ab5yia0mfLhjGcoo3ghAgqMRxXtZsFNTuskGtdY3XVpzExK+2Fx/LmN/fvC5RO
 DayS7SJOSBUL4r0T3VfRdHq5gV/4CM5hhig4Pur9voXijstgMYiACe9rNQiYCaSkLck8
 61ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=5IW5MtHzslbZXmgAtdcBXkBGAZ75vQqwIN53ydIfh+U=;
 b=Ii+8BePnhqXKrAC609PGRarNXmBMe1YUF06TD/LwDgHeE2HCACTt3s8fFV7iIHRqpH
 aRAfcDk+JDC2WJWCjjaC3FOFNJ2IatuKDlDiVejELTsGfeYzWg0gWXiJwMKWbj+wBghv
 BO35OuUYaM1W5qoKhiblznUer9/K0H88yL/n74nYHaT3bewQKzPPqck3C1sRfsLBKrQ2
 U20y8gVUMMe6MqmFGIpZn5iO0bMYyXuAJBioWZjfJTM3JLxluP4xIGrFAYCRDOTWnZP4
 VmNadqgSLuchaG3NV/W8SmZoSqNWdmAOeewOB9rmJFt0PGf78rLhGllf3HFl9iL7JMrC
 LP3w==
X-Gm-Message-State: ACgBeo3S/lOShKCPdVkj8ZHYoCBJiQANKBg1IHpuITezmEiEmC0e7+HQ
 eiZgSIi5VXyKF1Sd1wRiGtGFq1EUuQ21j4Nn
X-Google-Smtp-Source: AA6agR4b5sfs3qSSDQjF6RomXSxrfPGjRgFicPiPMxw2lAWH3XJzOaaNvMTlmic1JsIr/OTjuosGiw==
X-Received: by 2002:a05:6a00:16c4:b0:535:890:d52 with SMTP id
 l4-20020a056a0016c400b0053508900d52mr17544873pfc.9.1662787708983; 
 Fri, 09 Sep 2022 22:28:28 -0700 (PDT)
Received: from roots.. ([183.221.93.83]) by smtp.gmail.com with ESMTPSA id
 y6-20020aa793c6000000b00540d75197e5sm731994pff.47.2022.09.09.22.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 22:28:28 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: dmitry.fomichev@wdc.com, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, damien.lemoal@opensource.wdc.com, hare@suse.de,
 Hanna Reitz <hreitz@redhat.com>, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v9 0/7] Add support for zoned device
Date: Sat, 10 Sep 2022 13:27:52 +0800
Message-Id: <20220910052759.27517-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=faithilikerun@gmail.com; helo=mail-pg1-x535.google.com
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
example, to test zone report using qemu-io:
$ path/to/qemu-io --image-opts -n driver=zoned_host_device,filename=/dev/nullb0
-c "zrp offset nr_zones"

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

Sam Li (7):
  include: add zoned device structs
  file-posix: introduce helper functions for sysfs attributes
  block: add block layer APIs resembling Linux ZonedBlockDevice ioctls
  raw-format: add zone operations to pass through requests
  config: add check to block layer
  qemu-iotests: test new zone operations
  docs/zoned-storage: add zoned device documentation

 block.c                                |  14 +
 block/block-backend.c                  | 145 ++++++++
 block/file-posix.c                     | 458 +++++++++++++++++++++++--
 block/io.c                             |  41 +++
 block/raw-format.c                     |  14 +
 docs/devel/zoned-storage.rst           |  41 +++
 docs/system/qemu-block-drivers.rst.inc |   6 +
 include/block/block-common.h           |  43 +++
 include/block/block-io.h               |   7 +
 include/block/block_int-common.h       |  29 ++
 include/block/raw-aio.h                |   6 +-
 include/sysemu/block-backend-io.h      |  17 +
 meson.build                            |   1 +
 qapi/block-core.json                   |   8 +-
 qemu-io-cmds.c                         | 143 ++++++++
 tests/qemu-iotests/tests/zoned.out     |  53 +++
 tests/qemu-iotests/tests/zoned.sh      |  85 +++++
 17 files changed, 1071 insertions(+), 40 deletions(-)
 create mode 100644 docs/devel/zoned-storage.rst
 create mode 100644 tests/qemu-iotests/tests/zoned.out
 create mode 100755 tests/qemu-iotests/tests/zoned.sh

-- 
2.37.3


