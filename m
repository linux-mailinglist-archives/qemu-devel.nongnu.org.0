Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A517E622B79
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 13:23:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osk6B-0001b6-Gt; Wed, 09 Nov 2022 07:22:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1osk68-0001W1-7b
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 07:22:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1osk66-000544-L2
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 07:22:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667996543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=7jIaiaDKssQ2jR0OcvYlr2dm1vmVE2W+aJNgG11GGOM=;
 b=b5W/upR6UxDXOh47iUX/DaHCz8auxGy04ui7Ay4SOCZvjirZXxY3Q6077XVJ5ij4Zrx36y
 CpxFKyJJG6i1QtzoEcKBxe0+wKWC00F4JVUyaFghoPjzhwICm8nn+p+207fSuS3xhXLfZS
 MJezrGoW9BoDVonxEptlxj1gjN5t7HI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-279-nZNBP0wVOxelpovYpwFKrw-1; Wed, 09 Nov 2022 07:22:12 -0500
X-MC-Unique: nZNBP0wVOxelpovYpwFKrw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B6E2282380F;
 Wed,  9 Nov 2022 12:22:12 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E8542166B29;
 Wed,  9 Nov 2022 12:22:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH] hw/pci-host/pnv_phb: Avoid quitting QEMU if hotplug of
 pnv-phb-root-port fails
Date: Wed,  9 Nov 2022 13:22:10 +0100
Message-Id: <20221109122210.115667-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

Currently QEMU terminates if you try to hotplug pnv-phb-root-port in
an environment where it is not supported, e.g. if doing this:

 echo "device_add pnv-phb-root-port" | \
 ./qemu-system-ppc64 -monitor stdio -M powernv9

To avoid this problem, the pnv_phb_root_port_realize() function should
not use error_fatal when trying to set the properties which might not
be available.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/pci-host/pnv_phb.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index 7b11f1e8dd..0b26b43736 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -241,8 +241,16 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
      * QOM id. 'chip_id' is going to be used as PCIE chassis for the
      * root port.
      */
-    chip_id = object_property_get_int(OBJECT(bus), "chip-id", &error_fatal);
-    index = object_property_get_int(OBJECT(bus), "phb-id", &error_fatal);
+    chip_id = object_property_get_int(OBJECT(bus), "chip-id", &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+    index = object_property_get_int(OBJECT(bus), "phb-id", &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
 
     /* Set unique chassis/slot values for the root port */
     qdev_prop_set_uint8(dev, "chassis", chip_id);
-- 
2.31.1


