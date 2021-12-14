Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DBF4742E5
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 13:47:38 +0100 (CET)
Received: from localhost ([::1]:47552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx7DV-0004kr-Ju
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 07:47:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mx77U-0001nm-9w
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 07:41:26 -0500
Received: from [2a00:1450:4864:20::530] (port=43710
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mx77R-0004bM-17
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 07:41:23 -0500
Received: by mail-ed1-x530.google.com with SMTP id o20so62933638eds.10
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 04:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ozLp8qidPWvcuUkEzZS3Ucr/MZjXiK9zmEUDFCSdFOY=;
 b=cAhTbJCBGxsbLlVqFZd0fvHZ3zMUxStRUIkb/lUHZSgNIysgVdJHh51xJBSG3FwTpU
 66dwTOaGlxujUZ0T7z3SMM7A91+jY7pnu4g6/KsleQyxmMowLovTdfQuQ1q2BlP6xu5N
 nslLQ3t44tdzE3waLTwL9pNlY1dluUw13w0Ae0KKydS26P7UkJ/0i4d088qnJ4z4P/Yv
 6HtSFyD1MQglF1xlh48M8fFrZlAifY6VOFLQ8FS/vvSeKo/Cqttx4aXV3nF4i0XER611
 Jh5JnyvyZ/+o1oBpS9T7AJKZ8vlpVJ+XkV6eErf9O49XbsFXOrSDlkMz2ukIXHkeAl6T
 96mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ozLp8qidPWvcuUkEzZS3Ucr/MZjXiK9zmEUDFCSdFOY=;
 b=U800akB/KJeUIswz1i9d3Wji6WRrRFMucH0xYO0GRSR8Eyji05cCtuvma4ue2VsL26
 YZd7QbB/obOvuNqhfYnZkm34oep+QJQ3BJUUsb1ysM2sOmSf5S9Nc3n6TTpvgIdbOb1h
 9U1sGg28OLr7K9HssoSjgAwN/MUF60FBPbLg0pFlKmr6tnmna9BYsuecNwE1ScGb5Bpe
 yQl+8AvxvLC2IKW0tC3HceG5hNgEr2HoGA9azsDajTXAR2Bt1B5QqBet0pWM8HfN8wsO
 1IAfr+AdC0mdXltRMfikR9JsvavoSkqb+VKbv6UHMdZ3Lt0l1858T0f8UR5sjt7p3OBk
 Gd/g==
X-Gm-Message-State: AOAM533yK7Sdap2xw+O84+xqihqc7UQP1zCXFUYGGbHBMe6xOtg0gGjR
 7Dusqv2lve1Q45EBWGUeZ+9zPLOpodBsJFcD
X-Google-Smtp-Source: ABdhPJw+7v5x8kt0wfD+96MlgHrjIu55gNXjYHREu9l3ci4qDo1UST3OmR35RwPYVgxc0Q5tErZrIw==
X-Received: by 2002:a05:6402:174c:: with SMTP id
 v12mr7679375edx.168.1639485679516; 
 Tue, 14 Dec 2021 04:41:19 -0800 (PST)
Received: from localhost.localdomain ([37.72.42.118])
 by smtp.gmail.com with ESMTPSA id e4sm1025351ejl.196.2021.12.14.04.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 04:41:19 -0800 (PST)
From: Kostiantyn Kostiuk <konstantin@daynix.com>
To: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 3/6] gqa-win: get_pci_info: Free parent_dev_info properly
Date: Tue, 14 Dec 2021 14:41:06 +0200
Message-Id: <20211214124109.103102-4-konstantin@daynix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214124109.103102-1-konstantin@daynix.com>
References: <20211214124109.103102-1-konstantin@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::530;
 envelope-from=konstantin@daynix.com; helo=mail-ed1-x530.google.com
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

In case when the function fails to get parent device data,
the parent_dev_info variable will be initialized, but not freed.

Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
---
 qga/commands-win32.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 93c5375132..f6de9e2676 100644
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
         PSP_DEVICE_INTERFACE_DETAIL_DATA pdev_iface_detail_data = NULL;
         STORAGE_DEVICE_NUMBER sdn;
         char *parent_dev_id = NULL;
-        HDEVINFO parent_dev_info;
         SP_DEVINFO_DATA parent_dev_info_data;
         DWORD j;
         DWORD size = 0;
@@ -744,11 +745,13 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
                 break;
             }
         }
-        SetupDiDestroyDeviceInfoList(parent_dev_info);
         break;
     }
 
 end:
+    if (parent_dev_info != INVALID_HANDLE_VALUE) {
+        SetupDiDestroyDeviceInfoList(parent_dev_info);
+    }
     if (dev_info != INVALID_HANDLE_VALUE) {
         SetupDiDestroyDeviceInfoList(dev_info);
     }
-- 
2.25.1


