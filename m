Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 006054200A1
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 10:02:10 +0200 (CEST)
Received: from localhost ([::1]:41076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWwRl-0001W9-Uw
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 04:02:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9N-0003lm-Cr
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:09 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:34446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9L-0000vG-Rb
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:09 -0400
Received: by mail-ed1-x52e.google.com with SMTP id g7so50879612edv.1
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 00:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ol7KFbHD80KvHnsxeRqvbBuP7yXULEZLE36r8xBpq44=;
 b=S6rweDqgrR4OjG1F9obJp5KkAXsTf2KyB8fmw57fPbN5UFcoqQp2X0IM3iRm66YZQv
 ulcvl6hNQTN5KHpyqTFc3ezQMsAjMxy+loR9Kc6sKnQKASrWSUSe1/vaWQsa6u4CG1ga
 NTHafT48yr5pC8q6iMUkm/cjvvavufPzODi2X4kQSYhuBSl+9mpy2n+Jufz4ulzHa8Cv
 l0NuAOwiJreLyj3MQ8hNCIaeBJhF0XkZDCIem6MdZeU5gU7XW+bdeoF0HIYvG2pMtqFi
 w7AbqwtvHxQcZdq+mSKSt2PBNUFtY571z1BJnVySEqC33HPIlwHsvU0OOptHwntJEQIl
 PlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ol7KFbHD80KvHnsxeRqvbBuP7yXULEZLE36r8xBpq44=;
 b=V+TU7KxzBMQ/BLVFOzUnixegZCBmrrllHQPv+NuaB4ly50OJhjVJThqL8w9DEK1cMr
 RtiMe2OQKYpzZuetVD38D9HHsPRhnA9BDY8N/bmoCWUJHspqs/HY/tVI4w1QaxQ2F5WI
 IkNSUFXpwEkaUu6rlyEvYZrShG8B1Qbod0yvrEjSIb7fXKdetnentjoyyxslXsTb22kh
 5jspm/040fEWk+d4AMG3skrgIwNdvx+Q12xaQtePHHWXC8BT0u/LTFn7nGwJBo4AbfeN
 7LqQyiuuHbWROpLBjUt1FiWXxC2wov/1uyfC5tnjd8yfjQEyWcIrt79cZRQUllBPd4hY
 zZ4A==
X-Gm-Message-State: AOAM530FEFCpkCCQxwic8d9zgtXdRq5oDQaydM5Wka1MVphXF01eEmWE
 mJl+JZaJEfKxi6KzjN1FqLyF/oNQWPY=
X-Google-Smtp-Source: ABdhPJyStHcgOWrcfMnpf+ajGqoEl147ffSP7n+OGn8FbLJUd8h8idR6TaruVwNT2XYLM9nEirYYww==
X-Received: by 2002:a17:906:3181:: with SMTP id
 1mr9358224ejy.388.1633246986561; 
 Sun, 03 Oct 2021 00:43:06 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n6sm5560856eds.10.2021.10.03.00.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 00:43:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/30] i386: Move HV_APIC_ACCESS_RECOMMENDED bit setting to
 hyperv_fill_cpuids()
Date: Sun,  3 Oct 2021 09:42:39 +0200
Message-Id: <20211003074250.60869-20-pbonzini@redhat.com>
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

In preparation to enabling Hyper-V + APICv/AVIC move
HV_APIC_ACCESS_RECOMMENDED setting out of kvm_hyperv_properties[]: the
'real' feature bit for the vAPIC features is HV_APIC_ACCESS_AVAILABLE,
HV_APIC_ACCESS_RECOMMENDED is a recommendation to use the feature which
we may not always want to give.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-Id: <20210902093530.345756-6-vkuznets@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm/kvm.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index fbe6b7ac72..a9a8f77df3 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -821,9 +821,7 @@ static struct {
         .desc = "virtual APIC (hv-vapic)",
         .flags = {
             {.func = HV_CPUID_FEATURES, .reg = R_EAX,
-             .bits = HV_APIC_ACCESS_AVAILABLE},
-            {.func = HV_CPUID_ENLIGHTMENT_INFO, .reg = R_EAX,
-             .bits = HV_APIC_ACCESS_RECOMMENDED}
+             .bits = HV_APIC_ACCESS_AVAILABLE}
         }
     },
     [HYPERV_FEAT_TIME] = {
@@ -1366,6 +1364,7 @@ static int hyperv_fill_cpuids(CPUState *cs,
         c->ebx |= HV_POST_MESSAGES | HV_SIGNAL_EVENTS;
     }
 
+
     /* Not exposed by KVM but needed to make CPU hotplug in Windows work */
     c->edx |= HV_CPU_DYNAMIC_PARTITIONING_AVAILABLE;
 
@@ -1374,6 +1373,10 @@ static int hyperv_fill_cpuids(CPUState *cs,
     c->eax = hv_build_cpuid_leaf(cs, HV_CPUID_ENLIGHTMENT_INFO, R_EAX);
     c->ebx = cpu->hyperv_spinlock_attempts;
 
+    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_VAPIC)) {
+        c->eax |= HV_APIC_ACCESS_RECOMMENDED;
+    }
+
     if (cpu->hyperv_no_nonarch_cs == ON_OFF_AUTO_ON) {
         c->eax |= HV_NO_NONARCH_CORESHARING;
     } else if (cpu->hyperv_no_nonarch_cs == ON_OFF_AUTO_AUTO) {
-- 
2.31.1



