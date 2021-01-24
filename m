Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0A2301949
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 04:02:28 +0100 (CET)
Received: from localhost ([::1]:32924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3VfX-0006sk-4a
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 22:02:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l3VYO-0000By-Lh; Sat, 23 Jan 2021 21:55:04 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:41573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l3VYM-0003ej-PI; Sat, 23 Jan 2021 21:55:04 -0500
Received: by mail-pf1-x429.google.com with SMTP id q20so6333721pfu.8;
 Sat, 23 Jan 2021 18:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=O8ZFHm8V64q+VDmv5rwpQQc+cxy7B8AJUtKk+IYPL80=;
 b=O/ofFi31oam/LOiWEKOwAHCM6aKTSnVqiYU6M6OFaZOtsnOvBoXUgTrBmbBgbdAeuT
 bLIBgt7JIdfZrHciajDhh7sZTNDAc4pQHnCpI1Mhcd8Byy7rJdpuc3Znqn6BLa3nY4wJ
 +9Fu4vCHBR5dpYdfJdqK9un/tkbWjLXzhcGaj78SxL8c63oAaJxF/52Zi87BN5E+V/o6
 D+clTRZTEgmG7nvUOkE3eWpWq1IWYgososYHDrpU1HdFlaxfi5apiQjwYs/R8R7uci4y
 5KbnXhxN41Qykl4ogKW2b7e+PHted9sX9PBxyX1FAn/mi0VZwo9U0WVBn3cWUg2elPMO
 Y5dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=O8ZFHm8V64q+VDmv5rwpQQc+cxy7B8AJUtKk+IYPL80=;
 b=cL1ax5yHax77vn5K9ZwECcuZS32YJXPJe74kT0f/gqglgkMVD/tWOlTUPPZxj59uka
 SAzGiuDSnfltlbqlvBGmqxSkR+NghewruhBIkyqwsiVOwGwi18uvlq80OlBZfxTUg3MV
 KaJubM7QY3l6nDjRnGR1vb8dKaFFAi/B+30ZQlFN8UMXFXoDqKUPH/k58XakTVxFOi1D
 JOIz1LOrUZ6piBD9hzTQv+qnhsZRXeOpB8ZGz6q0arzgLXz4ohD2E271JOAsP1RU2FtE
 4GBqwKLSTBBjABezgQvB/Dl7T/rsvOJTdoh302uVO3jqk50jxU8JXKElvHYAyT8sz8R7
 Kaqg==
X-Gm-Message-State: AOAM531WEFK9hqIyVpswBQa5G1XcoMnoY96BTdxX94SDLGfUGqVs6yvS
 Dg09p/s2hpgzNwjJJOA/Y0vQvegUg/pBaw==
X-Google-Smtp-Source: ABdhPJz9KWLQw+bvOPgZ1CFjzeHMwnnFAfi3qAf4OSnZPcjBlfp9BA7OI9+rmztE8Mbanrl1FIHoqw==
X-Received: by 2002:a62:86c4:0:b029:1b8:131e:540d with SMTP id
 x187-20020a6286c40000b02901b8131e540dmr12136096pfd.21.1611456900313; 
 Sat, 23 Jan 2021 18:55:00 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id 77sm314842pfx.130.2021.01.23.18.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 18:54:59 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V6 0/6] hw/block/nvme: support multi-path for ctrl/ns
Date: Sun, 24 Jan 2021 11:54:44 +0900
Message-Id: <20210124025450.11071-1-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

This is sixth patch series for the support of NVMe subsystem scheme with
multi-controller and namespace sharing in a subsystem.

This version has a fix in nvme_init_ctrl() when 'cntlid' is set to the
Identify Controller data structure by making it by cpu_to_le16() as
Keith reviewed.

