Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49825677C93
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 14:33:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJww3-0001iw-Tb; Mon, 23 Jan 2023 08:32:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kfir@daynix.com>) id 1pJwvO-0001WV-H6
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:31:59 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kfir@daynix.com>) id 1pJwui-00018y-Kr
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:31:22 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso8561922wms.3
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 05:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rJ+NTy4gErUqe3J/rKHXwISGJuTXa4/wfP/P8jVuQk8=;
 b=gUcqb3Fwhd6L6g7IERSuIu/TgI492IHOy6HijKxFlOaWxw1aoKisPrO5dga5Ln/VUe
 Lq3Q6WBNeCYMCEvmbvqeTtQHQLjTwIYL9Qb0ggRIkENiliTxW8vzd9ZseSKa29w/THrp
 IhBmBySvzikG0WIpHhaJYS7LkpOznnpp1jarcvKGsBzPPMN1OdK6mM4+1OOjBwFKi0nN
 1mpQivM/ANo4ZHyuCShjBIjY+8K0e4lVzP5WS1cJnFSdlplpoUlAvLvHRbMyHGGqCLsB
 5IAriQOK2EMBJnUFlIWnzGOF2c5eMYbuphlCI8BtcQQ9AWWssWGvgM5jFE+toh9mQKV0
 Sssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rJ+NTy4gErUqe3J/rKHXwISGJuTXa4/wfP/P8jVuQk8=;
 b=NeIZc8h1X/x43dtmnpkIZGEzDoMZzc0eNlS+WZofJ6V65WxqMvrJisXgK5pUWjEria
 9fTIu+jQqF09IDOdGFMzQifFfxw4ukAQLw7gC5fhM9a0ZwrtowDUrdZjGGL+f5q7mnOl
 gYmRRw08tAg8tsQ1f0Yp3Ty4sIi/TyGcImzneRCGCrH3YArSUH3GHrAY2rk/sHsXl8n/
 vKLaAogNoU0PUCDCexWXEDdnjr58JSEWfrX1JqGXkAs0RDVqQOnYSxW3a5moOFRyWTVJ
 l9Ycu3Uev5TDYwXEAHgjQbTA3WQp288ZJ/IGgXrazkzPQBVJVsCooCFT7eMnozK2fnf9
 kOtw==
X-Gm-Message-State: AFqh2koC1IrLVm+/ujqwPmHU2KM3YRHjEHFK/KD8TVStM501KKxTNjZ2
 eTNxicMiWMKi/p6tG65sbELv8j08HJJJjj7U
X-Google-Smtp-Source: AMrXdXsbIOAaIN0JZumf0FpPypdUglr+dzsvOrQoZPpo+cn9URN3SJlVWATgezepA6GzzuVnHarEuA==
X-Received: by 2002:a05:600c:4f08:b0:3db:9e3:3bf1 with SMTP id
 l8-20020a05600c4f0800b003db09e33bf1mr22844182wmq.31.1674480656115; 
 Mon, 23 Jan 2023 05:30:56 -0800 (PST)
Received: from bark.. (bzq-84-110-34-91.static-ip.bezeqint.net. [84.110.34.91])
 by smtp.gmail.com with ESMTPSA id
 b16-20020adff910000000b002bdf8dd6a8bsm20379622wrr.80.2023.01.23.05.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:30:55 -0800 (PST)
From: Kfir Manor <kfir@daynix.com>
To: qemu-devel@nongnu.org, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Cc: Yan Vugenfirer <yan@daynix.com>
Subject: [PATCH v2] qga/linux: add usb support to guest-get-fsinfo
Date: Mon, 23 Jan 2023 15:30:49 +0200
Message-Id: <20230123133049.1053505-1-kfir@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::333;
 envelope-from=kfir@daynix.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Kfir Manor <kfir@daynix.com>
---
 qga/commands-posix.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index ebd33a643c..aab9d3bd50 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -880,7 +880,9 @@ static bool build_guest_fsinfo_for_pci_dev(char const *syspath,
                        g_str_equal(driver, "sym53c8xx") ||
                        g_str_equal(driver, "virtio-pci") ||
                        g_str_equal(driver, "ahci") ||
-                       g_str_equal(driver, "nvme"))) {
+                       g_str_equal(driver, "nvme") ||
+                       g_str_equal(driver, "xhci_hcd") ||
+                       g_str_equal(driver, "ehci-pci"))) {
             break;
         }
 
@@ -977,6 +979,8 @@ static bool build_guest_fsinfo_for_pci_dev(char const *syspath,
         }
     } else if (strcmp(driver, "nvme") == 0) {
         disk->bus_type = GUEST_DISK_BUS_TYPE_NVME;
+    } else if (strcmp(driver, "ehci-pci") == 0 || strcmp(driver, "xhci_hcd") == 0) {
+        disk->bus_type = GUEST_DISK_BUS_TYPE_USB;
     } else {
         g_debug("unknown driver '%s' (sysfs path '%s')", driver, syspath);
         goto cleanup;
-- 
2.38.1


