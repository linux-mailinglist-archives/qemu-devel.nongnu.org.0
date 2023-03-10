Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834DB6B3C22
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 11:32:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paa1w-0007QX-5q; Fri, 10 Mar 2023 05:31:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1paa1t-0007Pw-0a; Fri, 10 Mar 2023 05:31:17 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1paa1r-0004Cw-Dq; Fri, 10 Mar 2023 05:31:16 -0500
Received: by mail-pj1-x1036.google.com with SMTP id l1so4912579pjt.2;
 Fri, 10 Mar 2023 02:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678444273;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J5zvMEkKxMvwcJeWiEaB9PGwSTdC75/0lDF7wNCkKeA=;
 b=eNZed2LqNoJ070SpvaV1758ATi09C72rrZVBqqI5QFD1mPDQEWnQHtOUIVHTwOZUdx
 YTAJd+LYi86Zt0/C6acXCs+Tk/0ZmuKFjJ7/cvlg9AW7K9BI765WPK+N+Gpe4BUY1ebq
 eWbXTfQMv2Z6IqHhDGBx8kUz9VJZXEa7v/GC+I389TbroSFOJyFyIF66L71LYKbHwNZY
 nqiEGVqfTDOEH9qLFo3jE/zJ+3EqBt5iMnhPjn1c1UBAB36PM3SUfbFtePJHzBuUZrYP
 xkcm5rjycbmnpyNDkeRO5Igb+Z0K0dpsFpTlzhjU0FNBAo4x2T9zmSBG/HE9919V0bzu
 j/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678444273;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J5zvMEkKxMvwcJeWiEaB9PGwSTdC75/0lDF7wNCkKeA=;
 b=dm2NCdh8iAbXymyzUuBE8Fqik2wrS+8jum1KaILNPnkZbdbRSoqzQIO6e7yuLlkjlS
 4Jkg+7PKqMwiRF90IwrnNLV/6tqm7hzTlMWkl4Qmcj5yoE/WhT6X9KJcRr5r2RHpZey5
 bNmT09nB6OfIR1keoFZ8PjSs+WTezv6CeyGHsHzk/35hFNQFljwAJSEW8sLM3ezlInx6
 2LCxq84t6v9fLOXwV1D97HzxSwJTvJzmZ8zOjfM4goNgxV45Er2IUN+MQBCdLzctOAev
 5jE1vOA0lF5UgbAzkMJDZ9ZP9QZ5kubWl/pcRBQk7WXU6rVA8Ge0vTCdVd3FcOMJbR/o
 oz+g==
X-Gm-Message-State: AO0yUKUTjGqCANQCU6pwJcCGR8ATuJhpcsUfm2FrcNcD4Y7eWeRxZ57V
 bTVwnLIL6hYdMzVv988tOm4tt+R7YCXXEehD4WQ=
X-Google-Smtp-Source: AK7set+dzNimBLRPwKzIk9L8VUUguI2AZru+kGdbrT1qm8W/EP0/g5jNbYzykaC2MU7qx4QSg4tD3Q==
X-Received: by 2002:a17:903:283:b0:19e:72cb:ff83 with SMTP id
 j3-20020a170903028300b0019e72cbff83mr30144355plr.8.1678444272479; 
 Fri, 10 Mar 2023 02:31:12 -0800 (PST)
Received: from fedlinux.. ([106.84.129.9]) by smtp.gmail.com with ESMTPSA id
 ke15-20020a170903340f00b0019a96d3b456sm1146930plb.44.2023.03.10.02.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 02:31:12 -0800 (PST)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 dmitry.fomichev@wdc.com, qemu-block@nongnu.org, stefanha@redhat.com,
 hare@suse.de, Julia Suvorova <jusual@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 damien.lemoal@opensource.wdc.com, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v6 0/4] Add zone append write for zoned device
Date: Fri, 10 Mar 2023 18:31:02 +0800
Message-Id: <20230310103106.62124-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1036.google.com
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
 block/file-posix.c                 | 212 ++++++++++++++++++++++++++++-
 block/io.c                         |  21 +++
 block/io_uring.c                   |   4 +
 block/linux-aio.c                  |   3 +
 block/raw-format.c                 |   8 ++
 block/trace-events                 |   2 +
 include/block/block-common.h       |  14 ++
 include/block/block-io.h           |   4 +
 include/block/block_int-common.h   |   8 ++
 include/block/raw-aio.h            |   4 +-
 include/sysemu/block-backend-io.h  |   9 ++
 qemu-io-cmds.c                     |  65 +++++++++
 tests/qemu-iotests/tests/zoned.out |   7 +
 tests/qemu-iotests/tests/zoned.sh  |   9 ++
 15 files changed, 422 insertions(+), 8 deletions(-)

-- 
2.39.2


