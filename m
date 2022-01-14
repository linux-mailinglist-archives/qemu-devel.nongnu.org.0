Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D3848EBB7
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 15:33:21 +0100 (CET)
Received: from localhost ([::1]:36262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Ndp-0007d4-1Z
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 09:33:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1n8NFY-0006if-Co
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 09:08:16 -0500
Received: from [2604:1380:4641:c500::1] (port=45840 helo=dfw.source.kernel.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1n8NFV-0002pO-Pf
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 09:08:15 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AA51C61C7A;
 Fri, 14 Jan 2022 14:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17A00C36AEF;
 Fri, 14 Jan 2022 14:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642169285;
 bh=nAblTk6IMLqx5QlaZTT3XwmgPRTylGTb8UUfnkLW9S8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nmLLmF7g6b3bmG9mVpYoGxv3DQZXs99KYqXN1LZPtgkYkCdBy4J9LjTrARHX/ckmS
 pzglD1YgV406lpRMltInTPK0+g6n0ORZRoGArps3XjHF77DznIe0NtYUxGBu+9C99q
 UInDn12rX3AvUj/TRicDmWv+Us2huu2Rw/bVob1GuNviccjWfQwkzR68dxt5n94Jo5
 9kmGBxNAAbeiD3cj7n6kaarADfx8sqUj0zkUJywIg8GibH3+CFmtETO/WuWzXN+q3r
 vQZr6kFxAOjWIX4XKgFrIFRXzQAOzPwbemnaS1QrtS5B4Z9AIH2JKhmac12QZ9qvYu
 P/NQJBGZj6yhA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=hot-poop.lan)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1n8NFL-000V8K-9z; Fri, 14 Jan 2022 14:08:03 +0000
From: Marc Zyngier <maz@kernel.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 3/6] hw/arm/virt: Honor highmem setting when computing the
 memory map
Date: Fri, 14 Jan 2022 14:07:38 +0000
Message-Id: <20220114140741.1358263-4-maz@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220114140741.1358263-1-maz@kernel.org>
References: <20220114140741.1358263-1-maz@kernel.org>
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
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 hw/arm/virt.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index e734a75850..ecc3e3e5b0 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1663,7 +1663,7 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
 static void virt_set_memmap(VirtMachineState *vms)
 {
     MachineState *ms = MACHINE(vms);
-    hwaddr base, device_memory_base, device_memory_size;
+    hwaddr base, device_memory_base, device_memory_size, memtop;
     int i;
 
     vms->memmap = extended_memmap;
@@ -1690,7 +1690,11 @@ static void virt_set_memmap(VirtMachineState *vms)
     device_memory_size = ms->maxram_size - ms->ram_size + ms->ram_slots * GiB;
 
     /* Base address of the high IO region */
-    base = device_memory_base + ROUND_UP(device_memory_size, GiB);
+    memtop = base = device_memory_base + ROUND_UP(device_memory_size, GiB);
+    if (!vms->highmem && memtop > 4 * GiB) {
+        error_report("highmem=off, but memory crosses the 4GiB limit\n");
+        exit(EXIT_FAILURE);
+    }
     if (base < device_memory_base) {
         error_report("maxmem/slots too huge");
         exit(EXIT_FAILURE);
@@ -1707,7 +1711,7 @@ static void virt_set_memmap(VirtMachineState *vms)
         vms->memmap[i].size = size;
         base += size;
     }
-    vms->highest_gpa = base - 1;
+    vms->highest_gpa = (vms->highmem ? base : memtop) - 1;
     if (device_memory_size > 0) {
         ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
         ms->device_memory->base = device_memory_base;
-- 
2.30.2


