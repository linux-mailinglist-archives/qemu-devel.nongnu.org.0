Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B104257F4
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:27:31 +0200 (CEST)
Received: from localhost ([::1]:34314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYWF0-00052w-UD
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW6O-0005Kf-JM
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:18:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW6M-0005PD-O0
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:18:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633623514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=avS7dA1xbWdOVEvDf5GxDqun22mmkWzrjGDOVnO4aN8=;
 b=TLfgnurrfuxpPWFtSWOHh+VTGr6qABHHC8cO/stUON2313pWYI9oBvphXlT9Vp3mokOj1B
 8OnVuJEFbXlZvFAZH5ovOJpI5ZMT51OGGVkLmUjsRsZtSroL8d5E0QnRAm2rJXGbE7qzkZ
 /ibbTTQTK38oewE9ltjGe+to2zhFDzo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-JVFbV8ThOiqiEYDd7EjmYQ-1; Thu, 07 Oct 2021 12:18:33 -0400
X-MC-Unique: JVFbV8ThOiqiEYDd7EjmYQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 r16-20020adfbb10000000b00160958ed8acso5118391wrg.16
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 09:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=avS7dA1xbWdOVEvDf5GxDqun22mmkWzrjGDOVnO4aN8=;
 b=ESC5Pvv47idL9ULov51rRbLAHJD4VsyN139wnhNBMHBXcODCx/Hpii/Dlh+Dpom7Ae
 c+ND9FR7BXz0QYj6w/UvnKz/3Pr+iyKhidVk90h8ITSOvK/jM0heyNWn8fKYK7iMpUJ+
 SZzlA2AT1eFYm597gntbvWLqrmrJE4yB+/wNcyYIp16i3aCX5nHfCAc4zsJ20rCrgxoX
 bPfISnXufXeGQupegaTA7mtE87Fth2o9wRz/cF9zBmqSuVmoe7pu9OqP4sB4DOpjYPnB
 CqtRJndtphPLpJfV/9aMWrSC7FvKiBg1wkKjKwuM0KYr662jyXZyUy2pWU9+Dou43nkf
 +Ojg==
X-Gm-Message-State: AOAM530VrSgGosyMxYC3087PAVBTSz4xVyR3WooPb2TIAeCeW3nknTH6
 pslqAotfWoSTGUU9tzc0ufy/0V+XN51ChKF2ZZqC9l2Pyoo+QwB/Ki7Li29LVFMffHAVEaZErBo
 DzjdjWAaSuC8h1WTCfHvzGynfoUxNAzuARzHZx1IydzcdQYUqH+sJlSVpRlblekH8
X-Received: by 2002:adf:a550:: with SMTP id j16mr6790562wrb.180.1633623511779; 
 Thu, 07 Oct 2021 09:18:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiNFDP2mIfyzBdX6qysBlWdROekH+j9h8XYmdGma4KNZrh1RRhjU928Fdh1xrhu6HNRCOYpw==
X-Received: by 2002:adf:a550:: with SMTP id j16mr6790510wrb.180.1633623511460; 
 Thu, 07 Oct 2021 09:18:31 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id q3sm19131wmc.25.2021.10.07.09.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 09:18:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 16/23] target/i386/sev: Remove stubs by using code elision
Date: Thu,  7 Oct 2021 18:17:09 +0200
Message-Id: <20211007161716.453984-17-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007161716.453984-1-philmd@redhat.com>
References: <20211007161716.453984-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only declare sev_enabled() and sev_es_enabled() when CONFIG_SEV is
set, to allow the compiler to elide unused code. Remove unnecessary
stubs.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/sev.h       | 14 ++++++++++++--
 target/i386/cpu.c       | 13 +++++++------
 target/i386/sev-stub.c  | 41 -----------------------------------------
 target/i386/meson.build |  2 +-
 4 files changed, 20 insertions(+), 50 deletions(-)
 delete mode 100644 target/i386/sev-stub.c

diff --git a/target/i386/sev.h b/target/i386/sev.h
index c96072bf78d..d9548e3e642 100644
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
 
-bool sev_enabled(void);
-extern bool sev_es_enabled(void);
+#ifdef CONFIG_SEV
+ bool sev_enabled(void);
+bool sev_es_enabled(void);
+#else
+#define sev_enabled() 0
+#define sev_es_enabled() 0
+#endif
+
 extern SevInfo *sev_get_info(void);
 extern uint32_t sev_get_cbit_position(void);
 extern uint32_t sev_get_reduced_phys_bits(void);
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 8289dc87bd5..fc3ed80ef1e 100644
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
diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
deleted file mode 100644
index 7e8b6f9a259..00000000000
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
diff --git a/target/i386/meson.build b/target/i386/meson.build
index a4f45c3ec1d..ae38dc95635 100644
--- a/target/i386/meson.build
+++ b/target/i386/meson.build
@@ -6,7 +6,7 @@
   'xsave_helper.c',
   'cpu-dump.c',
 ))
-i386_ss.add(when: 'CONFIG_SEV', if_true: files('host-cpu.c'), if_false: files('sev-stub.c'))
+i386_ss.add(when: 'CONFIG_SEV', if_true: files('host-cpu.c'))
 
 # x86 cpu type
 i386_ss.add(when: 'CONFIG_KVM', if_true: files('host-cpu.c'))
-- 
2.31.1


