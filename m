Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6009685DF5
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 04:37:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN3uj-00069e-0Q; Tue, 31 Jan 2023 22:36:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN3uZ-00069N-V9
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:35:51 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN3uX-0000LA-Ma
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:35:51 -0500
Received: by mail-pl1-x62a.google.com with SMTP id jh15so8129030plb.8
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 19:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U3kai5XKxz+UjO9GWy6BfgzjWYG6rLULv76c8EJpynU=;
 b=xGyCH77wCGk/BLApjiR3JrwCiUgoIY8G8DiFWbFxw0CPnv8MY5ILQ8hVM/eDCeQCt3
 agtFN7HHS0FZ0kW14JaV3LxIBTMyHkNEowH6DWquK+C3N8YbjukO0Nu/OBVjHNqekTqc
 C/olkydB0Ff4H1wAnHbb245vAEwjkP5bL1lrfWmXhbdsUxR7hJ4qvjeQKGMHxFGZ/WSD
 kpvzQmd49r1Nl5zQSrPJhUyrFF+gM9yKTUKoSGW6beUj4RIAPdKaT5A8vgD3i3DjGYAZ
 AEcUw3NJE0DtcJ8ynYHsUiz7L3AWxQKNjW4lvO8XBzNmGhB4hSyWpKiFX7yRIauGEjcj
 vKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U3kai5XKxz+UjO9GWy6BfgzjWYG6rLULv76c8EJpynU=;
 b=I3DQ961M5n/rFYXep2vRcGflQK5yyoND3ser9OIAH7Bznv0exqAdv804a/Mfg7rjAt
 L2xl92b0LZja0DcjKdC3lHN0ulZKhneVU12aGHIWoQoB4ga0RSiLmh7sTiCfMTk84Y2p
 /novYAzJW+fsIMP8RzKFamIV37zLo32iTPWK5ZkQSKv/59yjlhiZno4E3b1GHoyl594d
 04v3cg1eksXXRoFLXYgeF0Ws70xIgTKANKU5Rh+OUsNV1SJzv96WfH6Du/3x2qKqRQ+p
 j640MJJrEakNgSK+us2DP5B0EpB15Hce2CbBfqDN2J6qhwJA5ymPSWQO25ZNq4ykhlOB
 WJ4A==
X-Gm-Message-State: AO0yUKW+m4C4DBZEkpfS+HWW3+azyUEnbBXGRPDvpqn4KKmuzmgshdlK
 2+6o1i2yVEgtx+sewcAHEXuieg==
X-Google-Smtp-Source: AK7set+coCjHZbTvQbJpA5iQENMe3vu8ZKIqc+XNyw+8PyLFOYkbSmj9iXVS+wr3vFZzVGZm8+66RQ==
X-Received: by 2002:a17:902:ca83:b0:194:52ed:7a2b with SMTP id
 v3-20020a170902ca8300b0019452ed7a2bmr1077702pld.39.1675222547674; 
 Tue, 31 Jan 2023 19:35:47 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a170902ec8f00b001968b529c98sm4185557plg.128.2023.01.31.19.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 19:35:47 -0800 (PST)
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
Subject: [PATCH v5 00/29] e1000x cleanups (preliminary for IGB)
Date: Wed,  1 Feb 2023 12:35:10 +0900
Message-Id: <20230201033539.30049-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

V4 -> V5:
- Added "e1000e: Combine rx traces".

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

Akihiko Odaki (29):
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
  e1000e: Combine rx traces

 MAINTAINERS              |   4 +
 hw/net/e1000.c           | 254 ++++++++---------
 hw/net/e1000_regs.h      |  61 +---
 hw/net/e1000e.c          |  88 +++---
 hw/net/e1000e_core.c     | 594 ++++++++++++++++++++-------------------
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
 hw/net/trace-events      |  10 +-
 hw/net/virtio-net.c      |   2 +-
 hw/net/vmxnet3.c         |  32 +--
 include/hw/net/mii.h     |  14 +-
 include/net/eth.h        |   5 -
 include/net/net.h        |   6 +
 net/dump.c               |  11 +-
 net/eth.c                |  27 --
 net/net.c                |  18 ++
 net/tap.c                |  16 ++
 25 files changed, 921 insertions(+), 781 deletions(-)

-- 
2.39.1


