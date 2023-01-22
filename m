Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 908F967702F
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Jan 2023 16:34:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJcLQ-0007PN-Md; Sun, 22 Jan 2023 10:33:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kfir@daynix.com>) id 1pJcLO-0007Oy-34
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 10:33:18 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kfir@daynix.com>) id 1pJcLM-0004pH-28
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 10:33:17 -0500
Received: by mail-wm1-x32b.google.com with SMTP id j17so7332353wms.0
 for <qemu-devel@nongnu.org>; Sun, 22 Jan 2023 07:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RA2Lf0u5jgjHq3YQms6j5mXK35/V1xGHd/zRnPq5WBI=;
 b=qQK4OGshh5vdht8MXvysCigizg/Ocx2v4zSignPXxxPb3Ue88zqaQcJpCNMv7Rotfp
 6U0Z5W3y+wQOLmianijYSdUwjH0QveWCJi7LbSTP3SkBBpgEC7H8KSz6gJV7KN1z+iQK
 CDGrXbQneswSmJyqOGy2bZH3cE3FMd/0WxiQj34jZDEle+Bym3yHGp4dvs+oOuCk/RBW
 VgNjNEWFnHhZASOY6gI99CVQDAavOQtSpEo+wu9ypJFAD3pP7wbMa709atY/XbxvuKud
 0vk7qUYjS8tHhR4DSm3gMo8Lw/uRf3iBu2CTuyZpKFEvHGiCToEKLqxXMnFIIvnOg8La
 zwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RA2Lf0u5jgjHq3YQms6j5mXK35/V1xGHd/zRnPq5WBI=;
 b=7dspDCHJ55G6OEKtFyNk0x5KX8Kd9CJ5d5rC311LGb7u1z3OHom5JmaowqlyetfZ9J
 uo+JBnoFmbLXYnh6TaK7Q4G2jYwHqyholtjktWoezFjX6qPXyPEr4zIp/u1O7tAVmYP5
 DDea4Ol5624I4muzx7vT/tjgNw1S4FGpc+6d0Maoa1Ktp1OqsvP6NS7euSrM0JZXIK9q
 rsExdeeh/k+Mcsdlzxz7emaAHY1oq4rsfVEjLN7Nrjerjyx59dmQYupMF1aDb0iGpXiY
 ICXibMZ8WfL+Vr3VoPFgndUd4nMVBEumPhV56j7UGndf7lHMQEAA99bOlKmh+V6hnex5
 ruDA==
X-Gm-Message-State: AFqh2ko89TiM0GWCrtg4JfpI3aRYR/qo7TYw2ywlrMObmWmq8nU/Mnyi
 Ynifzofcbmtz2KOIS1biH/tPOTBVNCdsI2ph
X-Google-Smtp-Source: AMrXdXu605uhJHImog2Q/U41geymn6a7k8ai22RmUmtvY0BjqUi9nfLQQWvHov/oqSZhgiDyqqxkSg==
X-Received: by 2002:a05:600c:3556:b0:3db:331b:bd2d with SMTP id
 i22-20020a05600c355600b003db331bbd2dmr9143191wmq.18.1674401593763; 
 Sun, 22 Jan 2023 07:33:13 -0800 (PST)
Received: from bark.. (bzq-84-110-34-91.static-ip.bezeqint.net. [84.110.34.91])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a05600c4a9200b003db07420d14sm7914146wmp.39.2023.01.22.07.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Jan 2023 07:33:13 -0800 (PST)
From: Kfir Manor <kfir@daynix.com>
To: qemu-devel@nongnu.org, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Cc: Yan Vugenfirer <yan@daynix.com>
Subject: [PATCH] qga/linux: add usb support to guest-get-fsinfo
Date: Sun, 22 Jan 2023 17:33:07 +0200
Message-Id: <20230122153307.1050593-1-kfir@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::32b;
 envelope-from=kfir@daynix.com; helo=mail-wm1-x32b.google.com
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


