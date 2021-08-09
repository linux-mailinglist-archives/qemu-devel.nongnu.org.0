Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9603E4349
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 11:52:09 +0200 (CEST)
Received: from localhost ([::1]:33442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD1x2-0003Qo-9d
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 05:52:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mD1tu-0005Oe-Od
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:48:54 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:38716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mD1tt-00024J-59
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:48:54 -0400
Received: by mail-lj1-x230.google.com with SMTP id u13so22715979lje.5
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 02:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HWm2i+e1T/OU0lMsw5Uz/IUId6ABDgvGYFnXkHseIWM=;
 b=etl+Xxi+rcWDvIHc40DwfIQ9yhTMUm1+9XFNk+TdVI60yAWyr4mjb2pnnMmSN7EOFd
 //vqVLcwxQD32nNYyhyMaNGknzVkXi1VdY37y1fiUz6j+PROQksA1ZvSCz44rnMkSaHy
 Y4NbemQwmiJHiHagWAImTRjG/8lwDddxU+lm01xYLwsKInxgBAfF41OZuC9VCEae9OVn
 udgcbmqEsOV/fIyFsH8Jkn1Dxj677l+0dCxZoFCTNC12YSeJ2tJVUagYVnhfA8rAU1Vq
 X3GJ6MoyhoOkMtvZnKYv2Ha8QwCMVWa2uhsS1uaIRpGljxTaigtepo5F9re/iABL8gwK
 DGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HWm2i+e1T/OU0lMsw5Uz/IUId6ABDgvGYFnXkHseIWM=;
 b=SHMOXBdS0CSnFE82N3eMJ9qS0jzhnjD2CenivnZi5pK8ah/hzRh63Dw4wGuOIpArw1
 bYINfvVI7mheX//FaCwEMTFNWJ+B2uTE0BNDFJG5i62EPatOAozjX+AtWnTeVp6FtZwQ
 g9/BX9Ihd587idXCT+vrsf0cDW19AVfbImdlmfId3k8tnbL67atO8hw1yh1jgnC5FCLM
 GJVhn1QHrdib1oDw1bcghrqDA1Fab2bE/c1LGckmjk3J6+xm9wpWf98Hv5tGed6Sd4of
 IoNY1dMVMBpDVbNZDckgJuim8OrosvWQPKDK9Q+q2wLAh90o13VrpR3YfuzoyPOGiaix
 rCOA==
X-Gm-Message-State: AOAM533Rwc2VHUtNG3uWKDVJDBjT9m8vKTFic89GofD8V6mCzzkndPh7
 PW0Vt8t//1smp01A4dmLsfG+MEpabvIRB2nbyvs=
X-Google-Smtp-Source: ABdhPJxpVnfCkocO1DMvI59DxEk/b+A2gpGQEwzSt0J0xxw8hmGxoESAQd65gSm6UTYJfxVWkH6SsQ==
X-Received: by 2002:a2e:9e41:: with SMTP id g1mr15312364ljk.471.1628502531484; 
 Mon, 09 Aug 2021 02:48:51 -0700 (PDT)
Received: from kostyanf14nb.Dlink (93-77-45-80.vin.volia.net. [93.77.45.80])
 by smtp.gmail.com with ESMTPSA id q20sm1681506lfo.19.2021.08.09.02.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 02:48:51 -0700 (PDT)
From: Kostiantyn Kostiuk <konstantin@daynix.com>
To: qemu-devel@nongnu.org
Subject: [RFC 4/4] gqa-win: get_pci_info: Free parent_dev_info properly
Date: Mon,  9 Aug 2021 12:48:39 +0300
Message-Id: <20210809094839.52312-4-konstantin@daynix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210809094839.52312-1-konstantin@daynix.com>
References: <20210809094839.52312-1-konstantin@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::230;
 envelope-from=konstantin@daynix.com; helo=mail-lj1-x230.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

In case when the function fails to get parent device data,
the parent_dev_info variable will be initialized, but not freed.

Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
---
 qga/commands-win32.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index a8a601776d..520c520cb8 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -515,6 +515,8 @@ DEFINE_GUID(GUID_DEVINTERFACE_STORAGEPORT,
 static GuestPCIAddress *get_pci_info(int number, Error **errp)
 {
     HDEVINFO dev_info = INVALID_HANDLE_VALUE;
+    HDEVINFO parent_dev_info = INVALID_HANDLE_VALUE;
+
     SP_DEVINFO_DATA dev_info_data;
     SP_DEVICE_INTERFACE_DATA dev_iface_data;
     HANDLE dev_file;
@@ -542,7 +544,6 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
         g_autofree PSP_DEVICE_INTERFACE_DETAIL_DATA pdev_iface_detail_data = NULL;
         STORAGE_DEVICE_NUMBER sdn;
         g_autofree char *parent_dev_id = NULL;
-        HDEVINFO parent_dev_info;
         SP_DEVINFO_DATA parent_dev_info_data;
         DWORD j;
         DWORD size = 0;
@@ -745,6 +746,7 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
             }
         }
         SetupDiDestroyDeviceInfoList(parent_dev_info);
+        parent_dev_info = INVALID_HANDLE_VALUE;
         break;
     }
 
@@ -752,6 +754,9 @@ cleanup:
     if (dev_info != INVALID_HANDLE_VALUE) {
         SetupDiDestroyDeviceInfoList(dev_info);
     }
+    if (parent_dev_info != INVALID_HANDLE_VALUE) {
+        SetupDiDestroyDeviceInfoList(parent_dev_info);
+    }
     return pci;
 }
 
-- 
2.25.1


