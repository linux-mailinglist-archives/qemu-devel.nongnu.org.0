Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA286A42E2
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 14:35:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWdfJ-0006jO-91; Mon, 27 Feb 2023 08:35:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuval.shaia.ml@gmail.com>)
 id 1pWdf9-0006fB-Bz; Mon, 27 Feb 2023 08:35:31 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuval.shaia.ml@gmail.com>)
 id 1pWdf3-0008Fi-MS; Mon, 27 Feb 2023 08:35:30 -0500
Received: by mail-ed1-x533.google.com with SMTP id da10so25942420edb.3;
 Mon, 27 Feb 2023 05:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677504919;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=2R87fxRxuvFc06tZmTYTnKW6FrVlOp76tj8d5IiSmQc=;
 b=IghM2O1H4PZasklNAOXKUnparx8iMVgH9NmOyvBmTUPCw4fVPChGXTq7TePhiG+IyD
 Go5Egw28pE7cFy5d0TWh8S0FE7nPwWq6hy2oulIeRhuMcbka11129WREFGb/5O1P+HwC
 6GAxYU004d3swJ3Dx9jbmFw7OBkyT4+elLEbpBGmZKEBjYyfwoN5ZUDGzjIyekwLbWxq
 lvcoRYxCer9tFBkeHzHeorKAAjwleLmQCBD8A5povnc2xdKnqvT0KJFltXrxjUGXs1CW
 Qly2ITl1J0midLku1tri3XbLjGekjWkeUMAq6P3NLkcVeC2A2xmpGSLFNF0++M0b4yD/
 OB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677504919;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2R87fxRxuvFc06tZmTYTnKW6FrVlOp76tj8d5IiSmQc=;
 b=3msDOYx43pFCxlgUu8X4otLkkSOH59bclb3h+UTeuc3BfPwymQCGDEOhDxHTUQMYjv
 1TR7t+nYYm6rDT3Ql1ZXuf0ZvFteREA+6B0NVY36THZtARRLPosffIHwd9Jt1piNu4j7
 HvVdSR/tGd8TF/05w65XWO2BmIexWPzQidbjBMY58yUqyin03RaR6GzZs1zlkLZ8nVDt
 ApHN7mxvvmw2TMlTHZaHU3XRua/oRHoe+9m2NDoo9YWnr+wGp+fQVcbCdtKj1xf3Mofg
 FjKJGzvem4u0ChStFDArsRpuOj6uttuiRb2LM8EBxPLqTsMka1O6rVFBTh00alQJP8/s
 sYig==
X-Gm-Message-State: AO0yUKXfoMcYw83Oq5UBuJS9PKlAhmD+S4CsQo5v+dNqjFWGIruOB4Gg
 0XBSwlCYA7bKm+FBFx4EnyxLZt8/YudE6sZo
X-Google-Smtp-Source: AK7set/DyO4/D2YptmMemJ3EDDaIyVB4/Be51hBsrRQdMy8AaHysRqjSUzvtOq8kEsh5TRQuSjmDSQ==
X-Received: by 2002:a17:907:75c2:b0:8b1:3008:b4f3 with SMTP id
 jl2-20020a17090775c200b008b13008b4f3mr32500882ejc.52.1677504919636; 
 Mon, 27 Feb 2023 05:35:19 -0800 (PST)
Received: from localhost.localdomain ([2a00:a041:2ba6:7c00::1008])
 by smtp.gmail.com with ESMTPSA id
 c30-20020a50d65e000000b004acbe5409b4sm3129134edj.48.2023.02.27.05.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 05:35:18 -0800 (PST)
From: Yuval Shaia <yuval.shaia.ml@gmail.com>
To: qemu-devel@nongnu.org, soulchen8650@gmail.com, secalert@redhat.com,
 mcascell@redhat.com, qemu-security@nongnu.org, yuval.shaia.ml@gmail.com,
 marcel.apfelbaum@gmail.com
Subject: [PATCH] hw/pvrdma: Protect against buggy or malicious guest driver
Date: Mon, 27 Feb 2023 15:35:11 +0200
Message-Id: <20230227133511.5913-1-yuval.shaia.ml@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=yuval.shaia.ml@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Guest driver allocates and initialize page tables to be used as a ring
of descriptors for CQ and async events.
The page table that represents the ring, along with the number of pages
in the page table is passed to the device.
Currently our device supports only one page table for a ring.

Let's make sure that the number of page table entries the driver
reports, do not exceeds the one page table size.

Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
---
 hw/rdma/vmw/pvrdma_main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
index 4fc6712025..e84d68a81f 100644
--- a/hw/rdma/vmw/pvrdma_main.c
+++ b/hw/rdma/vmw/pvrdma_main.c
@@ -98,12 +98,20 @@ static int init_dev_ring(PvrdmaRing *ring, PvrdmaRingState **ring_state,
         return -EINVAL;
     }
 
+    if (num_pages > TARGET_PAGE_SIZE / sizeof(dma_addr_t)) {
+        rdma_error_report("Maximum pages on a single directory must not exceed %ld\n",
+                          TARGET_PAGE_SIZE / sizeof(dma_addr_t));
+        return -EINVAL;
+    }
+
     dir = rdma_pci_dma_map(pci_dev, dir_addr, TARGET_PAGE_SIZE);
     if (!dir) {
         rdma_error_report("Failed to map to page directory (ring %s)", name);
         rc = -ENOMEM;
         goto out;
     }
+
+    /* We support only one page table for a ring */
     tbl = rdma_pci_dma_map(pci_dev, dir[0], TARGET_PAGE_SIZE);
     if (!tbl) {
         rdma_error_report("Failed to map to page table (ring %s)", name);
-- 
2.20.1


