Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A45DD6FC256
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 11:07:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwJHg-0005Hn-FN; Tue, 09 May 2023 05:05:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHc-0005GS-Ds
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJHX-0004vX-8P
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:05:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683623114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gFN0jm8tj0b98Q7AjbSUpEoKREbax20RBwvfW1MvJdk=;
 b=ZmAuYHAoydyA5GlbiP2f74gV6ayxz2v/+xz4qtK+DvfDB/jnSVTNgLsmNCNcJZIRhPiRqI
 2xHHsXjoylXjKsuN0DRlIiTAY+h3XXumCyLX7laIJgqnkPi/OFgMrOEhhZ0rxRcncEiQyr
 GvR97g49DS32vWftkHyX5z6ssR4YsPA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-RP3PNetzNlKNyXE2crNv-A-1; Tue, 09 May 2023 05:05:13 -0400
X-MC-Unique: RP3PNetzNlKNyXE2crNv-A-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9532170e7d3so537400866b.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 02:05:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683623111; x=1686215111;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gFN0jm8tj0b98Q7AjbSUpEoKREbax20RBwvfW1MvJdk=;
 b=PEVETnyuidOqTcH0AQRrCVfT2gaqSSNdBkTUM070F652/3cAPGTiLEDbOQRbF3piQa
 piK5Vop9jgBhbnJewb2lvh0pNWhC/g3dXHskf4NcHAP0fm+ca8z1sZ5Z6ZEVhMbSRsl2
 00I7XKgWnBKfyRPbBAYGqAUxVrXs86hRQb5KWwHrQqEP0lytn6l1KtfLOvKfkz0vTzUd
 QT5tft96ujJwZzJHTbESZzzELLcKddU73/hWTWoRN0HGP8j4qMgrYwXOj7MU6Re7Te4u
 6ESyQnE4wtZHKnMn0LIOEPSrvx4xaCLHV2Q2RciRCGusaLNMT7Pq/dKt6Tn1eB5Usrxp
 TCow==
X-Gm-Message-State: AC+VfDzpiLOsgc33AHKQ3DpHSI3mZQCi5kpWqjSxzFgzPR1vxRqoBWIl
 k1VvDW+SOiNFLhynNfiiTv3IcWC6a4a13KcuxvYocf/vy3Q2muXQfha4H8RUiii0P5vVLKYoTAZ
 Kx7FdAEAUVXMjT40TTYOdkVQ74sv0A1ioBygRzMWPvwWnwQ7gj5FZUl2Ehgq9utpXX1kLB4e0m9
 w=
X-Received: by 2002:a17:907:1c05:b0:930:f953:9608 with SMTP id
 nc5-20020a1709071c0500b00930f9539608mr13789308ejc.0.1683623111614; 
 Tue, 09 May 2023 02:05:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4T4uS7JQtd5gFto6m6u0vPSgG5AiBZVtSeM33BdaF4QBcQzDQPU6nCpB1RHnQvcwmZCObAHA==
X-Received: by 2002:a17:907:1c05:b0:930:f953:9608 with SMTP id
 nc5-20020a1709071c0500b00930f9539608mr13789278ejc.0.1683623111149; 
 Tue, 09 May 2023 02:05:11 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 gv11-20020a1709072bcb00b009663cf5dc43sm1052237ejc.181.2023.05.09.02.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 02:05:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Wei Huang <wei.huang2@amd.com>,
 Babu Moger <babu.moger@amd.com>, "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PULL 08/16] target/i386: allow versioned CPUs to specify new
 cache_info
Date: Tue,  9 May 2023 11:04:45 +0200
Message-Id: <20230509090453.37884-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509090453.37884-1-pbonzini@redhat.com>
References: <20230509090453.37884-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Michael Roth <michael.roth@amd.com>

New EPYC CPUs versions require small changes to their cache_info's.
Because current QEMU x86 CPU definition does not support versioned
cach_info, we would have to declare a new CPU type for each such case.
To avoid the dup work, add "cache_info" in X86CPUVersionDefinition",
to allow new cache_info pointers to be specified for a new CPU version.

Co-developed-by: Wei Huang <wei.huang2@amd.com>
Signed-off-by: Wei Huang <wei.huang2@amd.com>
Signed-off-by: Michael Roth <michael.roth@amd.com>
Signed-off-by: Babu Moger <babu.moger@amd.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20230504205313.225073-2-babu.moger@amd.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 823320fe420c..855d5abc7d17 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1620,6 +1620,7 @@ typedef struct X86CPUVersionDefinition {
     const char *alias;
     const char *note;
     PropValue *props;
+    const CPUCaches *const cache_info;
 } X86CPUVersionDefinition;
 
 /* Base definition for a CPU model */
@@ -5225,6 +5226,31 @@ static void x86_cpu_apply_version_props(X86CPU *cpu, X86CPUModel *model)
     assert(vdef->version == version);
 }
 
+static const CPUCaches *x86_cpu_get_versioned_cache_info(X86CPU *cpu,
+                                                         X86CPUModel *model)
+{
+    const X86CPUVersionDefinition *vdef;
+    X86CPUVersion version = x86_cpu_model_resolve_version(model);
+    const CPUCaches *cache_info = model->cpudef->cache_info;
+
+    if (version == CPU_VERSION_LEGACY) {
+        return cache_info;
+    }
+
+    for (vdef = x86_cpu_def_get_versions(model->cpudef); vdef->version; vdef++) {
+        if (vdef->cache_info) {
+            cache_info = vdef->cache_info;
+        }
+
+        if (vdef->version == version) {
+            break;
+        }
+    }
+
+    assert(vdef->version == version);
+    return cache_info;
+}
+
 /*
  * Load data from X86CPUDefinition into a X86CPU object.
  * Only for builtin_x86_defs models initialized with x86_register_cpudef_types.
@@ -5257,7 +5283,7 @@ static void x86_cpu_load_model(X86CPU *cpu, X86CPUModel *model)
     }
 
     /* legacy-cache defaults to 'off' if CPU model provides cache info */
-    cpu->legacy_cache = !def->cache_info;
+    cpu->legacy_cache = !x86_cpu_get_versioned_cache_info(cpu, model);
 
     env->features[FEAT_1_ECX] |= CPUID_EXT_HYPERVISOR;
 
@@ -6736,14 +6762,17 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
 
     /* Cache information initialization */
     if (!cpu->legacy_cache) {
-        if (!xcc->model || !xcc->model->cpudef->cache_info) {
+        const CPUCaches *cache_info =
+            x86_cpu_get_versioned_cache_info(cpu, xcc->model);
+
+        if (!xcc->model || !cache_info) {
             g_autofree char *name = x86_cpu_class_get_model_name(xcc);
             error_setg(errp,
                        "CPU model '%s' doesn't support legacy-cache=off", name);
             return;
         }
         env->cache_info_cpuid2 = env->cache_info_cpuid4 = env->cache_info_amd =
-            *xcc->model->cpudef->cache_info;
+            *cache_info;
     } else {
         /* Build legacy cache information */
         env->cache_info_cpuid2.l1d_cache = &legacy_l1d_cache;
-- 
2.40.1


