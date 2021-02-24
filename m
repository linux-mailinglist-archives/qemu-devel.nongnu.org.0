Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3583324728
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 23:53:03 +0100 (CET)
Received: from localhost ([::1]:38214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF31h-0001QY-6v
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 17:53:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lF2vz-0004ii-1Q
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 17:47:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lF2vw-00063a-EE
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 17:47:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614206823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TGc1XDROpJa7heiKjiNOwGMcXXvKXrCBpdUx/v/xVvI=;
 b=bWqFQe90nD45l9G4mHLkLsq200UrzwEUK0ETP8vDDBEp0dS+V3qpMvAKjUvbwEdhclDrmB
 cFVX8Il6sduM7z9kWffMNnPXHhn51/GOl7kfCNbUY1rFcvhXdQ8Ur5ZsHixj1L9/3ygbbg
 4gPND72xZ9GoFkbYgjedV9FhF808tug=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-GoHTObg-OsyC_XX9kGD35w-1; Wed, 24 Feb 2021 17:47:01 -0500
X-MC-Unique: GoHTObg-OsyC_XX9kGD35w-1
Received: by mail-wr1-f69.google.com with SMTP id p18so1701438wrt.5
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 14:47:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TGc1XDROpJa7heiKjiNOwGMcXXvKXrCBpdUx/v/xVvI=;
 b=r/I0taFCa+LnVA8G8+PV8y+uMADblm+eLdCs64ZgxDUHzI60ZeWvi76Jv+hfNV/oO5
 WGe92G4yUMgf+v7vrAAKeDHSsd8WcjtlNgKtcRIr2MWFSJgQcgIEhTWNQVBPL69yJ1JA
 TRdOguY6Aao34PAMWaOwZJZQ/4nkG3fXmgo0awNlwywUxcImwkJu9slLI9KxUR8xg6vs
 ZPtR+ndndK8Zw5cVMrF8ok6pt9cLl5gcY7M/GuxhSa+zbPw27p48GJQUjOhrj/15nzUV
 q4GOBVMZAZDYDY/HOLxNM7CpR5fYQBBJ4UOKe0hrH0e+ztmMU2cdiSuiJdmBXiXssTnY
 0Lxg==
X-Gm-Message-State: AOAM5301yfMGez8yGJRXDSnB7BPZ6YjHaQCS9TDcf15L3tYI+D+p32kb
 YdkBex4a5Ndx66nb6ec22qupinbVb/IIvb3grgaSZdZfLUsRTIQT8DhKmXnKQYbmzc+ztaem/3y
 5N0UsvkBEDfBrFZ74lleP7xBOH1N6Hz7VWn/Ujap+m8dN8PhLNk89MZNn3RCpzAZz
X-Received: by 2002:a1c:b6d7:: with SMTP id g206mr252307wmf.123.1614206820172; 
 Wed, 24 Feb 2021 14:47:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwC3nRTJpkI8hwMSqLH5Jsmo0ek5gPNs5pMiwn1v7m2ICWfSmZdd04F/nOhzG34hmes6j6rvg==
X-Received: by 2002:a1c:b6d7:: with SMTP id g206mr252284wmf.123.1614206820015; 
 Wed, 24 Feb 2021 14:47:00 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id k128sm4650445wmf.42.2021.02.24.14.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 14:46:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 3/4] qapi: Move X86 specific types to machine-target.json
Date: Wed, 24 Feb 2021 23:46:42 +0100
Message-Id: <20210224224643.3369940-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210224224643.3369940-1-philmd@redhat.com>
References: <20210224224643.3369940-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Markus Armbruster <armbru@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

X86CPURegister32 enum and X86CPUFeatureWordInfo structure
are specific to the x86 architecture, move these entries
to machine-target.json.

Restricting the x86-specific commands to machine-target.json
pulls less QAPI-generated code into non-x86 targets.

Acked-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/machine-target.json  | 42 +++++++++++++++++++++++++++++++++++++++
 qapi/machine.json         | 42 ---------------------------------------
 target/i386/cpu-softmmu.c |  2 +-
 3 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/qapi/machine-target.json b/qapi/machine-target.json
