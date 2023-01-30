Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38118680F8B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:54:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUVm-0003wi-Lc; Mon, 30 Jan 2023 08:47:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUVY-0003pP-Pa
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:47:42 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUVN-0003Wk-W5
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:47:34 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 rm7-20020a17090b3ec700b0022c05558d22so11119245pjb.5
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 05:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZP9EbbOqERE0MdfzZDkV0fvEoDB8QqADQMKnkCMa/+M=;
 b=ciZakKw8RdoJUiBKbk9cZMaEIMxnIhM6AdqCGWGC/PZ1TKzYi8cJbIMIM3Z2ywH3fl
 wphskMXWBuVxlroC9sLD66b12nyzSRPGZJayxV3lVxyfrC0cTAx/huuAUc+gca0kmjW2
 ZmVH9Ouduv62UJYhM/TI6hy/oouiOxT9hyLVhFiEio8PY+4/P1+FL1EHRlC+5UzbJAOP
 hhJWVHvIDmlkUA5csxztb/0sd0ce9ApTlOP8HJw83qn1w89avyqqJVgTR8v1qEX/ynUc
 awmgi3/Ti4ATJ4w6ejJQ/NlqFe9b/KN5p1LVf/lEGrBOVjZvav1VywZH2Mu7OeZ+ACR+
 Hn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZP9EbbOqERE0MdfzZDkV0fvEoDB8QqADQMKnkCMa/+M=;
 b=OnmJDGeVk8txP8AnA6VZUP66lQ3dz8im6Jp0iVvzZNbunR1mwe1pIjcG/JaX1P/dVW
 ReNmjFojtBK4oUBGHffsNZoeDW4hB7+tgnDZbzgc9+awbBqtYmu3XS0603IO1glGvEiv
 VkBuuj7qIUhz2Ux5UiVZFwNnDi0Wn4VRyqASK4IKTjZHLjZDpN/hpTDLPbJZFeABmYeV
 ZueeJafPtcqG8q6b6P/xUIOUTUgiKZnnoAoCKHZepUmj+kfIH41IUtz5mP5cBe5MhUCe
 kRY3efSh5PxlAxxTcyUpb9j/1ytgzWjouI5J7/DjGFY2RRrNj5OQdO2O5uIDnXIsPlRe
 2BjA==
X-Gm-Message-State: AFqh2kqFOv4iLVgCtKs78WqSryLyDIvEINk1ROaFL1whzGwx4e/2Nnor
 aD/eJO19gHcKPUhY7GShorH5AQ==
X-Google-Smtp-Source: AMrXdXscCv1lIOampE5a6nt6E4QyuJeFMcOVKGCNwQtQFm5jyWtNouNyWl8BNi1k1n7Fq4F/x3LJJw==
X-Received: by 2002:a17:902:b083:b0:194:d057:46e5 with SMTP id
 p3-20020a170902b08300b00194d05746e5mr36892931plr.62.1675086445125; 
 Mon, 30 Jan 2023 05:47:25 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a170902d34d00b0018bc4493005sm7815573plk.269.2023.01.30.05.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 05:47:24 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Alexander Bulekov <alxndr@bu.edu>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v4 00/28] e1000x cleanups (preliminary for IGB)
Date: Mon, 30 Jan 2023 22:46:47 +0900
Message-Id: <20230130134715.76604-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1030;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

We are adding a new device named igb, yet another Intel NIC. As the new
implementation derives from e1000e, overhaul e1000e implementation first.
e1000 has many commonalities with e1000e so we also apply the corresponding
changes to the device if possible.

This was spun off from:
https://patchew.org/QEMU/20230112095743.20123-1-akihiko.odaki@daynix.com/

The changes from the series are as follows:
- Fixed code alignment in e1000.c. (Philippe Mathieu-Daudé)
- "e1000: Configure ResettableClass" and e1000e's corresponding patch was based
  on the old version so they are now updated. (Philippe Mathieu-Daudé)
- Added "e1000e: Remove extra pointer indirection"

The series was composed on patches submitted earlier for e1000e. The below
are links to Patchew:
03: https://patchew.org/QEMU/20221103060103.83363-1-akihiko.odaki@daynix.com/
04: https://patchew.org/QEMU/20221125135254.54760-1-akihiko.odaki@daynix.com/
05: https://patchew.org/QEMU/20221119054913.103803-1-akihiko.odaki@daynix.com/
06: https://patchew.org/QEMU/20221119055304.105500-1-akihiko.odaki@daynix.com/
08 includes: https://patchew.org/QEMU/20221119060156.110010-1-akihiko.odaki@daynix.com/
10: https://patchew.org/QEMU/20221125140105.55925-1-akihiko.odaki@daynix.com/
11: https://patchew.org/QEMU/20221125142608.58919-1-akihiko.odaki@daynix.com/
13: https://patchew.org/QEMU/20221201095351.63392-1-akihiko.odaki@daynix.com/
14: https://patchew.org/QEMU/20221201100113.64387-1-akihiko.odaki@daynix.com/
15: https://patchew.org/QEMU/20230107143328.102534-1-akihiko.odaki@daynix.com/
20: https://patchew.org/QEMU/20230114025339.4874-1-akihiko.odaki@daynix.com/

