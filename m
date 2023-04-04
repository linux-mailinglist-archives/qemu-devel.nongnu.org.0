Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836936D6769
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 17:34:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjieX-0004V1-LN; Tue, 04 Apr 2023 11:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pjieR-0004TF-IG; Tue, 04 Apr 2023 11:32:51 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pjieP-0005W6-UY; Tue, 04 Apr 2023 11:32:51 -0400
Received: by mail-pf1-x431.google.com with SMTP id l14so21700778pfc.11;
 Tue, 04 Apr 2023 08:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680622367;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oZ3OrMO07C+u/qpaa/OODOHDNM+STRq3HkuGIvKY/ZY=;
 b=oJGOPfytff2VqqIT6NCBzGXZuVcITZ9xIGMMkuv/slK8a2rHZfqKTFpzgGk848/v16
 fLrlmGKq1ZuDN4D/IgCO9B1Cbs0T0bVqk9heSJQBzqxcpsTi5l18jksMHUvbMu2+KfVx
 Rn8LSJE0E5aYKSELj18DxfBPU9Vi5PSYpy+YtO749ESUQQFU6386x9nErer+pMRajN8w
 zOhQyZQJRjoAz/TO+W9n3b3XTzLLxr37wuXFpG2eI9h7bAGHWHlmEa4Wxa4FFyx+zsrL
 0pfrp5GETGOPBWXwuNeUYwI3t0e5xAyNLomK4825NIcWmyH7xRD9WdIZxFfOmQw7qDh2
 zoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680622367;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oZ3OrMO07C+u/qpaa/OODOHDNM+STRq3HkuGIvKY/ZY=;
 b=C0shbhbiwV5HUk56KmSuD3bsOIQcsaF20siYTPivNmHkqFyef5VineD53h5x270ewq
 2ejLnC+ZBM8VVbvKFaAKAQxDMAqrjDk59ZlGQkuptN57vNjRgW5T/VbrJHYnxTfaD0+X
 jaZtL/pGsNNZU3gwzdZFyNaGihd/wwAHo+I0HZMVxVmquOi26b0UM8YDVJBs8DuRPWqb
 CT/ItAT/6zFGeKvM8wleUXQQT1SI+hCviIGSRrzZrkogJuwtwEBZvjqi7c7NPC75C2x2
 rUFyq0u5rP3M9gd/Z9eeN3zHRq1OI03DAeamNNr9WGhd96F9B52nsVFtMLLcx5yIH7Wu
 qgbg==
X-Gm-Message-State: AAQBX9cY44bd4V8oA8qQa+2tB6EuuvSxL+/icPBKBWSUVRJSrWuBDuTx
 yGTjZMDvSMqA+tO7N5y9RPdtU7D1j4VlfUAu
X-Google-Smtp-Source: AKy350ZmSccDSx3aAyJZ3D9+vbQJLXj2Bkj8booon9wa0yR2m892AZKHdLEudtVOaGkm2YNGL4lQTQ==
X-Received: by 2002:aa7:9423:0:b0:626:41d:db30 with SMTP id
 y3-20020aa79423000000b00626041ddb30mr2772791pfo.25.1680622367414; 
 Tue, 04 Apr 2023 08:32:47 -0700 (PDT)
Received: from fedlinux.. ([106.84.131.166]) by smtp.gmail.com with ESMTPSA id
 p11-20020a62ab0b000000b0059085684b54sm9231519pff.140.2023.04.04.08.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 08:32:47 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, hare@suse.de, Hanna Reitz <hreitz@redhat.com>,
 dmitry.fomichev@wdc.com, Julia Suvorova <jusual@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, damien.lemoal@opensource.wdc.com,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v8 0/4] Add zone append write for zoned device
Date: Tue,  4 Apr 2023 23:32:35 +0800
Message-Id: <20230404153239.32234-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-x431.google.com
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

This patch series add zone append operation based on the previous
zoned device support part. The file-posix driver is modified to
add zone append emulation using regular writes.

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

 block/block-backend.c              |  60 ++++++++
 block/file-posix.c                 | 221 ++++++++++++++++++++++++++++-
 block/io.c                         |  27 ++++
 block/io_uring.c                   |   4 +
 block/linux-aio.c                  |   3 +
 block/raw-format.c                 |   8 ++
 block/trace-events                 |   2 +
 include/block/block-common.h       |  14 ++
 include/block/block-io.h           |   4 +
 include/block/block_int-common.h   |   8 ++
 include/block/raw-aio.h            |   4 +-
 include/sysemu/block-backend-io.h  |   9 ++
 qemu-io-cmds.c                     |  75 ++++++++++
 tests/qemu-iotests/tests/zoned     |  16 +++
 tests/qemu-iotests/tests/zoned.out |  16 +++
 15 files changed, 464 insertions(+), 7 deletions(-)

-- 
2.39.2


