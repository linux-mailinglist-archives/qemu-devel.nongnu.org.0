Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 702644E274B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 14:14:21 +0100 (CET)
Received: from localhost ([::1]:39488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWHrY-00040D-Ap
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 09:14:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuval.shaia.ml@gmail.com>)
 id 1nWHp9-0002ea-1a
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 09:11:52 -0400
Received: from [2a00:1450:4864:20::631] (port=40584
 helo=mail-ej1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuval.shaia.ml@gmail.com>)
 id 1nWHp7-0005CP-Hv
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 09:11:50 -0400
Received: by mail-ej1-x631.google.com with SMTP id p15so29722916ejc.7
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 06:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rw3BvSzLUICVSKRTUElxsDTnLrG1TOeRBBtMoBza3Yg=;
 b=bKQUeA6mYXz0l+xEHkMkvMuWgGootA2mBL27tHnINhbWcACMrCteXGe9zJIfVW4i1k
 Sk3TdSMVaN1nSNL7mT4oB8jZJ689oAtBQUQZ2sMzNkGLk5UVCnl/lrvuQZqD5fNKVotM
 B4LDfsQl+KRCUm67gQn5YJE/Nww74RB4XaASiwYPAQQ4xj9v/gDVvperjR6XhCagksHb
 NBe63XY3x/TXCjOBLNs/KFkgJ53+DluMWy5Xl+Dq4Uv2M351IlbYbM8LBx6+osYqfuF1
 bz1sPFYLBJy8Zhl8/XAg8uV/aswM0YsBY0h8hR+chbVXPWXMCZgOvqGv9AsS4n0hew5T
 Go9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rw3BvSzLUICVSKRTUElxsDTnLrG1TOeRBBtMoBza3Yg=;
 b=pH8ac/bJCll8ac7Pxipl6DeAUyFHKdf1i8hM6QknWCiyjhp53jgT+518rK9HAJ1ShD
 kIymln6mPNydpA2UvOwC0AFiVj1hkwnyoBEjpVUNTdVYojfSEQ2g1QktHL1lL7dFdDNM
 +OFZ2LAnJB8oG8OBneiJhNPRX7dLANrbD8Y1yan5TO/jAmjacMO8l4I7echLQibX4r1K
 Z2smlE6zR67MntM9npkZgOfL1HPP+Fk6CrkN2ajX4IXiCXqpmWwlnsATc1YmiTWx8MV4
 7i9AfnkFrO/kPoNh06ngacy8SkixHRL1Pu575rFY+/jT7jH3Etr+6/1Uc7Pv7na8hQKF
 gwKA==
X-Gm-Message-State: AOAM533QtGaBJEJtRVLnz/vHlTzAQQ/t4HhpGb9iHWvZHxGY4Hm4GVPD
 5PHNuEjh/O2nljEMgIGG0H4/PvS7VgM=
X-Google-Smtp-Source: ABdhPJwGGM/mlQly+AjdwPfJypCKe9cTLgSwzFsk/9+lgCZuJyW0dHWHuxEKYV0FpaiNW3Bxw2Om2A==
X-Received: by 2002:a17:906:6a08:b0:6df:d511:3760 with SMTP id
 qw8-20020a1709066a0800b006dfd5113760mr10507072ejc.682.1647868307308; 
 Mon, 21 Mar 2022 06:11:47 -0700 (PDT)
Received: from localhost.localdomain ([5.29.20.198])
 by smtp.gmail.com with ESMTPSA id
 l2-20020aa7cac2000000b003f9b3ac68d6sm7888359edt.15.2022.03.21.06.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 06:11:47 -0700 (PDT)
From: Yuval Shaia <yuval.shaia.ml@gmail.com>
To: qemu-devel@nongnu.org, yuval.shaia.ml@gmail.com,
 marcel.apfelbaum@gmail.com, mcascell@redhat.com, wxhusst@gmail.com
Subject: [PATCH] hw/pvrdma: Protect against buggy or malicious guest driver
Date: Mon, 21 Mar 2022 15:11:43 +0200
Message-Id: <20220321131143.31210-1-yuval.shaia.ml@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::631
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=yuval.shaia.ml@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: 23
X-Spam_score: 2.3
X-Spam_bar: ++
X-Spam_report: (2.3 / 5.0 requ) AC_FROM_MANY_DOTS=2.996, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Guest driver might execute HW commands when shared buffers are not yet
allocated.
This might happen on purpose (malicious guest) or because some other
guest/host address mapping.
We need to protect againts such case.

Reported-by: Mauro Matteo Cascella <mcascell@redhat.com>
Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
---
 hw/rdma/vmw/pvrdma_cmd.c  | 6 ++++++
 hw/rdma/vmw/pvrdma_main.c | 9 +++++----
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
index da7ddfa548..89db963c46 100644
--- a/hw/rdma/vmw/pvrdma_cmd.c
+++ b/hw/rdma/vmw/pvrdma_cmd.c
@@ -796,6 +796,12 @@ int pvrdma_exec_cmd(PVRDMADev *dev)
 
     dsr_info = &dev->dsr_info;
 
+    if (!dsr_info->dsr) {
+            /* Buggy or malicious guest driver */
+            rdma_error_report("Exec command without dsr, req or rsp buffers");
+            goto out;
+    }
+
     if (dsr_info->req->hdr.cmd >= sizeof(cmd_handlers) /
                       sizeof(struct cmd_handler)) {
         rdma_error_report("Unsupported command");
diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
index 91206dbb8e..aae382af59 100644
--- a/hw/rdma/vmw/pvrdma_main.c
+++ b/hw/rdma/vmw/pvrdma_main.c
@@ -159,13 +159,13 @@ static void free_dsr(PVRDMADev *dev)
     free_dev_ring(pci_dev, &dev->dsr_info.cq, dev->dsr_info.cq_ring_state);
 
     rdma_pci_dma_unmap(pci_dev, dev->dsr_info.req,
-                         sizeof(union pvrdma_cmd_req));
+                       sizeof(union pvrdma_cmd_req));
 
     rdma_pci_dma_unmap(pci_dev, dev->dsr_info.rsp,
-                         sizeof(union pvrdma_cmd_resp));
+                       sizeof(union pvrdma_cmd_resp));
 
     rdma_pci_dma_unmap(pci_dev, dev->dsr_info.dsr,
-                         sizeof(struct pvrdma_device_shared_region));
+                       sizeof(struct pvrdma_device_shared_region));
 
     dev->dsr_info.dsr = NULL;
 }
@@ -249,7 +249,8 @@ static void init_dsr_dev_caps(PVRDMADev *dev)
 {
     struct pvrdma_device_shared_region *dsr;
 
-    if (dev->dsr_info.dsr == NULL) {
+    if (!dev->dsr_info.dsr) {
+        /* Buggy or malicious guest driver */
         rdma_error_report("Can't initialized DSR");
         return;
     }
-- 
2.20.1


