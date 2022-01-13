Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D0B48DB61
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 17:10:15 +0100 (CET)
Received: from localhost ([::1]:60468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n82g2-0003e1-E8
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 11:10:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppavlu@suse.cz>)
 id 1n81tF-0007Bb-HX; Thu, 13 Jan 2022 10:19:49 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:44126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ppavlu@suse.cz>)
 id 1n81tD-0006ii-UN; Thu, 13 Jan 2022 10:19:49 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7BBC9218B1;
 Thu, 13 Jan 2022 15:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1642087186; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L57YS6lcpOAlRLBLnhaZCF8uOjfOPhMnDq4J4As9pms=;
 b=1tk74+8wru5P3a+0tZToxRnvaEIcup8E5apTLnkF/8Lq/09JcJrR/oGUip71+IadBkrwW+
 7WZp9rfcAsGOuCQ4vRfRVled6OdJR4eaWeYUBwhUOXyDB9j4Ekx3MXSWll3WBewQimpDjX
 1SmPhQrwQJLhCnmS+W9kbrZ99qeqcO4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1642087186;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L57YS6lcpOAlRLBLnhaZCF8uOjfOPhMnDq4J4As9pms=;
 b=7lIZyfYXcWK8VN9k+DSmCC8Ik96jpnfR1+qWI3VaflnnjXeoe4joBiORbFRi862A4un16p
 ftU0PAjVCxHgRHAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 695DB13DD1;
 Thu, 13 Jan 2022 15:19:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8JkvGRJD4GEwFAAAMHmgww
 (envelope-from <ppavlu@suse.cz>); Thu, 13 Jan 2022 15:19:46 +0000
From: Petr Pavlu <ppavlu@suse.cz>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] hw/intc/arm_gic: Allow reset of the running priority
Date: Thu, 13 Jan 2022 16:19:16 +0100
Message-Id: <20220113151916.17978-3-ppavlu@suse.cz>
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

When running Linux on a machine with GICv2, the kernel can crash while
processing an interrupt and can subsequently start a kdump kernel from
the active interrupt handler. In such a case, the crashed kernel might
not gracefully signal the end of interrupt to the GICv2 hardware. The
kdump kernel will however try to reset the GIC state on startup to get
the controller into a sane state, in particular the kernel writes ones
to GICD_ICACTIVERn and wipes out GICC_APRn to make sure that no
interrupt is active.

The patch adds a logic to recalculate the running priority when
GICC_APRn/GICC_NSAPRn is written which makes sure that the mentioned
reset works with the GICv2 emulation in QEMU too and the kdump kernel
starts receiving interrupts.

The described scenario can be reproduced on an AArch64 QEMU virt machine
with a kdump-enabled Linux system by using the softdog module. The kdump
kernel will hang at some point because QEMU still thinks the running
priority is that of the timer interrupt and asserts no new interrupts to
the system:
$ modprobe softdog soft_margin=10 soft_panic=1
$ cat > /dev/watchdog
[Press Enter to start the watchdog, wait for its timeout and observe
that the kdump kernel hangs on startup.]

Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 hw/intc/arm_gic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 0cd9ceca8d..492b2421ab 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -1736,6 +1736,7 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
         } else {
             s->apr[regno][cpu] = value;
         }
+        s->running_priority[cpu] = gic_get_prio_from_apr_bits(s, cpu);
         break;
     }
     case 0xe0: case 0xe4: case 0xe8: case 0xec:
@@ -1752,6 +1753,7 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
             return MEMTX_OK;
         }
         s->nsapr[regno][cpu] = value;
+        s->running_priority[cpu] = gic_get_prio_from_apr_bits(s, cpu);
         break;
     }
     case 0x1000:
-- 
2.34.1


