Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9013706AE
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 11:40:33 +0200 (CEST)
Received: from localhost ([::1]:45940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcm6y-00027j-CJ
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 05:40:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lclxQ-0000X2-MU
 for qemu-devel@nongnu.org; Sat, 01 May 2021 05:30:40 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:36601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lclxK-0005VY-KS
 for qemu-devel@nongnu.org; Sat, 01 May 2021 05:30:37 -0400
Received: by mail-ed1-x529.google.com with SMTP id q6so833818edr.3
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 02:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gw/X36mT/PbPwvB2GZlGwd/IMLpdoxQ8KPKGoXwR0VU=;
 b=hnD30JvWN2dyt3GkUHpeLvB12CTTcMGHm/H2RJ5k6tCAMrRiRlMVziq1Mm1X49Ytig
 8g6xEkrhxe0JEJH7hxvH5866tkiOWZwvb7/2jkACYbKEDYCCl0m+x3juo/IEoXRZowxr
 ryYe1N3Zj0u8bdWQoQd85eQwAarmPPR/2jjfO6bRP2C1Aftk0XpBI+mawY+GBw7sAMnP
 38mWJfTueL6wKtniBPKBjY6rFAbyvbBF01vOGbCZVugW0V+NjocXDNUHTJWatUEQN57j
 yvaRdbeSDTLOYYkMN1JJk224kgaPWFKwPlOtU3YZUgOfKOlkhOMZ38mGwIU7sbqfnLmV
 zh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Gw/X36mT/PbPwvB2GZlGwd/IMLpdoxQ8KPKGoXwR0VU=;
 b=SJBz3rzpuH7MHlLz9BUHlzEauDKc6dV5YI/bcbHJ0VD0yj5lj1ACmSheAIeQU8f9tZ
 MXvSVFNu1bIpnTIzwqsQaJOjnGYcNa73S9WGnSPELJQFY92POoYW4VC/attyR0cT3/Rh
 ZG5eu4ADAIMEsuGew9ZeQ+XK85zWjy+P6FixjZlcnpdOoCfl33r7QfFXNfFGBSh+HaFV
 UQ0ZyAuo5J8f2yEiJNy1i5V2RcgVEpZpEO9xcHY7rWwHlzE6gauwvScrT0qUg93aCw+X
 ZmSw4B/2ScPmz4v7mTlUAITKSlKo46KxXNdYvHqzw++BxN9iiTWQSVGj5bQRujmVXLfy
 ph0g==
X-Gm-Message-State: AOAM532PXQFDqcrajYjfVrpbzqqhzaD53BGvyZCLzfCi0ROHHcnchWx5
 d3GaUw9bK0/iEqofdcuw39DUThIPoKs=
X-Google-Smtp-Source: ABdhPJy+1l05SDmXviDTuGf9qzGh91Se/nwMfqWC0c4OV0VYh3I206sxLBEElczvkV3T79+A16JUIg==
X-Received: by 2002:aa7:d90b:: with SMTP id a11mr4156003edr.273.1619861432417; 
 Sat, 01 May 2021 02:30:32 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id ga33sm4632721ejc.11.2021.05.01.02.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 02:30:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/10] Add NVMM accelerator: acceleration enlightenments
Date: Sat,  1 May 2021 11:30:20 +0200
Message-Id: <20210501093026.189429-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210501093026.189429-1-pbonzini@redhat.com>
References: <20210501093026.189429-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
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
Cc: Kamil Rytarowski <kamil@NetBSD.org>, Reinoud Zandijk <reinoud@NetBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Reinoud Zandijk <reinoud@NetBSD.org>

Signed-off-by: Kamil Rytarowski <kamil@NetBSD.org>
Signed-off-by: Reinoud Zandijk <reinoud@NetBSD.org>

Message-Id: <20210402202535.11550-4-reinoud@NetBSD.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/sysemu/hw_accel.h |  1 +
 include/sysemu/nvmm.h     | 26 ++++++++++++++++++++++++++
 target/i386/helper.c      |  2 +-
 3 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 include/sysemu/nvmm.h

diff --git a/include/sysemu/hw_accel.h b/include/sysemu/hw_accel.h
index 61672f9b32..01b5ebf442 100644
--- a/include/sysemu/hw_accel.h
+++ b/include/sysemu/hw_accel.h
@@ -16,6 +16,7 @@
 #include "sysemu/kvm.h"
 #include "sysemu/hvf.h"
 #include "sysemu/whpx.h"
+#include "sysemu/nvmm.h"
 
 void cpu_synchronize_state(CPUState *cpu);
 void cpu_synchronize_post_reset(CPUState *cpu);
diff --git a/include/sysemu/nvmm.h b/include/sysemu/nvmm.h
new file mode 100644
index 0000000000..6d216599b0
--- /dev/null
+++ b/include/sysemu/nvmm.h
@@ -0,0 +1,26 @@
+/*
+ * Copyright (c) 2018-2019 Maxime Villard, All rights reserved.
+ *
+ * NetBSD Virtual Machine Monitor (NVMM) accelerator support.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef QEMU_NVMM_H
+#define QEMU_NVMM_H
+
+#include "config-host.h"
+#include "qemu-common.h"
+
+#ifdef CONFIG_NVMM
+
+int nvmm_enabled(void);
+
+#else /* CONFIG_NVMM */
+
+#define nvmm_enabled() (0)
+
+#endif /* CONFIG_NVMM */
+
+#endif /* CONFIG_NVMM */
diff --git a/target/i386/helper.c b/target/i386/helper.c
index 618ad1c409..8c180b5b2b 100644
--- a/target/i386/helper.c
+++ b/target/i386/helper.c
@@ -495,7 +495,7 @@ void cpu_report_tpr_access(CPUX86State *env, TPRAccess access)
     X86CPU *cpu = env_archcpu(env);
     CPUState *cs = env_cpu(env);
 
-    if (kvm_enabled() || whpx_enabled()) {
+    if (kvm_enabled() || whpx_enabled() || nvmm_enabled()) {
         env->tpr_access_type = access;
 
         cpu_interrupt(cs, CPU_INTERRUPT_TPR);
-- 
2.31.1



