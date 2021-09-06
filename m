Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEACE401C45
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:28:40 +0200 (CEST)
Received: from localhost ([::1]:34748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEfu-0000lv-IL
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPX-0000zw-I1
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:43 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPV-0007k4-DZ
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:43 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 79-20020a1c0452000000b002e6cf79e572so4986950wme.1
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KOb4IPvQ1urvg2WoCHadP1b4B/KHW5IQqVRTE+ZK8/Y=;
 b=fraIjzRKVvHPHYE/rEgmwpMFkuDANPdFpMWyQy3yDwu8Jgwf8F91PM03KDqP+kOxrT
 VjzgEmN2QH5xKpco56AN+XLoj0yaS3lG/+lGXrxSfUcWyVs3RIwVoGSGWcJwVvYSxcyD
 9v8+mksFiY42VwmbE1soGWO56vPx8+xM8QVK1RbpfsmbXxfY0VqRsw7bISw6/cTSlT3s
 L0qDGQTW3l1W/zAmr0ryuD/F/ejbPRh1WUIdpTxQE3yIgmJzCAVkAmL+E3bHqAGteFrG
 itlIgk4W1vQG5omcxsFATntCi4xMNpQG3BCHDRkiJaBNZr4d5vv5c9n/p/sz02y+/FHP
 o11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KOb4IPvQ1urvg2WoCHadP1b4B/KHW5IQqVRTE+ZK8/Y=;
 b=ADcOpXAxhUzMElxXj40RxvUubWygZ2l63qISvcppyAacV8M5wKJrlkqqBiX/Pi/L0D
 ya83cyKR92A/Iehre6pEDXsqY0JTVPc2jlm5dqKDI8HnB+TWSZLEmrLtmgFz13qacFX1
 h4BoSkngeBDO9XU9g1G550g+fWrFTrA2FsDXBcSuhk/7amxYFpjlKcPf8h+t6iK7INft
 8wtse0aSqNJQkpVmKNDtTH+G/xt4hP9r3e2VGfDaOsMgHQ8phzKXV3gNyp1IQpyBihBL
 8I3muaxoN02pAcCXFgFAvhj6G8uh5AQ+HmLviV5Tl1NHHeKgHWoumN0AuMMl16UOHu9s
 Xu/g==
X-Gm-Message-State: AOAM530kZAG06CMskFvzLtpS21uaqFZlAmgJBHI17r0Iuxd6x6YsFU/8
 nVsNoYwtxcpIuOPPmXQflqSTg5KT8I0=
X-Google-Smtp-Source: ABdhPJwTuOUhx1aiEbAPQycMN/vIPgO2sHqSNIi7/XyYqXBuJR/q95aRdADZaIJych+Em2bHRpb1Uw==
X-Received: by 2002:a1c:1c2:: with SMTP id 185mr11242699wmb.11.1630933900112; 
 Mon, 06 Sep 2021 06:11:40 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k4sm7992331wrm.74.2021.09.06.06.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:11:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/36] i386: Propagate SGX CPUID sub-leafs to KVM
Date: Mon,  6 Sep 2021 15:10:45 +0200
Message-Id: <20210906131059.55234-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906131059.55234-1-pbonzini@redhat.com>
References: <20210906131059.55234-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



