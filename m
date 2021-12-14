Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FDE4742F4
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 13:52:24 +0100 (CET)
Received: from localhost ([::1]:56200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx7I7-0002Rm-K3
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 07:52:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mx77Y-0001pL-Ev
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 07:41:28 -0500
Received: from [2a00:1450:4864:20::534] (port=39918
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mx77U-0004cg-4g
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 07:41:27 -0500
Received: by mail-ed1-x534.google.com with SMTP id b7so3310053edd.6
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 04:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=UnZlWzVci/8A7koWYfCugs/CcDlIcJ+u1vqVZ6kvKA0=;
 b=XZst7yR3E3eIyafAJarFJGJxCGh+rT41yhrO6rebvRqoqSv2A09F0JCEUnkD3+Bz8q
 aAPVhFAQl5fMaN5uYAEvQBaoeGbeByYDFXozBqz/qflZv9GpBcy88EMSsuJCdaZvVA9Q
 BcJSZcGhsW19KTeE6jF+ImOwE1fJNxfMMtEiMjgzhvei1N5UaHreFl9hCtDVqBBYlgzF
 sBp22l6FAT72Ta1J7Yh9W8myteISeqEmS9EA/n09+z8IyCSkm8nYmaYuZPn1L9+fxhRF
 bXGc/aTcf6ZA+Oh2IQ6oXtyS0iMdhbopPoL7i949gt+ac8ejFsKOhDUYQ1ftQhcVFprS
 9neA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UnZlWzVci/8A7koWYfCugs/CcDlIcJ+u1vqVZ6kvKA0=;
 b=lAdH4FuwGUmA+B8IryX294hjbsawrlsUCqIWXzTpIVFd+e0gbeVjKYS6wKY9zXw/79
 DoA3hf92ODeqv5sDmDYF8s8RWRBbZrvTEOd+i0x3XqiiL6iijNnUNGJ6rjDJPMnx8S4Y
 uLVVNyVa8mT7b/I5EVZ+beuxKH8pXXxdGOYzJt0Mbfo/Iw0+H/MTicMyW/GKCnVR+5qt
 7+E/O8LcBw+B4ac6HoJEfqdLRXGzV0dr5xO4C+Nul6Q9pVqzJN24JBB0XkuDywg+DGzy
 Lby+VVp9TamE4hbSN0q6BgU4iE7XHeacHoYEWoDE7O0sFu/4T4L9MwH4AJgYceSHoRJA
 S7UA==
X-Gm-Message-State: AOAM533q9aaIU1vKAjoWVJDMyO3xhb/sqG+tpzBbjw9qhQF5AVMggPKU
 pQG/IQVVzggaggT00De7qyQ3p2Nt+JiEFlWx
X-Google-Smtp-Source: ABdhPJx2Qdcuqr7ksB11uQRixSUKXosM00tCb26/pU0tMT4fAFTpH3R30QdJIp6o+dgHbLo329Pa3g==
X-Received: by 2002:a05:6402:34cf:: with SMTP id
 w15mr7372717edc.63.1639485682601; 
 Tue, 14 Dec 2021 04:41:22 -0800 (PST)
Received: from localhost.localdomain ([37.72.42.118])
 by smtp.gmail.com with ESMTPSA id e4sm1025351ejl.196.2021.12.14.04.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 04:41:22 -0800 (PST)
From: Kostiantyn Kostiuk <konstantin@daynix.com>
To: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 6/6] gqa-win: get_pci_info: Replace 'while' with 2 calls of
 the function
Date: Tue, 14 Dec 2021 14:41:09 +0200
Message-Id: <20211214124109.103102-7-konstantin@daynix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214124109.103102-1-konstantin@daynix.com>
References: <20211214124109.103102-1-konstantin@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::534;
 envelope-from=konstantin@daynix.com; helo=mail-ed1-x534.google.com
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

Microsoft suggests this solution in the documentation:
https://docs.microsoft.com/en-us/windows/win32/api/setupapi/nf-setupapi-setupdigetdeviceinterfacedetaila

Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
---
 qga/commands-win32.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 3092566313..892082504f 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -636,10 +636,10 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
         if (SetupDiEnumDeviceInterfaces(dev_info, &dev_info_data,
                                         &GUID_DEVINTERFACE_DISK, 0,
                                         &dev_iface_data)) {
-            while (!SetupDiGetDeviceInterfaceDetail(dev_info, &dev_iface_data,
-                                                    pdev_iface_detail_data,
-                                                    size, &size,
-                                                    &dev_info_data)) {
+            if (!SetupDiGetDeviceInterfaceDetail(dev_info, &dev_iface_data,
+                                                 pdev_iface_detail_data,
+                                                 size, &size,
+                                                 &dev_info_data)) {
                 if (GetLastError() == ERROR_INSUFFICIENT_BUFFER) {
                     pdev_iface_detail_data = g_malloc(size);
                     pdev_iface_detail_data->cbSize =
@@ -651,6 +651,16 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
                 }
             }
 
+            if (!SetupDiGetDeviceInterfaceDetail(dev_info, &dev_iface_data,
+                                                 pdev_iface_detail_data,
+                                                 size, &size,
+                                                 &dev_info_data)) {
+                // pdev_iface_detail_data already is allocated
+                error_setg_win32(errp, GetLastError(),
+                                    "failed to get device interfaces");
+                goto end;
+            }
+
             dev_file = CreateFile(pdev_iface_detail_data->DevicePath, 0,
                                   FILE_SHARE_READ, NULL, OPEN_EXISTING, 0,
                                   NULL);
@@ -680,8 +690,8 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
             ULONG dev_id_size = 0;
 
             size = 0;
-            while (!SetupDiGetDeviceInstanceId(dev_info, &dev_info_data,
-                                               parent_dev_id, size, &size)) {
+            if (!SetupDiGetDeviceInstanceId(dev_info, &dev_info_data,
+                                            parent_dev_id, size, &size)) {
                 if (GetLastError() == ERROR_INSUFFICIENT_BUFFER) {
                     parent_dev_id = g_malloc(size);
                 } else {
@@ -691,6 +701,14 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
                 }
             }
 
+            if (!SetupDiGetDeviceInstanceId(dev_info, &dev_info_data,
+                                            parent_dev_id, size, &size)) {
+                // parent_dev_id already is allocated
+                error_setg_win32(errp, GetLastError(),
+                                    "failed to get device instance ID");
+                goto end;
+            }
+
             /*
              * CM API used here as opposed to
              * SetupDiGetDeviceProperty(..., DEVPKEY_Device_Parent, ...)
-- 
2.25.1