index e7811654b72..106fbd2e9ed 100644
--- a/qapi/machine-target.json
+++ b/qapi/machine-target.json
@@ -329,3 +329,45 @@
 ##
 { 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'],
   'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_I386) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
+
+##
+# @X86CPURegister32:
+#
+# A X86 32-bit register
+#
+# Since: 1.5
+##
+{ 'enum': 'X86CPURegister32',
+  'data': [ 'EAX', 'EBX', 'ECX', 'EDX', 'ESP', 'EBP', 'ESI', 'EDI' ] }
+
+##
+# @X86CPUFeatureWordInfo:
+#
+# Information about a X86 CPU feature word
+#
+# @cpuid-input-eax: Input EAX value for CPUID instruction for that feature word
+#
+# @cpuid-input-ecx: Input ECX value for CPUID instruction for that
+#                   feature word
+#
+# @cpuid-register: Output register containing the feature bits
+#
+# @features: value of output register, containing the feature bits
+#
+# Since: 1.5
+##
+{ 'struct': 'X86CPUFeatureWordInfo',
+  'data': { 'cpuid-input-eax': 'int',
+            '*cpuid-input-ecx': 'int',
+            'cpuid-register': 'X86CPURegister32',
+            'features': 'int' } }
+
+##
+# @DummyForceArrays:
+#
+# Not used by QMP; hack to let us use X86CPUFeatureWordInfoList internally
+#
+# Since: 2.5
+##
+{ 'struct': 'DummyForceArrays',
+  'data': { 'unused': ['X86CPUFeatureWordInfo'] } }
diff --git a/qapi/machine.json b/qapi/machine.json
index 330189efe3d..8053803a0e0 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -681,48 +681,6 @@
    'dst': 'uint16',
    'val': 'uint8' }}
 
-##
-# @X86CPURegister32:
-#
-# A X86 32-bit register
-#
-# Since: 1.5
-##
-{ 'enum': 'X86CPURegister32',
-  'data': [ 'EAX', 'EBX', 'ECX', 'EDX', 'ESP', 'EBP', 'ESI', 'EDI' ] }
-
-##
-# @X86CPUFeatureWordInfo:
-#
-# Information about a X86 CPU feature word
-#
-# @cpuid-input-eax: Input EAX value for CPUID instruction for that feature word
-#
-# @cpuid-input-ecx: Input ECX value for CPUID instruction for that
-#                   feature word
-#
-# @cpuid-register: Output register containing the feature bits
-#
-# @features: value of output register, containing the feature bits
-#
-# Since: 1.5
-##
-{ 'struct': 'X86CPUFeatureWordInfo',
-  'data': { 'cpuid-input-eax': 'int',
-            '*cpuid-input-ecx': 'int',
-            'cpuid-register': 'X86CPURegister32',
-            'features': 'int' } }
-
-##
-# @DummyForceArrays:
-#
-# Not used by QMP; hack to let us use X86CPUFeatureWordInfoList internally
-#
-# Since: 2.5
-##
-{ 'struct': 'DummyForceArrays',
-  'data': { 'unused': ['X86CPUFeatureWordInfo'] } }
-
 ##
 # @NumaCpuOptions:
 #
diff --git a/target/i386/cpu-softmmu.c b/target/i386/cpu-softmmu.c
index 34fd7b0de02..a7afa7963db 100644
--- a/target/i386/cpu-softmmu.c
+++ b/target/i386/cpu-softmmu.c
@@ -23,7 +23,7 @@
 #include "sysemu/whpx.h"
 #include "kvm/kvm_i386.h"
 #include "qapi/error.h"
-#include "qapi/qapi-visit-machine.h"
+#include "qapi/qapi-visit-machine-target.h"
 #include "qapi/qapi-visit-run-state.h"
 #include "qapi/qmp/qdict.h"
 #include "qom/qom-qobject.h"
-- 
2.26.2


