Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD912571017
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 04:21:16 +0200 (CEST)
Received: from localhost ([::1]:51922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB5WW-0002BE-06
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 22:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oB5PT-0000q9-Pe; Mon, 11 Jul 2022 22:14:01 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:44988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oB5PS-0007xZ-4k; Mon, 11 Jul 2022 22:13:59 -0400
Received: by mail-pg1-x529.google.com with SMTP id bf13so6294079pgb.11;
 Mon, 11 Jul 2022 19:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m9O1RLBWMlVbAXxaDM1AQSyN5lN4n8kqpdU0p10Z8So=;
 b=AxLaXaampHRhsA1H9he+JbCe7Vm5QsCewT40ufI5Hx6GR1KA2qcREAELtJ1MG7rc+0
 9tD60tjeAUYrAlmzGynLsWu/3U6sOK4lovAdZN0cPhKIT/ra5YUh84x8ZlybDXzW1TVu
 oc5S151Vazfel8KWrvUnX/G+DU6k0/94xx3tF8rNGWc1p+fG2iJT1AEHUnLVppGkxvua
 4NuhtRijXt4I4c1bD79xRO2V5kNDK453WUOXsHGrxrAhEh7x3mMuaYgxsJDutHBRYoUF
 vEQ8f39aCpPfFhG6rJGwu0BdXQhacYbUm47xnSxRZlBkVA6MPr45BD+51kH43ET8r8G6
 ryxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m9O1RLBWMlVbAXxaDM1AQSyN5lN4n8kqpdU0p10Z8So=;
 b=hsT74H3SOu5jti9F6aVfh3Bk5aZWrZtS87fcz06I4cFmGFFOjtB1AjjHmmRQxanyX/
 H+caT0xN42+zExbmrl6Ect0br9EhQjmM3CeqWJto06tqYSrfkr5h9knq84vhaF4nUTMd
 RbJjd/2qb3nktYHWTLEOopSVyVfK7bldagHwkDdIuB6XGnIcz8q2pkl1wW3O7/0saItX
 u3sf+pSIqzR+JJZNvDR827GM2mz9a7VLFJLsLBHMmIdcfTB65ulFCR+noxz7oVj4B4ln
 H1rxAaoWhu0aPG/keFHw0Zcp+xd3i6Sh60q8x9AOf+a7Y1kflofMTnRE9AMcAT5Nzl7I
 K9FQ==
X-Gm-Message-State: AJIora/HIB8+6m/YWudqWAWN4gUzXDPoRUHUtgCnZRoK3p9MoOWfjmoS
 ePI5dGs/dSfGA01K28k9ea5ETOSjBPhFY9ei
X-Google-Smtp-Source: AGRyM1sY34X5fmpXZ6dtf9uV3ixsLFeNYUYx5UGPJq2C4HzsIoPWbSujbkdUl7zJBhaRHLbYg1ve0w==
X-Received: by 2002:a05:6a00:1a14:b0:528:6cc2:b278 with SMTP id
 g20-20020a056a001a1400b005286cc2b278mr21611442pfv.60.1657592032195; 
 Mon, 11 Jul 2022 19:13:52 -0700 (PDT)
Received: from roots.. ([106.84.131.214]) by smtp.gmail.com with ESMTPSA id
 k22-20020aa79736000000b00528f9597fb3sm5430251pfg.197.2022.07.11.19.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 19:13:51 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, Markus Armbruster <armbru@redhat.com>,
 dmitry.fomichev@wdc.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, hare@suse.de, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v4 0/9] Add support for zoned device
Date: Tue, 12 Jul 2022 10:13:36 +0800
Message-Id: <20220712021345.8530-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.36.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=faithilikerun@gmail.com; helo=mail-pg1-x529.google.com
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

This patch series adds support for zoned device to virtio-blk emulation. Zoned
Storage can support sequential writes, which reduces write amplification in SSD,
leading to higher write throughput and increased capacity.

v4:
- add block layer APIs (revision)
- add configurations for zoned block device

Sam Li (9):
  block: add block layer APIs resembling Linux ZonedBlockDevice ioctls.
  qemu-io: add zoned block device operations.
  file-posix: introduce get_sysfs_long_val for a block queue of sysfs
    attribute
  file-posix: introduce get_sysfs_str_val for device zoned model.
  qemu-iotests: test new zone operations.
  raw-format: add zone operations
  config: add check to block layer
  include: add support for zoned block devices
  qapi: add support for zoned host device

 block.c                                     |   7 +
 block/block-backend.c                       |  41 +++
 block/coroutines.h                          |   5 +
 block/file-posix.c                          | 334 +++++++++++++++++++-
 block/io.c                                  |  57 ++++
 block/raw-format.c                          |  13 +
 include/block/block-common.h                |  43 ++-
 include/block/block-io.h                    |  13 +
 include/block/block_int-common.h            |  25 ++
 include/standard-headers/linux/virtio_blk.h | 157 ++++++++-
 qapi/block-core.json                        |   7 +-
 qemu-io-cmds.c                              | 143 +++++++++
 tests/qemu-iotests/tests/zoned.sh           |  69 ++++
 13 files changed, 888 insertions(+), 26 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/zoned.sh

-- 
2.36.1


