Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4564755E5D1
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 17:51:15 +0200 (CEST)
Received: from localhost ([::1]:54180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6DUg-0006iW-CI
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 11:51:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=xpXT=XD=kaod.org=clg@ozlabs.org>)
 id 1o6DRX-0003hX-GU; Tue, 28 Jun 2022 11:47:59 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:47457
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=xpXT=XD=kaod.org=clg@ozlabs.org>)
 id 1o6DRU-0001ns-Mu; Tue, 28 Jun 2022 11:47:59 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LXTWT5kZ7z4xYC;
 Wed, 29 Jun 2022 01:47:49 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LXTWR5RjNz4xR1;
 Wed, 29 Jun 2022 01:47:47 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 1/3] aspeed/scu: Add trace events for read ops
Date: Tue, 28 Jun 2022 17:47:38 +0200
Message-Id: <20220628154740.1117349-2-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220628154740.1117349-1-clg@kaod.org>
References: <20220628154740.1117349-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=xpXT=XD=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_scu.c | 2 ++
 hw/misc/trace-events | 1 +
 2 files changed, 3 insertions(+)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 19b03471fc4e..83353649064a 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -270,6 +270,7 @@ static uint64_t aspeed_scu_read(void *opaque, hwaddr offset, unsigned size)
         break;
     }
 
+    trace_aspeed_scu_read(offset, size, s->regs[reg]);
     return s->regs[reg];
 }
 
@@ -637,6 +638,7 @@ static uint64_t aspeed_ast2600_scu_read(void *opaque, hwaddr offset,
         break;
     }
 
+    trace_aspeed_scu_read(offset, size, s->regs[reg]);
     return s->regs[reg];
 }
 
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index c5e37b01547f..f776f24fb5d1 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -69,6 +69,7 @@ slavio_led_mem_readw(uint32_t ret) "Read diagnostic LED 0x%04x"
 
 # aspeed_scu.c
 aspeed_scu_write(uint64_t offset, unsigned size, uint32_t data) "To 0x%" PRIx64 " of size %u: 0x%" PRIx32
+aspeed_scu_read(uint64_t offset, unsigned size, uint32_t data) "To 0x%" PRIx64 " of size %u: 0x%" PRIx32
 
 # mps2-scc.c
 mps2_scc_read(uint64_t offset, uint64_t data, unsigned size) "MPS2 SCC read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
-- 
2.35.3


