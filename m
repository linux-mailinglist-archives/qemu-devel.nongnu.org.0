Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7BA2F931C
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 15:56:31 +0100 (CET)
Received: from localhost ([::1]:55692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l19Ti-00061f-B7
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 09:56:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l19RC-0004MK-Kr; Sun, 17 Jan 2021 09:53:54 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:35786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l19RA-0003zX-Kj; Sun, 17 Jan 2021 09:53:54 -0500
Received: by mail-pl1-x632.google.com with SMTP id g3so7222684plp.2;
 Sun, 17 Jan 2021 06:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=5RivDP9pfYDAeSFA3NhFYlEUNX/2oOTG39yJNPSFV14=;
 b=m4RLchc2pTdPl9If1PVmgMXUGeAQ77P2/55c7rooh7pTIYXSaI9pKeGQKfXydg7IH/
 junvon+nBj9K8lufn/5vH8lN61G/On7PKvZSanNo5NavNrBNGQEQuhWMQFyK8rKYtdGw
 c0xo58EGJ6haxYzYNdfFyMqmAsxTdeF8VhGjF8SBx/cm8syJZhK4TiY6UmwQW1HGAd9U
 jG1ud1BtZlEebN6clDLLTT7ej+xt6inNguvqH3eE1ransDlWjqLMDPBr4x6Ac9ApGBQP
 HYYrysyOkBpSV/V9yyuAVKb9yaGSWiK9N93GAjqlOcE6UnpAurPhvrWZixs0fQmrtmu4
 RE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5RivDP9pfYDAeSFA3NhFYlEUNX/2oOTG39yJNPSFV14=;
 b=JCWPoGhL6VRwTNVFUgEUPa724ds1KYSb0qIms8+UZh7vgAmjZQKGtRG4WttbOOFVYX
 TKQFD+9fSlfL+PD8V+3xaQ4I10THt+3xklRQRoP/aD4Y1TvTN8SgMpCBbDXV5aztMkhx
 a3WI77B++/t/nta+IqV3AtpysHSsI7JyZz3PTY9gqf2HOLd4+8TvseejAuqi3OZjgDAL
 kiKaef3IuJCFFr7ApvwX+4LsiDTaMJZ/z9f8+h/B99/suygXGID2kUXfwEDfyzNZC+Jc
 X/SOCm76r9DI0wnBIGJepIrejwaJqjs/8a39xdksl2r8ZhIi9uDw5ltX0xbGUJCYcNAH
 oc1g==
X-Gm-Message-State: AOAM531eswoOoa5M+VbqSt06ip9KlSjcQyFMy5fgLVoz2GT1ZmpQ5ITn
 vCNvGeBEGQhgvA5S+ujUX30Qc85mRFQCZw==
X-Google-Smtp-Source: ABdhPJyw/ff/WBMRWgG29fqU7gxV1o3z2lA6jLwgZT8ZoH2x2aBhGnjGGKpZ4cEmy39k4ej4iOE2vg==
X-Received: by 2002:a17:90a:3e0c:: with SMTP id
 j12mr14163475pjc.193.1610895230066; 
 Sun, 17 Jan 2021 06:53:50 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id x127sm13143583pfb.74.2021.01.17.06.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 06:53:49 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [RFC PATCH V2 00/11] hw/block/nvme: support multi-path for ctrl/ns
Date: Sun, 17 Jan 2021 23:53:30 +0900
Message-Id: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x632.google.com
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

This patch series introduces NVMe subsystem device to support multi-path
I/O in NVMe device model.  Two use-cases are supported along with this
patch: Multi-controller, Namespace Sharing.

V1 RFC has been discussed with Klaus and Keith, I really appreciate them
for this patch series to have proper direction [1].

This patch series contains few start-up refactoring pathces from the
first to fifth patches to make nvme-ns device not to rely on the nvme
controller always.  Because nvme-ns shall be able to be mapped to the
subsystem level, not a single controller level so that it should provide
generic initialization code: nvme_ns_setup() with NvmeCtrl.  To do that,
the first five patches are to remove the NvmeCtrl * instance argument
from the nvme_ns_setup().  I'd be happy if they are picked!

For controller and namespace devices, 'subsys' property has been
introduced to map them to a subsystem.  If multi-controller needed, we
can specify 'subsys' to controllers the same.

For namespace deivice, if 'subsys' is not given just like it was, it
will have to be provided with 'bus' parameter to specify a nvme
controller device to attach, it means, they are mutual-exlusive.  To
share a namespace between or among controllers, then nvme-ns should have
'subsys' property to a single nvme subsystem instance.  To make a
namespace private one, then we need to specify 'bus' property rather
than the 'subsys'.

Of course, this series does not require any updates for the run command
for the previos users.

Plase refer the following example with nvme-cli output:

QEMU Run:
  -device nvme-subsys,id=subsys0 \
  -device nvme,serial=foo,id=nvme0,subsys=subsys0 \
  -device nvme,serial=bar,id=nvme1,subsys=subsys0 \
  -device nvme,serial=baz,id=nvme2,subsys=subsys0 \
  -device nvme-ns,id=ns1,drive=drv10,nsid=1,subsys=subsys0 \
  -device nvme-ns,id=ns2,drive=drv11,nsid=2,bus=nvme2 \
  \
  -device nvme,serial=qux,id=nvme3 \
  -device nvme-ns,id=ns3,drive=drv12,nsid=3,bus=nvme3

nvme-cli:
  root@vm:~/work# nvme list -v
  NVM Express Subsystems

  Subsystem        Subsystem-NQN                                                                                    Controllers
  ---------------- ------------------------------------------------------------------------------------------------ ----------------
  nvme-subsys1     nqn.2019-08.org.qemu:subsys0                                                                     nvme0, nvme1, nvme2
  nvme-subsys3     nqn.2019-08.org.qemu:qux                                                                         nvme3

  NVM Express Controllers

  Device   SN                   MN                                       FR       TxPort Address        Subsystem    Namespaces
  -------- -------------------- ---------------------------------------- -------- ------ -------------- ------------ ----------------
  nvme0    foo                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:06.0   nvme-subsys1 nvme1n1
  nvme1    bar                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:07.0   nvme-subsys1 nvme1n1
  nvme2    baz                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:08.0   nvme-subsys1 nvme1n1, nvme1n2
  nvme3    qux                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:09.0   nvme-subsys3

  NVM Express Namespaces

  Device       NSID     Usage                      Format           Controllers
  ------------ -------- -------------------------- ---------------- ----------------
  nvme1n1      1        134.22  MB / 134.22  MB    512   B +  0 B   nvme0, nvme1, nvme2
  nvme1n2      2        268.44  MB / 268.44  MB    512   B +  0 B   nvme2
  nvme3n1      3        268.44  MB / 268.44  MB    512   B +  0 B   nvme3

Summary:
  - Refactored nvme-ns device not to rely on controller during the
    setup.  [1/11 - 5/11]
  - Introduced a nvme-subsys device model. [6/11]
  - Create subsystem NQN based on subsystem. [7/11]
  - Introduced multi-controller model. [8/11 - 9/11]
  - Updated namespace sharing scheme to be based on nvme-subsys
    hierarchy. [10/11 - 11/11]

Since RFC V1:
  - Updated namespace sharing scheme to be based on nvme-subsys
    hierarchy.

Thanks,

[1] https://lists.gnu.org/archive/html/qemu-block/2021-01/msg00425.html

Minwoo Im (11):
  hw/block/nvme: remove unused argument in nvme_ns_init_zoned
  hw/block/nvme: open code for volatile write cache
  hw/block/nvme: remove unused argument in nvme_ns_init_blk
  hw/block/nvme: split setup and register for namespace
  hw/block/nvme: remove unused argument in nvme_ns_setup
  hw/block/nvme: introduce nvme-subsys device
  hw/block/nvme: support to map controller to a subsystem
  hw/block/nvme: add CMIC enum value for Identify Controller
  hw/block/nvme: support for multi-controller in subsystem
  hw/block/nvme: add NMIC enum value for Identify Namespace
  hw/block/nvme: support for shared namespace in subsystem

 hw/block/meson.build   |   2 +-
 hw/block/nvme-ns.c     |  40 ++++++++++------
 hw/block/nvme-ns.h     |   9 +++-
 hw/block/nvme-subsys.c | 101 +++++++++++++++++++++++++++++++++++++++++
 hw/block/nvme-subsys.h |  30 ++++++++++++
 hw/block/nvme.c        |  92 ++++++++++++++++++++++++++++++++-----
 hw/block/nvme.h        |   5 +-
 include/block/nvme.h   |   8 ++++
 8 files changed, 259 insertions(+), 28 deletions(-)
 create mode 100644 hw/block/nvme-subsys.c
 create mode 100644 hw/block/nvme-subsys.h

-- 
2.17.1


