Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 752B341AFB4
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:12:46 +0200 (CEST)
Received: from localhost ([::1]:45542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVCub-0008PS-Dv
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCaC-0006UR-3y
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:40 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:46011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCa5-0001Ou-NF
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:36 -0400
Received: by mail-ed1-x52a.google.com with SMTP id r18so6720039edv.12
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KOb4IPvQ1urvg2WoCHadP1b4B/KHW5IQqVRTE+ZK8/Y=;
 b=XJ7upuD06DqDbxRsEHMKxD4xSui8SE9q3I6ZZBE2nnoLQofkkBh0hGxW3A9AlrNjMh
 m0w7Kjy50B9z8m/H2TX1Mi//qJf9PP+S2Igc3r50b1Tth50PZVVvmTmql5k69H9O57s+
 WAQJfxySVFt6PxrrXgvznw5bNozHuEBtTbtMHYc1jwzjVW1ZgXEzIbA19mKqIGFiy/dB
 c+FcW8lhZFJ0wR26qAL9sye+X3PcWB4G/qo13FM9FmpA4rdtGtxlqqzyHPb9jlyMACcL
 0NEOFezXD8cUQfBYmTtDr/f2AeYxo/VXo0yyqWm5iVPqklg2iCcHPqYdvK7+0LnvTqxL
 ujCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KOb4IPvQ1urvg2WoCHadP1b4B/KHW5IQqVRTE+ZK8/Y=;
 b=1JbVbVNv40Mfwaa2wn99TQEDt/7DznrcDnpkL+DfwBYJeYMCvsPkGYWgFPiME4iEbx
 hWUVn2wAANz2oyosJ1CIGQj7qOtIt1k8v/BrBoJMBAAGjfuBa04ceerL6zp0ripchf3P
 bJmaer9dFgEe3YgvDwXpZGonZHVmi6QJVQ9ODOiHiS4tNGtiBxPSqxNc1ZS1rmR7qYey
 xzsUs/H+cvC+ni21fgjhpGvKTai/3eltmG4vYm+qY59zXc4g1ySCJI734DaoE3CLy4QL
 ic+Kkb/84gf962TP0QLQAKhxPWG5vG6/LGFtcOPKYdLW5F5pmMdlp6kXlCMUzi1WrDBM
 D6fw==
X-Gm-Message-State: AOAM531x3UTpc5cASGF6LJEeWmIhJk7Jm8LLV5SpK5KjAis/BH1mwSLA
 9xIu77kM6NQOXrt0A6uqTG42t3SrWXg=
X-Google-Smtp-Source: ABdhPJxemrzIdundNce05+ThIRwRc2jB81DwoGrVzFz0ysiyjPfMNyaIt9DSthoiqZxS00d2pAgaSw==
X-Received: by 2002:a17:906:2c46:: with SMTP id
 f6mr6348364ejh.542.1632833490376; 
 Tue, 28 Sep 2021 05:51:30 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p24sm12641685edq.27.2021.09.28.05.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 05:51:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/33] i386: Propagate SGX CPUID sub-leafs to KVM
Date: Tue, 28 Sep 2021 14:50:58 +0200
Message-Id: <20210928125116.183620-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928125116.183620-1-pbonzini@redhat.com>
References: <20210928125116.183620-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Yang Zhong <yang.zhong@intel.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

The SGX sub-leafs are enumerated at CPUID 0x12.  Indices 0 and 1 are
always present when SGX is supported, and enumerate SGX features and
capabilities.  Indices >=2 are directly correlated with the platform's
EPC sections.  Because the number of EPC sections is dynamic and user
defined, the number of SGX sub-leafs is "NULL" terminated.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-15-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm/kvm.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 488926a95f..f6bbf33bc1 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1703,6 +1703,25 @@ int kvm_arch_init_vcpu(CPUState *cs)
             }
             break;
         case 0x7:
+        case 0x12:
+            for (j = 0; ; j++) {
+                c->function = i;
+                c->flags = KVM_CPUID_FLAG_SIGNIFCANT_INDEX;
+                c->index = j;
+                cpu_x86_cpuid(env, i, j, &c->eax, &c->ebx, &c->ecx, &c->edx);
+
+                if (j > 1 && (c->eax & 0xf) != 1) {
+                    break;
+                }
+
+                if (cpuid_i == KVM_MAX_CPUID_ENTRIES) {
+                    fprintf(stderr, "cpuid_data is full, no space for "
+                                "cpuid(eax:0x12,ecx:0x%x)\n", j);
+                    abort();
+                }
+                c = &cpuid_data.entries[cpuid_i++];
+            }
+            break;
         case 0x14: {
             uint32_t times;
 
-- 
2.31.1



