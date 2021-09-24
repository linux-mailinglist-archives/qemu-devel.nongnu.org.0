Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AFE4170F5
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 13:37:10 +0200 (CEST)
Received: from localhost ([::1]:57794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTjVt-0002cC-Vw
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 07:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKX-0007oE-U7
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:26 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:37724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKW-0000ZN-D9
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:25 -0400
Received: by mail-ed1-x536.google.com with SMTP id bx4so34921891edb.4
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 04:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KOb4IPvQ1urvg2WoCHadP1b4B/KHW5IQqVRTE+ZK8/Y=;
 b=nasP26MaEUDksBCgNV5plDYh6tYbW4VY2y5jki9QCM0ezweanwwliCC5+H7As78c7m
 LL1E8jIRqJVkIfiQDmLqD8+kFi2g9O22MbE5mXahePeKTLJbQNapjqT6AuFT88ufg95o
 ezOCyOXv9BnG5vZTvpZWJFfSWpj1aDYIMxyGFMxy8N/R2Lw2mNI9AclJBdt8ZCp91npQ
 xsUiEbdmqEKr1dz9U/d9WidWransv/tjIABXFRg2P5GZRA74ttGx/tARfoxngqt4ErU1
 gEbEjDCjyyn7LYw0P1MVJhn0L0QMeO5XfYRz4TTkmsHsj5VQK4tjzS4370h34iz7MQqJ
 aejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KOb4IPvQ1urvg2WoCHadP1b4B/KHW5IQqVRTE+ZK8/Y=;
 b=UrtFRQeXIDBxcrUCChO8krfOndyumhG0Z+2+K+xdBEDhlwxt5nhIkmzf86YykqyyVh
 lnbY15XQtv/YR5FdU5ZjDqrLIEjL/ui2EqyXMAL71DPh3ZOylUXQreaOXcML66kf+NWq
 x7XbvzECZqN2X9IufUjVNchOtlXa6lYHxKOq+XiZkecjM6nHzZgOeX/YiMRis03ivcgP
 5R+bZRNGNevKeEStCZxYhpB7ov2GzQNLj2j+KQLuAbrZ5Bjs6rfT4lHlatFYWB+mlF1P
 qJgnBVmZdFdWUnju7EtsOu0v7i+9IY47gaEQ1PRuwxLzmh7F8UlQQT7mwJvZ5YEfRuyE
 lsGw==
X-Gm-Message-State: AOAM533u45no8/JJnKCFZ7Ekt9d5LAWni8bVrH8b8vEtQIjW/nufh07W
 n7eAh3S3N2T07X+kKPv7gMYQGExHIcM=
X-Google-Smtp-Source: ABdhPJw9jL0QUdLhffBbbk39W/8v/Ny5iA7x8aj5AA8mNq8vxOEOWA+mev14lor+t9Zn3R21S2GhOA==
X-Received: by 2002:a17:906:681:: with SMTP id
 u1mr10469049ejb.499.1632482723037; 
 Fri, 24 Sep 2021 04:25:23 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t14sm4886961ejf.24.2021.09.24.04.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 04:25:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 15/26] i386: Propagate SGX CPUID sub-leafs to KVM
Date: Fri, 24 Sep 2021 13:24:58 +0200
Message-Id: <20210924112509.25061-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924112509.25061-1-pbonzini@redhat.com>
References: <20210924112509.25061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: yang.zhong@intel.com, philmd@redhat.com, eblake@redhat.com,
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



