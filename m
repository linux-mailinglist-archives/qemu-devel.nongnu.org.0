Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 065C130B300
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 23:56:20 +0100 (CET)
Received: from localhost ([::1]:33638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6i7G-0007NU-Vu
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 17:56:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l6i5H-00064z-5H
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 17:54:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l6i5D-00025a-R9
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 17:54:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612220051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HJBXSoWEw+48AA0c3Z3hHaBYGhwzEtH/EGkiv/yCyiE=;
 b=Ml4I92mcFEOVhGKxrcDDpx+kGY0K0ctKoEDcwBFkKK0Eq3s6OVImACTzMmAOnCAEQ15Hz4
 IoEgzQWTcSuJQkBU2c5GUq5aiYgGCfbRO7hXLyn3MF2Fhlz1AkvlYbw5tECDcc7B/KKbDi
 pJxzDupZOaXMt5Hc8p6e5IAo9f9uZ3c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-kJaNM8q-PeS4Jaj1-JALdA-1; Mon, 01 Feb 2021 17:54:09 -0500
X-MC-Unique: kJaNM8q-PeS4Jaj1-JALdA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86AA710054FF;
 Mon,  1 Feb 2021 22:54:08 +0000 (UTC)
Received: from localhost (ovpn-3-197.rdu2.redhat.com [10.22.3.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DE04E2E0;
 Mon,  1 Feb 2021 22:54:08 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] i386: Move asserts to separate x86_cpudef_validate()
 function
Date: Mon,  1 Feb 2021 17:54:03 -0500
Message-Id: <20210201225404.3941395-3-ehabkost@redhat.com>
In-Reply-To: <20210201225404.3941395-1-ehabkost@redhat.com>
References: <20210201225404.3941395-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Babu Moger <babu.moger@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Additional sanity checks will be added to the code, so move the
existing asserts to a separate function.

Wrap the whole function in `#ifndef NDEBUG` because the checks
will become more complex than trivial assert() calls.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 2bf3ab78056..6285fb00eb8 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5431,17 +5431,25 @@ static void x86_register_cpu_model_type(const char *name, X86CPUModel *model)
     type_register(&ti);
 }
 
-static void x86_register_cpudef_types(X86CPUDefinition *def)
+/* Sanity check CPU model definition before registering it */
+static void x86_cpudef_validate(X86CPUDefinition *def)
 {
-    X86CPUModel *m;
-    const X86CPUVersionDefinition *vdef;
-
+#ifndef NDEBUG
     /* AMD aliases are handled at runtime based on CPUID vendor, so
      * they shouldn't be set on the CPU model table.
      */
     assert(!(def->features[FEAT_8000_0001_EDX] & CPUID_EXT2_AMD_ALIASES));
     /* catch mistakes instead of silently truncating model_id when too long */
     assert(def->model_id && strlen(def->model_id) <= 48);
+#endif
+}
+
+static void x86_register_cpudef_types(X86CPUDefinition *def)
+{
+    X86CPUModel *m;
+    const X86CPUVersionDefinition *vdef;
+
+    x86_cpudef_validate(def);
 
     /* Unversioned model: */
     m = g_new0(X86CPUModel, 1);
-- 
2.28.0


