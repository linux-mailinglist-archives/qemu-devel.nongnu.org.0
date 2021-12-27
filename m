Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 860C74804DA
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 22:19:38 +0100 (CET)
Received: from localhost ([::1]:44832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1xP7-0007yS-LA
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 16:19:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1n1xMj-0005IB-W2
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 16:17:10 -0500
Received: from [2604:1380:4641:c500::1] (port=35450 helo=dfw.source.kernel.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1n1xMh-0002WZ-2J
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 16:17:09 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3B6F261170;
 Mon, 27 Dec 2021 21:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5553C36AED;
 Mon, 27 Dec 2021 21:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640639825;
 bh=IHY2+6hBS2o9nbH7P+X3mza23XiKdsCbkiZ64E2sCow=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ll0djBguy52iSPcnsf8MC/e8sqKmI9zoHgkxDQf+dlCiMB0RmCRRHYwoaAWJ5tmnO
 GYR+/H+tZpPDwl2chLHs7n3O7m5FfCSZV+oq88b3hT/nVVMVZgPtNNWwS/Kz15L0jZ
 yQZHAPhn8XYLlR7OA7JNXqta2STrYQKHUsFU7aStqCI9ZXWqg/d1uxmGPdnRdHug5D
 DWJDt9mObZMaNKCP3uCK4G9KqKdqdShIh2YBe17yoyAA8XuZDBRYGAevDZnlOvlWX7
 3WZUyoLbRzh5LQjm8e0bkSagPYwinUH2MB97KW9EKe6lNzNsoceQJ/CfqGuKO2kT5h
 125hjUH8pRCYA==
Received: from cfbb000407.r.cam.camfibre.uk ([185.219.108.64]
 helo=hot-poop.lan)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1n1xMd-00Ed4b-OD; Mon, 27 Dec 2021 21:17:03 +0000
From: Marc Zyngier <maz@kernel.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/5] hw/arm/virt: Honor highmem setting when computing the
 memory map
Date: Mon, 27 Dec 2021 21:16:40 +0000
Message-Id: <20211227211642.994461-4-maz@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211227211642.994461-1-maz@kernel.org>
References: <20211227211642.994461-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: qemu-devel@nongnu.org, drjones@redhat.com,
 eric.auger@redhat.com, peter.maydell@linaro.org, kvmarm@lists.cs.columbia.edu,
 kvm@vger.kernel.org, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2604:1380:4641:c500::1
 (failed)
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=maz@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.575,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Even when the VM is configured with highmem=off, the highest_gpa
field includes devices that are above the 4GiB limit.
Similarily, nothing seem to check that the memory is within
the limit set by the highmem=off option.

This leads to failures in virt_kvm_type() on systems that have
a crippled IPA range, as the reported IPA space is larger than
what it should be.

Instead, honor the user-specified limit to only use the devices
at the lowest end of the spectrum, and fail if we have memory
crossing the 4GiB limit.

Reviewed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 hw/arm/virt.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 8b600d82c1..84dd3b36fb 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1678,6 +1678,11 @@ static void virt_set_memmap(VirtMachineState *vms)
         exit(EXIT_FAILURE);
     }
 
+    if (!vms->highmem &&
+        vms->memmap[VIRT_MEM].base + ms->maxram_size > 4 * GiB) {
+        error_report("highmem=off, but memory crosses the 4GiB limit\n");
+        exit(EXIT_FAILURE);
+    }
     /*
      * We compute the base of the high IO region depending on the
      * amount of initial and device memory. The device memory start/size
@@ -1707,7 +1712,9 @@ static void virt_set_memmap(VirtMachineState *vms)
         vms->memmap[i].size = size;
         base += size;
     }
-    vms->highest_gpa = base - 1;
+    vms->highest_gpa = (vms->highmem ?
+                        base :
+                        vms->memmap[VIRT_MEM].base + ms->maxram_size) - 1;
     if (device_memory_size > 0) {
         ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
         ms->device_memory->base = device_memory_base;
-- 
2.30.2


