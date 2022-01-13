Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4932148DB3F
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 17:06:27 +0100 (CET)
Received: from localhost ([::1]:55280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n82cM-00084w-3z
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 11:06:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppavlu@suse.cz>)
 id 1n81tC-0007Aw-T6; Thu, 13 Jan 2022 10:19:46 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:44120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ppavlu@suse.cz>)
 id 1n81tB-0006iP-DP; Thu, 13 Jan 2022 10:19:46 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BAEF6210EC;
 Thu, 13 Jan 2022 15:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1642087183; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RRjphleUIqLoOTBWPa4kIgEwVvOePPoVPrFG6Zq3duI=;
 b=wu+kcCgWYsDFlRKXNVr4blE23J1E+AAMmvjH+i0f8HYC4YfOhiYZptN+bjHLFat6edDde7
 25AFaMOvwiV9wMv5lQyOZSHQpjupS5duHtVnyb4DkW9Ko/p+68IefggE3oT+vuRs0ILq8d
 iueh69Yt9DvLOy2wT9FmoxyRkLNO4bU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1642087183;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RRjphleUIqLoOTBWPa4kIgEwVvOePPoVPrFG6Zq3duI=;
 b=SpSTO3P2PL7PO5aQ0fYDldoJiXhBO5uvVSIQ/n1ZAkW5iIWsSEV5k9e04cMiheUdwiWC0Z
 mH/vgO3hb3g6MVDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A85F713DD1;
 Thu, 13 Jan 2022 15:19:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +KhyKA9D4GEwFAAAMHmgww
 (envelope-from <ppavlu@suse.cz>); Thu, 13 Jan 2022 15:19:43 +0000
From: Petr Pavlu <ppavlu@suse.cz>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] hw/intc/arm_gic: Implement read of GICC_IIDR
Date: Thu, 13 Jan 2022 16:19:15 +0100
Message-Id: <20220113151916.17978-2-ppavlu@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220113151916.17978-1-ppavlu@suse.cz>
References: <20220113151916.17978-1-ppavlu@suse.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=ppavlu@suse.cz;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 13 Jan 2022 10:59:52 -0500
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
Cc: petr.pavlu@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Petr Pavlu <petr.pavlu@suse.com>

Implement support for reading GICC_IIDR. This register is used by the
Linux kernel to recognize that GICv2 with GICC_APRn is present.

Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 hw/intc/arm_gic.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index a994b1f024..0cd9ceca8d 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -1662,6 +1662,15 @@ static MemTxResult gic_cpu_read(GICState *s, int cpu, int offset,
         }
         break;
     }
+    case 0xfc:
+        if (s->revision == REV_11MPCORE) {
+            /* Reserved on 11MPCore */
+            *data = 0;
+        } else {
+            /* GICv1 or v2; Arm implementation */
+            *data = (s->revision << 16) | 0x43b;
+        }
+        break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "gic_cpu_read: Bad offset %x\n", (int)offset);
-- 
2.34.1


