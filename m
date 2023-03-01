Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B53FF6A6E73
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 15:30:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXNSd-0003qL-Uh; Wed, 01 Mar 2023 09:29:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuval.shaia.ml@gmail.com>)
 id 1pXNSb-0003pI-Dc; Wed, 01 Mar 2023 09:29:37 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuval.shaia.ml@gmail.com>)
 id 1pXNSZ-0002T3-GS; Wed, 01 Mar 2023 09:29:37 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 p23-20020a05600c1d9700b003ead4835046so811970wms.0; 
 Wed, 01 Mar 2023 06:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677680972;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=K4k4LtUkNYDW1bkTElTYrPLKW8PtNRAIahp/P7b6ndw=;
 b=k3QnDyqSTGgymoBbZnLHmVEH6ym3vPRFy9Pny/8xF0TKOmQkOgUKaVJWBOAktlSsv1
 uVLs/KssQuJtnTgOtK2e78ExxNY38sAN8iYw8EGwZteaVtSJ56AIwLNTarnrkjtF0Wr3
 PfAX8XWzrfiEi9+63LAB1bSbulTic7mD+jpqFsYTi7UAJUMcsBQDbbOI+DrlgGjOS+Na
 TCTD2MwssEexWMfRjdaTghUMOUhB8MKyALNIRIyfNyJh3/1j5/lFH35rIVPC6mLsM8Hp
 v5/Ob6AlfIPGDxLPWBmm8JxNvThA4us+5zmeKWXaFDrkQrmt6l71F48O5GK9bFQOGQ8b
 DAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677680972;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K4k4LtUkNYDW1bkTElTYrPLKW8PtNRAIahp/P7b6ndw=;
 b=Jw7dpb81eMasRVBKD9bt8fXOXnlpFZ3UoKzOqJknbgJon/WPe1jIFJ7WpvHSWadMD/
 NoWb2M8qG6CwpXc6yIG+u1lNwNc630p3VymHk2Acf08FXHsOwJAPYDBJL9cOuhVPx2J3
 FBu3i4QYZ9sTAuVCakyAJPdVQcpN5QE88ZeZCYGFj9WnnmkOy0alsgwzMDQWT38pEAcW
 FyCHuriZfU4ScpNal5xMiRopE/4r40fQh6NhTfFyoGIhGsIhuRSWXBX/qW4V7Bt8+DzE
 qyttpQKz3TM2NXsAd8kW7ExsKTjouUAF5UjlC8sbnC58X5Sp4n37EqpncVgca+mWdWwM
 0a4Q==
X-Gm-Message-State: AO0yUKXHCnzHqscrS7HRiOKOg+UJrjkmbYHTy82EBFZUnd9S9Wrn3npl
 VbwPHX28SHHBGmhKJCpkvql/4sdnCKWNQ6pj
X-Google-Smtp-Source: AK7set9zFW54usfmqBXg0ZtHCoDNXTCX+lKOE1hKqrq/EfNfhumg68c5tPR7+n0X0CKKjXX5XAH2Vw==
X-Received: by 2002:a05:600c:2e89:b0:3eb:376e:2bb7 with SMTP id
 p9-20020a05600c2e8900b003eb376e2bb7mr4977910wmn.3.1677680972509; 
 Wed, 01 Mar 2023 06:29:32 -0800 (PST)
Received: from localhost.localdomain ([2a00:a041:2ba6:7c00::1002])
 by smtp.gmail.com with ESMTPSA id
 fm26-20020a05600c0c1a00b003e6dcd562a6sm16556087wmb.28.2023.03.01.06.29.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 06:29:31 -0800 (PST)
From: Yuval Shaia <yuval.shaia.ml@gmail.com>
To: qemu-devel@nongnu.org, soulchen8650@gmail.com, secalert@redhat.com,
 mcascell@redhat.com, qemu-security@nongnu.org, yuval.shaia.ml@gmail.com,
 marcel.apfelbaum@gmail.com
Subject: [PATCH v1] hw/pvrdma: Protect against buggy or malicious guest driver
Date: Wed,  1 Mar 2023 16:29:26 +0200
Message-Id: <20230301142926.18686-1-yuval.shaia.ml@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=yuval.shaia.ml@gmail.com; helo=mail-wm1-x32f.google.com
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

Reported-by: Soul Chen <soulchen8650@gmail.com>
Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
---
v0 -> v1:
	* Take ring-state into account
	* Add Reported-by
---
 hw/rdma/vmw/pvrdma_main.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
index 4fc6712025..55b338046e 100644
--- a/hw/rdma/vmw/pvrdma_main.c
+++ b/hw/rdma/vmw/pvrdma_main.c
@@ -91,19 +91,33 @@ static int init_dev_ring(PvrdmaRing *ring, PvrdmaRingState **ring_state,
                          dma_addr_t dir_addr, uint32_t num_pages)
 {
     uint64_t *dir, *tbl;
-    int rc = 0;
+    int max_pages, rc = 0;
 
     if (!num_pages) {
         rdma_error_report("Ring pages count must be strictly positive");
         return -EINVAL;
     }
 
+    /*
+     * Make sure we can satisfy the requested number of pages in a single
+     * TARGET_PAGE_SIZE sized page table (taking into account that first entry
+     * is reserved for ring-state)
+     */
+    max_pages = TARGET_PAGE_SIZE / sizeof(dma_addr_t) - 1;
+    if (num_pages > max_pages) {
+        rdma_error_report("Maximum pages on a single directory must not exceed %d\n",
+                          max_pages);
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


