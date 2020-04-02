Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9515519CCCB
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Apr 2020 00:25:06 +0200 (CEST)
Received: from localhost ([::1]:47912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jK8Gn-0008MP-M6
	for lists+qemu-devel@lfdr.de; Thu, 02 Apr 2020 18:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34520)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1jK8DA-0001do-De
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 18:21:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1jK8D9-0007V8-Cp
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 18:21:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56834
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1jK8D9-0007Tw-8s
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 18:21:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585866078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F9xqnO3YKJSTA/95yMX9uswZdwcSnnmlp7FyfTrYddI=;
 b=K0PK4SRfL7YR/5SieJz/nCnoJyuj8KO62PjNoeEWRaoi5K3csAouAoPiK1zZ/IvLebToWR
 D7gQr8q4MdBR8/IgSK49TXm0x39g7diJ4IIzqVSi/uR+vbigUK7pyBV51dJXCgj5MDJoJ0
 L9CivX/EmFGqzFSpBRKzPwQ6SWn7eok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-qxc93IduMgmtF9UE-UymaA-1; Thu, 02 Apr 2020 18:21:16 -0400
X-MC-Unique: qxc93IduMgmtF9UE-UymaA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 904638017F3;
 Thu,  2 Apr 2020 22:21:15 +0000 (UTC)
Received: from localhost (ovpn-116-71.gru2.redhat.com [10.97.116.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B43931001B0B;
 Thu,  2 Apr 2020 22:21:14 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 4/9] i386: Introduce use_epyc_apic_id_encoding in
 X86CPUDefinition
Date: Thu,  2 Apr 2020 19:20:46 -0300
Message-Id: <20200402222051.523093-5-ehabkost@redhat.com>
In-Reply-To: <20200402222051.523093-1-ehabkost@redhat.com>
References: <20200402222051.523093-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Babu Moger <babu.moger@amd.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Babu Moger <babu.moger@amd.com>

Add a boolean variable use_epyc_apic_id_encoding in X86CPUDefinition.
This will be set if this cpu model needs to use new EPYC based
apic id encoding.

Override the handlers with EPYC based handlers if use_epyc_apic_id_encoding
is set. This will be done in x86_cpus_init.

Signed-off-by: Babu Moger <babu.moger@amd.com>
Message-Id: <158396723514.58170.14825482171652019765.stgit@naples-babu.amd.=
com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.c | 16 ++++++++++++++++
 target/i386/cpu.h |  1 +
 2 files changed, 17 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index c3eba567ea..50cd257a7e 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1614,6 +1614,10 @@ typedef struct X86CPUDefinition {
     FeatureWordArray features;
     const char *model_id;
     CPUCaches *cache_info;
+
+    /* Use AMD EPYC encoding for apic id */
+    bool use_epyc_apic_id_encoding;
+
     /*
      * Definitions for alternative versions of CPU model.
      * List is terminated by item with version =3D=3D 0.
@@ -1655,6 +1659,18 @@ static const X86CPUVersionDefinition *x86_cpu_def_ge=
t_versions(X86CPUDefinition
     return def->versions ?: default_version_list;
 }
=20
+bool cpu_x86_use_epyc_apic_id_encoding(const char *cpu_type)
+{
+    X86CPUClass *xcc =3D X86_CPU_CLASS(object_class_by_name(cpu_type));
+
+    assert(xcc);
+    if (xcc->model && xcc->model->cpudef) {
+        return xcc->model->cpudef->use_epyc_apic_id_encoding;
+    } else {
+        return false;
+    }
+}
+
 static CPUCaches epyc_cache_info =3D {
     .l1d_cache =3D &(CPUCacheInfo) {
         .type =3D DATA_CACHE,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 9af1b0c12e..8227479c94 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1897,6 +1897,7 @@ void cpu_clear_apic_feature(CPUX86State *env);
 void host_cpuid(uint32_t function, uint32_t count,
                 uint32_t *eax, uint32_t *ebx, uint32_t *ecx, uint32_t *edx=
);
 void host_vendor_fms(char *vendor, int *family, int *model, int *stepping)=
;
+bool cpu_x86_use_epyc_apic_id_encoding(const char *cpu_type);
=20
 /* helper.c */
 bool x86_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
--=20
2.24.1


