Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E35300292
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 13:10:56 +0100 (CET)
Received: from localhost ([::1]:50084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2vHD-0001tI-Hq
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 07:10:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2vER-0008MK-IC; Fri, 22 Jan 2021 07:08:04 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:40914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2vEI-0001rl-33; Fri, 22 Jan 2021 07:08:03 -0500
Received: by mail-pl1-x635.google.com with SMTP id q4so3064920plr.7;
 Fri, 22 Jan 2021 04:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=huKcIXLU7o5QAOXkN6b//nfzFBMXSvZ+KM2SoetyqRc=;
 b=pw4P/igxn+6d+KgoTjbkEANFvtWuMmKHbSs8vGAylOAiQjz9DXoG8PM3Toq4XQIh96
 zE1ZMHcHdpH0t/7L2ZFxmuLYW+im/vU2UcpPkqOzv2vBsj4gZIOd+ZZxsbNI+l6ySxk8
 KDY1PTkypV5lgA/rWJO6/3+mNQrFrmJ3R2lKlcn/ZrPHaF3dAU07tq/UDtXs9L4bV23n
 6WJzZgIsMBc0ZqhDc1CILB+p33geux5b6Ur07AfniIWhGdvx/yk9ra+FntNPpevpwh+z
 xbcZYdb+jpd08b4Q1H/WGNq7Q1jfCSqe0tpfHZk7kC1DkXl6g61O7MuVpmvH9Ws4SvBi
 T7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=huKcIXLU7o5QAOXkN6b//nfzFBMXSvZ+KM2SoetyqRc=;
 b=efXxWxgjI8nT7O6cLYESaItZbIHKsam79jnvJ9tOkXNrqRfy1uMiqZu1xaoszAc9EE
 ATzfZLYay9fiiHpchhJrqRyfYhEokuknAM7RGnYTq3KnpAKqlDftAhQZQB9u6MSIv0tX
 2q7x/58LsQlYHSt1d17rIyGWJjSq9Yg1cfTcrxP5/aTk1+ad39pdiFWhcijHRrXE+2FX
 6u7zjtGZD47pwQbrct7iLC0ZiUcwAcyypJNJuN7f99xn/L61peCO2shChWGDnyvVbDZH
 wluCZDDmi1bVVX6/d1/2z7JLssHiq5rnH1LF4xCbCJEcO4kZLLswwS5ri6qOQmiu1KDD
 vwgA==
X-Gm-Message-State: AOAM531AFGL0Uc6u5CZhVypuFhoFg0P4LubdB4romN2NumF3a1pocuIy
 xDZaa9lfr1vXJUukdUkEZgF0IwD1KtHJGA==
X-Google-Smtp-Source: ABdhPJznbPcRz217dqXmVM9eTIdbTDg9DmEDjW7mv5IzDoryjxzfqfo0ZEyB+yo8tSRYpSNcnKxtqA==
X-Received: by 2002:a17:902:7592:b029:dc:3c87:1c63 with SMTP id
 j18-20020a1709027592b02900dc3c871c63mr4556419pll.47.1611317271097; 
 Fri, 22 Jan 2021 04:07:51 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id mv17sm9104440pjb.17.2021.01.22.04.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 04:07:50 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V5 0/6] hw/block/nvme: support multi-path for ctrl/ns
Date: Fri, 22 Jan 2021 21:07:30 +0900
Message-Id: <20210122120736.5242-1-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x635.google.com
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

Here's fifth patch series for the support of NVMe subsystem scheme with
multi-controller and namespace sharing in a subsystem.

This series has applied review comments from the previous series,
mostly from Keith's review.  Thanks Keith!

Here's test result with a simple 'nvme list -v' command from this model
with adding a ZNS example with subsys.

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


