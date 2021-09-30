Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EA141DB28
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 15:35:14 +0200 (CEST)
Received: from localhost ([::1]:33728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVwDR-0002Sv-HY
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 09:35:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVw3Z-0000GR-7Z
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:25:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVw3X-0006yJ-NP
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:25:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633008299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DzVBbNIJnvx6NjmqjsMEoqvUzPv4kgTcGuAJCm71FxE=;
 b=P4bIaWELOEGqHii4teXtJToPA01sQ6IM6gkA2KdCr26EWNzxTkFCkkoSwYK/Z0cldIqF9k
 zsFMede/3CeWjEXDoc4Vcv1gOCfzbi5Tfiyz5KilHRRy3rDFWXxtO12Z1jORZXxkNgXXR2
 lNSi9sKIMsXK/xDHkkhk388ewKxgiVs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-SYmwrsDsM_WxaizM1S_UDQ-1; Thu, 30 Sep 2021 09:24:58 -0400
X-MC-Unique: SYmwrsDsM_WxaizM1S_UDQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78EA2802C8A;
 Thu, 30 Sep 2021 13:24:56 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.195.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E086E5D9C6;
 Thu, 30 Sep 2021 13:24:14 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/19] monitor: remove 'info ioapic' HMP command
Date: Thu, 30 Sep 2021 14:23:36 +0100
Message-Id: <20210930132349.3601823-7-berrange@redhat.com>
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This command was turned into a no-op four years ago in

  commit 0c8465440d50c18a7bb13d0a866748f0593e193a
  Author: Peter Xu <peterx@redhat.com>
  Date:   Fri Dec 29 15:31:04 2017 +0800

    hmp: obsolete "info ioapic"

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hmp-commands-info.hx         | 15 ---------------
 include/monitor/hmp-target.h |  1 -
 target/i386/monitor.c        |  6 ------
 3 files changed, 22 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 27206ac049..f8312342cd 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -127,21 +127,6 @@ SRST
     Show local APIC state
 ERST
 
-#if defined(TARGET_I386)
-    {
-        .name       = "ioapic",
-        .args_type  = "",
-        .params     = "",
-        .help       = "show io apic state",
-        .cmd        = hmp_info_io_apic,
-    },
-#endif
-
-SRST
-  ``info ioapic``
-    Show io APIC state
-ERST
-
     {
         .name       = "cpus",
         .args_type  = "",
diff --git a/include/monitor/hmp-target.h b/include/monitor/hmp-target.h
index 60fc92722a..df79ad3355 100644
--- a/include/monitor/hmp-target.h
+++ b/include/monitor/hmp-target.h
@@ -48,6 +48,5 @@ void hmp_info_mem(Monitor *mon, const QDict *qdict);
 void hmp_info_tlb(Monitor *mon, const QDict *qdict);
 void hmp_mce(Monitor *mon, const QDict *qdict);
 void hmp_info_local_apic(Monitor *mon, const QDict *qdict);
-void hmp_info_io_apic(Monitor *mon, const QDict *qdict);
 
 #endif /* MONITOR_HMP_TARGET_H */
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 119211f0b0..19468c4e85 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -669,12 +669,6 @@ void hmp_info_local_apic(Monitor *mon, const QDict *qdict)
     x86_cpu_dump_local_apic_state(cs, CPU_DUMP_FPU);
 }
 
-void hmp_info_io_apic(Monitor *mon, const QDict *qdict)
-{
-    monitor_printf(mon, "This command is obsolete and will be "
-                   "removed soon. Please use 'info pic' instead.\n");
-}
-
 SevInfo *qmp_query_sev(Error **errp)
 {
     SevInfo *info;
-- 
2.31.1


