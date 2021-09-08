Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 045294037C2
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:22:11 +0200 (CEST)
Received: from localhost ([::1]:43816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuiX-0000St-K1
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRq-0006ba-LW
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:54 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:56212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRn-00031m-IZ
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:54 -0400
Received: by mail-wm1-x32f.google.com with SMTP id g74so1261060wmg.5
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5r01uT4tR8NNg495M2MrgoZZ94BYOI+Ryf0JV3pSQkM=;
 b=c2LM3WhifWeQK8XH4IusxN0HGSfG2y4ZN/419hsiIgRCydrCMUb1FHkthu+ZteWLGa
 pDS4OCi3XUApQCdrxJ/AbtHOZQv7FC3tVflO0JN82lviIBN/XLIa2Aw8gKFzrYjvjaE6
 NM7S5yFdKJLWyqoOnYREZzX0V4X3h6oO9lyTJbEZrpO5Nt0J3XtjxapIfo/YBoSGsGVV
 6WWmomW9lysyTBnnQouUA4iyszdsbH9kRG2r8d8+Cq/zcLGkCUk54ZrA7hId+DtCBtlh
 8jH8xNP/f6/ab7pY6AfTbKUWCJVwo/TWkNmxtvS6KTEd2xYqCmP0szQy6sp12e4X7wf4
 EuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5r01uT4tR8NNg495M2MrgoZZ94BYOI+Ryf0JV3pSQkM=;
 b=OJF+E0Con73tqhUryP837E2SrA9lZRcJPVrn3Safya8+IWl7WHj6FZ8GRfqRSlnmoi
 gVYG525lb3zqVLWrSRcivT9yO3awY/opZ8BpFU+fl6dmYz9RUH7VjMKHEKdP7+zdXHRy
 5yJ983SXUU/S6Ccc+S3tLdXv4LlRCoayqgT/sF3FmzwvGSRCPfb4zARUvwVDdGydb88g
 16kpzLoXpc8pPwsI/Mxiby1PVu4EAnIsaZ0NnoJzycbnjEsJveR5rRCea7twEGEY3OJL
 T5Psr/UPnPEe9yQYTz1QdQljyr0xfmQhXPmrYN0sRVjEcmozv/pwlZxE87FVIPiVsow2
 QdYw==
X-Gm-Message-State: AOAM531Q0/UAmo3lvv1J/NjXn7+T+86Ms2LrCWGYnx0cES88HlRHquPz
 +zgBRkrLDO9jmO2q1O97g2BxBLX7G6Y=
X-Google-Smtp-Source: ABdhPJz97kwvfiKzbRIm19LtcW5rWj6/UJzu8JxukYDo35xNygrEhzvvGwwGabd+X4nOoGdpTlRC8w==
X-Received: by 2002:a05:600c:3209:: with SMTP id
 r9mr2713271wmp.106.1631095490267; 
 Wed, 08 Sep 2021 03:04:50 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:04:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 20/43] i386: Add feature control MSR dependency when SGX is
 enabled
Date: Wed,  8 Sep 2021 12:04:03 +0200
Message-Id: <20210908100426.264356-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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



