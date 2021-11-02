Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4545A4434FB
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 19:00:01 +0100 (CET)
Received: from localhost ([::1]:49928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhy4m-00029p-DI
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 14:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhy2Q-0007sk-20
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:57:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhy2M-0006mv-4K
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:57:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635875848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y6xuNF/kPJ0Q1HvTS2RwpxwCzBfCHTGT3cZ5prjyV8s=;
 b=QyL+O3i/fiwlW9tLTUP1N3gk9VnZaOJ36BDbCMwncziMOn8fR/uTFlXyuByWLlMz+Mwkdh
 +5L+zIiWup6+bBgmkNR5MdxIvyNCVnNgU2chaVb+yv2kzCILRP519Oq1ZKDtPg2GTs1Fo/
 KZruwIRCmG/P6RuOQc7IgNbfkjKZqKw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-6Cfj40aDMHaUx97TPp_peA-1; Tue, 02 Nov 2021 13:57:25 -0400
X-MC-Unique: 6Cfj40aDMHaUx97TPp_peA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C25EB10247A8;
 Tue,  2 Nov 2021 17:57:23 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D11EB19C59;
 Tue,  2 Nov 2021 17:57:19 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/18] monitor: remove 'info ioapic' HMP command
Date: Tue,  2 Nov 2021 17:56:43 +0000
Message-Id: <20211102175700.1175996-2-berrange@redhat.com>
In-Reply-To: <20211102175700.1175996-1-berrange@redhat.com>
References: <20211102175700.1175996-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This command was turned into a no-op four years ago in

  commit 0c8465440d50c18a7bb13d0a866748f0593e193a
  Author: Peter Xu <peterx@redhat.com>
  Date:   Fri Dec 29 15:31:04 2017 +0800

    hmp: obsolete "info ioapic"

Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hmp-commands-info.hx         | 15 ---------------
 include/monitor/hmp-target.h |  1 -
 target/i386/monitor.c        |  6 ------
 3 files changed, 22 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 4c966e8a6b..24c478aead 100644
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
index 96956d0fc4..ffdc15a34b 100644
--- a/include/monitor/hmp-target.h
+++ b/include/monitor/hmp-target.h
@@ -48,7 +48,6 @@ void hmp_info_mem(Monitor *mon, const QDict *qdict);
 void hmp_info_tlb(Monitor *mon, const QDict *qdict);
 void hmp_mce(Monitor *mon, const QDict *qdict);
 void hmp_info_local_apic(Monitor *mon, const QDict *qdict);
-void hmp_info_io_apic(Monitor *mon, const QDict *qdict);
 void hmp_info_sev(Monitor *mon, const QDict *qdict);
 void hmp_info_sgx(Monitor *mon, const QDict *qdict);
 
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 8166e17693..8e4b4d600c 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -667,9 +667,3 @@ void hmp_info_local_apic(Monitor *mon, const QDict *qdict)
     }
     x86_cpu_dump_local_apic_state(cs, CPU_DUMP_FPU);
 }
-
-void hmp_info_io_apic(Monitor *mon, const QDict *qdict)
-{
-    monitor_printf(mon, "This command is obsolete and will be "
-                   "removed soon. Please use 'info pic' instead.\n");
-}
-- 
2.31.1


