Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 301343BAF19
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 22:54:04 +0200 (CEST)
Received: from localhost ([::1]:59302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m097q-0006P3-R6
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 16:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1m096u-00056i-Ai
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 16:53:04 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:43739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1m096r-0008J4-PC
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 16:53:04 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 q18-20020a1ce9120000b02901f259f3a250so9955422wmc.2
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 13:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8zuVBKF0lHFrxi85Ur4QwmAtt+OtLI2NAGW+7dDRMEY=;
 b=Pjn45Vh8oP8s8mCuslaAMbZLNQVeheigAbEEOADX7qX4RC3cbPg/f+0GZL6OrE/pvU
 TOCfZD/fgd5dNMyGRDk70N9xv33LFAeUn2a0HgI5HWnJknQyI1O+c8EmQyvDsY8Jzj0m
 AKD9NXI/QDZWnRlO5HnLIvV/K4yGrxqGotVZq+HOZJZr2Wl8ESPlSt182JTz/bxx+ofm
 FbcJvnk5sTiCRVodQ1vhCYALX4gRjVaADdwEIn0GXe+lSqozj+3gI2Y022kMFCC/I2Q7
 K6kOosScnsij6mQqKnpbjG+vb4I0S2msAQeZeIpOAdzMNtfzSJcJszMD/RM4MLUXWu7j
 2AFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8zuVBKF0lHFrxi85Ur4QwmAtt+OtLI2NAGW+7dDRMEY=;
 b=mr6o0Jhc8XGlWcOUAMjtMP4lxuqyunee41+/KLptvSuYcWFahso3yz6xElW8vnoMfI
 QxLC7A0cy1H+y4pNQFS15Fp7H/kZNXwPBCFOJqsunu6mSU23O32VmxUT5m8+hksbtR3c
 QzsdI8mkxMBplE9y1Bhc3sJEm4pLl/x9vTCt2O2fxcvz+bodzVCZ5artF4dAzrXywqeC
 fAUhIZNPoQGT0Q3w9MlhjD4pRz6FyZD8aVKrfHXGx/Rbh5KEIJmlmhjQIb0Nh2B+mqIi
 lsTQTdwTDGm51SrajrGCqyBcb44jI9nbalXUtySrmTYweV2ubTC6/6JjcxqBe97tCFvx
 44IQ==
X-Gm-Message-State: AOAM531hTDSOcHlskPtZ2PF3kjI08NA4Rk7yuQJEG+HkjC+DVOT5SEPp
 SQZ8N1HBhgf8H3w8N62/mQhbOSCGKkg=
X-Google-Smtp-Source: ABdhPJxVZVCrNFTwIjw1acBxnXJ5QoFHcx3FhzmYYR3mgyM3DlYYKMjaIwbqB5hv3AgV7NIlFj34iA==
X-Received: by 2002:a05:600c:4e88:: with SMTP id
 f8mr11076430wmq.14.1625431980386; 
 Sun, 04 Jul 2021 13:53:00 -0700 (PDT)
Received: from localhost.localdomain ([5.29.30.165])
 by smtp.gmail.com with ESMTPSA id y19sm17199997wmj.33.2021.07.04.13.52.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 04 Jul 2021 13:52:59 -0700 (PDT)
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL V2 1/3] hw/rdma: Fix possible mremap overflow in the pvrdma
 device (CVE-2021-3582)
Date: Sun,  4 Jul 2021 23:52:53 +0300
Message-Id: <20210704205255.27124-2-marcel.apfelbaum@gmail.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20210704205255.27124-1-marcel.apfelbaum@gmail.com>
References: <20210704205255.27124-1-marcel.apfelbaum@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-wm1-x335.google.com
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

From: Marcel Apfelbaum <marcel@redhat.com>

Ensure mremap boundaries not trusting the guest kernel to
pass the correct buffer length.

Fixes: CVE-2021-3582
Reported-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
Tested-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
Message-Id: <20210616110600.20889-1-marcel.apfelbaum@gmail.com>
Reviewed-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
Tested-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
Reviewed-by: Prasad J Pandit <pjp@fedoraproject.org>
Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
---
 v1 -> v2: Fix compilation issue on 32-bit hosts

 hw/rdma/vmw/pvrdma_cmd.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
index f59879e257..da7ddfa548 100644
--- a/hw/rdma/vmw/pvrdma_cmd.c
+++ b/hw/rdma/vmw/pvrdma_cmd.c
@@ -38,6 +38,13 @@ static void *pvrdma_map_to_pdir(PCIDevice *pdev, uint64_t pdir_dma,
         return NULL;
     }
 
+    length = ROUND_UP(length, TARGET_PAGE_SIZE);
+    if (nchunks * TARGET_PAGE_SIZE != length) {
+        rdma_error_report("Invalid nchunks/length (%u, %lu)", nchunks,
+                          (unsigned long)length);
+        return NULL;
+    }
+
     dir = rdma_pci_dma_map(pdev, pdir_dma, TARGET_PAGE_SIZE);
     if (!dir) {
         rdma_error_report("Failed to map to page directory");
-- 
2.17.2


