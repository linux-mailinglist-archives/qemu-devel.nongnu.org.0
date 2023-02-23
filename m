Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CF86A05F8
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:22:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV8iX-0005rT-UK; Thu, 23 Feb 2023 05:20:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8iV-0005qw-6k
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:20:47 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8iS-0000pJ-SD
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:20:46 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 qi12-20020a17090b274c00b002341621377cso12083891pjb.2
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 02:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RD9QmRFZ7eD2gE6mdX07bKJhV+7dJ41LnCsBTXW0mps=;
 b=18T81AKFGA9ukQKIS+r7S3mRqcCUfhJaat9A73En1J8PDujqbf0TFYznvZPgW2UIdS
 Rc1xj4QHcQXwb494yV/5uCPm7CFWB1UsJHC36tukAn6QpP3b9+SvP2OQtzKQovLpsaTL
 8UPqLYbxqScbTxlfdl1++A0wrDX0k8BTNdRayrF4o8YZceN9jgo81G66a8qjhAwgZ+ls
 CgaOMyjUrr7h0KOYuS6GS5iFhXmYaf2/ST2jk0hwrdHZkdz06EyYwi8cBr7EUgByBY+t
 07YnQP5/0v6D0A6t+QvWc3cUxzS2r01sw19Hu28PH6d73WFEIgojRr0Ls87lqgyQMoeX
 HADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RD9QmRFZ7eD2gE6mdX07bKJhV+7dJ41LnCsBTXW0mps=;
 b=dUTA8Hn/GIClXHVnGi2A9m6GmY/UgOLO7lQKymXF17o6INIRmLzNJjKv3hSCCo/E/2
 mWzxNsLoZ0q+Ejzj+7XdBW3Rm5kbvxxPEzVthGTKqzGhcfbDiTsB7EgLbLpmYuKAO2FH
 zYvjTZxPT8cwenS2+jrDjfZ86OVWosz5zJqO2t8Ufausv7Cj1LTtSLLRB5HL4EmPDQgM
 29DbJQDS2YCUyQ046+iZzKDql+WChG/CKFR+K92OaYUfg2fcg0A/LFLQaV1/P6aESemA
 ujOIPP5e+Fv1vtf4rlqF3QVvtkD11gJlpZV2Jy/5dnJx+3968TuPpMvZcolHLl6ajDlM
 JrvA==
X-Gm-Message-State: AO0yUKUMMe25lKeRW7rBVAp7r7vujgOwwhPX/iNGROASsDm8K+DDuY9I
 Wdf527M8iBC+wX7I1DeHgT0MEg==
X-Google-Smtp-Source: AK7set+w32sTafDR80jyq0HQMrBzS96nVx4dUeKRPnlwjmPyZWDw5TQ76sNKY/VgUkjTNgE5ggsZRw==
X-Received: by 2002:a17:903:11d0:b0:19c:b7da:fbe0 with SMTP id
 q16-20020a17090311d000b0019cb7dafbe0mr3431796plh.16.1677147643227; 
 Thu, 23 Feb 2023 02:20:43 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a170902c1d400b00196217f1219sm4107734plc.70.2023.02.23.02.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:20:42 -0800 (PST)
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
Subject: [PATCH v6 00/34] e1000x cleanups (preliminary for IGB)
Date: Thu, 23 Feb 2023 19:19:44 +0900
Message-Id: <20230223102018.141748-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1031;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1031.google.com
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

V5 -> V6:
- Extracted patch e1000e: Introduce E1000E_LOW_BITS_SET_FUNC from
  "e1000e: Mask registers when writing". (Philippe Mathieu-Daudé)
- Added "e1000: Count CRC in Tx statistics".
- Added "e1000e: Count CRC in Tx statistics".
- Added "net/eth: Report if headers are actually present".
- Added "e1000e: Implement system clock".

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

Akihiko Odaki (34):
  e1000e: Fix the code style
  hw/net: Add more MII definitions
  fsl_etsec: Use hw/net/mii.h
  e1000: Use hw/net/mii.h
  e1000: Mask registers when writing
  e1000e: Introduce E1000E_LOW_BITS_SET_FUNC
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
  e1000: Count CRC in Tx statistics
  e1000e: Count CRC in Tx statistics
  net/eth: Report if headers are actually present
  e1000e: Implement system clock

 MAINTAINERS              |   4 +
 hw/core/machine.c        |   1 +
 hw/net/e1000.c           | 258 +++++++--------
 hw/net/e1000_regs.h      |  88 +++--
 hw/net/e1000e.c          |  99 +++---
 hw/net/e1000e_core.c     | 700 +++++++++++++++++++++------------------
 hw/net/e1000e_core.h     |  70 ++--
 hw/net/e1000x_common.c   |  37 ++-
 hw/net/e1000x_common.h   |  59 ++--
 hw/net/fsl_etsec/etsec.c |  11 +-
 hw/net/fsl_etsec/etsec.h |  17 -
 hw/net/fsl_etsec/miim.c  |   5 +-
 hw/net/net_rx_pkt.c      |  98 +++---
 hw/net/net_rx_pkt.h      |  32 +-
 hw/net/net_tx_pkt.c      | 332 ++++++++++++++-----
 hw/net/net_tx_pkt.h      |  27 +-
 hw/net/trace-events      |  16 +-
 hw/net/virtio-net.c      |  34 +-
 hw/net/vmxnet3.c         |  52 ++-
 include/hw/net/mii.h     |  14 +-
 include/net/eth.h        |   9 +-
 include/net/net.h        |   6 +
 net/dump.c               |  11 +-
 net/eth.c                | 118 +++----
 net/net.c                |  18 +
 net/tap.c                |  16 +
 26 files changed, 1177 insertions(+), 955 deletions(-)

-- 
2.39.1


