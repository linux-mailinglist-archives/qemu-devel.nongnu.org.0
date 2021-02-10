Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B92E8315F6D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 07:26:20 +0100 (CET)
Received: from localhost ([::1]:58726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ix7-0002NW-Vm
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 01:26:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ip3-0001Xp-Ua; Wed, 10 Feb 2021 01:17:57 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:37781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ip1-0000Lp-4K; Wed, 10 Feb 2021 01:17:57 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Db8gk5lTxz9sVt; Wed, 10 Feb 2021 17:17:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612937858;
 bh=83YeZAyc50Th6MLx6RcCaZYesjOAWiu3g1qKdt728AI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GCDnEh5LsPPSgUoHhMTekQo49Zj/B0aL7h+s78qJKJX2Tag/Kfl7gG/XdN/cQo9eU
 vc5MfYoijGtmBN1khxUEg0qyMcUdNTgbltv+qGvcFwa+kTclI8YuLht/WwH+ONRDkE
 np0BzWZfN+394f8eHKimjae+hAuCqbuzr24qVIic=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 06/19] ppc/xive: Add firmware bit when dumping the ENDs
Date: Wed, 10 Feb 2021 17:17:22 +1100
Message-Id: <20210210061735.304384-7-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210061735.304384-1-david@gibson.dropbear.id.au>
References: <20210210061735.304384-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

ENDs allocated by OPAL for the HW thread VPs are tagged as owned by FW.
Dump the state in 'info pic'.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210126171059.307867-3-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/xive.c             | 3 ++-
 include/hw/ppc/xive_regs.h | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index fa8c3d8287..eeb4e62ba9 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -1294,7 +1294,7 @@ void xive_end_pic_print_info(XiveEND *end, uint32_t end_idx, Monitor *mon)
 
     pq = xive_get_field32(END_W1_ESn, end->w1);
 
-    monitor_printf(mon, "  %08x %c%c %c%c%c%c%c%c%c prio:%d nvt:%02x/%04x",
+    monitor_printf(mon, "  %08x %c%c %c%c%c%c%c%c%c%c prio:%d nvt:%02x/%04x",
                    end_idx,
                    pq & XIVE_ESB_VAL_P ? 'P' : '-',
                    pq & XIVE_ESB_VAL_Q ? 'Q' : '-',
@@ -1305,6 +1305,7 @@ void xive_end_pic_print_info(XiveEND *end, uint32_t end_idx, Monitor *mon)
                    xive_end_is_escalate(end) ? 'e' : '-',
                    xive_end_is_uncond_escalation(end)   ? 'u' : '-',
                    xive_end_is_silent_escalation(end)   ? 's' : '-',
+                   xive_end_is_firmware(end)   ? 'f' : '-',
                    priority, nvt_blk, nvt_idx);
 
     if (qaddr_base) {
diff --git a/include/hw/ppc/xive_regs.h b/include/hw/ppc/xive_regs.h
index 7879692825..b7fde2354e 100644
--- a/include/hw/ppc/xive_regs.h
+++ b/include/hw/ppc/xive_regs.h
@@ -236,6 +236,8 @@ typedef struct XiveEND {
     (be32_to_cpu((end)->w0) & END_W0_UNCOND_ESCALATE)
 #define xive_end_is_silent_escalation(end)              \
     (be32_to_cpu((end)->w0) & END_W0_SILENT_ESCALATE)
+#define xive_end_is_firmware(end)              \
+    (be32_to_cpu((end)->w0) & END_W0_FIRMWARE)
 
 static inline uint64_t xive_end_qaddr(XiveEND *end)
 {
-- 
2.29.2


