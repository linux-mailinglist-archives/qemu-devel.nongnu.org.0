Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 687313E4343
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 11:51:26 +0200 (CEST)
Received: from localhost ([::1]:58350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD1wL-00018g-6D
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 05:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mD1tt-0005MP-W1
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:48:54 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:47021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mD1tr-00022w-HP
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:48:53 -0400
Received: by mail-lf1-x12b.google.com with SMTP id n17so7366205lft.13
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 02:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u+s872iwqWhG+7366PB9FReKLpoScW/sp/avFSq0/ME=;
 b=SesbIWULulFBBJcDo3MolAhwmCpuiQQPqF/A5xZcilWBVi/yopVAzT+XZe8szDh/5p
 /7Jm8XudZEb6/MrcnYY4L+190+J68X7m01Rw+DOcK3E38LlcgZmjzbdmLa1emeGD5+Ka
 9fF/uZ1Q+UF6TlyLqhTjO3cYh5J8nA70Qa8/cKQMMDSXDKBGjszslvs4dJ15h1xXwxuk
 P0Wml/PR6d7KIeQTPKET0geNBC/1oTxi2DE+tRIHRcKzKUYX67U6Fo8BnambboTFG7x8
 RPevkQQ/EZL2thr4ZTkIdnpMEOknrA3pdbw4KKStYvPrF1x4MVdZXp5Q4ypRD5fNrPq5
 Lm7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u+s872iwqWhG+7366PB9FReKLpoScW/sp/avFSq0/ME=;
 b=QruFN3y8Sm9n68g0F3vYWnXktNOWpzXm5N/5FnJNmKFE4ufY39wZQHu0UVVp3NRVfq
 r8pR6+/OyrzpId5jKhRuRnBdZdObT81NCJveU0sY3goIaiq7s1KIoAmU2wtrfMkdZeHJ
 jCxijjl203YDFnxid+ufFPIVJkC3n2UgUyWWOC8HHYHrhTjUMZA5NsMfTSXb3LkCp88d
 7IMS7LpzOuNx2diQTGRGhBgfQUBoYOX0wKpzP3N3X51j8HEDFvwtsi6vJvfBDs0fmO7S
 d1uVY3ZKcVX4IjWXBtB1nMeqh/wep3l++pbI+vdBBx7q2c/lPcdPzOeydVPCxvaTRH48
 4A2A==
X-Gm-Message-State: AOAM532mbq5YaWRFtQ86bcU7ofyNjR9D1eS7CwpfbOQfth4L3lDqvkvS
 P0QG79NCfvcoOlbaODpStpLklVmQW8C4ZPSTbMg=
X-Google-Smtp-Source: ABdhPJxoGYBKjidQh2xJnVW2B1sr5z0fPnn2hKCDigrDx8MhEPmWnGV91wZ5FwlePmfcT04i/3hRoA==
X-Received: by 2002:a05:6512:b27:: with SMTP id
 w39mr7653396lfu.129.1628502528555; 
 Mon, 09 Aug 2021 02:48:48 -0700 (PDT)
Received: from kostyanf14nb.Dlink (93-77-45-80.vin.volia.net. [93.77.45.80])
 by smtp.gmail.com with ESMTPSA id q20sm1681506lfo.19.2021.08.09.02.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 02:48:48 -0700 (PDT)
From: Kostiantyn Kostiuk <konstantin@daynix.com>
To: qemu-devel@nongnu.org
Subject: [RFC 1/4] gqa-win: get_pci_info: Clean dev_info if handle is valid
Date: Mon,  9 Aug 2021 12:48:36 +0300
Message-Id: <20210809094839.52312-1-konstantin@daynix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::12b;
 envelope-from=konstantin@daynix.com; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>, Matt Hines <mhines@scalecomputing.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
---
 qga/commands-win32.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 27baf17d6c..2ad8593b82 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -514,7 +514,7 @@ DEFINE_GUID(GUID_DEVINTERFACE_STORAGEPORT,
 
 static GuestPCIAddress *get_pci_info(int number, Error **errp)
 {
-    HDEVINFO dev_info;
+    HDEVINFO dev_info = INVALID_HANDLE_VALUE;
     SP_DEVINFO_DATA dev_info_data;
     SP_DEVICE_INTERFACE_DATA dev_iface_data;
     HANDLE dev_file;
@@ -749,7 +749,9 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
     }
 
 free_dev_info:
-    SetupDiDestroyDeviceInfoList(dev_info);
+    if (dev_info != INVALID_HANDLE_VALUE) {
+        SetupDiDestroyDeviceInfoList(dev_info);
+    }
 out:
     return pci;
 }
-- 
2.25.1


