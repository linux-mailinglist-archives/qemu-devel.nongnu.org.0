Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC05121A25
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 20:41:17 +0100 (CET)
Received: from localhost ([::1]:59196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igwF2-0006Ij-9F
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 14:41:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43714)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1igwCe-0003Nb-PI
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 14:38:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1igwCd-0001vA-Ge
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 14:38:48 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:57768
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1igwCd-0001ub-Cs
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 14:38:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576525126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2KRVlkTwCbvvliHtCmwT53Exi2SBrUN96CRyUUn3RCs=;
 b=FMWOWhts3tsVJww+G3h/p8S/OKcklk1fhDBMjv1cKLoOZjua8/Qxlht0WbtsCBGb8Gfrvr
 NjiXfuNEWVORz4Jp8j1qXblIHYyopuK7nRlLhCvYsgV5dYd2fcISfSkz0fDxQrYWnaOEqC
 v9Hjnyz9Gi0j1Zh/0BUpUjKyf3TGIig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-0_lBxl_mO8qdHLITsvVw3A-1; Mon, 16 Dec 2019 14:38:45 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34C1D1809A2A;
 Mon, 16 Dec 2019 19:38:44 +0000 (UTC)
Received: from localhost (ovpn-116-90.gru2.redhat.com [10.97.116.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4D7660BE0;
 Mon, 16 Dec 2019 19:38:43 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 3/4] i386: Add new CPU model Cooperlake
Date: Mon, 16 Dec 2019 16:38:24 -0300
Message-Id: <20191216193825.1794153-4-ehabkost@redhat.com>
In-Reply-To: <20191216193825.1794153-1-ehabkost@redhat.com>
References: <20191216193825.1794153-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 0_lBxl_mO8qdHLITsvVw3A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Tao Xu <tao3.xu@intel.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>, Bruce Rogers <brogers@suse.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Cathy Zhang <cathy.zhang@intel.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cathy Zhang <cathy.zhang@intel.com>

Cooper Lake is intel's successor to Cascade Lake, the new
CPU model inherits features from Cascadelake-Server, while
add one platform associated new feature: AVX512_BF16. Meanwhile,
add STIBP for speculative execution.

Signed-off-by: Cathy Zhang <cathy.zhang@intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Tao Xu <tao3.xu@intel.com>
Message-Id: <1571729728-23284-4-git-send-email-cathy.zhang@intel.com>
Reviewed-by: Bruce Rogers <brogers@suse.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 69f518a21a..de828e29d8 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -3159,6 +3159,66 @@ static X86CPUDefinition builtin_x86_defs[] =3D {
             { /* end of list */ }
         }
     },
+    {
+        .name =3D "Cooperlake",
+        .level =3D 0xd,
+        .vendor =3D CPUID_VENDOR_INTEL,
+        .family =3D 6,
+        .model =3D 85,
+        .stepping =3D 10,
+        .features[FEAT_1_EDX] =3D
+            CPUID_VME | CPUID_SSE2 | CPUID_SSE | CPUID_FXSR | CPUID_MMX |
+            CPUID_CLFLUSH | CPUID_PSE36 | CPUID_PAT | CPUID_CMOV | CPUID_M=
CA |
+            CPUID_PGE | CPUID_MTRR | CPUID_SEP | CPUID_APIC | CPUID_CX8 |
+            CPUID_MCE | CPUID_PAE | CPUID_MSR | CPUID_TSC | CPUID_PSE |
+            CPUID_DE | CPUID_FP87,
+        .features[FEAT_1_ECX] =3D
+            CPUID_EXT_AVX | CPUID_EXT_XSAVE | CPUID_EXT_AES |
+            CPUID_EXT_POPCNT | CPUID_EXT_X2APIC | CPUID_EXT_SSE42 |
+            CPUID_EXT_SSE41 | CPUID_EXT_CX16 | CPUID_EXT_SSSE3 |
+            CPUID_EXT_PCLMULQDQ | CPUID_EXT_SSE3 |
+            CPUID_EXT_TSC_DEADLINE_TIMER | CPUID_EXT_FMA | CPUID_EXT_MOVBE=
 |
+            CPUID_EXT_PCID | CPUID_EXT_F16C | CPUID_EXT_RDRAND,
+        .features[FEAT_8000_0001_EDX] =3D
+            CPUID_EXT2_LM | CPUID_EXT2_PDPE1GB | CPUID_EXT2_RDTSCP |
+            CPUID_EXT2_NX | CPUID_EXT2_SYSCALL,
+        .features[FEAT_8000_0001_ECX] =3D
+            CPUID_EXT3_ABM | CPUID_EXT3_LAHF_LM | CPUID_EXT3_3DNOWPREFETCH=
,
+        .features[FEAT_7_0_EBX] =3D
+            CPUID_7_0_EBX_FSGSBASE | CPUID_7_0_EBX_BMI1 |
+            CPUID_7_0_EBX_HLE | CPUID_7_0_EBX_AVX2 | CPUID_7_0_EBX_SMEP |
+            CPUID_7_0_EBX_BMI2 | CPUID_7_0_EBX_ERMS | CPUID_7_0_EBX_INVPCI=
D |
+            CPUID_7_0_EBX_RTM | CPUID_7_0_EBX_RDSEED | CPUID_7_0_EBX_ADX |
+            CPUID_7_0_EBX_SMAP | CPUID_7_0_EBX_CLWB |
+            CPUID_7_0_EBX_AVX512F | CPUID_7_0_EBX_AVX512DQ |
+            CPUID_7_0_EBX_AVX512BW | CPUID_7_0_EBX_AVX512CD |
+            CPUID_7_0_EBX_AVX512VL | CPUID_7_0_EBX_CLFLUSHOPT,
+        .features[FEAT_7_0_ECX] =3D
+            CPUID_7_0_ECX_PKU |
+            CPUID_7_0_ECX_AVX512VNNI,
+        .features[FEAT_7_0_EDX] =3D
+            CPUID_7_0_EDX_SPEC_CTRL | CPUID_7_0_EDX_STIBP |
+            CPUID_7_0_EDX_SPEC_CTRL_SSBD | CPUID_7_0_EDX_ARCH_CAPABILITIES=
,
+        .features[FEAT_ARCH_CAPABILITIES] =3D
+            MSR_ARCH_CAP_RDCL_NO | MSR_ARCH_CAP_IBRS_ALL |
+            MSR_ARCH_CAP_SKIP_L1DFL_VMENTRY | MSR_ARCH_CAP_MDS_NO,
+        .features[FEAT_7_1_EAX] =3D
+            CPUID_7_1_EAX_AVX512_BF16,
+        /*
+         * Missing: XSAVES (not supported by some Linux versions,
+         * including v4.1 to v4.12).
+         * KVM doesn't yet expose any XSAVES state save component,
+         * and the only one defined in Skylake (processor tracing)
+         * probably will block migration anyway.
+         */
+        .features[FEAT_XSAVE] =3D
+            CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XSAVEC |
+            CPUID_XSAVE_XGETBV1,
+        .features[FEAT_6_EAX] =3D
+            CPUID_6_EAX_ARAT,
+        .xlevel =3D 0x80000008,
+        .model_id =3D "Intel Xeon Processor (Cooperlake)",
+    },
     {
         .name =3D "Icelake-Client",
         .level =3D 0xd,
--=20
2.23.0


