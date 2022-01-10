Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4FB489AF2
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 14:59:16 +0100 (CET)
Received: from localhost ([::1]:37686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6vCd-0007tX-Ee
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 08:59:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1n6v0n-0002HF-FJ
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:47:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1n6v0l-00072O-Ju
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:47:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641822418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gxyTMSHPbovkP19pWuJszzL337mGlIXOIGMkFvAaUvM=;
 b=SynTiL66s8Y547LQ8q4qeWevIH7PDh5z66/sXc1iInD/JuZxzdE2dl826K2gnHqU3JXp6a
 A0ey9oyHdHbMjMUz9zpSew7VI3vHnqpoIOCNUwiTPqx8UZ/QyhTez3xflqy+F066/QM+sa
 FiSkOXcyIn6XqZ3bhOiqzqF3DDlrvmg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-h5MxguDGMPCcBUX592PuCw-1; Mon, 10 Jan 2022 08:46:57 -0500
X-MC-Unique: h5MxguDGMPCcBUX592PuCw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D98F18B613F;
 Mon, 10 Jan 2022 13:46:57 +0000 (UTC)
Received: from kostyanf14nb.Dlink (unknown [10.40.193.252])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1366D7BB41;
 Mon, 10 Jan 2022 13:46:55 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 7/9] gqa-win: get_pci_info: Replace 'while' with 2 calls of the
 function
Date: Mon, 10 Jan 2022 15:46:42 +0200
Message-Id: <20220110134644.107375-8-kkostiuk@redhat.com>
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

Microsoft suggests this solution in the documentation:
https://docs.microsoft.com/en-us/windows/win32/api/setupapi/nf-setupapi-setupdigetdeviceinterfacedetaila

Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
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


