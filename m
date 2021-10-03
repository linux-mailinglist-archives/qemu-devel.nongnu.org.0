Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AE54200A9
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 10:07:22 +0200 (CEST)
Received: from localhost ([::1]:49624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWwWn-0007NL-UD
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 04:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9P-0003ti-Cv
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:11 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:44559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9N-0000xi-NO
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:11 -0400
Received: by mail-ed1-x52a.google.com with SMTP id v18so50892439edc.11
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 00:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FwA+wilZzoFxPcnuwn2ma5jaPENmzxYB5mdqfNqBOVY=;
 b=CodWZa8wnW/kL99qrSc1zf2Z7/VGVKYbDFnFTXd2ii4UcItVNjQqSsPuG69z8TCWcm
 rfJvTqeb0vU0A9BSx6W7T4As6FW7LKcTK7Z3I+G2Cj5LKMcN/5tCr7u9Ugmn08SUHGgc
 /nMReaE07y7ZupmDklcToujMqsqMM5Eov6fVgt52muJYFMmZ2phtGkuMhLpVtUjKWErH
 F5TuMVKvMHm9r/E5vD/tBQjGFGqdwHoaglHO0buFUOmezDhhXMR6ZKcUYuudtYZCplQ9
 i2D0cnna6tEtb6CJxJrzRzZqpra+BCA/Uu8CjsA/kJbdSqR1hXD94ubzNxWjdRWGeBJf
 Uxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FwA+wilZzoFxPcnuwn2ma5jaPENmzxYB5mdqfNqBOVY=;
 b=nhP1UOYetxHWqSwyPUbWm7G+R8NYFO8if63Cu21QTvKqmcjDfNiBU8j2e02uZmBlrV
 EHsqvAlkDVXFN5OaqIHE37FgQmNLw/qdzQPHa7AzUoduByctd0aoIT/QsrsGOcrAct3k
 CEOHHThmwnLrWyrwIy8vqdNSgWhFuWTp7jiFF0tfyobStUcRdLoskVnLLNuUAs8iNfOu
 WjQY6ncOuY6olKmzClG65tNmHEgk78y1Q54MxP04BkgCn9Z9WIQGfwxJc6FxrBSUZy/r
 21lVRmCke025+p3RBuODwlKrH7R0CO9WJ/Wb1h7Z34TLlRZNWcKkTXDzcWc0rdgODc2u
 W2sg==
X-Gm-Message-State: AOAM5336mDYyWhn3VkXw/JVlteLRjOSR35lmE0U9eyfipgOQuIwtJd9p
 WPgrgB5oQaD4RiRVEaKaDC39vE1FVU0=
X-Google-Smtp-Source: ABdhPJzSLgcM9MFIA0UE+O9mqsS4y415L6TUNJ7egvW7wu3lTjF1M1WtWleSrZAz3XgIpYmHfbKo2A==
X-Received: by 2002:a17:906:128f:: with SMTP id
 k15mr8980626ejb.334.1633246988521; 
 Sun, 03 Oct 2021 00:43:08 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n6sm5560856eds.10.2021.10.03.00.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 00:43:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/30] i386: Change the default Hyper-V version to match WS2016
Date: Sun,  3 Oct 2021 09:42:42 +0200
Message-Id: <20211003074250.60869-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003074250.60869-1-pbonzini@redhat.com>
References: <20211003074250.60869-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
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
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vitaly Kuznetsov <vkuznets@redhat.com>

KVM implements some Hyper-V 2016 functions so providing WS2008R2 version
is somewhat incorrect. While generally guests shouldn't care about it
and always check feature bits, it is known that some tools in Windows
actually check version info.

For compatibility reasons make the change for 6.2 machine types only.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-Id: <20210902093530.345756-9-vkuznets@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/hyperv.txt   | 2 +-
 hw/i386/pc.c      | 6 +++++-
 target/i386/cpu.c | 6 +++---
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/docs/hyperv.txt b/docs/hyperv.txt
index 7803495468..5d99fd9a72 100644
--- a/docs/hyperv.txt
+++ b/docs/hyperv.txt
@@ -214,7 +214,7 @@ exposing correct vCPU topology and vCPU pinning.
 3.20. hv-version-id-{build,major,minor,spack,sbranch,snumber}
 =============================================================
 This changes Hyper-V version identification in CPUID 0x40000002.EAX-EDX from the
-default (WS2008R2).
+default (WS2016).
 - hv-version-id-build sets 'Build Number' (32 bits)
 - hv-version-id-major sets 'Major Version' (16 bits)
 - hv-version-id-minor sets 'Minor Version' (16 bits)
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 28e1b83b9d..86223acfd3 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -93,7 +93,11 @@
 #include "trace.h"
 #include CONFIG_DEVICES
 
-GlobalProperty pc_compat_6_1[] = {};
+GlobalProperty pc_compat_6_1[] = {
+    { TYPE_X86_CPU, "hv-version-id-build", "0x1bbc" },
+    { TYPE_X86_CPU, "hv-version-id-major", "0x0006" },
+    { TYPE_X86_CPU, "hv-version-id-minor", "0x0001" },
+};
 const size_t pc_compat_6_1_len = G_N_ELEMENTS(pc_compat_6_1);
 
 GlobalProperty pc_compat_6_0[] = {
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index d1d057fabe..a7b1b6aa93 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6838,11 +6838,11 @@ static Property x86_cpu_properties[] = {
 
     /* WS2008R2 identify by default */
     DEFINE_PROP_UINT32("hv-version-id-build", X86CPU, hyperv_ver_id_build,
-                       0x1bbc),
+                       0x3839),
     DEFINE_PROP_UINT16("hv-version-id-major", X86CPU, hyperv_ver_id_major,
-                       0x0006),
+                       0x000A),
     DEFINE_PROP_UINT16("hv-version-id-minor", X86CPU, hyperv_ver_id_minor,
-                       0x0001),
+                       0x0000),
     DEFINE_PROP_UINT32("hv-version-id-spack", X86CPU, hyperv_ver_id_sp, 0),
     DEFINE_PROP_UINT8("hv-version-id-sbranch", X86CPU, hyperv_ver_id_sb, 0),
     DEFINE_PROP_UINT32("hv-version-id-snumber", X86CPU, hyperv_ver_id_sn, 0),
-- 
2.31.1



