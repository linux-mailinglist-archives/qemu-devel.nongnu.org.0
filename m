Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAEE472B24
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 12:18:47 +0100 (CET)
Received: from localhost ([::1]:34088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwjLy-0002fq-51
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 06:18:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mwjJW-0008WH-3R
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:16:15 -0500
Received: from [2a00:1450:4864:20::52f] (port=42720
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mwjJS-0007Ff-GX
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 06:16:13 -0500
Received: by mail-ed1-x52f.google.com with SMTP id r11so50238316edd.9
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 03:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mMxX3If9fTUUjGK3dbCE2gziT93rl8rcCI1gT1hsj0o=;
 b=YQWbPTzWjE/zhrhyUcnkrVQdmcrZ0XeL29Q5wJ/szVWPVWhccKtUzbhXCKA5fmu5Q1
 bShuIH5YHZUGp4ORLntd9kA++NDiuw1hlC9GEwXA+o+IjCyN2BazeodWeQPPFzZMqd2R
 cd2kuM4eQMYna3hPAxCD+M5uJa0QEaLic++65hUreuV0gahubY0cbRqODVfz5NsJ8sYG
 grTetEXkQK2frk07iplg2Pkn5OFejb/NUuOgABntT6YIHTPF9btHJr5WQleJL2dMGUA/
 HuSzKdlu4ucISTCJ7VvJPbSbi75MrZLq2H8eYpTCw1kgNzVdh7y7Ij0PcCU+0tNiswZh
 deaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mMxX3If9fTUUjGK3dbCE2gziT93rl8rcCI1gT1hsj0o=;
 b=o+P0w99D3EDDuNTQU2RXHfg+Kk8/81VxlF9G5btW1TIhpy8NAyhbnOpjElOMx4PIrX
 gEtD1VprBgEIgvJb+PBdVGaI7IA+94SF7aMD4B55T4np1AeEmuBFFLnjkPNSrQc5zDnI
 kQ9lTfcRQlAg4jPPbFuXwhZGTOzscvR61B58WDBIC1AAruM6qzElLFl1FZXW8hwJK9Mo
 Mwm2d+JYSUDf+tau8ZljkmeT1Ghi5BCwESfBtj2OSDrkACb8Yi5p1e036QuYHOtsU2NF
 bWeF4d4z2FpdZhTZwFs3KTFcaSAdk6rkvCPCW/q6K15gvqTA1Du36Zhs4nMHVsnRiso6
 aUng==
X-Gm-Message-State: AOAM530rL0C0QGEeccFOrFA8j1g0Exw7/0ogW9SHU2Xy9VeiKD++3WaW
 s+bTBCNkvTXdEIw5h+6m1HHQ5nbAb9bblw==
X-Google-Smtp-Source: ABdhPJzkiw/Kj1mO0Ffiu8824fNwt0vSYsmnoZCdrsVW5JU+7WHPKrctN0886VdcwYVrNApw9OUgZQ==
X-Received: by 2002:a05:6402:5206:: with SMTP id
 s6mr64355859edd.286.1639394167356; 
 Mon, 13 Dec 2021 03:16:07 -0800 (PST)
Received: from kostyanf14nb.Dlink ([37.72.42.118])
 by smtp.gmail.com with ESMTPSA id a13sm6139384edk.29.2021.12.13.03.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 03:16:07 -0800 (PST)
From: Kostiantyn Kostiuk <konstantin@daynix.com>
To: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 2/5] gqa-win: get_pci_info: Use common 'cleanup' label
Date: Mon, 13 Dec 2021 13:15:51 +0200
Message-Id: <20211213111554.62394-3-konstantin@daynix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211213111554.62394-1-konstantin@daynix.com>
References: <20211213111554.62394-1-konstantin@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::52f;
 envelope-from=konstantin@daynix.com; helo=mail-ed1-x52f.google.com
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

To prevent memory leaks, always try to free initialized variables.

Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
---
 qga/commands-win32.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 3dd74fe225..12f7a88078 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -532,7 +532,7 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
                                    DIGCF_PRESENT | DIGCF_DEVICEINTERFACE);
     if (dev_info == INVALID_HANDLE_VALUE) {
         error_setg_win32(errp, GetLastError(), "failed to get devices tree");
-        goto out;
+        goto cleanup;
     }

     g_debug("enumerating devices");
@@ -562,7 +562,7 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
                 } else {
                     error_setg_win32(errp, GetLastError(),
                                      "failed to get device interfaces");
-                    goto free_dev_info;
+                    goto cleanup;
                 }
             }

@@ -576,7 +576,7 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
                 CloseHandle(dev_file);
                 error_setg_win32(errp, GetLastError(),
                                  "failed to get device slot number");
-                goto free_dev_info;
+                goto cleanup;
             }

             CloseHandle(dev_file);
@@ -586,7 +586,7 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
         } else {
             error_setg_win32(errp, GetLastError(),
                              "failed to get device interfaces");
-            goto free_dev_info;
+            goto cleanup;
         }

         g_debug("found device slot %d. Getting storage controller", number);
@@ -603,7 +603,7 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
                 } else {
                     error_setg_win32(errp, GetLastError(),
                                      "failed to get device instance ID");
-                    goto out;
+                    goto cleanup;
                 }
             }

@@ -617,14 +617,14 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
                 g_error("CM_Locate_DevInst failed with code %lx", cr);
                 error_setg_win32(errp, GetLastError(),
                                  "failed to get device instance");
-                goto out;
+                goto cleanup;
             }
             cr = CM_Get_Parent(&parent_dev_inst, dev_inst, 0);
             if (cr != CR_SUCCESS) {
                 g_error("CM_Get_Parent failed with code %lx", cr);
                 error_setg_win32(errp, GetLastError(),
                                  "failed to get parent device instance");
-                goto out;
+                goto cleanup;
             }

             cr = CM_Get_Device_ID_Size(&dev_id_size, parent_dev_inst, 0);
@@ -632,7 +632,7 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
                 g_error("CM_Get_Device_ID_Size failed with code %lx", cr);
                 error_setg_win32(errp, GetLastError(),
                                  "failed to get parent device ID length");
-                goto out;
+                goto cleanup;
             }

             ++dev_id_size;
@@ -647,7 +647,7 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
                 g_error("CM_Get_Device_ID failed with code %lx", cr);
                 error_setg_win32(errp, GetLastError(),
                                  "failed to get parent device ID");
-                goto out;
+                goto cleanup;
             }
         }

@@ -661,14 +661,14 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
         if (parent_dev_info == INVALID_HANDLE_VALUE) {
             error_setg_win32(errp, GetLastError(),
                              "failed to get parent device");
-            goto out;
+            goto cleanup;
         }

         parent_dev_info_data.cbSize = sizeof(SP_DEVINFO_DATA);
         if (!SetupDiEnumDeviceInfo(parent_dev_info, 0, &parent_dev_info_data)) {
             error_setg_win32(errp, GetLastError(),
                            "failed to get parent device data");
-            goto out;
+            goto cleanup;
         }

         for (j = 0;
@@ -748,11 +748,10 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
         break;
     }

-free_dev_info:
+cleanup:
     if (dev_info != INVALID_HANDLE_VALUE) {
         SetupDiDestroyDeviceInfoList(dev_info);
     }
-out:
     return pci;
 }

--
2.25.1

