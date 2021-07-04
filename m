Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE02D3BAF1A
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 22:54:05 +0200 (CEST)
Received: from localhost ([::1]:59446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m097s-0006Us-V5
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 16:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1m096v-00057D-LW
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 16:53:05 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:52171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1m096t-0008Jx-BO
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 16:53:05 -0400
Received: by mail-wm1-x32a.google.com with SMTP id n33so2524895wms.1
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 13:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zZbd2/5JTaA7VwZ3/LPsZBUu4gZupP7sm+gNHOgeMf0=;
 b=i/u1ZwtViYgQqDS/w6QIMS2Soj/fO0uSSBlyZNk5cepYYMA0gIhqiqOO6RraAZP6mm
 p4c/vJ1Bb4bvuaERM585CadFsxOUboeAbGZCIQ1GFwFnNIGKHGwHuE0wCqPUnxiyXU+f
 3ZyGoKdByeEAH7Y+lr4VZe/IawKbI8Vaw+4RNvxqaQuTtJaMu8Xcgd2Z7KJgyrYoQVpd
 MUjAhEJV1Fgh/TzixBJKQ6BG4l/7ceQLdI1TPbvmn5KbV6Zb2FhHTIKG8byQ9ZjNkJsU
 jEfj8NW3ruua/gDz2GGgP69gNqK5uufvKCvnLx66ZC9scSUwCFQM2HRTJPtdWvD17wzc
 zuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zZbd2/5JTaA7VwZ3/LPsZBUu4gZupP7sm+gNHOgeMf0=;
 b=ruOQG2wDBDVBsrTtDwDS3fHb6IYBTZSiI3sfv96GHVwFR5uchi1cpk8O27HeJ37tpu
 KpnIN1hY+J8aAk2iGWDoWd9BDepKLPppWxgB9tCudwq0+AxXUNPGN99X0RgPSgPVDKko
 iUS61npTpTl2DHDdVWIrCJ+ami8oRVta0aiRXqcQIau0mxANVzb4AzgGdng0BaPt6rxZ
 Ev3Ak3uilvpeqOC0y9I3RBcb75quB9AQYFHt2qrxvkcPM6ADU0kIg+guKBjTj3tBf8jb
 Y1k/fQvEBMwcwHfInWiAF9LJPPGTRL1NQk6YkI4QVGL7GNEAtrxXfA2w3MwHmhfRme6S
 QZqg==
X-Gm-Message-State: AOAM532eC/sujUonWXmX2qmXv3ZJJVzanXGwQAYLitQM6PEDmdvtk5No
 XaInOI4XLPG1pS3d0o1gTS93B+NVkhk=
X-Google-Smtp-Source: ABdhPJzaDNptniK4gNUcvGrMfMs2+fspfuED7QIO394gch2Cc2nnfAQ0oSiR2dfVM+ibG+3dGBWpfA==
X-Received: by 2002:a1c:770a:: with SMTP id t10mr11140531wmi.29.1625431981959; 
 Sun, 04 Jul 2021 13:53:01 -0700 (PDT)
Received: from localhost.localdomain ([5.29.30.165])
 by smtp.gmail.com with ESMTPSA id y19sm17199997wmj.33.2021.07.04.13.53.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 04 Jul 2021 13:53:01 -0700 (PDT)
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL V2 2/3] pvrdma: Ensure correct input on ring init
 (CVE-2021-3607)
Date: Sun,  4 Jul 2021 23:52:54 +0300
Message-Id: <20210704205255.27124-3-marcel.apfelbaum@gmail.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20210704205255.27124-1-marcel.apfelbaum@gmail.com>
References: <20210704205255.27124-1-marcel.apfelbaum@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mcascell@redhat.com, pjp@fedoraproject.org, yuval.shaia.ml@gmail.com,
 vv474172261@gmail.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Check the guest passed a non zero page count
for pvrdma device ring buffers.

Fixes: CVE-2021-3607
Reported-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
Reviewed-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
Message-Id: <20210630114634.2168872-1-marcel@redhat.com>
Reviewed-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
Tested-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
---
 hw/rdma/vmw/pvrdma_main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
index 84ae8024fc..7c0c3551a8 100644
--- a/hw/rdma/vmw/pvrdma_main.c
+++ b/hw/rdma/vmw/pvrdma_main.c
@@ -92,6 +92,11 @@ static int init_dev_ring(PvrdmaRing *ring, PvrdmaRingState **ring_state,
     uint64_t *dir, *tbl;
     int rc = 0;
 
+    if (!num_pages) {
+        rdma_error_report("Ring pages count must be strictly positive");
+        return -EINVAL;
+    }
+
     dir = rdma_pci_dma_map(pci_dev, dir_addr, TARGET_PAGE_SIZE);
     if (!dir) {
         rdma_error_report("Failed to map to page directory (ring %s)", name);
-- 
2.17.2


