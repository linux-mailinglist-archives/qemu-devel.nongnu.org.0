Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 298753BACC6
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 13:00:42 +0200 (CEST)
Received: from localhost ([::1]:47324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzzrc-0007rF-Te
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 07:00:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1lzznz-00013N-Jt
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 06:56:55 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:37625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1lzznx-0000XQ-J5
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 06:56:55 -0400
Received: by mail-ej1-x634.google.com with SMTP id i20so24040209ejw.4
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 03:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=F5WE2Vl4Q4RX4zD90DF2ndK28kwIMaQZFqlKKBZcuLg=;
 b=ioVHmdPGPL/3G4coLWmp91OJWn6Dhv+T9o0r+nC8Rc9MKwk+wCK0pFkq+GPkqmF3ae
 u2LGMACJnvvw1b9tc5fZ5AEWwLpeb9ulW7KHS/oSWRemXlf+yYMRScfrYag/7xvrar97
 jQwt/S4WpO3vH2+Qq7v0rxZqamfltxQTRX6aIkWutz+6YfbEdPSXnMRRNIWQ/vQPqCEF
 DfJlWo7DKDw0hEF4D3RmUyrrVVS5wsATEq4muEodjkfnN3Eu9n/uaoMx+o6xk8Jw7e3N
 cg8zATOicXAmfwcILoVxFOx+OfGz+/cAm38Z5KJ1OV6RtwxrVmnnn157VRwmP+0LHWuO
 O51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=F5WE2Vl4Q4RX4zD90DF2ndK28kwIMaQZFqlKKBZcuLg=;
 b=ZilhrQlUeIwFA3PO+TRwHR3WdbwGJvhzKC5S6UM5hvgJLSC4/LK6N+FjxmfQkr74AZ
 81VZAlPLEqS9qB2LnYd08N9znKmj+iIE+l67NX1mJ10E1itCCS7rgaKucN0/Q5iZOTI6
 ZvthMJoKS1jxj0PoW1BeqOXwXha5056/7aIwEc8PBpfEoVaATtmUQHwf9+KwtWJN25ac
 IGtpewo7x33kEtNQk12lVmysGKcgZOqQ/M6cICQdGWEwlNDqKe2JH19Q2ulFaVvEHlbE
 7w6gPE0g6nuYPZsQm+zktBZb6MmHbxZbShvtoML3YpxopbILgjTPrtoAK+xo0C7ewehm
 vJhg==
X-Gm-Message-State: AOAM531EnHuoBtLm0aNNxLc4EfFE0cvHBlt7XNkYleWacPHstGSvU7Db
 PKjqIlv0l/ZrATupb6e9b2T4BvoFHgA=
X-Google-Smtp-Source: ABdhPJxaa1qwOLmMjdy64XxXAtPwncVJREjRtOnqS5ogBmccXfbmgdrdTchgP7rSuSa5WlPdX9Estg==
X-Received: by 2002:a17:907:2d29:: with SMTP id
 gs41mr8389369ejc.404.1625396212090; 
 Sun, 04 Jul 2021 03:56:52 -0700 (PDT)
Received: from localhost.localdomain ([5.29.30.165])
 by smtp.gmail.com with ESMTPSA id o21sm3795839eds.10.2021.07.04.03.56.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 04 Jul 2021 03:56:51 -0700 (PDT)
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 1/3] hw/rdma: Fix possible mremap overflow in the pvrdma device
 (CVE-2021-3582)
Date: Sun,  4 Jul 2021 13:56:44 +0300
Message-Id: <20210704105646.13524-2-marcel.apfelbaum@gmail.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20210704105646.13524-1-marcel.apfelbaum@gmail.com>
References: <20210704105646.13524-1-marcel.apfelbaum@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-ej1-x634.google.com
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


