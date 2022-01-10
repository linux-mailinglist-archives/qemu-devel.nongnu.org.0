Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2328D489ACF
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 14:52:35 +0100 (CET)
Received: from localhost ([::1]:54980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6v6A-0008AG-71
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 08:52:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1n6v0i-0001os-7s
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:46:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1n6v0f-0006zI-4U
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:46:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641822412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=81iP8Bmqh4r4uCT5+wWiTidyJFfp5wCSuLR5w8j5nss=;
 b=FIdAKMsvVcHVq1eyD0eLgVvU1OJTh4fdwl4X71E8IOs2U1bvysr+HekZwyU3XwTvjaoj4L
 xC3FMgR79EN4nwDCdq6WY8K67WiN5ubGXd7vH6VIltTD5cEAUMEowz+IuiHIof1nPvVwqO
 bd+3zpHHRZxp+UsNlGv5wB7kvr3I7EM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-Fbmg1grcMo6MAZyWQeXilA-1; Mon, 10 Jan 2022 08:46:51 -0500
X-MC-Unique: Fbmg1grcMo6MAZyWQeXilA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 582ED83DD20;
 Mon, 10 Jan 2022 13:46:50 +0000 (UTC)
Received: from kostyanf14nb.Dlink (unknown [10.40.193.252])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 727AA7BB4C;
 Mon, 10 Jan 2022 13:46:49 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/9] gqa-win: get_pci_info: Clean dev_info if handle is valid
Date: Mon, 10 Jan 2022 15:46:37 +0200
Message-Id: <20220110134644.107375-3-kkostiuk@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
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

Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
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


