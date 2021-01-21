Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 859922FF7CB
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 23:16:17 +0100 (CET)
Received: from localhost ([::1]:37708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2iFU-00048d-7O
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 17:16:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2i8m-0006GN-RG; Thu, 21 Jan 2021 17:09:20 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:33078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2i8l-0000I7-3F; Thu, 21 Jan 2021 17:09:20 -0500
Received: by mail-pl1-x631.google.com with SMTP id b8so2113810plx.0;
 Thu, 21 Jan 2021 14:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=bq+9TlZDPmcd0+FhmZAMl8oKMrKDh63UUHnvxWT3cm0=;
 b=qK+/e7SwOTdGIh7wpFdVaVIPHyYuhZZhn8qTaVB8CYknQbi7qRKmX4h/GrhoKt1NsK
 jm+xGmdySDQ/uDSzYpNEJJ+IOf8DjV9qyljwjoXB4JMm14Vi0FUUWnwCfpMiSpU5hK4E
 hl2l6i5JIjRgJWXkTtKRgWl6U8nRYtG0sGZ7vq2F4ILzq53l7BqBkwBr20fcpfUF4Js9
 Epnf6B3UMBK2uuvfsK+pi3+clJdmZeJLkhHWZ7YvSguqOnEoxJ28UcQZQLs4jmfFFwSH
 m+s2pQUneNlIjXxEMILYFeq3FCJ77r9k/yhdHJvvE5yfdoLCBFXWQ5MgqM81aokAQOYz
 mjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=bq+9TlZDPmcd0+FhmZAMl8oKMrKDh63UUHnvxWT3cm0=;
 b=nqN9zWmBHsyprDWl6K9nfl0wxCUhTVSuyDZAjvrYvp2nvunrJfeEPmsMzVE7l0hP7r
 wgOvjTwTFiP8TqZpbKiZqKPJTZt0iV7f9kgWhb3+lttjZQVA0ksR7kgx+Cwt4Uf6xWRc
 s45ev5OTvPifOU+iWKuIbX7tuOEAD2g23iPL9frB2kdh0AxfhUn5sDBFHIzoVHxAz/CS
 auU38bdsOg4P4w9yNfUimPWbX3LQ8WhB/ufFa+YjKBCHvklHXRHfeuML+ywhAJHita0K
 cBylNpgJrUEvyegCgqQlaXcQJGbiv3T++kYaUf3qWlIHOgnlUB0HNxF2P0u4G17wKnKU
 HmHQ==
X-Gm-Message-State: AOAM5313SiZHD3l72DtqjK4F3+VjtlR79GEXwrV89Xyic3vN0jivKWuh
 TVCPkwszHPDrlO+ReFzDvk8/OvDfCSgUEg==
X-Google-Smtp-Source: ABdhPJz8JHMS7ebk1dGMWffu64IohA2Zc0k7KPsahCVZ/QBj1JyQ8cd87gcdxPKtQ34Jvn9quN6KEw==
X-Received: by 2002:a17:90a:5209:: with SMTP id v9mr1729781pjh.8.1611266956737; 
 Thu, 21 Jan 2021 14:09:16 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id c8sm5584308pfo.148.2021.01.21.14.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 14:09:16 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V4 0/6] hw/block/nvme: support multi-path for ctrl/ns
Date: Fri, 22 Jan 2021 07:09:02 +0900
Message-Id: <20210121220908.14247-1-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x631.google.com
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

This series is fourth series for the support of NVMe subsystem scheme
with multi-controller and namespace sharing in a subsystem.

This time, I've removed 'detached' scheme introduced in the previous
series out of this series to focus on subsystem scheme in ths series.
The attach/detach scheme will be introduced in the next series with
ns-mgmt functionality.

Here's an example of how-to:

  # Specify a subsystem
  -device nvme-subsys,id=subsys0 \
  -device nvme,serial=foo,id=nvme0,subsys=subsys0 \
  -device nvme,serial=bar,id=nvme1,subsys=subsys0 \
  -device nvme,serial=baz,id=nvme2,subsys=subsys0 \
  -device nvme-ns,id=ns1,drive=drv10,nsid=1,subsys=subsys0 \
  -device nvme-ns,id=ns2,drive=drv11,nsid=2,bus=nvme2 \
  \
  # Not specify a subsystem
  -device nvme,serial=qux,id=nvme3 \
  -device nvme-ns,id=ns3,drive=drv12,nsid=3,bus=nvme3 \

# nvme list -v
  NVM Express Subsystems

  Subsystem        Subsystem-NQN                                                                                    Controllers
  ---------------- ------------------------------------------------------------------------------------------------ ----------------
  nvme-subsys1     nqn.2019-08.org.qemu:subsys0                                                                     nvme0, nvme1, nvme2
  nvme-subsys3     nqn.2019-08.org.qemu:qux                                                                         nvme3

  NVM Express Controllers

  Device   SN                   MN                                       FR       TxPort Address        Subsystem    Namespaces      
  -------- -------------------- ---------------------------------------- -------- ------ -------------- ------------ ----------------
  nvme0    foo                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:06.0   nvme-subsys1 nvme1c0n1
  nvme1    bar                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:07.0   nvme-subsys1 nvme1c1n1
  nvme2    baz                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:08.0   nvme-subsys1 nvme1c2n1, nvme1c2n2
  nvme3    qux                  QEMU NVMe Ctrl                           1.0      pcie   0000:00:09.0   nvme-subsys3 nvme3c3n1

  NVM Express Namespaces

  Device       NSID     Usage                      Format           Controllers     
  ------------ -------- -------------------------- ---------------- ----------------
  nvme1n1      1        134.22  MB / 134.22  MB    512   B +  0 B   nvme0, nvme1, nvme2
  nvme1n2      2        268.44  MB / 268.44  MB    512   B +  0 B   nvme2
  nvme3n1      3        268.44  MB / 268.44  MB    512   B +  0 B   nvme3

Thanks,

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
 hw/block/nvme-subsys.c | 109 +++++++++++++++++++++++++++++++++++++++++
 hw/block/nvme-subsys.h |  32 ++++++++++++
 hw/block/nvme.c        |  77 ++++++++++++++++++++++++++---
 hw/block/nvme.h        |   4 ++
 include/block/nvme.h   |   8 +++
 8 files changed, 249 insertions(+), 13 deletions(-)
 create mode 100644 hw/block/nvme-subsys.c
 create mode 100644 hw/block/nvme-subsys.h

-- 
2.17.1


