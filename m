Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A389A31289E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 01:34:09 +0100 (CET)
Received: from localhost ([::1]:58084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8uVE-0004RE-7c
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 19:34:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=666759579=dmitry.fomichev@wdc.com>)
 id 1l8uUB-00040S-VU
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 19:33:04 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:8356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=666759579=dmitry.fomichev@wdc.com>)
 id 1l8uU9-0007OD-2H
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 19:33:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612744381; x=1644280381;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g3ic4KYpGtQcIpdwwdUA3ZxxG4KRcwIjvY4Or50Gmdk=;
 b=YYWb1a5ssNlYCQuxUqqVE/O05T40nD7dYQmnVoh5aIBAZxVbFGyrnDAS
 NKp31HknLMgGJgqdMU639mapBnEFH+OnTwzOt9sJc1607lIdhrtJ2OwqA
 ZckZ/zmFb90XX/Z2ftRU5bW9CPUmot9h0+Fpo6tQEFcrQVzghxu4CaZat
 s/OBqvgqi07tUF3PbVNQKcscNdSS+j67bfGDgWDxg/qHvDyEN57R/O4xD
 AAZ7hGlzyv1+yLQXzNk9hMk0gKmPJfqiMEUQAgpX32lu3SVKeXzEyTpG3
 ZP7S65Qs2dT5fhpKCCgJHbgKRXAv6qMDe5vJz2XJSTRFwQDrYS97pLYUE g==;
IronPort-SDR: 4hT3IaOov4Fpw4OtkdQC8pkn7dokeXzqW4SvG8w3qCUNZanbd1/z53DFq9mzzEFTW6hpxxkhN4
 +EAJjFI8J6sg7CEo6U+zlkMEiLET+jf56PidIoy/7Vk2y1OMAHu4E/ovyd5B3XDx2PqUk8qDY6
 Eja0rfW9UHWHHOeHw2AA9t8tTwq71RNNbIYPv7UiDQZFTQcTdMfJPTNHCYXbb4ZLs4daTHwohV
 RMCQcB5ItKN6xSu1YIEPS2IgW3uCCXK2DAByjc6pU33rsftqFrjQoqZr1lS7RE1wB9QtvFiqgz
 th8=
X-IronPort-AV: E=Sophos;i="5.81,160,1610380800"; d="scan'208";a="160573801"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Feb 2021 08:32:58 +0800
IronPort-SDR: gI2mnpdzRF0hbfHneWaBo8KkXGMddBespByKlcnIp8RUf/MbAbX7+CUicH9ygsXz9kF1ZAtcUy
 BHbW4D6lX9dS+FLtiVMAkUHZVEevWWBjLPwtBFUhlcwwJplsguyHEj2WPMgCzscp78s+BHpBIZ
 Es3suCtKYzSZNi9ET+NwD1yMssw+vF2UH1iRAWITXDxlaTtHFuKkMQMQ+eYByEIFDyninZOcTN
 fYwWDJg4qF3YCC0nyXirpD+uxtDwj25tB1rbQCAaKssJz1qSv6apIKEIjjv8yqsQo4Ov9gD5eT
 TCjX1fhdYhkHRx6qTfoPUb9G
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2021 16:16:51 -0800
IronPort-SDR: 3AqBEDdEIwXGCL8A/jWT7hmBz71g84io/EVLpdrWNtS0hBhqjIJ4v6NrCFuYt+VeBXGJgVu8ka
 +DrzjTr1f7V0zzJs4T8rlxsj+CYIXcSYvZ2s3HJDW3K9y4NsK1tvuV0p8qvjbQCVz1lWJVtO78
 D5jFIcwdzBjVkTIA4V8LEEwATsbWnhoMS8YL9xs2NgLPmuhSMptLpvwbHWlG4Oqrzz1DbPDJxA
 2g36QEv3q/7vUKGNeT9LnjNop0mTbWKCqhbVuEYIjZq+j3J7n7/tTUQFsR1MWNO9txudwQSqk3
 Ae4=
WDCIronportException: Internal
Received: from unknown (HELO redsun50.ssa.fujisawa.hgst.com) ([10.149.66.24])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Feb 2021 16:32:56 -0800
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: Klaus Jensen <k.jensen@samsung.com>, Keith Busch <kbusch@kernel.org>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH] hw/block/nvme: fix Close Zone
Date: Mon,  8 Feb 2021 09:32:56 +0900
Message-Id: <20210208003256.9280-1-dmitry.fomichev@wdc.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=666759579=dmitry.fomichev@wdc.com; helo=esa6.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Niklas Cassel <niklas.cassel@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implicitly and Explicitly Open zones can be closed by Close Zone
management function. This got broken by a recent commit and now such
commands fail with Invalid Zone State Transition status.

Modify nvm_zrm_close() function to make Close Zone work correctly.

Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Fixes: 053b5a302c3("hw/block/nvme: refactor zone resource management")
---
 hw/block/nvme.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 6b84e34843..c2f0c88fbf 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1308,14 +1308,13 @@ static uint16_t nvme_zrm_finish(NvmeNamespace *ns, NvmeZone *zone)
 static uint16_t nvme_zrm_close(NvmeNamespace *ns, NvmeZone *zone)
 {
     switch (nvme_get_zone_state(zone)) {
-    case NVME_ZONE_STATE_CLOSED:
-        return NVME_SUCCESS;
-
     case NVME_ZONE_STATE_EXPLICITLY_OPEN:
     case NVME_ZONE_STATE_IMPLICITLY_OPEN:
         nvme_aor_dec_open(ns);
         nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_CLOSED);
         /* fall through */
+    case NVME_ZONE_STATE_CLOSED:
+        return NVME_SUCCESS;
 
     default:
         return NVME_ZONE_INVAL_TRANSITION;
-- 
2.28.0


