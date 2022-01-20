Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDE349533A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 18:29:56 +0100 (CET)
Received: from localhost ([::1]:54964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAbFz-0001Lp-QK
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 12:29:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgV-0004Fk-Ll
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:00 -0500
Received: from [2a00:1450:4864:20::332] (port=55838
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgT-0003HC-55
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:59 -0500
Received: by mail-wm1-x332.google.com with SMTP id c66so11771332wma.5
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/NfTLPWOeFMHwkrMPtZ5dblg8GV5USf+bzr32beD21U=;
 b=gELXNFypClVzAoubnjvGujwOTXNwzhmZoDqOwAHmd9cNpfH5eoxlUUSvlojB3QgfAV
 nNU9CDXWFDyylrkNXTwweCfhvIecO+sdiH3aZ31MHQxmqdbCFZS0P16bKjblxMXg7v2W
 Ckj9BmDU0SegugVYWdKiwYPlAGqKxo07t5BlznEQL6zWNzxedBH910S2ztcv71EDqRgX
 +8ghsVYy8qGmcz2bYBvgWS6giscH+dseZwBd+dNMq46dlqrF1JVxVsggxUks8wbhei88
 Ym6pCvckdJDciEY/ohXGoIwT2UJVVhqZb99Gksii2sGXrkFxP0usJGttKrgFePKBULjr
 ESdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/NfTLPWOeFMHwkrMPtZ5dblg8GV5USf+bzr32beD21U=;
 b=qEZHXMzmqxC7YAtgGWueNER52CE4Qx1iuGfe/xgWwo+tCJI96b9a3cttNahera78n8
 9mGcwbmlvrkbfy7/3L6ZqRUdctAY3owu1DyyXCnD57O5H8rIBUtHbr3xMWLPlJoDJqYI
 n+PlxVrwnEFwVf+YAqRLw/xIav8fAllPplTKvR2Od1PLYrRL2BTY1sYJce+SjQC0s+8A
 gmbuvzi5yu/i/DmE3vutFKydy0d3dO3iEbDECWP5iC+bOQLzI6b/USZOwm0M1kT5O1Mh
 SJW5vvX7oPNAJSYCS4UFHhCOziZaixCgmEbrKKu+3BTkKuyqfvdqkONyWhDkWJxc6dn9
 i3xg==
X-Gm-Message-State: AOAM531SYY7SSNBypTVJweICdJsx1D/EU+ZCpOmer2s4mA4D8ltHpiRz
 FXKKVaCSJwFEgPfjUIpxjXTvmhKrJqh1wA==
X-Google-Smtp-Source: ABdhPJyQxFYqnQZR9mfU7EZeVh8FMvX94fxlCBtdR1yQiXwGnbq1PTElhcZEtL+eaHgNydpz9WRD7A==
X-Received: by 2002:adf:e2cc:: with SMTP id d12mr33056426wrj.107.1642682212648; 
 Thu, 20 Jan 2022 04:36:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.36.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:36:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/38] hw/arm/virt: Honor highmem setting when computing the
 memory map
Date: Thu, 20 Jan 2022 12:36:10 +0000
Message-Id: <20220120123630.267975-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Marc Zyngier <maz@kernel.org>

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
Message-id: 20220114140741.1358263-4-maz@kernel.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 62bdce1eb4b..3b839ba78ba 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1670,7 +1670,7 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
 static void virt_set_memmap(VirtMachineState *vms)
 {
     MachineState *ms = MACHINE(vms);
-    hwaddr base, device_memory_base, device_memory_size;
+    hwaddr base, device_memory_base, device_memory_size, memtop;
     int i;
 
     vms->memmap = extended_memmap;
@@ -1697,7 +1697,11 @@ static void virt_set_memmap(VirtMachineState *vms)
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
@@ -1714,7 +1718,7 @@ static void virt_set_memmap(VirtMachineState *vms)
         vms->memmap[i].size = size;
         base += size;
     }
-    vms->highest_gpa = base - 1;
+    vms->highest_gpa = (vms->highmem ? base : memtop) - 1;
     if (device_memory_size > 0) {
         ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
         ms->device_memory->base = device_memory_base;
-- 
2.25.1


