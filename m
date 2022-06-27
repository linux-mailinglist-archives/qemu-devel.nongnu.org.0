Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1827355B493
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 02:21:48 +0200 (CEST)
Received: from localhost ([::1]:50616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5cVe-00013N-Q1
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 20:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o5cTe-0007Hl-F9; Sun, 26 Jun 2022 20:19:42 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:33593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o5cTd-0000aq-0u; Sun, 26 Jun 2022 20:19:42 -0400
Received: by mail-pg1-x531.google.com with SMTP id z14so7653465pgh.0;
 Sun, 26 Jun 2022 17:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hhtn3F1FpwB1cqvTLXGZXEA5q+CYpzZn1sPF5SV7S8E=;
 b=VgLICf+411mZXh8FXiaUL0T5kiGFSpqxaBbvCFeOSD3pEoVjETC9VGxqi8u7d6tEcc
 Tp0ftSV9JgEURzJPZ2z9U7Ds0P48bnp97Qo8l3Hb4WCfP9fFA27Ofr4RTocHTTrR1i6I
 q/db/uYFhYeKTSBAr5s0v7C17ORJhoFrLDnU6PENB3dst475HzVCYVr6fUP2i3906nUq
 nq/8EWxO3XBAMdON+7fuFMMSNVHH9o40W4PxETvTvKAfxA9QVQShaOStq+xXmq6l/xxk
 9MMFEQNgbCPFPA0R0bl3jKZlLmzTswm1TePdN1TuaD/n5rJRECmgfEcDRR6USpuZHAkH
 opdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hhtn3F1FpwB1cqvTLXGZXEA5q+CYpzZn1sPF5SV7S8E=;
 b=zzuAQ+l1gwXrmngRV48AFJFqLhouAL3WqGIoBTMK1KQSEh2kgXxJ1V2CEuP7qu9s6K
 iBAqN5S6FWgMXf/I1F+BCew9NdNjYu+RomHys+GsL5GLxZLTn5eczkz/vChbVBhP20Cq
 Fdkj4laLbs+m+so93Gt69OtcKZU+PY0RAA4ddVjwxGbRqNw/VWC+STvP5aSxbhdsUnnt
 qY7Y7Tw0JtdBAmsu2s1r+lCDZVLgYhuF1d+4umzNI9habusssuUqGFjO7F25OJ1g/zMv
 VrSJvtAhl2btzGrOis+RpDa+Yh7KOlreeaXMaB9J9ikeRtcWW8hkzcn4XM+CcHBWeYRW
 rxsg==
X-Gm-Message-State: AJIora/wMPVmD/+XpovM+ZfjQRq6HqHjLe1s2RDAZmFw6Cs0OXgdIIZj
 3nP4btLbr/KBCAfoCNBiK27gyBN7rj9vXw==
X-Google-Smtp-Source: AGRyM1sdZ5dfxDYPRSVAjaAvIAHkxKqzHgAYa1qA8sWpJ1/ZSPpNVbj9wAsJuyuV9LbK6tT8I1Ui2g==
X-Received: by 2002:a63:ee10:0:b0:40d:7f37:77c4 with SMTP id
 e16-20020a63ee10000000b0040d7f3777c4mr10006846pgi.28.1656289178654; 
 Sun, 26 Jun 2022 17:19:38 -0700 (PDT)
Received: from fedora.. ([106.84.130.34]) by smtp.gmail.com with ESMTPSA id
 e11-20020a6558cb000000b00408b89e4282sm5715294pgu.47.2022.06.26.17.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 17:19:38 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: hare@suse.de, Hanna Reitz <hreitz@redhat.com>, dmitry.fomichev@wdc.com,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, damien.lemoal@opensource.wdc.com,
 qemu-block@nongnu.org, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v3 0/5] *** Add support for zoned device ***
Date: Mon, 27 Jun 2022 08:19:12 +0800
Message-Id: <20220627001917.9417-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.35.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=faithilikerun@gmail.com; helo=mail-pg1-x531.google.com
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

*** This patch series adds support for zoned device to virtio-blk emulation. Zoned
Storage can support sequential writes, which reduces write amplification in SSD,
leading to higher write throughput and increased capacity.

v3:
- add block layer APIs resembling Linux ZoneBlockDevice ioctls (developing) ***

Sam Li (5):
  block: add block layer APIs resembling Linux ZonedBlockDevice ioctls.
  qemu-io: add zoned block device operations.
  file-posix: introduce get_sysfs_long_val for zoned device information.
  file-posix: introduce get_sysfs_str_val for device zoned model.
  qemu-iotests: add zone operation tests.

 block/block-backend.c             |  56 +++++
 block/coroutines.h                |   5 +
 block/file-posix.c                | 325 +++++++++++++++++++++++++++++-
 block/io.c                        |  21 ++
 include/block/block-common.h      |  43 +++-
 include/block/block-io.h          |  13 ++
 include/block/block_int-common.h  |  20 ++
 qemu-io-cmds.c                    | 121 +++++++++++
 tests/qemu-iotests/tests/zoned.sh |  49 +++++
 9 files changed, 645 insertions(+), 8 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/zoned.sh

-- 
2.35.3


