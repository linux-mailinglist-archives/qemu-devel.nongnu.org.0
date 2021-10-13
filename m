Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D67942BB6A
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:22:13 +0200 (CEST)
Received: from localhost ([::1]:51710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maaSi-00063t-3Q
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEo-0002Mj-Td
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:54 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:40716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEk-0005nr-68
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:50 -0400
Received: by mail-ed1-x52e.google.com with SMTP id g8so7267628edt.7
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LmyRMNL1zBGRAH5+b9u5/SShogXqCvazqeHNtByQRzQ=;
 b=cOHjMHEOhEgkrkFlTRf8EDOOW+LjJh46+FAr0bsyTAiJZTCYP+yGpVB5JC9XPejo7U
 c2Qm33XtuXk7q1qh3VpGy6gUabvtCx5s+Ni+gIj7sjrqE3Jqg7adEnTxQdLUMbiBvJFv
 9M51JiCUemHtCkP/OSV1SlQwat3phJDWxppovqNoI/nPWIEN87TufBHgpDTVE7jfJ6iN
 QGScZ0pfEFu91R/v9PsqOLCPmFLu632x1yDJLEFAQjvnWZbrx8B/RD6xVrL1T7MDvAhb
 Tf+RQoDwXRX9O01SovtM4sNUGWCzA7LaVZB+f3Oa9bZxNTADwV1uY5oyKSU6K0O2GCfD
 P3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LmyRMNL1zBGRAH5+b9u5/SShogXqCvazqeHNtByQRzQ=;
 b=icKJNsHHtRSW2YzLXAYSUt3SlDBSDcsDnnrZD/MMOzYQPRjL7S/Uw2AM2sjKWMQDx6
 XBbd/WDTxioNycT0Pav/9aS/u0uolDrEoqcXLJW1WB+Lr9ffVPX7k2iBKq+oRHGanozZ
 EFgQplYC7O4A2uVylPC6L2Z2nXIeJ5MhatSdvJJW9Q5zfeBmhFSgJQM8bTW6VKJ6Vnam
 gwfljknvLQq9b7PpKWJ+mvCzePIdmtMoOkKdTiyCn+G/UwBqfHjFHt4NSdfxupCNaXC9
 pao6vhbaw+SDnGcNpClbGHmuC7UrNbK8AYn53oyj2otZpm5FrzKG5DsPgtuZgLsPqVKc
 a/wg==
X-Gm-Message-State: AOAM532W9j1lkeREdNny8OQfBRA05+DCuoXxMFnAKKYnpYrVmTbdn9vZ
 ZQS7u2vDIl02c+6aurKuJUQOJ6BYwo8=
X-Google-Smtp-Source: ABdhPJyoIgAgyzs0ElAry/D617toWBDVYQeb1Nw1G8E0EZGdemOlitoSawV2OHE4HXqtUQBHxqxdEg==
X-Received: by 2002:a17:906:7632:: with SMTP id
 c18mr41599011ejn.317.1634116064531; 
 Wed, 13 Oct 2021 02:07:44 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/40] target/i386/sev: Remove stubs by using code elision
Date: Wed, 13 Oct 2021 11:07:09 +0200
Message-Id: <20211013090728.309365-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Only declare sev_enabled() and sev_es_enabled() when CONFIG_SEV is
set, to allow the compiler to elide unused code. Remove unnecessary
stubs.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20211007161716.453984-17-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c       | 13 +++++++------
 target/i386/meson.build |  2 +-
 target/i386/sev-stub.c  | 41 -----------------------------------------
 target/i386/sev.h       | 12 +++++++++++-
 4 files changed, 19 insertions(+), 49 deletions(-)
 delete mode 100644 target/i386/sev-stub.c

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 8289dc87bd..fc3ed80ef1 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5764,12 +5764,13 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         *edx = 0;
         break;
     case 0x8000001F:
-        *eax = sev_enabled() ? 0x2 : 0;
-        *eax |= sev_es_enabled() ? 0x8 : 0;
-        *ebx = sev_get_cbit_position();
-        *ebx |= sev_get_reduced_phys_bits() << 6;
-        *ecx = 0;
-        *edx = 0;
+        *eax = *ebx = *ecx = *edx = 0;
+        if (sev_enabled()) {
+            *eax = 0x2;
+            *eax |= sev_es_enabled() ? 0x8 : 0;
+            *ebx = sev_get_cbit_position();
+            *ebx |= sev_get_reduced_phys_bits() << 6;
+        }
         break;
     default:
         /* reserved values: zero */
diff --git a/target/i386/meson.build b/target/i386/meson.build
index a4f45c3ec1..ae38dc9563 100644
--- a/target/i386/meson.build
+++ b/target/i386/meson.build
@@ -6,7 +6,7 @@ i386_ss.add(files(
   'xsave_helper.c',
   'cpu-dump.c',
 ))
-i386_ss.add(when: 'CONFIG_SEV', if_true: files('host-cpu.c'), if_false: files('sev-stub.c'))
+i386_ss.add(when: 'CONFIG_SEV', if_true: files('host-cpu.c'))
 
 # x86 cpu type
 i386_ss.add(when: 'CONFIG_KVM', if_true: files('host-cpu.c'))
diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
deleted file mode 100644
index 7e8b6f9a25..0000000000
--- a/target/i386/sev-stub.c
+++ /dev/null
@@ -1,41 +0,0 @@
-/*
- * QEMU SEV stub
- *
- * Copyright Advanced Micro Devices 2018
- *
- * Authors:
- *      Brijesh Singh <brijesh.singh@amd.com>
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- *
- */
-
-#include "qemu/osdep.h"
-#include "qapi/error.h"
-#include "sev.h"
-
-bool sev_enabled(void)
-{
-    return false;
-}
-
-uint32_t sev_get_cbit_position(void)
-{
-    return 0;
-}
-
-uint32_t sev_get_reduced_phys_bits(void)
-{
-    return 0;
-}
-
-bool sev_es_enabled(void)
-{
-    return false;
-}
-
-bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
-{
-    g_assert_not_reached();
-}
diff --git a/target/i386/sev.h b/target/i386/sev.h
index c96072bf78..b6289234b0 100644
--- a/target/i386/sev.h
+++ b/target/i386/sev.h
@@ -14,6 +14,10 @@
 #ifndef QEMU_SEV_I386_H
 #define QEMU_SEV_I386_H
 
+#ifndef CONFIG_USER_ONLY
+#include CONFIG_DEVICES /* CONFIG_SEV */
+#endif
+
 #include "exec/confidential-guest-support.h"
 #include "qapi/qapi-types-misc-target.h"
 
@@ -35,8 +39,14 @@ typedef struct SevKernelLoaderContext {
     size_t cmdline_size;
 } SevKernelLoaderContext;
 
+#ifdef CONFIG_SEV
 bool sev_enabled(void);
-extern bool sev_es_enabled(void);
+bool sev_es_enabled(void);
+#else
+#define sev_enabled() 0
+#define sev_es_enabled() 0
+#endif
+
 extern SevInfo *sev_get_info(void);
 extern uint32_t sev_get_cbit_position(void);
 extern uint32_t sev_get_reduced_phys_bits(void);
-- 
2.31.1



