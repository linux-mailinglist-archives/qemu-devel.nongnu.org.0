Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AE34200AF
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 10:10:13 +0200 (CEST)
Received: from localhost ([::1]:57646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWwZY-0004ey-BV
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 04:10:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9P-0003to-Bo
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:11 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:36723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9N-0000x0-9m
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:10 -0400
Received: by mail-ed1-x52b.google.com with SMTP id l7so28173080edq.3
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 00:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rnxp7ibYXa4U48aH5PXvrbUL74+jjocUih8G8Jy9CQw=;
 b=d9CieDTYHjeI6wwd1LMAwQH25t25KGbvdj5CtXzjAlo4EwzTJZoPj6nrv/ucFxMCdx
 L5IanSb3ptYLN8LMhO0Jktv9MgcNze8GqQhvaexYQR8fndLcmDfg5SjpZd7GTZk/UeNm
 DaKp8hcZTdNckOjmqWaDLs+lO49P201SmELp/wbXU6mzcY+UdDRQNFgk40WqcUq81+v0
 oxxYuIcf2Ye2wDps+MaALkE1OGi41sr/rncOGVdRr/TFvLrypR+o3whFeeZXp9yAKWTM
 9QL9/3SMQ+ioOumhTLKYGAtByuic8pSNtVtNYwX1GEs0U6b/f2gYuc5UQ67V3H7ScNni
 pE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Rnxp7ibYXa4U48aH5PXvrbUL74+jjocUih8G8Jy9CQw=;
 b=bcrD4QJXZmVWlBkvmlQgbCHVcNDby93+UJl4jiiQw0FvZWVcyiEYA+kMtO+yrDEMSo
 sfiTz08MDJKDOF5KRZzz1B+TyC6n2suKoxyOiqq8oymjTWqnFFWlBbffBzy6rPbHMEd2
 C27QbNElIqQHvb++gzd0ul0K8h2mUZEKifgJWwYN3bVlnPeRyplfj3wRxqGGDShO1nB5
 50T0JWLWhqYVRFE/xSpQGtpbOUDlS5fqItHEObEwpYm4vjgM7h5hHu9BbW2v5ltAITKr
 Io6YNsdaV/T+xqEX5+rnI/l4582nDnb5X3rVK/lcXHA1ZjLPBW0N7XD9ME4HyoTlsAgS
 YmhQ==
X-Gm-Message-State: AOAM5331djhye41zYt4efpTNG9esVV/y17ZSy5sdr+/164Wuv38x1v0l
 AwkDIVLf9DCwRzHKCerCxHo5rKNpRKg=
X-Google-Smtp-Source: ABdhPJzsmAWohuQLSgfjVXGDB81KaS0JJnV6VLsaPv5bc/hG3zpLcf56tr+v5gawayXdkBkxDTyPTQ==
X-Received: by 2002:a17:906:6c84:: with SMTP id
 s4mr9264252ejr.121.1633246987832; 
 Sun, 03 Oct 2021 00:43:07 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n6sm5560856eds.10.2021.10.03.00.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 00:43:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/30] i386: Make Hyper-V version id configurable
Date: Sun,  3 Oct 2021 09:42:41 +0200
Message-Id: <20211003074250.60869-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003074250.60869-1-pbonzini@redhat.com>
References: <20211003074250.60869-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
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

Currently, we hardcode Hyper-V version id (CPUID 0x40000002) to
WS2008R2 and it is known that certain tools in Windows check this. It
seems useful to provide some flexibility by making it possible to change
this info at will. CPUID information is defined in TLFS as:

EAX: Build Number
EBX Bits 31-16: Major Version
    Bits 15-0: Minor Version
ECX Service Pack
EDX Bits 31-24: Service Branch
    Bits 23-0: Service Number

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-Id: <20210902093530.345756-8-vkuznets@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/hyperv.txt       | 14 ++++++++++++++
 target/i386/cpu.c     | 15 +++++++++++----
 target/i386/cpu.h     |  7 ++++++-
 target/i386/kvm/kvm.c | 26 ++++++++++++++++----------
 4 files changed, 47 insertions(+), 15 deletions(-)

diff --git a/docs/hyperv.txt b/docs/hyperv.txt
index cd1ea3bbe9..7803495468 100644
--- a/docs/hyperv.txt
+++ b/docs/hyperv.txt
@@ -211,6 +211,20 @@ When the option is set to 'on' QEMU will always enable the feature, regardless
 of host setup. To keep guests secure, this can only be used in conjunction with
 exposing correct vCPU topology and vCPU pinning.
 
+3.20. hv-version-id-{build,major,minor,spack,sbranch,snumber}
+=============================================================
+This changes Hyper-V version identification in CPUID 0x40000002.EAX-EDX from the
+default (WS2008R2).
+- hv-version-id-build sets 'Build Number' (32 bits)
+- hv-version-id-major sets 'Major Version' (16 bits)
+- hv-version-id-minor sets 'Minor Version' (16 bits)
+- hv-version-id-spack sets 'Service Pack' (32 bits)
+- hv-version-id-sbranch sets 'Service Branch' (8 bits)
+- hv-version-id-snumber sets 'Service Number' (24 bits)
+
+Note: hv-version-id-* are not enlightenments and thus don't enable Hyper-V
+identification when specified without any other enlightenments.
+
 4. Supplementary features
 =========================
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 8154343cc4..d1d057fabe 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6258,10 +6258,6 @@ static void x86_cpu_hyperv_realize(X86CPU *cpu)
     cpu->hyperv_interface_id[2] = 0;
     cpu->hyperv_interface_id[3] = 0;
 
