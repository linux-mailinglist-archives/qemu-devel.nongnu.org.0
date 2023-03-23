Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1296C5EB4
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 06:21:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfDND-0005PB-Nl; Thu, 23 Mar 2023 01:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfDNB-0005Os-27; Thu, 23 Mar 2023 01:20:25 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfDN9-0000LH-0V; Thu, 23 Mar 2023 01:20:24 -0400
Received: by mail-pl1-x634.google.com with SMTP id o2so13893072plg.4;
 Wed, 22 Mar 2023 22:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679548820;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Sw8y+lz6btt0QL0iNKlzX2XvwowbosbQ+6qL2nE1iEk=;
 b=Ads8NKI3DzJRtKF+bvAKbx6AVxgzEyWZtN6v3yxcKrbYJQnPEW9O82IYHpQSc8xU/p
 Qk3u+qmlja4VNb5JHwlr2vclFY12SKzud8AfB/JYwopObly20dQezWtO+eQIcBoE+uYr
 Tv1USgWVZf8oDFVkYW8hFPNQ7A9W0eoCAFj3Rd7nUb0k/KGa8cQ0qgAqn94kppyys2AY
 nD5ABahM+i1V2peB+TadXugn1VzKWp1ZqSTTU09tPMJSWvop4KWNgTTJXlPE1U+1Z0Zc
 PHP0SrEVPI94Jvurm/rlmBHrYXxPDDUJqaLkQy254t+xIQcIVnpdDbVn5xx1bQE3dpdx
 jW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679548820;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sw8y+lz6btt0QL0iNKlzX2XvwowbosbQ+6qL2nE1iEk=;
 b=klFu+P11WHF+7WgKoLz9JMxhIzs3egKtExxOXZgSInJM/mtixk+K1WqdQ4Ilr9F5zW
 Cau4Z1bi/BsZgiTTlnCajp3AnDlPBsqtj0Vgeu7xBc86F/KSZcIqKZ+ujAHr2swRw6J9
 GgGJ2NDjYeuBw5NPxG59r9BkkSabwwaSNqRTO2+ERzfk5YMJSqSvlj393t1i1GQWYZ9m
 5wjWMw9oYjRuxIT7fKlucSHm90jU5uJdQ8l2GY9zNGDlNxX87K+QjFPyDfnH2sTuJlM+
 kMdjii0WqQsGqvGHz0KtaX/M07vJ2zBcvJt/ARMjWGKPTkQhB544PAq/ta6/7wJhbRM5
 rObQ==
X-Gm-Message-State: AO0yUKUYFO+II+o63rXa1nioA21PFEpuw4CxwUhETBCiaZHNFUQRUxrc
 /P7M6JFK7SVd/coIZF/bjxKvyGNRhNOteGvr3XM=
X-Google-Smtp-Source: AK7set/VLUJKp3q2jK18iHe8zwSc24APD5t1RC2ICB09RHk0CK23fgMaDD/QGEOiaoftKZ34AJbX2A==
X-Received: by 2002:a17:90b:3907:b0:23d:4e9d:2eb0 with SMTP id
 ob7-20020a17090b390700b0023d4e9d2eb0mr6080055pjb.36.1679548819792; 
 Wed, 22 Mar 2023 22:20:19 -0700 (PDT)
Received: from fedlinux.. ([106.84.129.82]) by smtp.gmail.com with ESMTPSA id
 c10-20020a170902b68a00b0019edf07eb06sm11428073pls.122.2023.03.22.22.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 22:20:19 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 hare@suse.de, Fam Zheng <fam@euphon.net>, dmitry.fomichev@wdc.com,
 damien.lemoal@opensource.wdc.com, Julia Suvorova <jusual@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-block@nongnu.org,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v7 0/4] Add zone append write for zoned device
Date: Thu, 23 Mar 2023 13:19:03 +0800
Message-Id: <20230323051907.5948-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x634.google.com
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
 qemu-io-cmds.c                     |  75 ++++++++++
 tests/qemu-iotests/tests/zoned     |  16 +++
 tests/qemu-iotests/tests/zoned.out |  16 +++
 15 files changed, 457 insertions(+), 8 deletions(-)

-- 
2.39.2


