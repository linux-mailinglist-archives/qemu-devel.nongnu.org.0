Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B8264EC6D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 14:57:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6BAv-0008Ea-3B; Fri, 16 Dec 2022 08:54:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p6BAs-0008Dn-J8
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 08:54:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p6BAr-0007ly-5b
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 08:54:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671198892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e27iy0TzT10hX3O83O80Ti/WPpogThz2gOpDlSQ7h9k=;
 b=ZyF588GxCqGvIkADR23yV4SAU3Z2luOdfSG+RScIZYnq/ONKw+0inQFdXhyAL/Jc1214zH
 uA/H3KxG2rS41mnE1MxAkqZese+2gI3kI44GmvyFXMs+Km9tT76ADgkJPux6ManZbaPD9W
 V4ohfwdVAexBjaTTFSLVEOa2WE6Occ8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-c6XqWlhzNmmYFC1Um-eTEQ-1; Fri, 16 Dec 2022 08:54:49 -0500
X-MC-Unique: c6XqWlhzNmmYFC1Um-eTEQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD38C101A52E;
 Fri, 16 Dec 2022 13:54:48 +0000 (UTC)
Received: from kostyanf14nb.lan (ovpn-193-42.brq.redhat.com [10.40.193.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C2A8E40C2005;
 Fri, 16 Dec 2022 13:54:47 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 4/8] qga:/qga-win: adding a empty PCI address creation function
Date: Fri, 16 Dec 2022 15:54:35 +0200
Message-Id: <20221216135439.465033-5-kkostiuk@redhat.com>
In-Reply-To: <20221216135439.465033-1-kkostiuk@redhat.com>
References: <20221216135439.465033-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Kfir Manor <kfir@daynix.com>

Refactoring code to avoid duplication of creating an empty PCI address code.

Signed-off-by: Kfir Manor <kfir@daynix.com>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 qga/commands-win32.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index ec9f55b453..a645480496 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -599,6 +599,18 @@ static void get_pci_address_for_device(GuestPCIAddress *pci,
     }
 }
 
+static GuestPCIAddress *get_empty_pci_address(void)
+{
+    GuestPCIAddress *pci = NULL;
+
+    pci = g_malloc0(sizeof(*pci));
+    pci->domain = -1;
+    pci->slot = -1;
+    pci->function = -1;
+    pci->bus = -1;
+    return pci;
+}
+
 static GuestPCIAddress *get_pci_info(int number, Error **errp)
 {
     HDEVINFO dev_info = INVALID_HANDLE_VALUE;
@@ -608,13 +620,7 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
     SP_DEVICE_INTERFACE_DATA dev_iface_data;
     HANDLE dev_file;
     int i;
-    GuestPCIAddress *pci = NULL;
-
-    pci = g_malloc0(sizeof(*pci));
-    pci->domain = -1;
-    pci->slot = -1;
-    pci->function = -1;
-    pci->bus = -1;
+    GuestPCIAddress *pci = get_empty_pci_address();
 
     dev_info = SetupDiGetClassDevs(&GUID_DEVINTERFACE_DISK, 0, 0,
                                    DIGCF_PRESENT | DIGCF_DEVICEINTERFACE);
-- 
2.25.1


