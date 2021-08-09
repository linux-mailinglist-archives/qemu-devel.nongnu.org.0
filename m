Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 811B53E434F
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 11:52:55 +0200 (CEST)
Received: from localhost ([::1]:36480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD1xm-0005Sn-IV
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 05:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mD1tv-0005Q9-BI
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:48:55 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:37644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mD1tr-00023H-Mg
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:48:55 -0400
Received: by mail-lf1-x133.google.com with SMTP id g30so371635lfv.4
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 02:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MZR+RF/C02tQXEliHb6SZNlilZioJS19xcXK6m2c6sY=;
 b=ZQAjdXC6cFEQs5cn2kpSGAvxBOAJxSja/Rky2I6F75FAZxIcMh3aFKfksBuOpsiXWj
 NNANelmcRzTogQufv0LboIqDhpGZHpUqVBROOAEToJwjHjXPntEZu7b9frNOhXWOhhXA
 j2BjAz4GKgg9C5c6xZljcif4PB97/X0jDW1FjGAqfbItbOZ8FNTeCT8i8+p4z9EHIzIV
 heAl/MRiwQSyX8w3+VaSYQR92auPXFk3cW6OBWONuTBJ1QPPjxQgXuIwcQSYHv4xofL3
 Mq32qYz9X3Croqz5wIVLms0j0Dsp+BHpMYXjBealvVO7yNPr3IsTFInPRoAr9DNK/p7V
 cUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MZR+RF/C02tQXEliHb6SZNlilZioJS19xcXK6m2c6sY=;
 b=nbWle3znMPrqaCdX1ACRJR/DI4uvswiLCKg0SyN5iDRroDmLiKv6ZJm78IHxKDEgnQ
 5BU9PQRIbxkXDt3ldGCfmrNY5JRM4Ct6v1zxYFx8rXR05Hc16uI24AUs6MsCnTGSWkpq
 bCCNjTxaKGcgHeShjqQvv6YGmm1OHEPQtCqIw/cbDpNyl08/qSBWwRlqSCtT3mk43rzi
 SHKNj5PmY7LdITvXnqVvkKtWclNUekhQE/jz3Ai4+StoyuviM7majgGStXt0VIGj7MGV
 WOitNAxlyDI564YmW0Ugh9/5eI+v1/1dvj/p//4LPbZGg0t9UPT3Y6RaPtvb31ZEcofG
 jVNw==
X-Gm-Message-State: AOAM531Vb2+mF7+gblQvvd+hBWRDu+CiPBReSu8ZnGESnulK+mEBjqKK
 W8JHK3ANTmJAzg7Xsat4IG92R6zoS/vGv5+u3ws=
X-Google-Smtp-Source: ABdhPJxJlMovfOV25bi4XINWb30B5edrjXa7U1+b8gnYGCgclT5m/XN6kwPUOiYqk9WcMXYVuv0HKw==
X-Received: by 2002:a05:6512:3d8d:: with SMTP id
 k13mr17753061lfv.394.1628502529526; 
 Mon, 09 Aug 2021 02:48:49 -0700 (PDT)
Received: from kostyanf14nb.Dlink (93-77-45-80.vin.volia.net. [93.77.45.80])
 by smtp.gmail.com with ESMTPSA id q20sm1681506lfo.19.2021.08.09.02.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 02:48:49 -0700 (PDT)
From: Kostiantyn Kostiuk <konstantin@daynix.com>
To: qemu-devel@nongnu.org
Subject: [RFC 2/4] gqa-win: get_pci_info: Use common 'cleanup' label
Date: Mon,  9 Aug 2021 12:48:37 +0300
Message-Id: <20210809094839.52312-2-konstantin@daynix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210809094839.52312-1-konstantin@daynix.com>
References: <20210809094839.52312-1-konstantin@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::133;
 envelope-from=konstantin@daynix.com; helo=mail-lf1-x133.google.com
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

To prevent memory leaks, always try to free initialized variables.

Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
---
 qga/commands-win32.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 2ad8593b82..724ce76a0e 100644
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


