Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 435E04F0896
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Apr 2022 11:36:52 +0200 (CEST)
Received: from localhost ([::1]:37492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nawfC-0005Vd-Qu
	for lists+qemu-devel@lfdr.de; Sun, 03 Apr 2022 05:36:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuval.shaia.ml@gmail.com>)
 id 1nawdJ-0004m0-UL
 for qemu-devel@nongnu.org; Sun, 03 Apr 2022 05:34:54 -0400
Received: from [2a00:1450:4864:20::630] (port=44946
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuval.shaia.ml@gmail.com>)
 id 1nawdI-0006sf-F1
 for qemu-devel@nongnu.org; Sun, 03 Apr 2022 05:34:53 -0400
Received: by mail-ej1-x630.google.com with SMTP id qh7so4253974ejb.11
 for <qemu-devel@nongnu.org>; Sun, 03 Apr 2022 02:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bCP76kMhp+smqZ9p7BOGmSxcs8Eg35ns9wRdFYuQm7g=;
 b=BVgFNv0S946BvHRWqZmo9fVOUEbdwxKg+SKPY+NkjuZa+Y8dcCNBI6tRhOTpAfAtDi
 XSuL+vK3BYhj1uNf8wrSNgbh9WsusBJBvYzd3XvunoeNXv87i+ROhR4G51y+yEwew+IP
 8MkOD6EjF6yl6PUA2gNeFLN/1AloOiSg2k4cGQ89I5tM1Kbx1aucS9xyrvfWaFBkKUPm
 lHAX3KiQrNRm8HeZ8RAiFwHCGHSCQpM75JA4hR9V6Eq6MYTPKmWKW/Nd7XqMoNr0Ynmr
 eBdvNM2eKq8D4XML+W8Z1P1ZW6qEW2NkLQ4Rr1ccsNEB6dHRdJxD+LplfdqDN7yNjPNJ
 Y/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bCP76kMhp+smqZ9p7BOGmSxcs8Eg35ns9wRdFYuQm7g=;
 b=Zjv+UYZF8/YOESRxAeB4tiyCwCuUXtk48/7PB/UgybyJu0d0aF6B/6lCHvWipJ//OD
 Lp3yk4574zsLrn62KQP++X5Qw06zPqlLPd7tK1LMIm/+ZAy3Ees9CwMKygGKshaT0Zx+
 gi34IcVV5/IzI/uWoi5yLzH74dQQvSdE/OoiCDVd84m6R55a0u1AH3+Fu7FfSyNF/PKx
 1LYSt4nMFdJjvdRoRxZDYqlSp4romBaTbX3PG6VufMD8fHh6cu9dZSyn4MchSEX14c7d
 9xEJoKMTJFbbpA+10X7ZbYomgf2EfMjsLrPcF3XbP5C95qa03U1wRKXZPZ7mt0elVHIB
 phlw==
X-Gm-Message-State: AOAM5307CjtBgvlU39BBINh1rs3Tz/x95zSVLybJyBRtpTIsz/brab/F
 cnh7ZuN7Lksid+0DVbY2br+tHHjcE38=
X-Google-Smtp-Source: ABdhPJy2WKcJxnSRQwUCfBCacM7XCtOUAKNP+DAfuvyAeBDboOocnNzaGFsJK8B0YRKxxZUanCLlCQ==
X-Received: by 2002:a17:907:c018:b0:6df:fb9b:e6f8 with SMTP id
 ss24-20020a170907c01800b006dffb9be6f8mr6380482ejc.495.1648978488774; 
 Sun, 03 Apr 2022 02:34:48 -0700 (PDT)
Received: from localhost.localdomain ([5.29.20.198])
 by smtp.gmail.com with ESMTPSA id
 x17-20020a170906297100b006e49a9535f3sm3037549ejd.114.2022.04.03.02.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 02:34:48 -0700 (PDT)
From: Yuval Shaia <yuval.shaia.ml@gmail.com>
To: qemu-devel@nongnu.org, yuval.shaia.ml@gmail.com,
 marcel.apfelbaum@gmail.com, mcascell@redhat.com, wxhusst@gmail.com
Subject: [PATCH v2] hw/pvrdma: Protect against buggy or malicious guest driver
Date: Sun,  3 Apr 2022 12:32:44 +0300
Message-Id: <20220403093244.1055-1-yuval.shaia.ml@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=yuval.shaia.ml@gmail.com; helo=mail-ej1-x630.google.com
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
This could happen on purpose (malicious guest) or because of some other
guest/host address mapping error.
We need to protect againts such case.

Fixes: CVE-2022-1050

While there, fix some coding style errors.

Reported-by: Raven <wxhusst@gmail.com>
Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
---
v1 -> v2:
	* Commit message changes
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


