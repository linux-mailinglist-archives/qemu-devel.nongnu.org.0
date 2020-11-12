Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55ADB2B0CDC
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:40:57 +0100 (CET)
Received: from localhost ([::1]:45316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdHWi-0004Fh-CG
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:40:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdHUD-0002Pf-4y
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:38:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdHUB-0006PV-D7
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:38:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605206298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UtM8AmbGW7trohI4UkXVaady5PCxEYTFhU1MA6rkjNA=;
 b=JbOpJ4Md9xty3GWrt+hVy7+Fu2OcczJiOZc594sxk/EldBr6Qcl9k3zjHvNWZFrjVz87lF
 k6DoBEFkilOkGWkkWwYrpPl8Tcan4aJ1adEftStpih6Fq7LqEC8RaH4Q/I4qJZ7+fbc1iU
 d+sPIO/6EqXPbCFO7YVMxfTkIdKlbOI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-0xuL2W8APBCsEN_XfL0BxA-1; Thu, 12 Nov 2020 13:38:16 -0500
X-MC-Unique: 0xuL2W8APBCsEN_XfL0BxA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 751B3801817;
 Thu, 12 Nov 2020 18:38:15 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-60.ams2.redhat.com
 [10.36.115.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 758235D9E4;
 Thu, 12 Nov 2020 18:38:10 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, kuhn.chenqun@huawei.com, zhengchuan@huawei.com,
 lihaotian9@huawei.com, longpeng2@huawei.com, liangpeng10@huawei.com,
 philmd@redhat.com, liuzhiqiang26@huawei.com
Subject: [PULL 02/11] ACPI: Avoid infinite recursion when dump-vmstate
Date: Thu, 12 Nov 2020 18:37:49 +0000
Message-Id: <20201112183758.203176-3-dgilbert@redhat.com>
In-Reply-To: <20201112183758.203176-1-dgilbert@redhat.com>
References: <20201112183758.203176-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peng Liang <liangpeng10@huawei.com>

There is a field with vmstate_ghes_state as vmsd in vmstate_ghes_state,
which will lead to infinite recursion in dump_vmstate_vmsd.

Fixes: a08a64627b ("ACPI: Record the Generic Error Status Block address")
Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20201112020638.874515-1-liangpeng10@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hw/acpi/generic_event_device.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 6df400e1ee..5454be67d5 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -322,6 +322,16 @@ static const VMStateDescription vmstate_ged_state = {
     }
 };
 
+static const VMStateDescription vmstate_ghes = {
+    .name = "acpi-ghes",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields     = (VMStateField[]) {
+        VMSTATE_UINT64(ghes_addr_le, AcpiGhesState),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 static bool ghes_needed(void *opaque)
 {
     AcpiGedState *s = opaque;
@@ -335,7 +345,7 @@ static const VMStateDescription vmstate_ghes_state = {
     .needed = ghes_needed,
     .fields      = (VMStateField[]) {
         VMSTATE_STRUCT(ghes_state, AcpiGedState, 1,
-                       vmstate_ghes_state, AcpiGhesState),
+                       vmstate_ghes, AcpiGhesState),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.28.0


