Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA9A699BC9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 19:05:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSic9-0008PF-UP; Thu, 16 Feb 2023 13:04:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSic7-0008NF-O7
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 13:04:11 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSic5-0005lj-O0
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 13:04:11 -0500
Received: from iva8-99b070b76c56.qloud-c.yandex.net
 (iva8-99b070b76c56.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:1099:0:640:99b0:70b7])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 2A67A60129;
 Thu, 16 Feb 2023 21:04:02 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:8813::1:16])
 by iva8-99b070b76c56.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 u3q89J0Qp8c1-AgPlymGz; Thu, 16 Feb 2023 21:04:01 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676570641; bh=LKk0NsNxWY3QySuOaRiPhRhksY881PykX1pba2KGV9c=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=fqEj5+m3xIbqD6O/DFX1G+pJZDpZO7VVFu6tw89uXbHEaNd+h2OwZsxpx9OkoYRuw
 jamT7Qw9hhswTHTYlJygeis93TdJfb44kEGEquoNeVbhRmBzRX7BFwopRXbBAuAIIZ
 lGqALdWQfldtiwlcixVQaFzUYI9fpHdcNx1Ot0i4=
Authentication-Results: iva8-99b070b76c56.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, philmd@linaro.org, vsementsov@yandex-team.ru,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
Subject: [PATCH v5 01/18] pci/shpc: set attention led to OFF on reset
Date: Thu, 16 Feb 2023 21:03:39 +0300
Message-Id: <20230216180356.156832-2-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216180356.156832-1-vsementsov@yandex-team.ru>
References: <20230216180356.156832-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
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

0 is not a valid state for the led. Let's start with OFF.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Anton Kuchin <antonkuchin@yandex-team.ru>
---
 hw/pci/shpc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index fca7f6691a..1b3f619dc9 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -223,6 +223,7 @@ void shpc_reset(PCIDevice *d)
                             SHPC_SLOT_STATUS_PRSNT_MASK);
             shpc_set_status(shpc, i, SHPC_LED_OFF, SHPC_SLOT_PWR_LED_MASK);
         }
+        shpc_set_status(shpc, i, SHPC_LED_OFF, SHPC_SLOT_ATTN_LED_MASK);
         shpc_set_status(shpc, i, 0, SHPC_SLOT_STATUS_66);
     }
     shpc_set_sec_bus_speed(shpc, SHPC_SEC_BUS_33);
-- 
2.34.1


