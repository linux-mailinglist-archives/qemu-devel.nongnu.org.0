Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A0F699BCD
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 19:05:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSicC-00008z-D7; Thu, 16 Feb 2023 13:04:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSic9-0008Pg-Aa
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 13:04:13 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSic5-0005ll-SG
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 13:04:13 -0500
Received: from iva8-99b070b76c56.qloud-c.yandex.net
 (iva8-99b070b76c56.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:1099:0:640:99b0:70b7])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 07A7162242;
 Thu, 16 Feb 2023 21:04:03 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:8813::1:16])
 by iva8-99b070b76c56.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 u3q89J0Qp8c1-oQhDVm0z; Thu, 16 Feb 2023 21:04:02 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676570642; bh=10MHLiZcXhNinnYHAedT2xoeawYGH6LhBzP0neAItZM=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=XHMwk/Ap1h7x7ErXP1xjfV85klYwB6Y1jFrCQV97BlvYvEF7JPKLKBVS+BmTtpiaO
 wckIopFv8G0iOMWOepwYKwphqJfa4ZxUxAUpeMqDuBFfyrjUhibVz750+xX1jfrIGA
 zqyL7s5p/X3PCNrOgQ+mUhM1dKvYiHHocPugF2kk=
Authentication-Results: iva8-99b070b76c56.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, philmd@linaro.org, vsementsov@yandex-team.ru,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
Subject: [PATCH v5 02/18] pci/shpc: change shpc_get_status() return type to
 uint8_t
Date: Thu, 16 Feb 2023 21:03:40 +0300
Message-Id: <20230216180356.156832-3-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216180356.156832-1-vsementsov@yandex-team.ru>
References: <20230216180356.156832-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
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
Reviewed-by: Anton Kuchin <antonkuchin@yandex-team.ru>
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


