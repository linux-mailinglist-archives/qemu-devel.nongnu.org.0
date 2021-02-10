Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82ACA316AE9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 17:16:10 +0100 (CET)
Received: from localhost ([::1]:43400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9s9x-0004UJ-In
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 11:16:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l9s47-0007lt-IJ; Wed, 10 Feb 2021 11:10:09 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:33700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l9s41-0000EN-Jf; Wed, 10 Feb 2021 11:10:07 -0500
Received: by mail-pl1-x631.google.com with SMTP id d13so1470910plg.0;
 Wed, 10 Feb 2021 08:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dFWs89OqpA2FHpdtCvYIxkSfqPquW2C/ITVpO+zm4M0=;
 b=Ga+dFh+pXRVzYyxcM9sFESwoKdkQz5BwhOs31SJxFyiqtnqAYHH4VgjcscH53PnUx2
 q6vaNtGmkAudn4SIgAU51cef8VT3kmqR1fw2Hsf9WXJkR9QTYPJs/dfhkNKCuMTrXMt9
 Osw1kxRI0LLAHU/AsYHQkCjW7jZdDTga2bKruVounuQdSWj081ImaV0pXXZApDDugjKk
 96LO1LGoaYHb8ivNX6IvOuL6QUzgSNgyBsFBWiW/0Vcvnxld83844OgYFm/cJHWTBtqo
 FXqRx+DGfptEpAPePERrm9UQbGhQBpcbv+iRnKcGC5tm1DWuvj7Okmg8DzPoAgCM6LF8
 XKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dFWs89OqpA2FHpdtCvYIxkSfqPquW2C/ITVpO+zm4M0=;
 b=LLVY9n88nvfWH1oi0P28uTqKcITqhOPmDQacOvOMdpWIiPrKCcat1zVCyBT6neUigP
 Y7fwcgbPfKlyriDfIePoejjelCL2NGbuSrFaElsHS4jW6kMUK9gQ2wE3Kr8h4xexCTXo
 slLNgqmKoC/HjBxHGKvHUrzY5olOX1xyqcu68xrSM2ANL7lhjS28TuSTB+HJiMLSnArx
 C7bK+7YhX1B9i4k0RCHzrgbui2PDkvBeivlThXAsc4UT+3Uf8Wv8uAuHSzwTpR7Zjiof
 1V7oJnjY3hBElr3yMxNDauuaxwhMYG/eW3RRkF5n5HYDBLGy6dky7A3EsJYJD0SpCExy
 wVpQ==
X-Gm-Message-State: AOAM532A5zU7uOUCiQV+F+8gum0Vp+jE36tXO36uWfGp07aXyTDwvogL
 /V1iRowCrJhZao0P8pk3H8DQPGeVNgGCWQ==
X-Google-Smtp-Source: ABdhPJzHP5s01XKpklWid2wiUQ2XmORB3gF16aNpwHEXvUNudwlEhtb5iDKBwSMcLQHm80aSd5LNtg==
X-Received: by 2002:a17:90a:4ecb:: with SMTP id
 v11mr3822681pjl.75.1612973398571; 
 Wed, 10 Feb 2021 08:09:58 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id 25sm2761195pfj.120.2021.02.10.08.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 08:09:58 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V2 5/7] hw/block/nvme: refactor nvme_select_ns_iocs
Date: Thu, 11 Feb 2021 01:09:35 +0900
Message-Id: <20210210160937.1100-6-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210210160937.1100-1-minwoo.im.dev@gmail.com>
References: <20210210160937.1100-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x631.google.com
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


