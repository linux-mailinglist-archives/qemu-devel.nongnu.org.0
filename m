Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B2B30ABBA
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:43:29 +0100 (CET)
Received: from localhost ([::1]:36634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6bMO-0005Rg-Cm
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:43:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6bFw-00069e-QA
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:36:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6bFu-0001yQ-8N
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:36:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612193804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cQmf6Y9P+GDqVnu/dGTDDJ0xu42HmxVndw8BdoX6gO4=;
 b=M+ria2ajddbETghqHlslj9oB2aKQs5oY9LQIwUlk2T56bw/2Xq4l9rlUoP/09sPkvlsbQN
 Y3t09KIYG6fjT1sPFsTBqOBLAuzmaKRMWuf/GqeaIHpgHE6v97/D5Fp6RIduOzxUzYW2nN
 YJdujW9t0SKxlrzg8Oca9lGDy83IlHg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-8y3CTZISNzitbWheG2V-JA-1; Mon, 01 Feb 2021 10:36:41 -0500
X-MC-Unique: 8y3CTZISNzitbWheG2V-JA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 801318049CA;
 Mon,  1 Feb 2021 15:36:40 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-195.ams2.redhat.com
 [10.36.114.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76C805D756;
 Mon,  1 Feb 2021 15:36:38 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 3/4] NOT FOR MERGE target/i386: use x86-64-abi1 CPU model
 as default on x86_64
Date: Mon,  1 Feb 2021 15:36:05 +0000
Message-Id: <20210201153606.4158076-4-berrange@redhat.com>
In-Reply-To: <20210201153606.4158076-1-berrange@redhat.com>
References: <20210201153606.4158076-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
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
Cc: Florian Weimer <fweimer@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
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
index 6188c3e97e..c4c003599f 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -445,6 +445,9 @@ static void pc_i440fx_5_2_machine_options(MachineClass *m)
     m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_5_2, hw_compat_5_2_len);
     compat_props_add(m->compat_props, pc_compat_5_2, pc_compat_5_2_len);
+#ifdef TARGET_X86_64
+    m->default_cpu_type = X86_CPU_TYPE_NAME("qemu64");
+#endif
 }
 
 DEFINE_I440FX_MACHINE(v5_2, "pc-i440fx-5.2", NULL,
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 0a212443aa..606ac4f1f4 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -361,6 +361,9 @@ static void pc_q35_5_2_machine_options(MachineClass *m)
     m->alias = NULL;
     compat_props_add(m->compat_props, hw_compat_5_2, hw_compat_5_2_len);
     compat_props_add(m->compat_props, pc_compat_5_2, pc_compat_5_2_len);
+#ifdef TARGET_X86_64
+    m->default_cpu_type = X86_CPU_TYPE_NAME("qemu64");
+#endif
 }
 
 DEFINE_Q35_MACHINE(v5_2, "pc-q35-5.2", NULL,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d23a5b340a..0a436b575f 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1956,7 +1956,7 @@ uint64_t cpu_get_tsc(CPUX86State *env);
 #define CPU_RESOLVING_TYPE TYPE_X86_CPU
 
 #ifdef TARGET_X86_64
-#define TARGET_DEFAULT_CPU_TYPE X86_CPU_TYPE_NAME("qemu64")
+#define TARGET_DEFAULT_CPU_TYPE X86_CPU_TYPE_NAME("x86-64-abi1")
 #else
 #define TARGET_DEFAULT_CPU_TYPE X86_CPU_TYPE_NAME("qemu32")
 #endif
-- 
2.29.2


