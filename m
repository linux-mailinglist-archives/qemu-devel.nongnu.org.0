Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09F737664C
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 15:39:11 +0200 (CEST)
Received: from localhost ([::1]:50838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf0hD-0004E5-0e
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 09:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lf0fH-000314-6D
 for qemu-devel@nongnu.org; Fri, 07 May 2021 09:37:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lf0fD-0007oA-Nw
 for qemu-devel@nongnu.org; Fri, 07 May 2021 09:37:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620394626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t+nz8EIx6Ic9JNK1EG/yRx/rTKBBEddPgLboNm3zYVw=;
 b=MBYR3Uyzm6VeowuWTmxOKxEr8ph8qZRuNFR+dbgBVMTnknhi17la61Nz2y9ECqW+w7ygfP
 l+wFBLx9G4C4t39DgF3A1R2KOm8ZjyNRUUzne2WjBnLVLVG88QDcfp5cEq/4+ughKiecTZ
 XCypCeRyYJsin8vzlbxvQDbbDMQJF9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-DSCdYdi7MrOs3GLbPvvzmQ-1; Fri, 07 May 2021 09:37:05 -0400
X-MC-Unique: DSCdYdi7MrOs3GLbPvvzmQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD34C107ACCA;
 Fri,  7 May 2021 13:37:02 +0000 (UTC)
Received: from foo.redhat.com (ovpn-114-155.ams2.redhat.com [10.36.114.155])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 230625C1C5;
 Fri,  7 May 2021 13:37:00 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] i386: use better matching family/model/stepping for
 'qemu64' CPU
Date: Fri,  7 May 2021 14:36:49 +0100
Message-Id: <20210507133650.645526-2-berrange@redhat.com>
In-Reply-To: <20210507133650.645526-1-berrange@redhat.com>
References: <20210507133650.645526-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'qemu64' CPUID currently reports a family/model/stepping that
approximately corresponds to an AMD K7 vintage architecture.
The K7 series predates the introduction of 64-bit support by AMD
in the K8 series. This has been reported to lead to LLVM complaints
about generating 64-bit code for a 32-bit CPU target

  LLVM ERROR: 64-bit code requested on a subtarget that doesn't support it!

It appears LLVM looks at the family/model/stepping, despite qemu64
reporting it is 64-bit capable.

This patch changes 'qemu64' to report a CPUID with the family, model
and stepping taken from a

 AMD Athlon(tm) 64 X2 Dual Core Processor 4000+

which is one of the first 64-bit AMD CPUs.

Closes https://gitlab.com/qemu-project/qemu/-/issues/191
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/i386/pc.c      | 6 +++++-
 target/i386/cpu.c | 6 +++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 364816efc9..35d7a8122a 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -96,7 +96,11 @@
 #include "trace.h"
 #include CONFIG_DEVICES
 
-GlobalProperty pc_compat_6_0[] = {};
+GlobalProperty pc_compat_6_0[] = {
+    { "qemu64" "-" TYPE_X86_CPU, "family", "6" },
+    { "qemu64" "-" TYPE_X86_CPU, "model", "6" },
+    { "qemu64" "-" TYPE_X86_CPU, "stepping", "3" },
+};
 const size_t pc_compat_6_0_len = G_N_ELEMENTS(pc_compat_6_0);
 
 GlobalProperty pc_compat_5_2[] = {
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ad99cad0e7..99caa3deae 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1881,9 +1881,9 @@ static X86CPUDefinition builtin_x86_defs[] = {
         .name = "qemu64",
         .level = 0xd,
         .vendor = CPUID_VENDOR_AMD,
-        .family = 6,
-        .model = 6,
-        .stepping = 3,
+        .family = 15,
+        .model = 107,
+        .stepping = 1,
         .features[FEAT_1_EDX] =
             PPRO_FEATURES |
             CPUID_MTRR | CPUID_CLFLUSH | CPUID_MCA |
-- 
2.31.1


