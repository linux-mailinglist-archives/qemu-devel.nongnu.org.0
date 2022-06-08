Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9B45420A4
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 03:32:47 +0200 (CEST)
Received: from localhost ([::1]:53212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nykYv-00043n-UF
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 21:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=151ed2091=niklas.cassel@wdc.com>)
 id 1nykVO-0001N2-6S; Tue, 07 Jun 2022 21:29:06 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:39773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=151ed2091=niklas.cassel@wdc.com>)
 id 1nykVK-0001Il-Nc; Tue, 07 Jun 2022 21:29:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654651741; x=1686187741;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=27+KDJlc5PjSjs3SoIGfdV3hCErtOUUuVE64j2LXjcM=;
 b=B3i0KqFj7zwU4vN+g2Z80L3K08DfjTXs8g+/XmzVT6hpG/K14AozkY1m
 o1XIuYwFbB18zoM9GV0Ml0wpGWI7C2M6gLUYFkojrHa+U5+AvBXv2jK5U
 2IGr1Tb3ijpSI66CRjxIu/AttwANlk3VoKbnI2o2r4iW47isMlgUNJkT6
 m0LtJGuG0Q/z6/XpNUzMqYiz3pbmoqHfTgSlQWTZbMPLZZUzrjp7DDUcx
 p1OwJReEWMQkluSC9+prYwZuEajPfREX9VlCveNNVZUwUowV1AuQ+JkSg
 I9l3NH4I3LU7pz+OWSGBKGi3qGoyAMvTlY7k5ZbhgqvKWZY3q+bFJwbbA Q==;
X-IronPort-AV: E=Sophos;i="5.91,284,1647273600"; d="scan'208";a="207399229"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2022 09:28:56 +0800
IronPort-SDR: yExwHbg5mdAd/KK8u4Y85ntGZfVVDX8kxvKHIKY1W1DsFQXbUE6OL3esznVBp9MTH9h414YUFB
 77bac8q6hM9LdWAhA4xqafJDhLqG/LP0ipj1LEb5/C0IWYoYqMOfS53bLkZtTjsgSjHzELtKUJ
 BecXaAav7F4DZkywy402N5EQ/tLpEuR7FC6MUnFO9ExfMvkBHX6yUIabWV2VKvfiy8faDU+JQI
 Bnaq2BseYTBzmoht1uR9mq7yJcRNmIzqreA+H8/aeToWEVdh+gUt7BLSdKvWamlllAKmGaRZsg
 nCDbWpFYQmh/tsWJo2ynGuIU
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jun 2022 17:47:46 -0700
IronPort-SDR: Mbc1xirOemxzFAiaIC4tNbczRCqcrOdgRHmLFhlKJBjnGSkbBlkmcx0K/NvknP/OPGZ9aPYaGF
 PSgFloemylN1CHp0QAvW4P74WzotN6509BV/SN/BvcTzE8+g1LVYxExJOUFMuLncSfqudGLe/R
 Pe5ikiPWIbRRCUUGWorkHVAsN86e3sK2Sq7ccl6kBLPIflwXYSGZArTcdaXQDRorMC3C0IZobo
 vfTjgYwPV++zHPPKNjaKt8oZv3aRpSOxztXsTi0/FAbGTNpEtJ8PovVstneKP/rrI/5Bzqhdek
 Dfs=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.lan) ([10.225.164.64])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jun 2022 18:28:55 -0700
To: kbusch@kernel.org,
	its@irrelevant.dk
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Niklas Cassel <niklas.cassel@wdc.com>
Subject: [PATCH 0/4] hw/nvme: add support for TP4084
Date: Wed,  8 Jun 2022 03:28:46 +0200
Message-Id: <20220608012850.668695-1-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=151ed2091=niklas.cassel@wdc.com; helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Niklas Cassel <niklas.cassel@wdc.com>
From:  Niklas Cassel via <qemu-devel@nongnu.org>

Hello there,

considering that Linux v5.19-rc1 is out which includes support for
NVMe TP4084:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/nvme/host/core.c?id=354201c53e61e493017b15327294b0c8ab522d69

I thought that it might be nice to have QEMU support for the same.

TP4084 adds a new mode, CC.CRIME, that can be used to mark a namespace
as ready independently from the controller.

When CC.CRIME is 0 (default), things behave as before, all namespaces
are ready when CSTS.RDY gets set to 1.

Add a new "ready_delay" namespace device parameter, in order to emulate
different ready latencies for namespaces when CC.CRIME is 1.

The patch series also adds a "crwmt" controller parameter, in order to
be able to expose the worst case timeout that the host should wait for
all namespaces to become ready.


Example qemu cmd line for the new options:

# delay in s (20s)
NS1_DELAY_S=20
# convert to units of 500ms
NS1_DELAY=$((NS1_DELAY_S*2))

# delay in s (60s)
NS2_DELAY_S=60
# convert to units of 500ms
NS2_DELAY=$((NS2_DELAY_S*2))

# timeout in s (120s)
CRWMT_S=120
# convert to units of 500ms
CRWMT=$((CRWMT_S*2))

             -device nvme,serial=deadbeef,crwmt=$CRWMT \
             -drive file=$NS1_DATA,id=nvm-1,format=raw,if=none \
             -device nvme-ns,drive=nvm-1,ready_delay=$NS1_DELAY \
             -drive file=$NS2_DATA,id=nvm-2,format=raw,if=none \
             -device nvme-ns,drive=nvm-2,ready_delay=$NS2_DELAY \


Niklas Cassel (4):
  hw/nvme: claim NVMe 2.0 compliance
  hw/nvme: store a pointer to the NvmeSubsystem in the NvmeNamespace
  hw/nvme: add support for ratified TP4084
  hw/nvme: add new never_ready parameter to test the DNR bit

 hw/nvme/ctrl.c       | 151 +++++++++++++++++++++++++++++++++++++++++--
 hw/nvme/ns.c         |  17 +++++
 hw/nvme/nvme.h       |   9 +++
 hw/nvme/trace-events |   1 +
 include/block/nvme.h |  60 ++++++++++++++++-
 5 files changed, 233 insertions(+), 5 deletions(-)

-- 
2.36.1


