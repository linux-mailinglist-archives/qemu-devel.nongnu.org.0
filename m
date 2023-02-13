Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50790694791
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:03:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRZOp-0006d1-Av; Mon, 13 Feb 2023 09:01:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRZOT-0006an-Bg
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:01:21 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRZOQ-0005sJ-PC
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:01:21 -0500
Received: from myt6-23a5e62c0090.qloud-c.yandex.net
 (myt6-23a5e62c0090.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1da3:0:640:23a5:e62c])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id D6E595ED6F;
 Mon, 13 Feb 2023 17:01:13 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:6527::1:3a])
 by myt6-23a5e62c0090.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 51j9w00QYCg1-mBo3N82L; Mon, 13 Feb 2023 17:01:13 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676296873; bh=g9E6WR0ER8a6iXcBVUsc2UOZl2HDibzW91Aa8C7mtlI=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=aVMeaDfl2MoPSXpBAtE8k2HV50a2mjqxgkn6pjz/90BhnzUVpPYImQWeVSinhg1mA
 gbV3TyaQDYnL221FgQSFUr6erzGklDjs7ZLaRzsmBptHu8lUWqPWmrr55D8SP+laO9
 GXim9irVZWkTkXFXEplCdcXqtOBKlo4xaAZkZnoY=
Authentication-Results: myt6-23a5e62c0090.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, philmd@linaro.org, vsementsov@yandex-team.ru,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
Subject: [PATCH v4 02/16] pci/shpc: change shpc_get_status() return type to
 uint8_t
Date: Mon, 13 Feb 2023 17:00:49 +0300
Message-Id: <20230213140103.1518173-3-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The result of the function is always one byte. The result is always
assigned to uint8_t variable. Also, shpc_get_status() should be
symmetric to shpc_set_status() which has uint8_t value argument.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 hw/pci/shpc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index 1b3f619dc9..5d71569b13 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -123,10 +123,13 @@
 #define SHPC_PCI_TO_IDX(pci_slot) ((pci_slot) - 1)
 #define SHPC_IDX_TO_PHYSICAL(slot) ((slot) + 1)
 
-static uint16_t shpc_get_status(SHPCDevice *shpc, int slot, uint16_t msk)
+static uint8_t shpc_get_status(SHPCDevice *shpc, int slot, uint16_t msk)
 {
     uint8_t *status = shpc->config + SHPC_SLOT_STATUS(slot);
-    return (pci_get_word(status) & msk) >> ctz32(msk);
+    uint16_t result = (pci_get_word(status) & msk) >> ctz32(msk);
+
+    assert(result <= UINT8_MAX);
+    return result;
 }
 
 static void shpc_set_status(SHPCDevice *shpc,
-- 
2.34.1


