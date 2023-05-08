Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF696F9EEC
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 07:16:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvtDt-0001Xx-8Z; Mon, 08 May 2023 01:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pvtDl-0001Xg-Po; Mon, 08 May 2023 01:15:37 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pvtDk-00028y-5H; Mon, 08 May 2023 01:15:37 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-51b0f9d7d70so3818985a12.1; 
 Sun, 07 May 2023 22:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683522934; x=1686114934;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EMykj2EmHMziHUoH7jDYU9t+ZnATlY7mnpZErJBXZl0=;
 b=QH1Sd3egCtMi5T5zRwyTBrSXBaqMDOGImzGOpY798TNvWmaPrp1WeUwg88fw7S0AQL
 dy0cDaaBucAwYUMmQBq4x+EWb9jJQHile3GzhA/lrkmtTfEE/e8EjxRc9bZvxv3HgPXM
 Dl5Gds/JNp3Q6cIksjC3ZvuJNUt41ok2NzWFD6JYpBDN9HkL0VD5U3oeWt8jFnDCn/R9
 dSffv+m+1vstvvpSurVpCob8uTLA3ErECEiDEWHCqOgrdFQSoTYTj58igSCskAd/0RMo
 gAC6W9U5cKuQ0cKENP2qgQtZR9j5WXjsmVrY5aVoqt/xbTxJe+XcMkMTT3bkX3xrxh0v
 taUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683522934; x=1686114934;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EMykj2EmHMziHUoH7jDYU9t+ZnATlY7mnpZErJBXZl0=;
 b=UnS+3iE2bd1BAqznWB5aJxyRiljgMD0NyH+SMZPmzDh+8QCEghOw98iu/D+oaG+TFj
 xY3prrc2oZjMWpbHV+divPGuZyOtkBCG8f7QPKiWTJPYgtpdpm7SmSmv+fcXku37kavT
 JMzyuORpQQ+ovGSR9qdzyBOt20qmzqW6CKYr1zzO8UQkBZ+8BWT1M1BLtVnh0rFMtoXs
 rgOtl/wiPwl/cHZVPo1s6d2gOUWNvEPgvZ51ylX+TKBAxw/MpZPW9brLB7A1/CBRBePy
 OwBK0D3xxvMg31LK4cGM6NEucn0/RLwXo6nTVb6HVa0TybMSsgJmQLvBIj3Y6LZJjKZ1
 KUIA==
X-Gm-Message-State: AC+VfDwVLZRJ75AVbQnQom9Ylz3dRdiFO0xiS+f/zl1O80nJwrXr71aK
 X9MGdS6Wo1q4djAha+vu797XCoCHKgFbJDjW
X-Google-Smtp-Source: ACHHUZ46AfM3n+gwC4jsuSS+0H2gzd5ZTdusrpOlD/AaqK3xfF2p4vrYL8cheQHNANh2QrTEseOKoA==
X-Received: by 2002:a05:6a21:78a7:b0:ff:d067:b83 with SMTP id
 bf39-20020a056a2178a700b000ffd0670b83mr6950152pzc.37.1683522933324; 
 Sun, 07 May 2023 22:15:33 -0700 (PDT)
Received: from fedlinux.. ([106.84.128.239]) by smtp.gmail.com with ESMTPSA id
 fh11-20020a17090b034b00b00246aba3ebabsm3407140pjb.45.2023.05.07.22.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 22:15:32 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: dlemoal@kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 dmitry.fomichev@wdc.com, Fam Zheng <fam@euphon.net>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 hare@suse.de, Hanna Reitz <hreitz@redhat.com>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v11 0/4] Add zone append write for zoned device
Date: Mon,  8 May 2023 13:15:06 +0800
Message-Id: <20230508051510.177850-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.40.0
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch series add zone append operation based on the previous
zoned device support part. The file-posix driver is modified to
add zone append emulation using regular writes.

v10-v11:
- fix CI issues [Stefan]

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


