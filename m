Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C0D42009A
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 09:58:49 +0200 (CEST)
Received: from localhost ([::1]:60778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWwOW-0004Ae-GJ
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 03:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9M-0003gq-76
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:08 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:37828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9K-0000uq-HW
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:07 -0400
Received: by mail-ed1-x52e.google.com with SMTP id ba1so51823714edb.4
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 00:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K/0LAETsbZkY8Peist9OmS0kPYlNSupnjACkLzhKPxQ=;
 b=T7Tju7D+MWFK+Pe6UBbxSc8ZGe1fQSAvxVBmP/deL/jJ/0t8MqF3lJliJB7UMHaJEl
 Md+jvKviqfhrFjwkzWYFIB24xym6fak49tZvt09s+IZzRlRzgnYrtFHFnlCJiX+qdSQW
 JerkdaT5xyauvMQYh8yUJbY7ooK67Zxv+DqHkqC6QkXriqXB9lY6KH69/3dS6Ah+p7Ya
 CsoHQ9U2Bl02lRUR5In+Aur7P2HqwoGKLqmP3WrSj/cjFsSwGqGyaRMPe13JZ1Gzze97
 pHUX3bN1Y6tbrW70ARuqXOS48TTBg1sbdnsBIfvAYMHIcVUeazgHEP6DKB9Frxc715Pl
 lsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=K/0LAETsbZkY8Peist9OmS0kPYlNSupnjACkLzhKPxQ=;
 b=vCZdobsPI+TdVoxdwFXjzt3lt0cIxQSy4oEJnM42VIyiPT/jycsyIUvbseo/Gd8SFz
 iUqtidAS7RaBKYBqsSRvWzTKBUW6bnWE8IQMZDHqhVyTDKLpERpXu3hMQZTaRklEY9I+
 655pRToiUp1EUtYoOBd0ualoqG0X/ixZoR7b4091tHAjzEyOVOp+PkzwvJ4EjfMEI98/
 Mt5Pizxc5jJaLHiGCvtXPd7Ww2FbBtAOm/1yCjcJfqvZdiDoYBqytBAqnSbsFEQVn3RA
 EYMiVVnKm6JYJDtlYPAoFaq+rM9GX8obZUFhvihBgTDM+HWJmxpmvjJEOFVdBETGcVJp
 ZVsA==
X-Gm-Message-State: AOAM532s6XH3wnCE4T4l+EPQ1owIPvJKJ5W0qVLQmAy/wmdh4KqrMAMx
 Cc495x8H4k234bC1sk9fFzxaP5tglCU=
X-Google-Smtp-Source: ABdhPJzt/+PPr5H/DALWTleMg7OL6TblgptP058WnR8KubKiZuYRqsYBS6QPGGZjqf89w6627bA3Fw==
X-Received: by 2002:a17:907:9604:: with SMTP id
 gb4mr9186209ejc.142.1633246985217; 
 Sun, 03 Oct 2021 00:43:05 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n6sm5560856eds.10.2021.10.03.00.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 00:43:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/30] i386: Support KVM_CAP_ENFORCE_PV_FEATURE_CPUID
Date: Sun,  3 Oct 2021 09:42:37 +0200
Message-Id: <20211003074250.60869-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003074250.60869-1-pbonzini@redhat.com>
References: <20211003074250.60869-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
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

By default, KVM allows the guest to use all currently supported PV features
even when they were not announced in guest visible CPUIDs. Introduce a new
"kvm-pv-enforce-cpuid" flag to limit the supported feature set to the
exposed features. The feature is supported by Linux >= 5.10 and is not
enabled by default in QEMU.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-Id: <20210902093530.345756-4-vkuznets@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c     |  2 ++
 target/i386/cpu.h     |  3 +++
 target/i386/kvm/kvm.c | 10 ++++++++++
 3 files changed, 15 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index cacec605bf..598019de12 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6860,6 +6860,8 @@ static Property x86_cpu_properties[] = {
     DEFINE_PROP_BOOL("l3-cache", X86CPU, enable_l3_cache, true),
     DEFINE_PROP_BOOL("kvm-no-smi-migration", X86CPU, kvm_no_smi_migration,
                      false),
+    DEFINE_PROP_BOOL("kvm-pv-enforce-cpuid", X86CPU, kvm_pv_enforce_cpuid,
+                     false),
     DEFINE_PROP_BOOL("vmware-cpuid-freq", X86CPU, vmware_cpuid_freq, true),
     DEFINE_PROP_BOOL("tcg-cpuid", X86CPU, expose_tcg, true),
     DEFINE_PROP_BOOL("x-migrate-smi-count", X86CPU, migrate_smi_count,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 29552dc2a7..c990150373 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1802,6 +1802,9 @@ struct X86CPU {
     /* Stop SMI delivery for migration compatibility with old machines */
     bool kvm_no_smi_migration;
 
+    /* Forcefully disable KVM PV features not exposed in guest CPUIDs */
+    bool kvm_pv_enforce_cpuid;
+
     /* Number of physical address bits supported */
     uint32_t phys_bits;
 
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 7f1b060e6d..d6a70c27e5 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1629,6 +1629,16 @@ int kvm_arch_init_vcpu(CPUState *cs)
 
     cpu_x86_cpuid(env, 0, 0, &limit, &unused, &unused, &unused);
 
+    if (cpu->kvm_pv_enforce_cpuid) {
+        r = kvm_vcpu_enable_cap(cs, KVM_CAP_ENFORCE_PV_FEATURE_CPUID, 0, 1);
+        if (r < 0) {
+            fprintf(stderr,
+                    "failed to enable KVM_CAP_ENFORCE_PV_FEATURE_CPUID: %s",
+                    strerror(-r));
+            abort();
+        }
+    }
+
     for (i = 0; i <= limit; i++) {
         if (cpuid_i == KVM_MAX_CPUID_ENTRIES) {
             fprintf(stderr, "unsupported level value: 0x%x\n", limit);
-- 
2.31.1



