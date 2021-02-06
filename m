Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29039311A54
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 04:40:36 +0100 (CET)
Received: from localhost ([::1]:35346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8ESY-0002GN-Sx
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 22:40:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l8EOz-00066D-Ro; Fri, 05 Feb 2021 22:36:53 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:36108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l8EOy-0003kz-DN; Fri, 05 Feb 2021 22:36:53 -0500
Received: by mail-pg1-x52c.google.com with SMTP id c132so5907926pga.3;
 Fri, 05 Feb 2021 19:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dFWs89OqpA2FHpdtCvYIxkSfqPquW2C/ITVpO+zm4M0=;
 b=VKfFNN6KO1uKcS0fVQC+N6CKHh6SUFtzNV9TKkTP+CdyKal4NI6eEEgNEfuwULYnVX
 LyjND5Yc+cOTJWjm5p21F1v4r24rOqen5k2sN/BtRDGnjQyqGMkELbhmY7fa9enXprpq
 rO9kDx2bu7zrtcx4Js6V3O7jYJCzzWyc7L4bhQmocv/FtFfEzJewNmz36cQ/817tk3mW
 S7LDaHDL2yXKuAZpWIiS3Zu2UALFu7F/AcDRuTjoZRJcbvuNIyuD8zMRKRq0QKo+vwqr
 4JczbGIbySMptPxEa77A4nBpjhakT1ROuYxNf+SGIoF3fML/JD8SM/Y3ncInflruBNB5
 7EKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dFWs89OqpA2FHpdtCvYIxkSfqPquW2C/ITVpO+zm4M0=;
 b=oTBwD5C+tq6zcxj1xk74ehIIAuDqT4hE27+qkjj0fKdXzLgNkrCXbBXZ8ebLRfhRWT
 LbWWMrt/Q02XU6IYNdAhf3Y2kisVrLIajNjnS2/6vvzcelfHZ0CCHX1OlJL6jXZpqDRT
 t2bMXSFFGc2Cs8oC1tTLSxVCuqwmF8GkjmMsm7tXtbjgHH0Ml4AOkPd+hVThIAb1bIMH
 TsMvD5ObJYKLhw4bve/jA0058TCPyWCsu/SJo1hpeMFcSnCbgx9ek8EqjzQ2xQpLMKkz
 Ve9WqlTDana3MroGZZpVlW8rs027r/yFq4Zjsu81bGK+e+1SwJBG3mcprBfaT2ya2eXX
 k/Mw==
X-Gm-Message-State: AOAM531wj/htLtmX/zYRGT9+lVz3WVZA7TwDXlspq2z5jHPr118gzIZh
 ERHEiGFJM8iYPfIKwkr4PFvQDQQ+HqiElw==
X-Google-Smtp-Source: ABdhPJwzjXWHR/i2cMRWRrT2VH1V/hU4u+gFhWeZfhFAZ19CNwBGCqWigkYn4SJXZvdQqHHK01HLZQ==
X-Received: by 2002:a62:cd02:0:b029:1bc:9fe2:b00c with SMTP id
 o2-20020a62cd020000b02901bc9fe2b00cmr7504201pfg.23.1612582610672; 
 Fri, 05 Feb 2021 19:36:50 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id j17sm10862375pfh.183.2021.02.05.19.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 19:36:50 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH 5/6] hw/block/nvme: refactor nvme_select_ns_iocs
Date: Sat,  6 Feb 2021 12:36:28 +0900
Message-Id: <20210206033629.4278-6-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210206033629.4278-1-minwoo.im.dev@gmail.com>
References: <20210206033629.4278-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x52c.google.com
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch has no functional changes.  This patch just refactored
nvme_select_ns_iocs() to iterate the attached namespaces of the
controlller and make it invoke __nvme_select_ns_iocs().

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index d1761a82731f..697368a6ae0c 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3896,6 +3896,25 @@ static void nvme_ctrl_shutdown(NvmeCtrl *n)
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
@@ -3906,21 +3925,8 @@ static void nvme_select_ns_iocs(NvmeCtrl *n)
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
2.17.1


