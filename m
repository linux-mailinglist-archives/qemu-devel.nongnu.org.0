Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A26D5E764D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 10:56:07 +0200 (CEST)
Received: from localhost ([::1]:33684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obeTe-00029L-2Y
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 04:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org>)
 id 1obeMK-00059L-DW; Fri, 23 Sep 2022 04:48:35 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:58847
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org>)
 id 1obeMB-0005Jk-PW; Fri, 23 Sep 2022 04:48:29 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4MYm5J6vpRz4xGR;
 Fri, 23 Sep 2022 18:48:20 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MYm5G344Dz4x3w;
 Fri, 23 Sep 2022 18:48:18 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 3/6] hw/core/cpu-sysemu: used cached class in
 cpu_asidx_from_attrs
Date: Fri, 23 Sep 2022 10:48:00 +0200
Message-Id: <20220923084803.498337-4-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923084803.498337-1-clg@kaod.org>
References: <20220923084803.498337-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Alex Bennée <alex.bennee@linaro.org>

This is a heavily used function so lets avoid the cost of
CPU_GET_CLASS. On the romulus-bmc run it has a modest effect:

  Before: 36.812 s ±  0.506 s
  After:  35.912 s ±  0.168 s

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220811151413.3350684-4-alex.bennee@linaro.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/core/cpu-sysemu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index 00253f89293a..5eaf2e79e66c 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -69,11 +69,10 @@ hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
 
 int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
     int ret = 0;
 
-    if (cc->sysemu_ops->asidx_from_attrs) {
-        ret = cc->sysemu_ops->asidx_from_attrs(cpu, attrs);
+    if (cpu->cc->sysemu_ops->asidx_from_attrs) {
+        ret = cpu->cc->sysemu_ops->asidx_from_attrs(cpu, attrs);
         assert(ret < cpu->num_ases && ret >= 0);
     }
     return ret;
-- 
2.37.3