Here's test result with a simple 'nvme list -v' command from this model:

  -device nvme-subsys,id=subsys0 \
  -device nvme,serial=foo,id=nvme0,subsys=subsys0 \
  -device nvme,serial=bar,id=nvme1,subsys=subsys0 \
  -device nvme,serial=baz,id=nvme2,subsys=subsys0 \
  -device nvme-ns,id=ns1,drive=drv10,nsid=1,subsys=subsys0 \
  -device nvme-ns,id=ns2,drive=drv11,nsid=2,bus=nvme2 \
  \
  -device nvme,serial=qux,id=nvme3 \
  -device nvme-ns,id=ns3,drive=drv12,nsid=3,bus=nvme3 \
  \
  -device nvme-subsys,id=subsys1 \
  -device nvme,serial=quux,id=nvme4,subsys=subsys1 \
  -device nvme-ns,id=ns4,drive=drv13,nsid=1,subsys=subsys1,zoned=true \

  root@vm:~/work# nvme list -v
  NVM Express Subsystems

  Subsystem        Subsystem-NQN                                                                                    Controllers
  ---------------- ------------------------------------------------------------------------------------------------ ----------------
  nvme-subsys1     nqn.2019-08.org.qemu:subsys0                                                                     nvme0, nvme1, nvme2
  nvme-subsys3     nqn.2019-08.org.qemu:qux                                                                         nvme3
  nvme-subsys4     nqn.2019-08.org.qemu:subsys1                                                                     nvme4

  NVM Express Controllers

  Device   SN                   MN                                       FR       TxPort Address        Subsystem    Namespaces
  -------- -------------------- ---------------------------------------- -------- ------ -------------- ------------ ----------------
  nvme0    foo                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:06.0   nvme-subsys1 nvme1c0n1
  nvme1    bar                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:07.0   nvme-subsys1 nvme1c1n1
  nvme2    baz                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:08.0   nvme-subsys1 nvme1c2n1, nvme1c2n2
  nvme3    qux                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:09.0   nvme-subsys3 nvme3n1
  nvme4    quux                 QEMU NVMe Ctrl                           1.0      pcie   0000:00:0a.0   nvme-subsys4 nvme4c4n1

  NVM Express Namespaces

  Device       NSID     Usage                      Format           Controllers
  ------------ -------- -------------------------- ---------------- ----------------
  nvme1n1      1        134.22  MB / 134.22  MB    512   B +  0 B   nvme0, nvme1, nvme2
  nvme1n2      2        268.44  MB / 268.44  MB    512   B +  0 B   nvme2
  nvme3n1      3        268.44  MB / 268.44  MB    512   B +  0 B   nvme3
  nvme4n1      1        268.44  MB / 268.44  MB    512   B +  0 B   nvme4

Thanks,

Since V5:
  - Fix endianness for 'cntlid' in Identify Controller data structure.
    (Keith)

Since V4:
  - Code clean-up to snprintf rather than duplicating it and copy.
    (Keith)
  - Documentation for 'subsys' clean-up.  (Keith)
  - Remove 'cntlid' param from nvme_init_ctrl().  (Keith)
  - Put error_propagate() in nvme_realize().  (Keith)

Since RFC V3:
  - Exclude 'deatched' scheme from this series.  This will be covered in
    the next series by covering all the ns-related admin commands
    including ZNS and ns-mgmt. (Niklas)
  - Rebased on nvme-next.
  - Remove RFC tag from this V4.

Since RFC V2:
  - Rebased on nvme-next branch with trivial patches from the previous
    version(V2) applied. (Klaus)
  - Fix enumeration type name convention with NvmeIdNs prefix. (Klaus)
  - Put 'cntlid' to NvmeCtrl instance in nvme_init_ctrl() which was
    missed in V2.
  - Added 'detached' parameter to nvme-ns device to decide whether to
    attach or not to controller(s) in the subsystem. (Klaus)
  - Implemented Identify Active Namespace ID List aprt from Identify
    Allocated Namespace ID List by removing fall-thru statement.

Since RFC V1:
  - Updated namespace sharing scheme to be based on nvme-subsys
    hierarchy.

Minwoo Im (6):
  hw/block/nvme: introduce nvme-subsys device
  hw/block/nvme: support to map controller to a subsystem
  hw/block/nvme: add CMIC enum value for Identify Controller
  hw/block/nvme: support for multi-controller in subsystem
  hw/block/nvme: add NMIC enum value for Identify Namespace
  hw/block/nvme: support for shared namespace in subsystem

 hw/block/meson.build   |   2 +-
 hw/block/nvme-ns.c     |  23 +++++++--
 hw/block/nvme-ns.h     |   7 +++
 hw/block/nvme-subsys.c | 106 +++++++++++++++++++++++++++++++++++++++++
 hw/block/nvme-subsys.h |  32 +++++++++++++
 hw/block/nvme.c        |  72 +++++++++++++++++++++++++---
 hw/block/nvme.h        |   4 ++
 include/block/nvme.h   |   8 ++++
 8 files changed, 242 insertions(+), 12 deletions(-)
 create mode 100644 hw/block/nvme-subsys.c
 create mode 100644 hw/block/nvme-subsys.h

-- 
2.17.1


