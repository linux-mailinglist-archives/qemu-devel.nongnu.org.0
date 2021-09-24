Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C01464170E8
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 13:34:12 +0200 (CEST)
Received: from localhost ([::1]:49020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTjT1-000526-Qm
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 07:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKV-0007hX-CE
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:23 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:41680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKT-0000WV-VF
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:23 -0400
Received: by mail-ed1-x534.google.com with SMTP id s17so16167316edd.8
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 04:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5r01uT4tR8NNg495M2MrgoZZ94BYOI+Ryf0JV3pSQkM=;
 b=gaEcJHkSE2m1gcSomY7OkhSpkSsSQe75sXhuxYrnrDfhR8xF6J+8HvWXAXvP7ZlaQ5
 cV7Ix72WN8u8O+xvdHOR0YfLH2P2luuynu7o9QfgtEFvd2Y0mblsM0WTJ+F/fs9zEgmE
 7tBDna8qA8W0lmWFtKs3geve777txmvPjkX6UDfqGx+wsrKHLd+9N2nMC+9M1M+om6VQ
 Ir5slS18kOTFuq93VxVOkOJI5TBrSfeJ3Ud9qUDnNde0X1shKqO7pV/QzCYT7Vt0ysFN
 U5l6l+jqKpoMUPgAEhU27RR0SCpMQPvPgReL9Jh4BemQZZ9Sux03u09pG9Sm4RsQ+itu
 zcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5r01uT4tR8NNg495M2MrgoZZ94BYOI+Ryf0JV3pSQkM=;
 b=XTJDBAtOLOygFydxKqjkBJ8vWhgkn0xjB8qy9jCwNw2fecIH7nK+qJw5D3LbWQDuYW
 VP4nUfM87qKulF87ykCVU6Oop8gRimRr0uiRT0s2lXe4NHLebhN0qR9YC9lyubA2afYi
 kvM20EvRXbzioPnesQLWtwIEUboBjsi8EGV/qkO5Vx7HUhap+aRfLn0uHuPKh5LCys6Q
 eaj/zAnzPJOqSJQul4oEEds8NPnfPDV7t8EKHXFr9bUeSvYwR+hE8rGHZTae7YiK/uJl
 v/11Uv674dWPLNF6uDbVWU0PIttE2VTjDFftvVqwn6/cb5fdcJBsuKA3tRYlwQRVpAyU
 b9IQ==
X-Gm-Message-State: AOAM530rbDWsvRAvwDmx03tVbu52eFDQKMclsxvrmKNTuqHWZgqMqAaN
 /Z8CIShHTWlY51hN1EEBuBBWt/aUZWE=
X-Google-Smtp-Source: ABdhPJxpDcZhIBzvIcQt14BRLSLwA8wB1KKGZN58H6CP/hguUm6HJYp2KISrhf0oe5TBiueVGPdKKw==
X-Received: by 2002:a17:906:e094:: with SMTP id
 gh20mr11064401ejb.252.1632482720618; 
 Fri, 24 Sep 2021 04:25:20 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t14sm4886961ejf.24.2021.09.24.04.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 04:25:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 12/26] i386: Add feature control MSR dependency when SGX is
 enabled
Date: Fri, 24 Sep 2021 13:24:55 +0200
Message-Id: <20210924112509.25061-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924112509.25061-1-pbonzini@redhat.com>
References: <20210924112509.25061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
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

SGX adds multiple flags to FEATURE_CONTROL to enable SGX and Flexible
Launch Control.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-12-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/kvm/kvm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 11551648f9..6dc40161e0 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1877,6 +1877,11 @@ int kvm_arch_init_vcpu(CPUState *cs)
                                   !!(c->ecx & CPUID_EXT_SMX);
     }
 
+    c = cpuid_find_entry(&cpuid_data.cpuid, 7, 0);
+    if (c && (c->ebx & CPUID_7_0_EBX_SGX)) {
+        has_msr_feature_control = true;
+    }
+
     if (env->mcg_cap & MCG_LMCE_P) {
         has_msr_mcg_ext_ctl = has_msr_feature_control = true;
     }
-- 
2.31.1



