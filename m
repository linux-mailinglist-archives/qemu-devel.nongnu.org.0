Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BE43B688
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 15:55:29 +0200 (CEST)
Received: from localhost ([::1]:46744 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haKll-0005xi-3e
	for lists+qemu-devel@lfdr.de; Mon, 10 Jun 2019 09:55:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51164)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1haKgc-0008Qy-77
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 09:50:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1haKgb-0001jA-3H
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 09:50:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54550)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1haKga-0001gv-Tk
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 09:50:09 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 27D1181106;
 Mon, 10 Jun 2019 13:50:01 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D08E608C6;
 Mon, 10 Jun 2019 13:49:53 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 10 Jun 2019 15:50:35 +0200
Message-Id: <1560174635-22602-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Mon, 10 Jun 2019 13:50:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] pc: fix possible NULL pointer dereference in
 pc_machine_get_device_memory_region_size()
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
Cc: pbonzini@redhat.com, mst@redhat.com, ehabkost@redhat.com, armbru@redhat.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU will crash when device-memory-region-size property is read if ms->device_memory
wasn't initialized yet.

Crash can be reproduced with:
 $QEMU -preconfig -qmp unix:qmp_socket,server,nowait &
 ./scripts/qmp/qom-get -s qmp_socket /machine.device-memory-region-size

Instead of crashing return 0 if ms->device_memory hasn't been initialized.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v2:
  add reproducer to commit message
   (Markus Armbruster <armbru@redhat.com>)

 hw/i386/pc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index edc240b..1b7ead9 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -2459,7 +2459,11 @@ pc_machine_get_device_memory_region_size(Object *obj, Visitor *v,
                                          Error **errp)
 {
     MachineState *ms = MACHINE(obj);
-    int64_t value = memory_region_size(&ms->device_memory->mr);
+    int64_t value = 0;
+
+    if (ms->device_memory) {
+        memory_region_size(&ms->device_memory->mr);
+    }
 
     visit_type_int(v, name, &value, errp);
 }
-- 
2.7.4


