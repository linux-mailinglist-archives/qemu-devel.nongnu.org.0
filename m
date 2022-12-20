Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE37652206
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:08:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7dCg-0005yz-QS; Tue, 20 Dec 2022 09:02:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p7dCW-0005st-JC
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:02:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p7dCU-0002XA-TI
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:02:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671544953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RoglSNHRStA7iusp7Ok/OG6eExg60+j4uM7vv5xGEmg=;
 b=PWW2om8J9qUhJZSPmnl5BMc6l1JJ+Vvxqek4MrArVwvSRrdSIJOanaWb/5E3wfOPKUqzr5
 c4hp2RuqQe8h5VGxeeUry0VqROEjA2Bef8GAHJXTQyLztmjqplr+iWrqYXgiY34oipUZST
 ZCxjpCHCivIRY/6zobEJjeQQsLiUx6c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-xzn1V_uGP82pprkRM7owiw-1; Tue, 20 Dec 2022 09:02:31 -0500
X-MC-Unique: xzn1V_uGP82pprkRM7owiw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B64B858F0E;
 Tue, 20 Dec 2022 14:02:31 +0000 (UTC)
Received: from kostyanf14nb.Dlink (ovpn-192-73.brq.redhat.com [10.40.192.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 97F0714152F6;
 Tue, 20 Dec 2022 14:02:30 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL v3 2/6] qga:/qga-win: skip getting pci info for USB disks
Date: Tue, 20 Dec 2022 16:02:21 +0200
Message-Id: <20221220140225.615908-3-kkostiuk@redhat.com>
In-Reply-To: <20221220140225.615908-1-kkostiuk@redhat.com>
References: <20221220140225.615908-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

Skip getting PCI info from disks type USB and give them an empty PCI address instead.

Signed-off-by: Kfir Manor <kfir@daynix.com>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 qga/commands-win32.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index bd0f3cccfe..b5fee6a2cd 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -874,10 +874,14 @@ static void get_single_disk_info(int disk_number,
      * if that doesn't hold since that suggests some other unexpected
      * breakage
      */
-    disk->pci_controller = get_pci_info(disk_number, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        goto err_close;
+    if (disk->bus_type == GUEST_DISK_BUS_TYPE_USB) {
+        disk->pci_controller = get_empty_pci_address();
+    } else {
+        disk->pci_controller = get_pci_info(disk_number, &local_err);
+        if (local_err) {
+            error_propagate(errp, local_err);
+            goto err_close;
+        }
     }
     if (disk->bus_type == GUEST_DISK_BUS_TYPE_SCSI
             || disk->bus_type == GUEST_DISK_BUS_TYPE_IDE
-- 
2.25.1


