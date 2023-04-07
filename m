Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FC86DA9F7
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 10:19:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkhI3-0002VA-1p; Fri, 07 Apr 2023 04:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pkhI1-0002Us-Dg; Fri, 07 Apr 2023 04:17:45 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pkhHz-0006rq-0m; Fri, 07 Apr 2023 04:17:44 -0400
Received: by mail-pl1-x62a.google.com with SMTP id ix20so39507946plb.3;
 Fri, 07 Apr 2023 01:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680855460;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=inLnzSm0L5wawQRE7ZhDy8e9+fCFGx21qe7MZfi+qhY=;
 b=F7B1V6q47pOxOByz2Kd0P/ny29jhBxyqnw6x1Kpr2oSWI7vmiK9pqewQxukC6ojnUW
 zRlHMHkTCMdiJ1sg2MGv2k26OJ1c16prZRfMVSlNUc8ghW/p1WbFJ1kWFMSRfeCDad54
 KuIQ4AfYMNVF8UH0sTrsS3GTpSW3cmOLs55KU84v2gJbcl+gqBKMUmaMDw76R2WWEanQ
 BzYx0OeDGp9qM2u1kRhoZ3CHobz/5fuzJfm++FXWxzFAP2r6PDVosWUR7RtFf0CMY1Ap
 OU5kAUM9xWNO/Ciy6apJ9FrHSIeoUTQ2V8dCMWII2prVWzxHdGF3wK8Pu5TfJLextVA/
 OFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680855460;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=inLnzSm0L5wawQRE7ZhDy8e9+fCFGx21qe7MZfi+qhY=;
 b=RUmxaFLdktHerqymhZ7otfQtNdEEmQs63or/V/obUH6zD3PgT449FEMa6+nmPqvAFg
 DRTtMdz0qOaIsVdRXaJ7uf63rQAziO4q5CX9TSLAe+Wjc+sB0rtYscMNCILwosyMqN4I
 efEH8H5AsghidWMh6Pq145dvDWWzZDn473AKPntYFXm3OyXEc+o6G880QxQSOnpGOMQl
 MzmdUSXU2ptr+ZpvCWQO+1GDX4+65I4liibyVixzODf7yanRzDBBYlG2f4aUHk1yfeZB
 iymZ3wAJ8Tk7K1fTRCkuHf/UNT2t3RuezdMIREnIb4l+1TP1MjGWKuf293u3jo2sMM3S
 enEA==
X-Gm-Message-State: AAQBX9cjHweMurINcWF5uZ8DVi66/EG1CJDSFskWQoS/3dmrsbFefo4N
 1A9pbRfBPSaVuubvcWo4Y0E9zD50Qs2Ch9ym
X-Google-Smtp-Source: AKy350b/eWCfedWhmwY4RR1xXid9TVciWXYsWNxMuAkaAjGoB+/fy5r7mLPRHLoZISKeBPMtx9fyIg==
X-Received: by 2002:a17:903:2ce:b0:1a1:9666:7a30 with SMTP id
 s14-20020a17090302ce00b001a196667a30mr1660427plk.54.1680855459061; 
 Fri, 07 Apr 2023 01:17:39 -0700 (PDT)
Received: from fedlinux.. ([106.84.131.166]) by smtp.gmail.com with ESMTPSA id
 jh19-20020a170903329300b00199193e5ea1sm2484890plb.61.2023.04.07.01.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 01:17:38 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: dmitry.fomichev@wdc.com, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 damien.lemoal@opensource.wdc.com, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>, hare@suse.de,
 Hanna Reitz <hreitz@redhat.com>, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v9 0/4] Add zone append write for zoned device
Date: Fri,  7 Apr 2023 16:16:53 +0800
Message-Id: <20230407081657.17947-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
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

 block/block-backend.c              |  60 ++++++++
 block/file-posix.c                 | 226 ++++++++++++++++++++++++++++-
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
 15 files changed, 469 insertions(+), 7 deletions(-)

-- 
2.39.2


