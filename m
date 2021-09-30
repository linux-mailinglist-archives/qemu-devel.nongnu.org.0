Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C350541DB29
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 15:35:14 +0200 (CEST)
Received: from localhost ([::1]:33714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVwDR-0002SV-RV
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 09:35:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVw6Y-0002ih-2k
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:28:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVw6W-00015t-Hf
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:28:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633008481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mewiFxTsRgcxM0Jro8abVhqEZ/qsWZjoIZKPwza8gAA=;
 b=PVBhO9mQbL3GUtPmuDjLd7KxCXKhm/U03Lj4gdhnBO9E/Gl0G5Lg4vb4EzE3KeepO+Yk1I
 bYx3vdwsIfknRpVZLnKMJUJnjseXqH27EES3fsPxo8jDJEU5a7+InAnJiXdJCNR0zJz7jn
 TA1azkPwFRb6ZCVQA5qWuAy0OBqpjEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-hPLqi-t6Osu5tRFswm56gQ-1; Thu, 30 Sep 2021 09:27:58 -0400
X-MC-Unique: hPLqi-t6Osu5tRFswm56gQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A3759F92D;
 Thu, 30 Sep 2021 13:27:56 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.195.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F7625D9C6;
 Thu, 30 Sep 2021 13:27:29 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/19] hmp: synchronize cpu state for lapic info
Date: Thu, 30 Sep 2021 14:23:45 +0100
Message-Id: <20210930132349.3601823-16-berrange@redhat.com>
In-Reply-To: <20210930132349.3601823-1-berrange@redhat.com>
References: <20210930132349.3601823-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Dongli Zhang <dongli.zhang@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Joe Jin <joe.jin@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dongli Zhang <dongli.zhang@oracle.com>

While the default "info lapic" always synchronizes cpu state ...

mon_get_cpu()
-> mon_get_cpu_sync(mon, true)
   -> cpu_synchronize_state(cpu)
      -> ioctl KVM_GET_LAPIC (taking KVM as example)

... the cpu state is not synchronized when the apic-id is available as
argument.

The cpu state should be synchronized when apic-id is available. Otherwise
the "info lapic <apic-id>" always returns stale data.

Cc: Joe Jin <joe.jin@oracle.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 target/i386/monitor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 19468c4e85..2a41eac7fd 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -28,6 +28,7 @@
 #include "monitor/hmp-target.h"
 #include "monitor/hmp.h"
 #include "qapi/qmp/qdict.h"
+#include "sysemu/hw_accel.h"
 #include "sysemu/kvm.h"
 #include "sysemu/sev.h"
 #include "qapi/error.h"
@@ -656,7 +657,11 @@ void hmp_info_local_apic(Monitor *mon, const QDict *qdict)
 
     if (qdict_haskey(qdict, "apic-id")) {
         int id = qdict_get_try_int(qdict, "apic-id", 0);
+
         cs = cpu_by_arch_id(id);
+        if (cs) {
+            cpu_synchronize_state(cs);
+        }
     } else {
         cs = mon_get_cpu(mon);
     }
-- 
2.31.1


