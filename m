Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5656F0AC5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 19:24:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps5LV-00075b-Uh; Thu, 27 Apr 2023 13:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ps5LR-0006xy-U4; Thu, 27 Apr 2023 13:23:51 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ps5LQ-0007kC-B8; Thu, 27 Apr 2023 13:23:49 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1a6bc48aec8so66278435ad.2; 
 Thu, 27 Apr 2023 10:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682616226; x=1685208226;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xpoIvyURHM/FAEchAR0kfyfAfn/d2zPSJeaC6DKJIRA=;
 b=ge2/IcfFhkn+BJhAnkroymNzEHFFScqizUrPXMYaxBhN8F6iAZFf/wkFRrRgbJ1Z7L
 pv8HiX9vZXal4ZKtlw34wX/MIVMvPeFshdPeYu7W6LyxLbupiGriQdJ/f6Lhz9GlYab+
 KFt4OeCcpF1/3YG/82hGzZjqgvt5asn5vSUd098Af8Gr7nALmN5wNbx8G0jeuxH5Q33f
 3MU1amgI+YncGdCHQluCrrDTbE3zz1B8WPjpnFb/rJYCS24uJGHZdbRwijG3WuMdDB/b
 Q9pzpjA/Gd1AXuPHZNSe4rVAsYMbyt5dEzZZChlzcilNNkXCou2JqzT9oAh1coo2hEQ7
 Bz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682616226; x=1685208226;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xpoIvyURHM/FAEchAR0kfyfAfn/d2zPSJeaC6DKJIRA=;
 b=IkDZSwqo+HQ9KHiU0pBcIdzwcvf/fBX3+oMIewTuD0hiEjdpCMAsqOOny/4EfShnge
 0tts+NJjkLFS71Ci+DQvnJVw3gQjA8LvnACTcRaj7EWKtnUowewTg89pDET4qBg3P3ZQ
 1iXleVqIp6odje8cFx0NaRW478ijAY9OFXUeug+gbehQpNjgtq5NrnCsEBsPNa4RIuh5
 EnnRRI85JN0da8ou1K5lrKhcrSzOA+lbvU+HgZKoUtEloyiU+hxaY9hDtUSrE9ao0StF
 Qtvs+Y314tAAY5nTALHV7ePGrl5lG444o8XovMfAobSjpWhOjPOego+dITTDrN+FnMhD
 7Elw==
X-Gm-Message-State: AC+VfDzlBRFaA9KiWpLBLFKQEKJqS4RV2cjXTOGJVgEz16SpCr1KwBW5
 42nSeyrscakl/a+DOgZXbliwRluVJ8QOeqw/D0I=
X-Google-Smtp-Source: ACHHUZ7SB0L6ue0NnR2O6b1BJgBPhTYWCVzKOqS35cHvnHYHpR/lljvaJGRk0Gmuos5g5EPA2y1ajg==
X-Received: by 2002:a17:903:1c8:b0:1a6:b496:4053 with SMTP id
 e8-20020a17090301c800b001a6b4964053mr2590277plh.59.1682616225964; 
 Thu, 27 Apr 2023 10:23:45 -0700 (PDT)
Received: from fedlinux.. ([106.84.128.101]) by smtp.gmail.com with ESMTPSA id
 x12-20020a65538c000000b0050bc03741ffsm11698712pgq.84.2023.04.27.10.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 10:23:45 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: dlemoal@kernel.org, dmitry.fomichev@wdc.com,
 Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 hare@suse.de, Fam Zheng <fam@euphon.net>,
 Stefano Garzarella <sgarzare@redhat.com>, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v10 0/4] Add zone append write for zoned device
Date: Fri, 28 Apr 2023 01:23:35 +0800
Message-Id: <20230427172339.3709-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x62e.google.com
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

This patch series add zone append operation based on the previous
zoned device support part. The file-posix driver is modified to
add zone append emulation using regular writes.

v9:
- address review comments [Stefan]
  * fix get_zones_wp() for wrong offset index
  * fix misuses of QEMU_LOCK_GUARD()
  * free and allocate wps in refresh_limits for now

v8:
- address review comments [Stefan]
  * fix zone_mgmt covering multiple zones case
  * fix memory leak bug of wps in refresh_limits()
  * mv BlockZoneWps field from BlockLimits to BlockDriverState
  * add check_qiov_request() to bdrv_co_zone_append

v7:
- address review comments
  * fix wp assignment [Stefan]
  * fix reset_all cases, skip R/O & offline zones [Dmitry, Damien]
  * fix locking on non-zap related cases [Stefan]
  * cleanups and typos correction
- add "zap -p" option to qemuio-cmds [Stefan]

v6:
- add small fixes

v5:
- fix locking conditions and error handling
- drop some trival optimizations
- add tracing points for zone append

v4:
- fix lock related issues[Damien]
- drop all field in zone_mgmt op [Damien]
- fix state checks in zong_mgmt command [Damien]
- return start sector of wp when issuing zap req [Damien]

v3:
- only read wps when it is locked [Damien]
- allow last smaller zone case [Damien]
- add zone type and state checks in zone_mgmt command [Damien]
- fix RESET_ALL related problems

v2:
- split patch to two patches for better reviewing
- change BlockZoneWps's structure to an array of integers
- use only mutex lock on locking conditions of zone wps
- coding styles and clean-ups

v1:
- introduce zone append write

Sam Li (4):
  file-posix: add tracking of the zone write pointers
  block: introduce zone append write for zoned devices
  qemu-iotests: test zone append operation
  block: add some trace events for zone append

 block/block-backend.c              |  61 ++++++++
 block/file-posix.c                 | 230 ++++++++++++++++++++++++++++-
 block/io.c                         |  27 ++++
 block/io_uring.c                   |   4 +
 block/linux-aio.c                  |   3 +
 block/raw-format.c                 |   8 +
 block/trace-events                 |   2 +
 include/block/block-common.h       |  14 ++
 include/block/block-io.h           |   4 +
 include/block/block_int-common.h   |   8 +
 include/block/raw-aio.h            |   4 +-
 include/sysemu/block-backend-io.h  |   9 ++
 qemu-io-cmds.c                     |  75 ++++++++++
 tests/qemu-iotests/tests/zoned     |  16 ++
 tests/qemu-iotests/tests/zoned.out |  16 ++
 15 files changed, 474 insertions(+), 7 deletions(-)

-- 
2.40.0


