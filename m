Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F9D30888E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:50:30 +0100 (CET)
Received: from localhost ([::1]:43734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5SIH-00014c-NL
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:50:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnK-0004NN-HV
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:30 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:44906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnJ-0005xv-0X
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:30 -0500
Received: by mail-ed1-x535.google.com with SMTP id c2so10093661edr.11
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=81Sp0+tQ+ruTtE13mZTcjfQrSJQnTdfakY5Xykhsupo=;
 b=vbHzndOyJcnj7SrC9Ivt0guUZVSWnwWgiNqMLRB0l9bEFd2zCyNnMnx72DLCGaGfsq
 pRhUYhs+B6d1aJhMQ34veQ3CuYkqJW1Hv8NXR5JtKeebV63IoTyofSbzktq4xx+CJlJy
 AccWg1BjhyNVgzu4h+vPpyra3lYxnkwvJrvsZeLMvrN1QHCzE0xb9CvGx8BH8PnSPII7
 InFbbBsTiqqBAjcLj6jIX9GU/hJuKzWw6DHLq4yyXbDF0O88Zoy/2XPhqOF6v/1MxdJN
 Aqmxz38gTDGEvb9eu2TKdhCKQpAoc0ue/5awW8nHr94ecB5jzBvuAR2jQEO6FtGEZu6L
 x7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=81Sp0+tQ+ruTtE13mZTcjfQrSJQnTdfakY5Xykhsupo=;
 b=U/vabtDW9OXPA9GSrMTgR3TzR6Eda8OojudKHWGQuwaMprndgO8s2jn+hM4A4oho6v
 y4LyuTzZB2TvBFbmDOqqlMxXHT5uQCjRlDJFzPhxXXhNF71tx1Ygad33NnBwR7VOZWsU
 U6nRMXTDsLXy34rIl4Nj0UEJ/CGlNs9j2Luesj3oC4437SAnIAxORxVT0bCpav9ROOkh
 4bqaY0XVd87p7WcB6lUfkGFjruZniSPs+NLDvW8B+j6ZHlGO6N4sQd3KMbS/YqgNrFf/
 T8zTvwbWMx78ChQph++d+YfNScJ9PogtBOOxhCtpWSVbaaWqKquirlQNynTRYeh+0K9D
 fewA==
X-Gm-Message-State: AOAM533YVcoH7TVQDB0UW0aXW9jnhERu+wy9u2qmSW3/lCwWXwwaF+1t
 4Oi6rv4b0dNpZg095exzGd+xyigFOax+Ig==
X-Google-Smtp-Source: ABdhPJwGdvn34qEs23mveFCEDliRNRUayqDh7xAmdxG6BKsh7jf0OWhnw8qKfO+k/cV5S9DVeQMIJw==
X-Received: by 2002:a05:6402:50ca:: with SMTP id
 h10mr4430087edb.181.1611919106784; 
 Fri, 29 Jan 2021 03:18:26 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:26 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/36] x86/cpu: Populate SVM CPUID feature bits
Date: Fri, 29 Jan 2021 12:17:50 +0100
Message-Id: <20210129111814.566629-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Wei Huang <wei.huang2@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wei Huang <wei.huang2@amd.com>

Newer AMD CPUs will add CPUID_0x8000000A_EDX[28] bit, which indicates
that SVM instructions (VMRUN/VMSAVE/VMLOAD) will trigger #VMEXIT before
CPU checking their EAX against reserved memory regions. This change will
allow the hypervisor to avoid intercepting #GP and emulating SVM
instructions. KVM turns on this CPUID bit for nested VMs. In order to
support it, let us populate this bit, along with other SVM feature bits,
in FEAT_SVM.

Signed-off-by: Wei Huang <wei.huang2@amd.com>
Message-Id: <20210126202456.589932-1-wei.huang2@amd.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c |  6 +++---
 target/i386/cpu.h | 24 ++++++++++++++----------
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 2b2c1c5389..a8db1b415d 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -926,11 +926,11 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             "npt", "lbrv", "svm-lock", "nrip-save",
             "tsc-scale", "vmcb-clean",  "flushbyasid", "decodeassists",
             NULL, NULL, "pause-filter", NULL,
-            "pfthreshold", NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
+            "pfthreshold", "avic", NULL, "v-vmsave-vmload",
+            "vgif", NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
+            "svme-addr-chk", NULL, NULL, NULL,
         },
         .cpuid = { .eax = 0x8000000A, .reg = R_EDX, },
         .tcg_features = TCG_SVM_FEATURES,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d23a5b340a..b39ec505de 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -670,16 +670,20 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_EXT3_PERFCORE (1U << 23)
 #define CPUID_EXT3_PERFNB  (1U << 24)
 
-#define CPUID_SVM_NPT          (1U << 0)
-#define CPUID_SVM_LBRV         (1U << 1)
-#define CPUID_SVM_SVMLOCK      (1U << 2)
-#define CPUID_SVM_NRIPSAVE     (1U << 3)
-#define CPUID_SVM_TSCSCALE     (1U << 4)
-#define CPUID_SVM_VMCBCLEAN    (1U << 5)
-#define CPUID_SVM_FLUSHASID    (1U << 6)
-#define CPUID_SVM_DECODEASSIST (1U << 7)
-#define CPUID_SVM_PAUSEFILTER  (1U << 10)
-#define CPUID_SVM_PFTHRESHOLD  (1U << 12)
+#define CPUID_SVM_NPT             (1U << 0)
+#define CPUID_SVM_LBRV            (1U << 1)
+#define CPUID_SVM_SVMLOCK         (1U << 2)
+#define CPUID_SVM_NRIPSAVE        (1U << 3)
+#define CPUID_SVM_TSCSCALE        (1U << 4)
+#define CPUID_SVM_VMCBCLEAN       (1U << 5)
+#define CPUID_SVM_FLUSHASID       (1U << 6)
+#define CPUID_SVM_DECODEASSIST    (1U << 7)
+#define CPUID_SVM_PAUSEFILTER     (1U << 10)
+#define CPUID_SVM_PFTHRESHOLD     (1U << 12)
+#define CPUID_SVM_AVIC            (1U << 13)
+#define CPUID_SVM_V_VMSAVE_VMLOAD (1U << 15)
+#define CPUID_SVM_VGIF            (1U << 16)
+#define CPUID_SVM_SVME_ADDR_CHK   (1U << 28)
 
 /* Support RDFSBASE/RDGSBASE/WRFSBASE/WRGSBASE */
 #define CPUID_7_0_EBX_FSGSBASE          (1U << 0)
-- 
2.29.2



