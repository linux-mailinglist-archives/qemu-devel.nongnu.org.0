Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A775677C21
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 14:08:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJwXw-0004Nu-FD; Mon, 23 Jan 2023 08:07:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kfir@daynix.com>) id 1pJwXo-0004Ge-Kf
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:07:32 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kfir@daynix.com>) id 1pJwXm-0005D8-MK
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:07:28 -0500
Received: by mail-wr1-x42b.google.com with SMTP id bk16so10729275wrb.11
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 05:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rJ+NTy4gErUqe3J/rKHXwISGJuTXa4/wfP/P8jVuQk8=;
 b=23o1U9TrdsONqoy1z0aUKJwUbQLy2TvkwoZzO1rS52VgYzpz64q8I1XdvMxnxxLkhb
 Wf+laaNck9AMock4j4d6Kr1Ih095OMOSuw7OfCXw8ERa4g7J93D0j9/vXuUjtPCqu4cP
 Wv4ZAqb094b4WiJyaGRtpeEHjQv7KCuGFBqOITlQEHz8Q+eRaXEOWuPUfvcr/qIbbBP7
 j4IpnFcDFGWtWKDH0Rw2sDHjTPv2siHLXp80AIbELA+oH6fAFFNmWELxNfQ8yQK66l4r
 mEYpbk4I50fTrnZnoAgiVQxgNsgHjVU21JhGzshsGDAb+5SacP19Byw5P2ujtupGQpv3
 uI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rJ+NTy4gErUqe3J/rKHXwISGJuTXa4/wfP/P8jVuQk8=;
 b=NdewRFGQwyWRdWdb9A6meSrtuTPsbduKh8QpHcQYQg6qCD5zzQ6E8JINvZ5ZKk8mtv
 hvq03AifTOZnBR9Fer8nV4yGtk8meS51mYBJMReEp8sraSsekzYNbyeJc5GMX2/s2n3s
 Onzqw8hcuVVYx0fch6MUQClOX8hSmRjSZXiDplKi8M0zrGPQC4+lA2OGlnHNKehPrZv8
 P+LPI6ZN3oFy4EKwOYGf+mcWD9YmGZ8AnxnMf8ANytGk0NDHwkaCEEcooMtFrophI4xM
 n9GMRf7SZkTnpPL9rGQ+IeTQHPnATOyPtb2o1Ek3dHWoCVquDY3o07j4hmfX6E0A0mM8
 +fJg==
X-Gm-Message-State: AFqh2kpRL0C7YFmN3P6Hp2Si36EIbjVjpvTqzgPVurw+Lb0kZp11Fktm
 miX/OejyPPEpWyg7+ywMQybAH57QieyNmqKY
X-Google-Smtp-Source: AMrXdXvK2rNbmKZ1o8R/mOS76J/jQI/X2XyvCP5nl2ybqS83bf/Ix4Irdn7c9Cy5CYxIiCUTGODEzQ==
X-Received: by 2002:a5d:4608:0:b0:2bd:ce83:5fd8 with SMTP id
 t8-20020a5d4608000000b002bdce835fd8mr28955705wrq.33.1674479244584; 
 Mon, 23 Jan 2023 05:07:24 -0800 (PST)
Received: from bark.. (bzq-84-110-34-91.static-ip.bezeqint.net. [84.110.34.91])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a5d65c1000000b002be15ee1377sm16370356wrw.22.2023.01.23.05.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:07:22 -0800 (PST)
From: Kfir Manor <kfir@daynix.com>
To: qemu-devel@nongnu.org, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Cc: Yan Vugenfirer <yan@daynix.com>
Subject: [PATCH] qga/linux: add usb support to guest-get-fsinfo
Date: Mon, 23 Jan 2023 15:07:18 +0200
Message-Id: <20230123130718.1053000-1-kfir@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::42b;
 envelope-from=kfir@daynix.com; helo=mail-wr1-x42b.google.com
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


