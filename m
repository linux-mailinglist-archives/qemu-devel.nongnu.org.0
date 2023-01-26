Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A4167C8FF
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 11:48:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKzmu-0002XD-8k; Thu, 26 Jan 2023 05:47:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKzms-0002Wd-54
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 05:47:22 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKzmq-0005IY-44
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 05:47:21 -0500
Received: by mail-pj1-x102b.google.com with SMTP id lp10so1156270pjb.4
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 02:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kLDa6Aofhu8jYTSUS48vEbnCaCrGlaDsNSrolZVq3RM=;
 b=PHDS2ceyu1LHGpIyQaq/F8EEvIdTxs1iE62o+PPeRbRccreGtU2iyfpS4yLRzJ3NIL
 MA5ErwDso/wNxkXUwl27DpU0A5kcAh17fnfFCPjIqUp1X5kIBWeJlGXdq6TLnUcswXjR
 PerPSuDd4oLLaOfcAodKfmKXmmhBGBDiEIURnkcx5XvlEvk44B5g9PWkyByS0QPjDMIL
 P548spX7bb5pIm+3pwjtNCYCzKjGh7OaIFWaGatqT/l23v8XgFh6j44ncXIsG9XWy+0N
 DSDYg5IyBHCKDpQVrapjDRF2SW0nrHoCla4L+MtadpESDxct53EJrE9MGs0naS2LNtr3
 5lXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kLDa6Aofhu8jYTSUS48vEbnCaCrGlaDsNSrolZVq3RM=;
 b=N/yEbcpzu3x5ZqAd2lkoOflNSiHZHrZSvFl4clSVPEGx3iLeDX0JODY0R4Uz8v+gTp
 aV7MXtJB+g1T1k33Z0UEpSVdkY0kcnfgAgLz4Ig1E39jopEn3W6Fs0NYDKc8bomc5yaK
 vtCcb6ILg1NyaZVNU7D4aKKSi3TVbrvbQc4DeT0DLHGb2LkhDDuMD1QEaoGZL4rRaHL3
 /evoceLZse17CCl0ibV8ofGjxY5hrx/zPOWIV8cbQJl1hW6VbKIjNZMW+IoSjPLAbGTf
 LnflXluERUCoaazJBaIId4S3WbCRe4Rm7TVS1FZgT0qUs9P7SDHo5+qMlV76swJ54HDA
 8Opw==
X-Gm-Message-State: AFqh2koFpeDOHA+XmLYGtRyy/5XI57ebcKzEKd8PE54ms1+ZY5CSwy3A
 131/JX+JrhBBc0rHmOAnZNte8Q==
X-Google-Smtp-Source: AMrXdXsMdQOhr2p7K0VKDPBprKQC0OERC/rdY/6D+xlaccmBVWT0Qsp/1ALKOQBbPUJMU7fW8U6MsA==
X-Received: by 2002:a05:6a20:2da7:b0:b6:a9f3:4f8c with SMTP id
 bf39-20020a056a202da700b000b6a9f34f8cmr35741285pzb.13.1674730038267; 
 Thu, 26 Jan 2023 02:47:18 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a63af48000000b0046b1dabf9a8sm496789pgo.70.2023.01.26.02.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 02:47:17 -0800 (PST)
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
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 00/26] e1000x cleanups (preliminary for IGB)
Date: Thu, 26 Jan 2023 19:46:39 +0900
Message-Id: <20230126104705.35023-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102b.google.com
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

Akihiko Odaki (26):
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
  MAINTAINERS: Add Akihiko Odaki as a e1000e reviewer
  MAINTAINERS: Add e1000e test files

 MAINTAINERS              |   4 +
 hw/net/e1000.c           | 254 ++++++++---------
 hw/net/e1000_regs.h      |  61 +---
 hw/net/e1000e.c          |  88 +++---
 hw/net/e1000e_core.c     | 584 ++++++++++++++++++++-------------------
 hw/net/e1000e_core.h     |  68 +++--
 hw/net/e1000x_common.c   |  12 +-
 hw/net/e1000x_common.h   |  56 ++--
 hw/net/fsl_etsec/etsec.c |  11 +-
 hw/net/fsl_etsec/etsec.h |  17 --
 hw/net/fsl_etsec/miim.c  |   5 +-
 hw/net/net_rx_pkt.c      |  12 +-
 hw/net/net_rx_pkt.h      |  20 +-
 hw/net/net_tx_pkt.c      | 324 ++++++++++++++++------
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
 25 files changed, 909 insertions(+), 770 deletions(-)

-- 
2.39.0


