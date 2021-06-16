Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C16683A98C5
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 13:07:15 +0200 (CEST)
Received: from localhost ([::1]:60082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltTO6-0004xL-8j
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 07:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1ltTN3-0004Bd-B6
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 07:06:09 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:46057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1ltTN1-0007iE-L7
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 07:06:09 -0400
Received: by mail-ej1-x62e.google.com with SMTP id k7so3173508ejv.12
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 04:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=2pQj1kUHkGHfOc3rNl36Ref2TMdp97r9NtHSK0jUZq0=;
 b=MYd+sMiQsKLIpCvC+NkCbpSpPQ+bKtVT03i9kthNGrSZYyUwhOpAKllFR3KjC4fCDR
 fLjZX/sDj0ewQzlhf4C8/cD5gkJiyOLF3oa0/reGw7I6KmYeMglxknR+JWUefq5/XZr0
 mdtr3f/KtZcjl7V2dutz3MDbaG6ecJ+E5jmy4/zJoDVTJF8kx4PUUuEiPoAotJ7qVdb0
 6X/08A93XF96mPsx+hjpFLMOVBVLeo5bovgGYtJhascxYloG3CcV6Q3+QrI7qsR2A/rF
 EuZx5SMYL+Mw3UXo+73mIZWJUZXZQ6+FkJx62hJMuq87aP1Xf/HUTgrFVqaDdkD8k7PC
 ogmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=2pQj1kUHkGHfOc3rNl36Ref2TMdp97r9NtHSK0jUZq0=;
 b=aT6g4O5zjKhtKkGC7IRQqvSak1xXRlBSJLRGl5/2MyXU1bwNO3oxIUeogqmDxS7XOA
 8Nn43ylkGrbuNqCrrLDRxjh0y0+4BYDM0bIbjh3EQPQGJREiyDH0VlACOWNBaGs8H2lg
 pYugURqtI8chfuj385jP7oNZZ1hob/jeXIVzVojTid7UcQiLTzRjzFUkfUcqXUQTxXfV
 lwIsWnoUNmi+cIo8S5vWEuUHvI+xT1dQz981spEcXLWyowyNeN7TkqL2A6iWhq2mpSR2
 zPGYoAgteuSt8uGt5EX3anzNYT9f5gWBHwQpmFJAeCGzLtNx6hoFiO6J2HFEefPTMiQp
 Y65w==
X-Gm-Message-State: AOAM531rqmcFb3p3VhxL6pXKshPFpGQsxH9uhobvksfEcQvjDMEEUEgI
 RHWXFdyofNS1gOOLqkBDwy64WHna9eQ=
X-Google-Smtp-Source: ABdhPJywLK2H7imI7Vwlp+v2TXnsTUhCoX0xaEw+rlmJ4pZ0JQ/iGYRYijgW82aWMiTYuKTdDShKPQ==
X-Received: by 2002:a17:906:eb88:: with SMTP id
 mh8mr4631561ejb.540.1623841563794; 
 Wed, 16 Jun 2021 04:06:03 -0700 (PDT)
Received: from localhost.localdomain ([5.29.27.44])
 by smtp.gmail.com with ESMTPSA id s5sm1513261edi.93.2021.06.16.04.06.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 16 Jun 2021 04:06:03 -0700 (PDT)
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/rdma: Fix possible mremap overflow in the pvrdma device
 (CVE-2021-3582)
Date: Wed, 16 Jun 2021 14:06:00 +0300
Message-Id: <20210616110600.20889-1-marcel.apfelbaum@gmail.com>
X-Mailer: git-send-email 2.17.2
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-ej1-x62e.google.com
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
Cc: mcascell@redhat.com, pjp@fedoraproject.org, mst@redhat.com,
 yuval.shaia.ml@gmail.com, vv474172261@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marcel Apfelbaum <marcel@redhat.com>

Ensure mremap boundaries not trusting the guest kernel to
pass the correct buffer length.

Fixes: CVE-2021-3582
Reported-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
Tested-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
---
 hw/rdma/vmw/pvrdma_cmd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
index f59879e257..dadab4966b 100644
--- a/hw/rdma/vmw/pvrdma_cmd.c
+++ b/hw/rdma/vmw/pvrdma_cmd.c
@@ -38,6 +38,12 @@ static void *pvrdma_map_to_pdir(PCIDevice *pdev, uint64_t pdir_dma,
         return NULL;
     }
 
+    length = ROUND_UP(length, TARGET_PAGE_SIZE);
+    if (nchunks * TARGET_PAGE_SIZE != length) {
+        rdma_error_report("Invalid nchunks/length (%u, %lu)", nchunks, length);
+        return NULL;
+    }
+
     dir = rdma_pci_dma_map(pdev, pdir_dma, TARGET_PAGE_SIZE);
     if (!dir) {
         rdma_error_report("Failed to map to page directory");
-- 
2.17.2


