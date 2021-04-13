Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE7D35D472
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 02:28:48 +0200 (CEST)
Received: from localhost ([::1]:44138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lW6v9-0001xr-2r
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 20:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lW6tO-0000Xw-QA; Mon, 12 Apr 2021 20:26:58 -0400
Received: from ozlabs.org ([203.11.71.1]:46145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lW6tM-0006Nd-2Y; Mon, 12 Apr 2021 20:26:58 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FK5yL3wT9z9sWW; Tue, 13 Apr 2021 10:26:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618273610;
 bh=3inm0f7ZsVlLFJtACP2OGpr2eHDWVrhNIEPYhuN83yk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z84PKKs8i/vBkalVvnPQjpXJe4Ts0dsi728dPE665/qmyQ2qXSw5GU8Ax3AO/toXi
 uxpvQTVLgivkUwQWm3Jz1LtJLMyteftvWqHj/YMtTp4DKN8UOF/H/DO9HQQOsx+ji5
 kIOI8vQZxIk/MKBexMqlBIYXhz/q7v1DtwFaCluk=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 2/2] spapr.c: always pulse guest IRQ in
 spapr_core_unplug_request()
Date: Tue, 13 Apr 2021 10:26:48 +1000
Message-Id: <20210413002648.8281-3-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210413002648.8281-1-david@gibson.dropbear.id.au>
References: <20210413002648.8281-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

Commit 47c8c915b162 fixed a problem where multiple spapr_drc_detach()
requests were breaking QEMU. The solution was to just spapr_drc_detach()
once, and use spapr_drc_unplug_requested() to filter whether we already
detached it or not. The commit also tied the hotplug request to the
guest in the same condition.

Turns out that there is a reliable way for a CPU hotunplug to fail. If a
guest with one CPU hotplugs a CPU1, then offline CPU0s via 'echo 0 >
/sys/devices/system/cpu/cpu0/online', then attempts to hotunplug CPU1,
the kernel will refuse it because it's the last online CPU of the
system. Given that we're pulsing the IRQ only in the first try, in a
failed attempt, all other CPU1 hotunplug attempts will fail, regardless
of the online state of CPU1 in the kernel, because we're simply not
letting the guest know that we want to hotunplug the device.

Let's move spapr_hotplug_req_remove_by_index() back out of the "if
(!spapr_drc_unplug_requested(drc))" conditional, allowing for multiple
'device_del' requests to the same CPU core to reach the guest, in case
the CPU core didn't fully hotunplugged previously.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210401000437.131140-3-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 05a765fab4..e4be00b732 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3777,8 +3777,17 @@ void spapr_core_unplug_request(HotplugHandler *hotplug_dev, DeviceState *dev,
 
     if (!spapr_drc_unplug_requested(drc)) {
         spapr_drc_unplug_request(drc);
-        spapr_hotplug_req_remove_by_index(drc);
     }
+
+    /*
+     * spapr_hotplug_req_remove_by_index is left unguarded, out of the
+     * "!spapr_drc_unplug_requested" check, to allow for multiple IRQ
+     * pulses removing the same CPU. Otherwise, in an failed hotunplug
+     * attempt (e.g. the kernel will refuse to remove the last online
+     * CPU), we will never attempt it again because unplug_requested
+     * will still be 'true' in that case.
+     */
+    spapr_hotplug_req_remove_by_index(drc);
 }
 
 int spapr_core_dt_populate(SpaprDrc *drc, SpaprMachineState *spapr,
-- 
2.30.2


