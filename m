Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A86DE489AD1
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 14:52:59 +0100 (CET)
Received: from localhost ([::1]:56238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6v6Y-0000q9-Pi
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 08:52:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1n6v0m-0002Ao-D1
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:47:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1n6v0k-00071a-0c
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:47:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641822417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=INkPE+Nwn2YIyU4WMhuqG3ay4pwb6QMnPEdGJng4ARs=;
 b=NIEc3FUmMT8pIthTxlfTDc0+3/XKMwLOdSD/SXWs8hmmhoq+SWgNR6sBTw+lJX3z+IhAwB
 BjLOTSl7gp+nRO0GoMcTGImyua/o1dTZ6knUO5Dc1Xp185PMyJ4i5mRtEVNNeCi8pwJj9N
 8F36MYhH4Do8r7tJOQTG4O67i7iOKzg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-G48DzG6-Ncu6l0mFUu-DUw-1; Mon, 10 Jan 2022 08:46:56 -0500
X-MC-Unique: G48DzG6-Ncu6l0mFUu-DUw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FE6C81CCBD;
 Mon, 10 Jan 2022 13:46:55 +0000 (UTC)
Received: from kostyanf14nb.Dlink (unknown [10.40.193.252])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B9D427BB5B;
 Mon, 10 Jan 2022 13:46:54 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 6/9] gqa-win: get_pci_info: Add g_autofree for few variables
Date: Mon, 10 Jan 2022 15:46:41 +0200
Message-Id: <20220110134644.107375-7-kkostiuk@redhat.com>
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

Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
---
 qga/commands-win32.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 8588fa8633..3092566313 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -626,9 +626,9 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
     dev_info_data.cbSize = sizeof(SP_DEVINFO_DATA);
     dev_iface_data.cbSize = sizeof(SP_DEVICE_INTERFACE_DATA);
     for (i = 0; SetupDiEnumDeviceInfo(dev_info, i, &dev_info_data); i++) {
-        PSP_DEVICE_INTERFACE_DETAIL_DATA pdev_iface_detail_data = NULL;
+        g_autofree PSP_DEVICE_INTERFACE_DETAIL_DATA pdev_iface_detail_data = NULL;
         STORAGE_DEVICE_NUMBER sdn;
-        char *parent_dev_id = NULL;
+        g_autofree char *parent_dev_id = NULL;
         SP_DEVINFO_DATA parent_dev_info_data;
         DWORD size = 0;
 
@@ -654,7 +654,6 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
             dev_file = CreateFile(pdev_iface_detail_data->DevicePath, 0,
                                   FILE_SHARE_READ, NULL, OPEN_EXISTING, 0,
                                   NULL);
-            g_free(pdev_iface_detail_data);
 
             if (!DeviceIoControl(dev_file, IOCTL_STORAGE_GET_DEVICE_NUMBER,
                                  NULL, 0, &sdn, sizeof(sdn), &size, NULL)) {
@@ -741,7 +740,6 @@ static GuestPCIAddress *get_pci_info(int number, Error **errp)
         parent_dev_info =
             SetupDiGetClassDevs(&GUID_DEVINTERFACE_STORAGEPORT, parent_dev_id,
                                 NULL, DIGCF_PRESENT | DIGCF_DEVICEINTERFACE);
-        g_free(parent_dev_id);
 
         if (parent_dev_info == INVALID_HANDLE_VALUE) {
             error_setg_win32(errp, GetLastError(),
-- 
2.25.1