-    /* Hypervisor system identity */
-    cpu->hyperv_version_id[0] = 0x00001bbc;
-    cpu->hyperv_version_id[1] = 0x00060001;
-
     /* Hypervisor implementation limits */
     cpu->hyperv_limits[0] = 64;
     cpu->hyperv_limits[1] = 0;
@@ -6840,6 +6836,17 @@ static Property x86_cpu_properties[] = {
     DEFINE_PROP_BOOL("hv-passthrough", X86CPU, hyperv_passthrough, false),
     DEFINE_PROP_BOOL("hv-enforce-cpuid", X86CPU, hyperv_enforce_cpuid, false),
 
+    /* WS2008R2 identify by default */
+    DEFINE_PROP_UINT32("hv-version-id-build", X86CPU, hyperv_ver_id_build,
+                       0x1bbc),
+    DEFINE_PROP_UINT16("hv-version-id-major", X86CPU, hyperv_ver_id_major,
+                       0x0006),
+    DEFINE_PROP_UINT16("hv-version-id-minor", X86CPU, hyperv_ver_id_minor,
+                       0x0001),
+    DEFINE_PROP_UINT32("hv-version-id-spack", X86CPU, hyperv_ver_id_sp, 0),
+    DEFINE_PROP_UINT8("hv-version-id-sbranch", X86CPU, hyperv_ver_id_sb, 0),
+    DEFINE_PROP_UINT32("hv-version-id-snumber", X86CPU, hyperv_ver_id_sn, 0),
+
     DEFINE_PROP_BOOL("check", X86CPU, check_cpuid, true),
     DEFINE_PROP_BOOL("enforce", X86CPU, enforce_cpuid, false),
     DEFINE_PROP_BOOL("x-force-features", X86CPU, force_features, false),
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 65f0ee2caf..3edaad7688 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1717,10 +1717,15 @@ struct X86CPU {
     OnOffAuto hyperv_no_nonarch_cs;
     uint32_t hyperv_vendor_id[3];
     uint32_t hyperv_interface_id[4];
-    uint32_t hyperv_version_id[4];
     uint32_t hyperv_limits[3];
     uint32_t hyperv_nested[4];
     bool hyperv_enforce_cpuid;
+    uint32_t hyperv_ver_id_build;
+    uint16_t hyperv_ver_id_major;
+    uint16_t hyperv_ver_id_minor;
+    uint32_t hyperv_ver_id_sp;
+    uint8_t hyperv_ver_id_sb;
+    uint32_t hyperv_ver_id_sn;
 
     bool check_cpuid;
     bool enforce_cpuid;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 68faf72e34..f25837f63f 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1258,14 +1258,18 @@ bool kvm_hyperv_expand_features(X86CPU *cpu, Error **errp)
         cpu->hyperv_interface_id[3] =
             hv_cpuid_get_host(cs, HV_CPUID_INTERFACE, R_EDX);
 
-        cpu->hyperv_version_id[0] =
+        cpu->hyperv_ver_id_build =
             hv_cpuid_get_host(cs, HV_CPUID_VERSION, R_EAX);
-        cpu->hyperv_version_id[1] =
-            hv_cpuid_get_host(cs, HV_CPUID_VERSION, R_EBX);
-        cpu->hyperv_version_id[2] =
+        cpu->hyperv_ver_id_major =
+            hv_cpuid_get_host(cs, HV_CPUID_VERSION, R_EBX) >> 16;
+        cpu->hyperv_ver_id_minor =
+            hv_cpuid_get_host(cs, HV_CPUID_VERSION, R_EBX) & 0xffff;
+        cpu->hyperv_ver_id_sp =
             hv_cpuid_get_host(cs, HV_CPUID_VERSION, R_ECX);
-        cpu->hyperv_version_id[3] =
-            hv_cpuid_get_host(cs, HV_CPUID_VERSION, R_EDX);
+        cpu->hyperv_ver_id_sb =
+            hv_cpuid_get_host(cs, HV_CPUID_VERSION, R_EDX) >> 24;
+        cpu->hyperv_ver_id_sn =
+            hv_cpuid_get_host(cs, HV_CPUID_VERSION, R_EDX) & 0xffffff;
 
         cpu->hv_max_vps = hv_cpuid_get_host(cs, HV_CPUID_IMPLEMENT_LIMITS,
                                             R_EAX);
@@ -1351,10 +1355,12 @@ static int hyperv_fill_cpuids(CPUState *cs,
 
     c = &cpuid_ent[cpuid_i++];
     c->function = HV_CPUID_VERSION;
-    c->eax = cpu->hyperv_version_id[0];
-    c->ebx = cpu->hyperv_version_id[1];
-    c->ecx = cpu->hyperv_version_id[2];
-    c->edx = cpu->hyperv_version_id[3];
+    c->eax = cpu->hyperv_ver_id_build;
+    c->ebx = (uint32_t)cpu->hyperv_ver_id_major << 16 |
+        cpu->hyperv_ver_id_minor;
+    c->ecx = cpu->hyperv_ver_id_sp;
+    c->edx = (uint32_t)cpu->hyperv_ver_id_sb << 24 |
+        (cpu->hyperv_ver_id_sn & 0xffffff);
 
     c = &cpuid_ent[cpuid_i++];
     c->function = HV_CPUID_FEATURES;
-- 
2.31.1