V3 -> V4:
- Fixed iov cursor update in "hw/net/net_tx_pkt: Implement TCP segmentation".
- Fixed UDP checksumming in "hw/net/net_tx_pkt: Implement TCP segmentation".
- Added "hw/net/net_tx_pkt: Check the payload length".
- Added "e1000e: Do not assert when MSI-X is disabled later".

V2 -> V3:
- List tests/qtest/libqos/e1000e.h in MAINTAINERS. (Thomas Huth)

V1 -> V2:
- Rebased to commit fcb7e040f5c69ca1f0678f991ab5354488a9e192.
- Added "net: Check L4 header size".
- Added "e1000x: Alter the signature of e1000x_is_vlan_packet".
- Added "net: Strip virtio-net header when dumping".
- Added "hw/net/net_tx_pkt: Automatically determine if virtio-net header is
  used".
- Added "hw/net/net_rx_pkt: Remove net_rx_pkt_has_virt_hdr".
- Added "e1000e: Perform software segmentation for loopback".
- Added "hw/net/net_tx_pkt: Implement TCP segmentation"
- Added "MAINTAINERS: Add Akihiko Odaki as a e1000e reviewer".
- Added "MAINTAINERS: Add e1000e test files".

Akihiko Odaki (28):
  e1000e: Fix the code style
  hw/net: Add more MII definitions
  fsl_etsec: Use hw/net/mii.h
  e1000: Use hw/net/mii.h
  e1000: Mask registers when writing
  e1000e: Mask registers when writing
  e1000: Use more constant definitions
  e1000e: Use more constant definitions
  e1000: Use memcpy to intialize registers
  e1000e: Use memcpy to intialize registers
  e1000e: Remove pending interrupt flags
  e1000e: Improve software reset
  e1000: Configure ResettableClass
  e1000e: Configure ResettableClass
  e1000e: Introduce e1000_rx_desc_union
  e1000e: Set MII_ANER_NWAY
  e1000e: Remove extra pointer indirection
  net: Check L4 header size
  e1000x: Alter the signature of e1000x_is_vlan_packet
  net: Strip virtio-net header when dumping
  hw/net/net_tx_pkt: Automatically determine if virtio-net header is
    used
  hw/net/net_rx_pkt: Remove net_rx_pkt_has_virt_hdr
  e1000e: Perform software segmentation for loopback
  hw/net/net_tx_pkt: Implement TCP segmentation
  hw/net/net_tx_pkt: Check the payload length
  e1000e: Do not assert when MSI-X is disabled later
  MAINTAINERS: Add Akihiko Odaki as a e1000e reviewer
  MAINTAINERS: Add e1000e test files

 MAINTAINERS              |   4 +
 hw/net/e1000.c           | 254 ++++++++---------
 hw/net/e1000_regs.h      |  61 +---
 hw/net/e1000e.c          |  88 +++---
 hw/net/e1000e_core.c     | 588 ++++++++++++++++++++-------------------
 hw/net/e1000e_core.h     |  68 +++--
 hw/net/e1000x_common.c   |  12 +-
 hw/net/e1000x_common.h   |  56 ++--
 hw/net/fsl_etsec/etsec.c |  11 +-
 hw/net/fsl_etsec/etsec.h |  17 --
 hw/net/fsl_etsec/miim.c  |   5 +-
 hw/net/net_rx_pkt.c      |  12 +-
 hw/net/net_rx_pkt.h      |  20 +-
 hw/net/net_tx_pkt.c      | 332 ++++++++++++++++------
 hw/net/net_tx_pkt.h      |  27 +-
 hw/net/trace-events      |   5 +-
 hw/net/virtio-net.c      |   2 +-
 hw/net/vmxnet3.c         |  32 +--
 include/hw/net/mii.h     |  14 +-
 include/net/eth.h        |   5 -
 include/net/net.h        |   6 +
 net/dump.c               |  11 +-
 net/eth.c                |  27 --
 net/net.c                |  18 ++
 net/tap.c                |  16 ++
 25 files changed, 917 insertions(+), 774 deletions(-)

-- 
2.39.1


