Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 119F2489AE1
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 14:55:19 +0100 (CET)
Received: from localhost ([::1]:32814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6v8o-0004Ga-7Y
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 08:55:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1n6v0l-00023z-Bu
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:46:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1n6v0i-00070c-4t
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:46:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641822415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MLzXieUcRi2i7lUAR3KwYD9jCWQ4DcFrEKZJCFAUqcs=;
 b=G/9havb4v4FdK93D0QTQf72jN4InDHNSXBJqERi5WzUcAFMTBVNceFJlWh2nJEkovjX+D8
 wYJsrci+NJ3kRs/5dgzLnC+BZ1hHNx1QGEnWf0fKFHfWMfSrz+4HpnJDMFdq+xnU+VF/s0
 Cuf3dutbRHAutZslfwe5fgnd6jFb/mA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-286-LioVMVLkMbWqwaQ64LGopA-1; Mon, 10 Jan 2022 08:46:52 -0500
X-MC-Unique: LioVMVLkMbWqwaQ64LGopA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AABED760C6;
 Mon, 10 Jan 2022 13:46:51 +0000 (UTC)
Received: from kostyanf14nb.Dlink (unknown [10.40.193.252])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C043D7BB41;
 Mon, 10 Jan 2022 13:46:50 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 3/9] gqa-win: get_pci_info: Use common 'end' label
Date: Mon, 10 Jan 2022 15:46:38 +0200
Message-Id: <20220110134644.107375-4-kkostiuk@redhat.com>
In-Reply-To: <20220110134644.107375-1-kkostiuk@redhat.com>
References: <20220110134644.107375-1-kkostiuk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kkostiuk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Kostiantyn Kostiuk <konstantin@daynix.com>

To prevent memory leaks, always try to free initialized variables.

Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
---
 qga/commands-win32.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 3dd74fe225..93c5375132 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -532,7 +532,7 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
                                    DIGCF_PRESENT | DIGCF_DEVICEINTERFACE);
     if (dev_info == INVALID_HANDLE_VALUE) {
         error_setg_win32(errp, GetLastError(), "failed to get devices tree");
-        goto out;
+        goto end;
     }

     g_debug("enumerating devices");
@@ -562,7 +562,7 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
                 } else {
                     error_setg_win32(errp, GetLastError(),
                                      "failed to get device interfaces");
-                    goto free_dev_info;
+                    goto end;
                 }
             }

@@ -576,7 +576,7 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
                 CloseHandle(dev_file);
                 error_setg_win32(errp, GetLastError(),
                                  "failed to get device slot number");
-                goto free_dev_info;
+                goto end;
             }

             CloseHandle(dev_file);
@@ -586,7 +586,7 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
         } else {
             error_setg_win32(errp, GetLastError(),
                              "failed to get device interfaces");
-            goto free_dev_info;
+            goto end;
         }

         g_debug("found device slot %d. Getting storage controller", number);
@@ -603,7 +603,7 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
                 } else {
                     error_setg_win32(errp, GetLastError(),
                                      "failed to get device instance ID");
-                    goto out;
+                    goto end;
                 }
             }

@@ -617,14 +617,14 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
                 g_error("CM_Locate_DevInst failed with code %lx", cr);
                 error_setg_win32(errp, GetLastError(),
                                  "failed to get device instance");
-                goto out;
+                goto end;
             }
             cr = CM_Get_Parent(&parent_dev_inst, dev_inst, 0);
             if (cr != CR_SUCCESS) {
                 g_error("CM_Get_Parent failed with code %lx", cr);
                 error_setg_win32(errp, GetLastError(),
                                  "failed to get parent device instance");
-                goto out;
+                goto end;
             }

             cr = CM_Get_Device_ID_Size(&dev_id_size, parent_dev_inst, 0);
@@ -632,7 +632,7 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
                 g_error("CM_Get_Device_ID_Size failed with code %lx", cr);
                 error_setg_win32(errp, GetLastError(),
                                  "failed to get parent device ID length");
-                goto out;
+                goto end;
             }

             ++dev_id_size;
@@ -647,7 +647,7 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
                 g_error("CM_Get_Device_ID failed with code %lx", cr);
                 error_setg_win32(errp, GetLastError(),
                                  "failed to get parent device ID");
-                goto out;
+                goto end;
             }
         }

@@ -661,14 +661,14 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
         if (parent_dev_info == INVALID_HANDLE_VALUE) {
             error_setg_win32(errp, GetLastError(),
                              "failed to get parent device");
-            goto out;
+            goto end;
         }

         parent_dev_info_data.cbSize = sizeof(SP_DEVINFO_DATA);
         if (!SetupDiEnumDeviceInfo(parent_dev_info, 0, &parent_dev_info_data)) {
             error_setg_win32(errp, GetLastError(),
                            "failed to get parent device data");
-            goto out;
+            goto end;
         }

         for (j = 0;
@@ -748,11 +748,10 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
         break;
     }

-free_dev_info:
+end:
     if (dev_info != INVALID_HANDLE_VALUE) {
         SetupDiDestroyDeviceInfoList(dev_info);
     }
-out:
     return pci;
 }

--
2.25.1


