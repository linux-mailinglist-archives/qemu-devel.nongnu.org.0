Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E893830B301
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 23:57:42 +0100 (CET)
Received: from localhost ([::1]:37860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6i8c-0000m4-1G
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 17:57:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l6i5I-000663-1K
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 17:54:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l6i5E-00025e-Hx
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 17:54:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612220051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3zY9N5aoCdgHS0R4abLCwJpvLZ4sXzF262CtMaH3APo=;
 b=ZO+t+cV7DTsEW6Jcc94XFZSzR1Y69An7Q4SQQ0D/fRdMTJHJ6Xhx3FagRFBAl21qXaw4Vx
 MCPKx1uSDXYQveoM2q7Ern+t/5G9yKPDIP2UJgeBLed3f5pMwZAG/Rh7npOshCiptMePl9
 VKcncPQqbZmIe4nqVULePF9UzoMEgL0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-Hnr9jnHsN56t9pBMHyCbqw-1; Mon, 01 Feb 2021 17:54:10 -0500
X-MC-Unique: Hnr9jnHsN56t9pBMHyCbqw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7379415729;
 Mon,  1 Feb 2021 22:54:09 +0000 (UTC)
Received: from localhost (ovpn-3-197.rdu2.redhat.com [10.22.3.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 310F76F7E9;
 Mon,  1 Feb 2021 22:54:09 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] i386: Sanity check CPU model feature sets
Date: Mon,  1 Feb 2021 17:54:04 -0500
Message-Id: <20210201225404.3941395-4-ehabkost@redhat.com>
In-Reply-To: <20210201225404.3941395-1-ehabkost@redhat.com>
References: <20210201225404.3941395-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

All CPU models must refer only to features that have their names
defined in feature_word_info[].feat_names, otherwise error
reporting and query-cpu-model-expansion will break.

Validate CPU feature flags in x86_cpudef_validate(), we can catch
mistakes more easily.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6285fb00eb8..3c066738e82 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5435,12 +5435,27 @@ static void x86_register_cpu_model_type(const char *name, X86CPUModel *model)
 static void x86_cpudef_validate(X86CPUDefinition *def)
 {
 #ifndef NDEBUG
+    FeatureWord w;
+    int bitnr;
+
     /* AMD aliases are handled at runtime based on CPUID vendor, so
      * they shouldn't be set on the CPU model table.
      */
     assert(!(def->features[FEAT_8000_0001_EDX] & CPUID_EXT2_AMD_ALIASES));
     /* catch mistakes instead of silently truncating model_id when too long */
     assert(def->model_id && strlen(def->model_id) <= 48);
+
+    /*
+     * CPU models must enable only features with valid names, otherwise
+     * error reporting and query-cpu-model-expansion can't work correctly.
+     */
+    for (w = 0; w < FEATURE_WORDS; w++) {
+        for (bitnr = 0; bitnr < 64; bitnr++) {
+            uint64_t mask = (1ULL << bitnr);
+            assert(!(def->features[w] & mask) ||
+                   feature_word_info[w].feat_names[bitnr]);
+        }
+    }
 #endif
 }
 
-- 
2.28.0


