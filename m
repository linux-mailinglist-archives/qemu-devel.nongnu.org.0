Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2A332A100
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 14:34:38 +0100 (CET)
Received: from localhost ([::1]:48948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH5Ab-0001Zz-7T
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 08:34:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lH52v-0001t9-64; Tue, 02 Mar 2021 08:26:41 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:38829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lH52t-0001c1-HX; Tue, 02 Mar 2021 08:26:40 -0500
Received: by mail-pl1-x62d.google.com with SMTP id s7so4839922plg.5;
 Tue, 02 Mar 2021 05:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BQatER8mQxHXYAaJ+m7jtMqmXqMxHszczX89rjdf3Vw=;
 b=M0PQ8FX292ug/1fNwnda3dvPnzOz7GsKWcDmk+YOcDdMPl30KZNo7/VIx9nMId+ET7
 HQ0+7fDkDGk7iAuqpwapApJoooWiZLOMOMj1wBWEV0Vto8IGj0RhxlT3oCYcheesFryP
 Ethrt+lVpoMh+GuzlEZq/TQGBjfyAcIXjVgcsc334lGhZKcFRu98RvaRgWObo+bQePoR
 2bGFOO0SzKH8Q7yCx+iNuVZqMxI/5KFuyf8rOIR5mwkWL+XV9Y/BuPhaoDFyK2bYvZvX
 VLIdJ4YBkjwsmYpqLXI0JCCMf//KJsxJd0axibMA+JrXokufaeT3FMJJBfxkYZAsdx1L
 ZoVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BQatER8mQxHXYAaJ+m7jtMqmXqMxHszczX89rjdf3Vw=;
 b=ToXLnQQtEJ/Lvw/Z0q178OYuirFdtVxi1T0RG7HFOkxuGjL9RX24c2RPDmWP/48EKW
 Wn7qs9W/Jo/jLkVTj/oBDa7CIeHKMwq6Yj7LsALL2s2BpZiI2vNLGEhMnozWCLyLx+1e
 K4948VM7ycFXROzFnNyEZDlyXiM8yDvmvExnkGd9AcboaFPnp32I5oPaiozHj5ry+Bm/
 11xas7lkj5e1ZTZ3JIRbKUwHcTiY/VO0f8MOPeRSw9OzBGh3i542w7c89vqrXXFelN1U
 monZPzn859OZdFBAVreYAGByvXw3Z40fZ4Gk2kZTB8eOUFvVTcWiQWJHe3jhjSDh8xI0
 +92g==
X-Gm-Message-State: AOAM533dRUfaDSn7RXEMNqKTEA69FyFZiAWvWBy8w3FDbtTSTOfyrpjt
 oiE+8jMULPLdiCEoGOtwiSZXua0hOkihxA==
X-Google-Smtp-Source: ABdhPJz9TxIIvjZIyEK4rQCMqxRpR5p6CPAva+89DXOUxFCS7z9ROaUMXgWB4cLxssCSkOytPH8v+Q==
X-Received: by 2002:a17:90a:d998:: with SMTP id
 d24mr4332609pjv.169.1614691597676; 
 Tue, 02 Mar 2021 05:26:37 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id u7sm20166956pfh.150.2021.03.02.05.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 05:26:37 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V4 5/8] hw/block/nvme: refactor nvme_select_ns_iocs
Date: Tue,  2 Mar 2021 22:26:14 +0900
Message-Id: <20210302132617.18495-6-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210302132617.18495-1-minwoo.im.dev@gmail.com>
References: <20210302132617.18495-1-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x62d.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch has no functional changes.  This patch just refactored
nvme_select_ns_iocs() to iterate the attached namespaces of the
controlller and make it invoke __nvme_select_ns_iocs().

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
Tested-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 53c4d59e09a7..b18ab0ef810f 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4000,6 +4000,25 @@ static void nvme_ctrl_shutdown(NvmeCtrl *n)
     }
 }
 
+static void __nvme_select_ns_iocs(NvmeCtrl *n, NvmeNamespace *ns)
+{
+    ns->iocs = nvme_cse_iocs_none;
+    switch (ns->csi) {
+    case NVME_CSI_NVM:
+        if (NVME_CC_CSS(n->bar.cc) != NVME_CC_CSS_ADMIN_ONLY) {
+            ns->iocs = nvme_cse_iocs_nvm;
+        }
+        break;
+    case NVME_CSI_ZONED:
+        if (NVME_CC_CSS(n->bar.cc) == NVME_CC_CSS_CSI) {
+            ns->iocs = nvme_cse_iocs_zoned;
+        } else if (NVME_CC_CSS(n->bar.cc) == NVME_CC_CSS_NVM) {
+            ns->iocs = nvme_cse_iocs_nvm;
+        }
+        break;
+    }
+}
+
 static void nvme_select_ns_iocs(NvmeCtrl *n)
 {
     NvmeNamespace *ns;
@@ -4010,21 +4029,8 @@ static void nvme_select_ns_iocs(NvmeCtrl *n)
         if (!ns) {
             continue;
         }
-        ns->iocs = nvme_cse_iocs_none;
-        switch (ns->csi) {
-        case NVME_CSI_NVM:
-            if (NVME_CC_CSS(n->bar.cc) != NVME_CC_CSS_ADMIN_ONLY) {
-                ns->iocs = nvme_cse_iocs_nvm;
-            }
-            break;
-        case NVME_CSI_ZONED:
-            if (NVME_CC_CSS(n->bar.cc) == NVME_CC_CSS_CSI) {
-                ns->iocs = nvme_cse_iocs_zoned;
-            } else if (NVME_CC_CSS(n->bar.cc) == NVME_CC_CSS_NVM) {
-                ns->iocs = nvme_cse_iocs_nvm;
-            }
-            break;
-        }
+
+        __nvme_select_ns_iocs(n, ns);
     }
 }
 
-- 
2.27.0


