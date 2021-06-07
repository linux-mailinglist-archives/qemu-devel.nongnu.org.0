Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CBE39DE52
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 16:04:42 +0200 (CEST)
Received: from localhost ([::1]:36386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqFrt-0007xo-LZ
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 10:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqFmV-0001UF-E6
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 09:59:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqFmQ-0004WH-E2
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 09:59:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623074341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/fFaUz1XLeopnUn2h0gMRc/EfqneVbJVfK3qdt52W2Y=;
 b=H43T8oHUomRBmIflXp0o78hflNdzc9UqAJtMeZmwDWZE9Ls3Vh0vSpEy6kGlhEXFK/+6oP
 SyRtaPWXqvruGLaX2KrNyb8i61nkFzduoPQ5hwKSUUC7CEf2r/4rCwBo4AZ1PzJ7ZvzIL/
 SSx598SQvMKfVBbVq4wuqnQJJMAA7rI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-2WK-MCi2MVet9oFIJNHq3A-1; Mon, 07 Jun 2021 09:59:00 -0400
X-MC-Unique: 2WK-MCi2MVet9oFIJNHq3A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C303D79EC1;
 Mon,  7 Jun 2021 13:58:59 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-203.ams2.redhat.com
 [10.36.114.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1A1519C66;
 Mon,  7 Jun 2021 13:58:57 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/4] NOT FOR MERGE target/i386: use x86-64-abi1 CPU model
 as default on x86_64
Date: Mon,  7 Jun 2021 14:58:43 +0100
Message-Id: <20210607135843.196595-5-berrange@redhat.com>
In-Reply-To: <20210607135843.196595-1-berrange@redhat.com>
References: <20210607135843.196595-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only differences between x86-64-abi1 and qemu64 is that the former
does not have the 'vme' or 'svm' flags.

In practice I don't think we should make this change, because it doesn't
especially add any value as-is. The only possible case is around 'svm'
because KVM already masks that feature, but TCG allows it. Thus using
x86-64-abi1 would mean that KVM and TCG expose a more consistent feature
set.

Also note that while libvirt can cope with default CPUs changing now,
it can't with the default CPU being a model name that it does not
already know about.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/i386/pc_piix.c | 3 +++
 hw/i386/pc_q35.c  | 3 +++
 target/i386/cpu.h | 2 +-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 30b8bd6ea9..8f23bad647 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -444,6 +444,9 @@ static void pc_i440fx_5_2_machine_options(MachineClass *m)
     m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_5_2, hw_compat_5_2_len);
     compat_props_add(m->compat_props, pc_compat_5_2, pc_compat_5_2_len);
+#ifdef TARGET_X86_64
+    m->default_cpu_type = X86_CPU_TYPE_NAME("qemu64");
+#endif
 }
 
 DEFINE_I440FX_MACHINE(v5_2, "pc-i440fx-5.2", NULL,
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 46a0f196f4..a684c1db3b 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -372,6 +372,9 @@ static void pc_q35_5_2_machine_options(MachineClass *m)
     m->alias = NULL;
     compat_props_add(m->compat_props, hw_compat_5_2, hw_compat_5_2_len);
     compat_props_add(m->compat_props, pc_compat_5_2, pc_compat_5_2_len);
+#ifdef TARGET_X86_64
+    m->default_cpu_type = X86_CPU_TYPE_NAME("qemu64");
+#endif
 }
 
 DEFINE_Q35_MACHINE(v5_2, "pc-q35-5.2", NULL,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index ac3abea97c..9b895a63c7 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1999,7 +1999,7 @@ uint64_t cpu_get_tsc(CPUX86State *env);
 #define CPU_RESOLVING_TYPE TYPE_X86_CPU
 
 #ifdef TARGET_X86_64
-#define TARGET_DEFAULT_CPU_TYPE X86_CPU_TYPE_NAME("qemu64")
+#define TARGET_DEFAULT_CPU_TYPE X86_CPU_TYPE_NAME("x86-64-abi1")
 #else
 #define TARGET_DEFAULT_CPU_TYPE X86_CPU_TYPE_NAME("qemu32")
 #endif
-- 
2.31.1


