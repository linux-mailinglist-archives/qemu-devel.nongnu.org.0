Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE614742F5
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 13:52:25 +0100 (CET)
Received: from localhost ([::1]:56364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx7I8-0002YJ-OZ
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 07:52:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mx77U-0001ni-5X
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 07:41:25 -0500
Received: from [2a00:1450:4864:20::531] (port=34560
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mx77Q-0004bG-So
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 07:41:22 -0500
Received: by mail-ed1-x531.google.com with SMTP id x15so63504298edv.1
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 04:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=UOq7HXf+K8oMudzzz7NHQ+jQVflm2qA+bj7AzU+PASI=;
 b=ykj18jfn+i5yELX7qLNrB1fWm6daiqqzoH0PPG0x0fWVckYn5oJAhs61jn+sezDO9u
 1mfYuOsCU7UidIapHHi1yauco7RVllb4o4LoHPCZvYp2rAazIJxNRCq5r/StbxJy2oou
 SZnyCvWlAYaZ0jXFa9yG++WkiDrApP2usyQSMIWR+VjsRMTPJT9OdNZYgwEmgA5KAiSK
 c+3Sr/as6F06aLlWaJM+eCCBUxaQdUdzHx8eoSc5HwWOboUlCc+r0whxt6xwBvV5omQ6
 C8GVUBulaS7jfQwQ5DoOQYQ341voNE6j+JRj/HZf2+jns+pkTwYC+6QtamjXHog/JfiV
 PV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UOq7HXf+K8oMudzzz7NHQ+jQVflm2qA+bj7AzU+PASI=;
 b=0iPPEP5jvsMBYXt0G3Z8fQePyRzZBBCsIvp1dlSYp+cM4kWdWZT3GLOWBixFU4A+9Z
 gKbp6BGcjI1J1ax9b3rLNROuDR9kpQO7BoeLoos9q1U4Z3Va06FncZzuFTwLkeFALdCd
 Xo0/0K2yzvB5CNMEGSsjBsSdNuNHSO+A0F3zxmgyl32JsRkPE+h/GTQQcmwn+RylQ+RY
 CifWFBh+Eri2mXsmMqWUKX1qohjA+ZGzt2MMRNFJvZ11gYE4TAVWscmS5te0oiszMT6v
 VMAo86Z4j2v/dTj25HXWaIyC61n88uQ6vqKtrI++M/8w34aDNTcEjLQKlr5j6tc9PIDy
 CA5w==
X-Gm-Message-State: AOAM531LupPGncoVVl5sieqG5HWkJzJJBa8ns9dd9PUej+RJHqy0el2x
 9Fd/efuZfxX395X6XUTDK7zBd8QTeVmzvqpf
X-Google-Smtp-Source: ABdhPJzObnOo6O67XxBlh20xziH5L8t0Tvp2lTFSOGu31LB9DSt7Ixae5XlQXv9/FGpq6HarfjIs1A==
X-Received: by 2002:a05:6402:8d0:: with SMTP id
 d16mr7404570edz.403.1639485677696; 
 Tue, 14 Dec 2021 04:41:17 -0800 (PST)
Received: from localhost.localdomain ([37.72.42.118])
 by smtp.gmail.com with ESMTPSA id e4sm1025351ejl.196.2021.12.14.04.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 04:41:17 -0800 (PST)
From: Kostiantyn Kostiuk <konstantin@daynix.com>
To: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 1/6] gqa-win: get_pci_info: Clean dev_info if handle is
 valid
Date: Tue, 14 Dec 2021 14:41:04 +0200
Message-Id: <20211214124109.103102-2-konstantin@daynix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214124109.103102-1-konstantin@daynix.com>
References: <20211214124109.103102-1-konstantin@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::531;
 envelope-from=konstantin@daynix.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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

Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
---
 qga/commands-win32.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 4e84afd83b..3dd74fe225 100644
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


