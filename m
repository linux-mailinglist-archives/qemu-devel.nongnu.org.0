Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBD459044
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jun 2019 04:09:42 +0200 (CEST)
Received: from localhost ([::1]:55674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hggKb-00064S-TJ
	for lists+qemu-devel@lfdr.de; Thu, 27 Jun 2019 22:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49960)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hgg8B-0000gG-Bt
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 21:56:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hgg8A-0000Be-E7
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 21:56:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52358)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hgg8A-00009Z-7h
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 21:56:50 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8039E307CDEA;
 Fri, 28 Jun 2019 01:56:49 +0000 (UTC)
Received: from localhost (ovpn-116-7.gru2.redhat.com [10.97.116.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CC0410013D9;
 Fri, 28 Jun 2019 01:56:48 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Thu, 27 Jun 2019 22:55:52 -0300
Message-Id: <20190628015606.32107-16-ehabkost@redhat.com>
In-Reply-To: <20190628015606.32107-1-ehabkost@redhat.com>
References: <20190628015606.32107-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Fri, 28 Jun 2019 01:56:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 15/29] pc: fix possible NULL pointer dereference
 in pc_machine_get_device_memory_region_size()
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

QEMU will crash when device-memory-region-size property is read if ms->device_memory
wasn't initialized yet.

Crash can be reproduced with:
 $QEMU -preconfig -qmp unix:qmp_socket,server,nowait &
 ./scripts/qmp/qom-get -s qmp_socket /machine.device-memory-region-size

Instead of crashing return 0 if ms->device_memory hasn't been initialized.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20190624090200.5383-1-imammedo@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/i386/pc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 9921ce4f5e..9b953eeeea 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -2489,7 +2489,11 @@ pc_machine_get_device_memory_region_size(Object *obj, Visitor *v,
                                          Error **errp)
 {
     MachineState *ms = MACHINE(obj);
-    int64_t value = memory_region_size(&ms->device_memory->mr);
+    int64_t value = 0;
+
+    if (ms->device_memory) {
+        value = memory_region_size(&ms->device_memory->mr);
+    }
 
     visit_type_int(v, name, &value, errp);
 }
-- 
2.18.0.rc1.1.g3f1ff2140


