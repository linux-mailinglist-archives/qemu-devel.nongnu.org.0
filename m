Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4099432739B
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 18:18:35 +0100 (CET)
Received: from localhost ([::1]:40520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGPiD-0002pE-8n
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 12:18:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lGPbL-00070m-Vh; Sun, 28 Feb 2021 12:11:28 -0500
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d]:46992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lGPat-0004Z5-Uz; Sun, 28 Feb 2021 12:11:27 -0500
Received: by mail-vk1-xa2d.google.com with SMTP id j188so3058169vke.13;
 Sun, 28 Feb 2021 09:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OH12zHTNa1+rFtRT+eM9US7bQe2aUxLhBVK+rXJzT1s=;
 b=PaBhxRoohqf25cUBP8MP61izblaiqRITmyX+xpOyKvZeN8JKwfwNvt0lZe4HhyN7gu
 +m0DoW6yYzaYOk0DYl7+3nD69+ZMpHGGNS1cl96T9rSqnsNhfnv/l/jk1F1ZTmJFeYm0
 4TdEvf69KVygi+3jOkkurVIJeI+D7q3CnR14YAYUjd5JrorPyBLmR7A1u9WBeRdy1dZr
 3+ITeAzhwCErzRfijayZQHUWL0BhARB+oRXNxOzEEhpfGwMEgK+6VlGB5lAQhcmJadDz
 /ZQNXwy0HEHOYviAd2sxaT18VyNa0O89b1YaouD8BiDG5WdbO3vLNVhXwmdYQQzEwUb/
 7ZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OH12zHTNa1+rFtRT+eM9US7bQe2aUxLhBVK+rXJzT1s=;
 b=mXCi0gaPNYrFdCENldmh7GLez65Pt+oJ9b71cgyMdXCt0bfg73x/X5x3nfgNaRr9+v
 pZ1z/VyCiCmLAbNSp64o+vjKm7k2JNnvZkv7u70G7i+oczhbEk7dIBDtUEJ38DLr5HEd
 PTc1KF/j5C1nt/scasCFnH+WRFb5TfKdF5J/sXjgcqKB2Jq2CU/GuJqLGNZfPA6dR86c
 8oOPaKSbry1KEpgXzAm8A0DeAEypbsUd/cH9hfIgoWE4CiM7bSqJxc6zpQ1AmExktOSW
 V5xFsl1BIAgeDLze8gWhou/mjd9MSJmedv9bilWDzPl8XLIwC/eVIBpkGgCGTPs2o4vx
 7WNA==
X-Gm-Message-State: AOAM533oHX3IjneJrxDPBo4pjWUbqG1/wDL+k3e6h+rxh7QYqikf8Sie
 MaC3Qn3S2da48Gk13llLeI0SnXmhdD1pIQ==
X-Google-Smtp-Source: ABdhPJxjRPd58QOt6ppQ4JsFmIICHdilIvTjyrdN/i+3NBtPrE7IGiuRWAziYMTdS2MKconj3UuKxQ==
X-Received: by 2002:aa7:93d2:0:b029:1ee:1433:85b7 with SMTP id
 y18-20020aa793d20000b02901ee143385b7mr11279823pff.12.1614528679515; 
 Sun, 28 Feb 2021 08:11:19 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id x11sm14389781pja.46.2021.02.28.08.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 08:11:19 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V3 5/8] hw/block/nvme: refactor nvme_select_ns_iocs
Date: Mon,  1 Mar 2021 01:10:57 +0900
Message-Id: <20210228161100.54015-6-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228161100.54015-1-minwoo.im.dev@gmail.com>
References: <20210228161100.54015-1-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-vk1-xa2d.google.com
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
2.25.1


