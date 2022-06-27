Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1E355B967
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 13:51:05 +0200 (CEST)
Received: from localhost ([::1]:47710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5nGi-00051q-Kw
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 07:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=170689b83=niklas.cassel@wdc.com>)
 id 1o5nDj-0002dW-7R; Mon, 27 Jun 2022 07:47:59 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:27945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=170689b83=niklas.cassel@wdc.com>)
 id 1o5nDf-0004be-Nd; Mon, 27 Jun 2022 07:47:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656330475; x=1687866475;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WtQy0SKLMqPYf6F9q6R39Ev5xkZnXCJqmW4jyCNCIF4=;
 b=QfmnZIb4IImSA8l9kjRA0YmlYgPjGRZfzAZXTEeh/S74ZPX1d+xeq4Rz
 rNy0bYIjC7n3v+t+6cye9qSJ6ylb9rkuQ8/uHbxdi24julCkCd8jAiuUn
 14NQ3IF4cbRbTxrOWAccWrDrzV11rPUPGDWcLYM5RgETFN50DuwZcpRTf
 Z9IT5PgUJjWWI1CNQgY1qN30srNInk8U6JtYLZf/WPA5swqTekbCjktoe
 6wnR1QGKvMFasn73j3x9SsHtdh/KmGXCSy4UiVpR7P8pM+U7hhy1VMA2o
 RxjzMQqitbrL2c/Yzb1LZ09MPymCXe3qrbTKklVx0x/tTZ3JjIwCnaiz1 A==;
X-IronPort-AV: E=Sophos;i="5.92,226,1650902400"; d="scan'208";a="316298963"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Jun 2022 19:47:49 +0800
IronPort-SDR: f3N2nir5l31QFbswMFVF8bc/bVq/l2OMdBmpq41V70DLOskXEeUqTYWPUKqPPVT9IoAaYXAVcF
 DUFPgO1So1/E2+sgetY+1oD79IZYeIrzUpWuhzMwMQFF+oSMicDQMEzHaiGwG/Bk64u/Kgynl4
 nP/oQomRzA06ondcq2hHqbCejgVMde66GbMMuxGwA128v70j0LzrqCCOW6oknaNFOsqFPzHGja
 +1unNJNaNmTkcgyScNcMXb2RBeUpqhWmCVVWCesSl2hsktT4CDScS2nK+iaAzQ2rmcEccp4TAC
 NUJW6V83Gr4j7keaTpmhZGno
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jun 2022 04:10:12 -0700
IronPort-SDR: ntjMEJmpQ7xXzIkdHJ8mBPbQxxee46ICGx0ka26iquSiYgNrzr8zMrXWaQELvc2PU1YfUoBBI6
 CwrgmbXIuiFD4ePc9Z3lf/ljBAPG1VPg3w5JlIh4S7GsEzfZNXV1airz13nLzhVe7D64H4CMCP
 TLk6spxGjXEUdtkGvLldUsqQiZ6Uu0t47xZlS/m+pLGh9PC3nIIm8CDqZgWVvYhLwSb03iigxf
 ApQbtp5c2McBxIInWW5UE631hp/zc481x84yvNMPBBYnmukHp106UDkBdAHUBelyKX1BZuwoeP
 0U4=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.wdc.com) ([10.225.164.108])
 by uls-op-cesaip01.wdc.com with ESMTP; 27 Jun 2022 04:47:48 -0700
To: kbusch@kernel.org,
	its@irrelevant.dk
Cc: damien.lemoal@wdc.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Niklas Cassel <niklas.cassel@wdc.com>
Subject: [PATCH v2 0/4] hw/nvme: add support for TP4084
Date: Mon, 27 Jun 2022 13:47:27 +0200
Message-Id: <20220627114731.356462-1-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=170689b83=niklas.cassel@wdc.com; helo=esa1.hgst.iphmx.com
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

considering that Linux v5.19 will include support for NVMe TP4084:
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


Changes since v1:
-Rebased on nvme-next
-Set id_indep_ns->nmic if ns->params.shared in patch 3/4.


Niklas Cassel (4):
  hw/nvme: claim NVMe 2.0 compliance
  hw/nvme: store a pointer to the NvmeSubsystem in the NvmeNamespace
  hw/nvme: add support for ratified TP4084
  hw/nvme: add new never_ready parameter to test the DNR bit

 hw/nvme/ctrl.c       | 151 +++++++++++++++++++++++++++++++++++++++++--
 hw/nvme/ns.c         |  20 ++++++
 hw/nvme/nvme.h       |   9 +++
 hw/nvme/trace-events |   1 +
 include/block/nvme.h |  60 ++++++++++++++++-
 5 files changed, 236 insertions(+), 5 deletions(-)

-- 
2.36.1


